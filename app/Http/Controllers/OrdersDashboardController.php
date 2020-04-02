<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use AvoRed\Framework\Database\Contracts\PageModelInterface;
use AvoRed\Framework\Database\Contracts\ProductModelInterface;
use AvoRed\Wishlist\Database\Contracts\WishlistModelInterface;

class OrdersDashboardController extends Controller
{   

    /**
     * Product Repository
     * \AvoRed\Framework\Database\Repository\ProductRepository $productRepository.
     */
    protected $productRepository;
    /**
     * Product Repository
     * \AvoRed\Framework\Database\Repository\PageRepository $pageRepository.
     */
    protected $pageRepository;
    /**
     * Product Repository
     * \AvoRed\Wishlist\Database\Repository\WishlistRepository $wishlistRepository.
     */
    protected $wishlistRepository;

    /**
     * Construct for the home controller.
     * @param \AvoRed\Framework\Database\Repository\ProductRepository $productRepository
     * @param \AvoRed\Framework\Database\Repository\PageRepository $pageRepository
     * @param \AvoRed\Wishlist\Database\Repository\WishlistRepository $wishlistRepository
     */
    public function __construct(
        ProductModelInterface $productRepository,
        PageModelInterface $pageRepository,
        WishlistModelInterface $wishlistRepository
    ) {
        $this->productRepository = $productRepository;
        $this->pageRepository = $pageRepository;
        $this->wishlistRepository = $wishlistRepository;
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show()
    {
        $wishlists = $this->wishlistRepository->userWishlists();
        $page = $this->pageRepository->findBySlug('home-page');
        $allProducts = $this->productRepository->getAllWithoutVaiation();
        if ($allProducts->count() <= 0) {
            $products = collect();
        } elseif ($allProducts->count() >= 8) {
            $products = $allProducts->random(8)->shuffle();
        } else {
            $products = $allProducts;
        }

        return view('dashboard.show')
                ->with(compact('products', 'page', 'wishlists'));
    }

    public function showOrders()
    {
        return view("dashboard.showorders");
    }

    public function updateUnits(Request $request)
    {
        $units = $request->get("units");
        $id = $request->get("proid");

        // set the values
        \DB::table("stocks")->where("id", $id)->update(['remaining' => $units]);

        return redirect()
            ->route('dashboard.show');
    }

    public function updateDeliveryMethods(Request $request)
    {
        $data = $request->get("data");

        foreach($data as $order)
        {
            if (\DB::table("delivery_method")->where("orderid", $order["id"])->exists())
            {
                \DB::table("delivery_method")->where("orderid", $order["id"])->update(['method' => $order["method"]]);
            } else {
                \DB::table("delivery_method")->insert([
                    ['orderid' => $order["id"], "method" => $order["method"]]
                ]);
            }
            
        }

        return \Response::json($data);
    }
}

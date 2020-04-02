<!doctype html>
<html lang="en">

<head>
  <meta charset="utf-8" />
  <link rel="apple-touch-icon" sizes="76x76" href="./assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="./assets/img/favicon.png">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <title>
    Dashboard | Inventory and Order Management
  </title>
  <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
  <!--     Fonts and icons     -->
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
  <!-- CSS Files -->
  <link href="/assets/css/bootstrap.min.css" rel="stylesheet" />
  <link href="/assets/css/paper-dashboard.css?v=2.0.1" rel="stylesheet" />

    <link rel="stylesheet" href="/css/dashboard.css">

</head>

<body class="">

  <div class="wrapper ">
    <div class="sidebar" data-color="white" data-active-color="danger">
      <div class="logo">
        <a href="https://www.creative-tim.com" class="simple-text logo-normal">
          <div class="logo-image-big" style="text-align:center">
            <img src="/assets/img/logo/logo.png" height="45">
          </div>
        </a>
      </div>
      <div class="sidebar-wrapper">
        <ul class="nav">
          <li class="active ">
            <a href="/admin/dashboard">
              <i class="nc-icon nc-box"></i>
              <span>INVENTORY</span>
            </a>
          </li>
          <li>
            <a href="/admin/dashboard/orders">
              <i class="nc-icon nc-delivery-fast"></i>
              <span>ORDERS</span>
            </a>
          </li>
        </ul>
      </div>
    </div>
    <div class="main-panel" style="height: 100vh;">
      <!-- Navbar -->
      <nav class="navbar navbar-expand-lg navbar-absolute fixed-top navbar-transparent">
        <div class="container">
          <div class="navbar-wrapper">
            <div class="navbar-toggle">
              <button type="button" class="navbar-toggler">
                <span class="navbar-toggler-bar bar1"></span>
                <span class="navbar-toggler-bar bar2"></span>
                <span class="navbar-toggler-bar bar3"></span>
              </button>
            </div>
            <a class="navbar-brand" href="javascript:;">INVENTORY</a>
          </div>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navigation" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-bar navbar-kebab"></span>
            <span class="navbar-toggler-bar navbar-kebab"></span>
            <span class="navbar-toggler-bar navbar-kebab"></span>
          </button>
          <div class="collapse navbar-collapse justify-content-end" id="navigation">
            <form>
              <div class="input-group no-border">
                <input type="text" value="" class="form-control" placeholder="Search...">
                <div class="input-group-append">
                  <div class="input-group-text">
                    <i class="nc-icon nc-zoom-split"></i>
                  </div>
                </div>
              </div>
            </form>
            <ul class="navbar-nav">
              <li class="nav-item btn-rotate dropdown">
                <a class="nav-link dropdown-toggle" href="/" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  <i class="nc-icon nc-minimal-right"></i>
                  <p>
                    <span class="d-lg-none d-md-block">Some Actions</span>
                  </p>
                </a>
                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
                  <a class="dropdown-item" href="/">Go to Website</a>
                </div>
              </li>
            </ul>
          </div>
        </div>
      </nav>
      <!-- End Navbar -->
      <div class="content container">
        <div class="row">
          <div class="col-md-12">
            
            <span class="section-title">STOCK ALERTS</span>

            <label class="toggle pull-right" style="margin-top:20px;">
                <input class="toggle-checkbox" type="checkbox">
                <div class="toggle-switch"></div>
                <span class="toggle-label">Enable Push Notifications for Stock Alerts</span>
            </label>

            <div class="row" style="margin-bottom: 45px">
                <div class="col col-md-6 col-s-12">
                    <?php 
                        $allStockStatus = true;
                        foreach ($products as $product)
                        {
                            if (DB::table("stocks")->where("id", $product["id"])->value("remaining") < 4)
                            {
                                $allStockStatus = false;
                                break;
                            }
                        }

                        if ($allStockStatus)
                        {
                    ?>
                            <div class="status-card">
                                <i class="icon nc-icon nc-check-2"></i>
                                <div class="text">
                                    <span class="title">All good!</span>
                                    <span class="desc">No stocks require your attention</span>
                                </div>
                            </div>
                    <?php
                        } else {
                            ?>
                            <div class="status-card bad">
                                <i class="icon fa fa-times"></i>
                                <div class="text">
                                    <span class="title">We are running low!</span>
                                    <span class="desc">Some of our stocks are running low</span>
                                </div>
                            </div>
                            <?php
                        }
                    ?>
                </div>
                <div class="col col-md-6 col-s-12">
                    <div class="overview-card status-card">
                        <div class="text">
                            <span class="title"><?php
                            
                                $orders = DB::table("orders")->get();
                                $total_revenue_counter = 0;
                                foreach($orders as $order)
                                {
                                    $order_products = DB::table("order_products")->where("order_id", $order->id)->get();
                                    
                                    foreach ($order_products as $order_product)
                                    {
                                        $total_revenue_counter += $order_product->price;
                                    }
                                }

                                echo "LKR. " . $total_revenue_counter;

                            ?></span>
                            <span class="desc">Total Revenue</span>
                        </div>
                        <div class="text">
                            <span class="title">{{ sizeof(DB::select('SELECT * FROM orders WHERE order_status_id = 1')) }}</span>
                            <span class="desc">Pending Orders</span>
                        </div>
                        <div class="text">
                            <span class="title">{{ sizeof(DB::select('SELECT * FROM orders')) }}</span>
                            <span class="desc">Total Sales</span>
                        </div>
                        <div class="text">
                            <span class="title">{{ sizeof(DB::select('SELECT DISTINCT shipping_option FROM orders')) }}</span>
                            <span class="desc">Customers</span>
                        </div>
                    </div>
                </div>
            </div>

            <?php foreach ($products as $product)
            {
                $remaining = DB::table("stocks")->where("id", $product["id"])->value("remaining");
                if ($remaining < 4)
                {
                    ?>
                        <div class="status-card bad low-pad" style="margin-bottom:10px">
                            <img src="{{ $product['main_image_url'] }}" height="100px" alt="">
                            <div class="text" style="flex-grow:1">
                                <b>({{ $product["slug"] }}) {{ $product["name"] }}</b>
                                <span>Only {{$remaining}} units remaining</span>
                                <a href="#">Contact dealer</a>
                            </div>

                            <div class="text" style="margin-right:50px !important;text-align:center">
                                <span class="title">LKR. {{ str_replace(".0000", ".", $product["price"]) }}</span>
                                <span class="desc">Selling Price</span>
                            </div>

                        </div>
                    <?php
                }
            }
            ?>

            <span class="section-title" style="margin-top:40px">STOCK STATUS</span>

            <div class="stock-list">
                <table class="table table-striped table-bordered table-hover">
                    <thead class="thead-dark">
                        <tr>
                        <th scope="col">ID</th>
                        <th scope="col">Product Name</th>
                        <th scope="col">Slug</th>
                        <th scope="col">Actions</th>
                        <th scope="col">Price</th>
                        <th scope="col">Units</th>
                        <th scope="col">Orders</th>
                        </tr>
                    </thead>
                    <tbody>

                        <?php foreach ($products as $product) { 
                            $remaining =  DB::table("stocks")->where("id", $product["id"])->value('remaining');
                            ?>
                            <tr>
                                <th scope="row">{{ $product["id"] }}</th>
                                <td><a href="/product/{{ $product['slug'] }}">{{ $product["name"]}}</a></td>
                                <td>{{ $product["slug"]}}</td>
                                <td style="text-align:center">
                                    <a href="/admin/product/{{ $product['id'] }}/edit">
                                        <i class="fa fa-edit"></i> Edit
                                    </a>
                                    <a data-id="{{ $product['id'] }}" data-current="{{ $remaining }}" class="add-units-button" data-toggle="modal" data-target="#addUnitsModal" href="/admin/product/{{ $product['id'] }}/edit" style="margin-left:10px">
                                        <i class="fa fa-plus"></i> Update Units
                                    </a>
                                </td>
                                <td>LKR. {{ str_replace(".0000", ".", $product["price"]) }}</td>
                                <td>{{ $remaining }}</td>
                                <td>
                                    <?php 
                                        $order_products = DB::table("order_products")->where("product_id", $product["id"])->get();
                                        $counter = 0;

                                        foreach ($order_products as $order) {
                                            if (DB::table("orders")->where("id", $order->order_id)->where("order_status_id", 1)->exists())
                                            {
                                                $counter ++;
                                            }
                                        }

                                        echo $counter;
                                    ?>
                                </td>
                            </tr>
                        <?php }?>

                    </tbody>
                    </table>
                </table>

                <a href="#" type="button" class="pull-right btn btn-primary">
                    <i class="fa fa-refresh" style="margin-right:10px;"></i>
                    LOAD ALL STOCKS
                </a>
                <a href="/admin/product/create" type="button" class="pull-right btn btn-primary" style="margin-right:10px;">
                    <i class="fa fa-plus" style="margin-right:10px;"></i>
                    ADD NEW PRODUCT
                </a>
            </div>

            <div class="modal fade" id="addUnitsModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle">Change Product Units to Inventory</h5>

                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>

                    <form action="/api/units" method="POST" enctype="multipart/form-data">
                    
                        <input type="hidden" name="_token" id="csrf-token" value="{{ Session::token() }}" />  

                        <div class="modal-body">
                            
                            <label>Current of Units</label>
                            <input type="number" class="form-control" name="units" id="newUnitsCount" value="24">
                            <input type="hidden" name="proid" id="product-id" value="10">
                            
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-primary">Save changes</button>
                        </div>
                    </form>

                    </div>
                </div>
            </div>


          </div>
        </div>
      </div>
      <footer class="footer" style="position: absolute; bottom: 0; width: -webkit-fill-available;">
        <div class="container-fluid">
          <div class="row">
            <nav class="footer-nav">
              <ul>
                <li><a href="https://www.creative-tim.com/blog" target="_blank">Blog</a></li>
                <li><a href="https://www.creative-tim.com/license" target="_blank">Licenses</a></li>
              </ul>
            </nav>
          </div>
        </div>
      </footer>
    </div>
  </div>
  <!--   Core JS Files   -->
  <script src="/assets/js/core/jquery.min.js"></script>
  <script src="/assets/js/core/popper.min.js"></script>
  <script src="/assets/js/core/bootstrap.min.js"></script>
  <script src="/assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
  <!--  Google Maps Plugin    -->
  <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
  <!-- Chart JS -->
  <script src="/assets/js/plugins/chartjs.min.js"></script>
  <!--  Notifications Plugin    -->
  <script src="/assets/js/plugins/bootstrap-notify.js"></script>
  <!-- Control Center for Now Ui Dashboard: parallax effects, scripts for the example pages etc -->
  <script src="/assets/js/paper-dashboard.min.js?v=2.0.1" type="text/javascript"></script>

    <script type="text/javascript">

        $(".add-units-button").click((e) => 
        {
            $("#newUnitsCount").val($(e.target).data('current'))
            $("#product-id").val($(e.target).data("id"));
        })

    </script>
</body>

</html>

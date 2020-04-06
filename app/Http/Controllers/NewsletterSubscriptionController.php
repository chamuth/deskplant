<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class NewsletterSubscriptionController extends Controller
{
    /**
     * Add the email to the newsletter subscription list
     *
     * @return \Illuminate\Http\Response
     */
    public function subscribe(Request $request)
    {
        \DB::table("subscriptions")->insert([
            "email" => $request->get("email")
        ]);

        return redirect()
            ->name("home");
    }

}

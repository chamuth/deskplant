<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class RequestQuoteController extends Controller
{
    /**
     * Submits a request for quote
     *
     * @return \Illuminate\Http\Response
     */
    public function submit(Request $req)
    {
        $name = $req->get("name");
        $company = $req->get("company");
        $email = $req->get("email");
        $description = $req->get("description");

        \DB::table("quote_requests")->insert([
            "name" => $name, "company" => $company, "email" => $email, "description" => $description
        ]);

        return redirect()
            ->route('home')
            ->withErrors(["quote_request_message", "Your quote request has been submitted"]);
    }

}

<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class SubmitTestimonialController extends Controller
{
    /**
     * Submit testimonial to the server
     *
     * @return \Illuminate\Http\Response
     */
    public function submit(Request $request)
    {
        $name = $request->get("name");
        $email = $request->get("email");
        $company = $request->get("company");
        $position = $request->get("position");
        $testimonial = $request->get("testimonial");

        \DB::table("testimonials")->insert([
            "name" => $name, "email" => $email, "company" => $company, "position" => $position, "testimonial" => $testimonial
        ]);

        return redirect()
            ->route("home")
            ->withErrors(['testimonial_error', 'Your testimonial has been submitted']);
    }
}

@extends('layouts.app')

@section('content')

<div class="product_image_area">
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-lg-5">
          <div class="product_img_slide owl-carousel">
            <div class="single_product_img">
              <img src="{{$product['main_image_url']}}" alt="#" class="img-fluid">
            </div>
          </div>
        </div>
        <div class="col-lg-7">
          <div class="single_product_text text-center" style="padding-left:50px;padding-right:50px;">
            <h3>{{ $product["name"] }}</h3>
            <p>
                Seamlessly empower fully researched growth strategies and interoperable internal or “organic” sources. Credibly innovate granular internal or “organic” sources whereas high standards in web-readiness. Credibly innovate granular internal or organic sources whereas high standards in web-readiness. Energistically scale future-proof core competencies vis-a-vis impactful experiences. Dramatically synthesize integrated schemas. with optimal networks.
            </p>
            <div class="card_area">
                <div class="product_count_area">
                    <p>Quantity</p>
                    <div class="product_count d-inline-block">
                        <span class="product_count_item inumber-decrement"> <i class="ti-minus"></i></span>
                        <input class="product_count_item input-number" type="text" value="1" min="0" max="10">
                        <span class="product_count_item number-increment"> <i class="ti-plus"></i></span>
                    </div>
                    <p>රු. {{str_replace(".0000", ".", $product["price"]) }}</p>
                </div>
              <div class="add_to_cart">
                <form action="/add-to-cart" method="POST" enctype="multipart/form-data">
                    <input type="hidden" name="_token" id="csrf-token" value="{{ Session::token() }}" />  

                    <input type="hidden" name="slug" value="{{ $product["slug"] }}">
                    <input type="hidden" name="qty" value="1">

                    <button type="submit" class="btn_3">add to cart</button>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

@endsection

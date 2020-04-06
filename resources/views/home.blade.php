@extends('layouts.app')

@section('content')

<main>
  <!-- slider Area Start -->
  <div class="slider-area ">
      <!-- Mobile Menu -->
      <div class="slider-active">
          <div class="single-slider" style="overflow:hidden" data-background="assets/img/hero/h1_hero.jpg">
              <div class="container">
                  <div class="row d-flex align-items-center justify-content-between">
                      <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 d-none d-md-block">
                          <div class="hero__img" data-animation="bounceIn" data-delay=".4s">
                              <img width="400px" src="assets/img/hero/gir1l5-1png.png" alt="">
                          </div>
                      </div>
                      <div class="col-xl-6 col-lg-6 col-md-6 col-sm-8">
                          <div class="hero__caption">
                              <h1 data-animation="fadeInRight" data-delay=".6s">A Gift they actually want</h1>
                              <p data-animation="fadeInRight" data-delay=".8s">we have a little something to make every plant lover in your life smile</p>
                              <!-- Hero-btn -->
                              <div class="hero__btn" data-animation="fadeInRight" data-delay="1s">
                                  <a href="industries.html" class="btn hero-btn">Shop Now</a>
                              </div>
                          </div>
                      </div>
                  </div>
              </div>
          </div>
          <div class="single-slider slider-height" data-background="assets/img/hero/h1_hero.jpg">
              <div class="container">
                  <div class="row d-flex align-items-center justify-content-between">
                      <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 d-none d-md-block">
                          <div class="hero__img" data-animation="bounceIn" data-delay=".4s">
                              <img src="assets/img/hero/hero_man.png" alt="">
                          </div>
                      </div>
                      <div class="col-xl-5 col-lg-5 col-md-5 col-sm-8">
                          <div class="hero__caption">
                              <span data-animation="fadeInRight" data-delay=".4s">60% Discount</span>
                              <h1 data-animation="fadeInRight" data-delay=".6s">Winter <br> Collection</h1>
                              <p data-animation="fadeInRight" data-delay=".8s">Best Cloth Collection By 2020!</p>
                              <!-- Hero-btn -->
                              <div class="hero__btn" data-animation="fadeInRight" data-delay="1s">
                                  <a href="industries.html" class="btn hero-btn">Shop Now</a>
                              </div>
                          </div>
                      </div>
                  </div>
              </div>
          </div>
      </div>
  </div>
  <!-- slider Area End-->
  <!-- Shop Method Start-->
  <div class="shop-method-area" style="margin-top:100px">
      <div class="container">
          <div class="row d-flex justify-content-between">
              <div class="col-xl-3 col-lg-3 col-md-6">
                  <div class="single-method mb-40">
                      <i class="ti-package"></i>
                      <h6>ISLAND-WIDE DELIVERY</h6>
                      <p>Island-wide free delivery, Cash on delivery</p>
                  </div>
              </div>
              <div class="col-xl-3 col-lg-3 col-md-6">
                  <div class="single-method mb-40">
                      <i class="ti-email"></i>
                      <h6>HOTLINE: (+94) 777 21 53 77</h6>
                      <p>Professional Support we are always here to help you</p>
                  </div>
              </div> 
              <div class="col-xl-3 col-lg-3 col-md-6">
                  <div class="single-method mb-40">
                      <i class="ti-reload"></i>
                      <h6>ORDER CUSTOMIZING</h6>
                      <p>Customize your desk-plant to your design & requirement</p>
                  </div>
              </div>
          </div>
      </div>
  </div>
  <!-- Shop Method End-->
  <!-- Latest Products Start -->
  <a id="latest"></a>
  <section class="latest-product-area padding-bottom" style="margin-top:100px">
      <div class="container" >
          <div class="row product-btn d-flex justify-content-end align-items-end">
              <!-- Section Tittle -->
              <div class="col-xl-4 col-lg-5 col-md-5">
                  <div class="section-tittle mb-30">
                      <h2>Latest Products</h2>
                  </div>
              </div>
              <div class="col-xl-8 col-lg-7 col-md-7">
                  <div class="properties__button f-right">
                      <!--Nav Button  -->
                      <nav>                                                                                                
                          <div class="nav nav-tabs" id="nav-tab" role="tablist">
                              <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">All</a>
                              <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false">New</a>
                              <a class="nav-item nav-link" id="nav-contact-tab" data-toggle="tab" href="#nav-contact" role="tab" aria-controls="nav-contact" aria-selected="false">Featured</a>
                              <a class="nav-item nav-link" id="nav-last-tab" data-toggle="tab" href="#nav-last" role="tab" aria-controls="nav-contact" aria-selected="false">Offer</a>
                          </div>
                      </nav>
                      <!--End Nav Button  -->
                  </div>
              </div>
          </div>
          <!-- Nav Card -->
          <div class="tab-content" id="nav-tabContent">
              <!-- card one -->
              <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
                  <div class="row">
                    @foreach ($products as $product)
                      <div class="col-xl-3 col-lg-4 col-md-6">
                          <div class="single-product mb-60">
                            <a href="{{ route('product.show', $product->slug) }}">
                              <div class="product-img">
                                  <img src="{{$product['main_image_url']}}" alt="">
                                  <div class="new-product">
                                      <span>New</span>
                                  </div>
                              </div>
                            </a>
                              <div class="product-caption">
                                  <h4><a href="#">{{ $product["name"] }}</a></h4>
                                  <div class="price">
                                      <ul>
                                          <li>රු {{ str_replace(".0000", ".", $product["price"]) }}</li>
                                          <li class="discount">රු {{ str_replace(".0000", ".", $product["cost_price"]) }}</li>
                                      </ul>
                                  </div>
                              </div>
                          </div>
                      </div>
                    @endforeach
                    @foreach ($products as $product)
                      <div class="col-xl-3 col-lg-4 col-md-6">
                          <div class="single-product mb-60">
                            <a href="{{ route('product.show', $product->slug) }}">
                              <div class="product-img">
                                  <img src="{{$product['main_image_url']}}" alt="">
                                  <div class="new-product">
                                      <span>New</span>
                                  </div>
                              </div>
                            </a>
                              <div class="product-caption">
                                  <h4><a href="#">{{ $product["name"] }}</a></h4>
                                  <div class="price">
                                      <ul>
                                          <li>රු {{ str_replace(".0000", ".", $product["price"]) }}</li>
                                          <li class="discount">රු {{ str_replace(".0000", ".", $product["cost_price"]) }}</li>
                                      </ul>
                                  </div>
                              </div>
                          </div>
                      </div>
                    @endforeach
                    @foreach ($products as $product)
                      <div class="col-xl-3 col-lg-4 col-md-6">
                          <div class="single-product mb-60">
                            <a href="{{ route('product.show', $product->slug) }}">
                              <div class="product-img">
                                  <img src="{{$product['main_image_url']}}" alt="">
                                  <div class="new-product">
                                      <span>New</span>
                                  </div>
                              </div>
                            </a>
                              <div class="product-caption">
                                  <h4><a href="#">{{ $product["name"] }}</a></h4>
                                  <div class="price">
                                      <ul>
                                          <li>රු {{ str_replace(".0000", ".", $product["price"]) }}</li>
                                          <li class="discount">රු {{ str_replace(".0000", ".", $product["cost_price"]) }}</li>
                                      </ul>
                                  </div>
                              </div>
                          </div>
                      </div>
                    @endforeach
                    @foreach ($products as $product)
                      <div class="col-xl-3 col-lg-4 col-md-6">
                          <div class="single-product mb-60">
                            <a href="{{ route('product.show', $product->slug) }}">
                              <div class="product-img">
                                  <img src="{{$product['main_image_url']}}" alt="">
                                  <div class="new-product">
                                      <span>New</span>
                                  </div>
                              </div>
                            </a>
                              <div class="product-caption">
                                  <h4><a href="#">{{ $product["name"] }}</a></h4>
                                  <div class="price">
                                      <ul>
                                          <li>රු {{ str_replace(".0000", ".", $product["price"]) }}</li>
                                          <li class="discount">රු {{ str_replace(".0000", ".", $product["cost_price"]) }}</li>
                                      </ul>
                                  </div>
                              </div>
                          </div>
                      </div>
                    @endforeach
                  </div>
              </div>
          </div>
          <!-- End Nav Card -->
      </div>
  </section>
  <!-- Latest Products End -->
  <!-- Latest Offers Start -->
  <div class="latest-wrapper lf-padding">
      <div class="latest-area latest-height d-flex align-items-center" style="background-color:#efe">
          <div class="container">
              <div class="row d-flex align-items-center">
                  <div class="col-xl-5 col-lg-5 col-md-6 offset-xl-1 offset-lg-1">
                      <div class="latest-caption">
                          <h2>Get Our<br>Latest Offers News</h2>
                          <p>Subscribe news latter</p>
                      </div>
                  </div>
                    <div class="col-xl-5 col-lg-5 col-md-6 ">
                      <div class="latest-subscribe">
                          <form action="#">
                              <input type="email" placeholder="Your email here">
                              <button>Subscribe</button>
                          </form>
                      </div>
                  </div>
              </div>
          </div>
      </div>
  </div>
  <!-- Latest Offers End -->

</main>

@endsection

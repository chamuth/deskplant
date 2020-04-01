@extends('layouts.app')

@section('content')
    <?php if (sizeof($cartProducts) != 0) {?>
        <?php $products = (Cart::toArray()) ?>
    <section class="cart_area section_padding">
    <div class="container">
      <div class="cart_inner">
        <div class="table-responsive">
          <table class="table">
            <thead>
              <tr>
                <th scope="col">Product</th>
                <th scope="col">Price (LKR)</th>
                <th scope="col">Quantity</th>
                <th scope="col">Total (LKR)</th>
              </tr>
            </thead>
            <tbody>
                <?php
                  $total = 0;
                foreach ($products as $product) {
                      $total += intval(str_replace(",", "", $product["price"]));
                    ?>

                            <tr>
                            <td>
                            <div class="media">
                                <div class="d-flex">
                                <img src="{{ $product['image'] }}" alt="" />
                                </div>
                                <div class="media-body">
                                <p>{{$product["name"]}}</p>
                                </div>
                            </div>
                            </td>
                            <td>

                            <h5>{{ $product["price"]}}</h5>
                            </td>
                            <td>
                            <div class="product_count">
                                <!-- <input type="text" value="1" min="0" max="10" title="Quantity:"
                                class="input-text qty input-number" />
                                <button
                                class="increase input-number-increment items-count" type="button">
                                <i class="ti-angle-up"></i>
                                </button>
                                <button
                                class="reduced input-number-decrement items-count" type="button">
                                <i class="ti-angle-down"></i>
                                </button> -->
                                <span class="input-number-decrement"> <i class="ti-minus"></i></span>
                                <input class="input-number" type="text" value="{{ $product['qty'] }}" min="0" max="10">
                                <span class="input-number-increment"> <i class="ti-plus"></i></span>
                            </div>
                            </td>
                            <td>
                            <h5>{{ strval(intval($product["qty"]) * intval(str_replace(",", "", $product["price"]))) . ".00" }}</h5>
                            </td>
                        </tr>
                    <?php
                } ?>
              


              <tr class="bottom_button">
                <td>
                  <a class="btn_1" href="#">Update Cart</a>
                </td>
                <td></td>
                <td></td>
                <td>
                  <div class="cupon_text float-right">
                    <a class="btn_1" href="#">Close Coupon</a>
                  </div>
                </td>
              </tr>
              <tr>
                <td></td>
                <td></td>
                <td>
                  <h5>Subtotal</h5>
                </td>
                <td>
                  <h5>{{$total}}.00</h5>
                </td>
              </tr>
            </tbody>
          </table>
          <div class="checkout_btn_inner float-right">
            <a class="btn_1" href="/">Continue Shopping</a>
            <a class="btn_1 checkout_btn_1" href="/checkout">Proceed to checkout</a>
          </div>
        </div>
      </div>
  </section>
    <?php } else { ?>
        <div class="container text-center" style="margin-top:250px; margin-bottom:250px">
            <i style="font-size:50px;margin-bottom:10px;" class="fa fa-frown"></i>
            <br>
            <h1>No products in your cart yet</h1>
            <br><br>
            <a href="/" class="button">Start Shopping</a>
        </div>
    <?php } ?>
@endsection

@extends('layouts.app')

@section('content')
  <!-- slider Area Start-->
  <div class="slider-area ">
    <!-- Mobile Menu -->
    <div class="single-slider slider-height2 d-flex align-items-center" data-background="assets/img/hero/category.jpg">
        <div class="container">
            <div class="row">
                <div class="col-xl-12">
                    <div class="hero-cap text-center">
                        <h2>Checkout</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
  </div>
  <!-- slider Area End-->

  <!--================Checkout Area =================-->
  <section class="checkout_area section_padding">
    <div class="container">
      
      <div class="billing_details">
        <div class="row">
          <div class="col-lg-8">
            <h3>Billing Details</h3>
            <form class="row contact_form" action="#" method="post" novalidate="novalidate">
              <div class="col-md-6 form-group p_star">
                <input type="text" class="form-control" placeholder="First name" id="first" name="name" />
              </div>
              <div class="col-md-6 form-group p_star">
                <input type="text" class="form-control" placeholder="Last name" id="last" name="name" />
              </div>
              <div class="col-md-12 form-group">
                <input type="text" class="form-control" id="company" name="company" placeholder="Company name" />
              </div>
              <div class="col-md-6 form-group p_star">
                <input type="text" class="form-control" id="number" placeholder="Phone number" name="number" />
              </div>
              <div class="col-md-6 form-group p_star">
                <input type="text" class="form-control" id="email" placeholder="Email Address" name="compemailany" />
              </div>
              <div class="col-md-12 form-group p_star">
                <input type="text" class="form-control" id="add1" name="add1" placeholder="Address Line 1" />
              </div>
              <div class="col-md-12 form-group p_star">
                <input type="text" class="form-control" id="add2" name="add2" placeholder="Address Line 2"/>
              </div>
              <div class="col-md-12 form-group p_star">
                <input type="text" class="form-control" id="city" name="city" placeholder="City/Town" />
              </div>
              <div class="col-md-12 form-group p_star">
                <select class="country_select" id="province_select">
                  <option value="1">Northern Province</option>
                  <option value="2">North Western	Province</option>
                  <option value="3">Western Province</option>
                  <option value="4">North Central	 Province</option>
                  <option value="5">Central Province</option>
                  <option value="6">Sabaragamuwa Province</option>
                  <option value="7">Eastern Province</option>
                  <option value="8">Uva Province</option>
                  <option value="9">Southern Province</option>
                </select>
              </div>
              <div class="col-md-12 form-group">
                <input type="text" class="form-control" id="zip" name="zip" placeholder="Postcode/ZIP" />
              </div>
            </form>
          </div>
          <div class="col-lg-4">
            <div class="order_box">
              <h2>Your Order</h2>
              <?php $total = 0; ?>
              <ul class="list">
                <li>
                  <a href="#">Product
                    <span>Total</span>
                  </a>
                </li>
                <?php foreach (Cart::toArray() as $product) { ?>
                  <?php $total = $total + intval(str_replace(",", "", $product["price"])) ?>
                <li>
                  <a href="#"> {{ substr($product["name"], 0, 30) . "..." }}
                    <span class="middle">x {{ $product["qty"] }}</span>
                    <span class="last">LKR. {{ $product["price"] }}</span>
                  </a>
                </li>
                <?php } ?>
              </ul>
              <ul class="list list_2">
                <li>
                  <a href="#">Subtotal
                    <span>LKR. {{ $total }}.00</span>
                  </a>
                </li>
                <li>
                  <a href="#">Shipping
                    <span>Flat rate: LKR. 1500.00</span>
                  </a>
                </li>
                <li>
                  <a href="#">Total
                    <span>LKR. {{ $total + 1500 }}.00</span>
                  </a>
                </li>
              </ul>
              
              <h3 style="padding:0; margin:0; margin-bottom:20px;margin-top:30px;">Delivery Options</h3>
              
              <div class="delivery-options">
                <div class="delivery-option-panel">
                  <i class="fa fa-truck"></i>
                  <div class="des">
                    <span style="font-weight:bold">Estimated Delivery</span>
                    <span class="delivery-date">by <script>var d = new Date();d.setDate(d.getDate() + 4);document.write(d.toLocaleDateString('en-US'))</script> (4 days)</span>
                  </div>
                </div>
              </div>

              
              <div class="creat_account" style="margin-top:30px">
                <input type="checkbox" id="f-option4" name="selector" />
                <label for="f-option4">I’ve read and accept the </label>
                <a href="#">terms & conditions*</a>
              </div>
      
              <a id="proceedToPaymentButton" class="btn_3" href="#">Proceed to Payment</a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!--================End Checkout Area =================-->
@endsection

@push('scripts')
<script type="text/javascript">

$(document).ready(function() {
  setTimeout(() => {
    $("#proceedToPaymentButton").click(() => {
      if (validate())
      {
        // valid
        e.preventDefault();

        window.location = "./"
      } else {
        // invalid
      }
      
    });
  }, 2000)
});

function validate()
{  
  var valid = true;

  var first = $("#first");
  var last = $("#last");
  var company = $("#company");
  var phone = $("#number");
  var email = $("#email");
  var add1 = $("#add1");
  var add2 = $("#add2");
  var city = $("#city");
  var province = $("#province");
  var zip = $("#zip");

  // validate values
  // regular, no value checks
  var regs = [first, last, add1, add2, city];
  $.each(regs, (index, value) => 
  {
    if (value.val().trim() == "")
    {
      value.addClass("error");
      valid = false;
    } else {
      value.removeClass("error");
    }
  });
  if (validateEmail(email.val()))
  {
    email.removeClass("error");
  }else {
    valid = false;
    email.addClass("error")
  }

  if (validatePhone(phone.val()))
  {
    phone.removeClass("error");
  } else {
    valid = false;
    phone.addClass("error");
  }

  return valid;
}

function validatePhone(value)
{
  if (value)
  {
    if (value.startsWith("+94") || value.startsWith("94"))
      return value.match(/\d/g).length === 11;
    else 
      return value.match(/\d/g).length===10;

    return false;
  } else {
    return false;
  }
}

function validateEmail(email) {
    var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(String(email).toLowerCase());
}

</script>
@endpush
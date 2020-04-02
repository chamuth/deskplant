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
          <li>
            <a href="/admin/dashboard">
              <i class="nc-icon nc-box"></i>
              <span>INVENTORY</span>
            </a>
          </li>
          <li class="active">
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
            <a class="navbar-brand" href="javascript:;">ORDERS</a>
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
            
            <?php 

              // Get undelievered orders
              $undelivered = DB::table("orders")->where("order_status_id", 1)->get();

            ?>

            <div class="facet-container">
              <div class="left">
                <label class="mode-title">Manual Delivery</label>
                <ul id="allFacets" class="facet-list">

              <?php foreach ($undelivered as $order)
              {
                if (DB::table("delivery_method")->where("orderid", $order->id)->value("method") == 0)
                {
                  $products = DB::table("order_products")->where("order_id", $order->id)->get();
                ?>
                  <li class="facet" data-order-id="{{$order->id}}">

                    <div class="horizontal-list">
                      <em style="margin-bottom:5px;"><b>ORDER ID:</b> #{{ $order->id }}</em>
                      <span>•</span>
                      <em style="margin-bottom:5px;"><b>ORDERED:</b> {{ $order->created_at }}</em>
                      <span>•</span>
                      <em style="margin-bottom:5px;"><b>PAYMENT</b>: PAID</em>
                    </div>
                    
                    <div class="hr"></div>

                    <div class="images-container">
                        <?php foreach ($products as $product)
                      {
                        $imagePath = DB::table("product_images")->where("product_id", $product->product_id)->value("path");
                        ?>
                          <img src="/storage/{{ $imagePath }}" alt="">
                          <?php
                      }
                      ?>
                    </div>

                    <span class="facet-section">PRODUCTS</span>
                    <?php foreach($products as $product) {
                      $prod = DB::table("products")->where("id", $product->product_id)->first();
                      
                      ?>
                      <div>
                        <span>{{ $prod->name }}</span>
                        <span style="float:right">x{{ (int) $product->qty }}</span>
                      </div>
                      <?php
                    } ?>

                    <span class="facet-section padded">SHIPPING ADDRESS</span>
                    <?php
                      $shipping_info = json_decode($order->shipping_option);
                    ?>
                    <span>{{ $shipping_info->first . " " . $shipping_info->last }}, {{ $shipping_info->add1 }}, {{ $shipping_info->add2 }}, {{ $shipping_info->city }}</span>

                  </li>
                <?php 
                }
              }
              ?>
                </ul>
              </div>
              <div class="right">
                <label class="mode-title">Use Courier Service</label>
                <ul id="userFacets" class="facet-list">
                <?php foreach ($undelivered as $order)
              {
                if (DB::table("delivery_method")->where("orderid", $order->id)->value("method") == 1)
                {
                  $products = DB::table("order_products")->where("order_id", $order->id)->get();
                ?>
                  <li class="facet" data-order-id="{{$order->id}}">

                    <div class="horizontal-list">
                      <em style="margin-bottom:5px;"><b>ORDER ID:</b> #{{ $order->id }}</em>
                      <span>•</span>
                      <em style="margin-bottom:5px;"><b>ORDERED:</b> {{ $order->created_at }}</em>
                      <span>•</span>
                      <em style="margin-bottom:5px;"><b>PAYMENT</b>: PAID</em>
                    </div>
                    
                    <div class="hr"></div>

                    <div class="images-container">
                        <?php foreach ($products as $product)
                      {
                        $imagePath = DB::table("product_images")->where("product_id", $product->product_id)->value("path");
                        ?>
                          <img src="/storage/{{ $imagePath }}" alt="">
                          <?php
                      }
                      ?>
                    </div>

                    <span class="facet-section">PRODUCTS</span>
                    <?php foreach($products as $product) {
                      $prod = DB::table("products")->where("id", $product->product_id)->first();
                      
                      ?>
                      <div>
                        <span>{{ $prod->name }}</span>
                        <span style="float:right">x{{ (int) $product->qty }}</span>
                      </div>
                      <?php
                    } ?>

                    <span class="facet-section padded">SHIPPING ADDRESS</span>
                    <?php
                      $shipping_info = json_decode($order->shipping_option);
                    ?>
                    <span>{{ $shipping_info->first . " " . $shipping_info->last }}, {{ $shipping_info->add1 }}, {{ $shipping_info->add2 }}, {{ $shipping_info->city }}</span>

                  </li>
                <?php 
                }
              }
              ?>
                </ul>
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
  <script
  src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"
  integrity="sha256-VazP97ZCwtekAsvgPBSUwPFKdrwD3unUfSGVYrahUqU="
  crossorigin="anonymous"></script>
  <script src="/assets/js/core/popper.min.js"></script>
  <script src="/assets/js/core/bootstrap.min.js"></script>
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

        $(function() {
          $("#allFacets, #userFacets").sortable({
            connectWith: "ul",
            placeholder: "placeholder",
            delay: 150,
            update: function()
            {
              var $manualDelivery = ($("#allFacets").children());
              var $courierDelivery = $("#userFacets").children();

              var orders = [];

              for (var i = 0; i < $manualDelivery.length; i++)
              {
                orders.push({ id: $($manualDelivery[i]).data("order-id"), method: 0});
              }

              for (var i = 0; i < $courierDelivery.length; i++)
              {
                orders.push({ id: $($courierDelivery[i]).data("order-id"), method: 1});
              }
              
              $.post("/api/delivery_method", { _token: "{{ csrf_token() }}", data : orders }, function(data)
              {
                console.log(data);
              }, "json").fail( function(jqXHR, textStatus, errorThrown) {
                  console.log(errorThrown);
              });
            }
          })
          .disableSelection()
          .dblclick( function(e){
            var item = e.target;

            do 
            {
              item = item.parentElement;
            } while (!item.classList.contains("facet"));

            if (item.classList.contains("facet"))
              if (e.currentTarget.id === 'allFacets') {
                //move from all to user
                $(item).fadeOut('fast', function() {
                  $(item).appendTo($('#userFacets')).fadeIn('slow');
                });
              } else {
                //move from user to all
                $(item).fadeOut('fast', function() {
                  $(item).appendTo($('#allFacets')).fadeIn('slow');
                });
              }
          });
        });

    </script>
</body>

</html>

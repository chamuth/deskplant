<footer>

<!-- Footer Start-->
<div class="footer-area footer-padding">
    <div class="container">
        <div class="row d-flex justify-content-between">
            <div class="col-xl-3 col-lg-3 col-md-5 col-sm-6">
               <div class="single-footer-caption mb-50">
                 <div class="single-footer-caption mb-30">
                      <!-- logo -->
                     <div class="footer-logo">
                         <a href="index.html"><img style="height:50px" src="assets/img/logo/logo2_footer.png" alt=""></a>
                     </div>
                     <div class="footer-tittle">
                         <div class="footer-pera">
                            <p>hello@deskplant.lk<br>
                            +94 777 21 53 77<br><br>
                            <b>Helpline:</b><br>

                            Mon-Fri (9AM-6PM) <br>
                            Sat & Sun  (9AM-3PM)</p>
                        </div>
                     </div>
                 </div>
               </div>
            </div>
            <div class="col-xl-2 col-lg-3 col-md-3 col-sm-5">
                <div class="single-footer-caption mb-50">
                    <div class="footer-tittle">
                        <h4>Quick Links</h4>
                        <ul>
                            <li><a href="/about">About</a></li>
                            <li><a href="/contact">Contact Us</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-lg-3 col-md-4 col-sm-7">
                <div class="single-footer-caption mb-50">
                    <div class="footer-tittle">
                        <h4>Useful</h4>
                        <ul>
                            <li><a href="https://www.deskplant.lk/wp-content/uploads/2019/02/Bulk-price-list.pdf">Bulk Price List</a></li>
                            <li><a href="https://www.deskplant.lk/wp-content/uploads/2019/02/deskplantlk-careing-tips.pdf">Care Tips</a></li>
                            <li><a href="#" data-toggle="modal" data-target="#requestQuoteModal">Request a Quote</a></li>
                            <li><a href="#" data-toggle="modal" data-target="#submitTestimonialModal">Submit a Testimonial</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-lg-3 col-md-5 col-sm-7">
                <div class="single-footer-caption mb-50">
                    <div class="footer-tittle">
                        <h4>Quicklinks</h4>
                        <ul>
                         <li><a href="/">Sale</a></li>
                         <li><a href="/">Shop All</a></li>
                         <li><a href="/">All Plants</a></li>
                         <li><a href="/">All Pots</a></li>
                         <li><a href="/">Accessories & Tools</a></li>
                     </ul>
                    </div>
                </div>
            </div>
        </div>
        <!-- Footer bottom -->
        <div class="row">
         <div class="col-xl-7 col-lg-7 col-md-7">
             <div class="footer-copy-right">
                <p><script>document.write(new Date().getFullYear());</script> © Deskplant.lk All Rights Reserved.</p>
            </div>
         </div>
          <div class="col-xl-5 col-lg-5 col-md-5">
             <div class="footer-copy-right f-right">
                 <!-- social -->
                 <div class="footer-social">
                     <a href="#"><i class="fab fa-twitter"></i></a>
                     <a href="#"><i class="fab fa-facebook-f"></i></a>
                     <a href="#"><i class="fab fa-behance"></i></a>
                     <a href="#"><i class="fas fa-globe"></i></a>
                 </div>
             </div>
         </div>
     </div>
    </div>
</div>
<!-- Footer End-->

</footer>


<div class="modal fade" id="requestQuoteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Request Quote</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form action="/request_quote" method="POST" enctype="multipart/form-data">

        <div class="modal-body">
            <input type="hidden" name="_token" id="csrf-token" value="{{ Session::token() }}" />  

            <label>Your Name</label>
            <input type="text" name="name" class="form-control" placeholder="ex: John Doe" value="">

            <label class="top-padded">Your Company</label>
            <input type="text" name="company" class="form-control" placeholder="ex: ABCD Corporation" value="">

            <label class="top-padded">Email Address</label>
            <input type="text" name="email" class="form-control" placeholder="ex: example@mail.com" value="">

            <label class="top-padded">Describe your requirements: </label>
            <textarea class="form-control" name="description" height="200px"></textarea>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            <button type="submit" class="btn btn-primary">Request</button>
        </div>

      </form>
    </div>
  </div>
</div>



<div class="modal fade" id="submitTestimonialModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Submit Testimonial</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form action="/submit_testimonial" method="POST" enctype="multipart/form-data">
        <div class="modal-body">
            <input type="hidden" name="_token" id="csrf-token" value="{{ Session::token() }}" />  
            
            <label>Your Name</label>
            <input type="text" class="form-control" name="name" placeholder="ex: John Doe">

            <label>Email Address</label>
            <input type="email" class="form-control" name="email" placeholder="ex: example@mail.com">

            <label class="top-padded">Company Name</label>
            <input type="text" class="form-control" name="company" placeholder="ex: ACME Company">

            <label class="top-padded">Your Job / Position</label>
            <input type="text" class="form-control" name="position" placeholder="ex: Chief Executive Officer">

            <label class="top-padded">Your Testimonial</label>
            <textarea type="text" class="form-control" name="testimonial"></textarea>

        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            <button type="submit" class="btn btn-primary">Submit</button>
        </div>
      </form>
    </div>
  </div>
</div>

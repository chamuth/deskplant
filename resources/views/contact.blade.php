@extends('layouts.app')

@section('content')

    <div class="container" style="width:900px;margin-top:80px;">

        <h1 style="text-align:center" style="margin-bottom:20px">Request a Quote</h1>

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
                <button type="submit" class="btn btn-primary">Request</button>
            </div>

        </form>    

    </div>

@endsection
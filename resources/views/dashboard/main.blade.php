<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Deskplant | Dashboard</title>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />

    <style>
        *
        {
            font-family: 'Montserrat', sans-serif;
        }
        .center
        {
            position:absolute;   
            top:50%;
            left:50%;
            transform:translateX(-50%) translateY(-50%);
            text-align:center;
        }

        .title
        {
            font-size:20px;
            margin-bottom:35px;
            color:gray;
        }

        .select-dashboard
        {
            display:flex;
            flex-direction:row;
        }

        .select-dashboard .dashboard-item
        {
            border:2px solid gray;
            border-radius:10px;
            text-align:center;
            width:150px;
            height:150px;
            position:relative;
            margin-left:10px;
            margin-right:10px;
            cursor:pointer;
            transition:all 200ms;
        }

        .dashboard-item:hover
        {
            transform:scale(1.1);
            background-color:gray;
        }

        .dashboard-item:hover *
        {
            color:white !important;
        }

        .dashboard-item:active
        {
            transform:scale(1.05);
        }

        .dashboard-item .fa
        {
            font-size:50px;
            margin-bottom:15px;
            color:gray;
        }

        .dashboard-item span
        {
            color:gray;
        }

        .dashboard-item .content
        {
            position:absolute;
            top:50%;
            left:50%;
            transform:translateX(-50%) translateY(-50%);
            
            display:flex;
            flex-direction:column;
        }
    </style>    
    
</head>
<body>
    <div class="center">
        <p class="title">SELECT TO REDIRECT </p>
        <div class="select-dashboard">
            <a href="/admin/product">
                <div class="dashboard-item">
                    <div class="content">
                        <i class="fa fw fa-database"></i>
                        <span>Products</span>
                    </div>
                </div>
            </a>
            <a href="/admin/dashboard">
                <div class="dashboard-item">
                    <div class="content">
                        <i class="fa fw fa-archive"></i>
                        <span>Delivery</span>
                    </div>
                </div>
            </a>
        </div>
    </div>
</body>
</html>
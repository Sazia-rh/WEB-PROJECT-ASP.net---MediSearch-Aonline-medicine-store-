<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="aboutpage.aspx.cs" Inherits="WebApplication7.aboutpage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link rel="stylesheet" href="home1.css" />
    <link rel="stylesheet" href="home2.css" />
   
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.4/css/fontawesome.min.css" />
    <script src="https://kit.fontawesome.com/01f22be397.js" crossorigin="anonymous"></script>
    
      <div class="title1">
     <div class="title">
    <asp:Label ID="Label4" runat="server" Text="MediSearch"></asp:Label>
        </div>
         <div class="icons" >
            
             <ul>
                 <li>
            <div id="Div1" class="fas fa-shopping-cart" >
                <ul class="sub-menu1">
                    <li> <a href="Cart.aspx">Cart</a></li>
                    <li ><a href="orderHistoryUser.aspx">Order History</a></li>
                </ul>
                </div>
                </li>
                 <li>
            <a href="Profile.aspx"> <div id="Div2" class="far fa-user"> </div></a>
                </li>
                 <li><a href="login.aspx">
             <div id="Div3" class="fas fa-sign-out-alt" > </div></a>
                 </li>
            </ul>
        </div>
        </div>
     <div class="menu-bar">
        <ul>
            <li ><a href="HomePage.aspx">Home</a></li>
            <li><a href="DisplayProduct.aspx">Medicines</a>
      
            </li>
            <li ><a href="displayMedDevice.aspx">Medical Devices</a>
                 
            </li>
            <li><a href="DoctorView.aspx">Online Doctors</a>
            </li>
            <li class="active"><a href="aboutpage.aspx">About Us</a></li>
        </ul>
    
    </div> 

</head>
<body class="body1">
    <form id="form2" runat="server">
    <div class="textt">
        <p style="font-size:x-large;font-weight:700; "><em>Live Well with MediSearch:</em>
           Your Quickest Online Pharmacy and Healthcare Platform. We understand your needs.
            </p>
        <br /><br />
        
 <p style="font-size:x-large;font-weight:700; ">
Providing Quality Service is Our Priority.
At MediSearch we have the largest inventory in Bangladesh with over 7 lakh medicines available at the best prices. We are your one-stop destination for other healthcare products as well, such as over the counter pharmaceuticals, healthcare devices and sexual wellbeing products.
     </p>
        <br />
         <p style="font-size:x-large;font-weight:700; ">
The Services We Offer: <br />We want to provide a 360-degree solution for your wellbeing. Our delivery is spread all over Bangladesh. Our online doctors are well trained and at your service 24/7. Our experienced Pharmacists are A Grade certified who cater to your problems at all times of the day.
</p>
         <br />
         <p style="font-size:x-large;font-weight:700; ">
<em>Online Pharmacy:</em> <br />
Our online model pharmacy can be accessed easily through our website and apps available on Google Play Store and Apple App Store where customers can upload their prescription. Our medicine inventories are directly supplied form the largest pharmaceutical companies and thus we ensure longest expiry dates for our all medicines and products and also authentic medicines.The model pharmacies are supervised by A Category Pharmacists who ensures the best service for our customers.
</p>
         <br />
         <p style="font-size:x-large;font-weight:700; ">
<em>Delivery Services:</em> <br />
Our delivery services are tailored upon your need we provide our regular delivery within 4 hours of order being accepted. For people who needs the orders delivered quickly we have an Urgent Delivery providing all orders to be served within 90 minutes.In case of Emergency and late night we have the Express Delivery delivered from 11pm at night to 9am to the morning.
</p>
         <br />
         <p style="font-size:x-large;font-weight:700; ">
<em>On Call Doctor:</em> <br />
Our expert and experienced pool of doctors are always ready to serve any callers with their problems. Patients can communicate in our social media platforms and take an appointment or directly take the service from the app. Our Online Doctor Consultant communicated and prescribes all patients accordingly and provides the Best Telemedicine Services as well.
</p>
         <br />
         
         <br />
         <p style="font-size:x-large;font-weight:700; ">
<em>Dedicated Call Center:</em>
              <br />
Our 24/7 Call Center is operated by Experienced Teleconsultants and are always there to serve all customers at all times.
        </p>
    
    </div>
    </form>
</body>
</html>

<%@ Page Language="C#" EnableEventValidation="false" UnobtrusiveValidationMode="none" validateRequest="false" AutoEventWireup="true" CodeBehind="Registration Form.aspx.cs" Inherits="WebApplication1.Registration_Form" %>


<!DOCTYPE html>  
<html >  
<head >   
<script type="text/javascript">
    function displayPopup(message) {
        var popup = document.createElement('div');
        popup.innerHTML = message;
        popup.style.position = 'fixed';
        popup.style.right = '0';
        popup.style.fontWeight = 'bold';

        popup.style.transform = 'translateX(-5%)';
        popup.style.fontFamily = 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode';
        popup.style.width = "260px";
        popup.style.height = "80px";
        popup.style.display = "flex";
        popup.style.alignItems = "center";
        popup.style.justifyContent = "center";
        popup.style.textAlign = "center";
        popup.style.bottom = "20px";
        popup.style.border = "2px solid black";
        popup.style.padding = '10px';
        popup.style.backgroundColor = 'white';
        popup.style.color = 'red';
        popup.style.borderRadius = '5px';
        popup.style.zIndex = '10000';
        document.body.appendChild(popup);
        var sound = document.getElementById('pikachuSound');
        sound.play();


        setTimeout(function () {
            popup.style.display = 'none';
        }, 5000);
    }
    </script>
    <script type="text/javascript">
        function displaySuccessPopup(messageTop, messageBottom) {
            var popup = document.createElement('div');
            popup.innerHTML = messageTop + messageBottom;
            popup.style.position = 'fixed';
            popup.style.right = '0';
            popup.style.fontWeight = 'bold';
            popup.style.transform = 'translateX(-5%)';
            popup.style.fontFamily = 'Lucida Sans, Lucida Sans Regular, Lucida Grande, Lucida Sans Unicode';
            popup.style.width = "260px";
            popup.style.height = "80px";
            popup.style.display = "flex";
            popup.style.flexDirection = 'column';
            popup.style.textAlign = "center";
            popup.style.bottom = "20px";
            popup.style.border = "2px solid black";
            popup.style.padding = '4px';
            popup.style.backgroundColor = 'white';
            popup.style.color = 'green';
            popup.style.borderRadius = '5px';
            popup.style.zIndex = '10000';
            document.body.appendChild(popup);
            var sound = document.getElementById('pikachuSound');
            if (sound) {
                sound.play();
            }
            setTimeout(function () {
                popup.style.display = 'none';
            }, 5000);
        }
</script>


<title></title>  
    <link href="Registration%20CSS.css" rel="stylesheet" />
     <style>

    .auto-style1{
        width: 100%;
        padding: 5px 5px;
        margin: 1px 0 0 15px;
        }
    .user-count {
        font-size: 16px;
        color: black;
        background-color: aquamarine;
        padding: 5px 10px;
        border-radius: 5px;
        /*display: inline-block;*/
        text-align: center;
        margin: 10px 0;
    }
    .auto-style1 {  
     width: 100%;  
     padding: 5px 5px;
     margin: 2px 10px 10px 15px;
     
      }  
    input[type=text], input[type=password] {
        width: 15%;
        padding: 8px 5px;
        margin: 0 0 0 3px;
    }
    .auto-style2 {  
         width: 278px;  
           }  
    .auto-style3 {  
          width: 278px;  
          height: 23px;  
            }  
    .auto-style4 {  
          height: 23px;  
            } 

    .imgcontainer {
     text-align: left;
     /*margin: 5px 0 12px 0;*/
     }
    img.avatar {
    width: 10%;
    border-radius: 2%;
}
     .tab {
  width: 100%;  
  border: 1px solid #ccc;
  background-color:black;
}

  .val {
            text-align:left;
            margin-left:530px;
            margin-right:365px

        }

.tab button {
  background-color: black;
  float: left;
  border: none;
  outline: none;
  cursor: pointer;
  padding: 14px 16px;
  transition: 0.3s;
  font-size: 17px;
  color:white;
}

.headering{
  border-style: solid;
  border-color: LightGray;
  border-right: none;
  border-left: none;
  border-top: none;
}

.tab button:hover {
  background-color: black;
  border-color:aquamarine;
}
.tabcontent {
  padding: 8px 0;
 
  margin:0;
}
.tab button.active {
  /*background-color: tomato;*/
  border: 5px solid tomato;
  border-right: none;
  border-left: none;
  border-top: none;
  
}


</style>
</head>  
<body class="zoom">      
    <form id="form1" style="zoom: 100%;" method="post" runat="server"> 

                <audio id="pikachuSound" src="pika-pikachu-14757.mp3" preload="auto"></audio>


<p class="imgcontainer">
<asp:Image ID="imgAvatar" runat="server" CssClass="avatar" ImageUrl="data:image/png;base64,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" />
<asp:Button ID="btnLogout" runat="server" style="margin-top:0;width:72px;height:30px;color:aliceblue;border-radius:3px; border:none; background-color:tomato; margin-left:74%;position:absolute;" Text="Log Out"  OnClick="btnLogout_Click" />
<asp:Label style="margin-top:6px;margin-left:80%;position:absolute;font-family:'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;font-size:15px;"> <b>Active User :</b>  <asp:Label ID="lblUserCount" CssClass="user-count" runat="server" Text="0"></asp:Label></asp:Label></p>
<div class="tab">
<asp:Button ID="btnNewRegistration" runat="server" Text="New Registration" CssClass="tablinks tabcontent" style="margin-left:20px;  background-color: black;color:white;border: 5px solid tomato; border-right: none; border-left: none;border-top: none;"  OnClick="btnNewRegistration_Click" />
<asp:Button ID="Button2" runat="server" Text="View Registration" CssClass="tablinks tabcontent" style="margin-left:20px;background-color: black;color:white; border-right: none; border-left: none;border-top: none;" OnClick="btnViewRegistration_Click" />
<asp:Button ID="Button3" runat="server" Text="Bulk Upload" CssClass="tablinks tabcontent" style="margin-left:20px;background-color: black;color:white; border-right: none; border-left: none;border-top: none;" OnClick="btnbulkupload_Click" />
</div >

      <div id="New Registration" class="tabcontent">

<h2 class="headering">New Registration</h2>       

<table class="auto-style1" > 
    <tr>  
        <td>  
            <asp:Label style="font-size:14px; margin: 10px 0 0 40%;" ID="Label3" runat="server" >First Name<b style="color:Tomato;">*</b></asp:Label>&nbsp;
            <asp:TextBox ID="TextBox1" runat="server" ondrag="return false" ondrop="return false"  oncopy="return false" oninput=" validateNumberInput3(this)" style="font-size:12px; margin: 1px 0 0 0;" onpaste="return false" MaxLength="50"  ></asp:TextBox>
            <asp:Label  ID="error1" Class="error" style="font-size:14px;position:page; margin:10px 0 0 47%;" runat="server" ForeColor="Red" ></asp:Label>
        
        </td>
    </tr>
    <tr>  
         <td>  
             <asp:Label style="font-size:14px; margin: 0 0 0 40%;" ID="Label8" runat="server" >&nbsp;Last Name<b style="color:Tomato;">*</b></asp:Label>&nbsp;
             <asp:TextBox ID="TextBox2" runat="server" style="margin: 10px 0 0 0;position:relative;" ondrag="return false" ondrop="return false" oncopy="return false" oninput="validateNumberInput4(this)"  onpaste="return false" MaxLength="50" ></asp:TextBox>
             <br /><asp:Label  ID="error2" runat="server" style="font-size:14px; margin: 0 0 0 47%;" Class="error" ForeColor="Red" ></asp:Label>
         </td>
    </tr>
    <tr>  
        <td>  
            <asp:Label style="font-size:14px; margin: 10px 0 0 40%;" ID="Label5" runat="server" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Gender<b style="color:Tomato;">*</b></asp:Label>
            <asp:RadioButton style=" padding: 8px 5px;margin: 2px 5px 5px 5px;" ID="RadioButton3" runat="server" GroupName="gender" Text="Male" onclick="validateTerms1('error3')" onblur="validateNumberInputgenm()" />&nbsp;&nbsp;
            <asp:RadioButton style=" padding: 8px 5px;margin: 2px 5px 65px 65px;" ID="RadioButton4" runat="server" GroupName="gender" Text="Female"  onclick="validateTerms1('error3')" onblur="validateNumberInputgenm()"  />
            <br /><asp:Label  ID="error3" runat="server" style="font-size:14px; margin: 10px 0 0 47%;"  Class="error" ForeColor="Red" ></asp:Label>
        </td>  
    </tr>  
    <tr>  
        <td>  
    <asp:Label style="font-size:14px; margin: 10px 0 0 39%;" ID="Label15" runat="server">Date Of Birth<b style="color:Tomato;">*</b></asp:Label>&nbsp;&nbsp;
    <asp:TextBox ID="TextBox7" runat="server" width="54px" style="margin: 10px 2px 0 0; text-align:center; padding: 2px 2px;" disabled="true" ></asp:TextBox>&nbsp;
    <asp:TextBox ID="TextBox8" width="54px" runat="server" style="margin: 10px 2px 0 0; text-align:center; padding: 2px 2px;" disabled="true"></asp:TextBox>&nbsp;
    <asp:TextBox ID="TextBox9" runat="server" width="54px" style="margin: 10px 2px 0 0; text-align:center; padding: 2px 2px;" disabled="true" ></asp:TextBox>
    <asp:Image style="position:absolute; margin: 10px 0 0 0; z-index:-1;" ID="datepicker" runat="server" CssClass="avatar" Width="34px" Height="24px" ImageUrl="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdASK4X58oXh8yRuU9vxCvW7YZZoQ1Y7PcFQ&s" />
    <input type="date" style="opacity:0;" class="calendar" runat="server" id="date_datumPrispetja" oninput="validateDate(this)" /> 
    <br /><asp:Label ID="error4" runat="server" style="font-size:14px; margin: 10px 0 0 47%;" Class="error" ForeColor="Red"></asp:Label>
</td>
    </tr>
    <tr>  
        <td>  
            <asp:Label  style="font-size:14px; margin: 50px 0 10px 40%;" ID="Label1" runat="server" >User Name<span style="color:Tomato;">*</span></asp:Label>&nbsp;
            <asp:TextBox ID="txtUsername"  style="margin:5px 0 0 5px;" runat="server" ondrag="return false" oninput="validateNumberInput9(this)" ondrop="return false" oncopy="return false" onpaste="return false"  MaxLength="15"  ></asp:TextBox>
            <br /><asp:Label  ID="error5" runat="server" style="font-size:14px; margin: 10px 0 0 47%;" Class="error" ForeColor="Red" ></asp:Label>
        </td>
    </tr>
    <tr>  
        <td>  
            <asp:Label style="font-size:14px; margin: 10px 0 0 40%;" ID="Label9" runat="server" >&nbsp;&nbsp;&nbsp;Password<span style="color:Tomato;">*</span></asp:Label>&nbsp;
            <asp:TextBox type="password" id="txtPassword" name="txtPassword" style="margin:5px 0 0 5px;" runat="server" oninput="validateNumberInput10(this)" ondrag="return false" ondrop="return false" onblur="validatetext14()" oncopy="return false" onpaste="return false" minlength="8" MaxLength="15"  TextMode="Password" />
            <br /><asp:Label  ID="error6" runat="server" style="font-size:14px; margin: 10px 0 0 47%;" ForeColor="Red"  Class="error" ></asp:Label>
        </td>  
    </tr> 
    <tr>  
        <td>  
            <asp:Label style="font-size:14px; margin: 10px 0 0 567px;" ID="Label10" runat="server" >Retype Password<span style="color:Tomato;">*</span></asp:Label>&nbsp;
            <asp:TextBox type="password" onblur="validatePassword()"  oninput="validateNumberInput12(this)" id="txtConfirmpassword" style="margin:5px 0 0 0;" ondrag="return false"   ondrop="return false" oncopy="return false" onpaste="return false" name="txtConfirmpassword" runat="server" TextMode="Password"  /><br/> 
            <asp:Label  ID="error7" runat="server" style="font-size:14px; margin: 10px 0 0 47%;" ForeColor="Red"  Class="error" ></asp:Label>

        </td> 
    </tr>
    <tr>  
        <td>  
            <asp:Label style="font-size:14px; margin: 1px 0 0 38%;" ID="Label2" runat="server" >&nbsp;Mobile Number<b style="color:Tomato;">*</b></asp:Label>&nbsp;
            <asp:TextBox ID="TextBox6"  runat="server"  MaxLength="10" oninput="validateNumberInput6(this)"   ondrag="return false"   ondrop="return false" oncopy="return false" onpaste="return false" style="margin:0 0 0 5px;" ></asp:TextBox>
            <br /><asp:Label  ID="error8" runat="server" style="font-size:14px; margin: 10px 0 0 47%;" ForeColor="Red"  Class="error" ></asp:Label>

        </td>
    </tr>
    <tr>       
        <td>  
            <asp:Label style="font-size:15px;position:absolute; margin: 10px 0 30px 40%;"  runat="server" >Address<b style="color:Tomato;">*</b></asp:Label>
            <asp:TextBox style=" padding: 5px 5px;margin: 6px 5px 5px 680px;width: 15%;" ID="txtAddress" oninput="validateNumberInputad(this)" ondrag="return false" ondrop="return false" oncopy="return false" onpaste="return false" runat="server" CssClass="address-field" TextMode="MultiLine" ></asp:TextBox>
            <br /><asp:Label  ID="error9" runat="server" style="font-size:14px; margin: 10px 0 0 47%;" ForeColor="Red"  Class="error" ></asp:Label>

        </td>
    </tr>
    <tr>  
        <td>  
            <asp:Label style="font-size:14px; margin: 500px 7px 7px 37%;" ID="Label6" runat="server" >&nbsp;&nbsp;Mode Of Payment<b style="color:Tomato;">*</b></asp:Label>
            <asp:RadioButton style="font-size:14px; padding: 5px 5px;margin: 2px 0 0 5px;"  ID="RadioButton1" runat="server" GroupName="Mode Of Payment" Text="COD" onblur="validateNumberInputgenm()" onclick="toggleCreditCardDetails(false)" />&nbsp;
            <asp:RadioButton style="font-size:14px;padding: 8px 5px;margin: 2px 0 0 65px;"   ID="RadioButton2" runat="server" GroupName="Mode Of Payment" Text="Credit Card" onblur="validateNumberInputgenm()" onclick="toggleCreditCardDetails(true)"  />
            <br /><asp:Label  ID="error10" runat="server" style="font-size:14px; margin: 10px 0 0 47%;" Class="error" ForeColor="Red"  ></asp:Label>
        </td> 
    </tr>
    <tr id="creditCardDetails" style="display:none;">  
         <td>  
            <asp:Label style="font-size:14px; margin: 10px 0 0 585px;" ID="Label4" runat="server" >&nbsp;Card Number<b style="color:Tomato;">*</b></asp:Label>&nbsp;
            <asp:TextBox ID="TextBox3" runat="server" MaxLength="16" style="margin: 10px 0 0 0;" onblur="validatetextcn()" oninput="validateNumberInput(this)"></asp:TextBox>
            <br /><asp:Label  ID="error11" runat="server" style="font-size:14px; margin: 10px 0 0 47%;" Class="error" ForeColor="Red" ></asp:Label>
        </td>
    </tr >
    <tr id="creditCardName" style="display:none">  
         <td>  
             <asp:Label style="font-size:14px; margin: 10px 0 0 585px;" ID="Label18" runat="server" >Name on Card<b style="color:Tomato;">*</b></asp:Label>&nbsp;
             <asp:TextBox ID="TextBox4"  style="margin: 6px 0 0 0;" oninput="validateNumberInput2(this)" runat="server"  ></asp:TextBox>
               <br /><asp:Label  ID="error12" runat="server" style="font-size:14px; margin: 10px 0 0 47%;"  Class="error" ForeColor="Red" ></asp:Label>
         </td>
    </tr>
    <tr id="creditCardCVV" style="display:none">  
         <td>  
             <asp:Label style="font-size:14px; margin: 8px 0 0 637px;" ID="Label19" runat="server" >CVV<b style="color:Tomato;">*</b></asp:Label>&nbsp;
             <asp:TextBox ID="TextBox16" style="margin: 6px 0 0 0;" MaxLength="3" runat="server" onblur="validatetextcvv()" oninput="validateNumberInput1(this)" ></asp:TextBox>
                <br /><asp:Label  ID="error13" runat="server" style="font-size:14px; margin: 10px 0 0 47%;" Class="error" ForeColor="Red" ></asp:Label>
         </td>
    </tr>
    <tr id="creditCardexpiry" style="display:none">  
     <td>  
         <asp:Label style="font-size:14px; margin: 8px 0 0 560px;" ID="Label17" runat="server" >Credit Card Expiry<b style="color:Tomato;">*</b></asp:Label>&nbsp;
         <asp:TextBox ID="TextBox10" style="margin: 0 0 0 0;padding:4px 1px;margin-bottom: 0;" width="100px" MaxLength="2" runat="server" placeholder="MM" oninput="validateNumberInputm(this)" ></asp:TextBox>&nbsp;<asp:TextBox ID="TextBox11"  placeholder="YYYY" oninput="validateNumberInputy(this)" width="120px" style="margin: 5px 0 0 0;padding:4px 1px;margin-bottom: 0;" MaxLength="4" runat="server" ></asp:TextBox>
       <br /><asp:Label  ID="error19" runat="server"  style="font-size:14px; margin: 10px 0 0 47%;" Class="error" ForeColor="Red" ></asp:Label>
     </td>
</tr>
         </table>
<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

<asp:UpdatePanel runat="server" ID="LocationPanel">
<ContentTemplate>
<table class="auto-style1" width="fix-content">
    <tr>
            <td>
            <asp:Label style="font-size:14px; margin: 0 0 0 610px;" ID="Label7" runat="server" >Country<b style="color:Tomato;">*</b></asp:Label>&nbsp;                   
            <asp:DropDownList ID="Country" style="padding: 8px ;text-align:center;width: 239px;margin: 1px 0 0 8px;" oninput="validateNumberInputco(this)" AutoPostBack="true" OnSelectedIndexChanged="Country_SelectedIndexChanged" runat="server"></asp:DropDownList><br />                      
            <asp:Label  ID="error14" runat="server"  style="font-size:14px; margin: 10px 0 0 47%;" Class="error" ForeColor="Red" ></asp:Label>

        </td>
    </tr>
    <tr>
            <td>
            <asp:Label style="font-size:14px; margin: 0 0 0 629px;" ID="Label11" runat="server" >State<b style="color:Tomato;">*</b></asp:Label>&nbsp;                   
            <asp:DropDownList ID="State" style="width: 239px;text-align:center; padding: 8px;margin: 1px 0 0 8px;" oninput="validateNumberInputs(this)"  AutoPostBack="true" OnSelectedIndexChanged="State_SelectedIndexChanged" runat="server"></asp:DropDownList><br />                     
            <asp:Label  ID="error15" runat="server" style="font-size:14px; margin: 10px 0 0 47%;" Class="error" ForeColor="Red" ></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label style="font-size:14px; margin: 0 0 0 632px;" ID="Label12" runat="server" >CIty<b style="color:Tomato;">*</b></asp:Label>&nbsp;                    
            <asp:DropDownList style="padding: 8px ;width: 239px;text-align:center;margin:1px 0 0 8px;" ID="City" oninput="validateNumberInputci(this)" runat="server"></asp:DropDownList><br />                      
            <asp:Label  ID="error16" runat="server"  style="font-size:14px; margin: 0 0 0 47%;" Class="error" ForeColor="Red" ></asp:Label>
        </td>
    </tr>
</table>
</ContentTemplate>
<Triggers>
<asp:AsyncPostBackTrigger ControlID="Country" EventName="SelectedIndexChanged" />
<asp:AsyncPostBackTrigger ControlID="State" EventName="SelectedIndexChanged" />
</Triggers>
</asp:UpdatePanel>
   
     <table class="auto-style1"> 
    <tr>  
        <td>  
            <asp:Label  style="font-size:14px; margin: 0 0 0 41%;" ID="Label13" runat="server"  >Email ID<span style="color:Tomato;">*</span></asp:Label>&nbsp;
            <asp:TextBox ID="email" runat="server" oninput=" validateNumberInput11(this)"  style=" padding: 8px 5px;margin: 0 0 0 5px;width: 15%;"></asp:TextBox>
            <asp:Label  ID="error17" runat="server" style="font-size:14px; margin: 0 0 0 47%;" Class="error" ForeColor="Red" ></asp:Label>
        </td>
    </tr>
     <tr>  
         <td>  
             <asp:Label style="font-size:14px; margin: 10px 0 0 41%;" ID="Label14" runat="server" >&nbsp;&nbsp;Phone No</asp:Label>&nbsp;
             <asp:TextBox ID="TextBox5" runat="server" style=" margin: 20px 0 0 0" MaxLength="10" oninput="validatetextPhone(this)" ></asp:TextBox>
            <asp:Label  ID="error18" runat="server" style="font-size:14px; margin: 0 0 0 47%;" Class="error" ForeColor="Red" ></asp:Label>
         </td>
    </tr>
</table> 
   
     <asp:Label style="font-size:13px; margin: 10px 0 0 35%;" ID="Label16" runat="server" ><b>Terms and Conditions:</b></asp:Label>
     <asp:Label ID="lblErrorMessage" runat="server" ForeColor="Red" ></asp:Label>
<div class="val" >
    <asp:CheckBox style="font-size:13px;" ID="chkTerms" runat="server" Text="I accept the terms and conditions" onclick="validateTerms('lblErrorMessage')" />
</div><br />
    <asp:Button ID="btnRegister" runat="server" Text="Submit"  OnClick="btnRegister_Click"  Style="background-color:tomato;border:none;color:white; border-radius:3px; margin-left:50%; width: 80px; height:25px" />
    <asp:button type="submit" value="Submit" runat="server" Text="Cancel" OnClick="btncancel_Click" CssClass="Cancel-button" id="Button1" style="background-color:dimgray;border:none;color:white;border-radius:3px;" class="button" Width="75px" Height="25px" />
</div>



 <script>
     function toggleCreditCardDetails(isCreditCard) {
         var creditCardDetails = document.getElementById("creditCardDetails");
         var creditCardName = document.getElementById("creditCardName");
         var creditCardCVV = document.getElementById("creditCardCVV");
         var creditCardexpiry = document.getElementById("creditCardexpiry");

         if (isCreditCard) {
             creditCardDetails.style.display = "table-row";
             creditCardName.style.display = "table-row";
             creditCardCVV.style.display = "table-row";
             creditCardexpiry.style.display = "table-row";
         } else {
             creditCardDetails.style.display = "none";
             creditCardName.style.display = "none";
             creditCardCVV.style.display = "none";
             creditCardexpiry.style.display = "none";

             document.getElementById("TextBox16").value = "";
             document.getElementById("TextBox4").value = "";
             document.getElementById("TextBox3").value = "";
             document.getElementById("TextBox10").value = "";

             document.getElementById("TextBox11").value = "";

         }
     }
</script>
  
<script type="text/javascript">
    function validatetextPhone(input) {
        var messageElement = document.getElementById("error18");
        var value = input.value;
        var numericValue = value.replace(/\D/g, '');
        input.value = numericValue;
        if (numericValue.length !== 10) {
            messageElement.innerHTML = "Only numbers and exactly 10 digits are allowed.";
            messageElement.style.color = "red";
        } else {

            messageElement.innerHTML = "";
        }
    }



    function validateNumberInput6(input) {
        var messageElement = document.getElementById("error8");
        var value = input.value;
        var numericValue = value.replace(/\D/g, '');
        input.value = numericValue;
        if (numericValue.length !== 10) {
            messageElement.innerHTML = "Only numbers and exactly 10 digits are allowed.";
            messageElement.style.color = "red";
        } else {

            messageElement.innerHTML = "";
        }
    }

    function validateNumberInputm(input) {
        var messageElement = document.getElementById("error19");
        var value = input.value;
        input.value = input.value.replace(/[^1-9]/g, '');

        if (value !== input.value) {
            messageElement.innerHTML = "The Month and Year is not valid(Valid-(MM)(YYYY))";
            messageElement.innerHTML = "";
        }
        else {
            messageElement.innerHTML = "";
        }
    }
    function validateNumberInputy(input) {
        var messageElement = document.getElementById("error19");
        var value = input.value;
        input.value = input.value.replace(/[^1-9]/g, '');

        if (value !== input.value) {

            messageElement.innerHTML = "The Month and Year is not valid(Valid-(MM)(YYYY))";
            messageElement.style.color = "red";
        }

        else {
            messageElement.innerHTML = "";
        }
    }
   
    function validateNumberInputgenm() {
        var maleRadio = document.getElementById("<%= RadioButton3.ClientID %>").value;
        var femaleRadio = document.getElementById("<%=  RadioButton4.ClientID %>").value;
        if (maleRadio.checked || femaleRadio.checked) {
            document.getElementById("error3").innerHTML = "";
            error.Visible = true;
        }
    }

    function validateNumberInputgenf() {
        var maleRadio = document.getElementById("<%= RadioButton3.ClientID %>").value;
        var femaleRadio = document.getElementById("<%=  RadioButton4.ClientID %>").value;


        if (maleRadio.checked || femaleRadio.checked) {
            document.getElementById("error3").innerHTML = "";
            isValid = true;
        }
    }
    function validateNumberInputgencod() {
        var maleRadio = document.getElementById("<%= RadioButton1.ClientID %>").value;
        var femaleRadio = document.getElementById("<%=  RadioButton2.ClientID %>").value;


        if (maleRadio.checked || femaleRadio.checked) {
            document.getElementById("error10").innerHTML = "";
            error.Visible = true;
        }
    }

    function validateNumberInputgencc() {
        var maleRadio = document.getElementById("<%= RadioButton1.ClientID %>").value;
     var femaleRadio = document.getElementById("<%=  RadioButton2.ClientID %>").value;


        if (maleRadio.checked || femaleRadio.checked) {
            document.getElementById("error10").innerHTML = "";
            isValid = true;
        }
    }

    function validateNumberInput(input) {
        var messageElement = document.getElementById("error11");
        var value = input.value;
        input.value = value.replace(/\D/g, '');

        if (value !== input.value) {
            messageElement.innerHTML = "Only number and 16 digits are allowed.";
            messageElement.style.color = "red";

        }
        else if (value.trim() != "") {
            messageElement.innerHTML = "";
        }
        else {
            messageElement.innerHTML = "";
        }
    }

    function validateNumberInputad(input) {
        var messageElement = document.getElementById("error9");
        var value = input.value;

        if (value.trim() != "") {
            messageElement.innerHTML = "";
        }
        else {
            messageElement.innerHTML = "";
        }
    }
    function validateNumberInputco(input) {
        var messageElement = document.getElementById("error14");
        var value = input.value;

        if (value.trim() != "") {
            messageElement.innerHTML = "";
        }
        else {
            messageElement.innerHTML = "";
        }
    }
    function validateNumberInputs(input) {
        var messageElement = document.getElementById("error15");
        var value = input.value;

        if (value.trim() != "") {
            messageElement.innerHTML = "";
        }
        else {
            messageElement.innerHTML = "";
        }
    }
    function validateNumberInputci(input) {
        var messageElement = document.getElementById("error16");
        var value = input.value;

        if (value.trim() != "") {
            messageElement.innerHTML = "";
        }
        else {
            messageElement.innerHTML = "";
        }
    }
    function validateNumberInput1(input) {
        var messageElement = document.getElementById("error13");
        var value = input.value;

        input.value = value.replace(/\D/g, '').substring(0, 3);

        if (value !== input.value) {
            messageElement.innerHTML = "Only number and 3 digits are allowed.";
            messageElement.style.color = "red";

        }
        else if (value.trim() != "") {
            messageElement.innerHTML = "";
        }
        else {
            messageElement.innerHTML = "";
        }
    }

    function validateNumberInput2(input) {
        var messageElement = document.getElementById("error12");
        var value = input.value;

        input.value = value.replace(/[^a-zA-Z]/g, '');

        if (value !== input.value) {
            messageElement.innerHTML = "Only alphabet are allowed.";
            messageElement.style.color = "red";

        }
        else if (value.trim() != "") {
            messageElement.innerHTML = "";
        }
        else {
            messageElement.innerHTML = "";
        }
    }
    function validateNumberInput3(input) {
        var messageElement = document.getElementById("error1");
        var value = input.value;

        input.value = value.replace(/[^a-zA-Z]/g, '');


        if (value !== input.value) {
            messageElement.innerHTML = "Only alphabet are allowed.";
            messageElement.style.color = "red";

        }
        else if (value.trim() != "") {
            messageElement.innerHTML = "";
        }
        else {
            messageElement.innerHTML = "";
        }
    }
    function validateNumberInput4(input) {
        var messageElement = document.getElementById("error2");
        var value = input.value;

        input.value = value.replace(/[^a-zA-Z]/g, '');

        if (value !== input.value) {
            messageElement.innerHTML = "Only alphabet are allowed.";
            messageElement.style.color = "red";

        }
        else if (value.trim() != "") {
            messageElement.innerHTML = "";
        }
        else {
            messageElement.innerHTML = "";
        }
    }




    function validateNumberInput9(input) {
        var messageElement = document.getElementById("error5");
        var value = input.value;

        input.value = value.replace(/[^a-zA-Z0-9]/g, '')

        if (value !== input.value) {
            messageElement.innerHTML = "Only alphabet and number are allowed.";
            messageElement.style.color = "red";

        }
        else if (value.trim() != "") {
            messageElement.innerHTML = "";
        }
        else {
            messageElement.innerHTML = "";
        }
    }
    function validateNumberInput10(input) {
        var messageElement = document.getElementById("error6");
        var value = input.value;

        var pattern = /^(?=.*[!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?])(?=.*[a-zA-Z0-9]).{8,15}$/;

        if (!pattern.test(value)) {
            messageElement.innerHTML = "Password should contain one special character and alphanumeric characters (Min 8 - Max 15 characters allowed)";
            messageElement.style.color = "red";
        }
        else if (value.trim() != "") {
            messageElement.innerHTML = "";
        }

    }

    function validateNumberInput11(input) {
        var messageElement = document.getElementById("error17");
        var value = input.value;

        var pattern = /^[a-zA-Z0-9._]+@[a-zA-Z]+\.[a-zA-Z]{2,}$/;

        if (!pattern.test(value)) {
            messageElement.innerHTML = "Email is not valid (Valid eg: name@example.com)";
            messageElement.style.color = "red";
        }
        else if (value.trim() != "") {
            messageElement.innerHTML = "";
        }
        else {
            messageElement.innerHTML = "";
        }
    }


    function validateNumberInput12(input) {
        var messageElement = document.getElementById("error7");
        var password = document.getElementById("txtPassword").value;
        var confirmPassword = input.value;

        if (password != confirmPassword) {
            messageElement.innerHTML = "Passwords do not match";
            messageElement.style.color = "red";
        }
        else {
            messageElement.innerHTML = "";
        }

    }
</script>

    <script type="text/javascript">
        function confirmLogout() {
            return confirm("Are you sure you want to log out?");
        }
    </script>
     <script>
         function validateTerms(errorId, errorMessage) {
             var terms = document.getElementById('<%= chkTerms.ClientID %>');
             var error = document.getElementById(errorId);
             if (terms.checked) {

                 error.innerText = "";
                 error.style.display = "none";
             }
         }

         function validateTerms1(errorId, errorMessage) {
             var terms = document.getElementById('<%= RadioButton3.ClientID %>');
             var terms1 = document.getElementById('<%= RadioButton4.ClientID %>');

             var error = document.getElementById(errorId);
             if (terms.checked || terms1.checked) {

                 error.innerText = "";
                 error.style.display = "none";
             }
         }
     </script>
    <script type="text/javascript">
        function validateDate(input) {
         var dateInput = document.getElementById('<%= date_datumPrispetja.ClientID %>');
        var selectedDate = dateInput.value;
        var currentDate = new Date();
        var inputDate = new Date(selectedDate);
        console.log(selectedDate);
        if (inputDate > currentDate) {
            document.getElementById('<%= error4.ClientID %>').innerHTML = "Future dates are not accepted.";
            dateInput.value = "";
            document.getElementById('<%= TextBox7.ClientID %>').value = "";
            document.getElementById('<%= TextBox8.ClientID %>').value = "";
            document.getElementById('<%= TextBox9.ClientID %>').value = "";
            return false;
        } else {
            document.getElementById('<%= error4.ClientID %>').innerHTML = "";
            var parts = selectedDate.split("-");
            if (parts.length === 3) {
                document.getElementById('<%= TextBox7.ClientID %>').value = parts[2]; 
                document.getElementById('<%= TextBox8.ClientID %>').value = parts[1]; 
                document.getElementById('<%= TextBox9.ClientID %>').value = parts[0]; 
                }
                return true;
            }
        }
</script>
 <script>
     let timeoutTimer;
     let lastActivityTime = Date.now();
     function startLogoutTimeout() {
         clearTimeout(timeoutTimer);
         timeoutTimer = setTimeout(function () {
             logoutUser();
         }, 20 * 60 * 1000);
     }

     function resetTimeout() {
         lastActivityTime = Date.now();
         startLogoutTimeout();
     }

     function logoutUser() {
         window.location.href = 'Login Form.aspx?timeout=true';
     }

     const formFields = document.querySelectorAll('input, select, textarea');
     formFields.forEach(function (field) {
         field.addEventListener('input', resetTimeout);
     });

 </script>

</form>
    </body>
    </html>



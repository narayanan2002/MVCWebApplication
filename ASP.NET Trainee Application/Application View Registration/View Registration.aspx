<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="View Registration.aspx.cs" Inherits="WebApplication1.View_Registration" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

<style type="text/css">  
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
.calendar{
    margin-left:-85px;
    z-index:3;
}

 img.avatar {
     width: 10%;
     border-radius: 2%;
 }


 .center-align {
    text-align: center;
    margin: 0 0 0 38%;
    font-size: 15px;
}

.custom-font {
    font-family: Serif;
}   

.first-row-blue{

    
}

.grid-header th {
        background-color: cornflowerblue;
        border:2px solid black;
        width:100px;
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

.tab button.active {
  /*background-color: tomato;*/
  border: 5px solid tomato;
  border-right: none;
  border-left: none;
  border-top: none;
  
}
.popup {
    margin-left:auto;
    margin-right:auto;
    /* left: 100%;
    top: 70%;*/
    /*transform: translate(-50%, -50%);*/
    background-color: White;
    color:red;
    text-align:center;
    padding: 30px;
    width:200px;
    height:20px;

    border-radius: 5px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    display: none; 
    /*z-index: 9999;*/ 
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
.popup button {
    background-color: #ffffff;
    color: #4CAF50;
    border: none;
    padding: 10px 20px;
    cursor: pointer;
    border-radius: 5px;
}

.centered-table {
    margin:0 0 0 16%;
    text-align:center;

            
}

.grid-header {
    text-align:center;
    width: 100%;
    background-color: #f2f2f2; 
}

.grid-action {
    text-align: center;
}

.large-textbox {
    width: 120%;
    height: 30px; 
    font-size: 16px;
}
.edit-row-style {
width: 1000px; 
}
.normal-row-style {
height: 30px; 
width: 1500px;
text-align: center;
}
.error {
    color: red;
    font-family: Cambria;
    font-size: 14px;
}
.calendar {
    opacity: 1;
    padding: 6px 37px;
    margin: 10px 0 0 3px;
}
   
.tabcontent {
 /* display: none;*/
  padding: 8px 0;
  /*border: 1px solid #ccc;*/
  /*border-top: none;*/
  margin:0;
}

</style>  
    <title></title>

</head>

<body>
    <form id="form1" runat="server">
    <p class="imgcontainer">
<asp:Image ID="imgAvatar" runat="server" CssClass="avatar" ImageUrl="data:image/png;base64,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" />
<asp:Button ID="btnLogout" runat="server"  style="margin-top:0;width:72px;height:30px;color:aliceblue; border:none; background-color:tomato; border-radius:3px; margin-left:74%;position:absolute;" Text="Log Out"  OnClick="btnLogout_Click" />
<asp:Label style="margin-top:6px;margin-left:80%;position:absolute;font-family:'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;font-size:15px;"> <b>Active User :</b>  <asp:Label ID="lblUserCount" CssClass="user-count" runat="server" Text="0"></asp:Label></asp:Label></p>
<div class="tab">
<asp:Button ID="btnNewRegistration" runat="server" Text="New Registration" CssClass="tablinks tabcontent" style="margin-left:20px;background-color: black;color:white; border-right: none; border-left: none;border-top: none;" OnClick="btnNewRegistration_Click" />
<asp:Button ID="Button2" runat="server" Text="View Registration" CssClass="tablinks tabcontent" style="margin-left:20px;background-color: black;color:white;border: 5px solid tomato; border-right: none; border-left: none;border-top: none;" OnClick="btnViewRegistration_Click" />
<asp:Button ID="Button3" runat="server" Text="Bulk Upload" CssClass="tablinks tabcontent" style="margin-left:20px;background-color: black;color:white; border-right: none; border-left: none;border-top: none;" OnClick="btnbulkupload_Click" />
</div>
      <div id="View Registration" class="tabcontent">
<h2 class="headering">View Registration</h2> 
        
<table class="auto-style1">
    <tr>
        <td>
            <asp:Label style="font-size:15px; margin: 10px 0 30px 53%;"  runat="server" >From Date<b style="color:Tomato;">*</b></asp:Label>
            <asp:Image style="position:absolute;margin: 10px 0 0 0; z-index:-1;" ID="Image1" runat="server" CssClass="avatar" Width="34px"  Height="24px" ImageUrl="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdASK4X58oXh8yRuU9vxCvW7YZZoQ1Y7PcFQ&s" />
            <input type="date" style="opacity:10;padding: 6px 35px;margin: 10px 0 0 3px;" class="calendar" runat="server" id="date1"  onchange="splitDate()"    /> 
            <br /><asp:Label  ID="error11" runat="server" style="margin:1px 0 0 65%;font-family: Cambria;font-size: 14px;" Class="error" ForeColor="Red" ></asp:Label>


        </td>
        <td>
            <asp:Label style="font-size:15px; margin: 10px 0 30px 5%;"  runat="server" >To Date<b style="color:Tomato;">*</b></asp:Label>
            <input type="date" style="opacity:10;padding: 6px 37px;margin: 10px 0 0 3px;" class="calendar" runat="server" id="date2"  onchange="splitDates()" /> 
            <br /><asp:Label  ID="error12" runat="server" style="margin:1px 0 0 14%;font-family: Cambria;font-size: 14px;" Class="error" ForeColor="Red" ></asp:Label>

        </td>
    </tr>
    <tr>
        <td> 
            <asp:Label style="font-size:15px; margin: 30px 0 0 52%;"  runat="server" >&nbsp;First Name</asp:Label>&nbsp;
            <asp:TextBox ID="TextBox14" style="padding: 6px 35px;margin: 1px 0 0 7px;" runat="server"  ></asp:TextBox><br />
        </td>
        <td>
            <asp:Label style="font-size:15px;margin: 30px 0 0 23px;"  runat="server" >Last Name</asp:Label>
            <asp:TextBox style="padding: 6px 35px;margin: 3px 0 0 10px;" ID="TextBox13" runat="server" ></asp:TextBox><br />
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label style="font-size:15px; margin: 30px 0 0 50%;"  runat="server" >&nbsp;Date Of Birth</asp:Label>
            <input type="date" style="opacity:10;padding: 6px 35px;margin: 14px 0 0 10px;" class="calendar" runat="server" id="date3" onchange="splitDatebirth()"   />
            <br /><asp:Label  ID="error13" runat="server" style="margin:1px 0 0 64%;font-family: Cambria;font-size: 14px;" Class="error" ForeColor="Red" ></asp:Label>
            
        </td>
        <td>
            <asp:Label style="font-size:15px;margin: 30px 0 0 5%;"  runat="server" >Country</asp:Label>
            <asp:TextBox ID="TextBox15" style="padding: 6px 35px;margin: 14px 0 0 10px;" runat="server"  ></asp:TextBox>
        </td>
    </tr>
</table>
    <asp:button type="Search" OnClick="btnSearch_Click" runat="server" Text="Search" CssClass="Search-button" id="Button4" style="background-color:tomato;border:none;color:white;border-radius:3px;margin-left:35%;" class="button" Width="75px" Height="25px" />
<div id="resultPopup" style="display: none;" class="popup">
    <span id="popupMessage"></span>
</div><br /><br /><br /><br /><br /><br />
 <div class="centered-table">

        <asp:GridView 
    ID="gridService" 
    runat="server" 
    HeaderStyle-CssClass="grid-header" 
    RowStyle-CssClass="normal-row-style"
    AllowPaging="True"
    PageSize="10"
    AutoGenerateColumns="False"
    OnRowEditing="gridService_RowEditing"
    OnRowUpdating="gridService_RowUpdating"
    OnRowCancelingEdit="gridService_RowCancelingEdit"
    OnRowDataBound="gridService_RowDataBound"
                OnPageIndexChanging="gridService_PageIndexChanging"

    OnRowDeleting="gridService_RowDeleting"
                EditRowStyle-CssClass="edit-row-style" 
>

   

    <Columns>
        <asp:BoundField DataField="First Name"  HeaderText="First Name" ><controlstyle Width="80" ></controlstyle></asp:BoundField> 
        <asp:BoundField DataField="Last Name" HeaderText="Last Name" ><controlstyle Width="80"></controlstyle></asp:BoundField> 
 <asp:TemplateField HeaderText="Gender">
            <ItemTemplate>
                <asp:Label ID="lblGender" runat="server" Text='<%# Eval("Gender") %>'></asp:Label><controlstyle Width="80"></controlstyle>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:DropDownList ID="ddlGender" runat="server">
                    <asp:ListItem Value="Male">Male</asp:ListItem>
                    <asp:ListItem Value="Female">Female</asp:ListItem>
                </asp:DropDownList>
            </EditItemTemplate><controlstyle Width="80"></controlstyle>
        </asp:TemplateField>        
    <asp:BoundField DataField="Date of Birth" HeaderText="Date of Birth" >
            <controlstyle Width="80"></controlstyle>
        </asp:BoundField>
<asp:TemplateField HeaderText="Username">
            <ItemTemplate>
                <span id="usernameLabel"><%# Eval("Username") %></span>
                <asp:TextBox ID="txtUsername" runat="server" Text='<%# Eval("Username") %>' Style="display: none;"></asp:TextBox>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txtEditUsername" runat="server" Text='<%# Bind("Username") %>'></asp:TextBox>
            </EditItemTemplate><controlstyle Width="80"></controlstyle>
        </asp:TemplateField>        <asp:BoundField DataField="Mobile Number" HeaderText="Mobile Number" ><controlstyle Width="80"></controlstyle></asp:BoundField> 
        <asp:BoundField DataField="Address" HeaderText="Address" ><controlstyle Width="80"></controlstyle></asp:BoundField> 
<asp:TemplateField HeaderText="Country">
            <ItemTemplate>
                <asp:Label ID="lblCountry" runat="server" Text='<%# Eval("Country") %>'></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:DropDownList ID="ddlCountry" runat="server"></asp:DropDownList><controlstyle Width="80"></controlstyle>
            </EditItemTemplate><controlstyle Width="80"></controlstyle>
        </asp:TemplateField>
        <asp:BoundField DataField="Email ID" HeaderText="Email ID" ><controlstyle Width="100"></controlstyle></asp:BoundField> 
        
        <asp:CommandField  HeaderText="Action"  ShowEditButton="True" ShowDeleteButton="True" />
    </Columns>
           <EditRowStyle Height="40px" />
</asp:GridView>

        </div>
             <asp:Label ID="lblErrorMessage" runat="server" ForeColor="Red" Visible="False"></asp:Label><br /><br />
   
         <asp:HiddenField ID="hiddenNoDataFound" runat="server" Value="false" /><br /><br />
        <asp:Button ID="btnHidden" runat="server" style="display:none;" OnClientClick="return false;" />

        <div id="noDataPopup" class="popup">
            <p>No data found for the given criteria.</p>
            
        </div>
</div>
    <script type="text/javascript">
        window.onload = function () {
            var noDataFound = document.getElementById('<%= hiddenNoDataFound.ClientID %>').value;

            if (noDataFound === "true") {
                var popup = document.getElementById('noDataPopup');
                if (popup) {
                    popup.style.display = 'block';
                    gridService.display = 'block';
                }
            }
            else {
                popup.style.display = 'none';
            }
        };

        function closePopup() {
            var popup = document.getElementById('noDataPopup');
            if (popup) {
               
            }
        }
    </script>

    <script type="text/javascript">
        function splitDates() {
            var fromDateField = document.getElementById('<%= date1.ClientID %>');

            var dateField = document.getElementById('<%= date2.ClientID %>');
            var errorLabel = document.getElementById('<%= error12.ClientID %>');
            var selectedDate = new Date(dateField.value);
            var currentDate = new Date();

            selectedDate.setHours(23, 59, 59, 999);
            currentDate.setHours(23, 59, 59, 999);
            var fromDate = new Date(fromDateField.value);
            var toDate = new Date(dateField.value);

            fromDate.setHours(0, 0, 0, 0);
            toDate.setHours(0, 0, 0, 0);
            
            
            if (selectedDate > currentDate) {
                errorLabel.innerText = "Future dates are not allowed.";
                dateField.value = "";
            }
            else if (fromDate > toDate) {
                errorLabel.innerText = "From Date should be before or equal to To Date.";
                dateField.value = "";
            }
            else {
                errorLabel.innerText = "";
            }
        }
    </script>
    <script type="text/javascript">


        function splitDate() {
            var dateField = document.getElementById('<%= date1.ClientID %>');
            var errorLabel = document.getElementById('<%= error11.ClientID %>');
            var selectedDate = new Date(dateField.value);
            var currentDate = new Date();
            selectedDate.setHours(23, 59, 59, 999);
            currentDate.setHours(23, 59, 59, 999);
           

            if (selectedDate > currentDate) {
                errorLabel.innerText = "Future dates are not allowed.";
                dateField.value = "";
            }
           
            else {
                errorLabel.innerText = "";
            }
        }
</script>
            <script type="text/javascript">
                function splitDatebirth() {
                    var dateField = document.getElementById('<%= date3.ClientID %>');
            var errorLabel = document.getElementById('<%= error13.ClientID %>');
                    var selectedDate = new Date(dateField.value);
                    var currentDate = new Date();
                    selectedDate.setHours(23, 59, 59, 999);
                    currentDate.setHours(23, 59, 59, 999);

                    if (selectedDate > currentDate) {
                        errorLabel.innerText = "Future dates are not allowed.";
                        dateField.value = "";
                    } else {
                        errorLabel.innerText = "";
                    }
                }
</script>

        <script type="text/javascript">
            function validateDates() {
                var fromDateField = document.getElementById('<%= date1.ClientID %>');
            var toDateField = document.getElementById('<%= date2.ClientID %>');
            var errorLabel = document.getElementById('<%= error12.ClientID %>');
                var fromDate = new Date(fromDateField.value);
                var toDate = new Date(toDateField.value);

                fromDate.setHours(0, 0, 0, 0);
                toDate.setHours(0, 0, 0, 0);

                if (fromDate > toDate) {
                    errorLabel.innerText = "From Date should be before or equal to To Date.";
                    toDateField.value = "";
                } else {
                    errorLabel.innerText = "";
                }
            }
    </script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#<%= gridService.ClientID %>').on('input', 'input', function () {
            var input = $(this);
            var columnIndex = input.closest('td').index();

            if (columnIndex === 0 || columnIndex === 1) {
                var value = input.val().trim();
                input.val(value.replace(/[^a-zA-Z]/g, ''));
            }

            if (columnIndex === 5) {
                var value = input.val().trim();
                input.val(value.replace(/[^0-9]/g, ''));
            }

            if (columnIndex === 8) { 
                var value = input.val().trim();
                var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                if (!emailPattern.test(value)) {
                    input.addClass('invalid-email');
                } else {
                    input.removeClass('invalid-email');
                }
            }
        });
    });
</script>

        <script type="text/javascript">
            function displayPopup(message) {
                var popup = document.getElementById('resultPopup');
                var popupMessage = document.getElementById('popupMessage');

                if (popup && popupMessage) {
                    popupMessage.innerHTML = message;
                    popup.style.display = 'block';
                    setTimeout(function () {
                        popup.style.display = 'none';
                    }, 3000); 
                }

                return false; 
            }
</script>

        <script type="text/javascript">
            document.addEventListener('DOMContentLoaded', function () {
                document.addEventListener('keydown', function (event) {
                    if (event.key === 'Enter') {
                        event.preventDefault();
                        updateData();
                    }
                });
            });

            function updateData() {
                document.getElementById('<%= btnHidden.ClientID %>').click();
            }
</script>
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                var usernameInputs = document.querySelectorAll('input[name*="Username"]');
                usernameInputs.forEach(function (input) {
                    input.readOnly = true; 
                });
            });
</script>

        <script type="text/javascript">
            function toggleEdit(row) {
                var lbl = row.querySelector('#usernameLabel');
                var txt = row.querySelector('#txtUsername');

                lbl.style.display = 'none';
                txt.style.display = 'inline-block';
                txt.focus(); 
            }


</script>

    </form> 
</body>
</html>

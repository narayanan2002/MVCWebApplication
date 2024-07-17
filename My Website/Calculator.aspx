<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Calculator.aspx.cs" Inherits="My_Website.WebForm2" %>


<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <title>ASP.NET Calculator</title>
    <style>
        h1 {
            text-align: center;
            padding: 15px;
            background-color: black;
            color: orangered;
        }

        .clear {
            width: 270px;
            border: 3px solid gray;
            border-radius: 3px;
            padding: 4px;
            background-color: red;
            color:aqua;
        }

        .formstyle {
            width: 300px;
            height: 600px;
            margin: auto;
            border: 5px solid red;
            border-radius: 5px;
            padding: 20px;
        }

        input {
            width: 20px;
            background-color: yellow;
            color: green;
            border: 3px solid gray;
            border-radius: 5px;
            padding: 26px;
            margin: 5px;
            text-align:center;
            font-size: 25px;
        }

        .calc {
            width: 230px;
            border: 5px solid black;
            border-radius: 3px;
            padding: 20px;
            margin: auto;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Calculator in NNLI</h1>
            <div class="formstyle">
<asp:TextBox ID="txtDisplay" runat="server" CssClass="calc" ReadOnly="true"></asp:TextBox>
                <br /><br />
                <asp:Button ID="btn1" runat="server" Text="1" OnClick="Button_Click" />
                <asp:Button ID="btn2" runat="server" Text="2" OnClick="Button_Click" />
                <asp:Button ID="btn3" runat="server" Text="3" OnClick="Button_Click" />
                <asp:Button ID="btnAdd" runat="server" Text="+" OnClick="Button_Click" />
                <br /><br />
                <asp:Button ID="btn4" runat="server" Text="4" OnClick="Button_Click" />
                <asp:Button ID="btn5" runat="server" Text="5" OnClick="Button_Click" />
                <asp:Button ID="btn6" runat="server" Text="6" OnClick="Button_Click" />
                <asp:Button ID="btnSubtract" runat="server" Text="-" OnClick="Button_Click" />
                <br /><br />
                <asp:Button ID="btn7" runat="server" Text="7" OnClick="Button_Click" />
                <asp:Button ID="btn8" runat="server" Text="8" OnClick="Button_Click" />
                <asp:Button ID="btn9" runat="server" Text="9" OnClick="Button_Click" />
                <asp:Button ID="btnMultiply" runat="server" Text="*" OnClick="Button_Click" />
                <br /><br />
                <asp:Button ID="btnDivide" runat="server" Text="/" OnClick="Button_Click" />
                <asp:Button ID="btn0" runat="server" Text="0" OnClick="Button_Click" />
                <asp:Button ID="btnDecimal" runat="server" Text="." OnClick="Button_Click" />
                <asp:Button ID="btnEqual" runat="server" Text="=" OnClick="btnEqual_Click" />
                <br />
                <asp:Button ID="btnClear" runat="server" Text="Clear All" CssClass="clear" OnClick="btnClear_Click" />
            </div>
        </div>
        <script type="text/javascript">
        function handleKeyPress(event) {
            var key = event.key;
            var display = document.getElementById('<%= txtDisplay.ClientID %>');
            
            if (key >= '0' && key <= '9' || key === '+' || key === '-' || key === '*' || key === '/' || key === '.') {
                display.value += key;
            } else if (key === 'Enter' || key === '=') {
                try {
                    display.value = eval(display.value);
                } catch (e) {
                    display.value = 'Error';
                }

            } else if (key === 'Escape') {
                display.value = '';
            }
        }

        document.addEventListener('DOMContentLoaded', function () {
            document.addEventListener('keydown', handleKeyPress);
        });
    </script>
    </form>
</body>
</html>

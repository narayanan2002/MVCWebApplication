<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="biodata.aspx.cs" Inherits="My_Website.WebForm1" %>

<%--<%--<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm.aspx.cs" Inherits="WebApplication1.WebForm" %>--%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login page in HTML</title>
    <Style>
body 
{
  font-family:sans-serif; 
  background: -webkit-linear-gradient(to right, #155799, #159957);  
  /*background: linear-gradient(to right, #155799, #159957);*/ 
  background-image: url("https://img.pikbest.com/wp/202346/hi-tech-background-futuristic-in-red-neon-square-created-with-3d-rendering_9633449.jpg!w700wp");
  color:whitesmoke;
}


h1{
    text-align: center;
}


form{
    width:20rem;
    margin: auto;
    color:whitesmoke;
    backdrop-filter: blur(16px) saturate(180%);
    -webkit-backdrop-filter: blur(16px) saturate(180%);
    background-color: rgba(11, 15, 13, 0.582);
    border-radius: 12px;
    border: 1px solid rgba(255, 255, 255, 0.125);
    padding: 10px 5px;
    margin-left:60%;

}

input[type=text], input[type=password]{
    width: 100%;
    margin: 10px 0;
    border-radius: 5px;
    padding: 15px 18px;
    box-sizing: border-box;
  }

button {
    background-color: #030804;
    color: white;
    padding: 14px 20px;
    border-radius: 5px;
    margin: 7px 0;
    width: 100%;
    font-size: 18px;
  }

button:hover {
    opacity: 0.6;
    cursor: pointer;
}

.headingsContainer{
    text-align: center;
}

.headingsContainer p{
    color: gray;
}
.mainContainer{
    padding: 16px;
}


.subcontainer{
    display: flex;
    flex-direction: row;
    align-items: center;
    justify-content: space-between;
}

.subcontainer a{
    font-size: 16px;
    margin-bottom: 12px;
}

span.forgotpsd a {
    float: right;
    color: whitesmoke;
    padding-top: 16px;
  }

.forgotpsd a{
    color: rgb(74, 146, 235);
  }
  
.forgotpsd a:link{
    text-decoration: none;
  }

  .register{
    color: white;
    text-align: center;
  }
  
  .register a{
    color: rgb(74, 146, 235);
  }
  
  .register a:link{
    text-decoration: none;
  }

  @media screen and (max-width: 600px) {
    form{
      width: 25rem;
    }
  }
  
  @media screen and (max-width: 400px) {
    form{
      width: 20rem;
    }
  }


    </Style>
</head>
<body>
    <br /><br /><br /><br />    <br /><br /><br /><br />

    <form action="">

        <div class="headingsContainer">
            <h3>Sign in</h3>
            <p></p>
        </div>

        <div class="mainContainer">
            <label for="username">Your username</label>
            <input type="text" placeholder="Enter Username" name="username" required>

            <br><br>

            <label for="pswrd">Your password</label>
            <input type="password" placeholder="Enter Password" name="pswrd" required>

            <div class="subcontainer">
                <label>
                  <input type="checkbox" checked="checked" name="remember"> Remember me
                </label>
            </div>


            <button type="submit">Login</button>


        </div>

    </form>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.GameNumber" %>

<%
	// initialize the numbers
	int minimum = 0;
	int maximum = 1000;
	
	GameNumber target = new GameNumber();
	target.setRandom(minimum,maximum);
	
	GameNumber guesses = new GameNumber(0);
	GameNumber guessMin = new GameNumber(minimum);
	GameNumber guessMax = new GameNumber(maximum);

	session.setAttribute("target", target);
	session.setAttribute("guesses", guesses);
	session.setAttribute("guessMin", guessMin);
	session.setAttribute("guessMax", guessMax);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Guessing Game - MVC Version</title>

<style>
    *{
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }
    
    body{
        padding: 6.5em 2em 0 2em;
        font-family: Verdana, Geneva, Tahoma, sans-serif;
        font-weight: bold;
        color: #fff;
        display: flex;
        justify-content: center;
        align-items: center;
        text-align: center;
        background: #ecb755;
    }
    
    p{
       color: #fff; 
       margin-bottom: 1em
    }
    
    .info_div{
        text-align: left;
        width: 340px;
        padding: 3em;
        margin-right: 5em;
    }
    
    .data_div{
        padding: 3em 4em;
        text-align: left;
    }
    
    .info_div h1{
        font-size: 1.8em;
    }
    
    .data_div p{
        font-size: 1.8em;
    }
    
    .data_div, .info_div {
        height: 300px;
        display: flex;
        flex-direction: column;
        justify-content: center;
        border-radius: 50px;
background: linear-gradient(145deg, #fdc45b, #d4a54d);
box-shadow:  16px 16px 32px #c99c48, 
             -16px -16px 32px #ffd262;
    }
    
    form{
        display: flex;
    }
    
    input[type="number"]{
        padding: 20px 24px;
        border-radius: 24px;
        border: none;
        outline: none;
        margin-right: 2em;
        border-radius: 18px;
background: #ecb755;
box-shadow: inset 10px 10px 20px #c99c48, 
            inset -10px -10px 20px #ffd262;
            color: #fff;
            font-weight: bold;
    }
    
    input[type="number"]::placeholder{
        font-size: 1.2em;
        color: #fff;
    }
    
    input[type="submit"]{
        padding: 20px 24px;
        border-radius: 18px;
        outline: none;
        border: none;
background: linear-gradient(145deg, #fdc45b, #d4a54d);
box-shadow:  10px 10px 20px #c99c48, 
             -10px -10px 20px #ffd262;
font-size: 1em;
color: #fff;
font-weight: bold;
cursor: pointer;
transition: all 1s ease;
    }
    
    input[type="submit"]:hover{
        border-radius: 18px;
background: #ecb755;
box-shadow: inset 10px 10px 20px #c99c48, 
            inset -10px -10px 20px #ffd262;
    }
    
    h1{
        margin-bottom: 1em;
    }
</style>
</head>
<body>
    <div class="info_div">
        <h1>Guessing Game - MVC Version</h1>
    <p>Welcome to our guessing game!</p>
    </div>
    <div class="data_div">
	
	<p>Guess a number<br>between <%= minimum %> and <%= maximum %></p>.
	<form name="guessForm" action="doGuess" method="post">
		<table>
			<tr>
                                <td><input type="number" name="guess" placeholder="what's your guess..."></td>
			</tr>
		</table>
		<table>
			<tr>
				<td><input type="submit" value="Guess"></td>
			</tr>
		</table>
	</form>
    </div>
</body>
</html>

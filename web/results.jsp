<%-- 
    Document   : results
    Created on : Sep 25, 2017, 4:31:32 PM
    Author     : mattbentley
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Results Page</title>
        
        <link rel="stylesheet" type="text/css" href="zztyle.css"/>
    </head>
    
    <%
       Double totalhoursworked = Double.parseDouble(request.getParameter("time"));
       Double hourlyrate = Double.parseDouble(request.getParameter("hourly"));
       Double pretaxd = Double.parseDouble(request.getParameter("prtdeduct"));   
       Double posttaxd = Double.parseDouble(request.getParameter("pstdeduct"));
       Double othoursworked = 0.0;
       Double grosspay;
       Double othourlyrate = 0.0;
       Double otpay;
       Double regpay;
       Double pretaxpay;
       Double taxamt;
       Double posttaxpay;
       Double netpay;
       
       if(totalhoursworked>40){
           othoursworked = totalhoursworked - 40;
           othourlyrate = hourlyrate*1.5;
           otpay = othourlyrate*othoursworked;
           regpay = 40*hourlyrate;
           grosspay = otpay+regpay;
       }
       else
           grosspay = totalhoursworked*hourlyrate;
       
       pretaxpay = grosspay - pretaxd;
       
       if(grosspay < 500)
           taxamt = pretaxpay *.18;
       else
           taxamt = pretaxpay * .22;
       
       posttaxpay = pretaxpay - taxamt;
       netpay = posttaxpay - posttaxd;
    %>    
    
    <body>
        <h1>Information about Salary</h1>
        <hr>
        
        <div class="buttons">
        <table>
            <tbody>
                <table >
                
                    <tr>
                        <td>Total Hours Worked:</td>
                        <td><%=totalhoursworked%></td>
                    </tr>
                    
                    <tr>
                        <td>Hourly Rate: <hr></td>
                        <td><%=hourlyrate%><hr></td> 
                    </tr>
                   
                    <tr>
                        <td>Overtime Hours Worked:</td>
                        <td><%=othoursworked%></td>
                    </tr>
                    
                    <tr>
                        <td>Overtime Hourly Rate:<hr></td>
                        <td><%=othourlyrate%><hr></td>
                    </tr>
                    <tr>
                        <td>Gross Pay:<hr><hr></td>
                        <td><%=grosspay%><hr><hr></td>
                    </tr>
                    
                    <tr>
                        <td>Pre-Tax Deduction:</td>
                        <td><%=-pretaxd%></td>
                    </tr>
                    
                    <tr>
                        <td>Pre-Tax Pay:<hr><hr></td>
                        <td><%=pretaxpay%><hr><hr></td>
                    </tr>
                    
                    <tr>
                        <td>Tax Amount Deducted:</td>
                        <td><%=-taxamt%></td>
                    </tr>
                    <tr>
                        <td>Post-Tax Pay:<hr><hr></td>
                        <td><%=posttaxpay%><hr><hr></td>
                    </tr>
                    
                    <tr>
                        <td>Post-Tax Deduction:<hr></td>
                        <td><%=-posttaxd%><hr></td>
                    </tr>
                    
                    <tr>
                        <td>Net Pay:<hr><hr></td>
                        <td><%=netpay%><hr><hr></td>
                        
                    </tr>
                    
            </tbody>
        </table>
        </div>
        
        <div class="buttons"> 
        <a href="index.jsp">Back to Start</a>
        </div>
    </body>
</html>

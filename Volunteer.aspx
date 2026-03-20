<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Volunteer.aspx.cs" Inherits="StrayCare6._0.Volunteer" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Volunteer Events</title>
    <style>
        body {
            font-family: Arial, 'Segoe UI', sans-serif;
            background-color: #FFFEF6;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 1100px;
            margin: 30px auto;
            background: white;
            padding: 25px;
            border-radius: 18px;
        }

        h1 {
            margin-top: 0;
        }

        .event-grid {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
        }

        .event-card {
            width: 300px;
            background: #f8f7f2;
            border-radius: 14px;
            padding: 18px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.08);
        }

        .status-open {
            color: green;
            font-weight: bold;
        }

        .status-closed {
            color: red;
            font-weight: bold;
        }

        .btn {
            display: inline-block;
            margin-top: 12px;
            padding: 10px 18px;
            background-color: #D3D3FF;
            border: none;
            border-radius: 10px;
            text-decoration: none;
            color: #222;
            font-weight: bold;
            cursor: pointer;
        }

        .btn.disabled {
            background-color: #ddd;
            pointer-events: none;
        }
    </style>
</head>
<body>
<form id="form1" runat="server">
    <div class="container">
        <h1>Join as a Volunteer</h1>

        <asp:Repeater ID="rptEvents" runat="server">
            <HeaderTemplate>
                <div class="event-grid">
            </HeaderTemplate>
            <ItemTemplate>
                <div class="event-card">
                    <h3><%# Eval("EventTitle") %></h3>
                    <p><b>Location:</b> <%# Eval("Location") %></p>
                    <p><b>Time:</b> <%# Eval("EventTime", "{0:MMMM dd, yyyy hh:mm tt}") %></p>
                    <p><b>Participants:</b> <%# Eval("CurrentParticipants") %> / <%# Eval("MaxParticipants") %></p>
                    <p>
                        <b>Status:</b>
                        <span class='<%# Eval("Status").ToString() == "Open" ? "status-open" : "status-closed" %>'>
                            <%# Eval("Status") %>
                        </span>
                    </p>

                    <a href='VolunteerApply.aspx?eventId=<%# Eval("EventId") %>'
                       class='btn <%# Eval("Status").ToString() == "Closed" ? "disabled" : "" %>'>
                        Join Event
                    </a>
                </div>
            </ItemTemplate>
            <FooterTemplate>
                </div>
            </FooterTemplate>
        </asp:Repeater>
    </div>
</form>
</body>
</html>


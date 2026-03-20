<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReportStray.aspx.cs" Inherits="StrayCare6._0.ReportStray" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>StrayCare - Report a Stray Animal</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, 'Segoe UI', sans-serif;
            background-color: #FFFEF6;
            color: #222;
        }

        .topbar {
            background-color: #D3D3FF;
            padding: 18px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .brand {
            font-size: 28px;
            font-weight: 800;
        }

        .back-link a {
            text-decoration: none;
            color: #222;
            font-weight: 700;
        }

        .container {
            max-width: 900px;
            margin: 30px auto;
            background: #fff;
            border-radius: 18px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.08);
            padding: 30px;
            box-sizing: border-box;
        }

        h1 {
            margin-top: 0;
            margin-bottom: 10px;
            font-size: 34px;
        }

        .note-box {
            background-color: #D3D3FF;
            border-radius: 12px;
            padding: 14px 18px;
            margin-bottom: 22px;
            line-height: 1.6;
        }

        .message-label {
            display: block;
            min-height: 24px;
            margin-bottom: 14px;
            color: red;
            font-weight: 700;
        }

        .success {
            color: green;
        }

        .grid {
            display: grid;
            grid-template-columns: 220px 1fr;
            gap: 14px 18px;
            align-items: start;
        }

        .label {
            font-weight: 700;
            padding-top: 10px;
        }

        .input,
        .textarea,
        .dropdown,
        .radio-wrap,
        .file-wrap {
            width: 100%;
        }

        .textbox, .dropdownlist, .textarea-box {
            width: 100%;
            padding: 12px 14px;
            border-radius: 12px;
            border: 1px solid #ccc;
            box-sizing: border-box;
            background-color: #f8f7f2;
            font-size: 14px;
        }

        .textarea-box {
            min-height: 100px;
            resize: vertical;
        }

        .small-note {
            font-size: 12px;
            color: #666;
            margin-top: 6px;
            line-height: 1.5;
        }

        .radio-panel {
            background: #f8f7f2;
            border: 1px solid #ddd;
            border-radius: 12px;
            padding: 12px 14px;
        }

        .section-title {
            margin-top: 30px;
            margin-bottom: 14px;
            font-size: 22px;
            font-weight: 800;
        }

        .kept-panel {
            margin-top: 10px;
            padding: 18px;
            background: #f8f7f2;
            border-radius: 14px;
            border: 1px solid #ddd;
        }

        .btn-row {
            margin-top: 26px;
            text-align: right;
        }

        .btn {
            padding: 12px 22px;
            border-radius: 12px;
            border: 1px solid #8f8f8f;
            background-color: #D3D3FF;
            font-weight: 800;
            cursor: pointer;
            margin-left: 10px;
        }

        .btn:hover {
            background-color: #c2c2ff;
        }

        @media screen and (max-width: 768px) {
            .grid {
                grid-template-columns: 1fr;
            }

            .label {
                padding-top: 0;
            }

            .btn-row {
                text-align: center;
            }
        }
    </style>

    <script type="text/javascript">
        function toggleKeptPanel() {
            var keptYes = document.getElementById('<%= rblKept.ClientID %>_0');
            var panel = document.getElementById('keptPanel');

            if (keptYes && keptYes.checked) {
                panel.style.display = 'block';
            } else {
                panel.style.display = 'none';
            }
        }
    </script>
</head>
<body onload="toggleKeptPanel()">
    <form id="form2" runat="server">
        <div class="topbar">
            <div class="brand">StrayCare - Report a Stray Animal</div>
            <div class="back-link">
                <a href="Dashboard.aspx">← Back to Dashboard</a>
            </div>
        </div>

        <div class="container">
            <h1>Report a Stray Animal</h1>

            <div class="note-box">
                We only accept reports of <b>puspin cats</b> and <b>aspin dogs</b>.  
                Rescue operations are only for <b>Calamba City, Laguna</b>.  
                Please provide a <b>complete address with a landmark</b> and upload a <b>clear photo</b> for accurate rescue operations.
            </div>

            <asp:Label ID="lblMessage" runat="server" CssClass="message-label"></asp:Label>

            <div class="grid">
                <div class="label">Animal Type *</div>
                <div class="input">
                    <asp:DropDownList ID="ddlAnimalType" runat="server" CssClass="dropdownlist">
                        <asp:ListItem Text="-- Select Animal Type --" Value=""></asp:ListItem>
                        <asp:ListItem Text="Dog (Aspin)" Value="Dog"></asp:ListItem>
                        <asp:ListItem Text="Cat (Puspin)" Value="Cat"></asp:ListItem>
                    </asp:DropDownList>
                    <div class="small-note">Only dog and cat reports are accepted.</div>
                </div>

                <div class="label">Gender *</div>
                <div class="input">
                    <asp:DropDownList ID="ddlGender" runat="server" CssClass="dropdownlist">
                        <asp:ListItem Text="-- Select Gender --" Value=""></asp:ListItem>
                        <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                        <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
                        <asp:ListItem Text="Unknown" Value="Unknown"></asp:ListItem>
                    </asp:DropDownList>
                    <div class="small-note">Choose Unknown if you cannot identify the animal’s sex.</div>
                </div>

                <div class="label">Location *</div>
                <div class="input">
                    <asp:TextBox ID="txtLocation" runat="server" CssClass="textbox"
                        placeholder="Complete address with landmark"></asp:TextBox>
                    <div class="small-note">
                        Must be a complete address in Calamba City, Laguna. Landmark is required.
                    </div>
                </div>

                <div class="label">Date and Time *</div>
                <div class="input">
                    <asp:TextBox ID="txtDateTime" runat="server" TextMode="DateTimeLocal" CssClass="textbox"></asp:TextBox>
                    <div class="small-note">Required for accurate rescue operations.</div>
                </div>

                <div class="label">Other Details *</div>
                <div class="input">
                    <asp:DropDownList ID="ddlCondition" runat="server" CssClass="dropdownlist">
                        <asp:ListItem Text="-- Select Condition --" Value=""></asp:ListItem>
                        <asp:ListItem Text="Healthy" Value="Healthy"></asp:ListItem>
                        <asp:ListItem Text="Injured" Value="Injured"></asp:ListItem>
                        <asp:ListItem Text="Sick" Value="Sick"></asp:ListItem>
                        <asp:ListItem Text="Others" Value="Others"></asp:ListItem>
                    </asp:DropDownList>
                </div>

                <div class="label">Condition Notes</div>
                <div class="input">
                    <asp:TextBox ID="txtOtherDetails" runat="server" TextMode="MultiLine" CssClass="textarea-box"
                        placeholder="Add more details especially if the animal is injured, sick, or needs urgent rescue."></asp:TextBox>
                </div>

                <div class="label">Upload Photo *</div>
                <div class="file-wrap">
                    <asp:FileUpload ID="fuPhoto" runat="server" />
                    <div class="small-note">A clear photo will help us rescue them accurately.</div>
                </div>
            </div>

            <div class="section-title">Did you keep it or just report?</div>

            <div class="radio-panel">
                <asp:RadioButtonList ID="rblKept" runat="server" RepeatDirection="Horizontal" onclick="toggleKeptPanel()">
                    <asp:ListItem Text="I kept the stray" Value="Kept"></asp:ListItem>
                    <asp:ListItem Text="I just reported the stray" Value="Reported" Selected="True"></asp:ListItem>
                </asp:RadioButtonList>
            </div>

            <div id="keptPanel" class="kept-panel" style="display:none;">
                <div class="section-title" style="margin-top:0;">If Kept - Required Information</div>

                <div class="grid">
                    <div class="label">Full Name *</div>
                    <div class="input">
                        <asp:TextBox ID="txtFullName" runat="server" CssClass="textbox" placeholder="Your full name"></asp:TextBox>
                    </div>

                    <div class="label">Full Address *</div>
                    <div class="input">
                        <asp:TextBox ID="txtFullAddress" runat="server" TextMode="MultiLine" CssClass="textarea-box"
                            placeholder="Your full address"></asp:TextBox>
                    </div>
                </div>
            </div>

            <div class="btn-row">
                <asp:Button ID="btnSubmit" runat="server" Text="Submit Report" CssClass="btn" OnClick="btnSubmit_Click" />
            </div>
        </div>
    </form>
</body>
</html>
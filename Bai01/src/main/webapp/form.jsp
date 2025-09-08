<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Student Registration Form</title>
        <style>
            /* RESET & BASE */
            * {
                box-sizing: border-box;
                margin: 0;
                padding: 0;
            }

            body {
                background: linear-gradient(135deg, #74ebd5, #ACB6E5);
                font-family: 'Segoe UI', sans-serif;
                min-height: 100vh;
                display: flex;
                justify-content: center;
                align-items: center;
                padding: 30px 0;
            }

            /* FORM CONTAINER */
            form {
                background-color: #ffffff;
                border-radius: 15px;
                padding: 30px 40px;
                width: 95%;
                max-width: 1100px;
                box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15);
                animation: fadeIn 1s ease;
            }

            /* HEADINGS */
            h2 {
                text-align: center;
                margin-bottom: 25px;
                color: #333;
            }

            /* LABELS & INPUT FIELDS */
            label {
                display: inline-block;
                width: 150px;
                vertical-align: top;
                font-weight: bold;
                margin-bottom: 10px;
            }

            input[type="text"],
            input[type="email"],
            input[type="number"],
            select,
            textarea {
                width: calc(100% - 160px);
                padding: 10px;
                margin-bottom: 15px;
                border: 1px solid #ccc;
                border-radius: 6px;
                transition: all 0.3s ease;
            }

            input:focus,
            select:focus,
            textarea:focus {
                border-color: #6c63ff;
                outline: none;
                box-shadow: 0 0 5px rgba(108, 99, 255, 0.3);
            }

            /* FORM ROWS */
            .form-row {
                display: flex;
                align-items: center;
                margin-bottom: 15px;
            }

            .form-row label {
                width: 150px;
            }

            /* DATE OF BIRTH */
            .dob-group {
                display: flex;
                gap: 10px;
            }

            .dob-group select {
                flex: 1;
            }

            /* GENDER & HOBBIES */
            .gender,
            .hobbies {
                padding-left: 150px;
                margin-bottom: 15px;
            }

            /* HOBBIES (formatted on one line with style) */
            .hobbies-row {
                align-items: flex-start;
            }

            .hobbies {
                display: flex;
                flex-wrap: nowrap;
                gap: 15px;
                overflow-x: auto;
                align-items: center;
            }

            .checkbox-label {
                display: flex;
                align-items: center;
                gap: 5px;
                background-color: #f2f2f2;
                padding: 6px 10px;
                border-radius: 20px;
                border: 1px solid #ccc;
                transition: background 0.3s ease;
                white-space: nowrap;
                font-size: 14px;
            }

            .checkbox-label:hover {
                background-color: #e0e0e0;
            }

            input[type="checkbox"] {
                transform: scale(1.2);
                cursor: pointer;
            }

            .other-hobby-input {
                width: 150px;
                padding: 6px 10px;
                border-radius: 6px;
                border: 1px solid #ccc;
                transition: border-color 0.3s ease, box-shadow 0.3s ease;
            }

            .other-hobby-input:focus {
                border-color: #6c63ff;
                box-shadow: 0 0 5px rgba(108, 99, 255, 0.4);
                outline: none;
            }

            /* QUALIFICATION TABLE */
            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 15px;
                animation: slideInUp 0.6s ease-in-out;
            }

            table, th, td {
                border: 1px solid #ddd;
            }

            th {
                background-color: #6c63ff;
                color: white;
            }

            th, td {
                padding: 10px;
                text-align: center;
            }

            /* RADIO & CHECKBOX BASE STYLING */
            input[type="radio"],
            input[type="checkbox"] {
                margin-right: 8px;
            }

            /* SUBMIT BUTTONS */
            .submit-buttons {
                text-align: center;
                margin-top: 25px;
            }

            .submit-buttons input[type="submit"],
            .submit-buttons input[type="reset"] {
                padding: 10px 25px;
                font-size: 16px;
                margin: 0 10px;
                border: none;
                border-radius: 25px;
                background: #6c63ff;
                color: white;
                cursor: pointer;
                transition: background 0.3s ease, transform 0.2s;
            }

            .submit-buttons input[type="submit"]:hover,
            .submit-buttons input[type="reset"]:hover {
                background: #5548e0;
                transform: translateY(-2px);
            }

            /* ANIMATIONS */
            @keyframes fadeIn {
                from {
                    opacity: 0;
                    transform: scale(0.95);
                }
                to {
                    opacity: 1;
                    transform: scale(1);
                }
            }

            @keyframes slideInUp {
                from {
                    transform: translateY(20px);
                    opacity: 0;
                }
                to {
                    transform: translateY(0);
                    opacity: 1;
                }
            }

            /* RESPONSIVE STYLES */
            @media screen and (max-width: 768px) {
                label {
                    width: 100%;
                    margin-bottom: 5px;
                }

                input[type="text"],
                input[type="email"],
                input[type="number"],
                select,
                textarea {
                    width: 100%;
                }

                .dob-group {
                    flex-direction: column;
                }

                .form-row {
                    flex-direction: column;
                    align-items: flex-start;
                }

                .gender,
                .hobbies {
                    padding-left: 0;
                }

                .hobbies {
                    flex-wrap: wrap;
                    overflow-x: visible;
                }
            }


        </style>
    </head>
    <body>
        <form action="registration-form" name="formDangKy" method="GET">
            <h2>Student Registration Form</h2>

            <label>First name:</label>
            <input type="text" name="firstName" maxlength="30"/><br/>

            <label>Last name:</label>
            <input type="text" name="lastName" maxlength="30"/><br/>

            <div style="display: flex">
                <label>Date of birth:</label>
                <div class="dob-group">
                    <select name="dobDay">
                        <option>Day</option>
                        <% for (int i = 1; i <= 31; i++) { %>
                        <option><%= i %>
                        </option>
                        <% } %>
                    </select>

                    <select name="dobMonth" style="width: 100px">
                        <option>Month</option>
                        <%
                            String[] months = {"Jan", "Feb", "Mar", "Apr", "May", "Jun",
                                    "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"};
                            for (String m : months) {
                        %>
                        <option><%= m %>
                        </option>
                        <% } %>
                    </select>

                    <select name="dobYear">
                        <option>Year</option>
                        <% for (int i = 1980; i <= 2025; i++) { %>
                        <option><%= i %>
                        </option>
                        <% } %>
                    </select>
                </div>
            </div>
            <br/>

            <label>Email:</label>
            <input type="email" name="email"/><br/>

            <label>Mobile number:</label>
            <input type="text" name="mobile" maxlength="10"/><br/>

            <label>Gender:</label>
            <div class="gender">
                <input type="radio" name="gender" value="Male"/> Male
                <input type="radio" name="gender" value="Female"/> Female
            </div>

            <label>Address:</label>
            <textarea name="address" rows="3" cols="40"></textarea><br/>

            <label>City:</label>
            <input type="text" name="city" maxlength="30"/><br/>

            <label>Pin code:</label>
            <input type="text" name="pincode" maxlength="6"/><br/>

            <label>State:</label>
            <input type="text" name="state" maxlength="30"/><br/>

            <label>Country:</label>
            <input type="text" name="country" value="India" readonly/><br/>

            <div class="form-row">
                <label>Hobbies:</label>
                <div class="hobbies">
                    <input type="checkbox" name="hobby" value="Drawing"/> Drawing
                    <input type="checkbox" name="hobby" value="Singing"/> Singing
                    <input type="checkbox" name="hobby" value="Dancing"/> Dancing
                    <input type="checkbox" name="hobby" value="Sketching"/> Sketching
                    <input type="checkbox" name="hobby" value="Others"/> Others:
                    <input type="text" name="otherHobby" style="width: 120px;"/>
                </div>
            </div>

            <label>Qualification:</label><br/>
            <table>
                <tr>
                    <th>Sl.No</th>
                    <th>Examination</th>
                    <th>Board</th>
                    <th>Percentage</th>
                    <th>Year of Passing</th>
                </tr>
                <tr>
                    <td>1</td>
                    <td>Class X</td>
                    <td><input type="text" name="boardX" maxlength="10"/></td>
                    <td><input type="text" name="percentX" maxlength="5"/></td>
                    <td><input type="text" name="yearX" maxlength="4"/></td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>Class XII</td>
                    <td><input type="text" name="boardXII" maxlength="10"/></td>

                    <td><input type="text" name="percentXII" maxlength="5"/></td>
                    <td><input type="text" name="yearXII" maxlength="4"/></td>
                </tr>
                <tr>
                    <td>3</td>
                    <td>Graduation</td>
                    <td><input type="text" name="boardGrad" maxlength="10"/></td>
                    <td><input type="text" name="percentGrad" maxlength="5"/></td>
                    <td><input type="text" name="yearGrad" maxlength="4"/></td>
                </tr>
                <tr>
                    <td>4</td>
                    <td>Masters</td>
                    <td><input type="text" name="boardMasters" maxlength="10"/></td>
                    <td><input type="text" name="percentMasters" maxlength="5"/></td>
                    <td><input type="text" name="yearMasters" maxlength="4"/></td>
                </tr>
            </table>

            <br/>

            <label>Course applies for:</label>
            <div class="gender">
                <input type="radio" name="course" value="BCA"/> BCA
                <input type="radio" name="course" value="B.Com"/> B.Com
                <input type="radio" name="course" value="B.Sc"/> B.Sc
                <input type="radio" name="course" value="B.A"/> B.A
            </div>

            <div class="submit-buttons">
                <input type="submit" value="Submit"/>
                <input type="reset" value="Reset"/>
            </div>
        </form>
    </body>
</html>

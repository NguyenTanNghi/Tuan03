<%--
  Created by IntelliJ IDEA.
  User: NguyenTanNghi
  Date: 9/5/2025
  Time: 8:10 PM
  Enhanced with beautiful animations and colors
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="iuh.fit.se.tuan03.bai01.model.Student" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Registration Result</title>
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            body {
                font-family: 'Inter', 'Segoe UI', sans-serif;
                background: linear-gradient(135deg, #667eea 0%, #764ba2 25%, #f093fb 50%, #f5576c 75%, #4facfe 100%);
                background-size: 400% 400%;
                animation: gradientShift 15s ease infinite;
                display: flex;
                justify-content: center;
                align-items: center;
                min-height: 100vh;
                overflow-x: hidden;
                position: relative;
            }

            /* Floating particles background */
            body::before {
                content: '';
                position: absolute;
                width: 100%;
                height: 100%;
                background: radial-gradient(circle, rgba(255,255,255,0.1) 1px, transparent 1px);
                background-size: 50px 50px;
                animation: floatParticles 20s linear infinite;
                z-index: 1;
            }

            .main-container {
                position: relative;
                z-index: 10;
                width: 100%;
                max-width: 1000px;
                margin: 0 20px;
            }

            .card {
                background: rgba(255, 255, 255, 0.95);
                backdrop-filter: blur(20px);
                border: 1px solid rgba(255, 255, 255, 0.2);
                padding: 50px;
                border-radius: 30px;
                box-shadow:
                        0 25px 50px rgba(0,0,0,0.15),
                        0 10px 30px rgba(0,0,0,0.1),
                        inset 0 1px 0 rgba(255,255,255,0.6);
                animation: cardEntrance 1.2s cubic-bezier(0.34, 1.56, 0.64, 1);
                position: relative;
                overflow: hidden;
            }

            .card::before {
                content: '';
                position: absolute;
                top: -50%;
                left: -50%;
                width: 200%;
                height: 200%;
                background: conic-gradient(from 0deg, transparent, rgba(164, 69, 178, 0.1), transparent, rgba(37, 117, 252, 0.1), transparent);
                animation: rotateGlow 8s linear infinite;
                z-index: -1;
            }

            .header {
                text-align: center;
                margin-bottom: 40px;
                position: relative;
            }

            .header h2 {
                font-size: 36px;
                font-weight: 800;
                background: linear-gradient(135deg, #667eea, #764ba2, #f093fb);
                -webkit-background-clip: text;
                -webkit-text-fill-color: transparent;
                background-clip: text;
                margin-bottom: 10px;
                animation: titleGlow 3s ease-in-out infinite alternate;
                text-shadow: 0 0 30px rgba(102, 126, 234, 0.3);
            }

            .subtitle {
                color: #6b7280;
                font-size: 16px;
                font-weight: 500;
                opacity: 0;
                animation: fadeInUp 1s ease 0.5s forwards;
            }

            .grid {
                display: grid;
                grid-template-columns: repeat(auto-fit, minmax(400px, 1fr));
                gap: 25px;
            }

            .detail {
                background: linear-gradient(135deg, rgba(255,255,255,0.9), rgba(255,255,255,0.7));
                backdrop-filter: blur(10px);
                border-radius: 20px;
                padding: 25px;
                border: 1px solid rgba(255, 255, 255, 0.3);
                box-shadow:
                        0 10px 25px rgba(0,0,0,0.08),
                        inset 0 1px 0 rgba(255,255,255,0.6);
                transition: all 0.4s cubic-bezier(0.34, 1.56, 0.64, 1);
                position: relative;
                overflow: hidden;
                opacity: 0;
                transform: translateY(30px) scale(0.9);
                animation: detailEntrance 0.8s cubic-bezier(0.34, 1.56, 0.64, 1) forwards;
            }

            .detail:nth-child(1) { animation-delay: 0.1s; }
            .detail:nth-child(2) { animation-delay: 0.2s; }
            .detail:nth-child(3) { animation-delay: 0.3s; }
            .detail:nth-child(4) { animation-delay: 0.4s; }
            .detail:nth-child(5) { animation-delay: 0.5s; }
            .detail:nth-child(6) { animation-delay: 0.6s; }
            .detail:nth-child(7) { animation-delay: 0.7s; }
            .detail:nth-child(8) { animation-delay: 0.8s; }
            .detail:nth-child(9) { animation-delay: 0.9s; }
            .detail:nth-child(10) { animation-delay: 1.0s; }
            .detail:nth-child(11) { animation-delay: 1.1s; }
            .detail:nth-child(12) { animation-delay: 1.2s; }
            .detail:nth-child(13) { animation-delay: 1.3s; }

            .detail::before {
                content: '';
                position: absolute;
                top: 0;
                left: 0;
                right: 0;
                height: 3px;
                background: linear-gradient(90deg, #667eea, #764ba2, #f093fb, #f5576c);
                border-radius: 20px 20px 0 0;
                opacity: 0;
                transition: opacity 0.3s ease;
            }

            .detail:hover {
                transform: translateY(-8px) scale(1.02);
                box-shadow:
                        0 20px 40px rgba(0,0,0,0.15),
                        0 10px 20px rgba(102, 126, 234, 0.2),
                        inset 0 1px 0 rgba(255,255,255,0.8);
            }

            .detail:hover::before {
                opacity: 1;
            }

            .icon {
                display: inline-block;
                width: 45px;
                height: 45px;
                border-radius: 50%;
                background: linear-gradient(135deg, #667eea, #764ba2);
                color: white;
                text-align: center;
                line-height: 45px;
                font-size: 18px;
                margin-right: 20px;
                flex-shrink: 0;
                animation: iconPulse 2s ease-in-out infinite;
                box-shadow: 0 5px 15px rgba(102, 126, 234, 0.3);
            }

            .content {
                flex: 1;
            }

            .label {
                font-weight: 700;
                color: #374151;
                font-size: 14px;
                text-transform: uppercase;
                letter-spacing: 0.5px;
                margin-bottom: 8px;
                opacity: 0.8;
            }

            .value {
                color: #1f2937;
                font-size: 18px;
                font-weight: 600;
                line-height: 1.4;
            }

            .detail-content {
                display: flex;
                align-items: center;
            }

            .no-data {
                text-align: center;
                padding: 60px 20px;
                animation: bounceIn 1s ease;
            }

            .no-data h2 {
                font-size: 28px;
                color: #ef4444;
                margin-bottom: 15px;
            }

            .no-data p {
                color: #6b7280;
                font-size: 16px;
            }

            /* Responsive */
            @media (max-width: 768px) {
                .card {
                    padding: 30px 25px;
                    margin: 10px;
                }

                .grid {
                    grid-template-columns: 1fr;
                    gap: 20px;
                }

                .header h2 {
                    font-size: 28px;
                }

                .detail {
                    padding: 20px;
                }
            }

            /* Animations */
            @keyframes gradientShift {
                0% { background-position: 0% 50%; }
                50% { background-position: 100% 50%; }
                100% { background-position: 0% 50%; }
            }

            @keyframes floatParticles {
                0% { transform: translateY(0px) rotate(0deg); }
                100% { transform: translateY(-100vh) rotate(360deg); }
            }

            @keyframes cardEntrance {
                0% {
                    opacity: 0;
                    transform: translateY(100px) scale(0.8);
                    filter: blur(10px);
                }
                100% {
                    opacity: 1;
                    transform: translateY(0) scale(1);
                    filter: blur(0px);
                }
            }

            @keyframes detailEntrance {
                0% {
                    opacity: 0;
                    transform: translateY(30px) scale(0.9);
                }
                100% {
                    opacity: 1;
                    transform: translateY(0) scale(1);
                }
            }

            @keyframes titleGlow {
                0% {
                    text-shadow: 0 0 20px rgba(102, 126, 234, 0.3);
                    transform: scale(1);
                }
                100% {
                    text-shadow: 0 0 40px rgba(102, 126, 234, 0.6), 0 0 60px rgba(118, 75, 162, 0.4);
                    transform: scale(1.02);
                }
            }

            @keyframes fadeInUp {
                0% {
                    opacity: 0;
                    transform: translateY(20px);
                }
                100% {
                    opacity: 1;
                    transform: translateY(0);
                }
            }

            @keyframes iconPulse {
                0%, 100% {
                    transform: scale(1);
                    box-shadow: 0 5px 15px rgba(102, 126, 234, 0.3);
                }
                50% {
                    transform: scale(1.05);
                    box-shadow: 0 8px 25px rgba(102, 126, 234, 0.5);
                }
            }

            @keyframes rotateGlow {
                0% { transform: rotate(0deg); }
                100% { transform: rotate(360deg); }
            }

            @keyframes bounceIn {
                0% {
                    opacity: 0;
                    transform: scale(0.3);
                }
                50% {
                    opacity: 1;
                    transform: scale(1.05);
                }
                70% {
                    transform: scale(0.9);
                }
                100% {
                    opacity: 1;
                    transform: scale(1);
                }
            }

        </style>
    </head>
    <body>
        <div class="main-container">
            <div class="card">
                <%
                    Student student = (Student) request.getAttribute("student");
                    if (student != null) {
                %>
                <div class="header">
                    <h2>✨ Student Registration Details</h2>
                    <p class="subtitle">Registration completed successfully with beautiful details below</p>
                </div>

                <div class="grid">
                    <div class="detail">
                        <div class="detail-content">
                            <div class="icon">👤</div>
                            <div class="content">
                                <div class="label">First Name</div>
                                <div class="value"><%= student.getFirstName() %></div>
                            </div>
                        </div>
                    </div>

                    <div class="detail">
                        <div class="detail-content">
                            <div class="icon">👨</div>
                            <div class="content">
                                <div class="label">Last Name</div>
                                <div class="value"><%= student.getLastName() %></div>
                            </div>
                        </div>
                    </div>

                    <div class="detail">
                        <div class="detail-content">
                            <div class="icon">✉️</div>
                            <div class="content">
                                <div class="label">Email Address</div>
                                <div class="value"><%= student.getEmail() %></div>
                            </div>
                        </div>
                    </div>

                    <div class="detail">
                        <div class="detail-content">
                            <div class="icon">📱</div>
                            <div class="content">
                                <div class="label">Mobile Number</div>
                                <div class="value"><%= student.getMobileNumber() %></div>
                            </div>
                        </div>
                    </div>

                    <div class="detail">
                        <div class="detail-content">
                            <div class="icon">⚧️</div>
                            <div class="content">
                                <div class="label">Gender</div>
                                <div class="value"><%= student.getGender() %></div>
                            </div>
                        </div>
                    </div>

                    <div class="detail">
                        <div class="detail-content">
                            <div class="icon">🎂</div>
                            <div class="content">
                                <div class="label">Birthday</div>
                                <div class="value"><%= student.getBirthday() %></div>
                            </div>
                        </div>
                    </div>

                    <div class="detail">
                        <div class="detail-content">
                            <div class="icon">🏠</div>
                            <div class="content">
                                <div class="label">Address</div>
                                <div class="value"><%= student.getAddress() %></div>
                            </div>
                        </div>
                    </div>

                    <div class="detail">
                        <div class="detail-content">
                            <div class="icon">🏙️</div>
                            <div class="content">
                                <div class="label">City</div>
                                <div class="value"><%= student.getCity() %></div>
                            </div>
                        </div>
                    </div>

                    <div class="detail">
                        <div class="detail-content">
                            <div class="icon">📮</div>
                            <div class="content">
                                <div class="label">Pin Code</div>
                                <div class="value"><%= student.getPinCode() %></div>
                            </div>
                        </div>
                    </div>

                    <div class="detail">
                        <div class="detail-content">
                            <div class="icon">🗺️</div>
                            <div class="content">
                                <div class="label">State</div>
                                <div class="value"><%= student.getState() %></div>
                            </div>
                        </div>
                    </div>

                    <div class="detail">
                        <div class="detail-content">
                            <div class="icon">🌍</div>
                            <div class="content">
                                <div class="label">Country</div>
                                <div class="value"><%= student.getCountry() %></div>
                            </div>
                        </div>
                    </div>

                    <div class="detail">
                        <div class="detail-content">
                            <div class="icon">🎨</div>
                            <div class="content">
                                <div class="label">Hobbies</div>
                                <div class="value"><%= student.getHobbies() %></div>
                            </div>
                        </div>
                    </div>

                    <div class="detail">
                        <div class="detail-content">
                            <div class="icon">📚</div>
                            <div class="content">
                                <div class="label">Course</div>
                                <div class="value"><%= student.getCourse() %></div>
                            </div>
                        </div>
                    </div>
                </div>

                <% } else { %>
                <div class="no-data">
                    <h2>⚠️ No Student Information Found</h2>
                    <p>Please check your registration data and try again.</p>
                </div>
                <% } %>
            </div>
        </div>
    </body>
</html>
<%--
  Created by IntelliJ IDEA.
  User: Tan Nghi
  Date: 9/8/2025
  Time: 9:27 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>User Registration</title>
        <style>
            * {
                box-sizing: border-box;
            }

            body {
                margin: 0;
                padding: 20px;
                font-family: "Inter", "Segoe UI", sans-serif;
                background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                min-height: 100vh;
                display: flex;
                justify-content: center;
                align-items: center;
                position: relative;
                overflow-x: hidden;
            }

            /* Animated background particles */
            body::before {
                content: '';
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-image:
                        radial-gradient(circle at 20% 50%, rgba(120, 119, 198, 0.3) 0%, transparent 50%),
                        radial-gradient(circle at 80% 20%, rgba(255, 119, 198, 0.3) 0%, transparent 50%),
                        radial-gradient(circle at 40% 80%, rgba(120, 219, 255, 0.3) 0%, transparent 50%);
                animation: float 20s ease-in-out infinite;
            }

            .form-container {
                background: rgba(255, 255, 255, 0.95);
                backdrop-filter: blur(20px);
                border: 1px solid rgba(255, 255, 255, 0.2);
                padding: 50px 40px;
                border-radius: 30px;
                box-shadow:
                        0 25px 50px rgba(0,0,0,0.15),
                        0 0 0 1px rgba(255,255,255,0.1) inset;
                width: 100%;
                max-width: 950px;
                animation: slideUpFade 1.2s cubic-bezier(0.4, 0.0, 0.2, 1);
                position: relative;
                z-index: 1;
            }

            h1 {
                text-align: center;
                background: linear-gradient(135deg, #667eea, #764ba2);
                -webkit-background-clip: text;
                -webkit-text-fill-color: transparent;
                background-clip: text;
                margin-bottom: 35px;
                font-size: 32px;
                font-weight: 700;
                letter-spacing: -1px;
                animation: titleGlow 2s ease-in-out;
            }

            .input-group {
                display: grid;
                grid-template-columns: 1fr 1fr;
                gap: 15px;
                margin-bottom: 20px;
            }

            .form-field {
                position: relative;
                margin-bottom: 20px;
            }

            .input {
                width: 100%;
                padding: 18px 20px;
                border: 2px solid #e1e8ed;
                border-radius: 16px;
                transition: all 0.4s cubic-bezier(0.4, 0.0, 0.2, 1);
                font-size: 16px;
                background: rgba(255, 255, 255, 0.8);
                backdrop-filter: blur(10px);
                color: #2d3748;
            }

            .input::placeholder {
                color: #a0aec0;
                transition: all 0.3s ease;
            }

            .input:focus {
                border-color: #667eea;
                box-shadow:
                        0 0 0 4px rgba(102, 126, 234, 0.1),
                        0 8px 25px rgba(102, 126, 234, 0.15);
                transform: translateY(-2px);
                outline: none;
                background: rgba(255, 255, 255, 0.95);
            }

            .input:focus::placeholder {
                color: #667eea;
                transform: translateY(-2px);
            }

            .input:valid {
                border-color: #48bb78;
                background: rgba(72, 187, 120, 0.05);
            }

            label {
                font-size: 15px;
                color: #4a5568;
                margin-bottom: 8px;
                display: block;
                font-weight: 500;
            }

            .gender-container {
                margin: 25px 0;
                padding: 20px;
                background: rgba(102, 126, 234, 0.05);
                border-radius: 16px;
                border: 1px solid rgba(102, 126, 234, 0.1);
            }

            .gender-label {
                margin-bottom: 15px;
                color: #2d3748;
                font-weight: 600;
            }

            .gender {
                display: flex;
                gap: 25px;
                justify-content: center;
            }

            .gender-option {
                position: relative;
                display: flex;
                align-items: center;
                cursor: pointer;
                padding: 12px 20px;
                border-radius: 12px;
                transition: all 0.3s ease;
                background: rgba(255, 255, 255, 0.6);
                border: 2px solid transparent;
            }

            .gender-option:hover {
                background: rgba(102, 126, 234, 0.1);
                transform: translateY(-2px);
                box-shadow: 0 4px 12px rgba(102, 126, 234, 0.2);
            }

            .gender-option input[type="radio"] {
                position: absolute;
                opacity: 0;
                cursor: pointer;
            }

            .gender-option input[type="radio"]:checked + .checkmark {
                background: #667eea;
                border-color: #667eea;
                transform: scale(1.1);
            }

            .gender-option input[type="radio"]:checked + .checkmark::after {
                opacity: 1;
                transform: scale(1);
            }

            .gender-option input[type="radio"]:checked ~ .gender-text {
                color: #667eea;
                font-weight: 600;
            }

            .checkmark {
                width: 20px;
                height: 20px;
                border: 2px solid #cbd5e0;
                border-radius: 50%;
                margin-right: 12px;
                position: relative;
                transition: all 0.3s ease;
                background: white;
            }

            .checkmark::after {
                content: '';
                position: absolute;
                width: 8px;
                height: 8px;
                border-radius: 50%;
                background: white;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%) scale(0);
                opacity: 0;
                transition: all 0.3s ease;
            }

            .gender-text {
                color: #4a5568;
                font-size: 15px;
                font-weight: 500;
                transition: all 0.3s ease;
            }

            .submit-btn {
                margin-top: 30px;
                width: 100%;
                padding: 18px;
                border: none;
                border-radius: 16px;
                background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                color: white;
                font-size: 18px;
                font-weight: 600;
                cursor: pointer;
                transition: all 0.4s cubic-bezier(0.4, 0.0, 0.2, 1);
                position: relative;
                overflow: hidden;
                box-shadow: 0 8px 25px rgba(102, 126, 234, 0.3);
            }

            .submit-btn::before {
                content: '';
                position: absolute;
                top: 0;
                left: -100%;
                width: 100%;
                height: 100%;
                background: linear-gradient(90deg, transparent, rgba(255,255,255,0.2), transparent);
                transition: left 0.5s;
            }

            .submit-btn:hover {
                transform: translateY(-3px);
                box-shadow: 0 12px 35px rgba(102, 126, 234, 0.4);
            }

            .submit-btn:hover::before {
                left: 100%;
            }

            .submit-btn:active {
                transform: translateY(-1px);
                box-shadow: 0 6px 20px rgba(102, 126, 234, 0.3);
            }

            /* Enhanced Animations */
            @keyframes float {
                0%, 100% { transform: translateY(0px) rotate(0deg); }
                33% { transform: translateY(-30px) rotate(120deg); }
                66% { transform: translateY(-60px) rotate(240deg); }
            }

            @keyframes slideUpFade {
                0% {
                    opacity: 0;
                    transform: translateY(60px) scale(0.9);
                }
                50% {
                    opacity: 0.8;
                }
                100% {
                    opacity: 1;
                    transform: translateY(0) scale(1);
                }
            }

            @keyframes titleGlow {
                0% {
                    opacity: 0;
                    transform: scale(0.8);
                }
                50% {
                    opacity: 0.8;
                    transform: scale(1.05);
                }
                100% {
                    opacity: 1;
                    transform: scale(1);
                }
            }

            /* Staggered animation for form fields */
            .form-field:nth-child(1) { animation: fieldSlideIn 0.6s ease 0.2s both; }
            .form-field:nth-child(2) { animation: fieldSlideIn 0.6s ease 0.3s both; }
            .form-field:nth-child(3) { animation: fieldSlideIn 0.6s ease 0.4s both; }
            .form-field:nth-child(4) { animation: fieldSlideIn 0.6s ease 0.5s both; }
            .form-field:nth-child(5) { animation: fieldSlideIn 0.6s ease 0.6s both; }
            .gender-container { animation: fieldSlideIn 0.6s ease 0.7s both; }
            .submit-btn { animation: fieldSlideIn 0.6s ease 0.8s both; }

            @keyframes fieldSlideIn {
                0% {
                    opacity: 0;
                    transform: translateX(-30px);
                }
                100% {
                    opacity: 1;
                    transform: translateX(0);
                }
            }

            /* Responsive design */
            @media (max-width: 768px) {
                .form-container {
                    margin: 20px;
                    padding: 30px 25px;
                }

                .input-group {
                    grid-template-columns: 1fr;
                }

                h1 {
                    font-size: 28px;
                }

                .gender {
                    flex-direction: column;
                    gap: 15px;
                }
            }
        </style>
    </head>
    <body>
        <div class="form-container">
            <form method="post" action="signup">
                <h1>Create Account</h1>

                <div class="input-group">
                    <div class="form-field">
                        <input class="input" type="text" name="firstName" placeholder="First Name" required>
                    </div>
                    <div class="form-field">
                        <input class="input" type="text" name="lastName" placeholder="Last Name" required>
                    </div>
                </div>

                <div class="form-field">
                    <input class="input" type="email" name="email" placeholder="Your Email Address" required>
                </div>

                <div class="form-field">
                    <input class="input" type="email" name="reEmail" placeholder="Confirm Email Address" required>
                </div>

                <div class="form-field">
                    <input class="input" type="password" name="password" placeholder="Create Password" required>
                </div>

                <div class="form-field">
                    <label>Birthday</label>
                    <input class="input" type="date" name="birthday" required>
                </div>

                <div class="gender-container">
                    <div class="gender-label">Gender</div>
                    <div class="gender">
                        <label class="gender-option">
                            <input type="radio" name="gender" value="Female" required>
                            <span class="checkmark"></span>
                            <span class="gender-text">Female</span>
                        </label>
                        <label class="gender-option">
                            <input type="radio" name="gender" value="Male" required>
                            <span class="checkmark"></span>
                            <span class="gender-text">Male</span>
                        </label>
                    </div>
                </div>

                <button type="submit" class="submit-btn">Create Account</button>
            </form>
        </div>
    </body>
</html>
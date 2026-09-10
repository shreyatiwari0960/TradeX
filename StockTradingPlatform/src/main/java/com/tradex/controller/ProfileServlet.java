package com.tradex.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.Base64;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import com.tradex.model.User;

@WebServlet("/ProfileServlet")
@MultipartConfig(
    maxFileSize = 2 * 1024 * 1024,
    maxRequestSize = 3 * 1024 * 1024
)
public class ProfileServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("index.jsp");
            return;
        }

        request.setAttribute("activePage", "profile");

        request.getRequestDispatcher("profile.jsp")
               .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("index.jsp");
            return;
        }

        User user = (User) session.getAttribute("user");

        /*
         * ============================
         * UPDATE DISPLAY NAME
         * ============================
         */

        String displayName = request.getParameter("displayName");

        if (displayName != null && !displayName.trim().isEmpty()) {
            session.setAttribute(
                "profileDisplayName",
                displayName.trim()
            );
        }

        /*
         * ============================
         * PROFILE PICTURE
         * ============================
         */

        try {

            Part profilePicture = request.getPart("profilePicture");

            if (profilePicture != null &&
                profilePicture.getSize() > 0) {

                String contentType = profilePicture.getContentType();

                if (contentType != null &&
                    (contentType.equals("image/jpeg") ||
                     contentType.equals("image/png") ||
                     contentType.equals("image/gif"))) {

                    InputStream inputStream =
                            profilePicture.getInputStream();

                    byte[] imageBytes =
                            inputStream.readAllBytes();

                    inputStream.close();

                    String base64Image =
                            Base64.getEncoder()
                                  .encodeToString(imageBytes);

                    String imageData =
                            "data:" + contentType +
                            ";base64," + base64Image;

                    session.setAttribute(
                        "profilePicture",
                        imageData
                    );
                }
            }

        } catch (Exception e) {

            e.printStackTrace();

        }

        /*
         * ============================
         * SUCCESS MESSAGE
         * ============================
         */

        session.setAttribute(
            "profileMessage",
            "Profile updated successfully."
        );

        request.setAttribute("activePage", "profile");

        response.sendRedirect("ProfileServlet");
    }
}
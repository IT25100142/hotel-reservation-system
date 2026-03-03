package com.example.hotelreservationdemo.filters;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter("/*")
public class AuthFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        HttpSession session = req.getSession(false);

        String path = req.getRequestURI();

        // 1. Allow access to ALL login and registration pages/servlets
        boolean isAuthRequest = path.endsWith("guestLogin.jsp") ||
                path.endsWith("staffLogin.jsp") ||
                path.endsWith("LoginServlet") ||
                path.endsWith("RegisterUserServlet") ||
                path.endsWith("GuestAuthServlet") ||
                path.endsWith("LogoutServlet");

        boolean isStaticResource = path.endsWith(".css") || path.endsWith(".js") || path.endsWith(".jpg") || path.endsWith(".png");

        boolean isLoggedIn = (session != null && session.getAttribute("username") != null);
        String role = isLoggedIn ? (String) session.getAttribute("role") : "";

        if (isLoggedIn || isAuthRequest || isStaticResource) {

            // SECURITY CHECK: If a Customer (GUEST) tries to load the Staff Admin Dashboards, kick them out!
            if ("GUEST".equals(role) && (path.endsWith("DashboardServlet") || path.endsWith("MasterDashboardServlet") || path.endsWith("index.jsp"))) {
                res.sendRedirect(req.getContextPath() + "/guestDashboard.jsp");
                return;
            }

            chain.doFilter(request, response); // Let them through
        } else {
            // Kick unauthenticated users back to the CUSTOMER login page
            res.sendRedirect(req.getContextPath() + "/guestLogin.jsp?error=Please log in to continue.");
        }
    }
}
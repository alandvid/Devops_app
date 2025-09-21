<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="he">
<head>
    <meta charset="UTF-8">
    <title>DevOps project</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body { font-family: Arial, sans-serif; margin: 2rem; }
        header { margin-bottom: 1rem; }
        .card { border: 1px solid #ddd; border-radius: 8px; padding: 1rem; max-width: 640px; }
        .row { margin: 0.5rem 0; }
        input[type=text] { padding: 0.5rem; width: 60%; }
        button { padding: 0.5rem 1rem; cursor: pointer; }
        a { text-decoration: none; }
        footer { margin-top: 2rem; font-size: 0.9rem; color: #666; }
        .ok { color: #0b8a0b; font-weight: bold; }
    </style>
</head>
<body dir="rtl">
<%! 
    // Minimal HTML escaping to prevent basic injection when echoing user input
    public static String esc(String s) {
        if (s == null) return "";
        StringBuilder b = new StringBuilder();
        for (char c : s.toCharArray()) {
            switch (c) {
                case '&': b.append("&amp;"); break;
                case '<': b.append("&lt;"); break;
                case '>': b.append("&gt;"); break;
                case '"': b.append("&quot;"); break;
                default: b.append(c);
            }
        }
        return b.toString();
    }
%>
<header>
    <h1>ברוכים הבאים ל‑DevOps project!</h1>
    <p>דוגמה מינימלית עם כאן תראה <strong>שדה קלט</strong>, <strong>כפתור</strong> וקישור אחד — מתאימה לדרישות המטלה.</p>
</header>

<div class="card">
    <form method="get" action="index.jsp">
        <div class="row">
            <label for="name">הכנס שם:</label>
            <input id="name" name="name" type="text" placeholder="Name" />
            <button type="submit">ברך אותי</button>
        </div>
    </form>
    <div class="row">
        <% 
           String name = request.getParameter("name");
           if (name != null && !name.trim().isEmpty()) { 
        %>
            <p class="ok">שלום, <%= esc(name) %>!!!!!!!!!!!!!! שמח שביקרת 😊</p>
        <% } else { %>
            <p>טרם הזנת שם. נסה למלא את התיבה וללחוץ על הכפתור.</p>
        <% } %>
    </div>
    <div class="row">
        <a href="https://www.hit.ac.il" target="_blank" rel="noopener">מעבר לאתר HIT</a>
    </div>
</div>

<footer>
    <p>תיקייה: <code><%= request.getContextPath() %></code> • זמן שרת: <%= new java.util.Date() %></p>
</footer>
</body>
</html>

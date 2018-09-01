<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
    pageContext.setAttribute("basePath", basePath);
%>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script type="text/javascript" data-main='<%=basePath%>/app/main.js'
            src="<%=basePath%>/app/external_library/require/require.js"></script>
    <title>BaseIndexJSP</title>
</head>
<body>
<div ng-include="'<%=basePath%>/app/pages/navigationBar.html'"></div>
<div ui-view></div>
</body>
</html>
<%@page import="java.io.FileWriter"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
try {
	Class.forName("oracle.jdbc.driver.OracleDriver");
    connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/orcl", "system", "password");
    statement = connection.createStatement();
    String sql = "select * from it18;";
    resultSet = statement.executeQuery(sql);
    PrintWriter writer = response.getWriter();
    response.setContentType("text/csv");
    response.setHeader("Content-Disposition", "attachment; filename=\"placement_data_it.csv\"");
    writer.println("REGISTER ID,NAME,BRANCH,STATUS,OFFERS,COMPANY1,COMPANY2,COMPANY3,COMPANY4,COMPANY5,COMPANY6,COMPANY7");
    while (resultSet.next()) {
        writer.println(resultSet.getString("REGISTERID") + "," +
                       resultSet.getString("NAME") + "," +
                       resultSet.getString("BRANCH") + "," +
                       resultSet.getString("STATUS") + "," +
                       resultSet.getString("OFFERS")+","+
                       resultSet.getString("COMPANY1")+","+
                       resultSet.getString("COMPANY2")+","+
                       resultSet.getString("COMPANY3")+","+
                       resultSet.getString("COMPANY4")+","+
                       resultSet.getString("COMPANY5")+","+
                       resultSet.getString("COMPANY6"));
    }
} catch (Exception e) {
    e.printStackTrace();
} finally {
    try {
        if (resultSet != null) resultSet.close();
        if (statement != null) statement.close();
        if (connection != null) connection.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
}
%>
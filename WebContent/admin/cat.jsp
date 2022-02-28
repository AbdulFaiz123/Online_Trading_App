<%@page import="org.json.JSONObject"%>
<%@page import="com.google.gson.JsonArray"%>
<%@page import="com.shop.models.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.google.gson.reflect.TypeToken"%>
<%@page import="com.google.gson.JsonElement"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.Collections"%>
<%@page import="org.apache.commons.collections.map.SingletonMap"%>
<%@page import="com.shop.services.CategoryService"%>
<%
CategoryService service=new CategoryService();
if("list".equals(request.getParameter("op"))){
	Gson obj=new Gson();
	JsonElement element=obj.toJsonTree(service.list(),new TypeToken<List<Category>>(){		
	}.getType());
	JsonArray ja=element.getAsJsonArray();
	JSONObject ob=new JSONObject();
	ob.put("data", ja);
	out.println(ob);
}
%>
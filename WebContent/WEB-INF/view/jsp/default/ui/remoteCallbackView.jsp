<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<script type="text/javascript">  
    var remoteUrl = "${remoteLoginUrl}?validated=true";  
    //登陆回调页面。    
    var re1 = '${loginTicket}';
    var re2 = '${flowExecutionKey}';
    console.log("-loginTicket--"+re1);
    console.log("-execution--"+re2);
   // 构造错误消息,从webflow scope中取出  
    var errorMessage = '${remoteLoginMessage}';  
    /* <spring:hasBindErrors name="credentials"> 
     errorMessage = "&errorMessage=" + encodeURIComponent('<c:forEach var="error" items="${errors.allErrors}"><spring:message code="${error.code}" text="${error.defaultMessage}" /></c:forEach>'); 
    </spring:hasBindErrors> */  
    // 如果存在错误消息则追加到 url中  
    if(null != errorMessage && errorMessage.length > 0)  
    {  
        errorMessage = "&errorMessage=" + encodeURIComponent(errorMessage);  
    }  
    console.log("客户端remoteUrl:---"+remoteUrl + errorMessage );
    // 构造service  
    var service = "";
    var loginTicket = "";
    <c:if test="${service != null && service != ''}">  
     service = "&service=" + encodeURIComponent("${service}");  
    </c:if>  
    <c:if test="${loginTicket != null && loginTicket != ''}">  
     loginTicket = "&loginTicket=" + "${loginTicket}";  
    </c:if> 
    console.log("客户端service:"+ service);
    var flowExecutionKey ="&flowExecutionKey=" + re2; 

    // 跳转回去（客户端）  
  window.location.href = remoteUrl + errorMessage + service+loginTicket+flowExecutionKey; 
  </script>
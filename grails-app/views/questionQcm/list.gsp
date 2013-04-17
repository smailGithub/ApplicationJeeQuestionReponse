
<%@ page import="TpJee.QuestionQcm" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'questionQcm.label', default: 'QuestionQcm')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-questionQcm" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-questionQcm" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="commentaire" title="${message(code: 'questionQcm.commentaire.label', default: 'Commentaire')}" />
					
						<g:sortableColumn property="date" title="${message(code: 'questionQcm.date.label', default: 'Date')}" />
					
						<th><g:message code="questionQcm.enseigant.label" default="Enseigant" /></th>
					
						<g:sortableColumn property="question" title="${message(code: 'questionQcm.question.label', default: 'Question')}" />
					
						<g:sortableColumn property="r1" title="${message(code: 'questionQcm.r1.label', default: 'R1')}" />
					
						<g:sortableColumn property="r2" title="${message(code: 'questionQcm.r2.label', default: 'R2')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${questionQcmInstanceList}" status="i" var="questionQcmInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${questionQcmInstance.id}">${fieldValue(bean: questionQcmInstance, field: "commentaire")}</g:link></td>
					
						<td><g:formatDate date="${questionQcmInstance.date}" /></td>
					
						<td>${fieldValue(bean: questionQcmInstance, field: "enseigant")}</td>
					
						<td>${fieldValue(bean: questionQcmInstance, field: "question")}</td>
					
						<td>${fieldValue(bean: questionQcmInstance, field: "r1")}</td>
					
						<td>${fieldValue(bean: questionQcmInstance, field: "r2")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${questionQcmInstanceTotal}" />
			</div>
		</div>
	</body>
</html>

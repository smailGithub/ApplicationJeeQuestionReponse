
<%@ page import="TpJee.QuestionSimple" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'questionSimple.label', default: 'QuestionSimple')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-questionSimple" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-questionSimple" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="commentaire" title="${message(code: 'questionSimple.commentaire.label', default: 'Commentaire')}" />
					
						<g:sortableColumn property="date" title="${message(code: 'questionSimple.date.label', default: 'Date')}" />
					
						<th><g:message code="questionSimple.enseigant.label" default="Enseigant" /></th>
					
						<g:sortableColumn property="question" title="${message(code: 'questionSimple.question.label', default: 'Question')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${questionSimpleInstanceList}" status="i" var="questionSimpleInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${questionSimpleInstance.id}">${fieldValue(bean: questionSimpleInstance, field: "commentaire")}</g:link></td>
					
						<td><g:formatDate date="${questionSimpleInstance.date}" /></td>
					
						<td>${fieldValue(bean: questionSimpleInstance, field: "enseigant")}</td>
					
						<td>${fieldValue(bean: questionSimpleInstance, field: "question")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${questionSimpleInstanceTotal}" />
			</div>
		</div>
	</body>
</html>

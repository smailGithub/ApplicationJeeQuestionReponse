
<%@ page import="TpJee.QuestionTrueOrFalse" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'questionTrueOrFalse.label', default: 'QuestionTrueOrFalse')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-questionTrueOrFalse" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-questionTrueOrFalse" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="commentaire" title="${message(code: 'questionTrueOrFalse.commentaire.label', default: 'Commentaire')}" />
					
						<g:sortableColumn property="date" title="${message(code: 'questionTrueOrFalse.date.label', default: 'Date')}" />
					
						<th><g:message code="questionTrueOrFalse.enseigant.label" default="Enseigant" /></th>
					
						<g:sortableColumn property="question" title="${message(code: 'questionTrueOrFalse.question.label', default: 'Question')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${questionTrueOrFalseInstanceList}" status="i" var="questionTrueOrFalseInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${questionTrueOrFalseInstance.id}">${fieldValue(bean: questionTrueOrFalseInstance, field: "commentaire")}</g:link></td>
					
						<td><g:formatDate date="${questionTrueOrFalseInstance.date}" /></td>
					
						<td>${fieldValue(bean: questionTrueOrFalseInstance, field: "enseigant")}</td>
					
						<td>${fieldValue(bean: questionTrueOrFalseInstance, field: "question")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${questionTrueOrFalseInstanceTotal}" />
			</div>
		</div>
	</body>
</html>

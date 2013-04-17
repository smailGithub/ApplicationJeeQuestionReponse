
<%@ page import="TpJee.QuestionTrueOrFalse" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'questionTrueOrFalse.label', default: 'QuestionTrueOrFalse')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-questionTrueOrFalse" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-questionTrueOrFalse" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list questionTrueOrFalse">
			
				<g:if test="${questionTrueOrFalseInstance?.commentaire}">
				<li class="fieldcontain">
					<span id="commentaire-label" class="property-label"><g:message code="questionTrueOrFalse.commentaire.label" default="Commentaire" /></span>
					
						<span class="property-value" aria-labelledby="commentaire-label"><g:fieldValue bean="${questionTrueOrFalseInstance}" field="commentaire"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${questionTrueOrFalseInstance?.date}">
				<li class="fieldcontain">
					<span id="date-label" class="property-label"><g:message code="questionTrueOrFalse.date.label" default="Date" /></span>
					
						<span class="property-value" aria-labelledby="date-label"><g:formatDate date="${questionTrueOrFalseInstance?.date}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${questionTrueOrFalseInstance?.enseigant}">
				<li class="fieldcontain">
					<span id="enseigant-label" class="property-label"><g:message code="questionTrueOrFalse.enseigant.label" default="Enseigant" /></span>
					
						<span class="property-value" aria-labelledby="enseigant-label"><g:link controller="enseignant" action="show" id="${questionTrueOrFalseInstance?.enseigant?.id}">${questionTrueOrFalseInstance?.enseigant?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${questionTrueOrFalseInstance?.question}">
				<li class="fieldcontain">
					<span id="question-label" class="property-label"><g:message code="questionTrueOrFalse.question.label" default="Question" /></span>
					
						<span class="property-value" aria-labelledby="question-label"><g:fieldValue bean="${questionTrueOrFalseInstance}" field="question"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${questionTrueOrFalseInstance?.id}" />
					<g:link class="edit" action="edit" id="${questionTrueOrFalseInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

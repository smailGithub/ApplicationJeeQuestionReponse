
<%@ page import="TpJee.QuestionSimple" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'questionSimple.label', default: 'QuestionSimple')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-questionSimple" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-questionSimple" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list questionSimple">
			
				<g:if test="${questionSimpleInstance?.commentaire}">
				<li class="fieldcontain">
					<span id="commentaire-label" class="property-label"><g:message code="questionSimple.commentaire.label" default="Commentaire" /></span>
					
						<span class="property-value" aria-labelledby="commentaire-label"><g:fieldValue bean="${questionSimpleInstance}" field="commentaire"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${questionSimpleInstance?.date}">
				<li class="fieldcontain">
					<span id="date-label" class="property-label"><g:message code="questionSimple.date.label" default="Date" /></span>
					
						<span class="property-value" aria-labelledby="date-label"><g:formatDate date="${questionSimpleInstance?.date}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${questionSimpleInstance?.enseigant}">
				<li class="fieldcontain">
					<span id="enseigant-label" class="property-label"><g:message code="questionSimple.enseigant.label" default="Enseigant" /></span>
					
						<span class="property-value" aria-labelledby="enseigant-label"><g:link controller="enseignant" action="show" id="${questionSimpleInstance?.enseigant?.id}">${questionSimpleInstance?.enseigant?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${questionSimpleInstance?.question}">
				<li class="fieldcontain">
					<span id="question-label" class="property-label"><g:message code="questionSimple.question.label" default="Question" /></span>
					
						<span class="property-value" aria-labelledby="question-label"><g:fieldValue bean="${questionSimpleInstance}" field="question"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${questionSimpleInstance?.reponses}">
				<li class="fieldcontain">
					<span id="reponses-label" class="property-label"><g:message code="questionSimple.reponses.label" default="Reponses" /></span>
					
						<g:each in="${questionSimpleInstance.reponses}" var="r">
						<span class="property-value" aria-labelledby="reponses-label"><g:link controller="reponse" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${questionSimpleInstance?.id}" />
					<g:link class="edit" action="edit" id="${questionSimpleInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

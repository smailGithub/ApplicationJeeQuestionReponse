
<%@ page import="TpJee.QuestionQcm" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'questionQcm.label', default: 'QuestionQcm')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-questionQcm" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-questionQcm" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list questionQcm">
			
				<g:if test="${questionQcmInstance?.commentaire}">
				<li class="fieldcontain">
					<span id="commentaire-label" class="property-label"><g:message code="questionQcm.commentaire.label" default="Commentaire" /></span>
					
						<span class="property-value" aria-labelledby="commentaire-label"><g:fieldValue bean="${questionQcmInstance}" field="commentaire"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${questionQcmInstance?.date}">
				<li class="fieldcontain">
					<span id="date-label" class="property-label"><g:message code="questionQcm.date.label" default="Date" /></span>
					
						<span class="property-value" aria-labelledby="date-label"><g:formatDate date="${questionQcmInstance?.date}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${questionQcmInstance?.enseigant}">
				<li class="fieldcontain">
					<span id="enseigant-label" class="property-label"><g:message code="questionQcm.enseigant.label" default="Enseigant" /></span>
					
						<span class="property-value" aria-labelledby="enseigant-label"><g:link controller="enseignant" action="show" id="${questionQcmInstance?.enseigant?.id}">${questionQcmInstance?.enseigant?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${questionQcmInstance?.question}">
				<li class="fieldcontain">
					<span id="question-label" class="property-label"><g:message code="questionQcm.question.label" default="Question" /></span>
					
						<span class="property-value" aria-labelledby="question-label"><g:fieldValue bean="${questionQcmInstance}" field="question"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${questionQcmInstance?.r1}">
				<li class="fieldcontain">
					<span id="r1-label" class="property-label"><g:message code="questionQcm.r1.label" default="R1" /></span>
					
						<span class="property-value" aria-labelledby="r1-label"><g:fieldValue bean="${questionQcmInstance}" field="r1"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${questionQcmInstance?.r2}">
				<li class="fieldcontain">
					<span id="r2-label" class="property-label"><g:message code="questionQcm.r2.label" default="R2" /></span>
					
						<span class="property-value" aria-labelledby="r2-label"><g:fieldValue bean="${questionQcmInstance}" field="r2"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${questionQcmInstance?.r3}">
				<li class="fieldcontain">
					<span id="r3-label" class="property-label"><g:message code="questionQcm.r3.label" default="R3" /></span>
					
						<span class="property-value" aria-labelledby="r3-label"><g:fieldValue bean="${questionQcmInstance}" field="r3"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${questionQcmInstance?.r4}">
				<li class="fieldcontain">
					<span id="r4-label" class="property-label"><g:message code="questionQcm.r4.label" default="R4" /></span>
					
						<span class="property-value" aria-labelledby="r4-label"><g:fieldValue bean="${questionQcmInstance}" field="r4"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${questionQcmInstance?.id}" />
					<g:link class="edit" action="edit" id="${questionQcmInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

<%@ page import="TpJee.Enseignant" %>
<%@ page import="TpJee.Question" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'enseignant.label', default: 'Enseignant')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	<style type="text/css" media="screen">
			#enTete{
					float:right;
					width:300px;
					height:50px;
			}
			#status ul {
				font-size: 0.9em;
				list-style-type: none;
				margin-bottom: 0.6em;
				padding: 0;
			}

			#status li {
				line-height: 1.3;
			}
			#main{
				width:100%;
			}
			#listeQuestion{
			margin:auto;
			width:50%;
			border:1px solid;
			}
		</style>
	</head>
	<body>
		<!-- <a href="#show-enseignant" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-enseignant" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list enseignant">
			
				<g:if test="${enseignantInstance?.nom}">
				<li class="fieldcontain">
					<span id="nom-label" class="property-label"><g:message code="enseignant.nom.label" default="Nom" /></span>
					
						<span class="property-value" aria-labelledby="nom-label"><g:fieldValue bean="${enseignantInstance}" field="nom"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${enseignantInstance?.prenom}">
				<li class="fieldcontain">
					<span id="prenom-label" class="property-label"><g:message code="enseignant.prenom.label" default="Prenom" /></span>
					
						<span class="property-value" aria-labelledby="prenom-label"><g:fieldValue bean="${enseignantInstance}" field="prenom"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${enseignantInstance?.pwd}">
				<li class="fieldcontain">
					<span id="pwd-label" class="property-label"><g:message code="enseignant.pwd.label" default="Pwd" /></span>
					
						<span class="property-value" aria-labelledby="pwd-label"><g:fieldValue bean="${enseignantInstance}" field="pwd"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${enseignantInstance?.role}">
				<li class="fieldcontain">
					<span id="role-label" class="property-label"><g:message code="enseignant.role.label" default="Role" /></span>
					
						<span class="property-value" aria-labelledby="role-label"><g:fieldValue bean="${enseignantInstance}" field="role"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${enseignantInstance?.mail}">
				<li class="fieldcontain">
					<span id="mail-label" class="property-label"><g:message code="enseignant.mail.label" default="Mail" /></span>
					
						<span class="property-value" aria-labelledby="mail-label"><g:fieldValue bean="${enseignantInstance}" field="mail"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${enseignantInstance?.question}">
				<li class="fieldcontain">
					<span id="question-label" class="property-label"><g:message code="enseignant.question.label" default="Question" /></span>
					
						<g:each in="${enseignantInstance.question}" var="q">
						<span class="property-value" aria-labelledby="question-label"><g:link controller="question" action="show" id="${q.id}">${q?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${enseignantInstance?.id}" />
					<g:link class="edit" action="edit" id="${enseignantInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div> -->
		<div id="enTete">
		<< <g:link>${session.user.nom} ${session.user.prenom}</g:link> >>&nbsp;<< <g:link controller="User" action="logout">Déconnexion</g:link> >>
		</div>
		<div id="main">
		Liste de toutes vos questions :<div id="listeQuestion">
		<g:each var="q" in="${enseignantInstance.question}">
		<ul>
		<li><g:link>${q.question}</g:link></li>
		</ul>
		</g:each>
		</div>
		<div id="message">
		${flash.message}
		</div>
		<g:form controller="Question" action="createQuestion">
		Ajouter une question : <input type="text" name="question" value="">
		<br>
		<input type="submit" name="question_submit" value="Ajouter"/>
		</g:form>
	</div>
	</body>
</html>

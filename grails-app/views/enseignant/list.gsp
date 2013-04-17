
<%@ page import="TpJee.Enseignant" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'enseignant.label', default: 'Enseignant')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-enseignant" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-enseignant" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="nom" title="${message(code: 'enseignant.nom.label', default: 'Nom')}" />
					
						<g:sortableColumn property="prenom" title="${message(code: 'enseignant.prenom.label', default: 'Prenom')}" />
					
						<g:sortableColumn property="pwd" title="${message(code: 'enseignant.pwd.label', default: 'Pwd')}" />
					
						<g:sortableColumn property="role" title="${message(code: 'enseignant.role.label', default: 'Role')}" />
					
						<g:sortableColumn property="mail" title="${message(code: 'enseignant.mail.label', default: 'Mail')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${enseignantInstanceList}" status="i" var="enseignantInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${enseignantInstance.id}">${fieldValue(bean: enseignantInstance, field: "nom")}</g:link></td>
					
						<td>${fieldValue(bean: enseignantInstance, field: "prenom")}</td>
					
						<td>${fieldValue(bean: enseignantInstance, field: "pwd")}</td>
					
						<td>${fieldValue(bean: enseignantInstance, field: "role")}</td>
					
						<td>${fieldValue(bean: enseignantInstance, field: "mail")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${enseignantInstanceTotal}" />
			</div>
		</div>
	</body>
</html>

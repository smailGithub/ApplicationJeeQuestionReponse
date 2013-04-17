<%@ page import="TpJee.Etudiant" %>



<div class="fieldcontain ${hasErrors(bean: etudiantInstance, field: 'nom', 'error')} required">
	<label for="nom">
		<g:message code="etudiant.nom.label" default="Nom" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nom" required="" value="${etudiantInstance?.nom}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: etudiantInstance, field: 'prenom', 'error')} required">
	<label for="prenom">
		<g:message code="etudiant.prenom.label" default="Prenom" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="prenom" required="" value="${etudiantInstance?.prenom}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: etudiantInstance, field: 'pwd', 'error')} ">
	<label for="pwd">
		<g:message code="etudiant.pwd.label" default="Pwd" />
		
	</label>
	<g:textField name="pwd" maxlength="10" value="${etudiantInstance?.pwd}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: etudiantInstance, field: 'role', 'error')} ">
	<label for="role">
		<g:message code="etudiant.role.label" default="Role" />
		
	</label>
	<g:select name="role" from="${etudiantInstance.constraints.role.inList}" value="${etudiantInstance?.role}" valueMessagePrefix="etudiant.role" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: etudiantInstance, field: 'mail', 'error')} required">
	<label for="mail">
		<g:message code="etudiant.mail.label" default="Mail" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="mail" required="" value="${etudiantInstance?.mail}"/>
</div>


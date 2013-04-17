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

<div class="fieldcontain ${hasErrors(bean: etudiantInstance, field: 'reponses', 'error')} ">
	<label for="reponses">
		<g:message code="etudiant.reponses.label" default="Reponses" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${etudiantInstance?.reponses?}" var="r">
    <li><g:link controller="reponse" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="reponse" action="create" params="['etudiant.id': etudiantInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'reponse.label', default: 'Reponse')])}</g:link>
</li>
</ul>

</div>


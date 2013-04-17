<%@ page import="TpJee.Enseignant" %>



<div class="fieldcontain ${hasErrors(bean: enseignantInstance, field: 'nom', 'error')} required">
	<label for="nom">
		<g:message code="enseignant.nom.label" default="Nom" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nom" required="" value="${enseignantInstance?.nom}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: enseignantInstance, field: 'prenom', 'error')} required">
	<label for="prenom">
		<g:message code="enseignant.prenom.label" default="Prenom" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="prenom" required="" value="${enseignantInstance?.prenom}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: enseignantInstance, field: 'pwd', 'error')} ">
	<label for="pwd">
		<g:message code="enseignant.pwd.label" default="Pwd" />
		
	</label>
	<g:textField name="pwd" maxlength="10" value="${enseignantInstance?.pwd}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: enseignantInstance, field: 'role', 'error')} ">
	<label for="role">
		<g:message code="enseignant.role.label" default="Role" />
		
	</label>
	<g:select name="role" from="${enseignantInstance.constraints.role.inList}" value="${enseignantInstance?.role}" valueMessagePrefix="enseignant.role" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: enseignantInstance, field: 'mail', 'error')} required">
	<label for="mail">
		<g:message code="enseignant.mail.label" default="Mail" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="mail" required="" value="${enseignantInstance?.mail}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: enseignantInstance, field: 'question', 'error')} ">
	<label for="question">
		<g:message code="enseignant.question.label" default="Question" />
		
	</label>
	<g:select name="question" from="${TpJee.Question.list()}" multiple="multiple" optionKey="id" size="5" value="${enseignantInstance?.question*.id}" class="many-to-many"/>
</div>


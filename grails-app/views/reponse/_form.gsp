<%@ page import="TpJee.Reponse" %>



<div class="fieldcontain ${hasErrors(bean: reponseInstance, field: 'etudiant', 'error')} required">
	<label for="etudiant">
		<g:message code="reponse.etudiant.label" default="Etudiant" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="etudiant" name="etudiant.id" from="${TpJee.Etudiant.list()}" optionKey="id" required="" value="${reponseInstance?.etudiant?.id}" class="many-to-one"/>
</div>


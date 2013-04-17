<%@ page import="TpJee.Question" %>



<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'commentaire', 'error')} ">
	<label for="commentaire">
		<g:message code="question.commentaire.label" default="Commentaire" />
		
	</label>
	<g:textField name="commentaire" value="${questionInstance?.commentaire}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'date', 'error')} required">
	<label for="date">
		<g:message code="question.date.label" default="Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="date" precision="day"  value="${questionInstance?.date}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'enseigant', 'error')} required">
	<label for="enseigant">
		<g:message code="question.enseigant.label" default="Enseigant" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="enseigant" name="enseigant.id" from="${TpJee.Enseignant.list()}" optionKey="id" required="" value="${questionInstance?.enseigant?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'question', 'error')} ">
	<label for="question">
		<g:message code="question.question.label" default="Question" />
		
	</label>
	<g:textField name="question" value="${questionInstance?.question}"/>
</div>


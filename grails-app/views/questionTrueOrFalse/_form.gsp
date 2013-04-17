<%@ page import="TpJee.QuestionTrueOrFalse" %>



<div class="fieldcontain ${hasErrors(bean: questionTrueOrFalseInstance, field: 'commentaire', 'error')} ">
	<label for="commentaire">
		<g:message code="questionTrueOrFalse.commentaire.label" default="Commentaire" />
		
	</label>
	<g:textField name="commentaire" value="${questionTrueOrFalseInstance?.commentaire}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: questionTrueOrFalseInstance, field: 'date', 'error')} required">
	<label for="date">
		<g:message code="questionTrueOrFalse.date.label" default="Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="date" precision="day"  value="${questionTrueOrFalseInstance?.date}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: questionTrueOrFalseInstance, field: 'enseigant', 'error')} required">
	<label for="enseigant">
		<g:message code="questionTrueOrFalse.enseigant.label" default="Enseigant" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="enseigant" name="enseigant.id" from="${TpJee.Enseignant.list()}" optionKey="id" required="" value="${questionTrueOrFalseInstance?.enseigant?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: questionTrueOrFalseInstance, field: 'question', 'error')} ">
	<label for="question">
		<g:message code="questionTrueOrFalse.question.label" default="Question" />
		
	</label>
	<g:textField name="question" value="${questionTrueOrFalseInstance?.question}"/>
</div>


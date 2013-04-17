<%@ page import="TpJee.QuestionSimple" %>



<div class="fieldcontain ${hasErrors(bean: questionSimpleInstance, field: 'commentaire', 'error')} ">
	<label for="commentaire">
		<g:message code="questionSimple.commentaire.label" default="Commentaire" />
		
	</label>
	<g:textField name="commentaire" value="${questionSimpleInstance?.commentaire}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: questionSimpleInstance, field: 'date', 'error')} required">
	<label for="date">
		<g:message code="questionSimple.date.label" default="Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="date" precision="day"  value="${questionSimpleInstance?.date}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: questionSimpleInstance, field: 'enseigant', 'error')} required">
	<label for="enseigant">
		<g:message code="questionSimple.enseigant.label" default="Enseigant" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="enseigant" name="enseigant.id" from="${TpJee.Enseignant.list()}" optionKey="id" required="" value="${questionSimpleInstance?.enseigant?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: questionSimpleInstance, field: 'question', 'error')} ">
	<label for="question">
		<g:message code="questionSimple.question.label" default="Question" />
		
	</label>
	<g:textField name="question" value="${questionSimpleInstance?.question}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: questionSimpleInstance, field: 'reponses', 'error')} ">
	<label for="reponses">
		<g:message code="questionSimple.reponses.label" default="Reponses" />
		
	</label>
	<g:select name="reponses" from="${TpJee.Reponse.list()}" multiple="multiple" optionKey="id" size="5" value="${questionSimpleInstance?.reponses*.id}" class="many-to-many"/>
</div>


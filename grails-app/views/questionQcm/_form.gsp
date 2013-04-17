<%@ page import="TpJee.QuestionQcm" %>



<div class="fieldcontain ${hasErrors(bean: questionQcmInstance, field: 'commentaire', 'error')} ">
	<label for="commentaire">
		<g:message code="questionQcm.commentaire.label" default="Commentaire" />
		
	</label>
	<g:textField name="commentaire" value="${questionQcmInstance?.commentaire}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: questionQcmInstance, field: 'date', 'error')} required">
	<label for="date">
		<g:message code="questionQcm.date.label" default="Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="date" precision="day"  value="${questionQcmInstance?.date}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: questionQcmInstance, field: 'enseigant', 'error')} required">
	<label for="enseigant">
		<g:message code="questionQcm.enseigant.label" default="Enseigant" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="enseigant" name="enseigant.id" from="${TpJee.Enseignant.list()}" optionKey="id" required="" value="${questionQcmInstance?.enseigant?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: questionQcmInstance, field: 'question', 'error')} ">
	<label for="question">
		<g:message code="questionQcm.question.label" default="Question" />
		
	</label>
	<g:textField name="question" value="${questionQcmInstance?.question}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: questionQcmInstance, field: 'r1', 'error')} ">
	<label for="r1">
		<g:message code="questionQcm.r1.label" default="R1" />
		
	</label>
	<g:textField name="r1" value="${questionQcmInstance?.r1}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: questionQcmInstance, field: 'r2', 'error')} ">
	<label for="r2">
		<g:message code="questionQcm.r2.label" default="R2" />
		
	</label>
	<g:textField name="r2" value="${questionQcmInstance?.r2}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: questionQcmInstance, field: 'r3', 'error')} ">
	<label for="r3">
		<g:message code="questionQcm.r3.label" default="R3" />
		
	</label>
	<g:textField name="r3" value="${questionQcmInstance?.r3}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: questionQcmInstance, field: 'r4', 'error')} ">
	<label for="r4">
		<g:message code="questionQcm.r4.label" default="R4" />
		
	</label>
	<g:textField name="r4" value="${questionQcmInstance?.r4}"/>
</div>


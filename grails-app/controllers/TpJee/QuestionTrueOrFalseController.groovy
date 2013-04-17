package TpJee

import org.springframework.dao.DataIntegrityViolationException

class QuestionTrueOrFalseController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [questionTrueOrFalseInstanceList: QuestionTrueOrFalse.list(params), questionTrueOrFalseInstanceTotal: QuestionTrueOrFalse.count()]
    }

    def create() {
        [questionTrueOrFalseInstance: new QuestionTrueOrFalse(params)]
    }

    def save() {
        def questionTrueOrFalseInstance = new QuestionTrueOrFalse(params)
        if (!questionTrueOrFalseInstance.save(flush: true)) {
            render(view: "create", model: [questionTrueOrFalseInstance: questionTrueOrFalseInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'questionTrueOrFalse.label', default: 'QuestionTrueOrFalse'), questionTrueOrFalseInstance.id])
        redirect(action: "show", id: questionTrueOrFalseInstance.id)
    }

    def show(Long id) {
        def questionTrueOrFalseInstance = QuestionTrueOrFalse.get(id)
        if (!questionTrueOrFalseInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'questionTrueOrFalse.label', default: 'QuestionTrueOrFalse'), id])
            redirect(action: "list")
            return
        }

        [questionTrueOrFalseInstance: questionTrueOrFalseInstance]
    }

    def edit(Long id) {
        def questionTrueOrFalseInstance = QuestionTrueOrFalse.get(id)
        if (!questionTrueOrFalseInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'questionTrueOrFalse.label', default: 'QuestionTrueOrFalse'), id])
            redirect(action: "list")
            return
        }

        [questionTrueOrFalseInstance: questionTrueOrFalseInstance]
    }

    def update(Long id, Long version) {
        def questionTrueOrFalseInstance = QuestionTrueOrFalse.get(id)
        if (!questionTrueOrFalseInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'questionTrueOrFalse.label', default: 'QuestionTrueOrFalse'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (questionTrueOrFalseInstance.version > version) {
                questionTrueOrFalseInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'questionTrueOrFalse.label', default: 'QuestionTrueOrFalse')] as Object[],
                          "Another user has updated this QuestionTrueOrFalse while you were editing")
                render(view: "edit", model: [questionTrueOrFalseInstance: questionTrueOrFalseInstance])
                return
            }
        }

        questionTrueOrFalseInstance.properties = params

        if (!questionTrueOrFalseInstance.save(flush: true)) {
            render(view: "edit", model: [questionTrueOrFalseInstance: questionTrueOrFalseInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'questionTrueOrFalse.label', default: 'QuestionTrueOrFalse'), questionTrueOrFalseInstance.id])
        redirect(action: "show", id: questionTrueOrFalseInstance.id)
    }

    def delete(Long id) {
        def questionTrueOrFalseInstance = QuestionTrueOrFalse.get(id)
        if (!questionTrueOrFalseInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'questionTrueOrFalse.label', default: 'QuestionTrueOrFalse'), id])
            redirect(action: "list")
            return
        }

        try {
            questionTrueOrFalseInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'questionTrueOrFalse.label', default: 'QuestionTrueOrFalse'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'questionTrueOrFalse.label', default: 'QuestionTrueOrFalse'), id])
            redirect(action: "show", id: id)
        }
    }
}

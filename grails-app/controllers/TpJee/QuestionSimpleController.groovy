package TpJee

import org.springframework.dao.DataIntegrityViolationException

class QuestionSimpleController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [questionSimpleInstanceList: QuestionSimple.list(params), questionSimpleInstanceTotal: QuestionSimple.count()]
    }

    def create() {
        [questionSimpleInstance: new QuestionSimple(params)]
    }

    def save() {
        def questionSimpleInstance = new QuestionSimple(params)
        if (!questionSimpleInstance.save(flush: true)) {
            render(view: "create", model: [questionSimpleInstance: questionSimpleInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'questionSimple.label', default: 'QuestionSimple'), questionSimpleInstance.id])
        redirect(action: "show", id: questionSimpleInstance.id)
    }

    def show(Long id) {
        def questionSimpleInstance = QuestionSimple.get(id)
        if (!questionSimpleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'questionSimple.label', default: 'QuestionSimple'), id])
            redirect(action: "list")
            return
        }

        [questionSimpleInstance: questionSimpleInstance]
    }

    def edit(Long id) {
        def questionSimpleInstance = QuestionSimple.get(id)
        if (!questionSimpleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'questionSimple.label', default: 'QuestionSimple'), id])
            redirect(action: "list")
            return
        }

        [questionSimpleInstance: questionSimpleInstance]
    }

    def update(Long id, Long version) {
        def questionSimpleInstance = QuestionSimple.get(id)
        if (!questionSimpleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'questionSimple.label', default: 'QuestionSimple'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (questionSimpleInstance.version > version) {
                questionSimpleInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'questionSimple.label', default: 'QuestionSimple')] as Object[],
                          "Another user has updated this QuestionSimple while you were editing")
                render(view: "edit", model: [questionSimpleInstance: questionSimpleInstance])
                return
            }
        }

        questionSimpleInstance.properties = params

        if (!questionSimpleInstance.save(flush: true)) {
            render(view: "edit", model: [questionSimpleInstance: questionSimpleInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'questionSimple.label', default: 'QuestionSimple'), questionSimpleInstance.id])
        redirect(action: "show", id: questionSimpleInstance.id)
    }

    def delete(Long id) {
        def questionSimpleInstance = QuestionSimple.get(id)
        if (!questionSimpleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'questionSimple.label', default: 'QuestionSimple'), id])
            redirect(action: "list")
            return
        }

        try {
            questionSimpleInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'questionSimple.label', default: 'QuestionSimple'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'questionSimple.label', default: 'QuestionSimple'), id])
            redirect(action: "show", id: id)
        }
    }
}

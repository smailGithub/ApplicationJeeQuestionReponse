package TpJee

import org.springframework.dao.DataIntegrityViolationException

class QuestionQcmController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [questionQcmInstanceList: QuestionQcm.list(params), questionQcmInstanceTotal: QuestionQcm.count()]
    }

    def create() {
        [questionQcmInstance: new QuestionQcm(params)]
    }

    def save() {
        def questionQcmInstance = new QuestionQcm(params)
        if (!questionQcmInstance.save(flush: true)) {
            render(view: "create", model: [questionQcmInstance: questionQcmInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'questionQcm.label', default: 'QuestionQcm'), questionQcmInstance.id])
        redirect(action: "show", id: questionQcmInstance.id)
    }

    def show(Long id) {
        def questionQcmInstance = QuestionQcm.get(id)
        if (!questionQcmInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'questionQcm.label', default: 'QuestionQcm'), id])
            redirect(action: "list")
            return
        }

        [questionQcmInstance: questionQcmInstance]
    }

    def edit(Long id) {
        def questionQcmInstance = QuestionQcm.get(id)
        if (!questionQcmInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'questionQcm.label', default: 'QuestionQcm'), id])
            redirect(action: "list")
            return
        }

        [questionQcmInstance: questionQcmInstance]
    }

    def update(Long id, Long version) {
        def questionQcmInstance = QuestionQcm.get(id)
        if (!questionQcmInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'questionQcm.label', default: 'QuestionQcm'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (questionQcmInstance.version > version) {
                questionQcmInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'questionQcm.label', default: 'QuestionQcm')] as Object[],
                          "Another user has updated this QuestionQcm while you were editing")
                render(view: "edit", model: [questionQcmInstance: questionQcmInstance])
                return
            }
        }

        questionQcmInstance.properties = params

        if (!questionQcmInstance.save(flush: true)) {
            render(view: "edit", model: [questionQcmInstance: questionQcmInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'questionQcm.label', default: 'QuestionQcm'), questionQcmInstance.id])
        redirect(action: "show", id: questionQcmInstance.id)
    }

    def delete(Long id) {
        def questionQcmInstance = QuestionQcm.get(id)
        if (!questionQcmInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'questionQcm.label', default: 'QuestionQcm'), id])
            redirect(action: "list")
            return
        }

        try {
            questionQcmInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'questionQcm.label', default: 'QuestionQcm'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'questionQcm.label', default: 'QuestionQcm'), id])
            redirect(action: "show", id: id)
        }
    }
}

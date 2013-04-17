package TpJee



import org.junit.*
import grails.test.mixin.*

@TestFor(QuestionTrueOrFalseController)
@Mock(QuestionTrueOrFalse)
class QuestionTrueOrFalseControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/questionTrueOrFalse/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.questionTrueOrFalseInstanceList.size() == 0
        assert model.questionTrueOrFalseInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.questionTrueOrFalseInstance != null
    }

    void testSave() {
        controller.save()

        assert model.questionTrueOrFalseInstance != null
        assert view == '/questionTrueOrFalse/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/questionTrueOrFalse/show/1'
        assert controller.flash.message != null
        assert QuestionTrueOrFalse.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/questionTrueOrFalse/list'

        populateValidParams(params)
        def questionTrueOrFalse = new QuestionTrueOrFalse(params)

        assert questionTrueOrFalse.save() != null

        params.id = questionTrueOrFalse.id

        def model = controller.show()

        assert model.questionTrueOrFalseInstance == questionTrueOrFalse
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/questionTrueOrFalse/list'

        populateValidParams(params)
        def questionTrueOrFalse = new QuestionTrueOrFalse(params)

        assert questionTrueOrFalse.save() != null

        params.id = questionTrueOrFalse.id

        def model = controller.edit()

        assert model.questionTrueOrFalseInstance == questionTrueOrFalse
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/questionTrueOrFalse/list'

        response.reset()

        populateValidParams(params)
        def questionTrueOrFalse = new QuestionTrueOrFalse(params)

        assert questionTrueOrFalse.save() != null

        // test invalid parameters in update
        params.id = questionTrueOrFalse.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/questionTrueOrFalse/edit"
        assert model.questionTrueOrFalseInstance != null

        questionTrueOrFalse.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/questionTrueOrFalse/show/$questionTrueOrFalse.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        questionTrueOrFalse.clearErrors()

        populateValidParams(params)
        params.id = questionTrueOrFalse.id
        params.version = -1
        controller.update()

        assert view == "/questionTrueOrFalse/edit"
        assert model.questionTrueOrFalseInstance != null
        assert model.questionTrueOrFalseInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/questionTrueOrFalse/list'

        response.reset()

        populateValidParams(params)
        def questionTrueOrFalse = new QuestionTrueOrFalse(params)

        assert questionTrueOrFalse.save() != null
        assert QuestionTrueOrFalse.count() == 1

        params.id = questionTrueOrFalse.id

        controller.delete()

        assert QuestionTrueOrFalse.count() == 0
        assert QuestionTrueOrFalse.get(questionTrueOrFalse.id) == null
        assert response.redirectedUrl == '/questionTrueOrFalse/list'
    }
}

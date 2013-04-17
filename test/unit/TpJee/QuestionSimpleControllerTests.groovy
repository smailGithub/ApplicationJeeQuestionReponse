package TpJee



import org.junit.*
import grails.test.mixin.*

@TestFor(QuestionSimpleController)
@Mock(QuestionSimple)
class QuestionSimpleControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/questionSimple/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.questionSimpleInstanceList.size() == 0
        assert model.questionSimpleInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.questionSimpleInstance != null
    }

    void testSave() {
        controller.save()

        assert model.questionSimpleInstance != null
        assert view == '/questionSimple/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/questionSimple/show/1'
        assert controller.flash.message != null
        assert QuestionSimple.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/questionSimple/list'

        populateValidParams(params)
        def questionSimple = new QuestionSimple(params)

        assert questionSimple.save() != null

        params.id = questionSimple.id

        def model = controller.show()

        assert model.questionSimpleInstance == questionSimple
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/questionSimple/list'

        populateValidParams(params)
        def questionSimple = new QuestionSimple(params)

        assert questionSimple.save() != null

        params.id = questionSimple.id

        def model = controller.edit()

        assert model.questionSimpleInstance == questionSimple
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/questionSimple/list'

        response.reset()

        populateValidParams(params)
        def questionSimple = new QuestionSimple(params)

        assert questionSimple.save() != null

        // test invalid parameters in update
        params.id = questionSimple.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/questionSimple/edit"
        assert model.questionSimpleInstance != null

        questionSimple.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/questionSimple/show/$questionSimple.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        questionSimple.clearErrors()

        populateValidParams(params)
        params.id = questionSimple.id
        params.version = -1
        controller.update()

        assert view == "/questionSimple/edit"
        assert model.questionSimpleInstance != null
        assert model.questionSimpleInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/questionSimple/list'

        response.reset()

        populateValidParams(params)
        def questionSimple = new QuestionSimple(params)

        assert questionSimple.save() != null
        assert QuestionSimple.count() == 1

        params.id = questionSimple.id

        controller.delete()

        assert QuestionSimple.count() == 0
        assert QuestionSimple.get(questionSimple.id) == null
        assert response.redirectedUrl == '/questionSimple/list'
    }
}

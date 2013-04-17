package TpJee



import org.junit.*
import grails.test.mixin.*

@TestFor(QuestionQcmController)
@Mock(QuestionQcm)
class QuestionQcmControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/questionQcm/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.questionQcmInstanceList.size() == 0
        assert model.questionQcmInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.questionQcmInstance != null
    }

    void testSave() {
        controller.save()

        assert model.questionQcmInstance != null
        assert view == '/questionQcm/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/questionQcm/show/1'
        assert controller.flash.message != null
        assert QuestionQcm.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/questionQcm/list'

        populateValidParams(params)
        def questionQcm = new QuestionQcm(params)

        assert questionQcm.save() != null

        params.id = questionQcm.id

        def model = controller.show()

        assert model.questionQcmInstance == questionQcm
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/questionQcm/list'

        populateValidParams(params)
        def questionQcm = new QuestionQcm(params)

        assert questionQcm.save() != null

        params.id = questionQcm.id

        def model = controller.edit()

        assert model.questionQcmInstance == questionQcm
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/questionQcm/list'

        response.reset()

        populateValidParams(params)
        def questionQcm = new QuestionQcm(params)

        assert questionQcm.save() != null

        // test invalid parameters in update
        params.id = questionQcm.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/questionQcm/edit"
        assert model.questionQcmInstance != null

        questionQcm.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/questionQcm/show/$questionQcm.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        questionQcm.clearErrors()

        populateValidParams(params)
        params.id = questionQcm.id
        params.version = -1
        controller.update()

        assert view == "/questionQcm/edit"
        assert model.questionQcmInstance != null
        assert model.questionQcmInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/questionQcm/list'

        response.reset()

        populateValidParams(params)
        def questionQcm = new QuestionQcm(params)

        assert questionQcm.save() != null
        assert QuestionQcm.count() == 1

        params.id = questionQcm.id

        controller.delete()

        assert QuestionQcm.count() == 0
        assert QuestionQcm.get(questionQcm.id) == null
        assert response.redirectedUrl == '/questionQcm/list'
    }
}

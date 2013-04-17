package tpjee
import TpJee.Question;
import TpJee.User;
class QuestionListeTagLib {
	def liste={attrs,body->
		def enseignant=User.findAllByNom(attrs.user)
		def questionListe=enseignant.question
		questionListe.each{question -> out<< question.question
		}

	}
}
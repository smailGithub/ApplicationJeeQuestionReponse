package TpJee
import java.util.Date;
class Question {
	String question
	Date date
	static belongsTo=[enseigant:Enseignant]
	
	String toString(){
		//return "Question [ Question : "+question+" Date : "+date+"]"
	}
    static constraints = {
    }
}

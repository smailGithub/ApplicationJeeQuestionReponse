package TpJee

class Etudiant extends User{
	
	static hasMany=[reponses:Reponse]

    static constraints = {
    }
}

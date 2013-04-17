package TpJee

class Enseignant extends User{
	
	static hasMany=[question :Question]

    static constraints = {
    }
}

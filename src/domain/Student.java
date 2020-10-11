package domain;

public class Student { 
	private String name;  /*학생의 이름*/
	private int studentId;  /*학번*/
	private int kor;   /*국어 점수*/
	private int eng;  /*영어 점수*/
	private int mat;  /*수학 점수*/
	
	public Student(String name, int studentId, int kor, int eng, int mat) { /*학생의 생성자, 이름, 학번, 점수들 필요*/
		this.name = name;
		this.studentId = studentId;
		this.kor = kor;
		this.eng = eng;
		this.mat = mat;
	}
	
	public Student(String name, int kor, int eng, int mat) {  /*학생의 생성자, 이름, 점수들 필요, 학번은 자동부여임으로 필요 없음.*/
		super();
		this.name = name;
		this.kor = kor;
		this.eng = eng;
		this.mat = mat;
	}

	public String getName() {  /*학생 이름 getter*/
		return name;
	}
	public void setName(String name) {  /*학생 이름 setter*/
		this.name = name;
	}
	public int getStudentId() {  /*학번 getter*/
		return studentId;
	}
	public void setStudentId(int studentId) {  /*학번 setter*/
		this.studentId = studentId;
	}
	public int getKor() {  /*국어 점수 getter*/
		return kor;
	}
	public void setKor(int kor) {   /*국어 점수 setter*/
		this.kor = kor;
	}
	public int getEng() {   /*영어 점수 getter*/
		return eng;
	}
	public void setEng(int eng) {   /*영어 점수 setter*/
		this.eng = eng;
	}
	public int getMat() {   /*수학 점수 getter*/
		return mat;
	}
	public void setMat(int mat) {   /*수학 점수 setter*/
		this.mat = mat;
	}
}

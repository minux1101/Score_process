package service;

import java.util.List;

import dao.StudentDao;
import domain.Student;

public class StudentService {
	private StudentDao studentDao = new StudentDao(); //StudentDao 객체 생성
	
	// C
	public void create() { 
		studentDao.create(); //studentDao의 create() 메소드 호출
	}
	
	public void insert(Student student) {
		studentDao.insert(student); //studentDao의 insert() 메소드 호출
	}	
	
	public void insertAllset() { //랜덤으로 값을 주어서 10개 자료를 DB에 입력
		for (int i = 0; i < 10; i++) {
		Student studenti = new Student("홍길"+(i+1), 209901 + i, (int)(Math.random()*100), (int)(Math.random()*100), (int)(Math.random()*100));		
		studentDao.insert(studenti);
		}
	}
	
	public void insertone(Student student) { // DB에 있는 자료 중 마지막을 가져와서 학번에 1을 더하고 새로 입력할 자료에 넣어줌.
		List<Student> studentlists = selectAll();
		Student student1 = studentlists.get(studentlists.size() - 1);
		student.setName(student.getName());
		student.setStudentId(student1.getStudentId() + 1);
		student.setKor(student.getKor());
		student.setEng(student.getEng());
		student.setMat(student.getMat());
		studentDao.insert(student);		
	}
	
	// R

	public Student selectOne(int studentId) { //학번을 가지고 해당 학번의 학생의 자료를 불러온다.
		return studentDao.selectOne(studentId);
	}
	
	public List<Student> selectAll() {  //DB에 있는 자료를 모두 불러오는 studentDao의 메소드 sellctAll()을 호출
		return studentDao.selectAll();
	}
	
	// U
	public void update(Student student) {  //DB에 있는 학생 한 명을 수정하는  studentDao의 메소드 update()를 호출
		studentDao.update(student);
	}
	
	// D
	public void delete(int studentId) {  //DB에 있는 학생 한 명을 삭제하는  studentDao의 메소드 update()를 호출
		studentDao.delete(studentId);
	}
	
	public void drop() {   //DB에 테이블을 삭제하는 studentDao의 메소드 drop()를 호출
		studentDao.drop();
	}
	
	public void createCount() {   //DB에 count 테이블을 삭제하는 studentDao의 메소드 createCount()를 호출
	      studentDao.createCount();
	   }
	
	public int updateCount() {  //DB에 count 테이블에 숫자를 1씩 더하는 studentDao의 메소드 updateCount()를 호출
	      return studentDao.updateCount();
	   }	
}

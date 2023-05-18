package com.codingdojo.test.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingdojo.test.models.Class;
import com.codingdojo.test.models.Student;
import com.codingdojo.test.repositories.ClassRepository;
import com.codingdojo.test.repositories.StudentRepository;

@Service
public class StudentService {

    @Autowired
    private StudentRepository studentRepo;

    @Autowired
    private ClassRepository classRepo;


    // All students
    public List<Student> allStudents() {
        return studentRepo.findAll();
    }

    // find student by id
    public Student findStudentById(Long id) {
        return studentRepo.findById(id).orElse(null);
    }

    // create or update student
    public Student createOrUpdateStudent(Student student) {
        return studentRepo.save(student);
    }

    // delete student
    public void deleteStudent(Long id) {
        studentRepo.deleteById(id);
    }

    // Add student to class
    public void addStudentToClass(Long studentId, Long classId) {
        Student thisStudent = studentRepo.findById(studentId).orElse(null);
        Class thisClass = classRepo.findById(classId).orElse(null);
        System.out.println("student Id:" + studentId);
        System.out.println("class Id:" + classId);
        
        if(thisStudent != null && thisClass != null) {
        	thisStudent.getClasses().add(thisClass);
        	studentRepo.save(thisStudent);
        	System.out.println("success");
        	
        }   
    }

    // Remove student from class
    public void removeStudentFromClass(Long studentId, Long classId) {
        Student thisStudent = studentRepo.findById(studentId).orElse(null);
        Class thisClass = classRepo.findById(classId).orElse(null);
        
        if(thisStudent != null && thisClass != null) {
        	thisStudent.getClasses().remove(thisClass);
        	studentRepo.save(thisStudent);
        }   
    }
    
    public List<Student> findStudentsInClass(Class classes){
    	return studentRepo.findAllByClasses(classes);
    }
    
    public List<Student> findStudentNotInClass(Class classes){
    	return studentRepo.findByClassesNotContains(classes);
    }

    // find student not in dorm
    public List<Student> findStudentNotInDorm() {
        return studentRepo.findByDormIsNull();
    }
    



}

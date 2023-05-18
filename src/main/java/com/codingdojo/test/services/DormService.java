package com.codingdojo.test.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingdojo.test.models.Dorm;
import com.codingdojo.test.models.Student;
import com.codingdojo.test.repositories.DormRepository;
import com.codingdojo.test.repositories.StudentRepository;

@Service
public class DormService {

    @Autowired
    private DormRepository dormRepo;

    @Autowired
    private StudentRepository studentRepo;

    // All dorms
    public List<Dorm> allDorms() {
        return dormRepo.findAll();
    }

    // find dorm by id
    public Dorm findDormById(Long id) {
        return dormRepo.findById(id).orElse(null);
    }

    // create or update dorm
    public Dorm createOrUpdateDorm(Dorm dorm) {
        return dormRepo.save(dorm);
    }

    // delete dorm
    public void deleteDorm(Long id) {
        dormRepo.deleteById(id);
    }
    
    // find student in dorm
    public List<Student> findStudentsInDorm(Long dormId) {
        return studentRepo.findByDormIdIs(dormId);
    }

    // add student to dorm
    public void addStudentToDorm(Long studentId, Long dormId) {
        Student thisStudent = studentRepo.findById(studentId).orElse(null);
        Dorm thisDorm = dormRepo.findById(dormId).orElse(null);
        System.out.println("Student Id:" + studentId);
        System.out.println("Dorm Id:" + dormId);
        
        if(thisStudent != null && thisDorm != null) {
            thisStudent.setDorm(thisDorm);
        	// Loop through students in dorm
            for(Student student : thisDorm.getStudents()) {
            	System.out.println("Student in dorm: " + student.getFirstName());
            }
            studentRepo.save(thisStudent);
            System.out.println("added to data base");
        } 
        else {
        	System.out.println("Didnt add to data base");
        }
    }

    // remove student from dorm
    public void removeStudentFromDorm(Long studentId) {
        Student thisStudent = studentRepo.findById(studentId).orElse(null);
        if(thisStudent != null) {
        	thisStudent.setDorm(null);
            studentRepo.save(thisStudent);
            System.out.println("Removed from dorm");
        }   
    }

    

}

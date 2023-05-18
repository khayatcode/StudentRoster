package com.codingdojo.test.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingdojo.test.models.Class;
import com.codingdojo.test.models.Student;
import com.codingdojo.test.repositories.ClassRepository;
import com.codingdojo.test.repositories.StudentRepository;

@Service
public class ClassService {
	

    @Autowired
    private ClassRepository classRepo;

    @Autowired
    private StudentRepository studentRepo;
    
    // find all classes
    public List<Class> allClasses() {
        return classRepo.findAll();
    }

    // find class by id
    public Class findClassById(Long id) {
        return classRepo.findById(id).orElse(null);
    }

    // create or update class
    public Class createOrUpdateClass(Class classes) {
        return classRepo.save(classes);
    }

    // delete class
    public void deleteClass(Long id) {
        classRepo.deleteById(id);
    }

    // see all classes for a student
    public List<Class> findClassesForStudent(Student student) {
        return classRepo.findAllByStudents(student);
    }

    // find classes not taken by student
    public List<Class> findClassesNotTakenByStudent(Student student) {
        return classRepo.findByStudentsNotContains(student);
    }



}

package com.codingdojo.test.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.test.models.Class;
import com.codingdojo.test.models.Student;

@Repository
public interface StudentRepository extends CrudRepository<Student, Long> {

    List <Student> findAll();
    List <Student> findAllByClasses(Class classes);
    List <Student> findByClassesNotContains(Class classes);
    List<Student> findByDormIdIs(Long dormId);
    List<Student> findByDormIsNull();
    
    
}

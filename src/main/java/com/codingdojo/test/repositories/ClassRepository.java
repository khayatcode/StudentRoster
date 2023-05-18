package com.codingdojo.test.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.test.models.Class;
import com.codingdojo.test.models.Student;

@Repository
public interface ClassRepository extends CrudRepository<Class, Long> {
    List <Class> findAll();

    List <Class> findAllByStudents(Student student);

    List <Class> findByStudentsNotContains(Student student);

}

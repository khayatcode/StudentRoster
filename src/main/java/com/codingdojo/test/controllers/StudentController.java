package com.codingdojo.test.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.codingdojo.test.models.Student;
import com.codingdojo.test.services.ClassService;
import com.codingdojo.test.services.StudentService;

import jakarta.validation.Valid;

@Controller
@RequestMapping("/student")
public class StudentController {
	
	@Autowired
	private StudentService studentService;
	
	@Autowired
	private ClassService classService;

    // create student page
    @GetMapping("/create/page")
    public String newStudent(@ModelAttribute("student") Student student) {
        return "newStudent.jsp";
    }

    // create student
    @PostMapping("/create/new")
    public String createStudent(@Valid @ModelAttribute("student") Student student, BindingResult result, Model model) {
        if (result.hasErrors()) {
        	model.addAttribute("BindingResult", result);
            return "newStudent.jsp";
        } else {
            studentService.createOrUpdateStudent(student);
            return "redirect:/student/show/all";
        }
    }

    // view all students
    @GetMapping("/show/all")
    public String viewAllStudents(Model model) {
        model.addAttribute("students", studentService.allStudents());
        return "allStudent.jsp";
    }

    // view student by id. show all classes the student is taking
    @GetMapping("/show/{id}")
    public String showStudent(@PathVariable("id") Long studentId, Model model) {
        Student student = studentService.findStudentById(studentId);
        model.addAttribute("student", student);
        model.addAttribute("courses", classService.findClassesForStudent(student));
        model.addAttribute("allClasses", classService.findClassesNotTakenByStudent(student));
        System.out.println("student Id:" + studentId);

        return "studentClasses.jsp";
    }

    // add class to student
    @PostMapping("/join/class/{id}")
    public String joinClass(@PathVariable("id") Long studentId, @RequestParam(value = "course", required = false) Long classId, Model model) {
    	Student student = studentService.findStudentById(studentId);
        if(classId == null) {
            model.addAttribute("student", student);
            model.addAttribute("courses", classService.findClassesForStudent(student));
            model.addAttribute("allClasses", classService.findClassesNotTakenByStudent(student));
            model.addAttribute("errorMessage", "Your Submission was Invalid");
            System.out.println("Error");
            return "studentClasses.jsp";
        } else if(student.getDorm() == null) {
        	model.addAttribute("student", student);
            model.addAttribute("courses", classService.findClassesForStudent(student));
            model.addAttribute("allClasses", classService.findClassesNotTakenByStudent(student));
        	model.addAttribute("errorMessage", "Please register to a dorm first, for you to be able to take a class.");
        	return "studentClasses.jsp";
        } else {
        	
        	System.out.println("student Id:" + studentId);
        	System.out.println("class Id:" + classId);
        	studentService.addStudentToClass(studentId, classId);
        	return "redirect:/student/show/" + studentId;
        }
    }


    // delete student
    @DeleteMapping("/delete/{id}")
    public String deleteStudent(@PathVariable("id") Long id) {
        studentService.deleteStudent(id);
        return "redirect:/student/show/all";
    }



}

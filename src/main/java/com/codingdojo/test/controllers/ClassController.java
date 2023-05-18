package com.codingdojo.test.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.codingdojo.test.models.Class;
import com.codingdojo.test.services.ClassService;
import com.codingdojo.test.services.StudentService;

import jakarta.validation.Valid;

@Controller
@RequestMapping("/class")
public class ClassController {
    
        @Autowired
        private ClassService classService;
    
        @Autowired
        private StudentService studentService;
   
    
        // All classes
        @GetMapping("/show/all")
        public String home(Model model) {
            model.addAttribute("courses", classService.allClasses());
            return "allClasses.jsp";
        }

        // New class page
        @GetMapping("/create/page")
        public String newClass(@ModelAttribute("classes") Class classes) {
            return "newClasses.jsp";
        }

        // Create class
        @PostMapping("/create/new")
        public String createClass(@Valid @ModelAttribute("classes") Class classes, BindingResult result, Model model) {
            if (result.hasErrors()) {
                model.addAttribute("BindingResult", result);
                return "newClasses.jsp";
            } else {
                classService.createOrUpdateClass(classes);
                return "redirect:/class/show/all";
            }
        }

        // View class
        @GetMapping("/show/{id}")
        public String showClass(@PathVariable("id") Long id, Model model) {
            Class classes = classService.findClassById(id);
            model.addAttribute("classes", classes);
            model.addAttribute("students", studentService.findStudentsInClass(classes));
            return "classStudent.jsp";
        }

        // remove class from student
        @PostMapping("/drop/{id}")
        public String dropClass(@PathVariable("id") Long classId, @RequestParam("studentId") Long studentId){
            studentService.removeStudentFromClass(studentId, classId);
            return "redirect:/student/show/" + studentId;
        }



}

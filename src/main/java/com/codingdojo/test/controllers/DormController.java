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

import com.codingdojo.test.models.Dorm;
import com.codingdojo.test.services.DormService;
import com.codingdojo.test.services.StudentService;

import jakarta.validation.Valid;

@Controller
@RequestMapping("/dorm")
public class DormController {

    @Autowired
    private DormService dormService;

    @Autowired
    private StudentService studentService;

    // All dorms
    @GetMapping("/show/all")
    public String home(Model model) {
        model.addAttribute("dorms", dormService.allDorms());
        return "allDorms.jsp";
    }

    // New dorm page
    @GetMapping("/create/page")
    public String newDorm(@ModelAttribute("dorm") Dorm dorm) {
        return "newDorm.jsp";
    }

    // Create dorm
    @PostMapping("/create/new")
    public String createDorm(@Valid @ModelAttribute("dorm") Dorm dorm, BindingResult result, Model model) {
        if (result.hasErrors()) {
            model.addAttribute("BindingResult", result);
            return "newDorm.jsp";
        } else {
            dormService.createOrUpdateDorm(dorm);
            return "redirect:/dorm/show/all";
        }
    }

    // View dorm
    @GetMapping("/show/{id}")
    public String showDorm(@PathVariable("id") Long id, @ModelAttribute("dorm") Dorm dorm, Model model) {
        Dorm thisDorm = dormService.findDormById(id);
        model.addAttribute("dorm", thisDorm);
        model.addAttribute("students", studentService.findStudentNotInDorm());
        return "dormStudents.jsp";
    }
    
    // remove student from dorm
    @PostMapping("/remove/student/{id}")
    public String removeStudentFromDorm(@PathVariable("id") Long studentId, @RequestParam("dormId") Long dormId) {
    	dormService.removeStudentFromDorm(studentId);
    	return "redirect:/dorm/show/" + dormId ;
    }
    
    // add student to dorm
    @PostMapping("/add/student/{id}")
    public String addStudentToDorm(@RequestParam("dormId") Long dormId, @RequestParam(value = "students", required = false) Long studentId, Model model) {
    	if(studentId == null) {
            model.addAttribute("dorm", dormService.findDormById(dormId));
            model.addAttribute("students", studentService.findStudentNotInDorm());
            model.addAttribute("errorMessage", "Please select a student");
            return "dormStudents.jsp";
        }

    	dormService.addStudentToDorm(studentId, dormId);
    	return "redirect:/dorm/show/" + dormId;
    }

    
    
}

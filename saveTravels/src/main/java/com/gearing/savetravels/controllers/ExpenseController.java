package com.gearing.savetravels.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.gearing.savetravels.models.Expense;
import com.gearing.savetravels.services.ExpenseService;

import jakarta.validation.Valid;

@Controller
public class ExpenseController {
	@Autowired
	private ExpenseService expenseService;
	
	@GetMapping("/expenses")
	public String index(Model model, @ModelAttribute Expense expense) {
		List<Expense> expenses = expenseService.allExpenses();
		
		model.addAttribute("expenses", expenses);
		
		return "index.jsp";
	}
	
	@PostMapping("/expenses")
	public String create(Model model, @Valid @ModelAttribute Expense expense, BindingResult result) {
		if(result.hasErrors()) {
			model.addAttribute("expenses", expenseService.allExpenses());
			return "index.jsp";
		}
		
		expenseService.createExpense(expense);
		return "redirect:/expenses";
	}
	
	@GetMapping("/expenses/{id}/edit")
	public String edit(@PathVariable Long id, Model model) {
		model.addAttribute("expense", expenseService.findExpense(id));
		
		return "edit.jsp";
	}
	
	@PutMapping("/expenses/{id}")
	public String update(@Valid @ModelAttribute Expense expense, BindingResult result,
			Model model) {
		if(result.hasErrors()) {
			model.addAttribute("expense", expense);
			return "edit.jsp";
		}
		
		expenseService.updateExpense(expense);
		return "redirect:/expenses";
	}
	
	@GetMapping("/expenses/{id}")
	public String getDetails(@PathVariable Long id, Model model) {
		model.addAttribute("expense", expenseService.findExpense(id));
		return "details.jsp";
	}
	
	@DeleteMapping("/expenses/{id}")
	public String destroy(@PathVariable Long id) {
		expenseService.deleteExpenseById(id);
		return "redirect:/expenses";
	}
}

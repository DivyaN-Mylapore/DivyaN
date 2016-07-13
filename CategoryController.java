package com.furniture.furnitureshop.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.furniture.furnitureshop.dao.CategoryDAO;
import com.furniture.furnitureshop.model.Category;
import com.google.gson.Gson;

@Controller
public class CategoryController
{
	private CategoryDAO categoryDAO;
	@Autowired(required=true)
	@Qualifier(value="categoryDAO")
	public void setCategoryDAO(CategoryDAO ps)
	{
	this.categoryDAO=ps;
	}
	@RequestMapping(value="/category",method=RequestMethod.GET)
	public String listCategories(Model model)
	{
	model.addAttribute("category",new Category());
	model.addAttribute("categoryList",this.categoryDAO.list());
	//return "category";
	List<Category> list=categoryDAO.list();
	Gson gson = new Gson();
	String j=gson.toJson(list);
	System.out.println("jsonCategory"+j);
	model.addAttribute("li",j);
	return "category";
	}
	//For add and update category both
	@RequestMapping(value="/category/add",method=RequestMethod.POST)
	public String addCategory(@ModelAttribute("category") Category category)
	{
		categoryDAO.saveOrUpdate(category);
	return "redirect:/category";
	}
	@RequestMapping("category/remove/{id}")
	public String removeCategory(@PathVariable("id")String id,ModelMap model)throws Exception
	{
	try
	{
		categoryDAO.delete(id);
	model.addAttribute("message","Successfully Added");
	}
	catch(Exception e)
	{
	model.addAttribute("message",e.getMessage());
	e.printStackTrace();
	}
	//redirectAttrs.addFlashAttribute(arg0,arg1)
	return "redirect:/category";
	}
	@RequestMapping("category/edit/{id}")
	public String editCategory(@PathVariable("id")String id,Model model)
	{
	System.out.println("editCategory");
	model.addAttribute("category",this.categoryDAO.get(id));
	model.addAttribute("listCategories",this.categoryDAO.list());
	return "category";
	}

}

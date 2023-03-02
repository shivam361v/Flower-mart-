package com.example.demo.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import java.util.List;

import com.example.demo.entities.LoginCheck;
import com.example.demo.entities.User;
import com.example.demo.services.UserService;

@CrossOrigin(origins="http://localhost:3000")
@RestController
public class UserController {

	@Autowired
	UserService uservice;
	
	@GetMapping("/all")
	public List<User> getAll()
	{
		return uservice.getAll();
	}
	
	@PostMapping("/checkLogin")
	public User checkLogin(@RequestBody LoginCheck lcheck  )
	{
		return uservice.checkLogin(lcheck.getEmail(), lcheck.getPassword());
	}
	
	/*
	@PostMapping("/save")
	public User save(@RequestBody User c)
	{
		return cservice.save(c);
	}
	
	@GetMapping("/getone")    //http://localhost:8080/getone?cid=4
	public User getOne(@RequestParam("cid") int cid)
	{
		return cservice.getOne(cid);
	}
	
	@GetMapping("/getfrompath/{id}") //http://localhost:8080/getfrompath/1/bakul
	public User getFromPath(@PathVariable("id")int cid)
	{
		return cservice.getOne(cid);
	}
	
	//get all contacts having 'a' in fname
	@GetMapping("/getwitha")
	public List<User> getAllhavinga()
	{
		return cservice.getAllWithA();
	}
	
	@GetMapping("/getAllwithor")
	public List<User> getContacts(@RequestParam("email") String mail,@RequestParam("contact") String cno)
	{
		return cservice.getContacts(mail, cno);
	}
	
	@PutMapping("/updatemail")
	public int updateEmail(@RequestParam("cid") int id,@RequestParam("email") String mail)
	{
		return cservice.updateEmail(id, mail);
	}
	*/
	
}

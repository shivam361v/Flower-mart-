package com.example.demo.services;

import java.util.List;
import java.util.NoSuchElementException;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestBody;

import com.example.demo.entities.User;
import com.example.demo.repositories.UserRepository;

@Service
public class UserService 
{
	@Autowired
	UserRepository urepo;
	
	public List<User> getAll()
	{
		return urepo.findAll();
	}
	
	public User checkLogin(String email, String pass)
	{
		Optional<User> opt = urepo.checkLogin(email, pass);
		User c = null;
		try
		{
			c = opt.get();
		}
		catch(NoSuchElementException e)
		{
			c = null;
		}
		return c;
	}
	
	
	public User save(User c)
	{
		return urepo.saveAndFlush(c);
	}
	
	public User getOne(int uid)
	{
		
		Optional<User> opt = urepo.findById(uid);
//		Optional<User> opt = urepo.getById(uid);
		User c = null;
		try
		{
			c = opt.get();
		}
		catch(NoSuchElementException e)
		{
			c = null;
		}
		return c;
		
	}
	
	public boolean updateRegStatus(int uid)
	{
		boolean flag=false;
		int f=urepo.updateRegStatus(uid);
		if(f==1)
		{
			flag=true;
		}
		return flag;
	}
	
//	public 
	
	/*
	public List<User> getAllWithA()
	{
		return crepo.getAllWithA();
	}
	
	public List<User> getContacts(String mail, String cno)
	{
		return crepo.getContacts(mail,cno);
	}
	
	public int updateEmail(int id, String mail)
	{
		return crepo.updateEmail(id, mail);
	}
	*/
	
}

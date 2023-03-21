package com.example.demo.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.entities.Address;
import com.example.demo.repositories.AddressRepository;

@Service
public class AddressService {

	@Autowired
	AddressRepository arepo;
	
	public List<Address> getAll()
	{
		return arepo.findAll();
	}
	
	public Address save(Address add)
	{
		return arepo.save(add);
	}
}

package com.example.demo.services;

import java.util.NoSuchElementException;
import java.util.Optional;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.entities.PaymentDetails;
import com.example.demo.entities.ProductCategory;
import com.example.demo.repositories.PaymentDetailsRepository;

@Service
public class PaymentDetailsService {

	@Autowired
	PaymentDetailsRepository pdrepo;
	
	public PaymentDetails savePaymentDetails(String payment_type)
	{
		String uniqueID = UUID.randomUUID().toString();
		PaymentDetails pd = new PaymentDetails(payment_type, uniqueID);
		
		return pdrepo.save(pd);
	}
	
	public PaymentDetails getOne(int payment_id)
	{
		Optional<PaymentDetails> opt = pdrepo.findById(payment_id);

		PaymentDetails pc = null;
		try
		{
			pc = opt.get();
		}
		catch(NoSuchElementException e)
		{
			pc = null;
		}
		return pc;
	}
}

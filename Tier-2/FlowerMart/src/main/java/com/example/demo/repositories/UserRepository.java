package com.example.demo.repositories;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.query.Procedure;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.example.demo.entities.User;

@Repository
@Transactional
public interface UserRepository extends JpaRepository<User, Integer> {

	
	@Query("select u from User u where email = :email and password = :pass")
	public Optional<User> checkLogin(@Param ("email")String email,@Param ("pass")String pass);
	
	@Modifying
	@Query("update User u set u.status=1 where u.user_id=:uid")
	public int updateRegStatus(@Param ("uid")int uid);
	
	@Modifying
	@Query("update User u set u.status=1 where u.user_id=:uid")
	public int updateRegStatus(int uid);
	
	/*
	@Query("select c from Contact c where fname like '%a%'")
	public List<User> getAllWithA();
	
	//@Query(value="if sql query written",nativeQuery = true)
	//@Query("select c from Contact c where email = :mail and contactno = :cno")
	//public List<Contact> getContacts(String mail, String cno);
	
	//executeQuery()
	@Query("select c from Contact c where email = ?1 or contact = ?2")
	public List<User> getContacts(String mail, String cno);
	
	//executeUpdate()
	@Modifying
	@Query("update Contact c set c.email = :mail where c.cid = :id")
	public int updateEmail(int id, String mail);
	*/
	
	/*
	@Procedure(name = "" ,outputParameterName = "")
	public List<Contact> getC();
	*/
	
}

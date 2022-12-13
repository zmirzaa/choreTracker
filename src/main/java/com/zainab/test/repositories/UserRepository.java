package com.zainab.test.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.zainab.test.models.User;



@Repository
public interface UserRepository extends CrudRepository<User, Long> {
	
	User findByEmail(String email);

}

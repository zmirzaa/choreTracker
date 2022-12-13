package com.zainab.test.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.zainab.test.models.Chore;


@Repository
public interface ChoreRepository extends CrudRepository<Chore, Long>{
	
	List<Chore> findAll(); 

}

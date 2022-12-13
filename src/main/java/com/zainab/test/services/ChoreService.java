package com.zainab.test.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zainab.test.models.Chore;
import com.zainab.test.repositories.ChoreRepository;


@Service
public class ChoreService {
	
	
	@Autowired
	private ChoreRepository cRepo; 
	
	public List<Chore> allChores() {
		return cRepo.findAll(); 
		
	}
	
	public Chore createChore(Chore chore) {
		return cRepo.save(chore); 
	}
	
	
	public void delete(Long id) {
		cRepo.deleteById(id);
	}
	
	public Chore getOneChore(Long id) {
		return cRepo.findById(id).orElse(null); 
	}
	
	public Chore update(Chore chore) {
		return cRepo.save(chore); 
	}

}

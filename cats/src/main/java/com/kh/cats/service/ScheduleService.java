package com.kh.cats.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.kh.cats.dao.FairDao;

@EnableScheduling
@Service
public class ScheduleService {
	
	@Autowired
	private FairDao fairDao;
	
	@Scheduled(cron = "0 0 * * * *")
	public void changeFairStatus() {
		fairDao.editStatus();
		System.out.println("실행됨");
	}

}

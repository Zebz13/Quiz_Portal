package com.deloitte.myQuiz.helper;

import java.io.PrintWriter;
import java.io.StringWriter;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class FactoryProvider {
	
	private static SessionFactory factory;
	
	private static final Logger logger = LogManager.getLogger(FactoryProvider.class);
	
	public static SessionFactory getFactory() {
		
		logger.info("Beginning of Session factory");
		try {
			PropertyConfigurator.configure("C:\\Users\\aimisra\\Documents\\MiniProject\\myQuiz\\src\\main\\resources\\log4j.properties");
			
			if(factory == null) {
				
				logger.info("I am start of if block");
				factory = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
				logger.info("I am end of if block");
			}
			
		}
		catch(Exception e) {
			logger.error("Exception while initializing Factory Provider");
			
			StringWriter sw = new StringWriter();
			e.printStackTrace(new PrintWriter(sw));  //wrapping
			logger.error(sw.toString());
		}
		logger.info("I am end of getFactory() method");
		return factory;
		
	}  //end of getFactory() method
}

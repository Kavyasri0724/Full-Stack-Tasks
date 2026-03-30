package com.example.demo;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
public class ProducerController {
	
		@GetMapping("/message")
		public ResponseEntity<String> getMessage(){
			return ResponseEntity.ok("Hello from producer microservice!");
		}
		
		@GetMapping("/error")
		public ResponseEntity<String> getError(){
			throw new RuntimeException("Simualated failure!");
		}
	}
	
	



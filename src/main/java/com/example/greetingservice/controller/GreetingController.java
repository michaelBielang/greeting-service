package com.example.greetingservice.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController(value = "/v1")
public class GreetingController {

    @GetMapping("/greeting")
    public String greeting() {
        return "Hello User";
    }
}

package com.jinx.manage.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @progrom: helloworld
 * @description:
 * @author: chujg
 * @create: 2018-12-13 16:14
 **/
@RestController
public class IndexController {

    @GetMapping("/")
    public String index() {
        return "helloworld";
    }
}

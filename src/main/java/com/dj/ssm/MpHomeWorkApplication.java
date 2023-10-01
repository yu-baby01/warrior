package com.dj.ssm;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.transaction.annotation.EnableTransactionManagement;

/**
 * @author dj
 */
@MapperScan("com.dj.ssm.mapper")
@SpringBootApplication
@EnableTransactionManagement
    public class MpHomeWorkApplication {

    public static void main(String[] args) {
        SpringApplication.run(MpHomeWorkApplication.class, args);
    }

}

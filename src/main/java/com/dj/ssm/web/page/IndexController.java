package com.dj.ssm.web.page;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.UnsupportedEncodingException;
import java.net.InetAddress;
import java.net.UnknownHostException;

@Controller
@RequestMapping("/index/")
public class IndexController {

    @RequestMapping("toIndex")
    public String toIndex() {
        return "index/index";

    }

    @RequestMapping("toTop")
    public String toTop(Model model) {
        return "index/top";

    }

    @RequestMapping("toLeft")
    public String toLeft() {

        return "index/left";

    }

    @RequestMapping("toRight")
    public String toRight() {

        return "index/right";

    }

}

/**
 *  * @Title: Ld.java
 *  * @Package com.book.cn.util
 *  * @Description: TODO(用一句话描述该文件做什么)
 *  * @author 贾双俊
 *  * @date jeudi 18 05 2023
 *  * @version V1.0
 *  
 */
package com.dj.ssm.util;

import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLEncoder;
import java.util.UUID;

/**
 *  * @ClassName: Ld
 *  * @Description: TODO(这里用一句话描述这个类的作用)
 *  * @author 贾双俊
 *  * @date jeudi 18 05 2023
 *  *
 *  * 
 *  
 */
public class Ld {
    public static String upload(MultipartFile file) throws IllegalStateException, IOException {
        //判断文件是否存在
            File dir = new File("E://upload/");
            //文件不存在就创建
            if (!dir.exists()) {
                dir.mkdirs();
            }
            String newFileName = UUID.randomUUID().toString().replace("-", "")
                    + file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
            //保存
            file.transferTo(new File("E://upload/" + newFileName));
            System.out.println(newFileName);
            return newFileName;
    }

    public static void download(HttpServletResponse response, String fileName) throws IOException {
        response.setHeader("content-disposition", "attachment;filename=" + URLEncoder.encode(fileName, "UTF-8"));
        //读取待下载的文件
        InputStream inputStream = new FileInputStream(new File("E://upload/" + fileName));
        //输出返回给调用者
        OutputStream outputStream = response.getOutputStream();
        IOUtils.copy(inputStream, outputStream);
//        //定义下载容器
//        byte[] car = new byte[4096];
//        int len;
//        //循环读取文件流中的全部对象直至读取完毕
//        while ((len = inputStream.read(car)) > 0) {
//            //输出
//            outputStream.write(car, 0, len);
//    }
    }
}

package com.dj.ssm.config;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.List;

/**
 * 分页对象封装
 */
@Data
@Builder // builder模式 使用创建者模式又叫建造者模式，可以针对传入的参数生成构造方法
/**
 * 实体类使用了@Builder，会有全参构造函数，没有默认无参构造函数，即无法使用默认无参构造函数。
 * 解决方法：
 * 在实体类上同时加上：@Builder、@AllArgsConstructor、@NoArgsConstructor
 *
 * 手写全部有参构造方法，以及 无参构造方法
 *
 * 手写个默认无参构造方法，并加上@Tolerate(容许，通俗来说，被该注解加上的方法，让lombok容许它们存在)
 */
@NoArgsConstructor // 生成一个无参数的构造方法
@AllArgsConstructor //  会生成一个包含所有变量的构造方法，默认生成的方法是 public 的
public class PageResult implements Serializable {

    /**
     * 当前页
     */
    private Long current = 1l;

    /**
     * 总页数
     */
    private Long pages = 1l;

    /**
     * 数据
     */
    private List<?> records;

    /**
     * 分页信息
     *
     * @param current 当前页
     * @param pages   总页数
     * @param records 分页结果
     * @return
     */
    public static PageResult pageInfo(Long current, Long pages, List<?> records) {
        return PageResult.builder().current(current).pages(pages).records(records).build();
    }

}

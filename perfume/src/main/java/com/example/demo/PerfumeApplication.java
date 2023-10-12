package com.example.demo;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.sitemesh.builder.SiteMeshFilterBuilder;
import org.sitemesh.config.ConfigurableSiteMeshFilter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import login.LoginAdmin;
import login.LoginUser;

@SpringBootApplication
@Configuration
@ComponentScan(basePackages = "controller, service, login")
public class PerfumeApplication implements WebMvcConfigurer {

	public static void main(String[] args) {
		SpringApplication.run(PerfumeApplication.class, args);
	}
	
	
	@Bean //mybatis spring boot가 만든 mybatis db pool을 사용한다
	public SqlSessionFactory sqlSessionFactory(DataSource dataSource) throws Exception{
		SqlSessionFactoryBean sessionFactory = new SqlSessionFactoryBean();
		sessionFactory.setDataSource(dataSource);
		sessionFactory.setConfigLocation(
				new PathMatchingResourcePatternResolver()
				.getResource("classpath:mybatis/mybatis-config.xml"));
		return sessionFactory.getObject();
	}
	
	@Bean
	public SqlSessionTemplate sqlSessionTemplate(
			SqlSessionFactory sqlSessionFactory) throws Exception{
		return new SqlSessionTemplate(sqlSessionFactory);
	}

	@Autowired
	LoginUser loginInterceptor;
	@Autowired
	LoginAdmin adminInterceptor;
	
	@Override
	public void addInterceptors (InterceptorRegistry registry) {
		System.out.println("DemoApplication.java-public void addInterceptors-interceptor");
		registry
		.addInterceptor(adminInterceptor)
		.addPathPatterns("/product/productForm")
		.addPathPatterns("/product/productPro")
		.addPathPatterns("/product/productUpdateForm")
		.addPathPatterns("/product/productUpdatePro")
		.addPathPatterns("/product/productDeleteForm")
		.addPathPatterns("/product/productDeletePro")
		.addPathPatterns("/product/productManagement")
		.addPathPatterns("/board/boardForm")
		.addPathPatterns("/board/boardPro")
		.addPathPatterns("board/boardUpdateForm")
		.addPathPatterns("/board/boardUpdatePro")
		.addPathPatterns("/board/boardDeleteForm")
		.addPathPatterns("/board/CommentManagement")
		.addPathPatterns("/member/memberList")
		.addPathPatterns("/member/adminMemberDelete")
		.addPathPatterns("/order/orderManagement")
		.addPathPatterns("/order/orderStateUpdate")
		.addPathPatterns("/board/questionCommentForm");
		
		registry
		.addInterceptor(loginInterceptor)
		.addPathPatterns("/survey/surveyStart")
		.addPathPatterns("/survey/surveyResult")
		.addPathPatterns("/survey/survey01")
		.addPathPatterns("/survey/survey02")
		.addPathPatterns("/survey/survey03fruit")
		.addPathPatterns("/survey/survey03flower")
		.addPathPatterns("/survey/survey03wood")
		.addPathPatterns("/cart/cartPro")
		.addPathPatterns("/cart/cartList")
		.addPathPatterns("/cart/cartUpdate")
		.addPathPatterns("/cart/cartDelete")
		.addPathPatterns("/member/memberInfo")
		.addPathPatterns("/member/memberUpdateForm")
		.addPathPatterns("/member/memberUpdatePro")
		.addPathPatterns("/member/memberPassForm")
		.addPathPatterns("/member/memberPassPro")
		.addPathPatterns("/member/memberDeleteForm")
		.addPathPatterns("/member/memberDeletePro")
		.addPathPatterns("/order/order")
		.addPathPatterns("/order/orderPro")
		.addPathPatterns("/order/orderList")
		.addPathPatterns("/order/orderDetail")
		.addPathPatterns("/order/orderCancelForm")
		.addPathPatterns("/order/orderCancelPro")
		.addPathPatterns("/order/orderResult")
		.addPathPatterns("/order/orderConfirm")
		.addPathPatterns("/board/myComment")
		.addPathPatterns("/board/question")
		.addPathPatterns("/board/questionList")
		.addPathPatterns("/board/questionForm")
		.addPathPatterns("/board/questionPro")
		.addPathPatterns("/board/questionView")
		.addPathPatterns("/board/questionDeleteForm")
		.addPathPatterns("/board/questionDeletePro")
		.addPathPatterns("/board/insertQuestionCommentPro")
		.addPathPatterns("/board/questionCommentDeletePro");
	}	

	
	
	@Bean //'WEB-INF/sitemesh3.xml'의 내용임.
	public FilterRegistrationBean<ConfigurableSiteMeshFilter> siteMeshFilter(){
		FilterRegistrationBean<ConfigurableSiteMeshFilter> filter = 
				new FilterRegistrationBean<ConfigurableSiteMeshFilter>();
		filter.setFilter(new ConfigurableSiteMeshFilter() {
			@Override
			protected void applyCustomConfiguration(SiteMeshFilterBuilder builder) {
				builder
				.addDecoratorPath("/home/*", "/layout/layout.jsp")
				.addDecoratorPath("/member/*", "/layout/layout.jsp")
				.addDecoratorPath("/product/*", "/layout/layout.jsp")
				.addDecoratorPath("/shop/*", "/layout/layout.jsp")
				.addDecoratorPath("/order/*", "/layout/layout.jsp")
				.addDecoratorPath("/board/*", "/layout/layout.jsp")
				.addDecoratorPath("/test/*", "/layout/layout.jsp")
				.addDecoratorPath("/cart/*", "/layout/layout.jsp")
				.addExcludedPath("*/boardDeleteForm")
				.addExcludedPath("*/boardCommentDeleteForm")
				.addExcludedPath("*/surveyStart")
				.addExcludedPath("*/survey01")
				.addExcludedPath("*/survey02")
				.addExcludedPath("*/survey03")
				.addExcludedPath("*/surveyResult")
				.addExcludedPath("*/cartDeleteForm")
				.addExcludedPath("*/productDeleteForm")
				.addExcludedPath("*/reviewEnroll/*")
				.addExcludedPath("*/reviewUpdate")
				.addExcludedPath("*/reviewDelete")
				.addExcludedPath("*/question")
				.addExcludedPath("*/questionDeleteForm")
				.addExcludedPath("*/questionCommentForm");
			}
		});
		return filter;
	}
	
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/view/board/images/**")
				.addResourceLocations("/WEB-INF/view/board/images/"); //실제위치
		registry.addResourceHandler("/view/product/images/**")
				.addResourceLocations("/WEB-INF/view/product/images/"); //실제위치
		registry.addResourceHandler("/images/**")
				.addResourceLocations("/WEB-INF/resource/images/"); //실제위치
		registry.addResourceHandler("/css/**")
				.addResourceLocations("/WEB-INF/resource/css/"); //실제위치
	}
	
}

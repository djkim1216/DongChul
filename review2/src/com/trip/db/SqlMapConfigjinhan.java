package com.trip.db;
import java.io.IOException;
import java.io.Reader;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlMapConfigjinhan {
	
	private SqlSessionFactory sqlSessionFactory;
	
	
	public SqlSessionFactory getSqlSessionFactory() {
		
		String resource = "com/trip/db/mybatis-configjinhan.xml";
		
		try {
			Reader reader = Resources.getResourceAsReader(resource);
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
			System.out.println("SqlMapConfig Error");
			e.printStackTrace();
		}
		
		return sqlSessionFactory;
		
	}
	
}

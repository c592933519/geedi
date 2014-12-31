package com.slapp.base;

import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@ContextConfiguration(locations = { "classpath:spring-servlet.xml",
		"classpath:spring-persistance.xml", "classpath:spring-config.xml" })
// 继承AbstractTransactionalJUnit4SpringContextTests，实现事务回滚
// AbstractTransactionalJUnit4SpringContextTests
@RunWith(SpringJUnit4ClassRunner.class)
public class JunitBaseTest {
}

/* 
 * Copyright (c) 2015
 */
package ua.com.currencyexchange.dao.hbn;

import java.util.List;

import javax.inject.Inject;

import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.authentication.dao.SaltSource;
import org.springframework.security.authentication.encoding.PasswordEncoder;
import org.springframework.stereotype.Repository;

import ua.com.currencyexchange.dao.AccountDao;
import ua.com.currencyexchange.domain.Account;
import ua.com.currencyexchange.domain.UserDetailsAdapter;

/**
 * @author Irochka (afanasievaiv@ya.ru)
 */
@Repository
public class HbnAccountDao extends AbstractHbnDao<Account> implements AccountDao {
	private static final Logger log = LoggerFactory.getLogger(HbnAccountDao.class);
	
	private static final String UPDATE_PASSWORD_SQL =
		"update userlist set spassword = ? where slogin = ?";
	
	@Inject private JdbcTemplate jdbcTemplate;
	@Inject private PasswordEncoder passwordEncoder;
	@Inject private SaltSource saltSource;
	
    private SessionFactory sessionFactory;
	
	public void create(Account account, String password) {
		log.debug("Creating account: {}", account);
		create(account);
		
		log.debug("Updating password");
		Object salt = saltSource.getSalt(new UserDetailsAdapter(account));
		String encPassword = passwordEncoder.encodePassword(password, salt);
		jdbcTemplate.update(UPDATE_PASSWORD_SQL, encPassword, account.getUsername());
	}
	
	public void update(Account account, String password){
		log.debug("Updating account: {}", account);
		merge(account);
		
		log.debug("Updating password");
		Object salt = saltSource.getSalt(new UserDetailsAdapter(account));
		String encPassword = passwordEncoder.encodePassword(password, salt);
		jdbcTemplate.update(UPDATE_PASSWORD_SQL, encPassword, account.getUsername());
	}

	public Account findByUsername(String username) {
		return (Account) getSession()
				.getNamedQuery("userlist.byLogin")
				.setParameter("username", username)
				.uniqueResult();
	}
	
	public List<Account> getAccountList(){
		return this.getAll();
	}
}

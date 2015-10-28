/* 
 * Copyright (c) 2015
 */
package ua.com.currencyexchange.web;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ResponseBody;

import ua.com.currencyexchange.service.CompanyService;

/**
 * @author Irochka 
 */
@Controller
@RequestMapping("/company")
public class CompanyController {
	@Inject private CompanyService companyService;
	
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public @ResponseBody Map<String,? extends Object> getCompanyList() throws Exception {
		Map<String,Object> modelMap = new HashMap<String,Object>(3);
		try{
            modelMap.put("data", companyService.getCompanyList());
            return modelMap;
        } catch (Exception e) {
            e.printStackTrace();
            modelMap.put("success", false);
            return modelMap;
        }
    }
 
    @Autowired
    public void setCompanyService(CompanyService companyService) {
        this.companyService = companyService;
    }
}
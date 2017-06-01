package com.zkingsoft.authority;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.zkingsoft.exception.GlobleException;

@Component("authorityAdapter")
public class MatrixAdapter implements Authority{

	@Autowired
	private Authority authority;
	
	@Override
	public boolean isBtnPermitted(String matchStr) throws IllegalArgumentException {
		if(!authority.isBtnPermitted(matchStr)){
			throw new GlobleException("没有操作权限");
		}
		return true;
	}
	
	
	@Override
	public boolean isFnPermitted(String fnCode) {
		if(!authority.isBtnPermitted(fnCode)){
			throw new GlobleException("没有操作权限");
		}
		return true;
	}
	
	@Override
	public void getLoginOut() {
		authority.getLoginOut();
	}
	
	@Override
	public <T> T getLoginUser() {
		return authority.getLoginUser();
	}
	
	
}

package com.mypack;

public class SmartleadNotFoundException extends RuntimeException {

	private static final long serialVersionUID = -2859292084648724403L;
	
	public SmartleadNotFoundException(String SmartleadId) {
		super("Smartlead not found with id: "+SmartleadId);
	}

}

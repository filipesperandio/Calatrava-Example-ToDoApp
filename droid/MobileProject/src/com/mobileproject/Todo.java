package com.mobileproject;

import java.util.Arrays;
import java.util.List;

import com.calatrava.CalatravaPage;
import com.calatrava.shell.WebViewActivity;

@CalatravaPage(name = Todo.PAGE_NAME)
public class Todo extends WebViewActivity {
	public static final String PAGE_NAME = "todoForm";
	
	@Override
	protected String getPageName() {
		return PAGE_NAME;
	}

	@Override
	protected List<String> getEvents() {
		return Arrays.asList("submit", "taskDone");
	}

	@Override
	protected List<String> getFields() {
		return Arrays.asList("taskInput");
	}
}

package com.mobileproject;

import java.util.Arrays;
import java.util.List;

import com.calatrava.CalatravaPage;
import com.calatrava.shell.WebViewActivity;

@CalatravaPage(name = TodoForm.pageName)
public class TodoForm extends WebViewActivity {
	public final static String pageName = "todoForm";

	@Override
	protected String getPageName() {
		return pageName;
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

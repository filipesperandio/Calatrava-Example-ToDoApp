package com.mobileproject;

import static com.calatrava.bridge.Launcher.launchKernel;
import android.app.Activity;
import android.os.Bundle;

import com.calatrava.bridge.Launcher;

public class MobileProject extends Activity {
	@Override
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.main);

		Runnable startUp = new Runnable() {
			public void run() {
				Launcher.launchFlow("todo.start");
			}
		};

		launchKernel("com.mobileproject", this, getApplication(), startUp);
	}
}

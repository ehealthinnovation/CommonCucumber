package org.ehealthinnovation.androidDemo;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity {

    private EditText mUsernameEditText;
    private EditText mPasswordEditText;

    private TextView mErrorTextView;

    private Button mSubmitButton;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        mUsernameEditText = (EditText) findViewById(R.id.main_username_edittext);
        mPasswordEditText = (EditText) findViewById(R.id.main_password_edittext);

        mErrorTextView = (TextView) findViewById(R.id.main_error_text);
        mSubmitButton = (Button) findViewById(R.id.main_submit_button);

        mErrorTextView.setVisibility(View.INVISIBLE);

        mSubmitButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String correctUsername = "test";
                String correctPassword = "test";

                if (mUsernameEditText.getText().toString().equals(correctUsername) && mPasswordEditText.getText().toString().equals(correctPassword)) {
                    Intent newIntent = new Intent(MainActivity.this, HomeActivity.class);
                    MainActivity.this.startActivity(newIntent);
                    mErrorTextView.setVisibility(View.INVISIBLE);
                } else {
                    mErrorTextView.setVisibility(View.VISIBLE);
                }

            }
        });

        /*
        Intent myIntent = new Intent(CurrentActivity.this, NextActivity.class);
myIntent.putExtra("key", value); //Optional parameters
CurrentActivity.this.startActivity(myIntent);
        */
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.menu_main, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();

        //noinspection SimplifiableIfStatement
        if (id == R.id.action_settings) {
            return true;
        }

        return super.onOptionsItemSelected(item);
    }
}

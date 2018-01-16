package org.apache.cordova.logcat;
import java.io.File;
import java.io.IOException;
import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaPlugin;
import org.json.JSONArray;
import org.json.JSONException;
import android.os.Environment;


public class LogCat extends CordovaPlugin {
	protected void pluginInitialize() {
	  }

    public String getFilePath(){
        File outputFile = new File(cordova.getActivity().getApplicationContext().getFilesDir(),"logcat.txt");
        return outputFile.getAbsolutePath();
    }
	  public boolean execute(String action, JSONArray args, CallbackContext callbackContext) throws JSONException {
	    if (action.equals("logToFile")) {
            // save logcat in file
            try {
                Runtime.getRuntime().exec("logcat -f " + getFilePath());
            } catch (IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
            return true;
	    }if (action.equals("getLogPath")) {
            callbackContext.success(getFilePath());
        }
        else{
	        return false;
	    }
      }
}
<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Settings;

class SettingController extends Controller
{
    public function getSettings(){
        $settings = Settings::get();
        $settingsData = [];

        foreach ($settings as $setting) {
            $settingsData[$setting->key] = $setting->value;
        }

        return $settingsData;
    }

    public function saveSettings(Request $request)
    {
        foreach ($request->request as $key => $value){
            $setting = Settings::where('key', $key)->first();
            if ($setting){
                $setting->value = $value;
                $setting->update();
            }
        }

        return redirect()->route('admin_settings', ['save' => true]);
    }

    public function saveSettingsHome(Request $request)
    {
        foreach ($request->files as $key => $value){
            $extension = $request->file("$key")->getClientOriginalExtension();
            $fileNameToStore = time().$key.'.'.$extension;
            $request->file("$key")->storeAs('public/settings',$fileNameToStore);

            $setting = Settings::where('key', $key)->first();
            if ($setting){
                $setting->value = $fileNameToStore;
                $setting->update();
            }
        }

        return redirect()->route('admin_settings', ['save' => true]);
    }
}

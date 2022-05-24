//
//  AdMob_AppOpen_DemoApp.swift
//  AdMob-AppOpen-Demo
//
//  Created by TAISHIN MIYAMOTO on 2022/05/24.
//

import SwiftUI
import GoogleMobileAds

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
    ) -> Bool {
        GADMobileAds.sharedInstance().start(completionHandler: nil)
        return true
    }
}

@main
struct AdMob_AppOpen_DemoApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @ObservedObject var appOpen = AppOpen()
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .onChange(of: appOpen.appOpenAdLoaded) { newValue in
            appOpen.ShowAppOpenAd()
        }
    }
}

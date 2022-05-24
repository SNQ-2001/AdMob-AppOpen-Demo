//
//  AppOpen.swift
//  AdMob-AppOpen-Demo
//
//  Created by TAISHIN MIYAMOTO on 2022/05/24.
//

import GoogleMobileAds

class AppOpen: NSObject, GADFullScreenContentDelegate, ObservableObject {

    @Published var appOpenAdLoaded: Bool = false
    var appOpenAd: GADAppOpenAd?

    override init() {
        super.init()
        LoadAppOpenAd()
    }

    func LoadAppOpenAd() {
        let request = GADRequest()
        GADAppOpenAd.load(
            withAdUnitID: "ca-app-pub-3940256099942544/5662855259",
            request: request,
            orientation: UIInterfaceOrientation.portrait
        ) { appOpenAdIn, _ in
            self.appOpenAd = appOpenAdIn
            self.appOpenAd?.fullScreenContentDelegate = self
            self.appOpenAdLoaded = true
            print("🍊: 準備完了しました")
        }
    }

    func ShowAppOpenAd() {
        guard let root = self.appOpenAd else { return }
        root.present(fromRootViewController: (UIApplication.shared.windows.first?.rootViewController)!)
    }

    func ad(_ ad: GADFullScreenPresentingAd, didFailToPresentFullScreenContentWithError error: Error) {
        self.LoadAppOpenAd()
        print("😭: エラー -> \(error)")
    }

    func adDidDismissFullScreenContent(_ ad: GADFullScreenPresentingAd) {
        self.LoadAppOpenAd()
        print("🍅: 閉じました")
    }
}

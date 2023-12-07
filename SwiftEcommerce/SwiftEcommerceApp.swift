import SwiftUI
import Foundation

@main
struct SwiftEcommerceApp: App {
    
    @State var getStartedViewed = false

    func setGetStarted() {
        let defaults = UserDefaults.standard
        let checkGetStarted = defaults.bool(forKey: "getStartedViewed")
        if !checkGetStarted {
            defaults.set(true, forKey: "getStartedViewed")
        }
        else {
            getStartedViewed = true
        }
    }
    
    var body: some Scene {
        WindowGroup {
            
            if getStartedViewed {
                ContentView()
            }
            else {
                GetStartedView().onAppear() {
                    setGetStarted()
                }
            }
            
        }
    }
}

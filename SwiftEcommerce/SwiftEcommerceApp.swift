import SwiftUI
import Foundation

@main
struct SwiftEcommerceApp: App {
    
    @State var getStartedViewed = false
    @State var isLoggedIn = false

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
    
    func checkLoggedIn() {
        if UserDefaults.standard.string(forKey: "accessToken")?.isEmpty == nil {
            isLoggedIn = false
        }
        else {
            isLoggedIn = true
        }
    }
 
    var body: some Scene {
        WindowGroup {
            
            if isLoggedIn {
                    ContentView()
                }
                else {
                    LoginView().onAppear() {
                        checkLoggedIn()
                    }
                }
                        
        }
    }
}

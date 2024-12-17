import SwiftUI

class CandyMenuViewModel: ObservableObject {
    let contact = CandyMenuModel()
    @Published var isShopAvailible = false
    @Published var isSettingsAvailible = false
    @Published var isStageAvailible = false

    func goToShop() {
        isShopAvailible = true
    }
    
    func goToSettings() {
        isSettingsAvailible = true
    }
    
    func goToStage() {
        isStageAvailible = true
    }
    
    func goTo() {
        
    }
}

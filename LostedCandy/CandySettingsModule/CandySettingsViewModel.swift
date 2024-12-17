import SwiftUI

class CandySettingsViewModel: ObservableObject {
    let contact = CandySettingsModel()
    @Published var isMenuAvailible = false
    @Published var currentIndex = 3
    
    func goToMenu() {
        isMenuAvailible = true
    }
    
    func goTo() {
        
    }
    
    func increaseIndex() {
        currentIndex += 1
    }
    
    func lowerIndex() {
        currentIndex -= 1
    }
}

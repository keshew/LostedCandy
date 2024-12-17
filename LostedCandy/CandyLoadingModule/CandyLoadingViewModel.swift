import SwiftUI

class CandyLoadingViewModel: ObservableObject {
    let contact = CandyLoadingModel()
    @Published var isMenuAvailible = false
    @Published var currentIndex = 0
    @Published var timer: Timer?
    @Published var index = 0
    func goToMenu() {
        isMenuAvailible = true
    }
    
    func loadScreen() -> (CGFloat, CGFloat, String) {
        return (contact.sizeOfImage[currentIndex], contact.arrayXOffset[currentIndex], contact.arrayOfText[currentIndex])
    }
    
    func loadScreenH() -> (CGFloat, CGFloat, String) {
        return (contact.sizeOfImageH[currentIndex], contact.arrayXOffsetH[currentIndex], contact.arrayOfTextH[currentIndex])
    }
    
    func startTimer() {
         timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { _ in
             self.changeText()
         }
     }
    
    func changeText() {
        index -= 1
     
     }
}

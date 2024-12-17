import SwiftUI

class BoomLoadingViewModel: ObservableObject {
    let contact = BoomLoadingModel()
    @Published var currentIndex = 0
    @Published var timer: Timer?
    @Published var index = 0
    @Published var isBoomBlust = false
    
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

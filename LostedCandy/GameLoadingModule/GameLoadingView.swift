import SwiftUI

struct GameLoadingView: View {
    @StateObject var gameLoadingModel =  GameLoadingViewModel()
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    var body: some View {
        GeometryReader { geometry in
            if verticalSizeClass == .compact {
                ZStack {
                    Image(CandyImageName.menuHBackground.rawValue)
                        .resizable()
                        .ignoresSafeArea()
                    
                    Image(CandyImageName.gameLabel.rawValue)
                        .resizable()
                        .frame(width: geometry.size.width / 2, height: geometry.size.height / 2)
                        .offset(x: geometry.size.width / -3, y: -geometry.size.height / 4.6)
                    
                    Image(CandyImageName.liza.rawValue)
                        .resizable()
                        .frame(width: 200, height: 380)
                        .position(x: geometry.size.width / 3, y: geometry.size.height / 1.2)
                    
                    Image(CandyImageName.tipsLabel.rawValue)
                        .resizable()
                        .frame(width: 350, height: 220)
                        .position(x: geometry.size.width / 1.4, y: geometry.size.height / 3.2)
                    
                    Text("TIPS")
                        .Lucky(size: 40, color: .pink, colorOutline: .white)
                        .offset(x: 80, y: -120)
                    
                    Text("Look for the same candies and match them to help Lily win!")
                        .Lucky(size: 20, color: .pink, colorOutline: .white)
                        .frame(width: 300)
                        .offset(x: 180, y: -60)
                    
                    Text("learning")
                        .Lucky(size: 50)
                        .rotationEffect(.degrees(-15))
                        .offset(x: -260, y: -110)
                    
                    VStack {
                        Spacer()
                        Text("LOADING")
                            .Lucky(size: 30)
                        
                        ZStack {
                            Image(CandyImageName.backLoadLine.rawValue)
                                .resizable()
                                .frame(width: geometry.size.width / 1.2, height: 25)
                            
                            Image(CandyImageName.loadLine.rawValue)
                                .resizable()
                                .frame(width: geometry.size.width / gameLoadingModel.loadScreenH().0, height: 20)
                                .offset(x: gameLoadingModel.loadScreenH().1, y: -2)
                        }
                        Text(gameLoadingModel.loadScreenH().2)
                            .Lucky(size: 24)
                    }
                    .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
                }
                .onAppear {
                    gameLoadingModel.startTimer()

                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        gameLoadingModel.currentIndex = 1
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        gameLoadingModel.isMainGame = true
                    }
                }
                .navigationDestination(isPresented: $gameLoadingModel.isMainGame) {
                    MainGameView()
                }
            }
        }
    }
}

#Preview {
    GameLoadingView()
}


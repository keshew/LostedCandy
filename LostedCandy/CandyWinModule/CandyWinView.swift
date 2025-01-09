import SwiftUI

struct CandyWinView: View {
    @StateObject var candyWinModel =  CandyWinViewModel()
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    var body: some View {
        GeometryReader { geometry in
            if verticalSizeClass == .compact {
                ZStack {
                    Image(CandyImageName.winBackground.rawValue)
                        .resizable()
                        .ignoresSafeArea()
                    
                    ZStack {
                        Image(CandyImageName.congrBackLabel.rawValue)
                            .resizable()
                            .frame(width: 700, height: 130)
                        
                        Text("NEXT GO TO LEVEL")
                            .Lucky(size: 32, color: .pink, colorOutline: .white)
                            .offset(x: 20, y: -5)
                        
                        Image(CandyImageName.lizaWin.rawValue)
                            .resizable()
                            .frame(width: 200, height: 230)
                            .offset(x: 240, y: -50)
                        
                        Text("I've already won! Then rather try your hand at the next level!")
                            .Lucky(size: 14, color: .pink, colorOutline: .white)
                            .frame(width: 200)
                            .multilineTextAlignment(.leading)
                            .offset(x: -40, y: 35)
                    }
                    .offset(x: 80, y: 150)
                    
                    ZStack {
                        Image(CandyImageName.winBack.rawValue)
                            .resizable()
                            .frame(width: 600, height: 220)
                        
                        Image(CandyImageName.youWinBack.rawValue)
                            .resizable()
                            .frame(width: 350, height: 95)
                            .offset(x: 50, y: -100)
                        
                        Text("YOU WIN!")
                            .Lucky(size: 65, color: .yellow, outlineWidth: 1)
                            .offset(x: 50, y: -90)
                        
                        HStack(spacing: -20) {
                            ZStack {
                                Image(CandyImageName.winBackButton.rawValue)
                                    .resizable()
                                    .frame(width: 250, height: 80)
                                
                                HStack {
                                    Text("100000")
                                        .Lucky(size: 24)
                                    
                                    Image(CandyImageName.coin2.rawValue)
                                        .resizable()
                                        .frame(width: 45, height: 45)
                                        .offset(y: -3)
                                }
                            }
                            
                            ZStack {
                                Image(CandyImageName.winBackButton.rawValue)
                                    .resizable()
                                    .frame(width: 250, height: 80)
                                
                                HStack {
                                    Text("100000")
                                        .Lucky(size: 24)
                                    
                                    Image(CandyImageName.candys.rawValue)
                                        .resizable()
                                        .frame(width: 45, height: 45)
                                        .offset(y: -3)
                                }
                            }
                        }
                        .offset(x: -5, y: 10)
                        
                        Button(action: {
                            candyWinModel.isMenuAvailible = true
                            
                            OrientationManager.setPortraitOrientation()
                                 AppDelegate.orientationLock = .all
                        }) {
                            ZStack {
                                Image(CandyImageName.goToLevelLabel.rawValue)
                                    .resizable()
                                    .frame(width: 200, height: 50)
                                
                                Text("GO TO LEVEL")
                                    .Lucky(size: 24)
                            }
                        }
                        .offset(x: -50, y: 90)
                    }
                    .offset(x: -20)
                    
                    
                    
                    Button(action: {
                        
                    }) {
                        ZStack {
                            Image(CandyImageName.backSettingsButton.rawValue)
                                .resizable()
                                .frame(width: 100, height: 80)
                            
                            Image(CandyImageName.gear.rawValue)
                                .resizable()
                                .frame(width: 50, height: 50)
                                .offset(y: -3)
                        }
                    }
                    .offset(x: -350, y: 155)
                }
            }
        }
        
        .navigationDestination(isPresented: $candyWinModel.isMenuAvailible) {
            CandyStageView()
        }
        
        .onDisappear {
           
        }
        
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    CandyWinView()
}


import SwiftUI

struct CandySettingsView: View {
    @StateObject var candySettingsModel =  CandySettingsViewModel()
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    var body: some View {
        GeometryReader { geometry in
            if verticalSizeClass == .regular {
                ZStack {
                    Image(CandyImageName.menuVBackground.rawValue)
                        .resizable()
                        .ignoresSafeArea()
                    
                    TopImage(geometry: geometry)
                    
                    VStack(spacing: 35) {
                        Spacer(minLength: 90)
                        HStack {
                            Text("SETTINGS")
                                .Lucky(size: 48)
                            
                            Image(CandyImageName.gear.rawValue)
                                .resizable()
                                .offset(y: -10)
                                .frame(width: 75, height: 75)
                        }
                        
                        SoundView(action: candySettingsModel.goTo,
                                  secondAction: candySettingsModel.goTo)
                        
                        MusicView(action: candySettingsModel.lowerIndex,
                                  secondAction: candySettingsModel.increaseIndex,
                                  index: candySettingsModel.currentIndex)
                        
                        Spacer()
                        
                        VStack {
                            Button(action: {
                                candySettingsModel.goToMenu()
                            }) {
                                ZStack {
                                    Image(CandyImageName.purpleBackForLabel.rawValue)
                                        .resizable()
                                        .frame(width: 200, height: 50)
                                    
                                    Text("MENU")
                                        .Lucky(size: 28)
                                        .offset(y: 3)
                                }
                            }
                        }
                        
                        Spacer()
                    }
                }
            } else {
                ZStack {
                    Image(CandyImageName.menuHBackground.rawValue)
                        .resizable()
                        .ignoresSafeArea()
                    
                    Image(CandyImageName.yellowVector.rawValue)
                        .resizable()
                        .frame(width: geometry.size.width + 120, height: geometry.size.height / 2.5)
                        .offset(x: -geometry.size.width / 12, y: -geometry.size.height / 2.65)
                    
                    Image(CandyImageName.pinkVector.rawValue)
                        .resizable()
                        .frame(width: geometry.size.width / 1.0, height: geometry.size.height / 2.5)
                        .offset(x: geometry.size.width / -6, y: -geometry.size.height / 3.1)
                    
                    Image(CandyImageName.redVector.rawValue)
                        .resizable()
                        .frame(width: geometry.size.width / 1.8, height: geometry.size.height / 8)
                        .offset(x: geometry.size.width / 4, y: -geometry.size.height / 2.25)
                    
                    VStack {
                        HStack {
                            Text("SETTINGS")
                                .Lucky(size: 55)
                            
                            Image(CandyImageName.gear.rawValue)
                                .resizable()
                                .offset(y: -10)
                                .frame(width: 55, height: 55)
                        }
                        .position(x: geometry.size.width / 2.5, y: geometry.size.height / 9.3)
                        
                        VStack(spacing: 30) {
                            HStack {
                                SoundView(action: candySettingsModel.goTo,
                                          secondAction: candySettingsModel.goTo)
                                
                                MusicView(action: candySettingsModel.lowerIndex,
                                          secondAction: candySettingsModel.increaseIndex,
                                          index: candySettingsModel.currentIndex)
                            }
                            .position(x: geometry.size.width / 2, y: geometry.size.height / 15)
                            
                            Button(action: {
                                candySettingsModel.goToMenu()
                            }) {
                                ZStack {
                                    Image(CandyImageName.buyBack.rawValue)
                                        .resizable()
                                        .frame(width: 200, height: 60)
                                    
                                    Text("MENU")
                                        .Lucky(size: 34)
                                        .offset(y: 3)
                                }
                            }
                            .position(x: geometry.size.width / 2, y: geometry.size.height / 8)
                        }
                    }
                }
            }
        }
        .navigationDestination(isPresented: $candySettingsModel.isMenuAvailible) {
            CandyMenuView()
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    CandySettingsView()
}


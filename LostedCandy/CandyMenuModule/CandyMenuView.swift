import SwiftUI

struct CandyMenuView: View {
    @StateObject var candyMenuModel =  CandyMenuViewModel()
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    var body: some View {
        GeometryReader { geometry in
            if verticalSizeClass == .regular {
                ZStack {
                    Image(CandyImageName.menuVBackground.rawValue)
                        .resizable()
                        .ignoresSafeArea()
                    
                    TopImage(geometry: geometry)
                    
                    VStack(spacing: 30) {
                        Text("MENU")
                            .Lucky(size: 52)
                            .offset(y: 30)
                        
                        VStack(spacing: 10) {
                            CandyButton(foregroundImage: CandyImageName.orangeButton.rawValue,
                                        sizeH: 120,
                                        sizeW: 350,
                                        text: "START",
                                        textSize: 52,
                                        textColor: Color(#colorLiteral(red: 125/255, green: 255/255, blue: 0/255, alpha: 1)),
                                        textYOffset: 15,
                                        action: candyMenuModel.goToStage)
                            
                            CandyButton(foregroundImage: CandyImageName.greenButton.rawValue,
                                        sizeH: 110,
                                        sizeW: 350,
                                        text: "SHOP",
                                        textSize: 52,
                                        textYOffset: 10,
                                        action: candyMenuModel.goToShop)
                        }
                        
                        HStack {
                            SquareButton(backImage: CandyImageName.leftGreenButton.rawValue,
                                         sizeHBack: 150,
                                         sizeWBack: 160,
                                         foregroundImage: CandyImageName.gear.rawValue,
                                         sizeHForeground: 60,
                                         sizeWForeground: 60,
                                         text: "SETTINGS",
                                         textSize: 27,
                                         action: candyMenuModel.goToSettings)
                            
                            SquareButtonForMap(backImage: CandyImageName.rightGreenButton.rawValue,
                                               sizeHBack: 150,
                                               sizeWBack: 160,
                                               text: "LEVELS",
                                               textSize: 27,
                                               action: candyMenuModel.goTo,
                                               xOffsetText: 10)
                        }
                    }
                }
                
            } else {
                ZStack {
                    Image(CandyImageName.menuHBackground.rawValue)
                        .resizable()
                        .ignoresSafeArea()
                    
                    TopImageH(geometry: geometry)
                    
                    VStack {
                        Spacer()
                        Text("MENU")
                            .Lucky(size: 55)
                            .offset(y: 20)
                        
                        CandyButton(foregroundImage: CandyImageName.orangeButton.rawValue,
                                    sizeH: 100,
                                    sizeW: 260,
                                    text: "START",
                                    textSize: 52,
                                    textColor: Color(#colorLiteral(red: 125/255, green: 255/255, blue: 0/255, alpha: 1)),
                                    textYOffset: 15,
                                    action: candyMenuModel.goToStage)
                        
                        HStack {
                            SquareButton(backImage: CandyImageName.centerGreenButton.rawValue,
                                         sizeHBack: 120,
                                         sizeWBack: 180,
                                         foregroundImage: CandyImageName.gear.rawValue,
                                         sizeHForeground: 60,
                                         sizeWForeground: 60,
                                         text: "SETTINGS",
                                         textSize: 27,
                                         action: candyMenuModel.goToSettings,
                                         xOffsetText: -10)
                            
                            SquareButton(backImage: CandyImageName.leftGreenButton.rawValue,
                                         sizeHBack: 120,
                                         sizeWBack: 160,
                                         foregroundImage: CandyImageName.coin.rawValue,
                                         sizeHForeground: 60,
                                         sizeWForeground: 60,
                                         text: "SHOP",
                                         textSize: 27,
                                         action: candyMenuModel.goToShop)
                            
                            SquareButtonForMap(backImage: CandyImageName.rightGreenButton.rawValue,
                                               sizeHBack: 120,
                                               sizeWBack: 160,
                                               vSpacing: 15,
                                               text: "LEVELS",
                                               textSize: 27,
                                               action: candyMenuModel.goTo,
                                               xOffsetText: 10,
                                               sizeMapW: 60,
                                               sizeMapH: 60,
                                               sizeLineW: 30,
                                               xOffsetLine: 10,
                                               yOffsetXImage: -15)
                        }
                    }
                    .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
                }
            }
        }
        .navigationDestination(isPresented: $candyMenuModel.isShopAvailible) {
            CandyShopView()
        }
        
        .navigationDestination(isPresented: $candyMenuModel.isSettingsAvailible) {
            CandySettingsView()
        }
        
        .navigationDestination(isPresented: $candyMenuModel.isStageAvailible) {
            CandyStageView()
        }
        
        .navigationBarBackButtonHidden(true)
    }
}


#Preview {
    CandyMenuView()
}



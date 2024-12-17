import SwiftUI

struct CandyShopView: View {
    @StateObject var candyShopModel =  CandyShopViewModel()
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    var body: some View {
        GeometryReader { geometry in
            if verticalSizeClass == .regular {
                ZStack {
                    Image(CandyImageName.menuVBackground.rawValue)
                        .resizable()
                        .ignoresSafeArea()
                    
                    VStack {
                        HStack {
                            Spacer()
                            ZStack {
                                Image(CandyImageName.backForBudget.rawValue)
                                    .resizable()
                                    .frame(width: 230, height: 50)
                                
                                HStack {
                                    HStack(spacing: 3) {
                                        Text("100000")
                                            .Lucky(size: 18)
                                        
                                        Image(CandyImageName.coin2.rawValue)
                                            .resizable()
                                            .frame(width: 30, height: 30)
                                            .offset(y: -3)
                                    }
                                    
                                    HStack(spacing: 3) {
                                        Text("100000")
                                            .Lucky(size: 18)
                                        
                                        Image(CandyImageName.candys.rawValue)
                                            .resizable()
                                            .frame(width: 30, height: 30)
                                            .offset(y: -3)
                                    }
                                }
                                .offset(x: 8)
                            }
                        }
                        
                        HStack {
                            BackButton(action: candyShopModel.goToMenu)
                            
                            Spacer()
                            
                            Text("SHOP")
                            .Lucky(size: 55)
                            .offset(x: -30, y: 15)
                            
                            Spacer()
                        }
                        .padding(.horizontal)
                        
                        
                        VStack() {
                            if candyShopModel.currentIndex == 0 {
                                FirstItemToBuy(action: candyShopModel.goToMenu,
                                               imageToBuy: CandyImageName.tropicalBoom.rawValue,
                                               nameOfItem: "TROPICAL BOOM")
                                
                                SecondItemToBuy(action: candyShopModel.goToMenu,
                                                imageToBuy: CandyImageName.boomBlast.rawValue,
                                                nameOfItem: "BOOM BLUST")
                                
                                BackgroundLabel()
                                    .offset(y: 12)
                                
                                FirstItemToBuy(action: candyShopModel.goToMenu,
                                               backItemImage: CandyImageName.candyParadise.rawValue,
                                               nameOfItem: "CANDY PARADISE")
                                
                                SecondItemToBuy(action: candyShopModel.goToMenu,
                                                backItemImage: CandyImageName.candySpapes.rawValue,
                                                nameOfItem: "CANDY ESCAPES")
                                Spacer()
                            } else {
                                FirstItemToBuy(action: candyShopModel.goToMenu,
                                               backItemImage: CandyImageName.sugarIsles.rawValue,
                                               nameOfItem: "SUGAR ISLES")
                                
                                SecondItemToBuy(action: candyShopModel.goToMenu,
                                                backItemImage: CandyImageName.lillipopHavens.rawValue,
                                                nameOfItem: "LOLLIPOP HAVENS", offsetXText: 95)
                                Spacer()
                            }
                        }
                        
                        HStack(spacing: 0) {
                            ButtonArrow(action: candyShopModel.lowerIndex,
                                        image: CandyImageName.backArrow.rawValue,
                                        imageBack: CandyImageName.backArrowBack.rawValue)
                            .disabled(candyShopModel.currentIndex == 0 ? true : false)
                            
                            ButtonArrow(action: candyShopModel.increaseIndex,
                                        image: CandyImageName.nextArrow.rawValue,
                                        imageBack: CandyImageName.nextArrowBack.rawValue)
                            .disabled(candyShopModel.currentIndex == 1 ? true : false)
                        }
                        .offset(y: 12)
                    }
                }
            } else {
                ZStack {
                    Image(CandyImageName.menuHBackground.rawValue)
                        .resizable()
                        .ignoresSafeArea()
                    
                    Image(CandyImageName.pinkVector.rawValue)
                        .resizable()
                        .frame(width: geometry.size.width / 1.1, height: geometry.size.height / 2)
                        .offset(x: geometry.size.width / -3, y: -geometry.size.height / 3.5)
                    
                    Text("SHOP")
                        .Lucky(size: 60)
                        .offset(x: geometry.size.width / -3, y: -geometry.size.height / 2.6)
                    
                    VStack {
                        VStack {
                            HStack {
                                Spacer()
                                ZStack {
                                    Image(CandyImageName.backForLabel.rawValue)
                                        .resizable()
                                        .frame(width: 250, height: 50)
                                    
                                    HStack {
                                        HStack(spacing: 3) {
                                            Text("100000")
                                                .Lucky(size: 18)
                                            
                                            Image(CandyImageName.coin2.rawValue)
                                                .resizable()
                                                .frame(width: 30, height: 30)
                                                .offset(y: -3)
                                        }
                                        
                                        HStack(spacing: 3) {
                                            Text("100000")
                                                .Lucky(size: 18)
                                            
                                            Image(CandyImageName.candys.rawValue)
                                                .resizable()
                                                .frame(width: 30, height: 30)
                                                .offset(y: -3)
                                        }
                                    }
                                }
                            }
                            
                            HStack {
                                Spacer()
                                Button(action: {
                                    candyShopModel.isMenuAvailible = true
                                }) {
                                    ZStack {
                                        Image(CandyImageName.backForLabel.rawValue)
                                            .resizable()
                                            .frame(width: 230, height: 40)
                                        
                                        Text("GO BACK")
                                            .Lucky(size: 30)
                                            .offset(y: 2)
                                    }
                                }
                            }
                            .offset(x: -40)
                        }
                        
                        ScrollView(showsIndicators: false) {
                            VStack(spacing: 20) {
                                HStack {
                                    FirstItemToBuy(action: candyShopModel.goToMenu,
                                                   imageToBuy: CandyImageName.tropicalBoom.rawValue,
                                                   nameOfItem: "TROPICAL BOOM")
                                    
                                    
                                    FirstItemToBuy(action: candyShopModel.goToMenu,
                                                   backItemImage: CandyImageName.candyParadise.rawValue,
                                                   nameOfItem: "CANDY PARADISE")
                                }
                                
                                HStack {
                                    SecondItemToBuy(action: candyShopModel.goToMenu,
                                                    imageToBuy: CandyImageName.boomBlast.rawValue,
                                                    nameOfItem: "BOOM BLUST")
                                    
                                    SecondItemToBuy(action: candyShopModel.goToMenu,
                                                    backItemImage: CandyImageName.candyEscapes.rawValue,
                                                    nameOfItem: "CANDY HAVENS", offsetXText: 95)
                                }
                                
                                HStack {
                                    FirstItemToBuy(action: candyShopModel.goToMenu,
                                                   backItemImage: CandyImageName.sugarIsles.rawValue,
                                                   nameOfItem: "SUGAR ISLES")
                                    
                                    
                                    SecondItemToBuy(action: candyShopModel.goToMenu,
                                                   backItemImage: CandyImageName.lillipopHavens.rawValue,
                                                   nameOfItem: "LOLLIPOP HAVENS", offsetXText: 95)
                                }
                            }
                        }
                    }
                }
            }
        }
        .navigationDestination(isPresented: $candyShopModel.isMenuAvailible) {
            CandyMenuView()
        }
        
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    CandyShopView()
}


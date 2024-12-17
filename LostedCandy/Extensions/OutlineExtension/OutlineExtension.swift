import SwiftUI

extension View {
    func candyOutlineText(color: Color = Color(#colorLiteral(red: 255/255, green: 0/255, blue: 229/255, alpha: 1)), width: CGFloat) -> some View {
        modifier(CandyStrokeModifier(strokeSize: width, strokeColor: color))
    }
}

struct CandyStrokeModifier: ViewModifier {
    private let id = UUID()
    var strokeSize: CGFloat = 1
    var strokeColor: Color = .blue
    
    func body(content: Content) -> some View {
        content
            .padding(strokeSize*2)
            .background (Rectangle()
                .foregroundStyle(strokeColor)
                .mask({
                    candyOutline(context: content)
                })
            )}
    
    func candyOutline(context:Content) -> some View {
        Canvas { context, size in
            context.addFilter(.alphaThreshold(min: 0.01))
            context.drawLayer { layer in
                if let text = context.resolveSymbol(id: id) {
                    layer.draw(text, at: .init(x: size.width/2, y: size.height/2))
                }
            }
        } symbols: {
            context.tag(id)
                .blur(radius: strokeSize)
        }
    }
}

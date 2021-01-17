import SwiftUI

struct BorderedViewModifier: ViewModifier {
    private var color: Color

    init(color: Color) {
        self.color = color
    }

    func body(content: Content) -> some View {
        content
            .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(lineWidth: 2)
                    .foregroundColor(color)
            )
    }
}

extension View {
    func bordered(color: Color) -> some View {
        ModifiedContent(
            content: self,
            modifier: BorderedViewModifier(color: color)
        )
    }
}

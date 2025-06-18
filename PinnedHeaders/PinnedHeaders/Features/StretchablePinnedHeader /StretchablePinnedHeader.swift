import SwiftUI

struct StretchablePinnedHeader: View {
    @State private var offset: CGFloat = 0
    private let array = Array(1...20)
    private let defaultHeight: CGFloat = 120
    
    var body: some View {
        
        ScrollView {
            Color.clear
                .frame(height: defaultHeight)
            
            LazyVStack(spacing: 16, pinnedViews: .sectionHeaders) {
                ForEach(array, id: \.self) { index in
                    cell(index)
                }
            }
        }
        .onScrollGeometryChange(for: CGFloat.self, of: { scrollGeometry in
            return scrollGeometry.contentOffset.y + scrollGeometry.contentInsets.top
        }, action: { oldValue, newValue in
            self.offset = newValue
        })
        .clipShape(Rectangle())
        .overlay(alignment: .top, content: {
            header()
        })
    }
    
    private func cell(_ int: Int) -> some View {
        Text("Item: \(int)")
            .padding()
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 6).fill(.brown.opacity(0.2))
            )
            .padding(.horizontal, 32)
    }
    
    private func header() -> some View {
        VStack(spacing: 10) {
            Text("Header")
            Image(systemName: "moon.stars.fill")
                .resizable()
                .scaledToFit()
        }
        .font(.title)
        .foregroundStyle(.white)
        .fontWeight(.semibold)
        .padding()
        .frame(height: defaultHeight + max(0, -offset))
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 8).fill(.cyan)
        )
        .padding(.horizontal, 32)
    }
}


#Preview {
    StretchablePinnedHeader()
}

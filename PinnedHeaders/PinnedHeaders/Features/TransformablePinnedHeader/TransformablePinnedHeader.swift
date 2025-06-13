import SwiftUI

struct TransformablePinnedHeader: View {
    @State private var offset: CGFloat = 0
    private let array = Array(1...20)
    private let defaultHeight: CGFloat = 240
    private let minHeight: CGFloat = 132
    
    var body: some View {
        
        ScrollView {
            if defaultHeight - offset > minHeight {
                headerView()
                    .font(.title)
                    .foregroundStyle(.white)
                    .fontWeight(.semibold)
                    .padding()
                    .frame(height: defaultHeight, alignment: .bottom)
                    .frame(maxWidth: .infinity)
                    .background(Rectangle().fill(.white).fill(.cyan.opacity(0.4)))
                
            } else {
                Color.clear
                    .frame(height: defaultHeight)
            }
            
            LazyVStack(spacing: 16, pinnedViews: .sectionHeaders) {
                ForEach(array, id: \.self) { index in
                    cell(index)
                }
            }
        }
        .onScrollGeometryChange(for: CGFloat.self) { geometry in
            return geometry.contentOffset.y + geometry.contentInsets.top
        } action: { _, new in
            self.offset = new
        }
        .overlay(alignment: .top, content: {
            if defaultHeight - offset <= minHeight {
                headerView()
                    .font(.subheadline)
                    .foregroundStyle(.white)
                    .fontWeight(.semibold)
                    .padding()
                    .frame(height: minHeight)
                    .frame(maxWidth: .infinity)
                    .background(
                        Rectangle().fill(.white).fill(.cyan.opacity(0.4)).ignoresSafeArea()
                    )
                
            } else {
                Rectangle().fill(.white).fill(.cyan.opacity(0.4))
                    .ignoresSafeArea()
                    .frame(height: max(0, -offset))
            }
            
        })
        
    }
    
    private func headerView() -> some View {
        VStack(spacing: 12) {
            Image(systemName: "moon.stars.fill")
                .resizable()
                .scaledToFit()
                .frame(minHeight: 24)
            
            Text("Header")
            
            HStack(spacing: 16) {
                imageIcon("sun.max.fill")
                imageIcon("cloud.fill")
                imageIcon("flame.fill")
                imageIcon("leaf.fill")
            }
            
        }
    }
    
    private func cell(_ int: Int) -> some View {
        Text("Item: \(int)")
            .padding()
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 8).fill(.brown.opacity(0.2))
            )
            .padding(.horizontal, 32)
    }
    
    private func imageIcon(_ systemName: String) -> some View {
        Image(systemName: systemName)
            .resizable()
            .scaledToFit()
            .padding(.vertical, 8)
            .padding(.horizontal, 16)
            .frame(width: 65, height: 52)
            .background(
                RoundedRectangle(cornerRadius: 8).fill(.blue.opacity(0.8))
            )
            
        
    }
    
}

#Preview {
    TransformablePinnedHeader()
}

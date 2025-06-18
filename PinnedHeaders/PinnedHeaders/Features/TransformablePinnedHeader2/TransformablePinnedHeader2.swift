import SwiftUI

struct TransformablePinnedHeader2: View {
    @State private var offset: CGFloat = 0
    private let array = Array(1...20)
    private let defaultHeight: CGFloat = 240
    private let minHeight: CGFloat = 120
    
    var body: some View {
        
        ZStack(alignment: .top) {
            let showMinimizedHeader = defaultHeight - offset <= minHeight
            
            if !showMinimizedHeader {
                ZStack(alignment: .top) {
                    Rectangle().fill(.white).fill(.blue.opacity(0.4))
                        .ignoresSafeArea()
                        .frame(height: max(minHeight, defaultHeight - offset))
                    
                    let minOffset = defaultHeight - minHeight
                    let offset = offset <= 0 ? -offset : offset <= minOffset ? -offset : -minOffset
                    
                    baseHeaderView()
                        .font(.title)
                        .foregroundStyle(.white)
                        .fontWeight(.semibold)
                        .padding()
                        .frame(height: defaultHeight)
                        .frame(maxWidth: .infinity)
                        .offset(y: offset)
                }
                
            }
            
            ScrollView {
                Color.clear
                    .frame(height: defaultHeight)
                
                LazyVStack(spacing: 16, pinnedViews: .sectionHeaders) {
                    ForEach(array, id: \.self) { index in
                        cell(index)
                    }
                }
            }
            .onScrollGeometryChange(for: CGFloat.self, of: { geometry in
                return geometry.contentOffset.y + geometry.contentInsets.top
            }, action: { oldValue, newValue in
                self.offset = newValue
            })
            
            if showMinimizedHeader {
                baseHeaderView()
                    .font(.subheadline)
                    .foregroundStyle(.white)
                    .fontWeight(.semibold)
                    .padding()
                    .frame(height: minHeight)
                    .frame(maxWidth: .infinity)
                    .background(
                        Rectangle().fill(.white).fill(.blue.opacity(0.4)).ignoresSafeArea()
                    )
                
            }
        }
        .toolbarBackground(.hidden, for: .navigationBar)
    }
    
    private func baseHeaderView() -> some View {
        VStack(spacing: 12) {
            Image(systemName: "heart.fill")
                .resizable()
                .scaledToFit()
                .frame(minHeight: 24)
            
            Text("Header")
            
            HStack(spacing: 16) {
                imageIcon("cat.fill")
                imageIcon("sun.max.fill")
                imageIcon("bird.fill")
                imageIcon("leaf.fill")
            }
            
        }
    }
    
    private func cell(_ int: Int) -> some View {
        Text("Item: \(int)")
            .padding()
            .frame(maxWidth: .infinity)
            .background(RoundedRectangle(cornerRadius: 8).fill(.gray.opacity(0.5)))
            .padding(.horizontal, 32)
    }
    
    private func imageIcon(_ systemName: String) -> some View {
        Image(systemName: systemName)
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .background(RoundedRectangle(cornerRadius: 8).fill(.blue.opacity(0.8)))
        
    }
    
}


#Preview {
    TransformablePinnedHeader2()
}

import SwiftUI

struct BasicPinnedHeader: View {
    let array = Array(1...10)
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 16, pinnedViews: .sectionHeaders) {
                ForEach(array, id: \.self) { sectionIndex in
                    Section {
                        ForEach(array,id: \.self) { itemIndex in
                            cell(itemIndex)
                        }
                    } header: {
                        header(sectionIndex)
                    }
                    
                }
                
            }
        }
        .clipShape(Rectangle())
        
    }
    
    private func cell(_ int: Int) -> some View {
        Text("Item: \(int)")
            .padding()
            .frame(maxWidth: .infinity)
            .background(RoundedRectangle(cornerRadius: 8).fill(.gray.opacity(0.5)))
            .padding(.horizontal, 32)
    }
    
    private func header(_ int: Int) -> some View {
        Text("Section: \(int)")
            .font(.title3)
            .foregroundStyle(.white)
            .fontWeight(.semibold)
            .padding()
            .frame(maxWidth: .infinity)
            .background(RoundedRectangle(cornerRadius: 8).fill(.blue))
            .padding(.horizontal, 32)
        
    }
}

#Preview {
    BasicPinnedHeader()
}

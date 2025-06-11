import SwiftUI

struct InsetPinnedHeader: View {
    let array = Array(1...10)
    
    var body: some View {
        List {
            ForEach(array, id: \.self) { sectionIndex in
                Section {
                    ForEach(array,id: \.self) { itemIndex in
                        Text("Item: \(itemIndex)")
                    }
                    .listRowSeparator(.hidden)  // 구분선 제거
                } header: {
                    header(sectionIndex)
                }
            }
        }
        .listStyle(.inset)
        .clipShape(Rectangle())
        .navigationTitle("Inset Pinned Header")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private func header(_ int: Int) -> some View {
        ZStack(alignment: .leading) {
            Text("Section: \(int)")
                .font(.title3)
                .foregroundStyle(.white)
                .fontWeight(.semibold)
                .padding(.vertical, 8)
                .padding(.horizontal, 16)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(RoundedRectangle(cornerRadius: 8).fill(.blue))
                .padding(.horizontal)
        }
        .listRowInsets(EdgeInsets())
        .background(Color(.systemBackground))
    }
}

#Preview {
    InsetPinnedHeader()
}

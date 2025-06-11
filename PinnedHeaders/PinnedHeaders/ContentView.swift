import SwiftUI

struct ContentView: View {
    @State private var path = NavigationPath()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()    }
}

enum Route: Hashable {
    case basicPinnedHeader
    case insetPinnedHeader
}

#Preview {
    ContentView()
}

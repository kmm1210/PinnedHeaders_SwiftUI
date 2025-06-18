import SwiftUI

struct ContentView: View {
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack(spacing: 20) {
                Button("Basic Pinned Header") {
                    path.append(Route.basicPinnedHeader)
                }
                .buttonStyle(.borderedProminent)
                
                Button("Inset Pinned Header") {
                    path.append(Route.insetPinnedHeader)
                }
                .buttonStyle(.borderedProminent)
                
                Button("Stretchable Pinned Header") {
                    path.append(Route.stretchablePinnedHeader)
                }
                .buttonStyle(.borderedProminent)
                
                Button("Transformable Pinned Header") {
                    path.append(Route.transformablePinnedHeader)
                }
                .buttonStyle(.borderedProminent)
                
                Button("Transformable Pinned Header2") {
                    path.append(Route.transformablePinnedHeader2)
                }
                .buttonStyle(.borderedProminent)
                
            }
            .navigationDestination(for: Route.self) { route in
                switch route {
                case .basicPinnedHeader: BasicPinnedHeader()
                case .insetPinnedHeader: InsetPinnedHeader()
                case .stretchablePinnedHeader: StretchablePinnedHeader()
                case .transformablePinnedHeader: TransformablePinnedHeader()
                case .transformablePinnedHeader2: TransformablePinnedHeader2()
                }
            }
        }
    }
}

enum Route: Hashable {
    case basicPinnedHeader
    case insetPinnedHeader
    case stretchablePinnedHeader
    case transformablePinnedHeader
    case transformablePinnedHeader2
}

#Preview {
    ContentView()
}

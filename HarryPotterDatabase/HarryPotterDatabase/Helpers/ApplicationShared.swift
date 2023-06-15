import Foundation
import UIKit

protocol ApplicationSharedProtocol {
    func openUrl(url: URL) -> Void
}

final class ApplicationShared: ApplicationSharedProtocol {
    
    func openUrl(url: URL) {
        UIApplication.shared.open(url)
    }
}

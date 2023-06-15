import Foundation

@testable import HarryPotterDatabase

final class MockApplicationShared: ApplicationSharedProtocol {
    private var testUrl: (URL) -> Void
    
    init(testUrl: @escaping (URL) -> Void) {
        self.testUrl = testUrl
    }
    
    func openUrl(url: URL) {
        testUrl(url)
    }
}

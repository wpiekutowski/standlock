import Testing
@testable import StandLockCore

@Suite("Discipline Level Resolution")
struct DisciplineLevelResolutionTests {

    @Test func strictStaysStrictWhenInputBlockingIsSupported() {
        #expect(resolveDisciplineLevel(.strict, capabilities: .standard) == .strict)
    }

    @Test func strictBecomesFirmWithoutInputBlocking() {
        #expect(resolveDisciplineLevel(.strict, capabilities: .sandboxed) == .firm)
    }

    @Test func gentleAndFirmAreUnchangedForBothCapabilities() {
        for capabilities in [AppCapabilities.standard, .sandboxed] {
            #expect(resolveDisciplineLevel(.gentle, capabilities: capabilities) == .gentle)
            #expect(resolveDisciplineLevel(.firm, capabilities: capabilities) == .firm)
        }
    }

    @Test func presetsDifferOnlyInInputBlocking() {
        #expect(AppCapabilities.standard.supportsInputBlocking)
        #expect(!AppCapabilities.sandboxed.supportsInputBlocking)
    }

    @Test func standardOffersEveryLevel() {
        #expect(AppCapabilities.standard.availableDisciplineLevels == [.gentle, .firm, .strict])
    }

    @Test func sandboxedHidesStrictFromTheOfferedLevels() {
        #expect(AppCapabilities.sandboxed.availableDisciplineLevels == [.gentle, .firm])
    }
}

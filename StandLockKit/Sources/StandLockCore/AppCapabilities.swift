/// What the running build can do. Features are gated by asking for a capability, never by
/// asking which build is running.
public struct AppCapabilities: Sendable, Equatable {
    /// Whether the build may block keyboard and mouse input, which Strict needs.
    public let supportsInputBlocking: Bool

    public init(supportsInputBlocking: Bool) {
        self.supportsInputBlocking = supportsInputBlocking
    }

    /// The unsandboxed edition: every feature.
    public static let standard = AppCapabilities(supportsInputBlocking: true)

    /// The App Sandbox edition: no event taps, so no Input Blocking.
    public static let sandboxed = AppCapabilities(supportsInputBlocking: false)

    /// The levels a schedule may be set to, in display order.
    public var availableDisciplineLevels: [DisciplineLevel] {
        DisciplineLevel.allCases.filter { $0 != .strict || supportsInputBlocking }
    }
}

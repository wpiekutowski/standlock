import StandLockCore

extension AppCapabilities {
    /// The capabilities of this build. The only place the compilation condition is read.
    static let current: AppCapabilities = {
        #if SANDBOXED
        .sandboxed
        #else
        .standard
        #endif
    }()
}

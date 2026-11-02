/// The level a break actually runs at, given what the build can do.
///
/// Strict needs Input Blocking. Without it the break runs as Firm, not Gentle: Strict is
/// chosen for maximum friction, and Gentle's first tier is a plain skip button. The stored
/// schedule is never rewritten, so a Strict schedule moved to a build that supports Input
/// Blocking is Strict again.
///
/// - Parameters:
///   - level: The level stored on the schedule.
///   - capabilities: What the running build can do.
public func resolveDisciplineLevel(
    _ level: DisciplineLevel,
    capabilities: AppCapabilities
) -> DisciplineLevel {
    if level == .strict && !capabilities.supportsInputBlocking {
        return .firm
    }
    return level
}

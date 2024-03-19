import UIKit

enum MatchStatus {
    case notStarted, inProgress, finished
}

struct Event {
    let homeTeamName: String
    let awayTeamName: String
    let homeTeamIcon: UIImage
    let awayTeamIcon: UIImage
    let homeTeamScore: Int?
    let awayTeamScore: Int?
    let matchStatus: MatchStatus
    let matchTimestamp: TimeInterval
}


import UIKit

class EventViewModel {
    let event: Event
    
    init(event: Event) {
        self.event = event
    }
    
    var homeTeamName: String {
        return event.homeTeamName
    }
    
    var homeTeamIcon: UIImage {
        return event.homeTeamIcon
    }
    var awayTeamIcon: UIImage {
        return event.awayTeamIcon
    }
    
    var awayTeamName: String {
        return event.awayTeamName
    }
    
    var homeTeamScore: Int? {
        return event.homeTeamScore
    }
    
    var awayTeamScore: Int? {
        return event.awayTeamScore
    }
    
    var matchStatus: MatchStatus {
        return event.matchStatus
    }
    
    var matchTime: String {
        let date = Date(timeIntervalSince1970: event.matchTimestamp)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: date)
    }
    
    
    var matchTimeDescription: String {
        switch matchStatus {
        case .notStarted:
            return "-"
        case .inProgress:
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "HH:mm"
            dateFormatter.timeZone = TimeZone(abbreviation: "CET")
            let currentTime = dateFormatter.date(from: "16:36")?.timeIntervalSince1970 ?? 0
            let elapsedTime = currentTime - event.matchTimestamp
            let elapsedMinutes = Int(elapsedTime / 60)
            return "\(elapsedMinutes)'"
        case .finished:
            return "FT"
        }
    }
    
    
    static func mockEventData() -> [Event] {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        dateFormatter.timeZone = TimeZone(abbreviation: "CET")
        
        let matches = [
            Event(
                homeTeamName: "Manchester United",
                awayTeamName: "Barcelona",
                homeTeamIcon: UIImage(named: "manchester-united") ?? UIImage(),
                awayTeamIcon: UIImage(named: "barcelona") ?? UIImage(),
                homeTeamScore: 1,
                awayTeamScore: 2,
                matchStatus: .finished,
                matchTimestamp: dateFormatter.date(from: "13:00")?.timeIntervalSince1970 ?? 0
            ),
            Event(
                homeTeamName: "Manchester United",
                awayTeamName: "Barcelona",
                homeTeamIcon: UIImage(named: "manchester-united") ?? UIImage(),
                awayTeamIcon: UIImage(named: "barcelona") ?? UIImage(),
                homeTeamScore: 0,
                awayTeamScore: 1,
                matchStatus: .inProgress,
                matchTimestamp: dateFormatter.date(from: "16:00")?.timeIntervalSince1970 ?? 0
            ),
            Event(
                homeTeamName: "Manchester United",
                awayTeamName: "Barcelona",
                homeTeamIcon: UIImage(named: "manchester-united") ?? UIImage(),
                awayTeamIcon: UIImage(named: "barcelona") ?? UIImage(),
                homeTeamScore: nil,
                awayTeamScore: nil,
                matchStatus: .notStarted,
                matchTimestamp: dateFormatter.date(from: "18:00")?.timeIntervalSince1970 ?? 0
            ),
            Event(
                homeTeamName: "Manchester United",
                awayTeamName: "Barcelona",
                homeTeamIcon: UIImage(named: "manchester-united") ?? UIImage(),
                awayTeamIcon: UIImage(named: "barcelona") ?? UIImage(),
                homeTeamScore: nil,
                awayTeamScore: nil,
                matchStatus: .notStarted,
                matchTimestamp: dateFormatter.date(from: "19:30")?.timeIntervalSince1970 ?? 0
            )
        ]
        
        return matches
    }
}

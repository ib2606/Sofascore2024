import UIKit

class LeagueViewModel {
    let league: League
    
    init(league: League) {
        self.league = league
    }
    
    var country: String {
        return league.country
    }
    
    var leagueName: String {
        return league.leagueName
    }
    
    var leagueIcon: UIImage? {
        return UIImage(named: league.leagueImageName)
    }
    
    static func mockLeagueData() -> League {
        return League(country: "Spain", leagueName: "LaLiga", leagueImageName: "league_LaLiga")
    }
}

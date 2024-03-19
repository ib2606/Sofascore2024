import UIKit

class ViewController: UIViewController {
    private let leagueView = LeagueView()
    private let matchesStackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = ColorManager.backgroundColor
        loadMockData()
        
        view.addSubview(leagueView)
        leagueView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(16)
            $0.height.equalTo(56)
        }
        
        setupStackView()
    }
    
    private func setupStackView() {
        matchesStackView.axis = .vertical
        
        view.addSubview(matchesStackView)
        matchesStackView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(leagueView.snp.bottom)
        }
    }
    
    private func loadMockData() {
        let mockEvents = EventViewModel.mockEventData()
        let mockLeague = LeagueViewModel.mockLeagueData()
        
        leagueView.configure(with: LeagueViewModel(league: mockLeague))
        
        for event in mockEvents {
            let eventView = EventView()
            eventView.configure(with: EventViewModel(event: event))
            matchesStackView.addArrangedSubview(eventView)
            
            eventView.snp.makeConstraints {
                $0.height.equalTo(56)
            }
        }
    }
    
    
}


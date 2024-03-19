import UIKit
import SnapKit
import SofaAcademic

class EventView: BaseView {
    
    private let timeLabel = UILabel()
    private let statusLabel = UILabel()
    private let homeTeamImageView = UIImageView()
    private let homeTeamLabel = UILabel()
    private let homeTeamScoreLabel = UILabel()
    private let awayTeamScoreLabel = UILabel()
    private let awayTeamImageView = UIImageView()
    private let awayTeamLabel = UILabel()
    private let verticalDivider = UILabel()
    
    override func addViews() {
        addSubview(timeLabel)
        addSubview(statusLabel)
        addSubview(homeTeamImageView)
        addSubview(homeTeamLabel)
        addSubview(awayTeamImageView)
        addSubview(awayTeamLabel)
        addSubview(homeTeamScoreLabel)
        addSubview(awayTeamScoreLabel)
        addSubview(verticalDivider)
    }
    
    override func styleViews() {
        backgroundColor = ColorManager.backgroundColor
        verticalDivider.backgroundColor = ColorManager.onSurfaceLv4
        
        homeTeamScoreLabel.textAlignment = .right
        homeTeamScoreLabel.font = FontManager.body
        
        awayTeamScoreLabel.textAlignment = .right
        awayTeamScoreLabel.font = FontManager.body
        
        timeLabel.textAlignment = .center
        timeLabel.font = FontManager.micro
        timeLabel.textColor = ColorManager.onSurfaceLv2
        
        statusLabel.textAlignment = .center
        statusLabel.font = FontManager.micro
        statusLabel.textColor = ColorManager.onSurfaceLv2
        
        homeTeamLabel.font = FontManager.body
        awayTeamLabel.font = FontManager.body
    }
    
    override func setupConstraints() {
        
        timeLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(4)
            $0.trailing.equalTo(verticalDivider).inset(3)
            $0.top.equalToSuperview().inset(10)
            $0.bottom.equalToSuperview().inset(30)
        }
        
        statusLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(4)
            $0.trailing.equalTo(verticalDivider).inset(3)
            $0.top.equalToSuperview().inset(30)
            $0.bottom.equalToSuperview().inset(10)
        }
        
        verticalDivider.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.width.equalTo(1)
            $0.height.equalTo(40)
            $0.leading.equalToSuperview().offset(63)
        }
        
        homeTeamImageView.snp.makeConstraints {
            $0.width.height.equalTo(16)
            $0.leading.equalToSuperview().inset(80)
            $0.top.equalToSuperview().inset(10)
            $0.bottom.equalToSuperview().inset(30)
        }
        
        awayTeamImageView.snp.makeConstraints {
            $0.width.height.equalTo(16)
            $0.leading.equalToSuperview().inset(80)
            $0.top.equalToSuperview().inset(30)
            $0.bottom.equalToSuperview().inset(10)
        }
        
        homeTeamLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(104)
            $0.trailing.equalToSuperview().inset(64)
            $0.top.equalToSuperview().inset(10)
            $0.bottom.equalToSuperview().inset(30)
        }
        awayTeamLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(104)
            $0.trailing.equalToSuperview().inset(64)
            $0.top.equalToSuperview().inset(30)
            $0.bottom.equalToSuperview().inset(10)
        }
        
        homeTeamScoreLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(312)
            $0.trailing.equalToSuperview().inset(16)
            $0.top.equalToSuperview().inset(10)
            $0.bottom.equalToSuperview().inset(30)
        }
        awayTeamScoreLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(312)
            $0.trailing.equalToSuperview().inset(16)
            $0.top.equalToSuperview().inset(30)
            $0.bottom.equalToSuperview().inset(10)
        }
        
    }
    
    func configure(with viewModel: EventViewModel) {
        timeLabel.text = viewModel.matchTime
        statusLabel.text = viewModel.matchTimeDescription
        
        homeTeamImageView.image = viewModel.homeTeamIcon
        homeTeamLabel.text = viewModel.homeTeamName
        awayTeamImageView.image = viewModel.awayTeamIcon
        awayTeamLabel.text = viewModel.awayTeamName
        
        homeTeamScoreLabel.text = viewModel.homeTeamScore?.description ?? ""
        awayTeamScoreLabel.text = viewModel.awayTeamScore?.description ?? ""
        
        if (viewModel.matchStatus == .inProgress) {
            statusLabel.textColor = ColorManager.specificLive
            homeTeamScoreLabel.textColor = ColorManager.specificLive
            awayTeamScoreLabel.textColor = ColorManager.specificLive
        }
        
        if viewModel.matchStatus == .finished {
            switch (viewModel.homeTeamScore, viewModel.awayTeamScore) {
            case let (homeScore?, awayScore?) where homeScore > awayScore:
                awayTeamLabel.textColor = ColorManager.onSurfaceLv2
            case let (homeScore?, awayScore?) where homeScore < awayScore:
                homeTeamLabel.textColor = ColorManager.onSurfaceLv2
            case let (homeScore?, awayScore?) where homeScore == awayScore:
                homeTeamLabel.textColor = ColorManager.onSurfaceLv2
                awayTeamLabel.textColor = ColorManager.onSurfaceLv2
            default:
                break
            }
        }
    }
}

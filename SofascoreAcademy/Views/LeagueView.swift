import UIKit
import SofaAcademic
import SnapKit

class LeagueView: BaseView {
    
    private let leagueIconImageView: UIImageView = .init()
    private let rightPointerImageView: UIImageView = .init()
    private let countryLabel: UILabel = .init()
    private let leagueNameLabel: UILabel = .init()
    
    override func addViews() {
        addSubview(leagueIconImageView)
        addSubview(rightPointerImageView)
        addSubview(countryLabel)
        addSubview(leagueNameLabel)
    }
    
    override func styleViews() {
        backgroundColor = ColorManager.backgroundColor
        countryLabel.font = FontManager.headline3
        countryLabel.textColor = ColorManager.onSurfaceLv1
        
        leagueNameLabel.font = FontManager.headline3
        leagueNameLabel.textColor = ColorManager.onSurfaceLv2
        
        rightPointerImageView.image = UIImage(named: "ic_pointer_right")
        
    }
    
    override func setupConstraints() {
        leagueIconImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.centerY.equalToSuperview()
            $0.height.width.equalTo(32)
        }
        
        countryLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(80)
            $0.centerY.equalToSuperview()
            $0.top.equalToSuperview().offset(16)
        }
        
        rightPointerImageView.snp.makeConstraints {
            $0.leading.equalTo(countryLabel.snp.trailing)
            $0.top.equalToSuperview().offset(16)
            $0.centerY.equalToSuperview()
        }
        
        leagueNameLabel.snp.makeConstraints {
            $0.leading.equalTo(rightPointerImageView.snp.trailing)
            $0.centerY.equalToSuperview()
            $0.top.equalToSuperview().offset(16)
        }
    }
    
    func configure(with viewModel: LeagueViewModel) {
        countryLabel.text = viewModel.country
        leagueNameLabel.text = viewModel.leagueName
        leagueIconImageView.image = viewModel.leagueIcon
    }
}

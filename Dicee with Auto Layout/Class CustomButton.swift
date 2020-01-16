import UIKit

class CustomButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        
        setTitleColor(.white, for: .normal)
        setTitle("ROLL", for: .normal)
        layer.cornerRadius = 15
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 22)
        backgroundColor = UIColor.init(red: 245/255, green: 1, blue: 245/255, alpha: 0.1)
//        roll.backgroundColor = UIColor.orange
        backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
    }
}

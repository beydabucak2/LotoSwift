import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var numberLabel1: UILabel!
    @IBOutlet weak var numberLabel2: UILabel!
    @IBOutlet weak var numberLabel3: UILabel!
    @IBOutlet weak var numberLabel4: UILabel!
    @IBOutlet weak var numberLabel5: UILabel!
    @IBOutlet weak var numberLabel6: UILabel!
    

    var moneyImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.view.backgroundColor = UIColor(red: 0.0, green: 0.2, blue: 0.0, alpha: 1.0) //

       
        moneyImageView = UIImageView(image: UIImage(named: "money"))
        moneyImageView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(moneyImageView)
        
      
        NSLayoutConstraint.activate([
            moneyImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            moneyImageView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            moneyImageView.widthAnchor.constraint(equalToConstant: 100),  // Resmin genişliği
            moneyImageView.heightAnchor.constraint(equalToConstant: 100)  // Resmin yüksekliği
        ])
        
      
        resetNumbers()
    }

   
    func generateRandomNumbers() -> [Int] {
        var numbers: Set<Int> = Set()
        

        while numbers.count < 6 {
            let randomNumber = Int.random(in: 1...50)
            numbers.insert(randomNumber)
        }
        
 
        return Array(numbers).sorted()
    }

 
    func resetNumbers() {
        numberLabel1.text = ""
        numberLabel2.text = ""
        numberLabel3.text = ""
        numberLabel4.text = ""
        numberLabel5.text = ""
        numberLabel6.text = ""
    }

    @IBAction func generateLottoNumbers(_ sender: UIButton) {
       
        var count = 0
        let totalCount = 20
        
     
        Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { timer in
           
            self.numberLabel1.text = "\(Int.random(in: 1...50))"
            self.numberLabel2.text = "\(Int.random(in: 1...50))"
            self.numberLabel3.text = "\(Int.random(in: 1...50))"
            self.numberLabel4.text = "\(Int.random(in: 1...50))"
            self.numberLabel5.text = "\(Int.random(in: 1...50))"
            self.numberLabel6.text = "\(Int.random(in: 1...50))"
            
            count += 1
            if count >= totalCount {
             
                timer.invalidate()

             
                let randomNumbers = self.generateRandomNumbers()
                
                self.numberLabel1.text = "\(randomNumbers[0])"
                self.numberLabel2.text = "\(randomNumbers[1])"
                self.numberLabel3.text = "\(randomNumbers[2])"
                self.numberLabel4.text = "\(randomNumbers[3])"
                self.numberLabel5.text = "\(randomNumbers[4])"
                self.numberLabel6.text = "\(randomNumbers[5])"
            }
        }
    }
}

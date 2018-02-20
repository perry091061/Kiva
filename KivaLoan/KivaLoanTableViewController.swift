//
//  KivaLoanTableViewController.swift
//  KivaLoan
//
 

import UIKit

class KivaLoanTableViewController: UITableViewController {
    var loans = [KivaLoan]()
    override func viewDidLoad() {
        super.viewDidLoad()
        let network = Network(callback:update)
        
        tableView.estimatedRowHeight = 92.0
        tableView.rowHeight = UITableViewAutomaticDimension
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // Return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows
        return loans.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! KivaLoanTableViewCell
        
         let amount = loans[indexPath.row].loan_amount ?? 0
         let use = loans[indexPath.row].use ?? ""
         let country = loans[indexPath.row].location?.country ?? ""
         let name = loans[indexPath.row].name ?? ""
         cell.amountLabel.text = "\(amount)"
         cell.useLabel.text = "\(use)"
         cell.countryLabel.text = "\(country)"
         cell.nameLabel.text = "\(name)"
        return cell
    }
    
    func update(loans:[KivaLoan])
    {
        self.loans = loans
        tableView.reloadData()
    }

}

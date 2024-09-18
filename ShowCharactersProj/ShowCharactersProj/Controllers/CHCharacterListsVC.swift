//
//  CHCharacterListsVC.swift
//  ShowCharactersProj
//
//  Created by Vaibhav Pandey on 17/09/24.
//

import UIKit

class CHCharacterListsVC: UIViewController {

    @IBOutlet weak var btnAlive: UIButton!
    @IBOutlet weak var btnDead: UIButton!
    @IBOutlet weak var btnUnknown: UIButton!

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    
    var pageCount: Int = 0
    var charactStatus: String? = nil
    var listCharacters: [CHResult]? = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        self.activityIndicator.hidesWhenStopped = true
        loadMoreData()
    }
    
    func loadMoreData() {
        activityIndicator.startAnimating()
        self.pageCount = self.pageCount + 1
        CHPagingViewModel().loadData(page: self.pageCount, status: self.charactStatus) { data, error in
            print("data: \(data ?? [])")
            DispatchQueue.main.async {
                self.activityIndicator.stopAnimating()
                if self.pageCount > 1 {
                    if self.listCharacters?.count ?? 0 > 0 {
                        if let newData = data {
                            for item in newData {
                                self.listCharacters?.append(item)
                                self.tableView.beginUpdates()
                                self.tableView.insertRows(at: [IndexPath(row: (self.listCharacters?.count ?? 1)-1, section: 0)], with: .automatic)
                                self.tableView.endUpdates()
                            }
                        }
                    }
                } else {
                    self.listCharacters? = data ?? []
                    self.tableView.reloadData()
                }

            }
        }
    }
    
    @IBAction func btnActionAlive(_ sender: UIButton) {
        self.charactStatus = "alive"
        self.pageCount = 0
        self.tableView.setContentOffset(.zero, animated: false)
        loadMoreData()
    }

    @IBAction func btnActionDead(_ sender: UIButton) {
        self.charactStatus = "dead"
        self.pageCount = 0
        self.tableView.setContentOffset(.zero, animated: false)
        loadMoreData()
    }
    
    @IBAction func btnActionUnknown(_ sender: UIButton) {
        self.charactStatus = "unknown"
        self.pageCount = 0
        self.tableView.setContentOffset(.zero, animated: false)
        loadMoreData()
    }
    
    // MARK: - Navigation
    
    internal func pushModelsScene(with info: CHResult) {
        guard let modelsVC = CHNavigation.getViewController(type: CharacterDetailVC.self,
                                                          identifer: "CharacterDetailVC") else { return }
        modelsVC.detailObj = info
        navigationController?.pushViewController(modelsVC, animated: true)
    }
    
}



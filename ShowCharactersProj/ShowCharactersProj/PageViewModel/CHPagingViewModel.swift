//
//  CHPagingViewModel.swift
//  ShowCharactersProj
//
//  Created by Vaibhav Pandey on 17/09/24.
//

import Foundation

class CHPagingViewModel {
    
    typealias PagingDataResult = ((_ data: [CHResult]?, _ error: Error?) -> Void)
    
    // MARK: - Private Properties
    
    private lazy var datasource: [CHResult] = []
    

    private var dataTask: URLSessionDataTask?
    
    private lazy var networkManager = CHNetworkManager()
    
    private var failedTaskCount: Int = 0
    
    
    // MARK: - De-Initializer

    deinit {
        dataTask?.cancel()
    }

    
    // MARK: - Load Data Methods
    
    func loadData(page number: Int = 1, status: String? = nil,completionHandler: @escaping PagingDataResult) {
        
        var urlStr = "https://rickandmortyapi.com/api/character?page=\(number)"
        if let statusVal = status {
            urlStr = "https://rickandmortyapi.com/api/character?page=\(number)&status=\(statusVal)"
        }
        
        guard let url = URL(string: urlStr) else { return }
        
        dataTask = networkManager.dataTaskFromURL(url,
                                                  completion: { (result: Result<Character>) in
            switch result {
            case .success(let response):
                print("Page:", number, " success")
                self.datasource = response.results ?? []
                completionHandler(self.datasource, nil)
                
            case .failure(let error):
                print("Page:", number, " failed. Reason: ", error.localizedDescription)
                self.failedTaskCount += 1
                completionHandler(nil, error)
            }
        })
        
        dataTask?.resume()
    }
}

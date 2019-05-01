extension UIViewController {
    ///
    /// Searches the view controller's `navigationItem.leftBarButtonIttem`, `navigationItem.rightBarButtonItem`, as well as the UIView hierarchy for a UIToolbar which may contain a UIBarButtonItem whose `SystemItem` matches the searchSystemItem and then attempts to tap the UIBarButtonItem by firing its associated target event, if one exists.
    ///
    /// This method is convenient for de-coupling from the details of where a UIBarButtonItem object may be located.
    ///
    /// - Note: Once an object is found matching the provided criteria the remainder of the view hierarchy is **not** searched.
    ///
    /// - Parameter searchSystemItem: `UIBarButtonItem.SystemItem` to compare to the UIBarButtonItem objects that are found.
    ///
    public func tapBarButtonItem(withSystemItem searchSystemItem: UIBarButtonItem.SystemItem) {
        if let leftBarButtonItem = navigationItem.leftBarButtonItem {
            if leftBarButtonItem.systemItem == searchSystemItem {
                leftBarButtonItem.tap()
            }
        }

        if let rightBarButtonItem = navigationItem.rightBarButtonItem {
            if rightBarButtonItem.systemItem == searchSystemItem {
                rightBarButtonItem.tap()
            }
        }

        if let barButtonItem = view.findBarButtonItem(systemItem: searchSystemItem) {
            barButtonItem.tap()
        }
    }

    ///
    /// Attempts to tap the view controller's `navigationItem.leftBarButtonItem` UIBarButtonItem object regardless of what it is (so long as one exists) by firing its associated target event, if one exists.
    ///
    public func tapLeftBarButtonItem() {
        if let leftBarButtonItem = navigationItem.leftBarButtonItem {
            leftBarButtonItem.tap()
        }
    }

    ///
    /// Attempts to tap the view controller's `navigationItem.rightBarButtonItem` UIBarButtonItem object regardless of what it is (so long as one exists) by firing its associated target event, if one exists.
    ///
    public func tapRightBarButtonItem() {
        if let rightBarButtonItem = navigationItem.rightBarButtonItem {
            rightBarButtonItem.tap()
        }
    }
}

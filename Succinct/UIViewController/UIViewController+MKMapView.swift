import MapKit

// MARK: - MKMapView
extension UIViewController {
    ///
    /// Searches the entire view hierarchy of a view controller's primary view for an MKMapView object.
    ///
    /// - Note: Once an object is found matching the provided criteria the remainder of the view hierarchy is **not** searched.
    ///
    /// - Returns: A boolean value indicating if an MKMapView was found or not.
    ///
    @objc public func hasMapView() -> Bool {
        return view.findMapView().isNotNil()
    }

    ///
    /// Searches the entire view hierarchy of a view controller's primary view for an MKMapView object.
    ///
    /// - Note: Once an object is found matching the provided criteria the remainder of the view hierarchy is **not** searched.
    ///
    /// - Returns: An optional MKMapView, if one is found.
    ///
    @objc public func findMapView() -> MKMapView? {
        return view.findMapView()
    }
}

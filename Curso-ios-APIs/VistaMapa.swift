//
//  VistaMapa.swift
//  Curso-ios-APIs
//
//  Created by Equipo 8 on 24/2/26.
//

import CoreLocation
import MapKit
import Observation
import SwiftUI

@Observable
class LocationManager: NSObject, CLLocationManagerDelegate {
    private let manager = CLLocationManager()
    var location: CLLocation?
    var authorizationStatus: CLAuthorizationStatus?

    override init() {
        super.init()
        manager.delegate = self
    }
    func solicitarPermiso() {
        manager.requestWhenInUseAuthorization()
    }
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        authorizationStatus = manager.authorizationStatus

        switch authorizationStatus {
        case .authorizedWhenInUse, .authorizedAlways:
            manager.startUpdatingLocation()

        default:
            break
        }
    }
    // Observamos una nueva ubicación
    func locationManager(
        _ manager: CLLocationManager,
        didUpdateLocations locations: [CLLocation]
    ) {
        location = locations.first
    }
}
struct VistaMapa: View {
    @State private var locationManager = LocationManager()
    @State private var position: MapCameraPosition = .region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(
                latitude: 40.4168,
                longitude: -3.7038
            ),
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        )
    )
    var body: some View {
        VStack(spacing: 20) {
            Text("Mapa de Madrid")

            Map(position: $position) {
                Marker(
                    "Kilometro cero",
                    coordinate: CLLocationCoordinate2D(
                        latitude: 40.4168,
                        longitude: -3.7038
                    )
                ).tint(Color.red)
                if let location = locationManager.location {
                    Marker("Tu ubicación", coordinate: location.coordinate)
                        .tint(.blue)
                }
            }
            .mapControls {
                MapUserLocationButton()
                MapCompass()
            }
            .onAppear {
                locationManager.solicitarPermiso()
            }
            .onChange(of: locationManager.location) {
                _,
                newLocation in
                if let newLocation {
                    position = .region(
                        MKCoordinateRegion(
                            center: newLocation.coordinate,
                            span: MKCoordinateSpan(
                                latitudeDelta: 0.05,
                                longitudeDelta: 0.05
                            )
                        )
                    )
                }
            }
            .frame(height: 300)
            .cornerRadius(20)
            .shadow(radius: 10)
        }
    }
}

#Preview {
    VistaMapa()
}

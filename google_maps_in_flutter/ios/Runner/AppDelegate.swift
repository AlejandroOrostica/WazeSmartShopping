import UIKit
import Flutter
import GoogleMaps/GoogleMaps


@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    GMSServices provideAPIKey: @"AIzaSyBCto_tfPWSawjrnlgL0OP6iToXn81qlB8"
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

}

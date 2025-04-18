//
//  UserAgent.swift
//  TemplateApp
//
//  Created by Mathijs Bernson on 18/04/2025.
//  Copyright © 2025 Q42. All rights reserved.
//

import Foundation
import UIKit

/// Returns the user agent string for this device, consisting of the app name, app version, build number, OS version and device model.
/// eg. MyApp/1.0 (1; iOS/18.3; iPhone13,2)
/// This format is consistent with the Android app template.
@MainActor func UserAgentString() -> String {
    let info = Bundle.main.infoDictionary
    let appName = info?["CFBundleName"] as? String ?? "unknown"
    let appVersion = info?["CFBundleShortVersionString"] as? String ?? "unknown"
    let buildNumber = info?["CFBundleVersion"] as? String ?? "unknown"
    let currentDevice = UIDevice.current
    let osVersion = "\(currentDevice.systemName)/\(currentDevice.systemVersion)"
    let deviceModel = deviceModel() ?? "unknown"
    return "\(appName)/\(appVersion) (\(buildNumber); \(osVersion); \(deviceModel))"
}

/// Returns the device model identifier for the current device.
/// eg. iPhone5,2
private func deviceModel() -> String? {
    var sysinfo = utsname()
    uname(&sysinfo)
    return String(bytes: Data(bytes: &sysinfo.machine, count: Int(_SYS_NAMELEN)), encoding: .ascii)?
        .trimmingCharacters(in: .controlCharacters)
}

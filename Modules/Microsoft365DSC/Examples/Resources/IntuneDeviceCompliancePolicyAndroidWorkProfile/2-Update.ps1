<#
This example creates a new Device Compliance Policy for iOs devices
#>

Configuration Example
{
    param(
        [Parameter()]
        [System.String]
        $ApplicationId,

        [Parameter()]
        [System.String]
        $TenantId,

        [Parameter()]
        [System.String]
        $CertificateThumbprint
    )
    Import-DscResource -ModuleName Microsoft365DSC

    node localhost
    {
        IntuneDeviceCompliancePolicyAndroidWorkProfile 'ConfigureAndroidDeviceCompliancePolicyWorkProfile'
        {
            DisplayName                                        = 'Test Policy'
            Description                                        = ''
            DeviceThreatProtectionEnabled                      = $False
            DeviceThreatProtectionRequiredSecurityLevel        = 'unavailable'
            PasswordExpirationDays                             = 90
            PasswordMinimumLength                              = 8 # Updated Property
            PasswordMinutesOfInactivityBeforeLock              = 5
            PasswordRequired                                   = $True
            PasswordRequiredType                               = 'numericComplex'
            SecurityBlockJailbrokenDevices                     = $True
            SecurityDisableUsbDebugging                        = $False
            SecurityPreventInstallAppsFromUnknownSources       = $False
            SecurityRequireCompanyPortalAppIntegrity           = $False
            SecurityRequireGooglePlayServices                  = $False
            SecurityRequireSafetyNetAttestationBasicIntegrity  = $False
            SecurityRequireSafetyNetAttestationCertifiedDevice = $False
            SecurityRequireUpToDateSecurityProviders           = $False
            SecurityRequireVerifyApps                          = $False
            StorageRequireEncryption                           = $True
            Ensure                                             = 'Present'
            ApplicationId         = $ApplicationId;
            TenantId              = $TenantId;
            CertificateThumbprint = $CertificateThumbprint;
        }
    }
}

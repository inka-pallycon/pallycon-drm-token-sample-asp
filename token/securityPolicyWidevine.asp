<%
Class SecurityPolicyWidevine
    private m_securityLevel
    private m_requiredHdcpVersion
    private m_requiredCgmsFlags
    private m_disableAnalogOutput
    private m_hdcpSrmRule
    private m_overrideDeviceRevocation

    Public Sub SetSecurityLevel(i_securityLevel)
        If Not IsEmpty(i_securityLevel) Then
            If VarType(i_securityLevel) = 2 OR VarType(i_securityLevel) = 3 then
                m_securityLevel = i_securityLevel
            Else
                call Err.Raise(1022, "SecurityPolicyWidevine", " The securityLevel should be integer")
            End If
        End If
    End Sub

    Public Function GetSecurityLevel()
        GetSecurityLevel = m_securityLevel
    End Function

    Public Sub SetRequireHdcpVersion(s_requireHdcpVersion)
        If Not IsEmpty(s_requireHdcpVersion) Then
            m_requiredHdcpVersion = s_requireHdcpVersion
        End If
    End Sub

    Public Function GetRequireHdcpVersion()
        GetRequireHdcpVersion = m_requiredHdcpVersion
    End Function

    Public Sub SetRequiredCgmsFlags(s_requiredCgmsFlags)
        If Not IsEmpty(s_requiredCgmsFlags) Then
            m_requiredCgmsFlags = s_requiredCgmsFlags
        End If
    End Sub

    Public Function GetRequiredCgmsFlags()
        GetRequiredCgmsFlags = m_requiredCgmsFlags
    End Function

    Public Sub SetDisableAnalogOutput(b_disableAnalogOutput)
        If Not IsEmpty(s_disableAnalogOutput) Then
            m_disableAnalogOutput = b_disableAnalogOutput
        End If
    End Sub

    Public Function GetDisableAnalogOutput()
        GetDisableAnalogOutput = m_disableAnalogOutput
    End Function

    Public Sub SetHdcpSrmRule(s_hdcpSrmRule)
        If Not IsEmpty(s_hdcpSrmRule) Then
            m_hdcpSrmRule = s_hdcpSrmRule
        End If
    End Sub

    Public Function GetHdcpSrmRule()
        GetHdcpSrmRule = m_hdcpSrmRule
    End Function

    Public Sub SetOverrideDeviceRevocation(s_overrideDeviceRevocation)
        If Not IsEmpty(s_overrideDeviceRevocation) Then
            m_overrideDeviceRevocation = s_overrideDeviceRevocation
        End If
    End Sub

    Public Function GetOverrideDeviceRevocation()
        m_overrideDeviceRevocation = s_overrideDeviceRevocation
    End Function

    Public Function ToJsonString()
        s_jsonResult = "{"
        If Not IsEmpty(m_securityLevel) Then
            s_jsonResult = s_jsonResult & """security_level"":" & m_securityLevel
        End If

        If Not IsEmpty(m_requiredHdcpVersion) Then
            If s_jsonResult <> "{" Then
                s_jsonResult = s_jsonResult & ","
            End If

            s_jsonResult = s_jsonResult & """required_hdcp_version"":""" & m_requiredHdcpVersion & """"
        End If

        If Not IsEmpty(m_requiredCgmsFlags) Then
            If s_jsonResult <> "{" Then
                s_jsonResult = s_jsonResult & ","
            End If

            s_jsonResult = s_jsonResult & """required_cgms_flags"":""" & m_requiredCgmsFlags & """"
        End If

        If Not IsEmpty(m_disableAnalogOutput) Then
            If s_jsonResult <> "{" Then
                s_jsonResult = s_jsonResult & ","
            End If

            s_jsonResult = s_jsonResult & """disable_analog_output"":" & m_disableAnalogOutput
        End If

        If Not IsEmpty(m_hdcpSrmRule) Then
            If s_jsonResult <> "{" Then
                s_jsonResult = s_jsonResult & ","
            End If

            s_jsonResult = s_jsonResult & """hdcp_srm_rule"":""" & m_hdcpSrmRule & """"
        End If

        If Not IsEmpty(m_overrideDeviceRevocation) Then
            If s_jsonResult <> "{" Then
                s_jsonResult = s_jsonResult & ","
            End If

            s_jsonResult = s_jsonResult & """override_device_revocation"":" & m_overrideDeviceRevocation
        End If

        s_jsonResult = s_jsonResult & "}"
        ToJsonString = s_jsonResult
    End Function
    
End Class

%>
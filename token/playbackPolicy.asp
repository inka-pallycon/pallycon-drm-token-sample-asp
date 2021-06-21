<%
Class PlaybackPolicy
    private m_persistent
    private m_licenseDuration
    private m_expireDate
    private m_allowedTrackTypes

    Public Sub SetPersistent(b_persistent)
        If VarType(b_persistent) = 11 then
            m_persistent = b_persistent
        Else
            call Err.Raise(1009, "PlaybackPolicy", "The persistent should be boolean")
        End If
    End Sub

    Public Function GetPersistent()
        If IsEmpty(m_persistent) then
            GetPersistent = False
        Else
            GetPersistent = m_persistent
        End If
    End Function

    Public Sub SetLicenseDuration(i_licenseDuration)
        If VarType(i_licenseDuration) = 2 OR VarType(i_licenseDuration) = 3 then
            m_licenseDuration = i_licenseDuration
        Else
            call Err.Raise(1010, "PlaybackPolicy", "The duration should be number")
        End If
    End Sub

    Public Function GetLicenseDuration()
    
        If IsEmpty(m_licenseDuration) then
            GetLicenseDuration = 0
        Else
            GetLicenseDuration = m_licenseDuration
        End If
    End Function

    Public Sub SetExpireDate(s_expireDate)
        If CheckTimeFormat(s_expireDate) = 1 then
            m_expireDate = s_expireDate
        Else
            call Err.Raise(1011, "PlaybackPolicy", "The expireDate time format should be 'YYYY-MM-DD'T'HH:mm:ss'Z'")
        End If
    End Sub

    Public Function GetExpireDate()
        If IsEmpty(m_expireDate) then
            GetExpireDate = ""
        Else
            GetExpireDate = m_expireDate
        End If
    End Function

    Public Sub SetAllowedTrackTypes(s_allowedTrackTypes)
        If Not IsEmpty(s_allowedTrackTypes) Then
            m_allowedTrackTypes = s_allowedTrackTypes
        End If
    End Sub

    Public Function GetAllowedTrackTypes()
        GetAllowedTrackTypes = m_allowedTrackTypes
    End Function

    Private Function CheckTimeFormat(s_target)
        Set exReg = New RegExp

        exReg.Pattern = "^[0-9]{4}-[0,1][0-9]-[0-5][0-9]T[0-2][0-3]:[0-5][0-9]:[0-5][0-9]Z$"
        exReg.Global = True
        exReg.IgnoreCase = True
        Set match = exReg.Execute(sTarget)

        CheckHex32 = match.count
    End Function

    Public Function ToJsonString()
        s_jsonResult = "{"

        If Not IsEmpty(m_persistent) Then
            s_jsonResult = s_jsonResult & """persistent"":" & m_persistent
        Else
            s_jsonResult = s_jsonResult & """persistent"": false"
        End If

        If Not IsEmpty(m_licenseDuration) Then
            s_jsonResult = s_jsonResult & ",""license_duration"":" & m_licenseDuration
        End If

        If Not IsEmpty(m_expireDate) Then
            s_jsonResult = s_jsonResult & ",""expire_date"":""" & m_expireDate & """"
        End If

        If Not IsEmpty(m_allowedTrackTypes) Then
            s_jsonResult = s_jsonResult & ",""allowed_track_types"": """ & m_allowedTrackTypes & """"
        End If
        s_jsonResult = s_jsonResult & "}"
        ToJsonString = s_jsonResult
    End Function
    
End Class

%>
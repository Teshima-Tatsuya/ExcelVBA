Attribute VB_Name = "Strings"
Option Explicit

' 選択した範囲の文字列を結合する（デフォルトはカンマ区切り）
' rng 結合したい範囲
' delim 結合文字
Function JOIN(rng As Range, Optional delim As String = ",") As String
    Dim result As String
    Dim r As Range

    result = ""
    For Each r In rng
        result = result & r & delim
    Next

    JOIN = Left(result, Len(result) - 1)
End Function

' 文字列を右から検索して、最初にヒットした位置を返す。
' target 検索対象の文字列
' needle 検索する文字列
Function FINDR(target As String, needle As String) As Integer
    FINDR = InStrRev(target, needle)
End Function

Public Function VLOOKUPEX(needle As String, search_range As Range, return_array, Optional if_not_find = "") As String
    Dim cell As Range
    Dim i As Long
    
    i = 1
    For Each cell In search_range
        If cell.Value = needle Then
            VLOOKUPEX = return_array(i).Value
            Exit Function
        End If
        i = i + 1
    Next
    
    If TypeName(if_not_find) = "" Then
    End If
    VLOOKUPEX = if_not_find
End Function

' 正規表現で検索する関数
Public Function SEARCHRE(str As String, pattern As String, Optional index As Integer = 1, Optional sub_index As Variant) As String
    Dim RE
    Dim Match
    Dim r As Range
    
    Set RE = CreateObject("VBScript.RegExp")
    
    With RE
        .pattern = pattern
        .IgnoreCase = False
        .Global = True
        Set Match = .Execute(str)
    End With
    
    If Match.Count > 0 Then
        If IsMissing(sub_index) = False Then
            If Match(index - 1).SubMatches.Count > 0 Then
                SEARCHRE = Match(index - 1).SubMatches(Int(sub_index) - 1)
            End If
        Else
            SEARCHRE = Match(index - 1).Value
        End If
    Else
        SEARCHRE = ""
    End If
End Function

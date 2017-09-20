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

' VLOOKUPの左端以外で検索可能な関数
' target 検索対象
' dataRng データ検索範囲
' searchRng 検索範囲
' column 検索対象列
Function VLOOKUPEX(target As String, dataRng As Variant, _
                            searchRng As Range, column As Integer)
    VLOOKUPEX = WorksheetFunction.Index(dataRng, _
                        WorksheetFunction.Match(target, searchRng, 0), column)
End Function

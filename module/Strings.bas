Attribute VB_Name = "Strings"
Option Explicit

' �I�������͈͂̕��������������i�f�t�H���g�̓J���}��؂�j
' rng �����������͈�
' delim ��������
Function JOIN(rng As Range, Optional delim As String = ",") As String
    Dim result As String
    Dim r As Range

    result = ""
    For Each r In rng
        result = result & r & delim
    Next

    JOIN = Left(result, Len(result) - 1)
End Function

' ��������E���猟�����āA�ŏ��Ƀq�b�g�����ʒu��Ԃ��B
' target �����Ώۂ̕�����
' needle �������镶����
Function FINDR(target As String, needle As String) As Integer
    FINDR = InStrRev(target, needle)
End Function

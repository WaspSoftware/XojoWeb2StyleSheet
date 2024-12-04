#tag Class
Protected Class WASPWebPopupMenu
Inherits WebPopupMenu
	#tag Event
		Sub Opening()
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Shown()
		  ' ----------------------------------------------------------------------
		  ' Procedure Name: WASPPopupMenu.Opening
		  ' By            : Jim Brock
		  ' Notes
		  ' Set the CSS class
		  ' ----------------------------------------------------------------------
		  Try
		    
		    ' Set the CSS Class
		    Me.AddCSSClass(ClassName)
		    
		    ' Launch the opening on instance class
		    'Opening
		    
		  Catch Err As RunTimeException
		    WebDisplayError Err
		  End Try
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub AddRowWithTag(Value As String, TagValue As Variant)
		  ' ----------------------------------------------------------------------
		  ' Procedure Name: WaspPopupMenu
		  ' By            : Metodija Angjelkoski (June, 2020)
		  ' Notes
		  ' Adds a row as usual, but with tag if added
		  ' ----------------------------------------------------------------------
		  
		  Me.AddRow Value
		  
		  ' if Row tag column is supplied in parameters, add appropriate row tag
		  If TagValue.StringValue <> "" Then
		    Me.RowTagAt(Me.RowCount-1) = TagValue
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HasSelection() As Boolean
		  ' ----------------------------------------------------------------------
		  ' Procedure Name: WaspPopupMenu.HasSelection
		  ' By            : Metodija Angjelkoski (February, 2021)
		  ' Notes
		  ' Returns a boolean value answer - is there a selected item in the popup
		  ' ----------------------------------------------------------------------
		  
		  ' If there is no selection, not selection is "Wasp.Clear"
		  Return Me.SelectedRowIndex <> -1 And SelectedTag.StringValue <> "Wasp.Clear"
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SelectByTag(Tag As Variant)
		  ' ----------------------------------------------------------------------
		  ' Procedure Name: WaspPopupMenu.SelectByTag
		  ' By            : Metodija Angjelkoski
		  ' Notes
		  ' Changes klist index to match selected tag
		  ' ----------------------------------------------------------------------
		  
		  Var Found As Integer = -1
		  
		  For i As Integer = 0 To Me.RowCount - 1
		    
		    If Tag = Me.RowTagAt(i) Then
		      Found = i
		      Exit For
		    End If
		    
		  Next
		  
		  Me.SelectedRowIndex = Found
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SelectedTag() As Variant
		  ' ----------------------------------------------------------------------
		  ' Procedure Name: WaspPopupMenu.SelectedTag
		  ' By            : Metodija Angjelkoski (04/2019)
		  ' Notes
		  ' Returns tag of the selected row, or nil if there is no tag. 
		  ' ----------------------------------------------------------------------
		  
		  Var Tag As Variant = Nil
		  
		  If SelectedRowIndex > -1 Then
		    Tag = Me.RowTagAt(Me.SelectedRowIndex)
		  End If
		  
		  Return Tag
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SelectedValue() As String
		  ' ----------------------------------------------------------------------
		  ' Procedure Name: WaspPopupMenu.SelectedTag
		  ' By            : Metodija Angjelkoski (04/2019)
		  ' Notes
		  ' Returns string value of the selected row, or "" if there is no selection. 
		  ' ----------------------------------------------------------------------
		  
		  Var Value As String = ""
		  
		  If SelectedRowIndex > -1 Then
		    Value = SelectedRowValue
		  End If
		  
		  Return Value
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Opening()
	#tag EndHook


	#tag Property, Flags = &h0
		ActOnSelectionChanged As Boolean = True
	#tag EndProperty

	#tag Property, Flags = &h0
		AllowClear As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h0
		AutoSelectTag As Boolean = False
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  ' ----------------------------------------------------------------------
			  ' Procedure : WASPPopupMenu.Get
			  ' By        : Jim Brock
			  ' Notes
			  ' Return the current classname
			  ' ----------------------------------------------------------------------
			  Try
			    
			    Return mClassName
			    
			  Catch Err As RunTimeException
			    WebDisplayError Err
			  End Try
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  ' ----------------------------------------------------------------------
			  ' Procedure : WASPPopupMenu.Set
			  ' By        : Jim Brock
			  ' Notes
			  ' Set the Class Value
			  ' ----------------------------------------------------------------------
			  Try
			    
			    ' Update the CSS class
			    Me.UpdateCSSClass mClassName, Value
			    
			    ' Set the Current value
			    mClassName = value
			    
			    
			  Catch Err As RunTimeException
			    WebDisplayError Err
			  End Try
			End Set
		#tag EndSetter
		ClassName As String
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mClassName As String
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="PanelIndex"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="SelectedRowText"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Behavior"
			InitialValue="25"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockBottom"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockHorizontal"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockLeft"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockRight"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockTop"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockVertical"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Visible=true
			Group="Behavior"
			InitialValue="100"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ActOnSelectionChanged"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AutoSelectTag"
			Visible=false
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowClear"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ClassName"
			Visible=true
			Group="Behavior"
			InitialValue="WASPWebPopupMenu"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabIndex"
			Visible=true
			Group="Visual Controls"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="SelectedRowIndex"
			Visible=true
			Group="Popup Menu"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="_mPanelIndex"
			Visible=false
			Group="Behavior"
			InitialValue="-1"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ControlID"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="_mName"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RowCount"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LastAddedRowIndex"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LastRowIndex"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Indicator"
			Visible=false
			Group="Visual Controls"
			InitialValue=""
			Type="WebUIControl.Indicators"
			EditorType="Enum"
			#tag EnumValues
				"0 - Default"
				"1 - Primary"
				"2 - Secondary"
				"3 - Success"
				"4 - Danger"
				"5 - Warning"
				"6 - Info"
				"7 - Light"
				"8 - Dark"
				"9 - Link"
			#tag EndEnumValues
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass

#tag Module
Protected Module modCSS
	#tag Method, Flags = &h0
		Sub AddCSSClass(Extends thisControl As WebControl, ClassName As String)
		  ' ----------------------------------------------------------------------
		  ' Procedure : modWebRoutines.SetCSSClass
		  ' By        : Jim Brock
		  ' Notes
		  ' Set the style of this control
		  ' ----------------------------------------------------------------------
		  
		  ' Add The class name to the control and the control the runtime appearance using 
		  ' our own styles (from bootstrap)
		  If ClassName.Trim <> "" Then
		    
		    ' Check if the class name is valid
		    If Not App.AppStyles.HasKey(ClassName) Then
		      Raise New RuntimeExceptionex(1, "Class not recognised: " + ClassName + " in " + thisControl.Name)
		    End If
		    
		    ' Set the Style using JS
		    thisControl.ExecuteJavaScript("document.getElementById('" + thisControl.ControlID + "').classList.add('" + ClassName + "');")
		    
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateCSSClass(Extends thisControl As WebControl, CurrentClassName As String, NewClassName As String)
		  ' ----------------------------------------------------------------------
		  ' Procedure : modWebRoutines.SetCSSClass
		  ' By        : Jim Brock
		  ' Notes
		  ' Set the style of this control
		  ' ----------------------------------------------------------------------
		  
		  ' If the class name has already been set then remove the class
		  If CurrentClassName.Trim <> "" Then
		    thisControl.ExecuteJavaScript("document.getElementById('" + thisControl.ControlID + "').classList.remove('" + CurrentClassName + "');")
		  End If
		  
		  ' Check for "non empty" classes to be set. 
		  If NewClassName.Trim <> "" Then
		    
		    ' Check if the class name is valid
		    If Not App.AppStyles.HasKey(NewClassName) Then
		      Raise New RuntimeExceptionex(1, "Class not recognised: " + NewClassName + " in " + thisControl.Name)
		    End If
		    
		    ' Add this to the control's class list
		    thisControl.ExecuteJavaScript("document.getElementById('" + thisControl.ControlID + "').classList.add('" + NewClassName + "');")
		    
		  End If
		End Sub
	#tag EndMethod


	#tag Constant, Name = JSAddCSSClassPopupMenu, Type = String, Dynamic = False, Default = \"for (let n\x3D0; n< document.styleSheets.length; n++){\r\n\r\n\tif (document.styleSheets[n].href.includes(\"WASP.css\")){\r\n\t\r\n\t\tfor(let i \x3D 0; i < document.styleSheets[n].cssRules.length; i++) {\r\n\t\t\tif(document.styleSheets[n].cssRules[i].selectorText.includes(\'.WASPWebPopupMenu li\')) {\r\n\t\t\t\t\tconsole.log(document.styleSheets[n].cssRules[i]);\r\n\t\t\t\t\tdocument.styleSheets[n].cssRules[i].cssText \x3D \".[id\x3D{controlId}_menu\'] li { background-color: blue; }\";\r\n\t\t\t\t\tconsole.log(document.styleSheets[n].cssRules[i].cssText);\r\n\r\n\t\t\t}\r\n\t\t}\r\n\t\t\r\n\t}\r\n}", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
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
	#tag EndViewBehavior
End Module
#tag EndModule

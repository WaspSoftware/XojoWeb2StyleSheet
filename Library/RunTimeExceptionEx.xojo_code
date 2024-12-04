#tag Class
Protected Class RunTimeExceptionEx
Inherits RunTimeException
	#tag Method, Flags = &h1000
		Sub Constructor(ErrorNumber As Integer, Message As String)
		  ' ----------------------------------------------------------------------
		  ' Procedure Name: RuntimeExceptionEx.Construtor
		  ' Date          : 5/10/2013
		  ' By            : Jim Brock
		  ' Notes
		  ' Create a new instance with the number and message filled in
		  ' ----------------------------------------------------------------------
		  Self.ErrorNumber = ErrorNumber
		  Self.Message = Message
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(Err As RuntimeException, Routine As String)
		  Self.ErrorNumber = Err.ErrorNumber
		  
		  If Err IsA RuntimeExceptionEx Then
		    Self.Message = Routine + ":" + Err.Message
		  Else
		    Self.Message = Routine + ":" + Introspection.GetType(Err).FullName + Err.Message
		  End If
		End Sub
	#tag EndMethod


	#tag ViewBehavior
		#tag ViewProperty
			Name="ErrorNumber"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
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
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Message"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
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
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass

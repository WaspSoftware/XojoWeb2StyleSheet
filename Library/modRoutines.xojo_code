#tag Module
Protected Module modRoutines
	#tag Method, Flags = &h0
		Sub GetApplicationPath()
		  ' ----------------------------------------------------------------------
		  ' Procedure Name: GetApplicationPath
		  ' Date          : 7/10/2013
		  ' By            : Jim Brock
		  ' Notes
		  ' Work out what the application path is so you can do file IO
		  ' ----------------------------------------------------------------------
		  
		  ' Get the application folder
		  ApplicationPath = New FolderItem("", FolderItem.PathModes.Native)
		  
		  ' If DebugBuild then the Session.Config is in the parent folder because RB creates
		  ' a debug<appname> folder to debug the code in!!!!
		  #If DebugBuild
		    ApplicationPath = ApplicationPath.Parent
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadCSS(ByRef HTMLHeader As String)
		  ' ----------------------------------------------------------------------
		  ' Procedure : modWebRoutines.LoadWASPCss
		  ' By        : Jim Brock
		  ' Notes
		  ' Load in the WASP.Css file and link it to pages on the web session
		  ' ----------------------------------------------------------------------
		  Var ASCII_DoubleQuote As String = Chr(34)
		  
		  Var CSSFileName As String
		  
		  ' Use the default filename
		  CSSFileName = "WASP.css"
		  
		  
		  ' Open up the WASP.css for input
		  Var thisCSSFile As FolderItem = ApplicationPath.Child(CSSFileName)
		  Var thisTextStream As TextInputStream = TextInputStream.Open(thisCSSFile)
		  
		  ' Create a Webfile to hold the CSS
		  Session.CSSWebFile = New WebFile
		  Session.CSSWebFile.ForceDownload = False
		  Session.CSSWebFile.Filename = "WASP.css"
		  Session.CSSWebFile.MIMEType = "text/css"
		  
		  ' Read in the CSS
		  Session.CSSWebFile.Data = thisTextStream.ReadAll
		  
		  ' Close the CSS file
		  thisTextStream.Close
		  
		  ' Add the New CSS to the header of the page
		  HTMLHeader = HTMLHeader + "<link href=" + ASCII_DoubleQuote + Session.CSSWebFile.URL + ASCII_DoubleQuote + " rel="+ ASCII_DoubleQuote + "stylesheet"+ ASCII_DoubleQuote + _
		  " type="+ ASCII_DoubleQuote + "text/css" + ASCII_DoubleQuote + ">"
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub WebDisplayError(Err As RuntimeException)
		  MessageBox (Err.Message)
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		ApplicationPath As FolderItem
	#tag EndProperty


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

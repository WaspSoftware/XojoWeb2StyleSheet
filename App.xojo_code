#tag Class
Protected Class App
Inherits WebApplication
	#tag Event
		Function HandleURL(request As WebRequest, response As WebResponse) As Boolean
		  ' ----------------------------------------------------------------------
		  ' Procedure : App.HandleURL
		  ' By        : Jim Brock
		  ' Notes
		  ' Return False to load the standard session
		  ' ----------------------------------------------------------------------
		  If Request.Path = "" Then
		    Return False
		  End If
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub Opening(args() As String)
		  ' ----------------------------------------------------------------------
		  ' Procedure : App.Opening
		  ' By        : Jim Brock
		  ' Notes
		  ' Prepare the application
		  ' ----------------------------------------------------------------------
		  Try
		    
		    ' Set the path to where the config files are
		    modRoutines.GetApplicationPath
		    
		    ' Load in the styles from WASP.css
		    LoadAppStyles
		    
		  Catch Err As RunTimeException
		    Print "Error Opening Application:" +  Err.Message
		  End Try
		  
		  
		  
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub LoadAppStyles()
		  ' ----------------------------------------------------------------------
		  ' Procedure : WebAppOutline.LoadAppStyles
		  ' By        : Jim Brock
		  ' Notes
		  ' Load in a list of known WASP Styles from the style sheet for error trapping
		  ' and debug purposes
		  '
		  ' Mid to Middle Checked
		  ' ----------------------------------------------------------------------
		  
		  ' The CSS Filename
		  Var CSSFileName As String
		  
		  
		  ' Use the default filename
		  CSSFileName = "WASP.css"
		  
		  ' Initiate the dictionary
		  Me.AppStyles = New Dictionary
		  
		  ' Open up the CSS file for input
		  Var thisCSSFile As FolderItem = ApplicationPath.Child(CSSFileName)
		  
		  ' Check that the file exists
		  If Not thisCSSFile.Exists Then
		    Raise New RuntimeExceptionEx(1, "CSSFile does not exist: " + CSSFileName)
		  End If
		  
		  ' Record any errors when reading the CSS File
		  Try
		    
		    ' Open the text stream
		    Var thisTextStream As TextInputStream = TextInputStream.Open(thisCSSFile)
		    
		    ' Get the first line
		    Var thisLine As String = thisTextStream.ReadLine
		    
		    ' What characters are considered terminators
		    Var terminators As String = " :{"
		    
		    ' Loop through the file adding class names to the Styles dictionary
		    While Not thisTextStream.EndOfFile
		      
		      ' Classes always start with a "."
		      If thisLine.Left(1) = "." Then
		        
		        ' The style name
		        Var thisStyleName As String
		        
		        ' Loop through the text looking for terminating characters. Ignore the first "."
		        For n As Integer = 1 To thisLine.Length
		          
		          ' If the next character is not a terminator then add it to the class name
		          If terminators.IndexOf(thisLine.Middle(n, 1)) < 0 Then
		            
		            ' Add this character to the 
		            thisStyleName = thisStyleName + thisLine.Middle(n, 1)
		            
		          Else
		            
		            ' Store the style name in the dictionary
		            Me.AppStyles.Value(thisStyleName) = thisStyleName
		            
		            ' Exit the loop
		            Exit For
		            
		          End If
		          
		        Next
		        
		      End If
		      
		      ' Get the Next line
		      thisLine = thisTextStream.ReadLine
		      
		    Wend
		    
		    ' Close the CSS file
		    thisTextStream.Close
		    
		  Catch Err As RuntimeException
		    
		    ' Create a more meaningful message
		    Raise New RuntimeExceptionEx(1, "Error Reading " + CSSFileName + ": " + Err.Message)
		    
		  End Try
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		AppStyles As Dictionary
	#tag EndProperty


	#tag Constant, Name = kEditClear, Type = String, Dynamic = False, Default = \"&Delete", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"&Delete"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"&Delete"
	#tag EndConstant

	#tag Constant, Name = kFileQuit, Type = String, Dynamic = False, Default = \"&Quit", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"E&xit"
	#tag EndConstant

	#tag Constant, Name = kFileQuitShortcut, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Cmd+Q"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"Ctrl+Q"
	#tag EndConstant


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass

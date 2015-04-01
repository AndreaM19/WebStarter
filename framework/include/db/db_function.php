<?php

/*Open connection to a Database*/
function connectToDB($host, $user, $password, $db, $port){
	$conn = mysqli_connect($host, $user, $password, $db, $port);
	return $conn;
}

/*Close a connection to a Database*/
function disconnectFromDB($connToClose){
	mysqli_close($connToClose);
}

/*Database Query*/
function queryToDB($conn, $queryText){
	if(isset($conn)){
		$myQuery=mysqli_query($conn, $queryText);
	return $myQuery;
	}
	else return false;		
}

/* This function is used to free memory space after queries*/
function freeMemoryAfterQuery($queryValue){
	mysqli_free_result($queryValue);
}
<cfscript>
dsn = "yourDataSource"; // replace with your Data Source Name
username = "yourUsername"; // replace with your MySQL username
password = "yourPassword"; // replace with your MySQL password
try {
    dbConnection = new datasource( dsn, username, password );
} catch (any e) {
    writeOutput("Error connecting to database: " & e.message);
    return;
}

queryString = "SELECT * FROM yourTable"; // replace with your table name
resultSet = dbConnection.execute(queryString);

// Create a new Word document
wordDoc = createObject("com.aspose.words.Document");
introduction = wordDoc.getFirstSection().getBody().appendParagraph("Introduction");
introduction.getParagraphFormat().setStyleIdentifier(1); // Set style (1 = Title)
wordDoc.getFirstSection().getBody().appendParagraph("This document contains data extracted from the database.");
while (resultSet.next()) {
    // Fetch data from the result set
    dataField = resultSet.getString("yourField"); // replace with your field name

    // Truncate data if it exceeds a certain length (e.g., 100 characters)
    if (len(dataField) > 100) {
        dataField = left(dataField, 100) & "..."; 
    }
    wordDoc.getFirstSection().getBody().appendParagraph(dataField);
}

filePath = "C:\\ColdFusionProject\\output\\document.docx"; // specify the path to save the document
wordDoc.save(filePath);
writeOutput("Document created successfully: " & filePath);
</cfscript>

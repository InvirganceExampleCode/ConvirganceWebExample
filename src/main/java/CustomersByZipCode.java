/*
 * Copyright 2024 INVIRGANCE LLC

Permission is hereby granted, free of charge, to any person obtaining a copy 
of this software and associated documentation files (the “Software”), to deal 
in the Software without restriction, including without limitation the rights to 
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies 
of the Software, and to permit persons to whom the Software is furnished to do 
so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all 
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR 
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE 
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER 
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, 
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE 
SOFTWARE.
 */

import com.invirgance.convirgance.dbms.DBMS;
import com.invirgance.convirgance.dbms.Query;
import com.invirgance.convirgance.output.JSONOutput;
import com.invirgance.convirgance.source.ClasspathSource;
import com.invirgance.convirgance.target.OutputStreamTarget;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/servlet/database"})
public class CustomersByZipCode extends HttpServlet
{
    private String getParameter(HttpServletRequest request, String name)
    {
        String parameter = request.getParameter(name);
        
        if(parameter == null) return ""; // Default to blank string
        
        return parameter;
    }
    
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        var query = new Query(new ClasspathSource("/sql/customers.sql"));
        var dbms = DBMS.lookup("jdbc/sample");
        
        query.setBinding("zipcode", getParameter(request, "zipcode"));
        query.setBinding("state", getParameter(request, "state"));
        query.setBinding("discountCode", getParameter(request, "discountCode"));
        
        new JSONOutput().write(new OutputStreamTarget(response.getOutputStream()), dbms.query(query));
    }
}

import AdminNavBar from "./AdminNavBar";
import { useEffect, useState } from "react";
export default function ApprovalPage()
{
    const username=JSON.parse(localStorage.getItem("loggedUser"));
    const [data,setData]=useState([]);

   
    useEffect(()=>{
        
        fetch("http://localhost:8080/all")
        .then(res=>res.json())
        .then(data=>setData(data))
        
    },[]);
    const handleChange=(e)=>{
        alert(e);
        fetch("http://localhost:8080/updateRegStatus?user_id="+e)
        .then(res=>res.json())
        .then(obj=>{
            if(obj)
            {
                alert("Approved");
            }
            else{
                alert("Not Approver yet");
            }
        })
    }
    
    return(
        <div>
            <AdminNavBar/>
            <h1>
            Admin {username.fname}
            </h1>

            <table className="table table-striped" >
                <tr>
                    
                    <th className="text-center">First Name</th>
                    
                    <th className="text-center">Last Name</th>
                    
                    <th className="text-center">Email</th>
                    
                    <th className="text-center">Contact</th>
                    
                    <th className="text-center">Approval</th>
                    
                </tr>
                
                { // here slice used for limited data
                    data.map(v => {
                        if(v.status===0){
                        return (
                            <tr>                                
                               
                                
                                <td className="text-center">{v.fname}</td>
                                <td className="text-center">{v.lname}</td>
                                <td className="text-center">{v.email}</td>
                                <td className="text-center">{v.contact}</td>
                                <td className="text-center"><a href="#" onClick={()=>{return handleChange(v.user_id)}}>Approve</a></td>
                            
                            </tr>
                        )}
                    })
                }

            </table>

         </div>   
    )
}

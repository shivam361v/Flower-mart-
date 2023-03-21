import { useState } from "react";
import { useEffect } from "react";
import { useNavigate } from "react-router-dom";
//import { Link } from "react-router-dom";
import FloristNavBar from "./FloristNavBar";
//import { Button, Form } from "react-bootstrap";

export default function AllFlowers(){

    const username=JSON.parse(localStorage.getItem("loggedUser"));
    const [data,setData]=useState([]);

    const navigate = useNavigate();
   
    useEffect(()=>{
        
        fetch("http://localhost:8080/allProduct")
        .then(res=>res.json())
        .then(data=>
            
            {
                if(data!= null)
                {
                    setData(data);
                }
                else{
                    alert("You have not registerd any product.");
                    navigate("/florist_home");
                }

            }
        )
        
    },[]);

    
    return(
        <div>
            <FloristNavBar/>
            <h1>{username.fname}</h1>
            <table className="table table-striped" >
                <tr>
                    <th>Product Name</th>
                    <th>Stock</th>
                    <th>Price</th>
                    
                </tr>
               
           { data.map(v => {
                        if(v.florist_id.user_id.fname===username.fname){
                        return (
                            <tr>                                
                                
                                <td className="text-center">{v.p_name}</td>
                                <td className="text-center">{v.availablity}</td>
                                <td className="text-center">{v.price}</td>
                                {/* <td className="text-center"><button  onClick={handleChange(v.product_id)}>Delete</button></td> */}
                               
                            </tr>
                        )}
                        
                        // else
                        //    return;
                        
                    })}
                 
            </table>

        </div>
    )
}
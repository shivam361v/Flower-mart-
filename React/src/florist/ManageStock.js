//import { useState } from "react";
//import { useEffect } from "react";
import { useReducer} from "react";
//import { Form } from "react-router-dom";
//import { Button } from "react-bootstrap";
import FloristNavBar from "./FloristNavBar";
import { useNavigate } from "react-router-dom";
export default function ManageStock(){
   
    const username=JSON.parse(localStorage.getItem("loggedUser"));
    


    //const Floristproduct=JSON.parse(localStorage.getItem("product"));
   
   
    const init={
        p_name:"",
        availablity:0,
        price:0

    }
    
    const reducer=(state1,action)=>{
        switch(action.type)
        {
            case 'update':
                return {...state1,[action.fld]:action.val}
            // case 'reset':
            //     return init;

        }

    }
    const navigate=useNavigate();
    const [info,dispatch]=useReducer(reducer,init);
    //const [msg,setMsg]=useState(".....");
//<input type="submit" value="Submit"/>
    //const reduxAction=useDispatch();

    const sendDate=(e)=>{
        e.preventDefault();
        const reqOptions={
            method:'POST',
            headers:{'content-type':'application/json'},
            body:JSON.stringify(info)
        }
        fetch("http://localhost:8080/manageStock",reqOptions)
        .then(resp=>{if(resp.ok){
                        console.log(resp);
                        return resp.text();
                    }
                    else
                    {
                        console.log(resp);
                        throw new Error("server error");
                    }
                        
        })
        // .then(text=>text.length?JSON.parse(text):{})
        .then(obj=>{
            if(obj)
            {
                alert("Updated");
                navigate("/floristhome");
            }
            else{
                alert("Not Updated");
            }
            
        })
        .catch((error)=>alert("server error try after some time.."))
    }
    
    

  
    return(
        <div>
            
            <FloristNavBar/>
            <h1>{username.fname}</h1>
            
            <br/>
     
        
            <form>
            <input type="text" name="p_name" placeholder="Enter Product Name" value={info.p_name}
                    onChange={(e)=>{dispatch({type:'update',fld:'p_name',val:e.target.value})}}/><br/>
                    <br/>
                <input type="number" name="availablity" placeholder="Enter Stock" value={info.availablity}
                    onChange={(e)=>{dispatch({type:'update',fld:'availablity',val:e.target.value})}}/><br/>
                <br/>
                <input type="number" name="price" placeholder="Enter Price"
                value={info.price}
                onChange={(e)=>{dispatch({type:'update',fld:'price',val:e.target.value})}}/><br/>
                <br/>
                <input type="submit" value="Submit" onClick={(e)=>{sendDate(e)}}/>
            </form>
            
           


        </div>
    )
}
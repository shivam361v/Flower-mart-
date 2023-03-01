
import { Form } from "react-bootstrap";
import { Button } from "react-bootstrap";
import { useReducer, useState } from "react";
import { Route, Routes, useNavigate } from "react-router-dom";
import AdminHome from "./AdminHome";
import FloristHome from "./FloristHome";
import CustomerHome from "./CustomerHome";
import { Link } from "react-router-dom";
const init = {

    email: "",
    password: ""
}

const reducer = (state, action) => {
    switch (action.type) {
        case 'update':
            return { ...state, [action.fld]: action.val }
        case 'reset':
            return init;
    }
}






function LoginFrom() {
        
const [user, dispatch] = useReducer(reducer, init);
const [msg,setMsg] = useState("");
const navigate = useNavigate();

const sendData = (e) => {
    e.preventDefault();
    const reqOptions = {
        method: 'POST',
        headers: { 'content-type': 'application/json' },
        body: JSON.stringify(user)
            // email: user.email,
            // password: user.password
        

    }

    fetch("http://localhost:8080/checkLogin", reqOptions)
    //.then(res => console.log(res))
    //.then(resp => console.log(resp))
    .then(resp => resp.text())
    .then(text => text.length ? JSON.parse(text) : {})
    .then(obj => {
        if(Object.keys(obj).length === 0)
        {
            setMsg("Wrong UID/PWD");
        }
        else{
           // if(obj.status === 0)
           /* {
                // alert("Request has not been approved");
                setMsg("Request has not been approved")
                navigate('/')
            }*/
           // else{
                if(obj.type_id.type_id === 1)
                {
                    //<Link  to="customer_home"/>
                    navigate("/customer_home");
                }
                else if(obj.type_id.type_id === 2)
                {
                    navigate("florist_home");
                }
                else if(obj.type_id.type_id === 3)
                {
                    navigate("/admin_home");
                }
                
           // }
        }
    })
}

    // .then(resp => resp.text())
    


    return (
        <div className="container">
            <h3>Login Page</h3>
            <Form action="/checkLogin">
                <Form.Group className="mb-3" controlId="formBasicEmail">
                    <Form.Label>Email address</Form.Label>
                    <Form.Control type="email" name="email" placeholder="Enter email" value={user.email}
                        onChange={(e) => { dispatch({ type: 'update', fld: 'email', val: e.target.value }) }} />

                </Form.Group>

                <Form.Group className="mb-3" controlId="formBasicPassword">
                    <Form.Label>Password</Form.Label>
                    <Form.Control type="password" name="pass" placeholder="Password" value={user.password}
                        onChange={(e) => { dispatch({ type: 'update', fld: 'password', val: e.target.value }) }} />
                </Form.Group>

                <Button variant="primary" type="submit" onClick={(e)=>{sendData(e)}}>
                    Submit
                </Button>
                <Button variant="primary" type="reset" onClick={()=>{dispatch({type:'reset'})}} >
                    Reset
                </Button>
            </Form>

            <p>{JSON.stringify(user)}</p>
            <p>{msg}</p>

            

        </div>

    )

     }

export default LoginFrom;
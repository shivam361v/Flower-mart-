
import { Form } from "react-bootstrap";
import { useReducer, useState } from "react";
import { useNavigate } from "react-router-dom";
import { useDispatch } from "react-redux";
import { login } from "./slice";



function LoginFrom() {


    const init = {

        email: { value: "", touched: false, valid: false, error: "" },
        password: { value: "", touched: false, valid: false, error: "" },
        formvalid: { value: "", touched: false, valid: false, error: "" }
    }

    const reducer = (state, action) => {
        //console.log(state);
        switch (action.type) {
            case 'update': {
                const { name, value, touched, valid, error, formvalid } = action.data;
                return {
                    ...state,
                    [name]: { ...state[name], value, valid, error, touched },
                    formvalid
                }   //modifying and returning new object as state
            }
            case 'reset': {
                return init;
            }
        }
    }




    const [user, dispatch] = useReducer(reducer, init);
    const [msg, setMsg] = useState("");
    const navigate = useNavigate();
    const reducxAction = useDispatch();


    const validateData = (name, value) => {
        let valid = false;
        let error = "";
        switch (name) {

            case 'email':
                var pattern = /^[A-Za-z0-9_.-]{3,20}@gmail.com$/
                if (pattern.test(value)) {
                    valid = true;
                    error = "";
                }
                else {
                    valid = false;
                    error = "Email invalid"
                }
                break;

            case 'password':
                var pattern = /^(?=.*[0-9])(?=.*[A-Z])(?=.*[!@#$%^&])[A-Za-z0-9!@#$%^&*]{5,}$/
                if (pattern.test(value)) {
                    valid = true;
                    error = "";
                }
                else {
                    valid = false;
                    error = "Password invalid"
                }
                break;

        }
        return { valid, error };
    }

    const handleChange = (name, value) => {
        const { valid, error } = validateData(name, value)
        let formvalid = true;
        /*if(info.firstName.valid === true && info.lastName.valid === true && info.email.valid === true && info.password.valid === true && info.confirmpassword.valid === true)
            formvalid = true;*/
        for (const key in user) {
            console.log(key + " : " + user[key].valid)
            if (user[key].valid === false) {
                formvalid = false;
                break;
            }
        }
        console.log(formvalid)
        dispatch({ type: 'update', data: { name, value, touched: true, valid, error, formvalid } })
        // dispatch({ type: 'update', data: { name, value, formvalid } })
    }

    const sendData = (e) => {
        e.preventDefault();
        const reqOptions = {
            method: 'POST',
            headers: { 'content-type': 'application/json' },
            body: JSON.stringify({
                email: user.email.value,
                password: user.password.value
            })
            // email: user.email,
            // password: user.password


        }

        fetch("http://localhost:8080/checkLogin", reqOptions)
            //.then(res => console.log(res))
            //.then(resp => console.log(resp))

            .then(resp => {
                if (resp.ok)
                    return resp.text();
                else
                    throw new Error("Server Error.");

            })
            .then(text => text.length ? JSON.parse(text) : {})
            .then(obj => {
                if (Object.keys(obj).length === 0) {
                    setMsg("Wrong UID/PWD");
                }
                else {
                    if (obj.status === 0) {
                        alert("Request has not been approved");
                        // setMsg("Request has not been approved")
                        navigate('/')
                    }
                    else {
                        localStorage.setItem("loggedUser", JSON.stringify(obj));
                        reducxAction(login());
                        if (obj.type_id.type_id === 1) {
                            //<Link  to="customer_home"/>
                            navigate("/customer_home");
                        }
                        else if (obj.type_id.type_id === 2) {
                            navigate("/florist_home");
                        }
                        else if (obj.type_id.type_id === 3) {
                            navigate("/admin_home");
                        }

                    }
                }
            })
            .catch((error) => alert("Server error. Try after some time"))
    }





    return (
        <div className="container">
            <h3>Login Page</h3>
            <Form action="/checkLogin">
                <Form.Group className="mb-3" controlId="formBasicEmail">
                    <Form.Label>Email address</Form.Label>
                    <Form.Control type="email" name="email" placeholder="Enter email"
                        onChange={(e) => handleChange("email", e.target.value)} />
                    <div className="error-msg"> {user.email.error}</div>

                </Form.Group>

                <Form.Group className="mb-3" controlId="formBasicPassword">
                    <Form.Label>Password</Form.Label>
                    <Form.Control type="password" name="password" placeholder="Password"
                        onChange={(e) => handleChange("password", e.target.value)} />
                    <div className="error-msg"> {user.password.error}</div>
                </Form.Group>

                <button className="btn btn-primary" type="submit" disabled={!user.formvalid} onClick={(e) => { sendData(e) }}>
                    Submit
                </button>
                <span>             </span>
                <button className="btn btn-primary" type="reset" onClick={() => { dispatch({ type: 'reset' }) }} >
                    Reset
                </button>
            </Form>

            {/* <p>{JSON.stringify(user)}</p> */}
            <p>{msg}</p>



        </div>

    )

}

export default LoginFrom;
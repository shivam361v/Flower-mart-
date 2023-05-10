import { useReducer, useState } from "react";
import { useNavigate } from "react-router-dom";

export default function FloristReg() {

    const init = {

        fname: { value: "", touched: false, valid: false, error: "" },
        lname: { value: "", touched: false, valid: false, error: "" },
        email: { value: "", touched: false, valid: false, error: "" },
        password: { value: "", touched: false, valid: false, error: "" },
        confirmpassword: { value: "", touched: false, valid: false, error: "" },
        contact: { value: "", touched: false, valid: false, error: "" },

        shop_name: { value: "", touched: false, valid: false, error: "" },
        line_1: { value: "", touched: false, valid: false, error: "" },
        line_2: { value: "", touched: false, valid: false, error: "" },
        city: { value: "", touched: false, valid: false, error: "" },
        state: { value: "", touched: false, valid: false, error: "" },
        pincode: { value: "", touched: false, valid: false, error: "" },
        formvalid: { value: "", touched: false, valid: false, error: "" }
    }

    const reducer = (state, action) => {
        //console.log(state);
        switch (action.type) {
            case 'update': {
                const { name, value, touched, valid, error,  formvalid } = action.data;
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

    const [info, dispatch] = useReducer(reducer, init);
    const [msg, setMsg] = useState("");
    const navigate = useNavigate();

    const validateData = (name, value) => {
        let valid = false;
        let error = "";
        switch (name) {
            case 'fname':
                var pattern = /^[A-Z][a-z]{2,15}$/
                if (pattern.test(value)) {
                    valid = true;
                    error = "";
                }
                else {
                    valid = false;
                    error = "First name invalid"
                }
                break;
            case 'lname':
                var pattern = /^[A-Z][a-z]{2,15}$/
                if (pattern.test(value)) {
                    valid = true;
                    error = "";
                }
                else {
                    valid = false;
                    error = "Last name invalid"
                }
                break;
            case 'email':
                var pattern = /^[A-Za-z0-9_.-]{3,15}@gmail.com$/
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
            case 'confirmpassword':
                if (info.password.value === value) {
                    valid = true;
                    error = "";
                }
                else {
                    valid = false;
                    error = "Passwords do not match"
                }
                break;
            case 'contact':
                var pattern = /^[0-9]{10}$/
                if (pattern.test(value)) {
                    valid = true;
                    error = "";
                }
                else {
                    valid = false;
                    error = "Contact invalid"
                }
                break;
            case 'shop_name':
                var pattern = /^[A-Za-z0-9\s]{1,50}$/
                if (pattern.test(value)) {
                    valid = true;
                    error = "";
                }
                else {
                    valid = false;
                    error = "shop_name invalid"
                }
                break;
            case 'line_1':
                var pattern = /^[A-Za-z0-9'\.\-\s\,]{1,200}$/
                if (pattern.test(value)) {
                    valid = true;
                    error = "";
                }
                else {
                    valid = false;
                    error = "line_1 invalid"
                }
                break;
            case 'line_2':
                var pattern = /^[A-Za-z0-9'\.\-\s\,]{0,200}$/
                if (pattern.test(value)) {
                    valid = true;
                    error = "";
                }
                else {
                    valid = false;
                    error = "line_2 invalid"
                }
                break;
            case 'city':
                var pattern = /^[A-Za-z0-9]{1,50}$/
                if (pattern.test(value)) {
                    valid = true;
                    error = "";
                }
                else {
                    valid = false;
                    error = "city invalid"
                }
                break;
            case 'state':
                var pattern = /^[A-Za-z0-9]{1,50}$/
                if (pattern.test(value)) {
                    valid = true;
                    error = "";
                }
                else {
                    valid = false;
                    error = "state invalid"
                }
                break;
            case 'pincode':
                var pattern = /^[A-Za-z0-9]{1,50}$/
                if (pattern.test(value)) {
                    valid = true;
                    error = "";
                }
                else {
                    valid = false;
                    error = "pincode invalid"
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
        for (const key in info) {
            console.log(key + " : " + info[key].valid)
            if (info[key].valid === false) {
                formvalid = false;
                break;
            }
        }
        console.log(formvalid)
        dispatch({ type: 'update', data: { name, value, touched: true, valid, error, formvalid } })
        // dispatch({ type: 'update', data: { name, value, formvalid } })
    }

    const onFocusout = (name, value) => {
        const { valid, error } = validateData(name, value)
        let formvalid = true;
        /*if(info.firstName.valid === true && info.lastName.valid === true && info.email.valid === true && info.password.valid === true && info.confirmpassword.valid === true)
            formvalid = true;*/
        for (const key in info) {
            console.log(key + " : " + info[key].valid)
            if (info[key].valid === false) {
                formvalid = false;
                break;
            }
        }
        dispatch({ type: 'update', data: { name, value, touched: true, valid, error, formvalid } })
    }


    const sendData = (e) => {
        e.preventDefault();
        const reqOptions = {
            method: 'POST',
            headers: { 'content-type': 'application/json' },
            // body: JSON.stringify(info)
            body: JSON.stringify({
                fname: info.fname.value,
                lname: info.lname.value,
                email: info.email.value,
                password: info.password.value,
                confirmpassword: info.confirmpassword.value,
                contact: info.contact.value,

                shop_name: info.shop_name.value,
                line_1: info.line_1.value,
                line_2: info.line_2.value,
                city: info.city.value,
                state: info.state.value,
                pincode: info.pincode.value,
                formvalid: info.formvalid.value,

            })

        }

        fetch("http://localhost:8080/saveFlorist", reqOptions)
            //.then(res => console.log(res))
            //.then(resp => console.log(resp))
            // .then(resp => resp.json())
            // .then(obj => console.log(JSON.stringify(obj)))
            .then(resp => {
                if (resp.ok)
                    return resp.text();
                else
                    throw new Error("Server Error.");

            })
            .then(text => text.length ? JSON.parse(text) : {})
            .then(obj => {
                if (Object.keys(obj).length === 0) {
                    setMsg("Somthing Wrong.");
                }
                else {
                    alert('You have registed sucessfully. Just wait for approval.')
                    navigate("/");

                }
            })
            .catch((error) => alert("Server error. Try after some time"))
    }




    return (
        <div className="container">
            <h2>Florist Registration</h2>
            <form>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="inputFname">User Type</label>
                        <input type="text" class="form-control" name="type_id" id="inputFname" value="Florist" />
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="inputFname">First Name</label>
                        <input type="text" class="form-control" name="fname" id="inputFname" placeholder="Fname"
                            onChange={(e) => handleChange("fname", e.target.value)} />
                        <div className="error-msg"> {info.fname.error}</div>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="inputLname">Last Name</label>
                        <input type="text" class="form-control" name="lname" id="inputLname" placeholder="Lname"
                            onChange={(e) => handleChange("lname", e.target.value)} />
                        <div className="error-msg"> {info.lname.error}</div>
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="inputEmail4">Email</label>
                        <input type="email" class="form-control" name="email" id="inputEmail4" placeholder="Email"
                            onChange={(e) => handleChange("email", e.target.value)} />
                        <div className="error-msg"> {info.email.error}</div>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="inputPassword4">Password</label>
                        <input type="password" class="form-control" name="password" id="inputPassword4" placeholder="Password"
                            onChange={(e) => handleChange("password", e.target.value)} />
                        <div className="error-msg"> {info.password.error}</div>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="inputPassword4">Confarm Password</label>
                        <input type="password" class="form-control" name="confirmpassword" id="inputPassword4" placeholder="Password"
                            onChange={(e) => handleChange("confirmpassword", e.target.value)} />
                        <div className="error-msg"> {info.confirmpassword.error}</div>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="inputContact">Contact number</label>
                        <input type="text" class="form-control" name="contact" id="inputContact" placeholder="Contact number"
                            onChange={(e) => handleChange("contact", e.target.value)} />
                        <div className="error-msg"> {info.contact.error}</div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputAddress">Shop Name</label>
                    <input type="text" class="form-control" name="shop_name" id="inputAddress"
                        onChange={(e) => handleChange("shop_name", e.target.value)} />
                </div>
                <div class="form-group">
                    <label for="inputAddress">Address</label>
                    <input type="text" class="form-control" name="line_1" id="inputAddress" placeholder="1234 Main St"
                        onChange={(e) => handleChange("line_1", e.target.value)} />
                    <input type="text" class="form-control" name="line_2" id="inputAddress2" placeholder="Apartment, studio, or floor"
                        onChange={(e) => handleChange("line_2", e.target.value)} />
                </div>

                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="inputCity">City</label>
                        <input type="text" name="city" class="form-control" id="inputCity"
                            onChange={(e) => handleChange("city", e.target.value)} />
                    </div>
                    <div class="form-group col-md-4">
                        <label for="inputCity">State</label>
                        <input type="text" name="state" class="form-control" id="inputCity"
                            onChange={(e) => handleChange("state", e.target.value)} />
                    </div>
                    <div class="form-group col-md-2">
                        <label for="inputZip">Pincode</label>
                        <input type="text" name="pincode" class="form-control" id="inputZip"
                            onChange={(e) => handleChange("pincode", e.target.value)} />
                    </div>
                </div>


                <button type="submit" disabled={!info.formvalid} onClick={(e) => { sendData(e) }}>Create Account</button>
            </form>

            <p>{JSON.stringify(info)}</p>
        </div>
    )
}
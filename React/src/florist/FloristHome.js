import { Link } from "react-router-dom";
import { Button } from "react-bootstrap";
import { useEffect, useReducer, useState } from "react";
import { Form } from "react-bootstrap";
import FloristNavBar from "./FloristNavBar";


export default function FloristHome() {

    const username = JSON.parse(localStorage.getItem("loggedUser"));

    const init = {
        p_name: "",
        //image:"",
        cat_name: "",
        availablity: 0,
        price: "",
        user_id: username.user_id

    }

    const reducer = (state, action) => {
        switch (action.type) {
            case 'update':
                return { ...state, [action.fld]: action.val }
            case 'reset':
                return init;

        }

    }


    useEffect(() => {
        //e.preventDefault();
        //alert("hi");
        fetch("http://localhost:8080/allProductCategory")
            .then(res => res.json())
            .then(data => setData(data),


            )
    }, []);

    const [data, setData] = useState([])
    const [info, dispatch] = useReducer(reducer, init);
    const [file, setFile] = useState();
    const [msg, setMsg] = useState(".....");
    //const navigate=useNavigate();
    //const reduxAction=useDispatch();

    const sendData = (e) => {
        e.preventDefault();
        const reqOptions = {
            method: 'POST',
            headers: { 'content-type': 'application/json' },
            body: JSON.stringify(info)
        }
        fetch("http://localhost:8080/floristDetail", reqOptions)
            .then(resp => {
                if (resp.ok) {

                    return resp.json();
                }
                else {
                    console.log(resp);
                    throw new Error("server error");
                }

            })
            //.then(text=>text.length?JSON.parse(text):{})
            .then(obj => {
                console.log(obj.product_id);
                const fd = new FormData();
                fd.append("file", file);
                const reqOptions1 = {
                    method: 'POST',
                    //headers:{'content-type':'multipart/form-data'},
                    body: fd
                }
                fetch("http://localhost:8080/uploadImage/" + obj.product_id, reqOptions1)
                    .then(resp => resp.json())
                    .then(obj => {
                        if (obj) {
                            alert("uploded")
                        }
                        else {
                            alert("max size is 200kb and extention jpg")
                        }
                    })


                alert('You have registed sucessfully. Just wait for approval.')


            })
            .catch((error) => alert("Server error. Try after some time"))

    }
    return (
        <div>
            <FloristNavBar />

            <div className="container">
                <h2>Add Flowers</h2>
                <Form action="/checkLogin">
                    <Form.Group className="mb-3" controlId="formBasicProductName">
                        <Form.Label>Product name</Form.Label>
                        <Form.Control type="text" name="p_name" placeholder="Enter Product name" value={info.p_name}
                            onChange={(e) => { dispatch({ type: 'update', fld: 'p_name', val: e.target.value }) }} />

                    </Form.Group>

                    <Form.Group className="mb-3" controlId="formBasicProductName">
                        <Form.Label>Upload Photo</Form.Label>
                        <Form.Control type="file" name="image" placeholder="Upload Photo..."
                            onChange={(e) => setFile(e.target.files[0])} />

                    </Form.Group>

                    {/* <Form.Group className="mb-3" controlId="formBasicCategoryName">
                        <Form.Label>Category</Form.Label>
                        <Form.Control type="text" name="cat_name" placeholder="Enter Category name" value={info.cat_name}
                        onChange={(e) => { dispatch({ type: 'update', fld: 'cat_name', val: e.target.value }) }}
                             />

                        <select class="form-select mb-3" aria-label="Default select example">
                            <option selected>Select Category</option>
                            {
                                data.map(v => {
                                    return (
                                        <option name="cat_name" value={v.cat_name} onChange={(e) => { dispatch({ type: 'update', fld: 'cat_name', val: e.target.value }) }}
                                        >{v.cat_name}</option>

                                    )
                                })
                            }
                           
                        </select>
                    </Form.Group> */}
                    <Form.Group className="mb-3" controlId="formBasicCategoryName">
                    <label>
                        Category:
                        <select class="form-select mb-3" aria-label="Default select example" name="cat_name" value={info.cat_name}
                        onChange={(e) => { dispatch({ type: 'update', fld: 'cat_name', val: e.target.value }) }} >
                            <option value="">please select</option>
                            {
                                data.map(v => {
                                    return (

                                        <option value={v.cat_name}  >{v.cat_name}</option>
                                        // <option value="orange">Orange</option>
                                    )
                                })}
                        </select>
                    </label>
                    </Form.Group>

                    <Form.Group className="mb-3" controlId="formBasicAvailablity">
                        <Form.Label>Availablity</Form.Label>
                        <Form.Control type="number" name="availablity" placeholder="Enter Availablity" value={info.availablity}
                            onChange={(e) => { dispatch({ type: 'update', fld: 'availablity', val: e.target.value }) }} />
                    </Form.Group>

                    <Form.Group className="mb-3" controlId="formBasicPrice">
                        <Form.Label>Price</Form.Label>
                        <Form.Control type="number" name="price" placeholder="Enter Price" value={info.price}
                            onChange={(e) => { dispatch({ type: 'update', fld: 'price', val: e.target.value }) }} />
                    </Form.Group>

                    <Button variant="primary" type="submit" onClick={(e) => { sendData(e) }}>
                        Submit
                    </Button>
                    <Button variant="primary" type="reset" onClick={() => { dispatch({ type: 'reset' }) }} >
                        Clear
                    </Button>
                </Form>

            </div>
            <p>{JSON.stringify(info)}</p>
            <p>{msg}</p>
        </div>
    )
    /*
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
    */
}
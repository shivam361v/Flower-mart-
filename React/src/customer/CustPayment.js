
import { useEffect, useReducer, useState } from "react";
import { useNavigate } from "react-router-dom";
import CustomerNavBar from "./CustomerNavBar";

function CustPayment() {

    const username = JSON.parse(localStorage.getItem("loggedUser"));
    const total = JSON.parse(localStorage.getItem("CartTotal"));
    const [payment_mode, setPaymentMode] = useState();
    const [data, setData] = useState();
    const [payment_type, setPaymentType] = useState();
    const [customer_order, setCustomerOrder] = useState();
    const navigate = useNavigate();

    // useEffect(() => {
    //     fetch("http://localhost:8080/getCartByUser?user_id=" + username.user_id)
    //         .then(res => res.json())
    //         .then(data => setData(data),

    //         )
    // });

    const init = {
        user: username,
        order_date: new Date(),
        total_amount: total,
        payment_mode: payment_mode,
        delivery_status: "on the way",
        address_id: username.add_id
    }

    // const reducer = (state, action) => {
    //     switch (action.type) {
    //         case 'update':
    //             return { ...state, [action.fld]: action.val }
    //         case 'reset':
    //             return init;
    //     }
    // }

    // const [info, dispatch] = useReducer(reducer, init);

    const handleChange = (e) => {
        alert(payment_mode);

        // // e.preventDefault();
        // const reqOptions = {
        //     method: 'POST',
        //     headers: { 'content-type': 'application/json' },
        //     body: JSON.stringify(e)
        //     // body: JSON.stringify( {
        //     //     user:info.user,
        //     //     order_date:info.order_date,
        //     //     total_amount:info.total_amount,

        //     // })
        // }

        fetch("http://localhost:8080/savePaymentDetails?payment_type=" + payment_mode)
            .then(res => res.json())
            .then(obj1 => {
                // setPaymentType(obj);
                alert("saved payment details");

                // fetch("http://localhost:8080/customerOrder?user_id=" + username.user_id + "&total=" + total + "&payment_id=" + payment_type.payment_id)
                fetch("http://localhost:8080/customerOrder?user_id=" + username.user_id + "&total=" + total + "&payment_id=" + obj1.payment_id)
                    .then(res => res.json())
                    .then(obj2 => {
                        // setCustomerOrder(obj);
                        alert("in customer order");

                        // fetch("http://localhost:8080/addOrderDetails?user_id=" + username.user_id + "&customer_order_id=" + customer_order.order_id)
                        fetch("http://localhost:8080/addOrderDetails?user_id=" + username.user_id + "&customer_order_id=" + obj2.order_id)
                            .then(res => res.json())
                            .then(obj3 => {

                                if (obj3 != null) {
                                    alert("Transaction Sucessful");

                                    fetch("http://localhost:8080/deleteCartDetails?user_id=" + username.user_id)
                                        .then(res => res.json())
                                        .then(obj4 => {
                                            alert("Cart updated");
                                            navigate("/customer_home");
                                        })

                                }
                                else {
                                    alert("Transaction Failed");
                                }

                            })

                    })

            }
            )







        /*
        fetch("http://localhost:8080/customerOrder" + reqOptions)
            .then(res => res.json())
            .then(obj => {

                if (obj) {
                    alert("Payment Completed")
                }
                else {
                    alert("Payment Failed")
                }

            })
*/

    }

    return (
        <div>
            <CustomerNavBar />
            <div class="container p-0">
                <div class="card px-4">
                    <p class="h8 py-3">Payment Details</p>
                    <div class="row gx-3">
                        <div class="col-12">
                            <div class="d-flex flex-column">
                                <p class="text mb-1">Person Name</p>
                                <input class="form-control mb-3" type="text" placeholder="Name" value={username.fname + " " + username.lname} />
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="d-flex flex-column">
                                <label>
                                    Payment Mode:
                                    <select className="form-select" onChange={(e) => setPaymentMode(e.target.value)} name="payment_mode">
                                        <option value="...">Please select</option>
                                        <option value="debit card">Debit Card</option>
                                        <option value="UPI">UPI</option>
                                        <option value="cash on delivery">Cash On Delivery</option>
                                    </select>
                                </label></div>
                        </div>
                        {/* <div class="col-12">
                            <div class="d-flex flex-column">
                                <p class="text mb-1">Card Number</p>
                                <input class="form-control mb-3" type="text" placeholder="1234 5678 4356" />
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="d-flex flex-column">
                                <p class="text mb-1">Expiry</p>
                                <input class="form-control mb-3" type="text" placeholder="MM/YYYY" />
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="d-flex flex-column">
                                <p class="text mb-1">CVV/CVC</p>
                                <input class="form-control mb-3 pt-2 " type="password" placeholder="***" />
                            </div>
                        </div> */}
                        <div>
                            <br />
                            <br />
                        </div>

                        <div class="col-12">
                            <div class="btn btn-success mb-3">
                                <a href="#" onClick={() => { return handleChange(init) }} >Pay Rs.{total}</a>
                                <span class="fas fa-arrow-right"></span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    )
}

export default CustPayment;
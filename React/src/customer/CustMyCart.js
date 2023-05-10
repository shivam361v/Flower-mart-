import { useEffect, useState } from "react";
import { Navigate, useNavigate } from "react-router-dom";
import CustomerNavBar from "./CustomerNavBar";

function CustMyCart() {

    const [data, setData] = useState([]);
    const [sum, setSum] = useState([]);
    var sum1 = 0;
    const username = JSON.parse(localStorage.getItem("loggedUser"));

    useEffect(() => {

        fetch("http://localhost:8080/allCartDetailsByUser?user_id="+username.user_id)
            .then(res => res.json())
            .then(data => setData(data),

            )
    }, []);

   
    
    const handleChange = (e) => {
        
        alert(sum1+ " Rs");
        
        fetch("http://localhost:8080/updateTotalAmount?user_id=" + username.user_id + "&total=" + sum1)
            .then(res => res.json())
            .then(obj => {
                console.log(obj + " updated")
            })

        navigate("/custPayment");
    }

    const navigate = useNavigate();
    return (
        <div>
            <CustomerNavBar />
            <h3>MyCart</h3>
            <table className="table table-striped" >
                <tr>
                    <th className="text-center">Id</th>
                    <th className="text-center">Product Name</th>
                    <th className="text-center">Category Name</th>
                    <th className="text-center">Quantity</th>
                    <th className="text-center">Price</th>
                    <th className="text-center">Total</th>
                </tr>

                { // here slice used for limited data
                    data.map(v => {
                        { sum1 = sum1 + v.product_quantity * v.product_rate }
                        return (
                            <tr>
                                <td className="text-center">{v.product_id.product_id}</td>
                                <td className="text-center">{v.product_id.p_name}</td>
                                <td className="text-center">{v.cart_id.cart_id}</td>
                                <td className="text-center">{v.product_quantity}</td>
                                <td className="text-center">{v.product_rate} Rs</td>
                                <td className="text-center">{v.product_quantity * v.product_rate} Rs</td>
                            </tr>
                        )
                    })
                }

            </table>
            <p>{sum1}</p>
            {localStorage.setItem("CartTotal",(sum1))}
            <a className="btn" onClick={() => { setSum(sum1); return handleChange() }} >Confirm Payment</a>
        </div>
    )
}

export default CustMyCart;
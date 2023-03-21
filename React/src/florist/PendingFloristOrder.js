import { useEffect, useState } from "react";
import { useNavigate } from "react-router-dom";
import FloristNavBar from "./FloristNavBar";


export default function PendingFloristOrder() {

    const username = JSON.parse(localStorage.getItem("loggedUser"));

    useEffect(() => {

        fetch("http://localhost:8080/allOrderDetails")
            .then(res => res.json())
            .then(data => setData(data))

    }, []);

    const [data, setData] = useState([]);
    const navigate = useNavigate();


    const handleChange = (e) => {
        alert("status changed of " + e);

        fetch("http://localhost:8080/updateDeliveryStatus?delivery_status=2&order_id=" + e)
            .then(res => res.json())
            .then(obj => {
                if (obj) {
                    alert("Status Updated to Order Deliverd.");
                    navigate("/pendingorders");
                }
                else {
                    alert("Some Error.")
                }
            })
    }
    // const handleChange1 = (e) => {

    //     alert(e + " order_id")

    //     // alert("hello prathmesh")


    //     localStorage.setItem("order_id",(e));
    //     navigate("/OrderDetails")

    //   }



    return (
        <div>
            <FloristNavBar />
            <table className="table table-striped" >
                
                    <tr>

                        <th className="text-center">User Name</th>

                        <th className="text-center">Order Date</th>
                        <th className="text-center">Product Quantity</th>
                        <th className="text-center">Product Rate</th>

                        <th className="text-center">Total Amount</th>
                        <th className="text-center">Address</th>
                        <th className="text-center">Update Status</th>

                    </tr>
                


                { // here slice used for limited data
                    data.map(v => {
                        if (v.product_id.florist_id.user_id.user_id === username.user_id & v.order_id.delivery_status === 1) {
                            return (
                                <tr>


                                    <td className="text-center">{v.order_id.user_id.fname} {v.order_id.user_id.lname}</td>
                                    <td className="text-center">{v.order_id.order_date}</td>
                                    <td className="text-center">{v.product_quantity}</td>
                                    <td className="text-center">{v.product_rate}</td>
                                    <td className="text-center">{v.product_amount}</td>
                                    <td className="text-center">{v.order_id.user_id.add_id.line_1} {v.order_id.user_id.add_id.line_2} {v.order_id.user_id.add_id.city} {v.order_id.user_id.add_id.pincode}</td>
                                    <td className="text-center"><a className="btn" onClick={() => { return handleChange(v.order_id.order_id) }} >Delivered</a></td>

                                </tr>
                            )
                        }
                    })
                }

            </table>
        </div>
    )
}
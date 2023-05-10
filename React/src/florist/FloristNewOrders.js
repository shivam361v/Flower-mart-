import { useEffect, useState } from "react";
import { useNavigate } from "react-router-dom";
import FloristNavBar from "./FloristNavBar";

export default function FloristNewOrder() {

    const username = JSON.parse(localStorage.getItem("loggedUser"));

    useEffect(() => {

        fetch("http://localhost:8080/allOrderDetails")
            .then(res => res.json())
            .then(data => setData(data))

    }, []);

    const [data, setData] = useState([]);
    const navigate = useNavigate();

    // const handleChange = (e) => {
    //     alert("status changed to " + e);

    //     fetch("http://localhost:8080/updateDeliveryStatus?delivery_status=1&order_id="+e)
    //         .then(res => res.json())
    //         .then(obj => {
    //             if(obj)
    //             {
    //                 alert("Order Accepted. On the way.")
    //             }
    //             else{
    //                 alert("Some Error.")
    //             }
    //         })
    // }

    const handleChange1 = (e) => {
    
        alert(e)
       
    
        alert("move to ")
        
    
    
    
        localStorage.setItem("new_order_id",(e));
        navigate("/acceptFloristOrder")
    
      }

      var arr;
    return (
        
        <div>
          <FloristNavBar/>
            <table className="table table-striped" >
                <tr>

                    <th className="text-center">User Name</th>

                    <th className="text-center">Order Date</th>
                    <th className="text-center">Total Amount</th>
                    <th className="text-center">Address</th>
                    <th className="text-center">Update Status</th>

                </tr>


                { // here slice used for limited data
                    
                    data.map(v => {
                        if (v.product_id.florist_id.user_id.user_id === username.user_id & v.order_id.delivery_status === 0) {
                            return (
                                <tr>


                                    <td className="text-center">{v.order_id.user_id.fname} {v.order_id.user_id.lname}</td>
                                    <td className="text-center">{v.order_id.order_date}</td>
                                    <td className="text-center">{v.product_quantity}</td>
                                    <td className="text-center">{v.product_rate}</td>
                                    <td className="text-center">{v.product_amount}</td>
                                    <td className="text-center">{v.order_id.user_id.add_id.line_1} {v.order_id.user_id.add_id.line_2} {v.order_id.user_id.add_id.city} {v.order_id.user_id.add_id.pincode}</td>
                                    <td className="text-center"><a className="btn" onClick={() => { return handleChange1(v.order_id.order_id) }} >Related Orders</a></td>

                                </tr>
                            )
                        }
                    })
                }

            </table>
        </div>
    )
}
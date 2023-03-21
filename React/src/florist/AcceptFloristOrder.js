import { useEffect, useState } from "react";
import { useNavigate } from "react-router-dom";
import FloristNavBar from "./FloristNavBar";

export default function AcceptFloristOrder(){

    const orderId   = JSON.parse(localStorage.getItem("new_order_id"));

    useEffect(() => {
        alert(orderId + " passed")

        fetch("http://localhost:8080/customerOrderByOrderId?order_id="+orderId)
            .then(res => res.json())
            .then(data => setData(data))

    },[]);

    const [data1, setData] = useState([]);
    const navigate = useNavigate();

    const handleChange = (e) => {
        alert("status changed to " + e);

        fetch("http://localhost:8080/updateDeliveryStatus?delivery_status=1&order_id="+e)
            .then(res => res.json())
            .then(obj => {
                if(obj)
                {
                    // alert("Order Accepted. On the way.")

                    navigate("/pending_orders");

                }
                else{
                    alert("Some Error.")
                }
            })
    }

    return(
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


                    {data1.map((v)=>{

                         return(

                            <tr>


                            <td className="text-center">{v.user_id.fname} {v.user_id.lname}</td>
                           <td className="text-center">{v.order_date}</td>
                    
                           <td className="text-center">{v.total_amount}</td>
                           <td className="text-center">{v.user_id.add_id.line_1} {v.user_id.add_id.line_2} {v.user_id.add_id.city} {v.user_id.add_id.pincode}</td>
                           <td className="text-center"><a className="btn" onClick={() => { return handleChange(v.order_id) }} >Accept Order</a></td> 
  
                       </tr>
                         )
                 
                    })}
                   
                   
                              
                

            </table>
        </div>
    )
}
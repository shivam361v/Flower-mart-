import CustomerNavBar from "./CustomerNavBar";
import { useEffect, useState } from "react";


export default function OrderDetailsC(){

    const order_id = JSON.parse(localStorage.getItem("order_id"));
    
    useEffect(() => {
        //e.preventDefault();
        
        alert(order_id);
        fetch("http://localhost:8080/allOrderDetailsByOrderIdy?order_id=" + order_id)
            .then(res => res.json())
            .then(data => setData(data))

    }, []);
    const [data,setData]=useState([]);

    return(
        <div>
            <CustomerNavBar/>
           <table className="table table-striped" >
                
                <tr>

                    <th className="text-center">User Name</th>

                    <th className="text-center">Order Date</th>
                    <th className="text-center">Product Quantity</th>
                    <th className="text-center">Product Rate</th>

                    <th className="text-center">Total Amount</th>
                    
                    

                </tr>
            


            { // here slice used for limited data
                data.map(v => {
                    
                        return (
                            <tr>


                                <td className="text-center">{v.order_id.user_id.fname} {v.order_id.user_id.lname}</td>
                                <td className="text-center">{v.order_id.order_date}</td>
                                <td className="text-center">{v.product_quantity}</td>
                                <td className="text-center">{v.product_rate}</td>
                                <td className="text-center">{v.product_amount}</td>
                               
                            </tr>
                        )
                    
                })
            }

        </table>
        </div>
        )
}
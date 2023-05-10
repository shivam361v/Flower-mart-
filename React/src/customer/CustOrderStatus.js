import CustomerNavBar from "./CustomerNavBar";
import { useEffect, useState } from "react";
import { useNavigate } from "react-router-dom";
import { Link } from "react-router-dom";

export default function CustOrderStatus() {

    const username = JSON.parse(localStorage.getItem("loggedUser"));

    useEffect(() => {

        fetch("http://localhost:8080/allCustomerOrderByUser_id?user_id="+username.user_id)
            .then(res => res.json())
            .then(data => setData(data))

    }, []);

    const [data, setData] = useState([]);
    const navigate = useNavigate();
    const handleChange1 = (e) => {
    
        alert(e)
       
    
        // alert("hello prathmesh")
        
    
    
    
        localStorage.setItem("order_id",(e));
        navigate("/OrderDetails")
    
      }


    return (
        <div>
            <CustomerNavBar/>
            <table className="table table-striped" >
                <tr>

                    <th className="text-center">User Name</th>
                    <th className="text-center">Order Date</th>
                    <th className="text-center">Total Amount</th>
                    <th className="text-center">Address</th>
                    <th className="text-center">OrderDetails</th>
                    <th className="text-center">Delivery Status</th>
                    
                </tr>


                { // here slice used for limited data
                    data.map(v => {
                        if (v.delivery_status === 0) {
                            return (
                                <tr>

                                    <td className="text-center">{v.user_id.fname} {v.user_id.lname}</td>
                                    <td className="text-center">{v.order_date}</td>
                                    <td className="text-center">{v.total_amount}</td>
                                    <td className="text-center">{v.address_id.line_1} {v.address_id.line_2} {v.address_id.city} {v.address_id.pincode}</td>
                                    <td className="text-center"><Link className='nav-link' value={v.cat_id} to="/custProdByCat"
                                     onMouseDown={() => { return handleChange1(v.order_id) }}   >Order_Details</Link></td>
                                    <td className="text-center">
                                        Not Accepted Yet
                                     </td>
                                
                                </tr>
                            )
                        }
                            else if (v.delivery_status === 1) {
                                return (
                                    <tr>
    
                                        <td className="text-center">{v.user_id.fname} {v.user_id.lname}</td>
                                        <td className="text-center">{v.order_date}</td>
                                        <td className="text-center">{v.total_amount}</td>
                                        <td className="text-center">{v.address_id.line_1} {v.address_id.line_2} {v.address_id.city} {v.address_id.pincode}</td>
                                        <td className="text-center"><Link className='nav-link' value={v.cat_id} to="/custProdByCat"
                                     onMouseDown={() => { return handleChange1(v.order_id) }}   >Order_Details</Link></td>
                                        <td className="text-center">
                                            Accepted On the way
                                         </td>
                                    
                                    </tr>
                                )
                           
                        }
                        else  {
                            return (
                                <tr>

                                    <td className="text-center">{v.user_id.fname} {v.user_id.lname}</td>
                                    <td className="text-center">{v.order_date}</td>
                                    <td className="text-center">{v.total_amount}</td>
                                    <td className="text-center">{v.address_id.line_1} {v.address_id.line_2} {v.address_id.city} {v.address_id.pincode}</td>
                                    <td className="text-center"><Link className='nav-link' value={v.cat_id} to="/custProdByCat"
                                     onMouseDown={() => { return handleChange1(v.order_id) }}   >Order_Details</Link></td>
                                    <td className="text-center">
                                       Delivered
                                     </td>
                                
                                </tr>
                            )
                       
                    }
                    })
                }

            </table>
        </div>
    )
}
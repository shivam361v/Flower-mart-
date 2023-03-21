import { useEffect, useState } from "react";



export default function OrderDetailsF(){

    const order_id = JSON.parse(localStorage.getItem("order_id"));
    useEffect(() => {
        //e.preventDefault();
        
        // alert("Category "+cat)
        fetch("http://localhost:8080/allOrderDetails?order_id=" + order_id)
            .then(res => res.json())
            .then(data => setData(data))

    }, []);

    const [data, setData] = useState([]);

    return(
        <div>

        </div>
        )
}
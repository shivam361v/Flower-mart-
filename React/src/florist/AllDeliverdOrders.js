

export default function AllDeliverdOrders() {

    const username = JSON.parse(localStorage.getItem("loggedUser"));

    useEffect(() => {

        fetch("http://localhost:8080/allCustomerOrder?delivery_status=2")
            .then(res => res.json())
            .then(data => setData(data))

    }, []);

    const [data, setData] = useState([]);



    return (
        <div>
            <table className="table table-striped" >
                <tr>

                    <th className="text-center">User Name</th>
                    <th className="text-center">Order Date</th>
                    <th className="text-center">Total Amount</th>
                    <th className="text-center">Address</th>
                    
                </tr>


                { // here slice used for limited data
                    data.map(v => {
                        if (v.product_id.florist_id.user_id.user_id === username.user_id) {
                            return (
                                <tr>


                                    <td className="text-center">{v.user_id.fname} {v.user_id.lname}</td>
                                    <td className="text-center">{v.order_date}</td>
                                    <td className="text-center">{v.total_amount}</td>
                                    <td className="text-center">{v.address_id.line_1} {v.address_id.line_2} {v.address_id.city} {v.address_id.pincode}</td>
                                    


                                </tr>
                            )
                        }
                    })
                }

            </table>
        </div>
    )
}
import Home from "../components/Home";
import CustomerNavBar from "./CustomerNavBar";

function CustomerHome()
{
    return (
        <div>
            <CustomerNavBar />
            <h3>Customer Home</h3>
            <Home/>
        </div>
    )
}

export default CustomerHome;
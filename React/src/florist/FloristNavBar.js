import { Link } from "react-router-dom";

export default  function FloristNavBar(){

  const username = JSON.parse(localStorage.getItem("loggedUser"));

    return(
        <div>
             <nav className="navbar navbar-expand-lg navbar-light bg-secondary mb-3">
         <div className="container-fluid">
          <ul className="navbar-nav">
            <li className="nav-item">
              <Link to="/florist_home" className="nav-link px-3">Home</Link>
            </li>
            <li className="nav-item">
              <Link to="/allflowers" className="nav-link px-3">All Flowers</Link>
            </li>
            <li className="nav-item">
              <Link to="/manageStock" className="nav-link px-3">Manage Stock</Link>
            </li>
            <li className="nav-item">
              <Link to="/floristNewOrder" className="nav-link px-3">New Orders</Link>
            </li>
            <li className="nav-item">
              <Link to="/pending_orders" className="nav-link px-3">Pending Orders</Link>
            </li>
            <li className="nav-item">
              <Link to="/logout" className="nav-link px-3">Logout</Link>
            </li>
          </ul>
          <span><b>Welcome {username.fname}</b></span>
         </div>
  
      </nav>
        </div>
    )
}
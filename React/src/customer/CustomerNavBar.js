import { useEffect, useState } from "react";
import { Nav, NavDropdown } from "react-bootstrap";
import { Link, Route, Routes, useNavigate } from "react-router-dom";
import CustMyCart from "./CustMyCart";
import CustomerHome from "./CustomerHome";


export default function CustomerNavBar() {



  useEffect(() => {
    //e.preventDefault();
    //alert("hi");
    fetch("http://localhost:8080/allProductCategory")
      .then(res => res.json())
      .then(data => setData(data),


      )
  }, []);

  const [data, setData] = useState([])
  const username = JSON.parse(localStorage.getItem("loggedUser"));
  // const [cat_id, dispatch] = useReducer(reducer, init);


  const [catId, setCat_id] = useState();

  const handleChange = (e) => {
    
    alert(e)
   

    alert("hello prathmesh")
    // fetch("http://localhost:8080/getProductsByCatId?cat_id=" + e)
    //   .then(res => res.json())
    //   .then(obj => {
    //     localStorage.setItem("catProd", JSON.stringify(obj))

    //     console.log(obj)
    //   })



    localStorage.setItem("SortCategory",(e));
    navigate("/custProdByCat")

  }

  
  const navigate = useNavigate();

  return (
    <div>
      {/* <nav className="navbar navbar-expand-lg navbar-light bg-light mb-3"> */}
      <nav className="navbar navbar-expand-sm bg-secondary navbar-dark">
        <div className="container-fluid">
          <ul className="navbar-nav">
            <li className="nav-item">
              <Link to="/customer_home" className="nav-link text-light px-3">Home</Link>
            </li>

            <Nav>
              <NavDropdown className="justify-content-end text-light" title="Category" id="basic-nav-dropdown">
                {
                  data.map(v => {
                    return (
                      <NavDropdown.Item href="#action/3.1"><Link className='nav-link' value={v.cat_id} to="/custProdByCat"
                        onMouseDown={() => { return handleChange(v.cat_id) }}   >{v.cat_name}</Link></NavDropdown.Item>

                    )
                  })

                }


              </NavDropdown>
            </Nav>

            <li className="nav-item">
              <Link to="/custMyCart" className="nav-link text-light px-3">My Cart</Link>
            </li>
            <li className="nav-item">
              <Link to="/allOrder" className="nav-link text-light px-3">My Orders</Link>
            </li>
            <li className="nav-item">
              <Link to="/logout" className="nav-link text-light px-3">Logout</Link>
            </li>
          </ul>
          <span><b>Welcome {username.fname}</b></span>
        </div>

      </nav>
      

      {console.log(data)}
      
      {/* <CustomerHome/> */}

{/* 
      <Routes>
        <Route path="custMyCart" element={<CustMyCart />} />
      </Routes> */}
    </div>
  )
}
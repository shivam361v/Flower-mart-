import Container from 'react-bootstrap/Container';
import Nav from 'react-bootstrap/Nav';
import Navbar from 'react-bootstrap/Navbar';
import NavDropdown from 'react-bootstrap/NavDropdown';
import { Link, Route, Routes } from 'react-router-dom';
import { useSelector } from 'react-redux';

import LoginFrom from './LoginForm';
import Home from './Home';
import CustomerReg from '../customer/CustomerReg';
import FloristReg from '../florist/FloristRegistration';
import HomeComp from './HomeComp';
import CustomerNavBar from '../customer/CustomerNavBar';

// import FloristNavbar from '../florist/FloristNevbar';
import CustProdByCategory from '../customer/CustProdByCategory';
import CustMyCart from '../customer/CustMyCart';
import CustomerHome from '../customer/CustomerHome';
import CustPayment from '../customer/CustPayment';
import FloristHome from '../florist/FloristHome';
import Logout from './Logout';

import AdminHome from '../admin/AdminHome';
import AllFlowers from '../florist/AllFlowers';
import ApprovalPage from '../admin/ApprovalPage';
import ManageStock from '../florist/ManageStock';
import AdminAllFlorist from '../admin/AdminAllFlorist';
import FloristNavBar from '../florist/FloristNavBar';
import OrderDetailsF from '../florist/OrderDetailsF';
import FloristOrder from '../florist/FloristNewOrders';
import AcceptFloristOrder from '../florist/AcceptFloristOrder';
import FloristNewOrder from '../florist/FloristNewOrders';
import PendingFloristOrder from '../florist/PendingFloristOrder';
import CustOrderStatus from '../customer/CustOrderStatus';
import OrderDetailsC from '../customer/OrderDetailsC';


function NavBar1() {

  //initial state of logged
  const mystate = useSelector((state) => state.logged);//it is allowing me to select from store

  return (
    <div>
      <div style={{ display: mystate.loggedIn ? "none" : "block" }}>

        <Navbar bg="info" expand="lg">
          <Container>
            <Navbar.Brand href="#home">Flower Mart</Navbar.Brand>
            <Navbar.Toggle aria-controls="basic-navbar-nav" />
            <Navbar.Collapse id="basic-navbar-nav">
              <Nav className="me-auto">
                <Link className='nav-link' to="home">Home</Link>
                <Link className='nav-link' to="login" >Login</Link>
                <Nav>
                  <NavDropdown className="justify-content-end" title="Register" id="basic-nav-dropdown">
                    <NavDropdown.Item href="#action/3.1"><Link className='nav-link' to="cust_reg" >Customer Registration</Link></NavDropdown.Item>
                    <NavDropdown.Divider />
                    <NavDropdown.Item href="#action/3.2"><Link className='nav-link' to="florist_reg" >Florist Registration</Link></NavDropdown.Item>

                  </NavDropdown>
                </Nav>

              </Nav>
            </Navbar.Collapse>
          </Container>
        </Navbar>
      </div>

      <Routes>
        <Route path="login" element={<LoginFrom />} />
        <Route path="home" element={<Home />} />
        <Route path="customer_home" element={<CustomerHome />} />
        <Route path="admin_home" element={<AdminHome/>} />

        <Route path="florist_home" element={<FloristHome />} />
        <Route path="cust_reg" element={<CustomerReg />} />
        <Route path="florist_reg" element={<FloristReg />} />
        <Route path="floristnevbar" element={<FloristNavBar />} />
        <Route path="/" element={<HomeComp />} />
        <Route path="custProdByCat" element={<CustProdByCategory />} />
        <Route path="custMyCart" element={<CustMyCart />} />
        <Route path="custPayment" element={<CustPayment />} />


        <Route path="/florist_home" element={<FloristHome/>} />
        <Route path="/admin_home" element={<AdminHome/>} />
        <Route path="/customer_home" element={<CustomerNavBar/>} />
        <Route path="/florist_reg" element={<FloristReg/>} />
        <Route path="/cust_reg" element={<CustomerReg/>} />
        <Route path="/" element={<HomeComp/>} />
        <Route path="/floristhome" element={<FloristHome/>} />
        
        <Route path="/allflowers" element={<AllFlowers/>} />
        <Route path="/approval" element={<ApprovalPage/>} />
        <Route path="/manageStock" element={<ManageStock/>} />
        <Route path="/adminhome" element={<AdminHome/>} />
        
        <Route path="/allflorist" element={<AdminAllFlorist/>} />
        <Route path="/logout" element={<Logout/>} />
        
        <Route path="/acceptFloristOrder" element={<AcceptFloristOrder/>} />
        <Route path="/floristNewOrder" element={<FloristNewOrder/>} />
        <Route path="/pending_orders" element={<PendingFloristOrder/>} />
        <Route path="/pendingorders" element={<PendingFloristOrder/>} />
        
        <Route path="/allOrder" element={<CustOrderStatus/>} />
        
        <Route path="/OrderDetails" element={<OrderDetailsC/>} />
      </Routes>
      
    </div>
  );
}

export default NavBar1;
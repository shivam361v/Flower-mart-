import Container from 'react-bootstrap/Container';
import Nav from 'react-bootstrap/Nav';
import Navbar from 'react-bootstrap/Navbar';
import NavDropdown from 'react-bootstrap/NavDropdown';
import { Link, Route, Routes } from 'react-router-dom';
import LoginFrom from './LoginForm';
import Home from './Home';
import CustomerHome from './CustomerHome';
import AdminHome from './AdminHome';
import FloristHome from './FloristHome';
import CustomerReg from './CustomerReg';

function NavBar1() {
  return (
    <div>
      
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
              <NavDropdown.Item href="#action/3.1"><Link className='nav-link' to="cust_reg" >Customer</Link></NavDropdown.Item>
              <NavDropdown.Divider />
              <NavDropdown.Item href="#action/3.2">Florist</NavDropdown.Item>
              
            </NavDropdown>
            </Nav>

          </Nav>
        </Navbar.Collapse>
      </Container>
    </Navbar>

      <Routes>
        <Route path="login" element={<LoginFrom/>} />
        <Route path="home" element={<Home/>} />
        <Route path="customer_home" element={<CustomerHome/>} />
                <Route path="admin_home" element={<AdminHome/>} />
                
                <Route path="florist_home" element={<FloristHome/>} />
                <Route path="cust_reg" element={<CustomerReg/>} />
      </Routes>
    </div>
  );
}

export default NavBar1;
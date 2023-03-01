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

function NavBar2() {
  return (
    <div>
      
    <Navbar bg="info" expand="lg">
      <Container>
        <Navbar.Brand href="#home">Flower Mart</Navbar.Brand>
        <Navbar.Toggle aria-controls="basic-navbar-nav" />
        <Navbar.Collapse id="basic-navbar-nav">
          <Nav className="me-auto">
            <Link className='nav-link' to="home">Home</Link>
            <Link className='nav-link' to="login" >Logout</Link>
            

          </Nav>
        </Navbar.Collapse>
      </Container>
    </Navbar>

      
    </div>
  );
}

export default NavBar2;
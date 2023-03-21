import { Link } from "react-router-dom";

export default function AdminNavBar() {

  const username = JSON.parse(localStorage.getItem("loggedUser"));

  return (
    <div>
      <nav className="navbar navbar-expand-lg navbar-light bg-secondary mb-3">
        <div className="container-fluid">
          <ul className="navbar-nav">
            <li className="nav-item">
              <Link to="/adminhome" className="nav-link px-3">Home</Link>
            </li>
            <li className="nav-item">
              <Link to="/approval" className="nav-link px-3">Approval Page</Link>
            </li>
            {/* <li className="nav-item">
              <Link to="/" className="nav-link px-3">All Feedback</Link>
            </li> */}
            <li className="nav-item">
              <Link to="/allflorist" className="nav-link px-3">All Florist</Link>
            </li>
            <li className="nav-item">
              <Link to="/logout" className="nav-link px-3">Logout</Link>
            </li>
            
          </ul>
          <span><b>Welcome {username.fname}</b></span>
        </div>

      </nav >
    </ div>

  )
}
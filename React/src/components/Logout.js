import { useNavigate } from "react-router-dom";
import { useDispatch } from "react-redux";
import { logout } from "./slice";

export default function Logout()
{
    const navigate=useNavigate();
    const dispatch = useDispatch();
    
        localStorage.clear();
        dispatch(logout());
        navigate("/");

    
   

    
}
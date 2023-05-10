import { useEffect, useState } from "react";
import CustomerNavBar from "./CustomerNavBar";


function CustProdByCategory() {


    const [data, setData] = useState([]);
    // const cat = JSON.parse(localStorage.getItem("catProd"));
    const cat = JSON.parse(localStorage.getItem("SortCategory"));
    const username = JSON.parse(localStorage.getItem("loggedUser"));

    useEffect(() => {
        //e.preventDefault();
        
        alert("Category "+cat)
        fetch("http://localhost:8080/getProductsByCatId?cat_id=" + cat)
            .then(res => res.json())
            .then(data => setData(data))

    }, []);

    const handleChange = (e)=>{
        
        // alert(e)
        // alert("hello prathmesh")
        fetch("http://localhost:8080/addToCart?user_id="+username.user_id+"&prod_id="+e)
        .then(res => res.json())
        .then(obj =>{
        //   localStorage.setItem("catProd", JSON.stringify(obj))
          
          console.log(obj)
        })
        //  navigate("/custProdByCat")
    
     }


    return (
        <div>
            <CustomerNavBar />
            <div className="container" style={{ paddingTop: "50px" }}>

                <div className="row">{ // here slice used for limited data
                    data.map(v => {
                        return (
                            <div className="col-md-4 " style={{padding : "25px"}}>
                            {/* <div class="col-lg-4 col-md-12 mb-4"> */}
                                <div class="card">

                                    <div class="bg-image hover-zoom ripple ripple-surface ripple-surface-light"
                                        data-mdb-ripple-color="light">
                                        <img src={`data:image/jpeg;base64,${v && v.image}`} class="w-100" />
                                    </div>
                                    <div class="card-body">

                                        <h5 class="card-title mb-3">{v.p_name}</h5>
                                        <p>{v.cat_id.cat_name}</p>

                                        <h6 class="mb-3">Price : {v.price}</h6>
                                    </div>
                                    <a className="btn" onClick={()=>{return handleChange(v.product_id)}}>Add To Cart</a>
                                </div>
                            </div>

                            // <div className="col-sm-4">
                            //     <div className="panel-body">
                            //         <img src={v.image} className="img-responsive" style={{ width: "100%" }} alt="Image" onError={
                            //             () => this.img.src = 'D:/KNOW-IT/Project/Documents/Image_srource/p1.jpg'} />
                            //     </div>
                            //     <div className="panel-footer">{v.p_name}</div>
                            //     <div className="panel-footer">Price : {v.price}</div>

                            // </div>
                        )
                    })
                }

                </div>

                {/* <p>{JSON.stringify(cat)}</p> */}
            </div>
        </div>
    )
}

export default CustProdByCategory;
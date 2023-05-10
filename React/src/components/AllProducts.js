import { useEffect, useState } from "react";

function AllProduct() {

    useEffect(() => {
        //e.preventDefault();
        //alert("hi");
        fetch("http://localhost:8080/allProduct")
            .then(res => res.json())
            .then(data => setData(data))

    }, []);

    // onError = () => {
    //     if (!this.state.errored) {
    //       this.setState({
    //         src: this.props.fallbackSrc,
    //         errored: true,
    //       });
    //     }
    //   }

    const [data, setData] = useState([])

    return (
        <div className="container">

            <div className="row">{ // here slice used for limited data
                data.map(v => {
                    return (
                        <div className="col-sm-4">
                            <div class="panel-body">
                                <img src={v.image } className="img-responsive" style={{ width: "100%" }} alt="Image" onError={
    () => this.img.src = 'D:/KNOW-IT/Project/Documents/Image_srource/p1.jpg'} />
                            </div>
                            <div class="panel-footer">{v.p_name}</div>
                            <div class="panel-footer">Price : {v.price}</div>

                        </div>
                    )
                })
            }

            </div>


        </div>
    )
}

export default AllProduct;
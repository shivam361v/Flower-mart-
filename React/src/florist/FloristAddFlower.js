
export default function AddFlower(){
    return (
        <div>
            
            <h1>Welcome {username.fname}</h1>
            <div className="container">
                <h2>Florist Registration</h2>
                <form>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="inputFname">Product Name</label>
                            <input type="text" class="form-control" name="p_name" id="inputP_name" />
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="inputFname">Upload image</label>
                            <input type="text" class="form-control" name="image" id="inputimage" />
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="inputFname">Category</label>
                            <input type="text" class="form-control" name="cat_name" id="inputCat_name" />
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="inputFname">Availablity</label>
                            <input type="text" class="form-control" name="abailablity" id="inputavailablity" />
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="inputFname">Price</label>
                            <input type="text" class="form-control" name="price" id="inputprice" />
                        </div>
                    </div>

                    <br />
                    <button type="submit" >Create Account</button>
                </form>

            </div>
        </div>
    )
}
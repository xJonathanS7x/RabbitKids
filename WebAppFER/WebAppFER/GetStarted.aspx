<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="GetStarted.aspx.cs" Inherits="WebAppFER.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .form__group {
          position: relative;
          padding: 15px 0 0;
          margin-top: 10px;
          width: 50%;
        }

.form__field {
  font-family: inherit;
  width: 100%;
  border: 0;
  border-bottom: 2px solid #9b9b9b;
  outline: 0;
  font-size: 1.3rem;
  color: #fff;
  padding: 7px 0;
  background: transparent;
  transition: border-color 0.2s;
}
.form__field::placeholder {
  color: transparent;
}
.form__field:placeholder-shown ~ .form__label {
  font-size: 1.3rem;
  cursor: text;
  top: 20px;
}

.form__label {
  position: absolute;
  top: 0;
  display: block;
  transition: 0.2s;
  font-size: 1rem;
  color: #9b9b9b;
}

.form__field:focus {
  padding-bottom: 6px;
  font-weight: 700;
  border-width: 3px;
  border-image: linear-gradient(to right, #11998e, #38ef7d);
  border-image-slice: 1;
}
.form__field:focus ~ .form__label {
  position: absolute;
  top: 0;
  display: block;
  transition: 0.2s;
  font-size: 1rem;
  color: #11998e;
  font-weight: 700;
}

/* reset input */
.form__field:required, .form__field:invalid {
  box-shadow: none;
}
    </style>
    <main style="text-align: -webkit-center;padding:5rem 0;background-size:100% 100%;background-image: url('img/GetStartedBackImg.png');">
        <div class="card" style="max-width: 30rem;border-radius:4rem;" id="SelectRolSection">
          <div class="card-body">
              <h3>Select Your Role</h3>
              
                 <div class="radio-inputs">
					<label>
						<input class="radio-input" type="radio" name="engine" value="P">
							<span class="radio-tile">
								<span class="radio-iconPatient">
							    </span>
								<span class="radio-label">Patient</span>
							</span>
					</label>
					<label>
						<input class="radio-input" type="radio" name="engine" value="F">
							<span class="radio-tile">
								<span class="radio-iconFamily">
								</span>
								<span class="radio-label">Family</span>
							</span>
					</label>
					<label>
						<input class="radio-input" type="radio" name="engine" value="D">
							<span class="radio-tile">
								<span class="radio-iconDoctor">
								</span>
								<span class="radio-label">Doctor</span>
							</span>
					</label>
				</div>
			  <button type="button" class="btn btn-outline-primary" style="border-radius: 5rem" onclick="viewSection()">Confirm</button>
          </div>
        </div>
		<div id="RolSection" hidden="hidden">
			<div class="card" style="max-width: 47rem;border-radius:4rem;">
              <div class="card-body">
                  <a href="#" class="BackLink" style="position:absolute;left: 10%;font-size: large;" onclick="viewSelect()"><span class="arrow left"></span> Back</a>
                  <h3 id="Title">Account</h3>
                    <div class="input-group mb-3" style="justify-content:center;padding-top:2rem;">
						<span class="input-group-text" id="basic-addon1" style="border-radius:0;background:#00628C;margin-left:auto;"><img src="img/emailpng.png" height="25"/></span>
						<input type="email" class="form-control" placeholder="Email" aria-label="Email" aria-describedby="basic-addon1" style="border-radius:0;margin-right:auto;">
						<span class="input-group-text" id="basic-addon2" style="border-radius:0;background:#00628C;margin-left:auto;"><img src="img/phonepng.png" height="25"/></span>
						<input type="tel" class="form-control" placeholder="Phone" aria-label="Phone" aria-describedby="basic-addon2" style="border-radius:0;margin-right:auto;">	
                    </div>
                  <div class="input-group mb-3" style="justify-content:center;">
				    <span class="input-group-text" id="basic-addon3" style="border-radius:0;background:#00628C;margin-left:auto;"><img src="img/UserNamepng.png" height="25"/></span>
				    <input type="text" class="form-control" placeholder="User Name" aria-label="Username" aria-describedby="basic-addon3" style="border-radius:0;margin-right:auto;">
				    <span class="input-group-text" id="basic-addon4" style="border-radius:0;background:#00628C;margin-left:auto;"><img src="img/passwordpng.png" height="25"/></span>
				    <input type="password" class="form-control" placeholder="Password" aria-label="Password" aria-describedby="basic-addon4" style="border-radius:0;margin-right:auto;">	
                  </div>
                  <div id="PatientSection" hidden="hidden">
                      <img src="img/pills.png" width="50"/>
                      <img src="img/bmo.png" width="50"/>
                      <h5>FER Assignment</h5>
                      <input type="text" placeholder="Robot ID" style="border:0;border-bottom: 2px solid #2875a3;outline: 0;" />
                  </div>
                   <div id="DoctorSection" hidden="hidden">
                    <img src="img/pin.png" width="50"/>
                    <img src="img/sit.png" width="50"/>
                    <h5>Location Information</h5>
                    <input type="text" placeholder="Address" style="border:0;border-bottom: 2px solid #2875a3;outline: 0;" />
                </div>
              </div>
            </div>
            <div>
                <asp:Button id="Login" runat="server" Text="Create Account" CssClass="LoginBtn"/>
            </div>
		</div>
		
		<script>
            function viewSection() {
                var selected = $("input[type='radio'][name='engine']:checked").val();

                if (selected == "P") {
                    document.getElementById("Title").innerHTML = "Patient Account";
                    document.getElementById("RolSection").removeAttribute("hidden");
                    document.getElementById("SelectRolSection").setAttribute("hidden", "hidden");
                    document.getElementById("PatientSection").removeAttribute("hidden");
                    document.getElementById("DoctorSection").setAttribute("hidden", "hidden");
                } else if (selected == "F") {
                    document.getElementById("Title").innerHTML = "Family Account";
                    document.getElementById("RolSection").removeAttribute("hidden");
                    document.getElementById("SelectRolSection").setAttribute("hidden", "hidden");
                    document.getElementById("PatientSection").setAttribute("hidden", "hidden");
                    document.getElementById("DoctorSection").setAttribute("hidden", "hidden");
                } else if (selected == "D") {
                    document.getElementById("Title").innerHTML = "Doctor Account";
                    document.getElementById("RolSection").removeAttribute("hidden");
                    document.getElementById("SelectRolSection").setAttribute("hidden", "hidden");
                    document.getElementById("DoctorSection").removeAttribute("hidden");
                    document.getElementById("PatientSection").setAttribute("hidden", "hidden");
                } 
			}
            function viewSelect() {
                document.getElementById("SelectRolSection").removeAttribute("hidden");
                document.getElementById("RolSection").setAttribute("hidden", "hidden");
            }
        </script>
    </main>
</asp:Content>

import { Outlet } from "react-router-dom";
import Header from "../Components/Header.jsx";
import "../CSS/AppLayout.css"

function AppLayout() {
  return (
    <>
      <div className="appShell">
        <Header />
        <main className="appMain">
          <Outlet />
        </main>
      </div>
    </>
  );
}

export default AppLayout;

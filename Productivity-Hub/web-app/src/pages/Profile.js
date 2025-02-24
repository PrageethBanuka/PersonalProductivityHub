import React, { useState, useEffect } from "react";
import { useNavigate } from "react-router-dom";
import AvatarEditor from "react-avatar-edit";
import "./profile.css";
import { updateAvatar, fetchProfile } from "../Services/api";
import { motion } from "framer-motion";
import { BtnLink } from "../components/Global/ButtonLink";
import { Pencil } from "lucide-react";
import Popup from "reactjs-popup";
import { Btn } from "../components/Global/Button";

const Profile = () => {
  const [profile, setProfile] = useState({});
  const [avatar, setAvatar] = useState("");
  const [preview, setPreview] = useState(null);
  const navigate = useNavigate();

  const fetchUserProfile = async () => {
    try {
      const response = await fetchProfile();
      setProfile(response.data);
      setAvatar(response.data.avatar);
    } catch (error) {
      console.error("Error fetching profile:", error);
    }
  };

  const handleSaveAvatar = async () => {
    try {
      await updateAvatar(preview);
      alert("Avatar updated successfully!");
      setAvatar(preview);
    } catch (error) {
      console.error("Error updating avatar:", error);
    }
  };

  const handleLogout = () => {
    localStorage.removeItem("token");
    localStorage.removeItem("avatar"); // Clear the avatar
    setAvatar("../../public/images/user.png"); // Reset to default avatar
    navigate("/"); // Redirect to the Sign-In page
  };

  useEffect(() => {
    fetchUserProfile();
  }, []);
  const openEditor = () => {};

  return (
    <motion.div
      initial={{ opacity: 0, filter: "blur(10px)" }}
      animate={{ opacity: 1, filter: "blur(0px)" }}
      exit={{ opacity: 0, filter: "blur(10px)" }}
      transition={{ duration: 0.5, ease: "easeInOut" }}
    >
      <h1>{profile.name}</h1>
      <div className="profile-container">
        <div className="profile-avatar">
          <img src={avatar} alt="Avatar" className="profile-img" />
          <Popup
            trigger={
              <button className="EditButton">
                <Pencil size={15} strokeWidth={1.5} className="Pencil"/>
              </button>
            }
            position="right center"
          >
            <div className="avatar-editor">
              <AvatarEditor
                width={200}
                height={200}
                onCrop={setPreview}
                onClose={() => setPreview(null)}
              />
              {preview && (
                <div >
                  <img src={preview} alt="Preview" className="Preview"/>
                  <BtnLink className="saveAvatar" onClick={handleSaveAvatar}>
                    Save Avatar
                  </BtnLink>
                </div>
              )}
            </div>
          </Popup>
        </div>
        <div className="profile-details">
          <p>
            <strong>Name:</strong> {profile.name}
          </p>
          <p>
            <strong>Email:</strong> {profile.email}
          </p>
          <p>
            <strong>Username:</strong> {profile.username}
          </p>
        </div>
        
        <Btn onClick={handleLogout} className="logout-btn">
          Logout
        </Btn>
      </div>
    </motion.div>
  );
};

export default Profile;

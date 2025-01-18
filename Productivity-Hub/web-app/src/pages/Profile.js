import React, { useState, useEffect } from "react";
import { useNavigate } from "react-router-dom";
import AvatarEditor from "react-avatar-edit";
import "./profile.css";
import { updateAvatar, fetchProfile } from "../Services/api";
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
    navigate("/signin"); // Redirect to the Sign-In page
  };

  useEffect(() => {
    fetchUserProfile();
  }, []);

  return (
    <div>
      <h1>Profile</h1>
      <div className="profile-container">
        <div className="profile-avatar">
          <img src={avatar} alt="Avatar" className="profile-img" />
        </div>
        <div className="avatar-editor">
          <h3>Edit Avatar</h3>
          <AvatarEditor
            width={300}
            height={300}
            onCrop={setPreview}
            onClose={() => setPreview(null)}
          />
          {preview && (
            <div>
              <img src={preview} alt="Preview" />
              <Btn onClick={handleSaveAvatar}>Save Avatar</Btn>
            </div>
          )}
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
    </div>
  );
};

export default Profile;

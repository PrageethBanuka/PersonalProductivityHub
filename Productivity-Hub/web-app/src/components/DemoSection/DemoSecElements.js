import styled from 'styled-components';

// Styled components
export const MainWrapper = styled.div`
  width: 100%;
  display: flex;
  flex-direction: column;
  align-items: center;
  padding: 20px;
  font-family: Arial, sans-serif;
`;

export const Section = styled.div`
  width: 100%;
  margin: 40px 0;
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 30px;
  border-radius: 10px;
  background-color: #f7f7f7;
  /* box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.1); */
  box-sizing: border-box;
`;

export const TextContent = styled.div`
  flex: 1;
  padding-right: 20px;
`;

export const Video = styled.video`
  width: 45%;
  border-radius: 10px;
  box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.2); /* Adding a slightly more prominent shadow */
  object-fit: cover;
  autoplay: true; /* Ensure the video starts playing automatically */
  muted: true; /* Optional: to start without sound */
  loop: true; /* Optional: to loop the video */
`;

export const Title = styled.h2`
  font-size: 2.5rem;
  color: #333;
  margin-bottom: 10px;
`;

export const Description = styled.p`
  font-size: 1.1rem;
  color: #555;
  line-height: 1.6;
`;

export const Button = styled.button`
  background-color: #007bff;
  color: white;
  padding: 10px 20px;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  transition: background-color 0.3s ease;
  &:hover {
    background-color: #0056b3;
  }
`;
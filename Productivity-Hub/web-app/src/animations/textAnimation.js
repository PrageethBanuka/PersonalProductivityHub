import React from "react";
import styled, { keyframes } from "styled-components";

const animation = keyframes`
    0% {opacity: 0; transform: translateY(-50px) ; filter : blur(10px);}
    20% {opacity: 1; transform: translateY(0); filter : blur(0px);}
    40% {opacity: 1; transform: translateY(0); filter : blur(0px);}
    60% {opacity: 1; transform: translateY(0); filter : blur(0px);}
    100% {opacity: 0; transform: translateY(50px)  ; filter : blur(10px);}
`;
const Wrapper = styled.span`
  display: inline-block;
  color: #0c0c0c;
  
  padding: 5px;
  z-index: 10;
  border-radius: 10px;

  span {
    display: inline-block;
    opacity: 0;
    animation-name: ${animation};
    animation-duration: 5s;
    animation-fill-mode: forwards;
    animation-iteration-count: infinite;
  }
  span:nth-child(1) {
    animation-delay: 0.1s;
  }
  span:nth-child(2) {
    animation-delay: 0.2s;
  }
  span:nth-child(3) {
    animation-delay: 0.3s;
  }
  span:nth-child(4) {
    animation-delay: 0.4s;
  }
  span:nth-child(5) {
    animation-delay: 0.5s;
  }
`;
export default function TextAnimation() {
  const tasksText = "Tasks".split("");
  return (
    <Wrapper>
      {tasksText.map((item, index) => (
        <span key={index}>{item}</span>
      ))}
    </Wrapper>
  );
}

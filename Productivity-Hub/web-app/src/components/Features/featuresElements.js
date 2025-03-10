import styled from "styled-components";

export const FeaturesSection = styled.div`
  padding: 4rem 2rem;
  background-color: #0c0c0c;
  text-align: center;
`;

export const FeaturesHeading = styled.h2`
  font-size: 2.5rem;
  font-weight: bold;
  color: #fcfcfc;
  margin-bottom: 1.5rem;

  @media screen and (max-width: 768px) {
    font-size: 2rem;
  }
`;

export const FeaturesSubheading = styled.p`
  font-size: 1.125rem;
  color: #555;
  margin-bottom: 3rem;
  max-width: 700px;
  margin-left: auto;
  margin-right: auto;
  text-align: center;

  @media screen and (max-width: 768px) {
    font-size: 1rem;
  }
  
`;

export const FeaturesGrid = styled.div`
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
  gap: 2rem;
`;

export const FeatureCard = styled.div`
  background-color: #ffffff;
  padding: 2rem;
  border-radius: 8px;
  border: 1px solidrgb(155, 155, 155);
  text-align: center;
  transition: all 0.2s ease-in-out;

  &:hover {
    transform: translateY(-5px);
    border: 1px solid #0c0c0c;
    box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
  }
  `;

export const FeatureIcon = styled.div`
  font-size: 1.5rem;
  color: #fcfcfc;
  margin-bottom: 1rem;
`;

export const FeatureTitle = styled.h3`
  font-size: 1.25rem;
  font-weight: 600;
  color: #fcfcfc;
  margin-bottom: 0.75rem;
`;

export const FeatureDescription = styled.p`
  font-size: 1rem;
  color: #6b7280;
  line-height: 1.5;
`;

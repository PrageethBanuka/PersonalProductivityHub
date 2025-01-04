import styled from "styled-components";

export const FeaturesSection = styled.div`
  padding: 4rem 2rem;
  background-color: #f9fafb;
  text-align: center;
`;

export const FeaturesHeading = styled.h2`
  font-size: 2.5rem;
  font-weight: bold;
  color: #0c0c0c;
  margin-bottom: 1.5rem;

  @media screen and (max-width: 768px) {
    font-size: 2rem;
  }
`;

export const FeaturesSubheading = styled.p`
  font-size: 1.125rem;
  color: #6b7280;
  margin-bottom: 3rem;
  max-width: 700px;
  margin-left: auto;
  margin-right: auto;

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
  box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
  text-align: center;
  transition: transform 0.2s ease-in-out;

  &:hover {
    transform: translateY(-5px);
  }
`;

export const FeatureIcon = styled.div`
  font-size: 2.5rem;
  color: #0c0c0c;
  margin-bottom: 1rem;
`;

export const FeatureTitle = styled.h3`
  font-size: 1.25rem;
  font-weight: 600;
  color: #0c0c0c;
  margin-bottom: 0.75rem;
`;

export const FeatureDescription = styled.p`
  font-size: 1rem;
  color: #6b7280;
  line-height: 1.5;
`;

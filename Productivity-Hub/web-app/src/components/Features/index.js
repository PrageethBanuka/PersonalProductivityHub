// components/Features/index.js

import React from "react";
import {
  FeaturesSection,
  FeaturesHeading,
  FeaturesSubheading,
  FeaturesGrid,
  FeatureCard,
  FeatureIcon,
  FeatureTitle,
  FeatureDescription,
} from "./featuresElements";
import { CircleCheckBig, Zap, Brain, Laptop, Cloud } from "lucide-react";
import SpotlightCard from "../SpotlightCard/SpotLightCard";

const features = [
  {
    icon: <CircleCheckBig size={60} />, // Replace this with an actual icon component if needed
    title: "Task Management",
    description:
      "Organize and prioritize your tasks with ease. Set due dates, add labels, and never miss a deadline.",
  },
  {
    icon: <Zap size={60} />,
    title: "Habit Tracking",
    description:
      "Build and maintain productive habits. Track your progress and celebrate your streaks.",
  },
  {
    icon: <Brain size={60} />,
    title: "AI Insights",
    description:
      "Get personalized productivity recommendations based on your work patterns and goals.",
  },
  {
    icon: <Laptop size={60} />,
    title: "Cross-Platform",
    description:
      "Access your tasks and habits from anywhere. Available on web and as a desktop application.",
  },
  {
    icon: <Cloud size={60} />,
    title: "Seamless Sync",
    description:
      "Your data is always in sync across all your devices, powered by our reliable cloud infrastructure.",
  },
];

export default function Features() {
  return (
    <FeaturesSection>
      <FeaturesHeading>A better way to stay productive</FeaturesHeading>
      <FeaturesSubheading>
        Seamlessly sync between devices, work offline, and get AI-powered
        insights to boost your productivity.
      </FeaturesSubheading>
      <FeaturesGrid>
        {features.map((feature, index) => (
          <SpotlightCard key={index}>
            <FeatureIcon>{feature.icon}</FeatureIcon>
            <FeatureTitle>{feature.title}</FeatureTitle>
            <FeatureDescription>{feature.description}</FeatureDescription>
          </SpotlightCard>
        ))}
      </FeaturesGrid>
    </FeaturesSection>
  );
}

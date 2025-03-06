import React from "react";
import { motion } from "framer-motion";
import {
  TextContent,
  MainWrapper,
  Description,
  Video,
  Title,
  Button,
  Section,
} from "./DemoSecElements";
import { Btn } from "../Global/Button";
import { BtnLink } from "../Nav/navbarElements";

const Demo = () => {
  return (
    <MainWrapper>
      {/* Task Management Section */}
      <motion.div
        whileInView={{ opacity: 1 }}
        initial={{ opacity: 0 }}
        transition={{ duration: 1 }}
        viewport={{ once: true ,amount: "90%"}} // Only trigger the animation once when the element comes into view
      >
        <Section>
          <TextContent>
            <Title>Task Management</Title>
            <Description>
              Manage your tasks effortlessly. Set deadlines, priorities, and get
              reminders for your important tasks.
            </Description>
            <BtnLink to="/Task">Start Managing Tasks</BtnLink>
          </TextContent>
          <Video as="video" autoPlay muted loop >
            <source src="/Videos/Task_Add.mp4" type="video/mp4" />
            Your browser does not support the video tag.
          </Video>
        </Section>
      </motion.div>

      {/* Habits Section */}
      <motion.div
        whileInView={{ opacity: 1 }}
        initial={{ opacity: 0 }}
        transition={{ duration: 1 }}
        viewport={{ once: true ,amount: "90%"}} // Animation triggered once
      >
        <Section>
          <TextContent>
            <Title>Habit Tracking</Title>
            <Description>
              Stay on top of your daily habits. Track streaks, set reminders,
              and achieve your personal goals.
            </Description>
            <BtnLink to="/Habits">Track My Habits</BtnLink>
          </TextContent>
          <Video as="video" autoPlay muted loop >
            <source src="Videos/Habit_Add.mp4" type="video/mp4" />
            Your browser does not support the video tag.
          </Video>
        </Section>
      </motion.div>

      {/* AI Insights Section */}
      <motion.div
        whileInView={{ opacity: 1 }}
        initial={{ opacity: 0 }}
        transition={{ duration: 1 }}
        viewport={{ once: true ,amount: "90%" }} // Animation triggered once
      >
        <Section>
          <TextContent>
            <Title>AI Insights</Title>
            <Description>
              Get personalized AI insights to optimize your productivity and
              well-being. Receive recommendations based on your activities.
            </Description>
            <BtnLink to="/Insights">See My Insights</BtnLink>
          </TextContent>
          <Video as="video" autoPlay muted loop >
            <source src="Videos/Ai_Insigths.mp4" type="video/mp4" />
            Your browser does not support the video tag.
          </Video>
        </Section>
      </motion.div>
    </MainWrapper>
  );
};

export default Demo;

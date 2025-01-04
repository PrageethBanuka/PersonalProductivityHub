import { BtnLink } from "../Global/ButtonLink";
import { HeroContainer } from "./heroElements";

const Hero = () => (
  <HeroContainer>
    <h1>Your personal productivity companion</h1>
    <p>
      Seamlessly manage tasks, build habits, and get AI-powered insights to
      boost your productivity. Available on web and desktop, always in sync.
    </p>
    <BtnLink to="/sign-up">Get Started Free</BtnLink>
  </HeroContainer>
);

export default Hero;

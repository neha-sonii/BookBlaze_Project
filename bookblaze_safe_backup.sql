--
-- PostgreSQL database dump
--

-- Dumped from database version 15.4
-- Dumped by pg_dump version 15.4

-- Started on 2025-08-24 18:41:50

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 3346 (class 1262 OID 19529)
-- Name: Bookblaze; Type: DATABASE; Schema: -; Owner: postgres
--
-- CREATE DATABASE removed (Render already created one)
-- ALTER DATABASE removed (not needed)

\connect bookblaze_db


SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 215 (class 1259 OID 19534)
-- Name: books; Type: TABLE; Schema: public; Owner: postgres
--

-- CREATE TABLE public.books (
--     id integer NOT NULL,
--     title text NOT NULL,
--     author text NOT NULL,
--     isbn character varying(20),
--     price numeric(10,2),
--     rating integer,
--     description text,
--     genre text
-- );


-- ALTER TABLE public.books OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 19533)
-- Name: books_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

-- CREATE SEQUENCE public.books_id_seq
--     AS integer
--     START WITH 1
--     INCREMENT BY 1
--     NO MINVALUE
--     NO MAXVALUE
--     CACHE 1;


-- ALTER TABLE public.books_id_seq OWNER TO postgres;

--
-- TOC entry 3347 (class 0 OID 0)
-- Dependencies: 214
-- Name: books_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

-- ALTER SEQUENCE public.books_id_seq OWNED BY public.books.id;


--
-- TOC entry 216 (class 1259 OID 19542)
-- Name: session; Type: TABLE; Schema: public; Owner: postgres
--

-- CREATE TABLE public.session (
--     sid character varying NOT NULL,
--     sess json NOT NULL,
--     expire timestamp(6) without time zone NOT NULL
-- );


-- ALTER TABLE public.session OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 19571)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

-- CREATE TABLE public.users (
--     id integer NOT NULL,
--     email character varying(150) NOT NULL,
--     password character varying(255) NOT NULL,
--     created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
-- );


-- ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 19570)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

-- CREATE SEQUENCE public.users_id_seq
--     AS integer
--     START WITH 1
--     INCREMENT BY 1
--     NO MINVALUE
--     NO MAXVALUE
--     CACHE 1;


-- ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 3348 (class 0 OID 0)
-- Dependencies: 217
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

-- ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 3182 (class 2604 OID 19537)
-- Name: books id; Type: DEFAULT; Schema: public; Owner: postgres
--

-- ALTER TABLE ONLY public.books ALTER COLUMN id SET DEFAULT nextval('public.books_id_seq'::regclass);


--
-- TOC entry 3183 (class 2604 OID 19574)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

-- ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 3337 (class 0 OID 19534)
-- Dependencies: 215
-- Data for Name: books; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.books VALUES (71, 'The Master key system', 'Charles F. Haanel', '9781585426270', 12.00, 8, 'Considered a foundational text in the self-help and “law of attraction” movement, this book presents a 24-part system aimed at unlocking personal power, success, and abundance. It influenced later works like The Secret and continues to be studied for its focus on mental discipline, visualization, and positive thinking.', 'Personal Development') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.books VALUES (41, 'Sunrise on the Reaping', 'Suzanne Collins', '9781546171461', 14.00, 8, 'A prequel to The Hunger Games trilogy, this novel takes place during the 50th Hunger Games, set 24 years before the original books. The story centers on Haymitch Abernathy and dives deep into themes of political manipulation, propaganda, and societal control.', 'Fiction') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.books VALUES (48, 'Orphan X', 'Gregg Harwitz', '9781250097200', 16.00, 10, 'Evan Smoak, raised in a covert government program as "Orphan X," becomes a highly skilled assassin. After escaping the program, he reinvents himself as The Nowhere Man, helping those with nowhere else to turn. But when his past resurfaces, Evan must face deadly enemies while protecting his new mission.', 'Action and adventure') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.books VALUES (49, 'Outlander', 'Diana Gambeldon', '9780440212560', 15.00, 8, 'In 1945, former combat nurse Claire Randall is mysteriously transported back to 18th-century Scotland, where she becomes entangled in clan politics, dangerous uprisings, and a passionate romance with the gallant Highland warrior Jamie Fraser. A sweeping tale blending history, love, and adventure.', 'Historical Romance') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.books VALUES (51, 'The Dutches Deal', 'Tessa Dare', '9780062697202', 16.00, 8, 'After returning from war with scars that left him reclusive, the Duke of Ashbury needs an heir. He proposes a marriage of convenience to seamstress Emma Gladstone, but their unexpected attraction soon turns the arrangement into a battle between pride, passion, and love.', 'Historical Romance') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.books VALUES (52, 'Devil in Winter', 'Lisa Kleypas', '9780060562519', 14.00, 9, 'Shy heiress Evangeline Jenner proposes a marriage of convenience to notorious rake Sebastian, Lord St. Vincent, in exchange for protection. What begins as a cold bargain soon transforms into one of the most passionate and beloved romances in Lisa Kleypas’s Wallflowers series.', 'Historical Romance') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.books VALUES (42, 'onyx Storm', 'Rebecca Yarros', '9781649377159', 90.00, 9, 'The third book in the romantasy Empyrean series, published January 21, 2025. Filled with dragon riders, political intrigue, and sweeping fantasy romance, it quickly became one of the fastest-selling adult novels in two decades.', 'Dark Romance') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.books VALUES (43, 'The Lean Startup', 'Eric Ries', '9780307887894', 15.00, 9, 'This book introduces the Lean Startup methodology, a scientific approach to creating and managing startups. Eric Ries emphasizes building a “minimum viable product” (MVP), testing assumptions quickly, and learning from customer feedback. Instead of spending years perfecting a product that may fail, entrepreneurs can adapt and pivot faster, reducing risk and increasing chances of success.', 'buisness') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.books VALUES (30, 'Atomic habbit', 'James clear', '9780735211292 ', 17.00, 10, 'The core idea is that tiny, 1% improvements every day compound over time to produce remarkable results. Instead of chasing big transformations overnight, focus on small habits that are easy to start and maintain.', 'Personal Development') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.books VALUES (32, 'The Hobbit', 'J.R.Talkin', '9780544174221', 14.00, 6, 'It follows Bilbo Baggins, a quiet and comfort-loving hobbit who is unexpectedly swept into an epic quest by the wizard Gandalf and a company of thirteen dwarves led by Thorin Oakenshield. Their mission is to reclaim the dwarves’ homeland and treasure from the fearsome dragon Smaug.', 'Fantasy') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.books VALUES (44, 'The Gray man', 'Mark greaney', '9780515147018', 16.00, 6, 'The story follows Court Gentry, a former CIA operative turned assassin known as The Gray Man. Renowned for his ability to complete impossible missions, he suddenly finds himself being hunted by powerful forces across Europe. Packed with relentless chases, high-stakes action, and international intrigue, the book sets the stage for a fast-paced adventure series.', 'Action and adventure') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.books VALUES (45, 'The Terminal list', 'Jack Carr', '9781501180828', 17.00, 9, 'Navy SEAL James Reece discovers a dark conspiracy after his entire team is ambushed and killed during a covert mission. When he learns that powerful forces within his own government orchestrated the betrayal, he embarks on a relentless mission of vengeance. Gritty, fast-paced, and filled with tactical detail, it’s a gripping action-adventure.', 'Action and adventure') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.books VALUES (46, 'The Bourne identity', 'Robert Ludlum', '9780553260113', 15.00, 9, 'A man with no memory is pulled from the Mediterranean Sea, riddled with bullets. As he struggles to discover his identity, he realizes he possesses deadly skills and is being hunted by ruthless assassins and intelligence agencies. A classic blend of espionage, high-octane chases, and nonstop adventure.', 'Action and adventure') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.books VALUES (47, 'Red Sparrow', 'Jason Matthews', '9781476706122', 17.00, 9, 'Dominika Egorova, a Russian intelligence officer, is forced into becoming a "Sparrow" — a trained seductress in espionage. When she’s assigned to entrap a young CIA officer, their dangerous cat-and-mouse game unfolds into a high-stakes battle of loyalty, deception, and survival. Packed with action, intrigue, and authentic spycraft.', 'Action and adventure') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.books VALUES (50, 'The Bronze Horseman', 'Paullina Simons', '9780061854149', 12.00, 10, 'Set in Leningrad during World War II, the novel follows Tatiana Metanova, a young Russian woman, who falls deeply in love with Alexander, a soldier in the Red Army. Against the backdrop of war, famine, and immense hardship, their love becomes both a lifeline and a test of survival.', 'Historical Romance') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.books VALUES (35, 'psychology of money', 'Morgan Housal', '9780857197689', 70.00, 10, 'Wealth is as much about psychology as it is about math. Good money management is mostly about patience, discipline, and controlling your emotions—not just about picking the right stock or investment.', 'Buisness') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.books VALUES (31, 'Really Good Actually', 'Monica Heisey', '9780063235410', 15.00, 10, 'Maggie, freshly divorced and feeling unmoored, tries to reconstruct her life on her own terms. She chases distractions—think midnight burgers, hobby lists, and digital oversharing—all while grappling with insecurity, existential dread, and the ghost of her former marriage. Told with humor, self-awareness, and multiple layers of emotional realism, it’s a candid and funny look at modern adulthood and the strange terrain of recovery.', 'Humor') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.books VALUES (28, 'Empire of AI', 'Karen Hao', '9780593657508', 17.00, 8, ' History	Chronicles the history and internal dynamics of OpenAI, based on interviews, documents, and insider insight', 'Biographical') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.books VALUES (54, 'Nine rules to brake when romancing a rake', 'Sarah Machlean', '9780061852053', 18.00, 10, 'Lady Calpurnia Hartwell is tired of being the proper wallflower, so she makes a list of daring rules to break—including kissing a stranger, dueling, and gambling at a gentlemen’s club. When she crosses paths with the irresistible Gabriel St. John, Marquess of Ralston, her adventures lead to passion, scandal, and unexpected love.', 'Historical Romance') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.books VALUES (55, 'Steve jobs', 'Walter Isaacson', '9781451648539', 17.00, 9, 'Based on over forty interviews with Steve Jobs and conversations with family, friends, colleagues, and competitors, Walter Isaacson’s biography presents the life of the visionary Apple co-founder. It captures his creative genius, passion for design, drive for perfection, and the complexities of his personality.', 'Biographical') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.books VALUES (57, 'Long Walk to Freedom', 'Nelson Mandela', '9780316548182', 15.00, 10, 'Nelson Mandela’s autobiography traces his life from childhood in rural South Africa, through his years of political struggle against apartheid, his long imprisonment, and finally to his historic role as the first democratically elected president of South Africa. It’s an inspiring story of resilience, justice, and leadership.', 'Biographical') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.books VALUES (65, 'Beyond good and evil', 'Friedrich Nietzsche', '9780140449235', 10.00, 9, 'First published in 1886, Nietzsche’s Beyond Good and Evil challenges traditional moral values and explores concepts of truth, free will, and the nature of power. It lays the foundation for existentialist and postmodern thought, making it one of the most influential works in Western philosophy.', 'Philosphical') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.books VALUES (67, 'Critique of Pure Reason', 'Immanuel Kant', '9780521657297', 17.00, 9, 'First published in 1781, this landmark work reshaped modern philosophy. Kant examines the limits of human knowledge, distinguishing between what we can know through experience and what lies beyond it. His ideas on perception, reason, and metaphysics continue to influence philosophy, science, and ethics today.', 'Philosphical') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.books VALUES (66, 'The Republic', 'Plato', '9780140455113', 15.00, 8, 'One of the most influential works in Western philosophy, The Republic explores justice, morality, the ideal state, and the philosopher-king. Through dialogues led by Socrates, Plato examines the nature of reality, knowledge, and the best way to organize society.', 'Philosphical') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.books VALUES (68, 'Thus Spoke Zarathustra', 'Friedrich Nietzsche', '9780140441185', 12.00, 8, 'Written between 1883 and 1885, this is Nietzsche’s most famous and poetic work. Through the voice of Zarathustra, he presents radical ideas such as the “death of God,” the “Übermensch” (Overman), and the eternal recurrence. It blends philosophy, literature, and prophecy, making it one of the most influential works in modern thought.', 'Philosphical') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.books VALUES (62, 'Zero to One', 'Peter Thiel, Blake Masters', '9780804139298', 15.00, 10, 'In this book, PayPal co-founder and early Facebook investor Peter Thiel shares insights on innovation, startups, and building companies that create truly unique value. Instead of competing in crowded markets, he emphasizes going from “zero to one” — creating something entirely new.', 'Buisness') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.books VALUES (63, 'Pride and Prejudice', 'Jane Austen', '9780141439518', 12.00, 8, 'Pride and Prejudice follows Elizabeth Bennet, a sharp-witted young woman navigating issues of class, marriage, and social expectations in 19th-century England. Her evolving relationship with the proud Mr. Darcy explores themes of love, misunderstanding, and personal growth. This enduring classic is celebrated for its humor, social commentary, and memorable characters.', 'Classical') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.books VALUES (70, 'Good to Great', 'Jim collins', '9780066620992', 12.00, 10, 'Based on a five-year research project, Jim Collins examines why some companies transition from being good to truly great, while others fail to make the leap. The book identifies key principles—like disciplined people, thought, and action—that set enduringly successful businesses apart.', 'Buisness') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.books VALUES (64, 'Meditation', 'Marcus Aurelius', '9780812968255', 9.00, 10, 'Written as a personal journal by the Roman Emperor Marcus Aurelius, Meditations is a cornerstone of Stoic philosophy. It explores themes of self-discipline, virtue, impermanence, and inner peace, offering timeless wisdom on how to live a meaningful and resilient life.', 'Philosphical') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.books VALUES (69, 'Nicomachean Ethics', 'Aristotle', '9780140449495', 11.00, 9, 'In this foundational work of Western philosophy, Aristotle explores the nature of happiness (eudaimonia), virtue, and the good life. He argues that true fulfillment is found through practicing virtue and cultivating wisdom, offering insights that continue to shape ethical and moral philosophy today.', 'Philosphical') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.books VALUES (53, 'The Secret', 'Julie Garwood', '9780671744212', 17.00, 9, 'Set in medieval England, The Secret follows the bold and fiery Lady Madelyne St. John, who, under threat from a powerful earl, enlists the help of the formidable Sir Robin Lockley. Tasked with protecting her, Robin soon finds himself drawn to her intelligence, courage, and passion. Combining fierce loyalty, sizzling attraction, and Garwood’s signature charm, this is a richly romantic and sweeping tale of love and honor.', 'Historical Romance') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.books VALUES (56, 'The Diary of a Young Girl', 'Anne Frank', '9780553577129', 13.00, 10, 'Written while hiding from the Nazis during World War II, Anne Frank’s diary offers a poignant, first-hand account of her life in the secret annex. It’s both a personal coming-of-age story and a powerful historical document, capturing the resilience and hope of a young girl in the darkest of times.', 'Biographical') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.books VALUES (58, 'Becoming', 'Michelle Obama', '9781524763138', 18.00, 9, 'In this deeply personal memoir, former First Lady Michelle Obama reflects on her childhood, education, career, and her years in the White House. With honesty and warmth, she shares her journey of finding her voice, balancing family with public life, and inspiring millions around the world.', 'Biographical') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.books VALUES (59, 'Einstein-His life and Universe', 'Walter Isaacson', '9780743264730', 18.00, 9, 'Drawing on newly released letters and archival material, Walter Isaacson presents a sweeping biography of Albert Einstein. It explores both his groundbreaking scientific achievements and the personal struggles that shaped his life, showing the human side of one of history’s greatest minds.', 'Biographical') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.books VALUES (61, 'Wings of Fire', 'A. P. J. Abdul Kalam with Arun Tiwari', '9788173711466', 15.00, 10, 'This inspiring autobiography traces Dr. Kalam’s journey from his humble beginnings in Rameswaram to becoming India’s “Missile Man” and later the 11th President of India. It highlights his struggles, dedication to science, and vision for India’s development, making it both motivational and deeply personal.', 'Biographical') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.books VALUES (78, 'Matilda', 'Roald Dahl', '9780142410370', 17.00, 9, 'Matilda tells the story of a brilliant young girl with extraordinary intelligence and telekinetic powers. Despite her neglectful and cruel parents, Matilda discovers her strengths and ultimately uses them to overcome adversity. The novel combines humor, magic, and important life lessons, making it a timeless favorite for children.', 'Children') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.books VALUES (72, 'The Secret of Millinaire''s mind', 'T.Harv.Eker', '9780060763282', 10.00, 10, 'In Secrets of the Millionaire Mind, T. Harv Eker explores how subconscious beliefs—your "financial blueprint"—shape your ability to gain and maintain wealth. He outlines 17 "Wealth Files" that highlight the thinking patterns of wealthy individuals versus others. The book blends motivational psychology with actionable steps for personal financial transformation and success.', 'Personal Development') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.books VALUES (75, 'The Science of getting rich', 'Walles D.Wattles', '9781420957013', 9.00, 8, 'The Science of Getting Rich is a classic self-help book that delves into the principles of wealth creation. Written by Wallace D. Wattles, the book emphasizes the importance of thinking in a certain way and acting in a certain way to achieve financial success. Wattles presents the idea that getting rich is not a matter of environment or talent, but of understanding and applying the right mental and physical actions. This work has inspired many, including Rhonda Byrne''s The Secret, and continues to be a foundational text in the personal development genre.', 'Personal Development') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.books VALUES (34, 'Rich dad poor dad', 'Robert.T.Kiyosaki', '9780446677455', 18.00, 10, 'Rich Dad Poor Dad by Robert T. Kiyosaki is a personal finance classic first published in 1997.', 'Buisness') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.books VALUES (73, 'The Intelligent Investor', 'Banjamin Graham', '9780060555665', 17.00, 10, 'Benjamin Graham’s The Intelligent Investor is considered the bible of value investing. It introduces the principles of long-term investing, margin of safety, and market psychology. Modern editions include commentary by Jason Zweig, which bridges Graham’s timeless wisdom with today’s market realities.', 'Buisness') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.books VALUES (76, 'The $100 Startup', 'Chris Guillebeau', '9780307951526', 16.00, 9, 'Chris Guillebeau explores how ordinary people can start successful businesses with very little capital. Through case studies and practical advice, he demonstrates that passion, creativity, and smart execution can turn small ideas into profitable ventures. The book emphasizes independence, low-risk experimentation, and building a life on your own terms.', 'Buisness') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.books VALUES (77, 'Charlie and the Chocolate factory', 'Roald Dahl', '9780142403884', 17.00, 8, 'This classic children’s story follows Charlie Bucket, a poor boy who wins a golden ticket to tour Willy Wonka’s magical chocolate factory. Filled with whimsical inventions, eccentric characters, and life lessons, the book has enchanted generations of readers. It combines humor, adventure, and morality, making it a timeless favorite in children’s literature.', 'Children') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.books VALUES (79, 'The Lion, The Witch and the wardrobe', 'C.S. Lewis', '9780064471046', 16.00, 10, 'The first published book in The Chronicles of Narnia series, this story follows four siblings who discover the magical land of Narnia through a wardrobe. They join forces with Aslan, the great lion, to defeat the White Witch and restore peace to Narnia. The novel combines adventure, fantasy, and moral lessons, making it a classic in children’s literature.', 'Children') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.books VALUES (80, 'Charlotte''s web', 'E.B.white', '9780061124952', 18.00, 8, 'Charlotte’s Web tells the story of Wilbur, a pig, and his friendship with a clever spider named Charlotte. Charlotte uses her web to save Wilbur from being slaughtered, teaching lessons about friendship, loyalty, and the cycle of life. This timeless classic has captivated generations of children with its heartwarming story and memorable characters.', 'Children') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.books VALUES (81, 'Alice adventure in Wonderland', 'Lewis Carroll', '9780486275437', 17.00, 10, 'This classic tale follows Alice as she falls down a rabbit hole into the whimsical and nonsensical world of Wonderland. Filled with quirky characters, clever wordplay, and imaginative adventures, it has become one of the most enduring and beloved works in children’s literature.', 'Children') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.books VALUES (83, 'The Alchemist', 'Paulo Coelho', '9780061122415', 13.00, 9, 'The Alchemist tells the story of Santiago, a young shepherd who dreams of finding a hidden treasure in Egypt. His journey teaches him about listening to his heart, recognizing opportunities, and pursuing his personal legend. The novel blends adventure, philosophy, and spirituality, making it one of the most beloved works of modern fiction worldwide.', 'Fiction') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.books VALUES (84, 'The Kite runner', 'Khaled Hosseini', '9781594480003', 11.00, 10, 'The Kite Runner follows the story of Amir, a boy from Kabul, and his friendship with Hassan, his loyal friend and servant. Set against the backdrop of Afghanistan’s turbulent history, the novel explores themes of guilt, redemption, friendship, and the consequences of betrayal. It has been praised for its emotional depth and vivid portrayal of Afghan culture.', 'Fiction') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.books VALUES (86, 'To kill a Mokingbird', 'Harper Lee', '9780061120084', 15.00, 9, 'Set in the American South during the 1930s, To Kill a Mockingbird follows Scout Finch and her brother Jem as they navigate issues of race, morality, and justice in their town. Their father, Atticus Finch, serves as a moral hero, defending an innocent Black man accused of rape. The novel explores themes of empathy, prejudice, and human integrity, making it a timeless classic in fiction.', 'Fiction') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.books VALUES (87, 'The Great gatsby', 'F. Scott Fitzgerald', '9780743273565', 14.00, 8, 'The Great Gatsby is a classic American novel set in the Roaring Twenties. It tells the story of Jay Gatsby, a wealthy man known for his lavish parties, and his obsessive love for Daisy Buchanan. The book explores themes of wealth, class, love, and the American Dream, capturing the excesses and moral decay of the era.', 'Fiction') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.books VALUES (88, 'The Catcher in the Rye', 'J.D. Salinger', '9780316769488', 14.00, 9, 'The Catcher in the Rye follows Holden Caulfield, a disillusioned teenager navigating the challenges of adolescence in 1950s New York. The novel explores themes of alienation, identity, and the struggles of growing up. It is celebrated for its authentic voice and enduring impact on coming-of-age literature.', 'Fiction') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.books VALUES (85, '1984', 'George Orwell', '9780451524935', 12.00, 10, '1984 is a dystopian novel set in a totalitarian society ruled by Big Brother. It follows Winston Smith, a man struggling against pervasive government surveillance and mind control. The novel explores themes of freedom, truth, oppression, and individuality, and remains a powerful critique of authoritarianism and propaganda.', 'Fiction') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.books VALUES (93, 'Guns, Germs, and Steel', 'Jared Diamond', '9780393317558', 17.00, 8, 'Guns, Germs, and Steel explores the factors that influenced the development and success of human societies over the last 13,000 years. Jared Diamond examines geography, agriculture, technology, and disease, arguing that environmental and geographical differences largely shaped the modern world. The book combines history, biology, and anthropology to explain the disparate fates of civilizations.', 'Historical') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.books VALUES (92, 'Educated', 'Tara Westover', '9780399590504', 14.00, 10, 'Educated is a memoir by Tara Westover, detailing her journey from growing up in a strict and abusive household in rural Idaho with no formal schooling, to earning a PhD from Cambridge University. The book explores themes of education, self-discovery, resilience, and the struggle for personal freedom, making it an inspiring and widely acclaimed work of non-fiction.', 'Biographical') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.books VALUES (82, 'Percy Jackson & the Olympians', 'Rick Riordan', '9780786838653', 16.00, 8, 'The first book in the Percy Jackson series follows a twelve-year-old boy, Percy, who discovers he is the son of Poseidon. He embarks on a quest to prevent a war among the Greek gods. Packed with adventure, humor, and mythology, this series has become a modern favorite for children and young adults.', 'Children') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.books VALUES (98, 'War and Peace', 'Leo Tolstoy', '9781400079988', 11.00, 10, 'War and Peace is a monumental novel set during the Napoleonic Wars in Russia. Tolstoy explores the lives of aristocratic families, combining historical events with deep philosophical and psychological insights. Themes include war, love, fate, and human resilience. The novel is celebrated for its complex characters, intricate plot, and profound exploration of society and morality.', 'Classical') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.books VALUES (100, 'Crime and Punishment', 'Fyodor Dostoevsky', '9780143107637', 13.00, 8, 'Crime and Punishment is a profound psychological novel exploring morality, guilt, and redemption. It follows Raskolnikov, a destitute student in St. Petersburg, who commits a murder under the belief that extraordinary individuals are above the law, only to face intense inner torment and the possibility of salvation.', 'Classical') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.books VALUES (102, 'Jane Eyre', 'Charlotte Bronte', '9780142437209', 11.00, 9, 'A coming-of-age story of resilience, morality, and love, as Jane Eyre overcomes hardship and finds independence.', 'Classical') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.books VALUES (91, 'Thinking, Fast and Slow', 'Daniel Kahneman', '9780374533557', 12.00, 10, 'Thinking, Fast and Slow explores the two systems of thought that drive human decision-making: the fast, intuitive system and the slow, deliberate system. Kahneman, a Nobel Prize-winning psychologist, explains cognitive biases, heuristics, and how humans often make irrational decisions. The book has profound implications for psychology, economics, and everyday life.', 'Personal Development') ON CONFLICT (id) DO NOTHING;

INSERT INTO public.books VALUES (89, 'Brave New World', 'Aldous Huxley', '9780060850524', 12.00, 10, 'Brave New World presents a futuristic dystopia where society is engineered for stability and happiness at the cost of individuality and freedom. The novel explores themes of technology, control, consumerism, and the tension between conformity and personal identity. Huxley’s work remains a cornerstone of dystopian literature.', 'Fiction') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.books VALUES (90, 'Sapiens: A Brief History of Humankind', 'Yuval Noah Harari', '9780062316097', 18.00, 8, 'Sapiens explores the history of humankind from the emergence of Homo sapiens to the modern era. Harari examines how cognitive, agricultural, and scientific revolutions shaped societies, cultures, and the world we live in today. The book combines history, anthropology, and sociology to provide a compelling, accessible overview of human development.', 'Historical') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.books VALUES (94, 'The Wright Brothers', 'David McCullough', '9781476728742', 15.00, 9, 'The Wright Brothers chronicles the lives of Wilbur and Orville Wright, who achieved the first successful powered flight. David McCullough explores their determination, ingenuity, and perseverance, providing historical context about early aviation. The book combines biography and history to tell the inspiring story of two brothers who changed the world.', 'Historical') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.books VALUES (95, 'Team of Rivals', 'Doris Kearns Goodwin', '9780743270755', 16.00, 9, 'Team of Rivals explores Abraham Lincoln’s leadership during the American Civil War, focusing on how he brought together a cabinet of political opponents to achieve unity and success. Doris Kearns Goodwin highlights Lincoln’s political skill, emotional intelligence, and moral vision, providing a rich historical account of his presidency and the era.', 'Historical') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.books VALUES (96, 'Alexanderi Hamilton', 'Ron Chernow', '9781594200090', 17.00, 9, 'Alexander Hamilton is a comprehensive biography of one of America’s Founding Fathers. Ron Chernow details Hamilton’s rise from orphaned immigrant to influential statesman, his role in shaping the U.S. financial system, and his complex personal life. The book provides historical context on the early United States and offers insights into Hamilton’s enduring legacy.', 'Historical') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.books VALUES (97, 'The Splendid and the Vile', 'Eric Larson', '9780385348713', 18.00, 9, 'The Splendid and the Vile recounts Winston Churchill’s leadership during the Blitz in World War II. Erik Larson combines historical narrative with personal details of Churchill and his family, illustrating courage, resilience, and political strategy during one of Britain’s darkest periods. The book provides a vivid portrayal of history through both public and private perspectives.', 'Historical') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.books VALUES (101, 'Moby Dick', 'Herman Melville', '9780142437247', 13.00, 9, 'Moby-Dick is an epic sea adventure that has become one of the most enduring works of American literature. It follows Ishmael, a young sailor who joins the whaling ship Pequod, commanded by the obsessed Captain Ahab. Ahab is consumed by his relentless pursuit of the great white whale, Moby Dick, who had previously maimed him. The novel is both a thrilling tale of adventure and a profound meditation on obsession, fate, nature, and humanity’s struggle against forces beyond its control.', 'Classical') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.books VALUES (114, 'Books can be Deceiving', 'Jenn McKinlay', '9780425242186', 12.00, 9, 'When Lindsey Norris becomes the new library director in the small coastal town of Briar Creek, she expects quiet days among books. But when her best friend becomes the prime suspect in a murder tied to a local author, Lindsey must use her librarian skills to solve the case before it’s too late.', 'Cozy Mysterious') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.books VALUES (117, 'Quintessentially Q', 'Pepper Winters', '9781492305415', 13.00, 9, 'Monsters in the Dark picks up where Tears of Tess leaves off, chronicling Q Mercer’s mission to reclaim Tess from captivity. As they embark on a perilous journey together, secrets emerge, loyalties are tested, and the line between savior and captor blurs. It’s a dark, emotionally intense continuation of their twisted love story.', 'Dark Romance') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.books VALUES (115, 'Murder at the Vicarage', 'Agatha Christie', '9780062073600', 17.00, 8, 'In the quiet English village of St. Mary Mead, the vicar’s home becomes the scene of a shocking murder. With multiple suspects and secrets hidden in plain sight, it’s up to the observant Miss Marple to untangle the web of lies and uncover the truth.', 'Cozy Mysterious') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.books VALUES (112, 'Chocolate Chip cookie murder', 'Joanne Fluke', '9780758215055', 18.00, 9, 'This is the first book in the Hannah Swensen Mystery series. Set in a small Minnesota town, it follows Hannah Swensen, a baker and coffee shop owner, who finds herself entangled in a murder investigation when her delivery man is found dead. With recipes included, it blends mystery, humor, and delicious desserts—a hallmark of cozy mysteries.', 'Cozy Mysterious') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.books VALUES (111, 'Death on the Nile', 'Agatha Christie', '9780062073556', 11.00, 9, 'A small English village is shaken when a local newspaper announces that a murder will occur at Little Paddocks. Curious neighbors gather to witness the event—only for the lights to go out and a real murder to take place. Miss Marple steps in to untangle secrets, lies, and motives in this classic cozy whodunit.', 'Cozy Mysterious') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.books VALUES (110, 'The No.1 Ladies detective agencies', 'Alexander McCall Smith', '9781400034772', 17.00, 9, 'Set in Botswana, this novel introduces Precious Ramotswe, the country’s premier female detective. With warmth, wit, and charm, she solves small-town mysteries involving cheating husbands, missing persons, and everyday village secrets. A delightful blend of mystery and heartwarming storytelling, it’s the first in a bestselling cozy mystery series.', 'Cozy Mysterious') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.books VALUES (113, 'Death by Dumpling', 'Vivien Chien', '9781250129154', 14.00, 8, 'Lana Lee reluctantly takes over her family’s noodle shop in Cleveland’s Asia Village, but when the restaurant’s property manager is found dead after eating takeout dumplings, Lana finds herself the prime suspect. To clear her name, she dives into solving the mystery while juggling quirky relatives, nosy coworkers, and plenty of neighborhood gossip.', 'Cozy Mysterious') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.books VALUES (118, 'Monster in his eyes', 'J.M.Darhower', '9781497585362', 11.00, 8, 'This dark romance follows Karissa, a sheltered young woman who becomes entangled with Ignazio "Naz" Vitale—a dangerous mafia heir—when she witnesses a violent crime. She finds herself both repelled and drawn to his intense presence. Their relationship is raw, complicated, and charged with power, desire, and emotion.', 'Dark Romance') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.books VALUES (119, 'Dark Prince', 'Christine Feehan', '9780505523303', 10.00, 10, 'This is the inaugural novel of Christine Feehan’s iconic Dark Series, introducing the Carpathians—a near-mythical race whose survival depends on finding a lifemate. The story unfolds with Mikhail Dubrinsky, a powerful, brooding warrior, and Lena, a human woman drawn to him. Their connection treads a fine line between love and life-or-death necessity, blending intense passion with supernatural peril.', 'Dark Romance') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.books VALUES (116, 'Tears of Tess', 'Pepper Winters', '9781492103745', 11.00, 8, 'Tess Snow’s life spirals into darkness when she’s kidnapped during what should’ve been a romantic getaway. As she’s forced into captivity, she encounters Q Mercer—a chillingly powerful man with a dark past. What starts in coercion evolves into a complex, twisted relationship marked by survival, emotional upheaval, and morally gray love.', 'Dark Romance') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.books VALUES (105, 'Salt, Fat, Acid, Heat', 'Samin Nosrat', '9781476753836', 10.00, 8, 'This award-winning cookbook teaches the fundamentals of cooking by focusing on four essential elements: salt, fat, acid, and heat. With engaging writing, illustrations, and recipes, Samin Nosrat empowers readers to develop intuition in the kitchen rather than just following recipes. It’s both a guidebook and a celebration of the art of cooking.', 'Cooking') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.books VALUES (104, 'The joy of cooking', 'Irma S.Rombauer, Ethan becker', '9780743246262', 9.00, 8, 'The Joy of Cooking has become one of the most influential cookbooks in American kitchens. This comprehensive reference covers everything from simple everyday meals to complex holiday feasts, with thousands of recipes and practical cooking advice. Known for its approachable tone and adaptability, the book has been revised over decades while remaining faithful to Irma Rombauer’s mission: to teach and inspire home cooks of all levels.', 'Cooking') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.books VALUES (106, 'How to cook everything', 'Mark Bittman', '9780764578656', 10.00, 9, 'Mark Bittman’s How to Cook Everything is a comprehensive cookbook with more than 2,000 simple recipes. Known for its clarity and versatility, it’s designed for both beginners and experienced home cooks. The book emphasizes practical techniques, everyday ingredients, and flexibility, making it a true kitchen essential.', 'Cooking') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.books VALUES (107, 'Essentials of Classic italian cooking', 'Marcella hazan', '9780394584041', 10.00, 9, 'This classic combines Marcella Hazan’s two landmark works (The Classic Italian Cook Book and More Classic Italian Cooking) into a single volume. It is widely regarded as the definitive guide to authentic Italian home cooking, offering detailed instructions, cultural insights, and timeless recipes that capture the essence of Italy’s culinary traditions.', 'Cooking') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.books VALUES (108, '660 Curries', 'Raghvan Iyer', '9780761137870', 11.00, 10, 'This comprehensive cookbook explores the vast world of Indian curries, offering 660 authentic recipes from across regions of India. It covers vegetarian and non-vegetarian dishes, easy weeknight curries, as well as elaborate festive meals. Written for home cooks, it balances tradition with accessibility.', 'Cooking') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.books VALUES (109, 'Made in India', 'Meera Sodha', '9781250071026', 9.00, 10, 'A fresh take on Indian home cooking, this cookbook brings family recipes passed down through generations, adapted for modern kitchens. It focuses on simple, flavorful dishes with step-by-step guidance, making authentic Indian food approachable for everyday cooking.', 'Cooking') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.books VALUES (120, 'Crow', 'A. Belfrag', '9781523978267', 12.00, 9, 'CROW follows a student in her final year of university who gets mysteriously marked by Crow, a being who blurts out rude, sarcastic (and sometimes brutally honest) comments—only she can hear him. As their fates intertwine, she must learn to navigate this unexpected connection that draws her into a world of darkness, wit, and intense, twisted longing.', 'Dark Romance') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.books VALUES (103, 'Mastering the art of french cooking', 'Julia Child, Louisette Bertholle and Simone beck', '9780375413407', 10.00, 9, 'this landmark cookbook introduced French cuisine to American home kitchens. Julia Child and her co-authors provide detailed, accessible recipes for French classics like boeuf bourguignon, coq au vin, and soufflés, along with practical techniques for sauces, pastries, and roasts. With its clear instructions and emphasis on teaching, the book transformed how Americans cook and remains a timeless reference for anyone passionate about food.', 'Cooking') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.books VALUES (122, 'The Silent Patient', 'Alex Michaelides', '9781250301697', 10.00, 8, 'This debut thriller centers on Theo Faber, a psychotherapist who becomes obsessed with treating Alicia Berenson, a celebrated painter who has gone silent after being accused of murdering her husband. The novel’s intense psychological twists and unreliable narrative make it a standout in modern suspense fiction.', 'Thriller') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.books VALUES (123, 'The Girl on the Train', 'Paula Hawkins', '9781594633669', 9.00, 10, 'Rachel, the unreliable and troubled narrator, sees something shocking from a train window—then struggles to reconstruct what happened during her alcoholism-induced memory lapses. The fragmented perspectives and deep psychological tension make this a standout thriller.', 'Thriller') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.books VALUES (124, 'The Da Vinci Code', 'Dan Brown', '9780385504201', 11.00, 9, 'When the curator of the Louvre is found murdered, Harvard symbologist Robert Langdon and cryptologist Sophie Neveu uncover a trail of codes hidden in Da Vinci’s works. Their search leads them into a thrilling race across Europe to unravel a secret that could shake the foundations of Christianity.', 'Thriller') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.books VALUES (125, 'The Girl with the Dragon Tatoo', 'Stieg Larsson', '9780307269751', 12.00, 8, 'Journalist Mikael Blomkvist and hacker Lisbeth Salander investigate the decades-old disappearance of a wealthy heiress. What starts as a search for truth soon reveals dark family secrets, corruption, and shocking violence.', 'Thriller') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.books VALUES (126, 'Behind Closed Doors', 'B.A.Paris', '9781250121004', 13.00, 10, 'Jack and Grace seem like the perfect couple from the outside. But behind closed doors, Grace is trapped in a chilling nightmare of control and abuse—where escape may be impossible.', 'Thriller') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.books VALUES (127, 'The Couple Next Door', 'Shari Lapena', '9780735221086', 11.00, 8, 'Anne and Marco’s baby disappears while they attend a dinner party next door. As the investigation unfolds, shocking secrets come to light, revealing that no one can be trusted—not even those closest to you.', 'Thriller') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.books VALUES (128, 'A Breif history of time', 'Stephen Hawking', '9780553109535', 9.00, 9, 'Stephen Hawking explores fundamental questions about the universe: How did it begin? What is time? Is there a unified theory that can explain all physical laws? This book makes complex concepts like black holes, relativity, and quantum mechanics accessible to general readers.', 'Science') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.books VALUES (129, 'The Gene', 'Siddhartha Mukherjee', '9781476733500', 12.00, 9, 'This book traces the history of genetics, from Gregor Mendel’s pea plants to modern gene-editing technologies. Mukherjee combines science, history, and personal stories to explore how genes shape our identity, health, and destiny.', 'Science') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.books VALUES (130, 'Cosmos', 'Carl Sagan', '9780345331359', 11.00, 9, 'Carl Sagan explores the universe, from the origin of life on Earth to the vast reaches of space. Combining astronomy, history, and philosophy, Cosmos makes complex scientific ideas accessible while inspiring wonder about the universe.', 'Science') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.books VALUES (131, 'The Immortal Life of Henrietta Lacks', 'Rebecca Skloot', '9781400052189', 10.00, 10, 'This book tells the story of Henrietta Lacks, whose cancer cells were taken without her knowledge and became the first immortal human cell line (HeLa cells). Rebecca Skloot explores the scientific, ethical, and personal dimensions of medical research and its impact on her family.', 'Science') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.books VALUES (132, 'Sapiens', 'Yuval Noah Harari', '9780062316097', 10.00, 8, 'Harari explores the history of Homo sapiens, tracing how biology, culture, and technology shaped our species from hunter-gatherers to modern society. The book blends science, history, and philosophy to examine human behavior, social structures, and the future of humanity.', 'Science') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.books VALUES (133, 'The Elegant Universe', 'Brian Greene', '9780393338102', 9.00, 9, 'Brian Greene explains string theory, unifying quantum mechanics and general relativity, in an accessible way for general readers. The book explores the nature of space, time, and the universe, making complex physics concepts understandable and engaging.', 'Science') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.books VALUES (29, 'The secret', 'Ronde Byrne', '9781582701707', 20.00, 9, 'First published in 2006, The Secret popularized the concept of the law of attraction — the belief that positive thinking and visualization can bring health, wealth, happiness, and success into one’s life. It combines motivational ideas, inspirational quotes, and stories of people who claim to have transformed their lives using this principle.', 'Personal Development') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.books VALUES (134, 'The Whole Brain Child', 'Daniel J. Siegel & Tina Payne Bryson', '9780553386691', 14.00, 9, 'This book explains how a child’s brain develops and provides 12 practical strategies to help parents nurture emotional intelligence, improve communication, and handle challenging behaviors effectively. It blends neuroscience with actionable parenting advice.', 'Parenting') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.books VALUES (136, 'No-Drama Discipline', 'Daniel J. Siegel & Tina Payne Bryson', '9780345548047', 16.00, 8, 'This book explains how parents can discipline children without drama by understanding the child’s brain development. It offers strategies to redirect behavior, teach self-regulation, and strengthen the parent-child relationship through empathy and communication.', 'Parenting') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.books VALUES (135, 'Raising an emotionally Intelligent Child', 'John Gottman', '9780684838656', 12.00, 8, 'Gottman explains how parents can teach children to understand and manage their emotions. The book offers practical strategies to foster empathy, resilience, and emotional intelligence, helping children navigate social and personal challenges effectively.', 'Parenting') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.books VALUES (137, 'Bossypants', 'Tina Fey', '9780316056878', 18.00, 8, 'Tina Fey’s memoir combines hilarious personal anecdotes with sharp insights into comedy, career, and life in show business. From her early years to Saturday Night Live and 30 Rock, Fey delivers humor, wit, and honesty in every chapter.', 'Humor') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.books VALUES (121, 'Beautifully Cruel', 'J.T.Geissinger', '9781733824361', 11.00, 10, 'This novel centers on a ruthless mafia lord determined to make the fragile and beautiful heroine his own—whether she wants it or not. The story is full of tension, power dynamics, and the twisted psychology typical of dark romance. Perfect if you''re into morally grey characters, possessive love stories, and emotional intensity.', 'Dark Romance') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.books VALUES (138, 'Born a Crime', 'Trevor Noah', '9780399588198', 13.00, 8, 'In this candid memoir, Trevor Noah recounts his experiences growing up in apartheid-era South Africa as the child of a black Xhosa mother and a white Swiss-German father—an illegal union at the time. Through a series of humorous and poignant essays, Noah explores themes of identity, race, and resilience, offering readers a unique perspective on a tumultuous period in history.', 'Humor') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.books VALUES (139, 'Me Talk pretty one day', 'David Sedaris', '9780316777728', 12.00, 8, 'David Sedaris''s collection of essays offers a humorous exploration of his life, from his quirky family dynamics to his attempts at learning French in Paris. His sharp observations and witty prose make for an engaging read, highlighting the absurdities of everyday life and the challenges of communication across cultures.', 'Humor') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.books VALUES (140, 'Yes Please', 'Amy Poehler', '9780062268341', 11.00, 8, 'In Yes Please, Amy Poehler delivers a hilarious and candid memoir blending personal stories, life lessons, and comedic wisdom. From her early days in improv comedy to her experiences on Saturday Night Live and Parks and Recreation, Poehler shares behind-the-scenes anecdotes and reflections on fame, creativity, and friendship. The book alternates between humorous stories, advice, and personal insights, capturing her infectious humor and warmth.', 'Humor') ON CONFLICT (id) DO NOTHING;


--
-- TOC entry 3338 (class 0 OID 19542)
-- Dependencies: 216
-- Data for Name: session; Type: TABLE DATA; Schema: public; Owner: postgres
--

-- INSERT INTO public.session VALUES ('zIbM_BDVm2lJ417QV16fakHnheQoMTYH', '{"cookie":{"originalMaxAge":604800000,"expires":"2025-08-30T17:51:38.686Z","httpOnly":true,"path":"/"},"passport":{"user":1},"flash":{},"user":{"id":1,"email":"nehasoni052005@gmail.com","password":"$2b$10$UqIesFiSFmXmFZKwQ60T1ugw0mo5UpmY0IsCjICoMOhqaFIyNIaGS","created_at":"2025-08-23T16:27:09.741Z"}}', '2025-08-31 09:41:13');
-- ON CONFLICT (id) DO NOTHING;
-- INSERT INTO public.session VALUES ('bkPaKYa2OK7oszz9o_QTc1b6qSxiIGC8', '{"cookie":{"originalMaxAge":604800000,"expires":"2025-08-30T17:33:44.451Z","httpOnly":true,"path":"/"},"passport":{"user":2},"flash":{"success":["Logged in successfully"]},"user":{"id":2,"email":"nehasony0511@gmail.com","password":"$2b$10$2wZLaoNDUgKIPIZbgyWAoO6bjeqQNaCiaonzYwn.dgbdVHnqyFRsK","created_at":"2025-08-23T16:40:51.843Z"}}', '2025-08-30 23:03:45');
-- ON CONFLICT (id) DO NOTHING;
-- INSERT INTO public.session VALUES ('UiYp8p4o4NhYJWs3AO6nLYMoB17uEXGV', '{"cookie":{"originalMaxAge":604800000,"expires":"2025-08-30T17:33:46.338Z","httpOnly":true,"path":"/"},"passport":{"user":2},"flash":{},"user":{"id":2,"email":"nehasony0511@gmail.com","password":"$2b$10$2wZLaoNDUgKIPIZbgyWAoO6bjeqQNaCiaonzYwn.dgbdVHnqyFRsK","created_at":"2025-08-23T16:40:51.843Z"}}', '2025-08-30 23:03:47');
-- ON CONFLICT (id) DO NOTHING;

--
-- TOC entry 3340 (class 0 OID 19571)
-- Dependencies: 218
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.users VALUES (1, 'nehasoni052005@gmail.com', '$2b$10$UqIesFiSFmXmFZKwQ60T1ugw0mo5UpmY0IsCjICoMOhqaFIyNIaGS', '2025-08-23 21:57:09.741795') ON CONFLICT (id) DO NOTHING;
INSERT INTO public.users VALUES (2, 'nehasony0511@gmail.com', '$2b$10$2wZLaoNDUgKIPIZbgyWAoO6bjeqQNaCiaonzYwn.dgbdVHnqyFRsK', '2025-08-23 22:10:51.843861') ON CONFLICT (id) DO NOTHING;


--
-- TOC entry 3349 (class 0 OID 0)
-- Dependencies: 214
-- Name: books_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.books_id_seq', 140, true);


--
-- TOC entry 3350 (class 0 OID 0)
-- Dependencies: 217
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 2, true);


--
-- TOC entry 3186 (class 2606 OID 19541)
-- Name: books books_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

-- ALTER TABLE ONLY public.books
--     ADD CONSTRAINT books_pkey PRIMARY KEY (id);


--
-- TOC entry 3189 (class 2606 OID 19548)
-- Name: session session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

-- ALTER TABLE ONLY public.session
    -- ADD CONSTRAINT session_pkey PRIMARY KEY (sid);


--
-- TOC entry 3191 (class 2606 OID 19579)
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

-- ALTER TABLE ONLY public.users
--     ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- TOC entry 3193 (class 2606 OID 19577)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

-- ALTER TABLE ONLY public.users
--     ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3187 (class 1259 OID 19549)
-- Name: IDX_session_expire; Type: INDEX; Schema: public; Owner: postgres
--

-- CREATE INDEX "IDX_session_expire" ON public.session USING btree (expire);


-- Completed on 2025-08-24 18:41:51

--
-- PostgreSQL database dump complete
--


# Masterplan: Plan My Day (The AI-Powered "Second Brain")

## 1. App Overview & Objectives
**Plan My Day** is an intelligent, adaptive daily planner designed for global professionals. Unlike static to-do lists, it acts as a "Second Brain," using AI to map a user's raw intent (tasks) onto a realistic timeline that accounts for travel, energy levels, and bio-rhythms.

* **Core Philosophy:** "Reality-Based Planning." If the math (Time + Travel) doesn't work, the app warns you.
* **Key Differentiator:** The "Librarian & Architect" AI model—splitting data fetching from reasoning to ensure accuracy and privacy.
* **Platform:** Flutter (Cross-Platform Mobile: Android & iOS).
* **Target Audience:** Busy professionals who need "Low Friction" planning.
* **Localization:** Built for global use (Multilingual `i18n` + Global Currency support for Pro tiers).

---

## 2. User Experience (UX) Flow

### A. The "Golden Path" (Daily Usage)
1.  **Morning Brief (Input):** User speaks or types natural intent (e.g., *"Finish report, go to gym, buy milk"*).
2.  **Processing (The Black Box):**
    * **Librarian (Pass 1):** Extracts structured data & queries local "Custom Facts."
    * **Architect (Pass 2):** Generates a conflict-free schedule.
3.  **Review (The Dashboard):** User sees a visual timeline.
    * *Conflict?* User resolves it via a simple "Negotiation Card."
4.  **Execution:** User marks tasks as "Done."
    * *Visual:* A premium "Success Badge" stamps the card. It remains visible as a trophy.

### B. Screen Map
1.  **Onboarding Wizard:**
    * Sets up Bio-Rhythms (Wake/Sleep/Work hours).
    * Requests permissions (Location/Notification).
2.  **Main Dashboard (The Timeline):**
    * **Header:** Date, "Day Status" (e.g., "Heavy Load"), Weather (optional future).
    * **Body:** A scrollable `SliverList` of Time Blocks.
    * **Action:** Floating Action Button (FAB) for "Add New Task" (Voice/Text).
3.  **Input Overlay:**
    * Real-time Speech-to-Text (STT) transcript.
    * "Add Custom Rule" toggle.
4.  **Settings & Brain Management:**
    * **Custom Facts:** A dynamic list where users add "Key: Value" pairs (e.g., "Friday Prayer: 1 PM").
    * **API Management:** "Bring Your Own Key" (BYOK) input fields.
    * **Backup:** Export JSON.

---

## 3. Technical Architecture (The "Hybrid" Model)

### A. Tech Stack
* **Frontend:** Flutter (Dart).
* **State Management:** Riverpod or Bloc (for strict state control).
* **Local Database:** `Drift` (SQLite abstraction) or `Hive` (NoSQL). *Recommendation: Drift for relational integrity.*
* **AI Engine (Cloud):** Google Gemini 1.5 Flash (via Vertex AI or AI Studio).
* **Maps/Routing:** Google Maps API (On-demand only, to save cost).

### B. The "Librarian & Architect" Pattern
To reduce hallucination and latency:

1.  **Pass 1 (The Librarian - On Device/Light Cloud):**
    * *Input:* User Voice Transcript.
    * *Action:* Identifies keywords (e.g., "Gym"). Queries local DB for "Gym Location" & "Gym Duration."
    * *Output:* A "Context Object" (JSON).
2.  **Pass 2 (The Architect - Cloud LLM):**
    * *Input:* Context Object + User Rules (Wake/Sleep) + Custom Facts.
    * *System Prompt:* "You are a scheduler. You must fit these tasks into these hours. Account for travel."
    * *Output:* Final Schedule JSON.

---

## 4. Data Model (Schema Concepts)

### A. User Profile (Singleton)
* `wake_time` (Time)
* `sleep_time` (Time)
* `work_start` (Time)
* `work_end` (Time)
* `home_location` (Lat/Long/String)
* `office_location` (Lat/Long/String)
* `commute_mode` (Enum: Car, Train, Walk)

### B. Custom Facts (Dynamic Table)
* `id` (int)
* `label` (String) - e.g., "Soccer Practice"
* `value` (String) - e.g., "Every Tuesday at 6 PM"
* `is_active` (Bool)

### C. The Schedule (Daily Table)
* `date` (ISO Date)
* `tasks` (List of JSON Objects):
    * `title`: String
    * `start_time`: ISO Timestamp
    * `end_time`: ISO Timestamp
    * `type`: Enum (Focus, Travel, Buffer, Errand)
    * `status`: Enum (Pending, Done, Skipped)
    * `location`: String (optional)

---

## 5. Development Phases

### Phase 1: The "Skeleton" (MVP)
* Setup Flutter project with `Drift` database.
* Build the **Onboarding** and **Settings** screens to populate the DB.
* Implement the **Custom Facts** dynamic list (Add/Remove/Edit).

### Phase 2: The "Brain" (AI Integration)
* Build the **Librarian Service**: A function that takes text and queries the DB.
* Build the **Architect Service**: The API call to Gemini with the "System Prompt."
* Create the **JSON Parser**: Convert Gemini's response into Dart Objects.

### Phase 3: The "Face" (UI Polish)
* Build the **Dashboard** with the timeline view.
* Implement the "Success Badge" animation.
* Add "Edit/Delete" gestures to the timeline cards.

### Phase 4: Global & Pro
* Add `i18n` support (English/Spanish/Hindi strings).
* Implement "Bring Your Own Key" logic in Settings.

---

## 6. Security & Privacy
* **Local First:** All historical data stays on the phone.
* **Transient AI:** Data sent to Gemini is *only* for the current request. No training on user data.
* **API Keys:** User keys (BYOK) are stored in Flutter's `SecureStorage` (Encrypted).

## 7. Potential Challenges & Solutions
* **Challenge:** AI hallucinates a time (e.g., "25:00 PM").
    * *Solution:* Strict JSON Schema Validation in Dart. If the JSON is invalid, the app asks the user to try again (or auto-retries).
* **Challenge:** Maps API cost.
    * *Solution:* Use "Heuristic Travel Times" (e.g., standard 30 mins) by default. Only call Google Maps if the user hits "Verify Traffic."

# Feature Specification: Fix messy talks page

**Feature Branch**: `002-fix-talks-page`  
**Created**: 2026-01-31  
**Status**: Draft  
**Input**: User description: "Fix messy @content/page/talks/ page"

## User Scenarios & Testing *(mandatory)*

### User Story 1 - Bilingual Content Parity (Priority: P1)

As a visitor to the site, I want to see the same list of talks regardless of whether I am browsing in English or Italian, so that I don't miss any information.

**Why this priority**: Core constraint of the project is bilingual parity. The current Italian page is "Under construction" and empty compared to the English one.

**Independent Test**: Can be tested by switching between English and Italian versions of the Talks page and verifying the list of appearances matches exactly.

**Acceptance Scenarios**:

1. **Given** the English talks page has 15 items, **When** I switch to the Italian version, **Then** I should see the same 15 items translated or appropriately localized.
2. **Given** a new talk is added in the English version, **When** I check the Italian version, **Then** the Italian version must also include the new talk.

---

### User Story 2 - Standardized Layout and Readability (Priority: P2)

As a reader, I want a clean, consistent, and easy-to-read list of talks, so that I can quickly find topics or appearances that interest me.

**Why this priority**: The current page is "messy" due to inconsistent image sizing, mixed markdown/HTML for links, and lack of visual structure beyond simple headers.

**Independent Test**: Can be tested by visual inspection of the page across different screen sizes to ensure consistent alignment and readable formatting.

**Acceptance Scenarios**:

1. **Given** a list of talks, **When** viewed on mobile, **Then** all images and text should wrap correctly without horizontal scrolling.
2. **Given** various talks with videos or slides, **When** displayed, **Then** they should use a consistent thumbnail and link format.

---

### User Story 3 - Navigation and Accessibility (Priority: P3)

As a user, I want to easily navigate back to the main site or other sections from the talks page, and understand the context of each talk (language, location, year).

**Why this priority**: Enhances user experience and site stickiness.

**Independent Test**: Can be tested by clicking menu links and verifying breadcrumbs or back-to-top functionality if implemented.

**Acceptance Scenarios**:

1. **Given** the talks page, **When** I look at a talk entry, **Then** I should clearly see the year, language icon, and type of resource (video, slides, repo).

## Requirements *(mandatory)*

### Functional Requirements

- **FR-001**: The Italian version (`index.it.md`) MUST be updated to match the English version (`index.en.md`) in terms of content and structure.
- **FR-002**: All talks MUST be categorized by year in descending order.
- **FR-003**: Each talk entry MUST include a title, event name, and links to resources (slides, video, code) if available.
- **FR-004**: Thumbnails and images MUST use a standardized format (e.g., standard aspect ratio or max-width) to avoid layout shifts.
- **FR-005**: Language indicators (flags or icons) MUST be used consistently for each talk.
- **FR-006**: The system MUST use Hugo's native markdown for images and links where possible, avoiding inline HTML unless necessary for specific styling.
- **FR-007**: The talks MUST be presented as a flat chronological list grouped by year, without interactive filtering.
- **FR-008**: The focus of this task MUST be on fixing and localizing existing content from 2016-2022.

### Key Entities

- **Talk**: Represents a single public appearance. Attributes: Year, Title, Event, Language, Resource Links (URL, Type), Thumbnail.

## Success Criteria *(mandatory)*

### Measurable Outcomes

- **SC-001**: 100% content parity between English and Italian versions of the Talks page.
- **SC-002**: Page load time under 2 seconds on mobile (Standard 4G) despite having multiple video thumbnails.
- **SC-003**: Zero layout shift (CLS < 0.1) when images/thumbnails load.
- **SC-004**: All external links (videos, slides, repos) open in a new tab/window.

## Assumptions

- We will translate titles and event descriptions for the Italian version.
- External event names (e.g., "Agile Venture") will remain in their original language.
- Thumbnails already exist in the `img` directory or can be sourced from external APIs (e.g., YouTube) if not present locally.
# URL Based Job Data Scraping Application

## Overview
This is a Flask-based web application that allows users to scrape job listings from various websites. The application provides a simple interface to enter URLs, scrape job data, view results, and export them to Excel format.

## Project Architecture

### Technology Stack
- **Backend Framework**: Flask 3.1.1
- **Web Scraping**: BeautifulSoup4 4.13.4, Requests 2.32.4
- **Data Export**: OpenPyxl 3.1.5
- **Frontend**: Bootstrap 5.1.3
- **Python Version**: 3.11+
- **Package Manager**: UV

### Key Features
1. **User Authentication**: Simple login system (works in Chrome, Edge, Firefox)
2. **Multi-Website Support**: Dropdown selector for 4 major Kosovo job websites
3. **Comprehensive Data Extraction**: Automatically extracts 16 job fields:
   - Company, Position, Phone Number, Email, Category
   - Posted On, Data Scraped On, Location, Post Web Link
   - Job Description, Source, Website, Salary
   - Job Type, JobPost Ad ID, Colleague-User ID
4. **Excel Export**: Download scraped results with all 16 fields
5. **Smart Scraping**: Only available data is collected, missing fields are ignored
6. **Category Filtering**: Select job category during scraping
7. **In-memory Storage**: Scraped jobs are stored during the session

### Project Structure
```
.
├── main.py                 # Main Flask application with all routes and scraping logic
├── templates/              # HTML templates
│   ├── base.html          # Base template with navigation
│   ├── login.html         # Login page
│   ├── welcome.html       # Dashboard after login
│   ├── select_url.html    # URL input form
│   ├── scraping_progress.html  # Progress indicator
│   └── results.html       # Display scraped results
├── pyproject.toml         # Python dependencies
├── uv.lock               # UV lock file
└── .gitignore            # Git ignore file

```

### Current State
- ✅ **Modern React Frontend** (React 19 + Vite 7 + TypeScript + Tailwind CSS v4)
- ✅ **Flask API Backend** (running on localhost:8000)
- ✅ All dependencies installed (Python via UV, Node.js packages via npm)
- ✅ Complete UI components with shadcn/ui styling
- ✅ State management with Redux Toolkit
- ✅ API layer with React Query + Axios
- ✅ Form validation with React Hook Form + Zod
- ✅ Smooth animations with Framer Motion
- ✅ Client-side routing with React Router
- ✅ **Frontend running on port 5000** (configured for Replit webview)
- ✅ **Deployment configured** (autoscale with Gunicorn)
- ✅ Flask serves built React app in production
- ⚠️ Using in-memory storage (data lost on restart)
- ⚠️ Development servers (not production-ready without deployment)

### Default Credentials
- **Username**: demo
- **Password**: demo123

### Environment Variables
- `SECRET_KEY`: Flask session secret key (optional, defaults to dev key)

## Recent Changes
- **2025-11-11**: Bug Fixes - React Hooks Error and Browser Compatibility
  - **Fixed React hooks error**: Replaced @radix-ui/react-select with native HTML select element to eliminate "Invalid hook call" errors on scrape page
  - **Improved browser compatibility**: Updated CORS configuration to support all browsers (Chrome, Edge, Firefox) with wildcard origins for development
  - **Security maintained**: Restored HttpOnly cookies while keeping SameSite=Lax for cross-browser session persistence
  - **Verified functionality**: Confirmed login and scraping work correctly across all supported browsers

- **2025-11-11**: Major Feature Implementation - Multi-website Job Scraping System
  - **Fixed browser compatibility**: Updated CORS and session cookie settings to work across Chrome, Edge, and Firefox
  - **Added 4 job website scrapers**: Implemented specialized scrapers for:
    - KosovaJob (www.kosovajob.com)
    - Oferta Pune (ofertapune.net)
    - Telegrafi Jobs (jobs.telegrafi.com)
    - Portal Pune (www.portalpune.com)
  - **Enhanced data model**: Added all 16 required fields including email, jobpost_ad_id, colleague_user_id
  - **Dropdown website selector**: Created user-friendly dropdown to choose from 4 predefined job websites or enter custom URL
  - **Comprehensive table view**: Implemented full-width table displaying all 16 job fields
  - **Updated Excel export**: Download now includes all 16 fields with proper headers
  - **Fixed Vite proxy**: Changed from external Render URL to localhost:8000 for development
  - **Data structure consistency**: Normalized backend scrapers to use camelCase keys matching frontend
  - **Category filtering**: Implemented category selection in scraping form
  - **Smart data extraction**: Only collects available data, missing fields are handled gracefully

- **2025-10-27**: Replit environment setup completed
  - Fixed Tailwind CSS v4 configuration (added @tailwindcss/postcss package)
  - Created missing utils.ts file for UI components
  - Configured Vite server for port 5000 with proper host settings
  - Updated PostCSS config to use @tailwindcss/postcss plugin
  - Installed all Python dependencies using UV package manager
  - Configured Flask to serve built React app in production
  - Set up deployment configuration (autoscale with Gunicorn)
  - Both workflows running successfully (Backend and Frontend)
  
- **2025-10-27**: Complete frontend conversion to React ecosystem
  - Created React 18 + Vite + TypeScript project structure
  - Installed and configured Tailwind CSS with custom theming
  - Implemented shadcn/ui component library (Button, Input, Card, Label)
  - Set up Redux Toolkit for state management
  - Configured React Query + Axios for API communication
  - Implemented React Hook Form + Zod for form validation
  - Added Framer Motion for smooth page transitions
  - Converted Flask to API-only backend (running on port 8000)
  - Enabled CORS for cross-origin requests
  - Created all page components:
    - Login page with authentication
    - Welcome dashboard with feature cards
    - URL scraping form with validation
    - Results page with job listings display
  - Set up protected routes and authentication flow
  - Configured deployment for production (build + gunicorn)
  
- **2025-10-27**: Initial Replit environment setup
  - Installed Python dependencies using UV package manager
  - Added .gitignore for Python projects
  - Updated secret key to use environment variable

## Technology Stack

### Frontend
- **Framework**: React 18.3 with TypeScript
- **Build Tool**: Vite 7.1
- **Styling**: Tailwind CSS 3.x with custom design system
- **UI Components**: shadcn/ui (custom implementation)
- **State Management**: Redux Toolkit
- **Data Fetching**: TanStack React Query (formerly React Query)
- **HTTP Client**: Axios
- **Routing**: React Router DOM v7
- **Forms**: React Hook Form + Zod validation
- **Animations**: Framer Motion
- **Utilities**: clsx, tailwind-merge, class-variance-authority

### Backend  
- **Framework**: Flask 3.1.1 (API-only)
- **CORS**: Flask-CORS 6.0.1
- **Web Scraping**: BeautifulSoup4 4.13.4 + Requests 2.32.4
- **Excel Export**: OpenPyxl 3.1.5
- **Production Server**: Gunicorn 23.0.0

## Workflows

### Development
- **Backend**: Python Flask API server on `localhost:8000` (console output)
  - Command: `uv run python main.py`
  - Serves API endpoints and proxies to frontend in dev mode
- **Frontend**: Vite dev server on `0.0.0.0:5000` (webview output)
  - Command: `cd client && npm run dev -- --host 0.0.0.0`
  - Configured with strictPort and HMR for Replit environment
  - Proxies API requests to backend on port 8000

### Production Deployment
- **Deployment Target**: Autoscale (stateless web application)
- **Build Command**: `bash -c "cd client && npm install && npm run build"`
- **Run Command**: `bash -c "uv sync && uv run gunicorn --bind=0.0.0.0:5000 --reuse-port main:app"`
- Flask serves the built React app from `client/dist` directory
- All API requests go through `/api/*` prefix

## API Endpoints

All API endpoints are prefixed with `/api`:

- `POST /api/login` - Authenticate user
- `POST /api/logout` - End user session
- `GET /api/me` - Get current user info
- `POST /api/scrape` - Start job scraping
- `GET /api/jobs` - Get all scraped jobs
- `DELETE /api/jobs` - Delete all jobs
- `GET /api/download_excel` - Download jobs as Excel file

## Notes
- The application uses generic web scraping patterns that may not work optimally for all job sites
- Scraped data is stored in memory and will be lost when the server restarts
- The app includes fallback sample data if scraping fails
- Rate limiting (1 second delay between pages) is implemented to be respectful to target servers
- Frontend and backend are fully decoupled - frontend communicates via REST API only

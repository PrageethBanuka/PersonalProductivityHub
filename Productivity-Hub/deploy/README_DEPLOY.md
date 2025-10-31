# Productivity-Hub – Free Deployment Guide (Frontend + Backend)

This guide gets your app online for free using reliable hobby tiers:

- Frontend: Netlify (or Vercel/Cloudflare Pages)
- Backend API: Render Free Web Service (auto-sleeps when idle)
- Database: Supabase (PostgreSQL) free tier

If you skip the database step, the current SQLite database will reset on every deploy/restart. For a real app, use Supabase.

---

## 1) Prereqs

- GitHub repo for this project
- Node.js 18+
- Accounts: Netlify (or Vercel), Render, Supabase

---

## 2) Frontend (web-app) – Netlify

The project is Create React App. We added `public/_redirects` so SPA routes work.

- Build command: `npm run build`
- Publish directory: `build`

Steps:
1) Push the repo to GitHub
2) On Netlify, "New site from Git" → choose the repo → base directory `web-app`
3) Set build command `npm run build` and publish directory `build`
4) Environment variables (optional but recommended):
   - `REACT_APP_API_URL` = https://<your-backend-on-render>.onrender.com
5) Deploy. Netlify will give you a URL like https://your-app.netlify.app

Alternative: Vercel or Cloudflare Pages work out-of-the-box with the same settings. For Vercel, set framework to CRA; for CF Pages, set the same build command and add the `_redirects` file (already added).

---

## 3) Backend (backend) – Render Free Web Service

We added a `start` script so Render can run your server.

- Root: `backend`
- Start command: `npm start`
- Port: Render will provide `PORT` automatically; the app already uses it.

Steps:
1) Commit and push changes
2) On Render → New → Web Service → Connect repo → choose `backend` path
3) Runtime: Node 18+
4) Build command: `npm install`
5) Start command: `npm start`
6) Environment variables:
   - `SECRET_KEY` = a long random string
   - `MISTRAL_API_KEY` = optional (only if you want AI Insights)
   - `DATABASE_URL` = your Supabase Postgres URL (RECOMMENDED; see next section). If you skip this, the default SQLite file is used and data won’t persist.

Deploy and get a URL like https://your-backend.onrender.com. Use this in the frontend `REACT_APP_API_URL`.

---

## 4) Database – Supabase (Free, Persistent)

Your repo currently uses SQLite (`prisma/schema.prisma`). SQLite is great locally but not for cloud. Here’s how to switch to Postgres (Supabase) without changing your app code beyond Prisma config.

### A) Create a free Supabase project
- Go to supabase.com → New project → copy the "Connection string" (Postgres). It looks like:
  `postgresql://postgres:password@db.<hash>.supabase.co:5432/postgres`

### B) Update Prisma to Postgres
1) Edit `backend/prisma/schema.prisma`:
   - Change datasource to:
     
     datasource db {
       provider = "postgresql"
       url      = env("DATABASE_URL")
     }

2) Save. Do NOT change your models.

3) In terminal at `backend/` run migrations for Postgres:

   ```sh
   npm install
   npx prisma migrate dev --name init_postgres
   npx prisma generate
   ```

   This will create new migrations compatible with Postgres.

4) Seed (optional): Create any seed script or use your app to create data.

5) Set `DATABASE_URL` on Render using your Supabase connection string and redeploy the backend.

Notes:
- If Prisma asks about resetting the database, say yes (only for new DBs).
- If you had existing local data in SQLite, it won’t automatically migrate; you’d need a one-off script to copy it.

---

## 5) Wire up frontend → backend

- On Netlify (or Vercel/CF Pages), set `REACT_APP_API_URL` to your Render backend URL, then redeploy the frontend.
- The frontend is now using a dynamic API base URL (no hardcoded localhost).

---

## 6) CORS

CORS is enabled to allow all origins in the backend. For extra safety in production, set it to your frontend origin only, e.g.:

```js
// backend/index.js
const corsOptions = { origin: ["https://your-frontend.netlify.app"], credentials: true };
app.use(cors(corsOptions));
```

---

## 7) Optional: AI Insights

The `/insights` endpoints use Mistral. Set `MISTRAL_API_KEY` on Render if you want this feature. If unset, those routes will return 500.

---

## 8) Quick sanity checks

- Backend health: open https://your-backend.onrender.com → should show "Focusly API is Running".
- Auth: register/login from the frontend; verify tasks/habits load/save.
- Insights: only if `MISTRAL_API_KEY` is set.

---

## 9) Troubleshooting

- 404s on refresh → ensure `web-app/public/_redirects` exists (we added it).
- CORS errors → restrict CORS to your frontend domain or ensure `REACT_APP_API_URL` points to the right backend URL.
- Database errors → confirm `DATABASE_URL` on Render and that Prisma migrations were run against Supabase.

---

## Summary
- Frontend: Netlify (free) → set `REACT_APP_API_URL`
- Backend: Render (free) → `npm start` ready
- DB: Supabase (free Postgres) → switch Prisma to Postgres and run migrations

You can always move both frontend + backend to a single provider (e.g., Vercel with serverless functions) later, but this setup is the quickest free path now.

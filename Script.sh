python3 << 'PYEOF'
from PIL import Image
import base64

def b64(path):
    with open(path,"rb") as f:
        return "data:image/jpeg;base64,"+base64.b64encode(f.read()).decode()

B = {
    "benny_box":  b64("/home/claude/IMG_7683_food.jpg"),
    "two_tue":    b64("/home/claude/IMG_7684_food.jpg"),
    "samurai":    b64("/home/claude/IMG_7685_food.jpg"),
    "nba":        b64("/home/claude/IMG_7686_food.jpg"),
    "alfredo":    b64("/home/claude/alfredo.jpg"),
    "beeftips":   b64("/home/claude/beeftips.jpg"),
    "ricebowl":   b64("/home/claude/ricebowl.jpg"),
    "pbparfait":  b64("/home/claude/pbparfait.jpg"),
}

# Unsplash URLs for items with no real photo
U = {
    "wrap":    "https://images.unsplash.com/photo-1626700051175-6818013e1d4f?w=800&q=80&auto=format&fit=crop",
    "crispy_chicken": "https://images.unsplash.com/photo-1606755962773-d324e0a13086?w=800&q=80&auto=format&fit=crop",
    "hotdog":  "https://images.unsplash.com/photo-1612392062631-94b9fdeac438?w=800&q=80&auto=format&fit=crop",
    "nachos":  "https://images.unsplash.com/photo-1513456852971-30c0b8199d4d?w=800&q=80&auto=format&fit=crop",
    "icecream":"https://images.unsplash.com/photo-1563805042-7684c019e1cb?w=800&q=80&auto=format&fit=crop",
    "fries":   "https://images.unsplash.com/photo-1518013431117-eb1465fa5752?w=800&q=80&auto=format&fit=crop",
    "waffles": "https://images.unsplash.com/photo-1562802378-063ec186a863?w=800&q=80&auto=format&fit=crop",
    "fish":    "https://images.unsplash.com/photo-1580476262798-bddd9f4b7369?w=800&q=80&auto=format&fit=crop",
    "quesadilla": "https://images.unsplash.com/photo-1618040996337-56904b7850b9?w=800&q=80&auto=format&fit=crop",
    "mozzarella": "https://images.unsplash.com/photo-1541014741259-de529411b96a?w=800&q=80&auto=format&fit=crop",
    "shrimp":  "https://images.unsplash.com/photo-1565557623262-b51c2513a641?w=800&q=80&auto=format&fit=crop",
    "dessert_nachos": "https://images.unsplash.com/photo-1551024601-bec78aea704b?w=800&q=80&auto=format&fit=crop",
    "fried_treats": "https://images.unsplash.com/photo-1512058564366-18510be2db19?w=800&q=80&auto=format&fit=crop",
    "kids":    "https://images.unsplash.com/photo-1560781290-7dc94c0f8f4f?w=800&q=80&auto=format&fit=crop",
}

def img(src, alt):
    return f'<img class="menu-card-photo" src="{src}" alt="{alt}" loading="lazy">'

html = f'''<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Ben\'s Fresh — Port Jervis, NY</title>
<link href="https://fonts.googleapis.com/css2?family=Playfair+Display:ital,wght@0,700;0,900;1,700&family=DM+Sans:wght@300;400;500&display=swap" rel="stylesheet">
<style>
*,*::before,*::after{{box-sizing:border-box;margin:0;padding:0}}
:root{{
  --red:#C8341A;--red-dark:#8B2010;
  --cream:#F9F4EC;--cream-dark:#EDE5D4;
  --charcoal:#1E1A16;--charcoal-mid:#3A3028;
  --gold:#D4A444;--text-muted:#7A6A5A;
  --nav-height:68px;
}}
html{{scroll-behavior:smooth}}
body{{font-family:'DM Sans',sans-serif;background:var(--cream);color:var(--charcoal);overflow-x:hidden}}
#about,#menu,#reviews,#gallery,#hours,#contact{{scroll-margin-top:var(--nav-height)}}

/* NAV */
nav{{position:fixed;top:0;left:0;right:0;z-index:100;display:flex;align-items:center;justify-content:space-between;padding:1.2rem 3rem;height:var(--nav-height);background:rgba(30,26,22,0.95);backdrop-filter:blur(8px);border-bottom:1px solid rgba(212,164,68,0.25)}}
.nav-logo{{font-family:'Playfair Display',serif;font-size:1.5rem;font-weight:900;color:var(--cream);letter-spacing:-0.02em}}
.nav-logo span{{color:var(--gold)}}
.nav-links{{display:flex;gap:2rem;list-style:none}}
.nav-links a{{color:rgba(249,244,236,0.7);text-decoration:none;font-size:0.82rem;font-weight:500;letter-spacing:0.08em;text-transform:uppercase;transition:color 0.2s;position:relative;padding-bottom:2px}}
.nav-links a::after{{content:'';position:absolute;bottom:-2px;left:0;right:0;height:1px;background:var(--gold);transform:scaleX(0);transform-origin:left;transition:transform 0.25s ease}}
.nav-links a:hover,.nav-links a.active{{color:var(--gold)}}
.nav-links a:hover::after,.nav-links a.active::after{{transform:scaleX(1)}}
.nav-cta{{background:var(--red);color:var(--cream)!important;padding:0.5rem 1.3rem;border-radius:2px;transition:background 0.2s!important}}
.nav-cta:hover{{background:var(--red-dark)!important}}
.nav-cta::after{{display:none!important}}
.nav-hamburger{{display:none;flex-direction:column;justify-content:center;gap:5px;background:none;border:none;cursor:pointer;padding:4px;z-index:101}}
.nav-hamburger span{{display:block;width:24px;height:2px;background:var(--cream);border-radius:2px;transition:transform 0.3s,opacity 0.3s}}
.nav-hamburger.open span:nth-child(1){{transform:translateY(7px) rotate(45deg)}}
.nav-hamburger.open span:nth-child(2){{opacity:0}}
.nav-hamburger.open span:nth-child(3){{transform:translateY(-7px) rotate(-45deg)}}
.mobile-menu{{display:none;position:fixed;top:var(--nav-height);left:0;right:0;background:rgba(30,26,22,0.98);backdrop-filter:blur(12px);z-index:99;padding:1.5rem 2rem 2rem;border-bottom:2px solid rgba(212,164,68,0.3);transform:translateY(-10px);opacity:0;transition:transform 0.25s,opacity 0.25s;pointer-events:none}}
.mobile-menu.open{{transform:translateY(0);opacity:1;pointer-events:all}}
.mobile-menu ul{{list-style:none;display:flex;flex-direction:column}}
.mobile-menu ul li a{{display:block;color:rgba(249,244,236,0.8);text-decoration:none;font-size:1rem;font-weight:500;letter-spacing:0.08em;text-transform:uppercase;padding:0.9rem 0;border-bottom:1px solid rgba(255,255,255,0.07);transition:color 0.2s}}
.mobile-menu ul li:last-child a{{border-bottom:none}}
.mobile-menu ul li a:hover{{color:var(--gold)}}
.mobile-menu-cta{{display:block;margin-top:1.25rem;text-align:center;background:var(--red);color:var(--cream);text-decoration:none;padding:0.8rem 1.5rem;border-radius:2px;font-weight:500;font-size:0.9rem;letter-spacing:0.06em;text-transform:uppercase;transition:background 0.2s}}
.mobile-menu-cta:hover{{background:var(--red-dark)}}

/* HERO */
.hero{{min-height:100vh;background:var(--charcoal);display:grid;grid-template-columns:1fr 1fr;position:relative;overflow:hidden}}
.hero-left{{display:flex;flex-direction:column;justify-content:center;padding:8rem 4rem 6rem 5rem;position:relative;z-index:2}}
.hero-eyebrow{{font-size:0.75rem;font-weight:500;letter-spacing:0.2em;text-transform:uppercase;color:var(--gold);margin-bottom:1.5rem;display:flex;align-items:center;gap:0.75rem}}
.hero-eyebrow::before{{content:'';display:block;width:32px;height:1px;background:var(--gold)}}
.hero h1{{font-family:'Playfair Display',serif;font-size:clamp(3.5rem,6vw,5.5rem);font-weight:900;line-height:1.0;color:var(--cream);margin-bottom:1.5rem}}
.hero h1 em{{font-style:italic;color:var(--gold)}}
.hero-desc{{font-size:1.05rem;line-height:1.75;color:rgba(249,244,236,0.65);max-width:380px;margin-bottom:3rem}}
.hero-actions{{display:flex;gap:1rem;flex-wrap:wrap}}
.btn-primary{{background:var(--red);color:var(--cream);padding:0.9rem 2rem;border-radius:2px;text-decoration:none;font-weight:500;font-size:0.9rem;letter-spacing:0.04em;transition:background 0.2s,transform 0.15s;display:inline-block}}
.btn-primary:hover{{background:var(--red-dark);transform:translateY(-1px)}}
.btn-outline{{border:1px solid rgba(249,244,236,0.3);color:var(--cream);padding:0.9rem 2rem;border-radius:2px;text-decoration:none;font-weight:500;font-size:0.9rem;letter-spacing:0.04em;transition:border-color 0.2s,background 0.2s}}
.btn-outline:hover{{border-color:var(--gold);background:rgba(212,164,68,0.08)}}
.hero-stats{{display:flex;gap:2.5rem;margin-top:4rem;padding-top:2.5rem;border-top:1px solid rgba(249,244,236,0.1)}}
.hero-stat-num{{font-family:'Playfair Display',serif;font-size:2rem;font-weight:700;color:var(--gold)}}
.hero-stat-lbl{{font-size:0.75rem;text-transform:uppercase;letter-spacing:0.12em;color:rgba(249,244,236,0.45);margin-top:0.15rem}}
.hero-right{{position:relative;overflow:hidden}}
.hero-right-bg{{position:absolute;inset:0;background:linear-gradient(135deg,rgba(200,52,26,0.15) 0%,transparent 60%),repeating-linear-gradient(-45deg,rgba(212,164,68,0.03) 0px,rgba(212,164,68,0.03) 1px,transparent 1px,transparent 60px);background-color:#2A2218}}
.hero-burger-art{{position:absolute;top:50%;left:50%;transform:translate(-50%,-50%);width:340px;height:340px}}
.hero-badge{{position:absolute;bottom:3rem;right:3rem;width:110px;height:110px;border-radius:50%;background:var(--red);display:flex;flex-direction:column;align-items:center;justify-content:center;animation:spin-slow 20s linear infinite}}
.hero-badge-inner{{text-align:center;animation:spin-slow 20s linear infinite reverse}}
.hero-badge-stars{{color:var(--gold);font-size:0.7rem;letter-spacing:2px}}
.hero-badge-num{{font-family:'Playfair Display',serif;font-size:1.6rem;font-weight:900;color:var(--cream);line-height:1}}
.hero-badge-sub{{font-size:0.6rem;color:rgba(249,244,236,0.8);text-transform:uppercase;letter-spacing:0.1em}}
@keyframes spin-slow{{to{{transform:rotate(360deg)}}}}
@media(prefers-reduced-motion:reduce){{.hero-badge,.hero-badge-inner{{animation:none!important}}.marquee-track{{animation:none!important}}}}

/* MARQUEE */
.marquee-strip{{background:var(--red);padding:0.75rem 0;overflow:hidden;white-space:nowrap;border-top:3px solid var(--gold);border-bottom:3px solid var(--gold)}}
.marquee-track{{display:inline-flex;animation:marquee 35s linear infinite}}
.marquee-item{{display:inline-flex;align-items:center;gap:1.5rem;padding:0 2rem;font-size:0.8rem;font-weight:500;letter-spacing:0.12em;text-transform:uppercase;color:var(--cream)}}
.marquee-dot{{width:5px;height:5px;border-radius:50%;background:var(--gold);flex-shrink:0}}
@keyframes marquee{{from{{transform:translateX(0)}}to{{transform:translateX(-50%)}}}}

/* ABOUT */
.about{{display:grid;grid-template-columns:1fr 1fr}}
.about-visual{{background:var(--charcoal-mid);display:flex;align-items:center;justify-content:center;padding:6rem 4rem;position:relative;overflow:hidden}}
.about-visual::before{{content:'';position:absolute;top:-40%;left:-20%;width:300px;height:300px;border-radius:50%;background:rgba(200,52,26,0.15)}}
.about-grid-art{{position:relative;z-index:1;display:grid;grid-template-columns:1fr 1fr;gap:1rem;max-width:340px}}
.about-grid-card{{background:rgba(249,244,236,0.06);border:1px solid rgba(212,164,68,0.2);border-radius:4px;padding:1.5rem 1.25rem;text-align:center}}
.about-grid-card.accent{{background:var(--red);border-color:var(--red)}}
.about-grid-icon{{font-size:2rem;margin-bottom:0.5rem}}
.about-grid-lbl{{font-size:0.75rem;text-transform:uppercase;letter-spacing:0.12em;color:rgba(249,244,236,0.6)}}
.about-grid-card.accent .about-grid-lbl{{color:rgba(249,244,236,0.85)}}
.about-content{{padding:6rem 5rem;background:var(--cream);display:flex;flex-direction:column;justify-content:center}}
.section-eyebrow{{font-size:0.72rem;font-weight:500;letter-spacing:0.2em;text-transform:uppercase;color:var(--red);margin-bottom:1rem;display:flex;align-items:center;gap:0.75rem}}
.section-eyebrow::before{{content:'';display:block;width:24px;height:1.5px;background:var(--red)}}
.section-title{{font-family:'Playfair Display',serif;font-size:clamp(2rem,3.5vw,3rem);font-weight:900;line-height:1.15;margin-bottom:1.5rem}}
.section-title em{{font-style:italic;color:var(--red)}}
.about-body{{font-size:1rem;line-height:1.85;color:var(--text-muted);margin-bottom:1rem}}
.info-grid{{display:grid;grid-template-columns:1fr 1fr;gap:1.25rem;margin-top:2.5rem}}
.info-card{{padding:1.25rem;background:var(--cream-dark);border-radius:4px;border-left:3px solid var(--gold)}}
.info-card-label{{font-size:0.7rem;text-transform:uppercase;letter-spacing:0.15em;color:var(--text-muted);margin-bottom:0.35rem}}
.info-card-value{{font-size:0.95rem;font-weight:500;color:var(--charcoal);line-height:1.45}}

/* MENU */
.menu-section{{background:var(--charcoal);padding:8rem 5rem}}
.menu-header{{text-align:center;margin-bottom:4rem}}
.menu-header .section-eyebrow{{justify-content:center}}
.menu-header .section-eyebrow::before{{display:none}}
.menu-tabs{{display:flex;justify-content:center;gap:0.5rem;margin-bottom:3rem;flex-wrap:wrap}}
.menu-tab{{padding:0.5rem 1.4rem;border-radius:2px;background:transparent;border:1px solid rgba(249,244,236,0.2);color:rgba(249,244,236,0.6);font-size:0.8rem;font-weight:500;letter-spacing:0.08em;text-transform:uppercase;cursor:pointer;transition:all 0.2s}}
.menu-tab.active,.menu-tab:hover{{background:var(--red);border-color:var(--red);color:var(--cream)}}
.menu-grid{{display:grid;grid-template-columns:repeat(3,1fr);gap:1.5rem}}
.menu-card{{background:rgba(249,244,236,0.04);border:1px solid rgba(249,244,236,0.08);border-radius:8px;transition:border-color 0.2s,transform 0.2s;display:none;overflow:hidden}}
.menu-card.visible{{display:block}}
.menu-card:hover{{border-color:rgba(212,164,68,0.4);transform:translateY(-3px)}}
.menu-card-photo{{width:100%;aspect-ratio:4/3;object-fit:cover;display:block}}
.menu-card-body{{padding:1.1rem 1.35rem 1.35rem}}
.menu-card-top{{display:flex;justify-content:space-between;align-items:flex-start;margin-bottom:0.45rem}}
.menu-card-name{{font-family:'Playfair Display',serif;font-size:1rem;font-weight:700;color:var(--cream);line-height:1.3}}
.menu-card-price{{font-size:1rem;font-weight:700;color:var(--gold);white-space:nowrap;margin-left:0.5rem}}
.menu-card-desc{{font-size:0.81rem;line-height:1.6;color:rgba(249,244,236,0.5);margin-top:0.3rem}}
.menu-badge{{display:inline-block;font-size:0.58rem;letter-spacing:0.1em;text-transform:uppercase;padding:0.18rem 0.55rem;border-radius:2px;margin-bottom:0.45rem;background:rgba(200,52,26,0.35);color:rgba(249,244,236,0.9)}}
.menu-card-subtitle{{font-size:0.68rem;text-transform:uppercase;letter-spacing:0.15em;color:rgba(212,164,68,0.75);margin-bottom:0.45rem}}

/* GALLERY */
.gallery-section{{background:var(--charcoal);padding:8rem 5rem}}
.gallery-header{{text-align:center;margin-bottom:4rem}}
.gallery-header .section-eyebrow{{justify-content:center}}
.gallery-header .section-eyebrow::before{{display:none}}
.gallery-mosaic{{display:grid;grid-template-columns:repeat(12,1fr);grid-template-rows:300px 300px;gap:12px}}
.gallery-item{{overflow:hidden;border-radius:8px;position:relative;background:var(--charcoal-mid)}}
.gallery-item img{{width:100%;height:100%;object-fit:cover;transition:transform 0.5s ease;display:block}}
.gallery-item:hover img{{transform:scale(1.06)}}
.gallery-item .gallery-label{{position:absolute;bottom:0;left:0;right:0;padding:1rem 1.25rem 0.9rem;background:linear-gradient(to top,rgba(20,16,12,0.92) 0%,transparent 100%);color:var(--cream);font-size:0.8rem;font-weight:600;letter-spacing:0.05em}}
.gallery-item .gallery-label span{{color:var(--gold);display:block;font-size:0.68rem;margin-top:0.1rem;opacity:0.85;font-weight:400}}
.gi-1{{grid-column:1/5;grid-row:1/2}}
.gi-2{{grid-column:5/9;grid-row:1/2}}
.gi-3{{grid-column:9/13;grid-row:1/2}}
.gi-4{{grid-column:1/5;grid-row:2/3}}
.gi-5{{grid-column:5/9;grid-row:2/3}}
.gi-6{{grid-column:9/13;grid-row:2/3}}
.gallery-cta{{text-align:center;margin-top:2rem;color:rgba(249,244,236,0.45);font-size:0.85rem}}
.gallery-cta a{{color:var(--gold);text-decoration:none;font-weight:500;border-bottom:1px solid rgba(212,164,68,0.4)}}

/* REVIEWS */
.reviews-section{{background:var(--cream-dark);padding:8rem 5rem}}
.reviews-header{{text-align:center;margin-bottom:4rem}}
.reviews-header .section-eyebrow{{justify-content:center}}
.reviews-header .section-eyebrow::before{{display:none}}
.reviews-grid{{display:grid;grid-template-columns:repeat(3,1fr);gap:1.5rem}}
.review-card{{background:var(--cream);border:1px solid rgba(30,26,22,0.08);border-radius:6px;padding:2rem;position:relative}}
.review-stars{{color:var(--gold);font-size:0.85rem;letter-spacing:2px;margin-bottom:1rem}}
.review-text{{font-size:0.95rem;line-height:1.75;color:var(--charcoal);margin-bottom:1.5rem;font-style:italic}}
.review-author{{font-size:0.8rem;font-weight:500;color:var(--text-muted);text-transform:uppercase;letter-spacing:0.1em}}
.review-quote-mark{{position:absolute;top:1.25rem;right:1.5rem;font-family:'Playfair Display',serif;font-size:5rem;font-weight:900;color:rgba(200,52,26,0.08);line-height:1}}
.rating-showcase{{display:flex;align-items:center;justify-content:center;gap:3rem;margin-bottom:4rem;padding:2.5rem;background:var(--charcoal);border-radius:6px}}
.rating-big{{font-family:'Playfair Display',serif;font-size:5rem;font-weight:900;color:var(--gold);line-height:1}}
.rating-right{{border-left:1px solid rgba(249,244,236,0.15);padding-left:2.5rem}}
.rating-stars-lg{{color:var(--gold);font-size:1.2rem;letter-spacing:3px}}
.rating-count{{font-size:0.85rem;color:rgba(249,244,236,0.5);margin-top:0.5rem}}

/* HOURS */
.hours-section{{background:var(--cream);padding:8rem 5rem}}
.hours-inner{{max-width:900px;margin:0 auto;display:grid;grid-template-columns:1fr 1fr;gap:5rem;align-items:center}}
.hours-title-block .section-title{{margin-bottom:1.5rem}}
.hours-note{{font-size:0.9rem;color:var(--text-muted);line-height:1.7}}
.hours-row{{display:flex;justify-content:space-between;align-items:center;padding:0.85rem 0;border-bottom:1px solid var(--cream-dark)}}
.hours-row.today{{background:rgba(200,52,26,0.05);margin:0 -0.5rem;padding-left:0.5rem;padding-right:0.5rem;border-radius:3px}}
.hours-row.today .hours-day{{color:var(--red);font-weight:700}}
.hours-row.today .hours-day::after{{content:' ← Today';font-size:0.65rem;font-weight:500;color:var(--red);opacity:0.7;letter-spacing:0.08em}}
.hours-day{{font-size:0.85rem;font-weight:500;color:var(--charcoal)}}
.hours-time{{font-size:0.85rem;color:#2A7A4A;font-weight:500}}
.hours-late{{color:#1A5A9A}}

/* CTA */
.cta-section{{background:var(--red);padding:8rem 5rem;display:grid;grid-template-columns:1fr 1fr;gap:6rem;align-items:center}}
.cta-left .section-title{{color:var(--cream);margin-bottom:1.25rem}}
.cta-left .section-title em{{color:var(--gold)}}
.cta-left p{{color:rgba(249,244,236,0.75);line-height:1.75;font-size:1rem}}
.cta-right{{display:flex;flex-direction:column;gap:1.5rem}}
.contact-item{{display:flex;align-items:flex-start;gap:1.25rem;padding:1.5rem;background:rgba(249,244,236,0.1);border-radius:4px;border:1px solid rgba(249,244,236,0.15)}}
.contact-icon{{width:44px;height:44px;border-radius:50%;background:rgba(249,244,236,0.15);flex-shrink:0;display:flex;align-items:center;justify-content:center;font-size:1.1rem}}
.contact-label{{font-size:0.7rem;text-transform:uppercase;letter-spacing:0.15em;color:rgba(249,244,236,0.55);margin-bottom:0.25rem}}
.contact-value{{font-size:0.95rem;font-weight:500;color:var(--cream)}}
.contact-value a{{color:inherit;text-decoration:none}}
.contact-value a:hover{{text-decoration:underline}}

/* FOOTER */
footer{{background:var(--charcoal);padding:3rem 5rem;display:flex;justify-content:space-between;align-items:center;border-top:1px solid rgba(212,164,68,0.2)}}
.footer-logo{{font-family:'Playfair Display',serif;font-size:1.3rem;font-weight:900;color:var(--cream)}}
.footer-logo span{{color:var(--gold)}}
.footer-text{{font-size:0.8rem;color:rgba(249,244,236,0.4)}}
.footer-socials{{display:flex;gap:1rem}}
.footer-social{{width:36px;height:36px;border-radius:50%;border:1px solid rgba(249,244,236,0.2);display:flex;align-items:center;justify-content:center;color:rgba(249,244,236,0.5);text-decoration:none;font-size:0.8rem;transition:border-color 0.2s,color 0.2s}}
.footer-social:hover{{border-color:var(--gold);color:var(--gold)}}
.back-to-top{{position:fixed;bottom:2rem;right:2rem;z-index:90;width:44px;height:44px;border-radius:50%;background:var(--red);border:none;cursor:pointer;display:flex;align-items:center;justify-content:center;color:var(--cream);font-size:1.1rem;box-shadow:0 4px 16px rgba(0,0,0,0.3);opacity:0;transform:translateY(10px);transition:opacity 0.3s,transform 0.3s,background 0.2s;pointer-events:none}}
.back-to-top.visible{{opacity:1;transform:translateY(0);pointer-events:all}}
.back-to-top:hover{{background:var(--red-dark)}}

/* RESPONSIVE */
@media(max-width:1100px){{
  .menu-grid{{grid-template-columns:repeat(2,1fr)}}
  .gallery-mosaic{{grid-template-columns:repeat(2,1fr);grid-template-rows:auto}}
  .gi-1,.gi-2,.gi-3,.gi-4,.gi-5,.gi-6{{grid-column:auto;grid-row:auto;height:220px}}
}}
@media(max-width:900px){{
  nav{{padding:1rem 1.5rem}}
  .nav-links{{display:none}}
  .nav-hamburger{{display:flex}}
  .mobile-menu{{display:block}}
  .hero{{grid-template-columns:1fr}}
  .hero-right{{display:none}}
  .hero-left{{padding:8rem 2rem 5rem}}
  .about{{grid-template-columns:1fr}}
  .about-visual{{display:none}}
  .about-content{{padding:4rem 2rem}}
  .menu-section,.reviews-section,.cta-section,.hours-section,.gallery-section{{padding:5rem 2rem}}
  .menu-grid{{grid-template-columns:1fr}}
  .reviews-grid{{grid-template-columns:1fr}}
  .hours-inner{{grid-template-columns:1fr;gap:3rem}}
  .cta-section{{grid-template-columns:1fr;gap:3rem}}
  footer{{flex-direction:column;gap:1.5rem;text-align:center;padding:2rem}}
  .gallery-mosaic{{grid-template-columns:1fr 1fr;grid-template-rows:auto}}
  .gi-1,.gi-2,.gi-3,.gi-4,.gi-5,.gi-6{{grid-column:auto;grid-row:auto;height:180px}}
}}
@media(max-width:480px){{
  .gallery-mosaic{{grid-template-columns:1fr}}
  .gi-1,.gi-2,.gi-3,.gi-4,.gi-5,.gi-6{{height:220px}}
}}
</style>
</head>
<body>

<nav>
  <div class="nav-logo">Ben\'s <span>Fresh</span></div>
  <ul class="nav-links">
    <li><a href="#about">About</a></li>
    <li><a href="#menu">Menu</a></li>
    <li><a href="#gallery">Photos</a></li>
    <li><a href="#reviews">Reviews</a></li>
    <li><a href="#hours">Hours</a></li>
    <li><a href="#contact" class="nav-cta">Visit Us</a></li>
  </ul>
  <button class="nav-hamburger" aria-label="Open menu" aria-expanded="false">
    <span></span><span></span><span></span>
  </button>
</nav>

<div class="mobile-menu" id="mobileMenu" aria-hidden="true">
  <ul>
    <li><a href="#about">About</a></li>
    <li><a href="#menu">Menu</a></li>
    <li><a href="#gallery">Photos</a></li>
    <li><a href="#reviews">Reviews</a></li>
    <li><a href="#hours">Hours</a></li>
  </ul>
  <a href="#contact" class="mobile-menu-cta">Visit Us</a>
</div>

<!-- HERO -->
<section class="hero">
  <div class="hero-left">
    <p class="hero-eyebrow">Port Jervis, New York · Since 2016</p>
    <h1>Fresh. <em>Bold.</em> Done Right.</h1>
    <p class="hero-desc">Burgers, hot dogs, comfort food, ice cream and desserts — all made fresh daily by Chef Bobby and crew. A Port Jervis staple since 2016.</p>
    <div class="hero-actions">
      <a href="#menu" class="btn-primary">View Our Menu</a>
      <a href="tel:+18458569760" class="btn-outline">Call to Order</a>
    </div>
    <div class="hero-stats">
      <div><div class="hero-stat-num">4.4★</div><div class="hero-stat-lbl">Google Rating</div></div>
      <div><div class="hero-stat-num">1,500+</div><div class="hero-stat-lbl">Reviews</div></div>
      <div><div class="hero-stat-num">Since \'16</div><div class="hero-stat-lbl">Port Jervis Staple</div></div>
    </div>
  </div>
  <div class="hero-right">
    <div class="hero-right-bg"></div>
    <svg class="hero-burger-art" viewBox="0 0 340 340" fill="none" xmlns="http://www.w3.org/2000/svg">
      <ellipse cx="170" cy="100" rx="120" ry="70" fill="#C8341A" opacity="0.9"/>
      <ellipse cx="170" cy="100" rx="100" ry="52" fill="#D4A444" opacity="0.6"/>
      <path d="M55 155 Q90 135 130 150 Q155 138 170 152 Q195 136 220 150 Q255 138 285 155 Q280 168 255 170 Q220 158 200 168 Q185 158 170 167 Q155 157 140 167 Q115 158 85 170 Q60 168 55 155Z" fill="#3A7A2A" opacity="0.85"/>
      <path d="M55 192 L285 192 L295 205 L285 218 L55 218 L45 205 Z" fill="#D4A444" opacity="0.8"/>
      <ellipse cx="170" cy="232" rx="115" ry="22" fill="#3A2818" opacity="0.95"/>
      <ellipse cx="170" cy="255" rx="120" ry="28" fill="#D4A444" opacity="0.9"/>
    </svg>
    <div class="hero-badge"><div class="hero-badge-inner"><div class="hero-badge-stars">★★★★</div><div class="hero-badge-num">4.4</div><div class="hero-badge-sub">Rated</div></div></div>
  </div>
</section>

<div class="marquee-strip" aria-hidden="true">
  <div class="marquee-track">
    <span class="marquee-item"><span class="marquee-dot"></span>Burgers</span>
    <span class="marquee-item"><span class="marquee-dot"></span>Hot Dogs</span>
    <span class="marquee-item"><span class="marquee-dot"></span>Ice Cream</span>
    <span class="marquee-item"><span class="marquee-dot"></span>Wraps</span>
    <span class="marquee-item"><span class="marquee-dot"></span>Quesadillas</span>
    <span class="marquee-item"><span class="marquee-dot"></span>Desserts</span>
    <span class="marquee-item"><span class="marquee-dot"></span>Fresh Daily</span>
    <span class="marquee-item"><span class="marquee-dot"></span>Port Jervis NY</span>
    <span class="marquee-item"><span class="marquee-dot"></span>Burgers</span>
    <span class="marquee-item"><span class="marquee-dot"></span>Hot Dogs</span>
    <span class="marquee-item"><span class="marquee-dot"></span>Ice Cream</span>
    <span class="marquee-item"><span class="marquee-dot"></span>Wraps</span>
    <span class="marquee-item"><span class="marquee-dot"></span>Quesadillas</span>
    <span class="marquee-item"><span class="marquee-dot"></span>Desserts</span>
    <span class="marquee-item"><span class="marquee-dot"></span>Fresh Daily</span>
    <span class="marquee-item"><span class="marquee-dot"></span>Port Jervis NY</span>
  </div>
</div>

<!-- ABOUT -->
<section class="about" id="about">
  <div class="about-visual">
    <div class="about-grid-art">
      <div class="about-grid-card"><div class="about-grid-icon">🍔</div><div class="about-grid-lbl">Burgers</div></div>
      <div class="about-grid-card"><div class="about-grid-icon">🍦</div><div class="about-grid-lbl">Ice Cream</div></div>
      <div class="about-grid-card accent"><div class="about-grid-icon">🌯</div><div class="about-grid-lbl">Wraps</div></div>
      <div class="about-grid-card"><div class="about-grid-icon">🌮</div><div class="about-grid-lbl">Quesadillas</div></div>
    </div>
  </div>
  <div class="about-content">
    <p class="section-eyebrow">Our Story</p>
    <h2 class="section-title">Real food, made <em>fresh</em> every day</h2>
    <p class="about-body">Ben\'s Fresh has been proudly serving Port Jervis since 2016. Chef Bobby and the crew are committed to delivering the freshest ingredients and continually creating new and exciting specials. The menu is big, bold, and constantly evolving — burgers, hot dogs, comfort food, creative wraps, quesadillas, ice cream, and some of the most unique desserts you\'ll find anywhere.</p>
    <p class="about-body">Outdoor seating, a large parking lot, a kids\' menu, and a welcoming family atmosphere make it a must-stop whether you\'re a local or just passing through on I-84.</p>
    <div class="info-grid">
      <div class="info-card"><div class="info-card-label">Location</div><div class="info-card-value">33 E Main St<br>Port Jervis, NY 12771</div></div>
      <div class="info-card"><div class="info-card-label">Phone</div><div class="info-card-value"><a href="tel:+18458569760" style="color:inherit;text-decoration:none">(845) 856-9760</a></div></div>
      <div class="info-card"><div class="info-card-label">Payments</div><div class="info-card-value">Visa, Mastercard, Debit &amp; NFC Pay</div></div>
      <div class="info-card"><div class="info-card-label">Options</div><div class="info-card-value">Dine-In, Takeout &amp; Outdoor Seating</div></div>
    </div>
  </div>
</section>

<!-- MENU -->
<section class="menu-section" id="menu">
  <div class="menu-header">
    <p class="section-eyebrow" style="justify-content:center">What We Serve</p>
    <h2 class="section-title" style="color:var(--cream)">Our <em style="color:var(--gold)">Menu</em></h2>
    <p style="color:rgba(249,244,236,0.4);font-size:0.82rem;margin-top:0.5rem">Combos include fresh-cut fries &amp; drink · Call for current pricing</p>
  </div>
  <div class="menu-tabs">
    <button class="menu-tab active" data-cat="topSellers">Top Sellers</button>
    <button class="menu-tab" data-cat="bowls">Bowls &amp; Pasta</button>
    <button class="menu-tab" data-cat="starters">Starters</button>
    <button class="menu-tab" data-cat="nachosFries">Nachos &amp; Fries</button>
    <button class="menu-tab" data-cat="quesadillas">Quesadillas</button>
    <button class="menu-tab" data-cat="desserts">Desserts &amp; Ice Cream</button>
    <button class="menu-tab" data-cat="kids">Kids Menu</button>
  </div>
  <div class="menu-grid">

    <!-- ── TOP SELLERS ── -->
    <div class="menu-card visible" data-cat="topSellers">
      {img(B["benny_box"], "The Benny Box — burger, tenders, fries, drink")}
      <div class="menu-card-body">
        <div class="menu-badge">Most Ordered</div>
        <div class="menu-card-top"><div class="menu-card-name">Benny Burger Combo</div><div class="menu-card-price">~$10–13</div></div>
        <div class="menu-card-desc">100% pure fresh beef, custom ground, cooked to order on a non-GMO toasted potato bun. Includes fresh-cut fries &amp; drink. Top with ketchup, pickle, mustard, onion, mayo, or Benny Sauce — free!</div>
      </div>
    </div>

    <div class="menu-card visible" data-cat="topSellers">
      {img(U["wrap"], "Crispy chicken wrap with fresh-cut fries")}
      <div class="menu-card-body">
        <div class="menu-badge">Fan Favorite</div>
        <div class="menu-card-top"><div class="menu-card-name">Chicken Wrap Combo</div><div class="menu-card-price">~$12–14</div></div>
        <div class="menu-card-desc">Crispy hand-breaded chicken in a wrap with your choice of toppings. Combo includes fresh-cut fries &amp; drink.</div>
      </div>
    </div>

    <div class="menu-card visible" data-cat="topSellers">
      {img(U["crispy_chicken"], "Crispy fried chicken sandwich")}
      <div class="menu-card-body">
        <div class="menu-card-top"><div class="menu-card-name">Crispy Chicken Sandwich</div><div class="menu-card-price">~$11–13</div></div>
        <div class="menu-card-desc">Hand-breaded, super fresh and juicy crispy chicken on a great roll. Comes with a generous portion of fries.</div>
      </div>
    </div>

    <div class="menu-card visible" data-cat="topSellers">
      {img(U["hotdog"], "Classic hot dog")}
      <div class="menu-card-body">
        <div class="menu-card-top"><div class="menu-card-name">Hot Dog Combo</div><div class="menu-card-price">~$8–11</div></div>
        <div class="menu-card-desc">A classic done right — Benny Dog or Backyard Dog style. Combo includes fries &amp; drink.</div>
      </div>
    </div>

    <div class="menu-card visible" data-cat="topSellers">
      {img(U["waffles"], "Chicken and waffles")}
      <div class="menu-card-body">
        <div class="menu-card-top"><div class="menu-card-name">Chicken &amp; Waffles</div><div class="menu-card-price">~$13–15</div></div>
        <div class="menu-card-desc">A comfort food favorite — crispy chicken paired with golden waffles. One of Chef Bobby\'s signature dishes.</div>
      </div>
    </div>

    <div class="menu-card visible" data-cat="topSellers">
      {img(U["fish"], "Fish and chips")}
      <div class="menu-card-body">
        <div class="menu-card-top"><div class="menu-card-name">Fish &amp; Chips</div><div class="menu-card-price">~$13–16</div></div>
        <div class="menu-card-desc">Fresh fish in a crispy batter, served with hand-cut fries. A hearty, satisfying meal.</div>
      </div>
    </div>

    <!-- ── BOWLS & PASTA ── -->
    <div class="menu-card" data-cat="bowls">
      {img(B["alfredo"], "Cheesy Vodka Chicken Alfredo — penne, hand-breaded chicken, melty mozzarella")}
      <div class="menu-card-body">
        <div class="menu-badge">Must Try</div>
        <div class="menu-card-top"><div class="menu-card-name">Cheesy Vodka Chicken Alfredo</div><div class="menu-card-price">~$14–17</div></div>
        <div class="menu-card-desc">Penne in a creamy vodka alfredo sauce with fresh hand-breaded chicken, topped with melty mozzarella. Served with cheesy garlic bread.</div>
      </div>
    </div>

    <div class="menu-card" data-cat="bowls">
      {img(B["beeftips"], "Tender Beef Tips over Egg Noodles")}
      <div class="menu-card-body">
        <div class="menu-badge">Fan Favorite</div>
        <div class="menu-card-top"><div class="menu-card-name">Beef Tips over Egg Noodles</div><div class="menu-card-price">~$14–17</div></div>
        <div class="menu-card-desc">Tender braised beef tips in a rich savory sauce served over a bed of soft egg noodles. Comfort food at its best.</div>
      </div>
    </div>

    <div class="menu-card" data-cat="bowls">
      {img(B["ricebowl"], "Street Corn Chicken Rice Bowl")}
      <div class="menu-card-body">
        <div class="menu-card-top"><div class="menu-card-name">Street Corn Chicken Rice Bowl</div><div class="menu-card-price">~$13–15</div></div>
        <div class="menu-card-desc">Grilled chicken, street corn, rice, melted cheese, red onion, and a creamy drizzle. Bold flavor in every bite.</div>
      </div>
    </div>

    <div class="menu-card" data-cat="bowls">
      {img(B["alfredo"], "Crispy Chicken Mac & Cheese Melt")}
      <div class="menu-card-body">
        <div class="menu-card-top"><div class="menu-card-name">Crispy Chicken Mac &amp; Cheese Melt</div><div class="menu-card-price">~$13–15</div></div>
        <div class="menu-card-desc">Crispy chicken meets creamy mac and cheese in one glorious melt. A Ben\'s Fresh original.</div>
      </div>
    </div>

    <!-- ── STARTERS ── -->
    <div class="menu-card" data-cat="starters">
      {img(U["mozzarella"], "Mozzarella sticks golden fried")}
      <div class="menu-card-body">
        <div class="menu-card-top"><div class="menu-card-name">Mozzarella Sticks</div><div class="menu-card-price">~$7–9</div></div>
        <div class="menu-card-desc">Golden, gooey, and perfectly fried. A classic starter done right.</div>
      </div>
    </div>

    <div class="menu-card" data-cat="starters">
      {img(U["shrimp"], "Buffalo shrimp crispy")}
      <div class="menu-card-body">
        <div class="menu-badge">Must Try</div>
        <div class="menu-card-top"><div class="menu-card-name">Buffalo Chicken Rangoons</div><div class="menu-card-price">~$8–10</div></div>
        <div class="menu-card-desc">Spicy, crispy, and totally unique. Buffalo chicken stuffed in a crispy rangoon shell.</div>
      </div>
    </div>

    <div class="menu-card" data-cat="starters">
      {img(U["shrimp"], "Buffalo shrimp")}
      <div class="menu-card-body">
        <div class="menu-card-top"><div class="menu-card-name">Buffalo Shrimp</div><div class="menu-card-price">~$10–12</div></div>
        <div class="menu-card-desc">Crispy shrimp tossed in bold buffalo sauce. Great to share or keep all to yourself.</div>
      </div>
    </div>

    <div class="menu-card" data-cat="starters">
      {img(U["mozzarella"], "Fried cheese curds")}
      <div class="menu-card-body">
        <div class="menu-card-top"><div class="menu-card-name">Fried Cheese Curds</div><div class="menu-card-price">~$7–9</div></div>
        <div class="menu-card-desc">Irresistible fried cheese curds — melty inside, crispy outside.</div>
      </div>
    </div>

    <div class="menu-card" data-cat="starters">
      {img(U["mozzarella"], "Jalapeño cheddar bites")}
      <div class="menu-card-body">
        <div class="menu-card-top"><div class="menu-card-name">Jalapeño Cheddar Bites</div><div class="menu-card-price">~$7–9</div></div>
        <div class="menu-card-desc">Spicy jalapeño meets sharp cheddar in a perfectly fried bite.</div>
      </div>
    </div>

    <div class="menu-card" data-cat="starters">
      {img(U["mozzarella"], "Mac and cheese bites")}
      <div class="menu-card-body">
        <div class="menu-card-top"><div class="menu-card-name">Mac &amp; Cheese Bites</div><div class="menu-card-price">~$7–9</div></div>
        <div class="menu-card-desc">Comfort food taken to the next level — mac &amp; cheese in crispy bite-sized form.</div>
      </div>
    </div>

    <!-- ── NACHOS & FRIES ── -->
    <div class="menu-card" data-cat="nachosFries">
      {img(U["nachos"], "Buffalo chicken nachos loaded")}
      <div class="menu-card-body">
        <div class="menu-card-subtitle">Fresh Made Nachos</div>
        <div class="menu-card-top"><div class="menu-card-name">Buffalo Chicken Nachos</div><div class="menu-card-price">~$12–14</div></div>
        <div class="menu-card-desc">Loaded nachos with crispy buffalo chicken. Bold flavor in every bite.</div>
      </div>
    </div>

    <div class="menu-card" data-cat="nachosFries">
      {img(U["nachos"], "BBQ chicken nachos")}
      <div class="menu-card-body">
        <div class="menu-card-subtitle">Fresh Made Nachos</div>
        <div class="menu-card-top"><div class="menu-card-name">BBQ Chicken Nachos</div><div class="menu-card-price">~$12–14</div></div>
        <div class="menu-card-desc">Smoky BBQ chicken piled high on fresh nachos with all the fixings.</div>
      </div>
    </div>

    <div class="menu-card" data-cat="nachosFries">
      {img(U["nachos"], "Chicken bacon ranch nachos")}
      <div class="menu-card-body">
        <div class="menu-card-subtitle">Fresh Made Nachos</div>
        <div class="menu-card-top"><div class="menu-card-name">Chicken Bacon Ranch Nachos</div><div class="menu-card-price">~$13–15</div></div>
        <div class="menu-card-desc">The crowd favorite nacho combo — chicken, bacon, and creamy ranch.</div>
      </div>
    </div>

    <div class="menu-card" data-cat="nachosFries">
      {img(U["fries"], "Fresh hand-cut fries")}
      <div class="menu-card-body">
        <div class="menu-card-subtitle">Specialty Fries</div>
        <div class="menu-card-top"><div class="menu-card-name">Fresh Cut Fries</div><div class="menu-card-price">$4–7</div></div>
        <div class="menu-card-desc">Hand-cut and seasoned perfectly. Reviewers say a small can feed three people.</div>
      </div>
    </div>

    <div class="menu-card" data-cat="nachosFries">
      {img(U["fries"], "Specialty loaded fries")}
      <div class="menu-card-body">
        <div class="menu-card-subtitle">Specialty Fries</div>
        <div class="menu-card-top"><div class="menu-card-name">Loaded Specialty Fries</div><div class="menu-card-price">$8–12</div></div>
        <div class="menu-card-desc">Cheese Fries, Cheddar Bacon Ranch, Chili Cheese, Bacon Mac &amp; Cheese, or Disco Fries.</div>
      </div>
    </div>

    <!-- ── QUESADILLAS ── -->
    <div class="menu-card" data-cat="quesadillas">
      {img(U["quesadilla"], "Classic quesadilla")}
      <div class="menu-card-body">
        <div class="menu-card-top"><div class="menu-card-name">Classic Quesadillas</div><div class="menu-card-price">$9–12</div></div>
        <div class="menu-card-desc">Cheese, Buffalo Chicken, BBQ Chicken, Veggie, or Chicken Bacon Ranch.</div>
      </div>
    </div>

    <div class="menu-card" data-cat="quesadillas">
      {img(B["samurai"], "Samurai Quesadilla — Bang Bang Chicken & Shrimp with melty cheese")}
      <div class="menu-card-body">
        <div class="menu-badge">Fan Favorite</div>
        <div class="menu-card-top"><div class="menu-card-name">Samurai Quesadilla</div><div class="menu-card-price">$14–16</div></div>
        <div class="menu-card-desc">Bang Bang Chicken &amp; Shrimp tossed in our signature sauce with melty cheese, red onion, and banana peppers. A crowd stopper.</div>
      </div>
    </div>

    <div class="menu-card" data-cat="quesadillas">
      {img(U["quesadilla"], "Specialty quesadilla")}
      <div class="menu-card-body">
        <div class="menu-badge">Popular</div>
        <div class="menu-card-top"><div class="menu-card-name">More Specialty Quesadillas</div><div class="menu-card-price">$12–16</div></div>
        <div class="menu-card-desc">Cheesesteak, Crispy Shrimp, Wild West, Double Bacon Cheeseburger, or Birria.</div>
      </div>
    </div>

    <div class="menu-card" data-cat="quesadillas">
      {img(U["quesadilla"], "Signature quesadilla")}
      <div class="menu-card-body">
        <div class="menu-card-top"><div class="menu-card-name">Signature Quesadillas</div><div class="menu-card-price">$14–18</div></div>
        <div class="menu-card-desc">Cheesesteak Alfredo, Wyatt Earp, The Drunken Sailor, and The Gruber.</div>
      </div>
    </div>

    <!-- ── DESSERTS ── -->
    <div class="menu-card" data-cat="desserts">
      {img(B["pbparfait"], "Peanut Butter Parfait — vanilla soft serve, Reese's Pieces, Butterfinger, PB sauce")}
      <div class="menu-card-body">
        <div class="menu-badge">Must Have</div>
        <div class="menu-card-top"><div class="menu-card-name">Peanut Butter Parfait</div><div class="menu-card-price">$8–12</div></div>
        <div class="menu-card-desc">Layers of creamy vanilla soft serve, Peanut Butter Cups, Reese\'s Pieces, Butterfinger, and PB sauce. Absolutely loaded.</div>
      </div>
    </div>

    <div class="menu-card" data-cat="desserts">
      {img(B["nba"], "Brunson Crunch Parfait — Ben's Fresh ice cream dessert")}
      <div class="menu-card-body">
        <div class="menu-badge">Fan Favorite</div>
        <div class="menu-card-top"><div class="menu-card-name">Ice Cream Parfaits</div><div class="menu-card-price">$8–14</div></div>
        <div class="menu-card-desc">Cannoli, Peanut Butter, Thin Mint Crunch, Cookie Monster, Strawberry Shortcake, M&amp;M Cookie Dough, Birthday Crunch, Caramel Brownie Cheesecake, and more.</div>
      </div>
    </div>

    <div class="menu-card" data-cat="desserts">
      {img(U["dessert_nachos"], "Funnel cake fries sweet dessert")}
      <div class="menu-card-body">
        <div class="menu-badge">Port Jervis Legend</div>
        <div class="menu-card-top"><div class="menu-card-name">Funnel Cake Fries</div><div class="menu-card-price">$6–9</div></div>
        <div class="menu-card-desc">Sweet, crispy, and totally addictive. Regulars call them one of a kind.</div>
      </div>
    </div>

    <div class="menu-card" data-cat="desserts">
      {img(U["fried_treats"], "Deep fried oreos and treats")}
      <div class="menu-card-body">
        <div class="menu-card-top"><div class="menu-card-name">Deep Fried Treats</div><div class="menu-card-price">$6–10</div></div>
        <div class="menu-card-desc">Deep Fried Oreos, Deep Fried Twinkie Sundae, and rotating specials. Pure indulgence.</div>
      </div>
    </div>

    <div class="menu-card" data-cat="desserts">
      {img(U["icecream"], "Hard ice cream scoops dozens of flavors")}
      <div class="menu-card-body">
        <div class="menu-card-top"><div class="menu-card-name">Hard Ice Cream Scoops</div><div class="menu-card-price">$3–6</div></div>
        <div class="menu-card-desc">Dozens of flavors: Panda Paws, Cookie Dough, Banana Cream Pie, Apple Pie, Birthday Bash, Black Raspberry, Cotton Candy, Pistachio, Butter Pecan, and more.</div>
      </div>
    </div>

    <!-- ── KIDS ── -->
    <div class="menu-card" data-cat="kids">
      {img(U["kids"], "Kids meal hamburger or chicken nuggets")}
      <div class="menu-card-body">
        <div class="menu-card-top"><div class="menu-card-name">Kids\' Meals</div><div class="menu-card-price">$6–9</div></div>
        <div class="menu-card-desc">Hamburger, Cheeseburger, Hot Dog, Grilled Cheese, Chicken Nuggets, Mac &amp; Cheese, Crispy Chicken, Cheese Quesadilla, or Grilled Chicken.</div>
      </div>
    </div>

  </div>
  <p style="text-align:center;color:rgba(249,244,236,0.3);font-size:0.75rem;margin-top:2.5rem;font-style:italic">Prices are estimates — call for exact pricing: <a href="tel:+18458569760" style="color:var(--red)">(845) 856-9760</a> · Menu &amp; specials rotate regularly</p>
</section>

<!-- GALLERY -->
<section class="gallery-section" id="gallery">
  <div class="gallery-header">
    <p class="section-eyebrow">From Our Kitchen</p>
    <h2 class="section-title" style="color:var(--cream)">Real Food, Real <em style="color:var(--gold)">Photos</em></h2>
    <p style="color:rgba(249,244,236,0.45);font-size:0.88rem;margin-top:0.5rem">Straight from our Instagram — new specials posted every week</p>
  </div>
  <div class="gallery-mosaic">
    <div class="gallery-item gi-1">
      <img src="{B["benny_box"]}" alt="The Benny Box — Benny Burger, tenders, fries, drink for $12.95" loading="lazy">
      <div class="gallery-label">The Benny Box<span>Burger · Tenders · Fries · Drink — $12.95</span></div>
    </div>
    <div class="gallery-item gi-2">
      <img src="{B["two_tue"]}" alt="Two for Tuesday — tenders and Benny Burgers deal" loading="lazy">
      <div class="gallery-label">Two For Tuesday<span>2 Benny Burgers deal — every Tuesday</span></div>
    </div>
    <div class="gallery-item gi-3">
      <img src="{B["samurai"]}" alt="Samurai Quesadilla — Bang Bang Chicken & Shrimp" loading="lazy">
      <div class="gallery-label">Samurai Quesadilla<span>Bang Bang Chicken &amp; Shrimp</span></div>
    </div>
    <div class="gallery-item gi-4">
      <img src="{B["alfredo"]}" alt="Cheesy Vodka Chicken Alfredo" loading="lazy">
      <div class="gallery-label">Cheesy Vodka Chicken Alfredo<span>Loaded · Creamy · Cheesy</span></div>
    </div>
    <div class="gallery-item gi-5">
      <img src="{B["pbparfait"]}" alt="Peanut Butter Parfait — Reese's Pieces, Butterfinger, PB sauce" loading="lazy">
      <div class="gallery-label">Peanut Butter Parfait<span>Reese\'s Pieces · Butterfinger · PB Sauce</span></div>
    </div>
    <div class="gallery-item gi-6">
      <img src="{B["ricebowl"]}" alt="Street Corn Chicken Rice Bowl" loading="lazy">
      <div class="gallery-label">Street Corn Chicken Rice Bowl<span>Grilled chicken · Street corn · Creamy drizzle</span></div>
    </div>
  </div>
  <p class="gallery-cta">
    New specials every week —
    <a href="https://www.instagram.com/bensfresh_portjervis_ny/" target="_blank">@bensfresh_portjervis_ny</a>
    &amp;
    <a href="https://www.facebook.com/p/Bens-Fresh-100063774510982/" target="_blank">Facebook</a>
  </p>
</section>

<!-- REVIEWS -->
<section class="reviews-section" id="reviews">
  <div class="reviews-header">
    <p class="section-eyebrow">What People Say</p>
    <h2 class="section-title">Loved by Port <em>Jervis</em></h2>
  </div>
  <div class="rating-showcase">
    <div class="rating-big">4.4</div>
    <div class="rating-right">
      <div class="rating-stars-lg">★★★★☆</div>
      <div class="rating-count">Based on 1,519+ Google reviews</div>
      <a href="https://www.facebook.com/p/Bens-Fresh-100063774510982/" target="_blank" style="display:inline-block;margin-top:0.75rem;font-size:0.78rem;color:rgba(249,244,236,0.5);text-decoration:none">Follow on Facebook for daily specials →</a>
    </div>
  </div>
  <div class="reviews-grid">
    <div class="review-card"><div class="review-quote-mark">"</div><div class="review-stars">★★★★★</div><div class="review-text">"Always fun new items, super affordable, and delicious. Bobby is such a nice guy and the workers dish out the items so quickly. It\'s a non-negotiable that you must stop by when you\'re in town."</div><div class="review-author">— Patrick</div></div>
    <div class="review-card"><div class="review-quote-mark">"</div><div class="review-stars">★★★★★</div><div class="review-text">"The menu will blow you away. You\'ll probably never see some of the meals they make here, anywhere else. The Chicken Bacon Alfredo Wrap was the best and beastliest wrap I\'ve ever had in my entire life."</div><div class="review-author">— Xiomara C.</div></div>
    <div class="review-card"><div class="review-quote-mark">"</div><div class="review-stars">★★★★★</div><div class="review-text">"Wraps: great. Burgers: great. Cannoli cheesecake parfait: amazing! It\'s a super homey hometown spot. One friend said since she\'d been in New York she hadn\'t had a satisfying burger yet — but this spot did it!"</div><div class="review-author">— Jennifer T.</div></div>
  </div>
</section>

<!-- HOURS -->
<section class="hours-section" id="hours">
  <div class="hours-inner">
    <div class="hours-title-block">
      <p class="section-eyebrow">Find Us</p>
      <h2 class="section-title">Hours &amp; <em>Location</em></h2>
      <p class="hours-note">Stop in for a meal or call ahead for pickup. Outdoor seating available in good weather. Wheelchair-accessible entrance and parking.</p>
      <br>
      <a href="https://maps.google.com/?q=33+E+Main+St,+Port+Jervis,+NY+12771" target="_blank" class="btn-primary" style="display:inline-block">Get Directions</a>
    </div>
    <div>
      <div class="hours-row" data-day="1"><div class="hours-day">Monday</div><div class="hours-time">11:00 AM – 10:00 PM</div></div>
      <div class="hours-row" data-day="2"><div class="hours-day">Tuesday</div><div class="hours-time">11:00 AM – 10:00 PM</div></div>
      <div class="hours-row" data-day="3"><div class="hours-day">Wednesday</div><div class="hours-time">11:00 AM – 10:00 PM</div></div>
      <div class="hours-row" data-day="4"><div class="hours-day">Thursday</div><div class="hours-time">11:00 AM – 10:00 PM</div></div>
      <div class="hours-row" data-day="5"><div class="hours-day">Friday</div><div class="hours-time hours-late">11:00 AM – 11:00 PM</div></div>
      <div class="hours-row" data-day="6"><div class="hours-day">Saturday</div><div class="hours-time hours-late">11:00 AM – 11:00 PM</div></div>
      <div class="hours-row" data-day="0" style="border-bottom:none"><div class="hours-day">Sunday</div><div class="hours-time">11:00 AM – 10:00 PM</div></div>
      <p style="font-size:0.72rem;color:var(--text-muted);margin-top:1rem;font-style:italic">Hours may vary — call to confirm: <a href="tel:+18458569760" style="color:var(--red)">(845) 856-9760</a></p>
    </div>
  </div>
</section>

<!-- CONTACT -->
<section class="cta-section" id="contact">
  <div class="cta-left">
    <p class="section-eyebrow" style="color:rgba(249,244,236,0.7)">Come Visit</p>
    <h2 class="section-title">Hungry? Come <em>on in.</em></h2>
    <p>Whether you\'re dining in or grabbing takeout, Ben\'s Fresh is ready to serve you. Follow us on Facebook and Instagram for weekly specials — Chef Bobby is always cooking up something new.</p>
  </div>
  <div class="cta-right">
    <div class="contact-item"><div class="contact-icon">📍</div><div><div class="contact-label">Address</div><div class="contact-value"><a href="https://maps.google.com/?q=33+E+Main+St,+Port+Jervis,+NY+12771" target="_blank">33 E Main St, Port Jervis, NY 12771</a></div></div></div>
    <div class="contact-item"><div class="contact-icon">📞</div><div><div class="contact-label">Phone</div><div class="contact-value"><a href="tel:+18458569760">(845) 856-9760</a></div></div></div>
    <div class="contact-item"><div class="contact-icon">📘</div><div><div class="contact-label">Facebook</div><div class="contact-value"><a href="https://www.facebook.com/p/Bens-Fresh-100063774510982/" target="_blank">facebook.com — Ben\'s Fresh</a></div></div></div>
    <div class="contact-item"><div class="contact-icon">📸</div><div><div class="contact-label">Instagram</div><div class="contact-value"><a href="https://www.instagram.com/bensfresh_portjervis_ny/" target="_blank">@bensfresh_portjervis_ny</a></div></div></div>
  </div>
</section>

<footer>
  <div class="footer-logo">Ben\'s <span>Fresh</span></div>
  <div class="footer-text">© 2025 Ben\'s Fresh · 33 E Main St, Port Jervis, NY 12771</div>
  <div class="footer-socials">
    <a href="https://www.facebook.com/p/Bens-Fresh-100063774510982/" target="_blank" class="footer-social">f</a>
    <a href="https://www.instagram.com/bensfresh_portjervis_ny/" target="_blank" class="footer-social">ig</a>
    <a href="tel:+18458569760" class="footer-social">☎</a>
  </div>
</footer>

<button class="back-to-top" id="backToTop" aria-label="Back to top">↑</button>

<script>
const tabs=document.querySelectorAll('.menu-tab');
const cards=document.querySelectorAll('.menu-card');
tabs.forEach(t=>t.addEventListener('click',()=>{{
  tabs.forEach(x=>x.classList.remove('active'));
  t.classList.add('active');
  const c=t.dataset.cat;
  cards.forEach(card=>card.classList.toggle('visible',card.dataset.cat===c));
}}));

const ham=document.querySelector('.nav-hamburger');
const mob=document.getElementById('mobileMenu');
function closeMenu(){{ham.classList.remove('open');mob.classList.remove('open');ham.setAttribute('aria-expanded','false');mob.setAttribute('aria-hidden','true');}}
ham.addEventListener('click',()=>{{const o=ham.classList.toggle('open');mob.classList.toggle('open',o);ham.setAttribute('aria-expanded',o);mob.setAttribute('aria-hidden',!o);}});
mob.querySelectorAll('a').forEach(l=>l.addEventListener('click',closeMenu));

const secs=document.querySelectorAll('#about,#menu,#gallery,#reviews,#hours,#contact');
const navLinks=document.querySelectorAll('.nav-links a:not(.nav-cta)');
secs.forEach(s=>new IntersectionObserver(entries=>{{
  entries.forEach(e=>{{if(e.isIntersecting)navLinks.forEach(l=>l.classList.toggle('active',l.getAttribute('href')==='#'+e.target.id));}});
}},{{rootMargin:'-20% 0px -70% 0px'}}).observe(s));

const btt=document.getElementById('backToTop');
window.addEventListener('scroll',()=>btt.classList.toggle('visible',scrollY>500),{{passive:true}});
btt.addEventListener('click',()=>window.scrollTo({{top:0,behavior:'smooth'}}));

const today=new Date().getDay();
document.querySelectorAll('.hours-row').forEach(r=>{{if(parseInt(r.dataset.day)===today)r.classList.add('today');}});
</script>
</body>
</html>'''

with open('/mnt/user-data/outputs/bens-fresh.html','w') as f:
    f.write(html)

import os
size = os.path.getsize('/mnt/user-data/outputs/bens-fresh.html')
print(f"Done — {size/1024/1024:.1f}MB")
PYEOF

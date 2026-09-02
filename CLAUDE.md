# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

A learning/reference sandbox for Jakarta EE Servlet, JSP, and JSTL features (`com.hidenari.servletsample`). Each servlet/tag class is a standalone demo of one API (mail, PDF generation, JSON, custom tags, container-managed auth, listeners), wired together mainly through `index.jsp` and `person.jsp`. There is no test suite, no service/DAO layers, and no build beyond packaging a WAR — treat additions as more standalone demos in the same style unless told otherwise.

## Commands

Run the app (Jetty, via the Maven plugin):
```
./mvnw jetty:run                              # Mac/Linux, http://localhost:8080/
mvnw jetty:run                                 # Windows
mvnw jetty:run -Djetty.http.port=8080          # override port
```

Build the WAR:
```
./mvnw package
```

Generate a password hash for the `users` table (SHA-512, matches the Tomcat `MessageDigestCredentialHandler` config in `context.xml`):
```
/Applications/Eclipse_2025-12.app/Contents/tomcat/11/bin/digest.sh -a SHA-512 <password>
```

There are no automated tests configured (JUnit 5 is a declared dependency but no test sources exist yet).

## Architecture

**Two parallel deployment targets exist and must be kept in sync when touching the DB/JNDI config:**
- `src/main/webapp/WEB-INF/jetty-env.xml` — JNDI `jdbc/testdb` DataSource for the Maven Jetty plugin (what `jetty:run` actually uses).
- `src/main/webapp/META-INF/context.xml` — the same resource plus an access-log `Valve` and a `DataSourceRealm`/`CredentialHandler` for Tomcat-style container auth (used when deployed to Tomcat, not by `jetty:run`).

Both point at MySQL `jdbc:mysql://localhost:3306/laravel` with a `testdb` JNDI name declared in `web.xml`'s `<resource-ref>`. Schema/seed data for the `users`/`roles` tables backing `DataSourceRealm` auth live in `src/main/resources/schema.sql` and `data.sql` — these are reference SQL, not auto-run migrations.

**Form-based container auth** (`AuthServlet`, `login.jsp`/`login_cust.jsp`) calls `request.login()`/posts to `j_security_check` against the `DataSourceRealm`, but the corresponding `<security-constraint>`/`<login-config>`/`<security-role>` blocks in `web.xml` are commented out — auth demos won't actually gate anything until those are uncommented.

**Custom tag library, three parallel implementations of the same idea** (all exercised in `person.jsp`):
- Classic tag-handler classes (`CustomTag`, `CustomTwoTag`, `CustomThreeTag`, `CustomFourTag`) declared in `WEB-INF/taglib/TestOneTag.tld` under URI `https://custTag.org` (prefix `cs`, declared in `common.jsp`). `TestFunction.testOne` is exposed as an EL function (`cs:getTestOne`) via the same TLD.
- `.tag` files under `WEB-INF/tags/` (`TestFiveTag` through `TestEightTag`), used via the implicit `tagdir="/WEB-INF/tags"` taglib (prefix `csTag`) — no `.tld` needed for these.
- The tag files progressively demonstrate JSTL-in-tag-file patterns: dynamic attributes (`dynamic-attributes="items"`), `<jsp:doBody/>` vs. an explicit `fragment` attribute invoked with `<jsp:invoke>`.

`common.jsp` centralizes every taglib declaration (`c`, `fmt`, `sql`, `fn`, `cs`, `csTag`) and is force-included on every `*.jsp` via the `<include-prelude>` in `web.xml`'s `<jsp-property-group>` — don't re-declare taglibs in individual JSPs.

**JSTL/JSP JARs are `system`-scope** in `pom.xml` (`jakarta.servlet.jsp.jstl-3.0.1` and `-api-3.0.2`), pointing at jars vendored in `src/main/webapp/WEB-INF/lib/`. If JSTL tags stop resolving, check those jars are present rather than assuming a normal Maven dependency issue.

**Servlets are split between two registration styles**: `PersonServlet` is registered in `web.xml` (with an `initMsg` init-param), while every other servlet (`AuthServlet`, `JsonServlet`, `MailServlet`, `MailWithAttachServlet`, `PdfServlet`) uses `@WebServlet` annotations. `FilterSample` (logging filter) and `ContextListener` are also `web.xml`-registered (the `@WebListener` on `ContextListener` is commented out, so it's currently inert); `RequestListener` uses `@WebListener`.

**Mail servlets** (`MailServlet`, `MailWithAttachServlet`) send through Mailtrap's sandbox SMTP (`sandbox.smtp.mailtrap.io:2525`) using credentials from the `mail_user`/`mail_password` environment variables — never hardcode credentials here.

**Japanese text** appears intentionally throughout (JSP output, mail subjects/recipient names, PDF content) to exercise UTF-8/i18n handling — preserve it rather than replacing with ASCII placeholders.

This repo contains a PoC of using Flutter as a traditional SPA framework for creating a desktop web app. The original app is based on AngularJS, uses OData to communicate with NodeJS/MongoDB back-end. This PoC mocks the back-end (though it has disabled gRPC bindings/implementations that were used in completete PoC with implemented back-end).
What's useful in hte sample:
- Building for wide screen right away (remember, Flutter is tailored to mobile dev)
- Context pop-ups and right clicks which are not typical to mobile apps
- Huge data grid which is the center of UX (with sorting, pagination and filter pop-ups appearing on column header clicks)
- UI layout with common headers/footers and route specific contents of the cetner part
- Routing, auth
- IoC via Proivders
- Localization

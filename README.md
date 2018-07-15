# Bookshelf Embedded sample 

This repository is mainly aimed to update **extlib** folder of **BookshelfEmbedded** and to demonstrate how to use KwikShelf plugin of [Corona SDK](https://coronalabs.com).

* http://kwiksher.com/doc/tutorials/kwik/bookshelf/bookshelf_embedded.html

Bookshelf embedded sample uses KwikShelf plugin.

* http://kwiksher.com/doc/tutorials/kwik/bookshelf/bookshelf_embedded_kwikshekf.html

Book01, Book02 and BookTOC folders are the projects of [Kwik4](https://kwiksher.com)

---
## localhost
BookServer you need to run http-server as localhost:8080

for instance, http://localhost:8080/bookshelf/bg.png


Then you can run BookShelfEmbedded's main.lua. It loads the plugin. Then the plugin access App/Toc. The plugin is very specific to the codes that Kwik has generates

There is the plugin folder with KwikShelf for local dev test. Please delete it if you enable the plugin access from CoronaLabs server to test.

```
.
├── BookServer
│   ├── bookshelf
│   │   ├── book01
│   │   │   ├── assets.zip
│   │   │   └── bg.png
│   │   └── book02
│   │       ├── assets.zip
│   │       └── bg.png
├── BookShelfEmbedded
    ├── App
    │   ├── TOC
    │   ├── book01
    │   └── book02
    ├── build.settings
    ├── config.lua
    ├── extlib
    ├── lib
    ├── main.lua
```

If you need to change the contents(TOC, book01, boo02), they have to be made with Kwik.

---
## external host

xcode simulator does not support localhost. You need https server.

If you add NSException to build.settings, http non SSL server is allowed.

https://docs.coronalabs.com/guide/hardware/appleATS/index.html#managing-app-transport-security-iosmacos

```lua
    NSAppTransportSecurity =
    {
        NSExceptionDomains =
        {
            ["kwiksher.com"] =
            {
                NSIncludesSubdomains = true,
                NSThirdPartyExceptionAllowsInsecureHTTPLoads = true,
            },
        },
    },
```

## Other configuration for device build

  - config.lua needs google license key
  - build.settings needs the following permissions

```lua
  android  =
  {
  usesPermissions  =
   {
          "android.permission.WRITE_EXTERNAL_STORAGE",
           "com.android.vending.BILLING",
           "android.permission.INTERNET",
           "com.android.vending.CHECK_LICENSE"
    },
  },
  ```


## Copyrights and Licenses


extlib folders contains the following libraries and they follow each license described in README.md in https://github.com/kwiksher/kwik4tmplt

* DMC classes, by David McCuskey
* gTween class, by Josh Tynjala (modified by Kwiksher)
* bTween class, by Josh Tynjala (modified by Kwiksher)
* syncSound class, by David Fox (modified by Kwiksher)
* page_curl by Steven Johnson
* Robotlegs by Jesse Warden
* iap_badger by happymongoose
* The State Machine Compiler from http://smc.sourceforge.net

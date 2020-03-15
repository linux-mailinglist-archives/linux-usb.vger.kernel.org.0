Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 42D1C185D2E
	for <lists+linux-usb@lfdr.de>; Sun, 15 Mar 2020 14:46:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728720AbgCONqH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 15 Mar 2020 09:46:07 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:39093 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728705AbgCONqH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 15 Mar 2020 09:46:07 -0400
Received: by mail-lj1-f193.google.com with SMTP id f10so15605554ljn.6
        for <linux-usb@vger.kernel.org>; Sun, 15 Mar 2020 06:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version;
        bh=h8JcF8gtRip/hIJfQuhlSF7985tQOGqAiy92woOAXAQ=;
        b=s+STcZnqFjXYW2jlKKk+7hM68Y9wAtyeJDLXWQ+3iohcqmiJn32v1RZUZ7y9xjLSrL
         BR7F5tcYok27C8hhFWwUl0Ef6ivIvucIueMxebN14U5BDHLgHnkfrNd6e+kR4n1OOVm5
         iP9Kmn+FOD74bXPuVZAfIHmHNAMf11t4PI10VjCKK7Z7cC49hl/p4us8FPgnaLkV2CLd
         QxaXep/cCk5GezS9CI6+kfb3rBTmUx298eHsp9SOxEMriHoxedqrdTzrk3hzRo4UX0Yy
         VvTNcpChH68IxG/FR1Irg9gilMZCa+D6JCb50u3swxtUW1NvbtYLAgsKBGNZuHTQk5xI
         tX/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version;
        bh=h8JcF8gtRip/hIJfQuhlSF7985tQOGqAiy92woOAXAQ=;
        b=QtqAdIJujo/khu1l99acgg+9e+OeKhWxe3/aqwEypHI8Svf/Zhe0CjuKmciD89nY7I
         N748Rs6OZwXWg9aHnQSX+4t7pAPPwj8oF9SvzOBKZBDRm1XPuANmOMqYI/jP16JXchln
         jgOVFEdKeSIn6FBgTptyBJ5/Ac3NJA12eHt9f0XhqMx9ZqQYu8XsO8Lrk4NLeI6K/Yzq
         sGsPQ4V0fisVOZaBenmYRxgPCwQzkqZIXbmQ92qg9Fk/E37nmgIpOspTki9qlVaCYslP
         NVUXkULz8kogUIH4PjTCznrW685GlbJIP198H1i8eqdEjrFFFym68jw1pKQqmNprd2zD
         2/QQ==
X-Gm-Message-State: ANhLgQ1E0BdBjuDLB1wr8slkvGGKGE2abmHiFdNqzF9/qDvxkH0fHuz3
        RdoAPEow8lLEsUhNAd1nYzahzYucSG0I6Q==
X-Google-Smtp-Source: ADFU+vuCco0Xda27wuXF6YQxrgyZcqQYXLWjLas0wZv374GSwP0dYKUPIWWA3PvUyeiH6tQd3iSkoA==
X-Received: by 2002:a2e:b4b1:: with SMTP id q17mr12597988ljm.22.1584279962002;
        Sun, 15 Mar 2020 06:46:02 -0700 (PDT)
Received: from saruman (88-113-215-213.elisa-laajakaista.fi. [88.113.215.213])
        by smtp.gmail.com with ESMTPSA id m17sm12402143ljb.61.2020.03.15.06.46.00
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 15 Mar 2020 06:46:00 -0700 (PDT)
From:   Felipe Balbi <balbi@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [GIT PULL] USB for v5.7 merge window
Date:   Sun, 15 Mar 2020 15:45:56 +0200
Message-ID: <87wo7lenor.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Man... I did it! I managed to get through all 500+ patches in time. I
can't believe it.

For everyone involved, I'm sorry for the delay, but I've been super busy
at work. I genuinely apologize for this and will try to better plan my
week to guarantee at least 3 hours a week to look at the mailing list.

Greg,

If you want anything to be changed, let me know.

Cheers

The following changes since commit 2c523b344dfa65a3738e7039832044aa133c75fb:

  Linux 5.6-rc5 (2020-03-08 17:44:44 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git usb-for-v5.7

for you to fetch changes up to 4a5dbd9009570d3b23fd1392c4d178bfe3538d2c:

  dt-bindings: usb: add documentation for aspeed usb-vhub (2020-03-15 12:12=
:37 +0200)

=2D---------------------------------------------------------------
USB: changes for v5.7 merge window

Lots of changes on dwc3 this time, most of them from Thinh fixing a
bunch of really old mishaps on the driver.

DWC2 got support for STM32MP15 and a couple RockChip SoCs while DWC3
learned about Amlogic A1 family.

Apart from these, we have a few spelling fixes and other minor
non-critical fixes all over the place.

Signed-off-by: Felipe Balbi <balbi@kernel.org>

=2D---------------------------------------------------------------
Alexandre Belloni (1):
      usb: gadget: amd5536udc: fix spelling mistake "reserverd" -> "reserve=
d"

Amelie Delaunay (1):
      usb: dwc2: add support for STM32MP15 SoCs USB OTG HS and FS

Anand Moon (1):
      usb: dwc3: exynos: Add support for Exynos5422 suspend clk

Andrey Konovalov (1):
      usb: gadget: add raw-gadget interface

Andy Shevchenko (2):
      usb: dwc3: Add ACPI support for xHCI ports
      usb: dwc3: Remove kernel doc annotation where it's not needed

Colin Ian King (2):
      usb: gadget: remove redundant assignment to variable status
      usb: cdns3: remove redundant assignment to pointer trb

Felipe Balbi (1):
      usb: dwc3: trace: print enqueue/dequeue pointers too

Geert Uytterhoeven (1):
      usb: dwc3: qcom: Replace <linux/clk-provider.h> by <linux/of_clk.h>

Gustavo A. R. Silva (1):
      usb: gadget: f_phonet: Replace zero-length array with flexible-array =
member

Hanjie Lin (2):
      dt-bindings: usb: dwc3: Add the Amlogic A1 Family DWC3 Glue Bindings
      usb: dwc3: Add Amlogic A1 DWC3 glue

Jassi Brar (2):
      dt-bindings: max3421-udc: add dt bindings for MAX3420 UDC
      usb: gadget: add udc driver for max3420

Johan Jonker (2):
      dt-bindings: usb: dwc2: add compatible property for rk3328 usb
      dt-bindings: usb: dwc2: add compatible property for rk3368 usb

John Keeping (1):
      usb: dwc2: Implement set_selfpowered()

John Stultz (5):
      dt-bindings: usb: generic: Add role-switch-default-mode binding
      usb: dwc3: Add support for role-switch-default-mode binding
      dt-bindings: usb: dwc3: Allow clock list & resets to be more flexible
      usb: dwc3: Rework clock initialization to be more flexible
      usb: dwc3: Rework resets initialization to be more flexible

Li Jun (1):
      usb: dwc3: core: don't do suspend for device mode if already suspended

Marek Szyprowski (2):
      usb: dwc2: Silence warning about supplies during deferred probe
      udc: s3c-hsudc: Silence warning about supplies during deferred probe

Nathan Chancellor (1):
      usb: dwc3: meson-g12a: Don't use ret uninitialized in dwc3_meson_g12a=
_otg_init

Neil Armstrong (2):
      doc: dt: bindings: usb: dwc3: Update entries for disabling SS instanc=
es in park mode
      usb: dwc3: core: add support for disabling SS instances in park mode

Tao Ren (7):
      usb: gadget: aspeed: support per-vhub usb descriptors
      usb: gadget: aspeed: read vhub properties from device tree
      usb: gadget: aspeed: add ast2600 vhub support
      ARM: dts: aspeed-g6: add usb functions
      ARM: dts: aspeed-g5: add vhub port and endpoint properties
      ARM: dts: aspeed-g4: add vhub port and endpoint properties
      dt-bindings: usb: add documentation for aspeed usb-vhub

Thinh Nguyen (3):
      usb: dwc3: gadget: Don't clear flags before transfer ended
      usb: dwc3: gadget: Wrap around when skip TRBs
      usb: gadget: composite: Inform controller driver of self-powered

Yu Chen (1):
      usb: dwc3: Registering a role switch in the DRD code.

YueHaibing (1):
      usb: gadget: xudc: Remove redundant platform_get_irq error message

 .../bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml  |   23 +
 .../devicetree/bindings/usb/aspeed,usb-vhub.yaml   |   77 ++
 Documentation/devicetree/bindings/usb/dwc2.yaml    |   30 +-
 Documentation/devicetree/bindings/usb/dwc3.txt     |    7 +-
 Documentation/devicetree/bindings/usb/generic.txt  |    6 +
 .../devicetree/bindings/usb/maxim,max3420-udc.yaml |   69 +
 Documentation/usb/index.rst                        |    1 +
 Documentation/usb/raw-gadget.rst                   |   61 +
 arch/arm/boot/dts/aspeed-g4.dtsi                   |    2 +
 arch/arm/boot/dts/aspeed-g5.dtsi                   |    2 +
 arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi           |   25 +
 arch/arm/boot/dts/aspeed-g6.dtsi                   |   45 +
 drivers/usb/cdns3/gadget.c                         |    2 +-
 drivers/usb/dwc2/core.h                            |    8 +
 drivers/usb/dwc2/gadget.c                          |   24 +-
 drivers/usb/dwc2/hw.h                              |    8 +
 drivers/usb/dwc2/params.c                          |   33 +
 drivers/usb/dwc2/platform.c                        |   98 +-
 drivers/usb/dwc3/core.c                            |   29 +-
 drivers/usb/dwc3/core.h                            |   10 +
 drivers/usb/dwc3/drd.c                             |   96 +-
 drivers/usb/dwc3/dwc3-exynos.c                     |    9 +
 drivers/usb/dwc3/dwc3-meson-g12a.c                 |  172 ++-
 drivers/usb/dwc3/dwc3-qcom.c                       |    2 +-
 drivers/usb/dwc3/gadget.c                          |    6 +-
 drivers/usb/dwc3/host.c                            |    4 +-
 drivers/usb/dwc3/trace.h                           |    9 +-
 drivers/usb/gadget/composite.c                     |    9 +
 drivers/usb/gadget/function/f_phonet.c             |    2 +-
 drivers/usb/gadget/function/f_uac1_legacy.c        |    2 -
 drivers/usb/gadget/legacy/Kconfig                  |   11 +
 drivers/usb/gadget/legacy/Makefile                 |    1 +
 drivers/usb/gadget/legacy/raw_gadget.c             | 1078 ++++++++++++++++
 drivers/usb/gadget/udc/Kconfig                     |   10 +
 drivers/usb/gadget/udc/Makefile                    |    1 +
 drivers/usb/gadget/udc/amd5536udc.h                |    2 +-
 drivers/usb/gadget/udc/aspeed-vhub/Kconfig         |    4 +-
 drivers/usb/gadget/udc/aspeed-vhub/core.c          |   71 +-
 drivers/usb/gadget/udc/aspeed-vhub/dev.c           |   30 +-
 drivers/usb/gadget/udc/aspeed-vhub/epn.c           |    4 +-
 drivers/usb/gadget/udc/aspeed-vhub/hub.c           |   58 +-
 drivers/usb/gadget/udc/aspeed-vhub/vhub.h          |   43 +-
 drivers/usb/gadget/udc/max3420_udc.c               | 1331 ++++++++++++++++=
++++
 drivers/usb/gadget/udc/s3c-hsudc.c                 |    3 +-
 drivers/usb/gadget/udc/tegra-xudc.c                |    5 +-
 include/uapi/linux/usb/raw_gadget.h                |  167 +++
 46 files changed, 3501 insertions(+), 189 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/aspeed,usb-vhub.y=
aml
 create mode 100644 Documentation/devicetree/bindings/usb/maxim,max3420-udc=
.yaml
 create mode 100644 Documentation/usb/raw-gadget.rst
 create mode 100644 drivers/usb/gadget/legacy/raw_gadget.c
 create mode 100644 drivers/usb/gadget/udc/max3420_udc.c
 create mode 100644 include/uapi/linux/usb/raw_gadget.h

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl5uMZQACgkQzL64meEa
mQbnyw/9EezOJXw3DJW2Iz0fIKG3BsEAto44DL22fqT7F6iccIqU1BOFj90hFHOB
vMMelJNXrGouliH57tQ/hlsSHuQBv/r3cSswojYZunbZhdVpeYgQ1YPNPwjORg6R
QBQ1Y8UE8F3py8xsObH+boQauEr23S4pL5rJLLPt8GX1A6f3yBHms0GpXl+a4BKm
zjBftyFxfe1GL7vTjQKTDJ1Ech+EHVipBuQKGBGd85HyGKEuNb3uaZNYZro93fJW
mQ6xzwr4/OmDlqMZjnvhHs3wV8qY/9ch8ZNvI25PYfHUvNuVHsql5/iSocQc8FLj
yHV8A20kvZd5daA7rHYClos30DgQ43nZv6z819buhAdm2caMlw8MOQ6UlhBEkrOm
a4saLMsMzlnwwFBXruUdqdcwV8rRZm09+bLw1OoE2JcZ0EM+8FTK++rsV2paK/+O
JFuwkX/giaiGvZnQDzrNQ0gNy3mM4G7FxSDcRrOJKJCnuwoaj2mzqani4uKfvMHN
k9AK+t1uwOnqf18aW3AAWxT0K1SweDMg2TUDbFURDLINXBYJbQN8k17WnzZd++f6
SdY6Wk46b4ph8JZB9W52qGgSEetfvo2wv9UW2H/vWS79SKcdEDa18tRXZNvqueZN
iZlvHXSfrsywe8jwp0r+ObbQShOHUWY9Lz5d0+Q21fK+JS1yhtg=
=xsgp
-----END PGP SIGNATURE-----
--=-=-=--

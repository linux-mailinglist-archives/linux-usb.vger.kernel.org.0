Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E0A4312A45
	for <lists+linux-usb@lfdr.de>; Fri,  3 May 2019 11:15:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726047AbfECJPZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 May 2019 05:15:25 -0400
Received: from mga11.intel.com ([192.55.52.93]:56549 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725777AbfECJPZ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 3 May 2019 05:15:25 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 03 May 2019 02:15:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,425,1549958400"; 
   d="asc'?scan'208";a="167285026"
Received: from pipin.fi.intel.com (HELO pipin) ([10.237.72.175])
  by fmsmga004.fm.intel.com with ESMTP; 03 May 2019 02:15:22 -0700
From:   Felipe Balbi <felipe.balbi@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [GIT PULL] USB changes for v5.2 merge window
Date:   Fri, 03 May 2019 12:15:18 +0300
Message-ID: <87pnozq4pl.fsf@linux.intel.com>
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


Hi Greg,

here's my pull request for the next merge window. A bit later than
usuall this time around, due to internal high-priority tasks. Sorry
about that.

Let me know if you need anything to be changed.

cheers

 _______________=20
< Busy as a bee >
 ---------------=20
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

The following changes since commit 085b7755808aa11f78ab9377257e1dad2e6fa4bb:

  Linux 5.1-rc6 (2019-04-21 10:45:57 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git tags/usb-for-=
v5.2

for you to fetch changes up to 2e487d280525b91b03976203b15aba365ec5b4e6:

  usb: dwc3: Rename DWC3_DCTL_LPM_ERRATA (2019-05-03 09:13:49 +0300)

=2D---------------------------------------------------------------
USB: changes for v5.2 merge window

With a total of 50 non-merge commits, this is not a large pull
request. Most of the changes are, again, in dwc2 (37%) and dwc3 (32%)
with the rest of it scattered among other UDCs, function drivers and
device-tree bindings.

No really big feature this time around apart from support to Amlogic
being added to both dwc3 and dwc2 drivers.

=2D---------------------------------------------------------------
Alan Stern (3):
      USB: dummy-hcd: Fix failure to give back unlinked URBs
      USB: UDC: net2280: Remove redundant "if" condition
      USB: UDC: net22{80,72}: remove mistaken test of req->zero

Alexandre Belloni (5):
      usb: gadget: udc: lpc32xx: simplify probe
      usb: gadget: udc: lpc32xx: simplify vbus handling
      usb: gadget: udc: lpc32xx: properly setup phy interrupts
      usb: gadget: udc: lpc32xx: add support for stotg04 phy
      usb: gadget: udc: lpc32xx: rework interrupt handling

Andy Shevchenko (1):
      usb: dwc3: Free resource immediately after use

Arnd Bergmann (1):
      usb: gadget: fsl: fix link error against usb-gadget module

Chunfeng Yun (2):
      usb: dwc2: get optional clock by devm_clk_get_optional()
      usb: introduce usb_ep_type_string() function

Douglas Anderson (6):
      usb: dwc2: bus suspend/resume for hosts with DWC2_POWER_DOWN_PARAM_NO=
NE
      USB: Export usb_wakeup_enabled_descendants()
      dt-bindings: usb: dwc2: Document quirk to reset PHY upon wakeup
      usb: dwc2: optionally assert phy reset when waking up
      ARM: dts: rockchip: Hook resets up to USB PHYs on rk3288.
      ARM: dts: rockchip: Add quirk for resetting rk3288's dwc2 host on wak=
eup

Fei Yang (1):
      usb: gadget: f_fs: don't free buffer prematurely

Jonas Bonn (3):
      usb: gadget: atmel_usba_udc: simplify setting of interrupt-enabled ma=
sk
      usb: gadget: atmel: support USB suspend
      usb: gadget: atmel: tie wake lock to running clock

Jules Maselbas (5):
      usb: dwc2: Move UTMI_PHY_DATA defines closer
      usb: dwc2: gadget: Remove duplicated phy init
      usb: dwc2: gadget: Replace phyif with phy_utmi_width
      usb: dwc2: Move phy init into core
      usb: dwc2: gadget: Move gadget phy init into core phy init

Marc Gonzalez (1):
      usb: dwc3: Allow building USB_DWC3_QCOM without EXTCON

Marek Szyprowski (1):
      usb: dwc3: move synchronize_irq() out of the spinlock protected block

Martin Blumenstingl (1):
      dt-bindings: usb: dwc2: document the vbus-supply property

Minas Harutyunyan (7):
      usb: dwc2: gadget: Reject LPM token during Control transfers
      usb: dwc2: Delayed status support
      usb: dwc2: gadget: Increase descriptors count for ISOC's
      usb: dwc2: Set actual frame number for completed ISOC transfer
      usb: dwc2: Fix channel disable flow
      usb: dwc2: Set lpm mode parameters depend on HW configuration
      dwc2: gadget: Fix completed transfer size calculation in DDMA

Neil Armstrong (4):
      dt-bindings: usb: dwc2: Add Amlogic G12A DWC2 Compatible
      dt-bindings: usb: dwc3: Add Amlogic G12A DWC3 Glue Bindings
      usb: dwc2: Add Amlogic G12A DWC2 Params
      usb: dwc3: Add Amlogic G12A DWC3 glue

Robin Murphy (1):
      usb: dwc3: of-simple: Convert to bulk clk API

Romain Izard (2):
      usb: gadget: f_ncm: Fix NTP-32 support
      usb: gadget: f_ncm: Add OS descriptor support

Sergey Senozhatsky (1):
      usb: gadget: do not use __constant_cpu_to_le16

Thinh Nguyen (5):
      usb: dwc3: gadget: Set lpm_capable
      usb: dwc3: Do core validation early on probe
      usb: dwc3: debug: Print GET_STATUS(device) tracepoint
      usb: dwc3: Fix default lpm_nyet_threshold value
      usb: dwc3: Rename DWC3_DCTL_LPM_ERRATA

 .../devicetree/bindings/usb/amlogic,dwc3.txt       |  88 +++
 Documentation/devicetree/bindings/usb/dwc2.txt     |   7 +
 arch/arm/boot/dts/rk3288.dtsi                      |   7 +
 drivers/usb/common/common.c                        |  16 +
 drivers/usb/core/hcd.c                             |  17 +-
 drivers/usb/core/hub.c                             |   7 +-
 drivers/usb/dwc2/core.c                            | 199 +++++++
 drivers/usb/dwc2/core.h                            |  14 +-
 drivers/usb/dwc2/core_intr.c                       |  12 +
 drivers/usb/dwc2/gadget.c                          | 101 ++--
 drivers/usb/dwc2/hcd.c                             | 326 +++--------
 drivers/usb/dwc2/hw.h                              |   8 +-
 drivers/usb/dwc2/params.c                          |  35 +-
 drivers/usb/dwc2/platform.c                        |  20 +-
 drivers/usb/dwc3/Kconfig                           |  16 +-
 drivers/usb/dwc3/Makefile                          |   1 +
 drivers/usb/dwc3/core.c                            |  18 +-
 drivers/usb/dwc3/core.h                            |   3 +-
 drivers/usb/dwc3/debug.h                           |   3 +
 drivers/usb/dwc3/dwc3-meson-g12a.c                 | 604 +++++++++++++++++=
++++
 drivers/usb/dwc3/dwc3-of-simple.c                  |  95 +---
 drivers/usb/dwc3/gadget.c                          |   5 +-
 drivers/usb/gadget/function/f_fs.c                 |   3 +-
 drivers/usb/gadget/function/f_ncm.c                |  57 +-
 drivers/usb/gadget/function/f_uac1_legacy.c        |   6 +-
 drivers/usb/gadget/function/u_ncm.h                |   3 +
 drivers/usb/gadget/udc/aspeed-vhub/epn.c           |   6 +-
 drivers/usb/gadget/udc/atmel_usba_udc.c            |  84 ++-
 drivers/usb/gadget/udc/atmel_usba_udc.h            |   1 +
 drivers/usb/gadget/udc/dummy_hcd.c                 |  35 +-
 drivers/usb/gadget/udc/lpc32xx_udc.c               | 167 +++---
 drivers/usb/gadget/udc/net2272.c                   |   3 +-
 drivers/usb/gadget/udc/net2280.c                   |   5 +-
 drivers/usb/phy/Kconfig                            |   2 +-
 include/linux/usb/ch9.h                            |   8 +
 include/linux/usb/hcd.h                            |   5 +
 36 files changed, 1418 insertions(+), 569 deletions(-)
 create mode 100644 drivers/usb/dwc3/dwc3-meson-g12a.c

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAlzMBqYACgkQzL64meEa
mQZUFA/9G/VtQ0WhvzsG/X/a9FoBpM/WU1nDAcVIwzbz7my11b5Q/w2elIrV6OwA
+vAfygrM0uD3myBbT6oC3BV3VvuFJLPkWvcwFfcvyR5Dn2XIm0XUkz49pQgruEJJ
DAeYlaWpJQxw7hWVPbgfOFiJd7qXWLoUr4xcmotXcc+P5frcwBKs9814aiMP5Tuh
e1JKd+aoqn1DsGWcdOy2bEqHrPy1pRrJUA7gwFTW03o27JfrGSuh35iCCpxgsR6v
HBCgsvK2SFkRD4WOI7SaLvMMoZEtR5w1nBjQIHRJz7JYp1QVc7c8AG0pbQp0ihwu
Uqte02tTnqtACdrbYk8qF7Gw0tZNw/AKGiXc+0OeX+kM7DAM6p8Wdd3pGYrUjNJr
baL7tm2gfP9fzthz3pJm/fgtSJcZj/m/byX4mkjNMLD9nj8OCyteAdDlkBXzNqhn
1rVthV5cl83pU442MpYYsMrLuLzDjs/tY57hN0WTH/5sYkJEvpQbhg9ZA8C6n8i+
CpIoMqz1tDtapJlbBsYMEACZWr6RQADeh8jiDq9z7Kup4ag/Q4hOvbC1L4BtVSPQ
Ik2RGV1x33Yyu2RE7TsIyfSJ1nc4a0xOwuM/5xB1uxIse+eIsR3ZwejB1+ZNtUSj
cWlvhqRqNfD9RsZiVXxDIqVLBA+HIU1V36s2pGth01a+9e2lcWk=
=FF3B
-----END PGP SIGNATURE-----
--=-=-=--

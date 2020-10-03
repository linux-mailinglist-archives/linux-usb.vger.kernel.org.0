Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A17E2821CC
	for <lists+linux-usb@lfdr.de>; Sat,  3 Oct 2020 08:14:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725681AbgJCGOs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 3 Oct 2020 02:14:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:48996 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725446AbgJCGOr (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 3 Oct 2020 02:14:47 -0400
Received: from saruman (91-155-214-30.elisa-laajakaista.fi [91.155.214.30])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0275A2065E;
        Sat,  3 Oct 2020 06:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601705686;
        bh=S66nKFLrORfTJPrRn0tXNBISWmsRS0lN/rAdgipAvZo=;
        h=From:To:Cc:Subject:Date:From;
        b=fhbw/omZnHsDjHjFFRzLW+6flOV0ftn1aNVK1aUkmlxh4GS9taxlpZBYlFrpYyL8l
         JawdMSk/7vGq/g++FviuODkiNx3m8FQeZJDwB9zKmVmIDVX1bZHs+qmiFYAHaMcTkO
         HcbEa+0UvpCUz5/DDdah9WVWFpP3h9bV8dNCnwq4=
From:   Felipe Balbi <balbi@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [GIT PULL] USB changes for v5.10
Date:   Sat, 03 Oct 2020 09:14:40 +0300
Message-ID: <878scnygxb.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Hi Greg,

Here's the big gadget pull request. Patches have been around for quite a
while and I think all the little linux-next problems have been found.

Let me know if you want anything to be changed.

cheers

The following changes since commit ba4f184e126b751d1bffad5897f263108befc780:

  Linux 5.9-rc6 (2020-09-20 16:33:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git tags/usb-for-=
v5.10

for you to fetch changes up to b2c586eb07efab982419f32b7c3bd96829bc8bcd:

  usb: dwc2: Fix INTR OUT transfers in DDMA mode. (2020-10-02 13:29:13 +030=
0)

=2D---------------------------------------------------------------
USB: changes for v5.10 merge window

Most of changes are on dwc3 (38.8%) with cdns3 falling close
behind (24.1%).

The biggest changes here are a series of non-critical fixes to corner
cases on dwc3, produced by Thinh N, and a series of major improvements
to cdns3 produced by Peter C.

We also have the traditional set of new device support (Intel Keem
Bay, Hikey 970) on dwc3. A series of sparse/coccinelle and checkpatch
fixes on dwc3 by yours truly and a set of minor changes all over the
stack.

=2D---------------------------------------------------------------
Alan Stern (3):
      USB: UDC: Expand device model API interface
      USB: UDC: net2280: Fix memory leaks
      USB: UDC: net2272: Fix memory leaks

Amelie Delaunay (3):
      dt-bindings: usb: dwc2: add optional usb-role-switch property
      usb: dwc2: override PHY input signals with usb role switch support
      usb: dwc2: don't use ID/Vbus detection if usb-role-switch on STM32MP1=
5 SoCs

Bryan O'Donoghue (1):
      USB: gadget: f_ncm: Fix NDP16 datagram validation

Christian Lamparter (2):
      dt-bindings: usb: dwc2: add support for APM82181 SoCs USB OTG HS and =
FS
      usb: dwc2: add support for APM82181 USB OTG

Christophe JAILLET (1):
      usb: gadget: tegra-xudc: Avoid GFP_ATOMIC where it is not needed

Chunfeng Yun (1):
      usb: gadget: bcm63xx_udc: fix up the error of undeclared usb_debug_ro=
ot

Claudiu Beznea (1):
      usb: gadget: udc: atmel: use of_find_matching_node_and_match

Colin Ian King (1):
      usb: gadget: fix spelling mistake "Dectected" -> "Detected"

Cristian Birsan (5):
      dt-bindings: usb: atmel: Update DT bindings documentation for sam9x60
      usb: gadget: udc: atmel: simplify endpoint allocation
      usb: gadget: udc: atmel: use 1 bank endpoints for control transfers
      usb: gadget: udc: atmel: update endpoint allocation for sam9x60
      ARM: dts: at91: sam9x60ek: enable usb device

Felipe Balbi (11):
      usb: dwc3: meson: fix coccinelle WARNING
      usb: dwc3: debug: fix sparse warning
      usb: dwc3: meson: fix checkpatch errors and warnings
      usb: dwc3: ulpi: fix checkpatch warning
      usb: dwc3: trace: fix checkpatch warnings
      usb: dwc3: debug: fix checkpatch warning
      usb: dwc3: ep0: fix checkpatch warnings
      usb: dwc3: qcom: fix checkpatch warnings
      usb: dwc3: debugfs: fix checkpatch warnings
      usb: dwc3: core: fix checkpatch warnings
      usb: dwc3: gadget: fix checkpatch warnings

Florian Fainelli (1):
      MAINTAINERS: Add entry for Broadcom BDC driver

Krzysztof Kozlowski (1):
      usb: gadget: s3c: Remove unused 'udc' variable

Lad Prabhakar (1):
      dt-bindings: usb: renesas,usb-xhci: Document r8a774e1 support

Li Jun (4):
      usb: dwc3: core: do not queue work if dr_mode is not USB_DR_MODE_OTG
      usb: dwc3: core: don't trigger runtime pm when remove driver
      usb: dwc3: core: add phy cleanup for probe error handling
      usb: dwc3: debugfs: do not queue work if try to change mode on non-drd

Linus Walleij (2):
      usb: gadget: udc: Drop surplus include
      usb: gadget: pch_udc: Convert to use GPIO descriptors

Lorenzo Colitti (4):
      usb: gadget: f_ncm: fix ncm_bitrate for SuperSpeed and above.
      usb: gadget: f_ncm: set SuperSpeed bulk descriptor bMaxBurst to 15
      usb: gadget: f_ncm: allow using NCM in SuperSpeed Plus gadgets.
      usb: gadget: u_ether: enable qmult on SuperSpeed Plus as well

Marc Zyngier (1):
      usb: dwc2: Always disable regulators on driver teardown

Martin Blumenstingl (1):
      usb: dwc2: Add missing cleanups when usb_add_gadget_udc() fails

Mauro Carvalho Chehab (2):
      usb: dwc3: simple: add support for Hikey 970
      dt-bindings: document a new quirk for dwc3

Micha=C5=82 Miros=C5=82aw (1):
      usb: gadget: f_acm: don't disable disabled EP

Minas Harutyunyan (1):
      usb: dwc2: Fix INTR OUT transfers in DDMA mode.

Nathan Chancellor (1):
      usb: dwc2: Fix parameter type in function pointer prototype

Neil Armstrong (2):
      dt-bindings: usb: amlogic,meson-g12a-usb-ctrl: add the Amlogic AXG Fa=
milies USB Glue Bindings
      usb: dwc-meson-g12a: Add support for USB on AXG SoCs

Pawel Laszczak (2):
      usb: cdns3: Enable workaround for USB2.0 PHY Rx compliance test PHY l=
ockup
      usb: gadget: config_ep_by_speed_and_alt instead of config_ep_by_speed

Peter Chen (22):
      usb: cdns3: gadget: free interrupt after gadget has deleted
      MAINTAINERS: add Cadence USB3 DRD IP driver entry
      usb: cdns3: introduce set_phy_power_on{off} APIs
      usb: cdns3: add runtime PM support
      usb: cdns3: imx: add glue layer runtime pm implementation
      usb: cdns3: core: quit if it uses role switch class
      usb: cdns3: gadget: set fast access bit
      usb: cdns3: gadget: clear the interrupt status when disconnect the ho=
st
      usb: cdns3: drd: call PHY .set_mode accordingly
      usb: cdns3: gadget: move wait configuration operation
      usb: cdns3: gadget: fix some endian issues
      usb: cdns3: gadget: fix possible memory leak
      usb: dwc3: allocate gadget structure dynamically
      Revert "usb: udc: allow adding and removing the same gadget device"
      usb: gadget: core: do not try to disconnect gadget if it is not conne=
cted
      usb: cdns3: gadget: using correct sg operations
      usb: cdns3: gadget: improve the dump TRB operation at cdns3_ep_run_tr=
ansfer
      usb: cdns3: gadget: add CHAIN and ISP bit for sg list use case
      usb: cdns3: gadget: handle sg list use case at completion correctly
      usb: cdns3: gadget: need to handle sg case for workaround 2 case
      usb: cdns3: gadget: sg_support is only for DEV_VER_V2 or above
      usb: cdns3: gadget: enlarge the TRB ring length

Qinglang Miao (1):
      usb: gadget: lpc32xx_udc: Convert to DEFINE_SHOW_ATTRIBUTE

Randy Dunlap (1):
      usb: phy: phy-ab8500-usb: fix spello of "function"

Raymond Tan (1):
      usb: dwc3: pci: Allow Elkhart Lake to utilize DSM method for PM funct=
ionality

Roger Quadros (2):
      dt-bindings: usb: Convert cdns-usb3.txt to YAML schema
      dt-bindings: usb: cdns,usb3: Add cdns,phyrst-a-enable property

Sandeep Maheswaram (1):
      usb: dwc3: qcom: Add interconnect support in dwc3 driver

Tang Bin (2):
      usb: bdc: Fix unused assignment in bdc_probe()
      usb: bdc: remove duplicated error message

Tao Ren (1):
      usb: gadget: aspeed: fixup vhub port irq handling

Thierry Reding (3):
      usb: gadget: tegra-xudc: Use consistent spelling and formatting
      usb: gadget: tegra-xudc: Properly align parameters
      usb: gadget: tegra-xudc: Do not print errors on probe deferral

Thinh Nguyen (21):
      usb: dwc3: gadget: Resume pending requests after CLEAR_STALL
      usb: dwc3: gadget: END_TRANSFER before CLEAR_STALL command
      usb: dwc3: core: Properly default unspecified speed
      usb: dwc3: core: Print warning on unsupported speed
      usb: dwc3: gadget: Refactor ep command completion
      usb: dwc3: gadget: Check MPS of the request length
      usb: dwc3: gadget: Reclaim extra TRBs after request completion
      usb: dwc3: gadget: Refactor preparing extra TRB
      usb: dwc3: gadget: Improve TRB ZLP setup
      usb: dwc3: ep0: Fix ZLP for OUT ep0 requests
      usb: dwc3: gadget: Return the number of prepared TRBs
      usb: dwc3: gadget: Check for number of TRBs prepared
      usb: dwc3: gadget: Set IOC if not enough for extra TRBs
      usb: dwc3: gadget: Refactor preparing last TRBs
      usb: dwc3: gadget: Rename misleading function names
      usb: dwc3: gadget: Allow restarting a transfer
      usb: dwc3: gadget: Look ahead when setting IOC
      usb: dwc3: gadget: Revise setting IOC when no TRB left
      usb: dwc3: gadget: Keep TRBs in request order
      usb: dwc3: gadget: Return early if no TRB update
      usb: dwc3: gadget: Support up to max stream id

Wan Ahmad Zainie (2):
      dt-bindings: usb: Add Intel Keem Bay USB controller bindings
      usb: dwc3: of-simple: Add compatible string for Intel Keem Bay platfo=
rm

Wesley Cheng (1):
      usb: dwc3: Stop active transfers before halting the controller

Ye Bin (1):
      usb: gadget: fsl: Fix unsigned expression compared with zero in fsl_u=
dc_probe

Yoshihiro Shimoda (1):
      usb: gadget: u_serial: clear suspended flag when disconnecting

Yu Chen (1):
      usb: dwc3: Add splitdisable quirk for Hisilicon Kirin Soc

YueHaibing (1):
      usb: mtu3: Remove unsused inline function is_first_entry

Zqiang (2):
      usb: gadget: function: printer: fix use-after-free in __lock_acquire
      usb: gadget: uvc: Fix the wrong v4l2_device_unregister call

 .../bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml  |  22 +-
 .../devicetree/bindings/usb/atmel-usb.txt          |   1 +
 .../devicetree/bindings/usb/cdns,usb3.yaml         |  96 ++++
 .../devicetree/bindings/usb/cdns-usb3.txt          |  45 --
 Documentation/devicetree/bindings/usb/dwc2.yaml    |   5 +
 Documentation/devicetree/bindings/usb/dwc3.txt     |   3 +
 .../bindings/usb/intel,keembay-dwc3.yaml           |  77 +++
 .../devicetree/bindings/usb/renesas,usb-xhci.yaml  |   1 +
 MAINTAINERS                                        |  18 +
 arch/arm/boot/dts/at91-sam9x60ek.dts               |  13 +
 arch/arm/boot/dts/sam9x60.dtsi                     |  14 +
 drivers/usb/cdns3/cdns3-imx.c                      | 191 ++++++-
 drivers/usb/cdns3/core.c                           | 202 +++++--
 drivers/usb/cdns3/core.h                           |  17 +
 drivers/usb/cdns3/drd.c                            |  20 +
 drivers/usb/cdns3/drd.h                            |   5 +-
 drivers/usb/cdns3/ep0.c                            |  10 +-
 drivers/usb/cdns3/gadget.c                         | 276 ++++++----
 drivers/usb/cdns3/gadget.h                         |  11 +-
 drivers/usb/cdns3/host.c                           |   7 +
 drivers/usb/dwc2/Kconfig                           |   1 +
 drivers/usb/dwc2/Makefile                          |   2 +-
 drivers/usb/dwc2/core.h                            |   9 +
 drivers/usb/dwc2/drd.c                             | 180 +++++++
 drivers/usb/dwc2/gadget.c                          |  42 +-
 drivers/usb/dwc2/params.c                          |   5 +-
 drivers/usb/dwc2/platform.c                        |  43 +-
 drivers/usb/dwc3/core.c                            |  90 +++-
 drivers/usb/dwc3/core.h                            |  47 +-
 drivers/usb/dwc3/debug.h                           |   8 +-
 drivers/usb/dwc3/debugfs.c                         |  59 +-
 drivers/usb/dwc3/dwc3-meson-g12a.c                 |  41 +-
 drivers/usb/dwc3/dwc3-of-simple.c                  |   2 +
 drivers/usb/dwc3/dwc3-pci.c                        |   3 +-
 drivers/usb/dwc3/dwc3-qcom.c                       | 128 ++++-
 drivers/usb/dwc3/ep0.c                             |  61 ++-
 drivers/usb/dwc3/gadget.c                          | 593 ++++++++++++-----=
----
 drivers/usb/dwc3/gadget.h                          |   3 +-
 drivers/usb/dwc3/trace.h                           |  17 +-
 drivers/usb/dwc3/ulpi.c                            |   2 +-
 drivers/usb/gadget/function/f_acm.c                |   8 +-
 drivers/usb/gadget/function/f_ncm.c                |  40 +-
 drivers/usb/gadget/function/f_printer.c            |  16 +-
 drivers/usb/gadget/function/f_tcm.c                |  12 +-
 drivers/usb/gadget/function/f_uvc.c                |   8 +-
 drivers/usb/gadget/function/u_ether.c              |   2 +-
 drivers/usb/gadget/function/u_serial.c             |   1 +
 drivers/usb/gadget/udc/aspeed-vhub/core.c          |  10 +-
 drivers/usb/gadget/udc/aspeed-vhub/vhub.h          |   3 +
 drivers/usb/gadget/udc/atmel_usba_udc.c            |  68 ++-
 drivers/usb/gadget/udc/atmel_usba_udc.h            |   3 +-
 drivers/usb/gadget/udc/bcm63xx_udc.c               |   1 +
 drivers/usb/gadget/udc/bdc/bdc_core.c              |   9 +-
 drivers/usb/gadget/udc/core.c                      |  82 ++-
 drivers/usb/gadget/udc/fsl_udc_core.c              |   9 +-
 drivers/usb/gadget/udc/lpc32xx_udc.c               |  17 +-
 drivers/usb/gadget/udc/net2272.c                   |  24 +-
 drivers/usb/gadget/udc/net2272.h                   |   1 +
 drivers/usb/gadget/udc/net2280.c                   |  11 +-
 drivers/usb/gadget/udc/net2280.h                   |   1 +
 drivers/usb/gadget/udc/pch_udc.c                   |  55 +-
 drivers/usb/gadget/udc/s3c2410_udc.c               |   3 -
 drivers/usb/gadget/udc/tegra-xudc.c                |  60 ++-
 drivers/usb/mtu3/mtu3.h                            |   6 -
 drivers/usb/phy/phy-ab8500-usb.c                   |   2 +-
 include/linux/usb/gadget.h                         |  27 +-
 66 files changed, 2075 insertions(+), 774 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/cdns,usb3.yaml
 delete mode 100644 Documentation/devicetree/bindings/usb/cdns-usb3.txt
 create mode 100644 Documentation/devicetree/bindings/usb/intel,keembay-dwc=
3.yaml
 create mode 100644 drivers/usb/dwc2/drd.c

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAl94FtARHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQZeNxAAsWfINWItsp0SfK0byQsBL8J8rDnbD8Hp
8fWPFxGJM17Dtml1X/ElEEeCiROPS4No2MAmKJ8aG28koOyqme+NGCl/fT3cRtTV
KCkif1Oa/yJBfcBU1wNQJrjW9UKOzFBQkIuAnwNRbNmeVO08t7mKRMaov06PUAj7
h43F7OtL0ZDvJS9SR53g5VEyY5M/uc27+pIiRWXKZLAhzeofILNCIaVJg16S8C3o
c2IX2E4jA0p+JJHhATnUBOJ34TRufCfH0CiS4unxzKTNtaPh0Q8wPkAtDsm5wdAb
1mu/aThexxQO3tTIyIqM0DCUZTAbrYaiB0sXKXLN/Et7uyeYbSg2mtuu4buSOlvL
PzTTHsC0ONA6Z7uJzuahxXelE30s9kxG2/G60ZI3U5PTH8+iEPuMj2Yl4HzxDGiO
q54o0AGpihZrE/QCV2TwawI5Hu4ex9YFXjbgak1w2jR+wkxKRyp8NvJQecNsJEPT
bTOyuXS1oZv5LRTvLAFKiwa8C+O+59Gxr+zQYqsNA3MCILcFGxKiKAdGvpdp33L8
cLE9MIKch/k7ICArRCoyNAoPrEdQ8+ZhNIPQ5/CmOLQJukWs8f6pRtEiXyaeoMUR
4qN5QQ9FyO3WYArvu4D1uHGWVPnsaiuefZTCU9WvE8tmVsBYwsYZZ/LnMgOKoyAv
W73W8GEhyD4=
=1I7q
-----END PGP SIGNATURE-----
--=-=-=--

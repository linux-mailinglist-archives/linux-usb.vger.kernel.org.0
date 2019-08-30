Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6DF6FA3379
	for <lists+linux-usb@lfdr.de>; Fri, 30 Aug 2019 11:14:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727242AbfH3JOe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 30 Aug 2019 05:14:34 -0400
Received: from mga14.intel.com ([192.55.52.115]:8255 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725780AbfH3JOe (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 30 Aug 2019 05:14:34 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 30 Aug 2019 02:14:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,446,1559545200"; 
   d="asc'?scan'208";a="186243158"
Received: from pipin.fi.intel.com (HELO pipin) ([10.237.72.175])
  by orsmga006.jf.intel.com with ESMTP; 30 Aug 2019 02:14:32 -0700
From:   Felipe Balbi <felipe.balbi@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [GIT PULL] USB changes for v5.4 merge window
Date:   Fri, 30 Aug 2019 12:14:28 +0300
Message-ID: <87o907uia3.fsf@gmail.com>
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

Here's my pull request for the next merge window. The biggest chunk is
the addition of Cadence USB3 DRD Driver which, finally, compiles on x86,
ARM and ARM64 without any issues. I haven't gotten any failure reports
from 0-day either.

Relevant changes have been testing on platforms I have access to. Most
importantly the generalization of the dwc3 control request decoders
didn't cause any visible regressions that I could trigger.

Let me know if you want anything to be changed.

cheers

 ____________=20
< New Driver >
 ------------=20
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

The following changes since commit e21a712a9685488f5ce80495b37b9fdbe96c230d:

  Linux 5.3-rc3 (2019-08-04 18:40:12 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git tags/usb-for-=
v5.4

for you to fetch changes up to 18a93cd38be3e69ac5b067c570a78a369b79e31d:

  usb: gadget: net2280: Add workaround for AB chip Errata 11 (2019-08-30 09=
:27:33 +0300)

=2D---------------------------------------------------------------
USB: Changes for v5.4 merge window

With only 45 non-merge commits, we have a small merge window from the
Gadget perspective.

The biggest change here is the addition of the Cadence USB3 DRD
Driver. All other changes are small, non-critical fixes or smaller new
features like the improvement to BESL handling in dwc3.

Signed-off-by: Felipe Balbi <felipe.balbi@linux.intel.com>

=2D---------------------------------------------------------------
Andrey Smirnov (2):
      usb: dwc3: Use devres to get clocks
      usb: dwc3: Use clk_bulk_prepare_enable()

Andy Shevchenko (2):
      usb: dwc2: Switch to use device_property_count_u32()
      usb: dwc3: Switch to use device_property_count_u32()

Benjamin Herrenschmidt (12):
      usb: gadget: aspeed: Don't set port enable change bit on reset
      usb: gadget: aspeed: Cleanup EP0 state on port reset
      usb: gadget: aspeed: Fix EP0 stall handling
      usb: gadget: aspeed: Don't reject requests on suspended devices
      usb: gadget: aspeed: Check suspend/resume callback existence
      usb: gadget: aspeed: Rework the reset logic
      usb: gadget: aspeed: Remove unused "suspended" flag
      usb: gadget: aspeed: Improve debugging when nuking
      usb: Add definitions for the USB2.0 hub TT requests
      usb: gadget: aspeed: Implement dummy hub TT requests
      usb: gadget: net2280: Move all "ll" registers in one structure
      usb: gadget: net2280: Add workaround for AB chip Errata 11

Chuhong Yuan (1):
      usb: gadget: pch_udc: Use dev_get_drvdata

Gustavo A. R. Silva (3):
      USB: gadget: udc: s3c2410_udc: Mark expected switch fall-throughs
      usb: gadget: atmel_usba_udc: Mark expected switch fall-through
      usb: udc: lpc32xx: silence fall-through warning

John Keeping (1):
      usb: dwc2: gadget: Fix kill_all_requests race

Mao Wenan (1):
      usb: udc: lpc32xx: remove set but not used 3 variables

Marek Szyprowski (1):
      usb: dwc3: remove generic PHYs forwarding for XHCI device

Masahiro Yamada (1):
      usb: dwc3: omap: squash include/linux/platform_data/dwc3-omap.h

Neil Armstrong (1):
      usb: dwc3: meson-g12a: fix suspend resume regulator unbalanced disabl=
es

Nishka Dasgupta (3):
      usb: dwc3: st: Add of_node_put() before return in probe function
      usb: dwc3: st: Add of_dev_put() in probe function
      usb: phy: phy-fsl-usb: Make structure fsl_otg_initdata constant

Pawel Laszczak (6):
      dt-bindings: add binding for USBSS-DRD controller.
      usb: common: Separated decoding functions from dwc3 driver.
      usb: common: Patch simplify usb_decode_set_clear_feature function.
      usb: common: Simplify usb_decode_get_set_descriptor function.
      usb: cdns3: Add Cadence USB3 DRD Driver
      usb:cdns3 Fix for stuck packets in on-chip OUT buffer.

Roger Quadros (2):
      usb: dwc3: don't set gadget->is_otg flag
      usb: gadget: udc: core: Fix segfault if udc_bind_to_driver() for pend=
ing driver fails

Thinh Nguyen (6):
      usb: dwc3: Update soft-reset wait polling rate
      usb: gadget: Export recommended BESL values
      usb: dwc3: Separate field holding multiple properties
      usb: dwc3: gadget: Set BESL config parameter
      usb: gadget: composite: Set recommended BESL values
      usb: dwc3: gadget: Workaround Mirosoft's BESL check

YueHaibing (3):
      usb: dwc3: meson-g12a: use devm_platform_ioremap_resource() to simpli=
fy code
      usb: dwc3: omap: use devm_platform_ioremap_resource() to simplify code
      usb: dwc3: keystone: use devm_platform_ioremap_resource() to simplify=
 code

 .../devicetree/bindings/usb/cdns-usb3.txt          |   45 +
 drivers/usb/Kconfig                                |    2 +
 drivers/usb/Makefile                               |    2 +
 drivers/usb/cdns3/Kconfig                          |   46 +
 drivers/usb/cdns3/Makefile                         |   16 +
 drivers/usb/cdns3/cdns3-pci-wrap.c                 |  203 ++
 drivers/usb/cdns3/core.c                           |  653 +++++
 drivers/usb/cdns3/core.h                           |   98 +
 drivers/usb/cdns3/debug.h                          |  161 ++
 drivers/usb/cdns3/drd.c                            |  381 +++
 drivers/usb/cdns3/drd.h                            |  167 ++
 drivers/usb/cdns3/ep0.c                            |  888 +++++++
 drivers/usb/cdns3/gadget-export.h                  |   28 +
 drivers/usb/cdns3/gadget.c                         | 2751 ++++++++++++++++=
++++
 drivers/usb/cdns3/gadget.h                         | 1338 ++++++++++
 drivers/usb/cdns3/host-export.h                    |   28 +
 drivers/usb/cdns3/host.c                           |   74 +
 drivers/usb/cdns3/trace.c                          |   11 +
 drivers/usb/cdns3/trace.h                          |  493 ++++
 drivers/usb/common/Makefile                        |    1 +
 drivers/usb/common/debug.c                         |  268 ++
 drivers/usb/dwc2/gadget.c                          |    9 +-
 drivers/usb/dwc2/params.c                          |    5 +-
 drivers/usb/dwc3/core.c                            |   59 +-
 drivers/usb/dwc3/core.h                            |    2 +
 drivers/usb/dwc3/debug.h                           |  252 --
 drivers/usb/dwc3/dwc3-keystone.c                   |    4 +-
 drivers/usb/dwc3/dwc3-meson-g12a.c                 |   18 +-
 drivers/usb/dwc3/dwc3-omap.c                       |   11 +-
 drivers/usb/dwc3/dwc3-st.c                         |   10 +-
 drivers/usb/dwc3/gadget.c                          |   24 +-
 drivers/usb/dwc3/host.c                            |   22 +-
 drivers/usb/dwc3/trace.h                           |    2 +-
 drivers/usb/gadget/composite.c                     |   38 +-
 drivers/usb/gadget/udc/aspeed-vhub/core.c          |    6 +-
 drivers/usb/gadget/udc/aspeed-vhub/dev.c           |   80 +-
 drivers/usb/gadget/udc/aspeed-vhub/ep0.c           |   59 +-
 drivers/usb/gadget/udc/aspeed-vhub/epn.c           |    2 +-
 drivers/usb/gadget/udc/aspeed-vhub/hub.c           |   15 +-
 drivers/usb/gadget/udc/aspeed-vhub/vhub.h          |    3 +-
 drivers/usb/gadget/udc/atmel_usba_udc.c            |    1 +
 drivers/usb/gadget/udc/core.c                      |    2 +-
 drivers/usb/gadget/udc/lpc32xx_udc.c               |   11 +-
 drivers/usb/gadget/udc/net2280.c                   |   38 +-
 drivers/usb/gadget/udc/net2280.h                   |    3 -
 drivers/usb/gadget/udc/pch_udc.c                   |    3 +-
 drivers/usb/gadget/udc/s3c2410_udc.c               |    2 +
 drivers/usb/phy/phy-fsl-usb.c                      |    2 +-
 include/linux/platform_data/dwc3-omap.h            |   43 -
 include/linux/usb/ch9.h                            |   27 +
 include/linux/usb/gadget.h                         |    3 +
 include/linux/usb/hcd.h                            |    4 +
 include/linux/usb/usb338x.h                        |   35 +-
 include/uapi/linux/usb/ch9.h                       |    2 +
 54 files changed, 7966 insertions(+), 485 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/cdns-usb3.txt
 create mode 100644 drivers/usb/cdns3/Kconfig
 create mode 100644 drivers/usb/cdns3/Makefile
 create mode 100644 drivers/usb/cdns3/cdns3-pci-wrap.c
 create mode 100644 drivers/usb/cdns3/core.c
 create mode 100644 drivers/usb/cdns3/core.h
 create mode 100644 drivers/usb/cdns3/debug.h
 create mode 100644 drivers/usb/cdns3/drd.c
 create mode 100644 drivers/usb/cdns3/drd.h
 create mode 100644 drivers/usb/cdns3/ep0.c
 create mode 100644 drivers/usb/cdns3/gadget-export.h
 create mode 100644 drivers/usb/cdns3/gadget.c
 create mode 100644 drivers/usb/cdns3/gadget.h
 create mode 100644 drivers/usb/cdns3/host-export.h
 create mode 100644 drivers/usb/cdns3/host.c
 create mode 100644 drivers/usb/cdns3/trace.c
 create mode 100644 drivers/usb/cdns3/trace.h
 create mode 100644 drivers/usb/common/debug.c
 delete mode 100644 include/linux/platform_data/dwc3-omap.h

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl1o6PQACgkQzL64meEa
mQZOBQ/+M7zZzWF3AdlwRirq7Z83ltUIS/XCGPfoCwl9JvJc5tpft7JZ2ATbbHjq
cQcTcukjbVkWAN0CT0TH+4c7VImK8AwDirlkjPz0UUWLlIh6BygRneLLW107Y1Jn
BbhBDj+bjEKkDzZgjV5m+7TqbPQMjBUp372KNlrmYWHHm6oblFRC76CRaN8PnUcG
HKqO2nOFE1tbk5leizbdggVLInZ2Hi7s/fxiIn6xcabD+1dpMC5rFjOMkrJZq+a3
SDSjkuAWtXNhdzhBfn2spKyiVkHQmDvNwAXk+Gm63bAIfv84wM2QsnhGGz9pXrHS
LokZGcYehnFBYmAObnpRhKSY6jDs5eMSTcOD05cSEFR2UQssfMmKkBmqT/yuVEG6
lY7Q7ylEdvLOJkcp+SXoiZ/uCMnoM+yy3Rj26k4WvP4VyKPZJbewh0Ev4DEfuVYt
daOB5+8AHoq1k/mNIvg19KLO2DIIQym7bv3VVTm9OgT2MxyBy1gU03+qbUTrJzmA
sfiNJzvEM3bLapgzH7MhcrqmvpSVVxwmFd+Y+FSjKf40dlfPS8f6OzQXx6RbyU3w
ceXMliVBDUamyru6tLb+UHJMbBpbKCFzE3rjH4F9x8rjW3hseyLWjXdw0L4bjSmZ
KVyz3wTd4gbLYCadC1jHbzLU4n18JMpOJGxfcfMVft3EDBxYcBQ=
=nGdw
-----END PGP SIGNATURE-----
--=-=-=--

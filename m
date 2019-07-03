Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1BEC25E2FC
	for <lists+linux-usb@lfdr.de>; Wed,  3 Jul 2019 13:41:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726550AbfGCLlj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 3 Jul 2019 07:41:39 -0400
Received: from mga18.intel.com ([134.134.136.126]:6625 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725820AbfGCLlj (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 3 Jul 2019 07:41:39 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 03 Jul 2019 04:41:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,446,1557212400"; 
   d="scan'208";a="165960186"
Received: from pipin.fi.intel.com (HELO pipin) ([10.237.72.175])
  by fmsmga007.fm.intel.com with ESMTP; 03 Jul 2019 04:41:36 -0700
From:   Felipe Balbi <felipe.balbi@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [GIT PULL part2] USB: changes for v5.3 merge window
Date:   Wed, 03 Jul 2019 14:41:36 +0300
Message-ID: <87a7dv4a6n.fsf@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Hi Greg,

Hopefully there's still time to merge these other patches.

They came a little late but should be safe to merge. I've tested what I
could with platforms I had.

The biggest thing here is the new Cadence USB DRD controller driver and
an important fix on dwc2.

cheers

The following changes since commit aa23ce847ddac1fd5ffe987ff12e12ff48318e45:

  usb: dwc3: remove unused @lock member of dwc3_ep struct (2019-06-20 11:50:19 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git tags/usb-for-v5.3-part2

for you to fetch changes up to b2357839c56ab7d06bcd4e866ebc2d0e2b7997f3:

  usb: renesas_usbhs: add a workaround for a race condition of workqueue (2019-07-03 11:00:50 +0300)

----------------------------------------------------------------
USB: more changes for v5.3 merge window

Turns out a few more important changes came about. We have the new
Cadence DRD Driver being added here and that's the biggest, most
important part.

Together with that we have suport for new imx7ulp phy. Support for
TigerLake Devices on dwc3. Also a couple important fixes which weren't
completed in time for the -rc cycle.

Signed-off-by: Felipe Balbi <felipe.balbi@linux.intel.com>

----------------------------------------------------------------
Colin Ian King (1):
      usb: gadget: udc: renesas_usb3: remove redundant assignment to ret

Felipe Balbi (1):
      usb: dwc3: pci: add support for TigerLake Devices

Hariprasad Kelam (1):
      USB: gadget: function: fix issue Unneeded variable: "value"

Martin Blumenstingl (1):
      usb: dwc2: use a longer AHB idle timeout in dwc2_core_reset()

Pawel Laszczak (6):
      dt-bindings: add binding for USBSS-DRD controller.
      usb:gadget Separated decoding functions from dwc3 driver.
      usb:gadget Patch simplify usb_decode_set_clear_feature function.
      usb:gadget Simplify usb_decode_get_set_descriptor function.
      usb:cdns3 Add Cadence USB3 DRD Driver
      usb:cdns3 Fix for stuck packets in on-chip OUT buffer.

Peter Chen (2):
      doc: dt-binding: mxs-usb-phy: add compatible for 7ulp
      usb: phy: phy-mxs-usb: add imx7ulp support

Yoshihiro Shimoda (1):
      usb: renesas_usbhs: add a workaround for a race condition of workqueue

 .../devicetree/bindings/phy/mxs-usb-phy.txt        |    3 +-
 .../devicetree/bindings/usb/cdns-usb3.txt          |   45 +
 drivers/usb/Kconfig                                |    2 +
 drivers/usb/Makefile                               |    2 +
 drivers/usb/cdns3/Kconfig                          |   44 +
 drivers/usb/cdns3/Makefile                         |   14 +
 drivers/usb/cdns3/cdns3-pci-wrap.c                 |  157 ++
 drivers/usb/cdns3/core.c                           |  543 ++++
 drivers/usb/cdns3/core.h                           |  121 +
 drivers/usb/cdns3/debug.h                          |  173 ++
 drivers/usb/cdns3/debugfs.c                        |  153 ++
 drivers/usb/cdns3/drd.c                            |  379 +++
 drivers/usb/cdns3/drd.h                            |  166 ++
 drivers/usb/cdns3/ep0.c                            |  920 +++++++
 drivers/usb/cdns3/gadget-export.h                  |   28 +
 drivers/usb/cdns3/gadget.c                         | 2645 ++++++++++++++++++++
 drivers/usb/cdns3/gadget.h                         | 1334 ++++++++++
 drivers/usb/cdns3/host-export.h                    |   28 +
 drivers/usb/cdns3/host.c                           |   76 +
 drivers/usb/cdns3/trace.c                          |   23 +
 drivers/usb/cdns3/trace.h                          |  447 ++++
 drivers/usb/dwc2/core.c                            |    2 +-
 drivers/usb/dwc3/debug.h                           |  252 --
 drivers/usb/dwc3/dwc3-pci.c                        |    4 +
 drivers/usb/dwc3/trace.h                           |    2 +-
 drivers/usb/gadget/Makefile                        |    1 +
 drivers/usb/gadget/debug.c                         |  268 ++
 drivers/usb/gadget/function/f_eem.c                |    3 +-
 drivers/usb/gadget/udc/renesas_usb3.c              |    2 +-
 drivers/usb/phy/phy-mxs-usb.c                      |   67 +-
 drivers/usb/renesas_usbhs/fifo.c                   |   34 +-
 include/linux/usb/gadget.h                         |   26 +
 32 files changed, 7693 insertions(+), 271 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/cdns-usb3.txt
 create mode 100644 drivers/usb/cdns3/Kconfig
 create mode 100644 drivers/usb/cdns3/Makefile
 create mode 100644 drivers/usb/cdns3/cdns3-pci-wrap.c
 create mode 100644 drivers/usb/cdns3/core.c
 create mode 100644 drivers/usb/cdns3/core.h
 create mode 100644 drivers/usb/cdns3/debug.h
 create mode 100644 drivers/usb/cdns3/debugfs.c
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
 create mode 100644 drivers/usb/gadget/debug.c

-- 
balbi

Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9213D57D86
	for <lists+linux-usb@lfdr.de>; Thu, 27 Jun 2019 09:55:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726382AbfF0Hzv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 Jun 2019 03:55:51 -0400
Received: from mga03.intel.com ([134.134.136.65]:45090 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725787AbfF0Hzu (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 27 Jun 2019 03:55:50 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 27 Jun 2019 00:55:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,423,1557212400"; 
   d="scan'208";a="162560246"
Received: from pipin.fi.intel.com (HELO pipin) ([10.237.72.175])
  by fmsmga008.fm.intel.com with ESMTP; 27 Jun 2019 00:55:48 -0700
From:   Felipe Balbi <felipe.balbi@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [GIT PULL] USB: changes for v5.3 merge window
Date:   Thu, 27 Jun 2019 10:55:47 +0300
Message-ID: <87y31nea2k.fsf@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Hi Greg,

Here's my pull request for v5.3 merge window. Relevant patches have been
tested on platforms I have available.

Let me know if you want anything to be changed

cheers

The following changes since commit a954e5fb4bc2d401b8fc3b4c7cd316497ff80225:

  Merge 5.2-rc5 into usb-next (2019-06-17 11:23:24 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git tags/usb-for-v5.3

for you to fetch changes up to aa23ce847ddac1fd5ffe987ff12e12ff48318e45:

  usb: dwc3: remove unused @lock member of dwc3_ep struct (2019-06-20 11:50:19 +0300)

----------------------------------------------------------------
usb: changes for v5.3 merge window

The biggest part here is a set of patches removing unnecesary variables
from several drivers.

Meson-g12a's dwc3 glue implemented IRQ-based OTG/DRD role swap.

Qcom's dwc3 glue added support for ACPI, mainly for the AArch64-based
SoCs.

DWC3 also got support for Intel Elkhart Lake platforms.

----------------------------------------------------------------
Andrzej Pietrasiewicz (1):
      usb: gadget: Zero ffs_io_data

Anurag Kumar Vulisha (3):
      doc: dt: bindings: usb: dwc3: Update entries for disabling U1 and U2
      usb: gadget: send usb_gadget as an argument in get_config_params
      usb: dwc3: gadget: Add support for disabling U1 and U2 entries

Biju Das (1):
      usb: gadget: udc: renesas_usb3: Enhance role switch support

Chunfeng Yun (1):
      usb: dwc3: remove unused @lock member of dwc3_ep struct

Colin Ian King (1):
      usb: gadget: net2272: remove redundant assignments to pointer 's'

Daniel M German (1):
      usb: Replace snprintf with scnprintf in gether_get_ifname

Douglas Anderson (3):
      Documentation: dt-bindings: Add snps,need-phy-for-wake for dwc2 USB
      ARM: dts: rockchip: Allow wakeup from rk3288-veyron's dwc2 USB ports
      USB: dwc2: Don't turn off the usbphy in suspend if wakeup is enabled

EJ Hsu (1):
      usb: gadget: storage: Remove warning message

Enric Balletbo i Serra (1):
      usb: dwc3: Fix core validation in probe, move after clocks are enabled

Fei Yang (1):
      usb: gadget: f_fs: data_len used before properly set

Felipe Balbi (1):
      usb: dwc3: pci: Add Support for Intel Elkhart Lake Devices

Guenter Roeck (1):
      Revert "usb: dwc2: host: Setting qtd to NULL after freeing it"

Hariprasad Kelam (3):
      usb: gadget: at91_udc: Remove unneeded variable
      fotg210-udc: Remove unneeded variable
      USB: omap_udc: Remove unneeded variable

Jonas Stenvall (1):
      usb: gadget: u_audio: Fixed variable declaration coding style issue

Kefeng Wang (1):
      usb: dwc3: qcom: Use of_clk_get_parent_count()

Kiruthika Varadarajan (1):
      usb: gadget: ether: Fix race between gether_disconnect and rx_submit

Lee Jones (4):
      soc: qcom: geni: Add support for ACPI
      usb: dwc3: qcom: Add support for booting with ACPI
      usb: dwc3: qcom: Start USB in 'host mode' on the SDM845
      usb: dwc3: qcom: Improve error handling

Marek Szyprowski (1):
      usb: dwc2: Force 8bit UTMI width for Samsung Exynos SoCs

Neil Armstrong (1):
      usb: dwc3: meson-g12a: Add support for IRQ based OTG switching

Simon Horman (2):
      dt-bindings: usb: renesas_usbhs: Rename bindings documentation file
      dt-bindings: usb: renesas_gen3: Rename bindings documentation file

 Documentation/devicetree/bindings/usb/dwc2.txt     |   3 +
 Documentation/devicetree/bindings/usb/dwc3.txt     |   2 +
 .../usb/{renesas_usb3.txt => renesas,usb3.txt}     |   0
 .../usb/{renesas_usbhs.txt => renesas,usbhs.txt}   |   0
 arch/arm/boot/dts/rk3288-veyron.dtsi               |   2 +
 drivers/soc/qcom/qcom-geni-se.c                    |  21 +-
 drivers/usb/dwc2/core.h                            |   8 +
 drivers/usb/dwc2/hcd.c                             |  20 +-
 drivers/usb/dwc2/hcd.h                             |   1 -
 drivers/usb/dwc2/params.c                          |   1 +
 drivers/usb/dwc2/platform.c                        |  23 ++-
 drivers/usb/dwc3/Kconfig                           |   2 +-
 drivers/usb/dwc3/core.c                            |  16 +-
 drivers/usb/dwc3/core.h                            |   6 +-
 drivers/usb/dwc3/dwc3-meson-g12a.c                 |  36 +++-
 drivers/usb/dwc3/dwc3-pci.c                        |   4 +
 drivers/usb/dwc3/dwc3-qcom.c                       | 224 ++++++++++++++++++---
 drivers/usb/dwc3/ep0.c                             |   9 +-
 drivers/usb/dwc3/gadget.c                          |  22 +-
 drivers/usb/dwc3/gadget.h                          |   6 +
 drivers/usb/gadget/composite.c                     |   2 +-
 drivers/usb/gadget/function/f_fs.c                 |   9 +-
 drivers/usb/gadget/function/f_mass_storage.c       |  21 +-
 drivers/usb/gadget/function/storage_common.h       |   1 +
 drivers/usb/gadget/function/u_audio.c              |   4 +-
 drivers/usb/gadget/function/u_ether.c              |  10 +-
 drivers/usb/gadget/udc/at91_udc.c                  |   3 +-
 drivers/usb/gadget/udc/fotg210-udc.c               |   3 +-
 drivers/usb/gadget/udc/net2272.c                   |   5 -
 drivers/usb/gadget/udc/omap_udc.c                  |   3 +-
 drivers/usb/gadget/udc/renesas_usb3.c              |  91 ++++++++-
 include/linux/usb/gadget.h                         |   3 +-
 32 files changed, 469 insertions(+), 92 deletions(-)
 rename Documentation/devicetree/bindings/usb/{renesas_usb3.txt => renesas,usb3.txt} (100%)
 rename Documentation/devicetree/bindings/usb/{renesas_usbhs.txt => renesas,usbhs.txt} (100%)

-- 
balbi

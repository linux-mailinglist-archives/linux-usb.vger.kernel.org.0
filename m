Return-Path: <linux-usb+bounces-3314-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A737F8E3C
	for <lists+linux-usb@lfdr.de>; Sat, 25 Nov 2023 20:51:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B8D452815B2
	for <lists+linux-usb@lfdr.de>; Sat, 25 Nov 2023 19:51:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 651302FE1E;
	Sat, 25 Nov 2023 19:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="jppHXEuP"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB8F2FC31
	for <linux-usb@vger.kernel.org>; Sat, 25 Nov 2023 19:51:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4AB0C433C8;
	Sat, 25 Nov 2023 19:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1700941885;
	bh=EZ3qbIzxDN+r4YbwzuYITpWKIFaN0QsTVMvHG7JTcms=;
	h=Date:From:To:Cc:Subject:From;
	b=jppHXEuPxF4KJhITemRoOA1zDpqYZ+Mhn8RocVdUGZSCOGqyd9rILITdM4t2zgaE1
	 3KGJZeFJP80VsWuoEOub/bcaoZHvshIl1lFmzTA+sofWyj2O+ypUrZ4bXF79a5ylBw
	 kzzdjYYhVIWntcjw5LGgYTRSiIcKWy5q4W0gfakw=
Date: Sat, 25 Nov 2023 19:51:23 +0000
From: Greg KH <gregkh@linuxfoundation.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [GIT PULL] USB/PHY/Thunderbolt driver fixes for 6.7-rc3
Message-ID: <ZWJQOw3VcmTOB62a@kroah.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 98b1cc82c4affc16f5598d4fa14b1858671b2263:

  Linux 6.7-rc2 (2023-11-19 15:02:14 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-6.7-rc3

for you to fetch changes up to cb9a830e871779b4f9b8d5f76a2abf24915cd007:

  Merge tag 'usb-serial-6.7-rc3' of https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial into usb-linus (2023-11-24 16:30:38 +0000)

----------------------------------------------------------------
USB / PHY / Thunderbolt fixes and ids for 6.7-rc3

Here are a number of reverts, fixes, and new device ids for 6.7-rc3 for
the USB, PHY, and Thunderbolt driver subsystems.  Include in here are:
  - reverts of some PHY drivers that went into 6.7-rc1 that shouldn't
    have been merged yet, the author is reworking them based on review
    comments as they were using older apis that shouldn't be used
    anymore for newer drivers
  - small thunderbolt driver fixes for reported issues
  - USB driver fixes for a variety of small issues in dwc3, typec, xhci,
    and other smaller drivers.
  - new device ids for usb-serial and onboard_usb_hub drivers.

All of these have been in linux-next with no reported issues.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

----------------------------------------------------------------
Alexander Stein (1):
      usb: dwc3: Fix default mode initialization

Asuna Yang (1):
      USB: serial: option: add Luat Air72*U series products

Badhri Jagan Sridharan (2):
      usb: typec: tcpm: Skip hard reset when in error recovery
      usb: typec: tcpm: Fix sink caps op current check

Christophe JAILLET (1):
      USB: typec: tps6598x: Fix a memory leak in an error handling path

Chunfeng Yun (1):
      usb: xhci-mtk: fix in-ep's start-split check failure

Gil Fine (1):
      thunderbolt: Set lane bonding bit only for downstream port

Greg Kroah-Hartman (2):
      Merge tag 'thunderbolt-for-v6.7-rc3' of git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt into usb-linus
      Merge tag 'usb-serial-6.7-rc3' of https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial into usb-linus

Hans de Goede (1):
      usb: misc: ljca: Fix enumeration error on Dell Latitude 9420

Heikki Krogerus (1):
      usb: typec: tipd: Supply also I2C driver data

Johan Hovold (11):
      Revert "phy: realtek: usb: Add driver for the Realtek SoC USB 3.0 PHY"
      Revert "phy: realtek: usb: Add driver for the Realtek SoC USB 2.0 PHY"
      Revert "usb: phy: add usb phy notify port status API"
      dt-bindings: usb: hcd: add missing phy name to example
      USB: xhci-plat: fix legacy PHY double init
      dt-bindings: usb: qcom,dwc3: fix example wakeup interrupt types
      USB: dwc3: qcom: fix wakeup after probe deferral
      USB: dwc3: qcom: simplify wakeup interrupt setup
      USB: dwc3: qcom: fix resource leaks on probe deferral
      USB: dwc3: qcom: fix software node leak on probe errors
      USB: dwc3: qcom: fix ACPI platform device leak

Lech Perczak (1):
      USB: serial: option: don't claim interface 4 for ZTE MF290

Mika Westerberg (2):
      thunderbolt: Send uevent after asymmetric/symmetric switch
      thunderbolt: Only add device router DP IN to the head of the DP resource list

Niklas Neronin (1):
      usb: config: fix iteration issue in 'usb_get_bos_descriptor()'

Oliver Neukum (1):
      USB: dwc2: write HCINT with INTMASK applied

Pawel Laszczak (1):
      usb: cdnsp: Fix deadlock issue during using NCM gadget

Puliang Lu (1):
      USB: serial: option: fix FM101R-GL defines

Ricardo Ribalda (1):
      usb: dwc3: set the dma max_seg_size

Stanley Chang (1):
      usb: dwc3: add missing of_node_put and platform_device_put

Stefan Eichenberger (2):
      dt-bindings: usb: microchip,usb5744: Add second supply
      usb: misc: onboard-hub: add support for Microchip USB5744

Victor Fragoso (1):
      USB: serial: option: add Fibocom L7xx modules

Wentong Wu (1):
      usb: misc: ljca: Drop _ADR support to get ljca children devices

 .../devicetree/bindings/usb/microchip,usb5744.yaml |    7 +-
 .../devicetree/bindings/usb/qcom,dwc3.yaml         |    4 +-
 Documentation/devicetree/bindings/usb/usb-hcd.yaml |    2 +-
 drivers/phy/Kconfig                                |    1 -
 drivers/phy/Makefile                               |    1 -
 drivers/phy/realtek/Kconfig                        |   32 -
 drivers/phy/realtek/Makefile                       |    3 -
 drivers/phy/realtek/phy-rtk-usb2.c                 | 1325 --------------------
 drivers/phy/realtek/phy-rtk-usb3.c                 |  761 -----------
 drivers/thunderbolt/switch.c                       |    6 +-
 drivers/thunderbolt/tb.c                           |   12 +-
 drivers/usb/cdns3/cdnsp-ring.c                     |    3 +
 drivers/usb/core/config.c                          |    3 +-
 drivers/usb/core/hub.c                             |   23 -
 drivers/usb/dwc2/hcd_intr.c                        |   15 +-
 drivers/usb/dwc3/core.c                            |    2 +
 drivers/usb/dwc3/drd.c                             |    2 +-
 drivers/usb/dwc3/dwc3-qcom.c                       |   69 +-
 drivers/usb/dwc3/dwc3-rtk.c                        |    8 +-
 drivers/usb/host/xhci-mtk-sch.c                    |   13 +-
 drivers/usb/host/xhci-mtk.h                        |    2 +
 drivers/usb/host/xhci-plat.c                       |   50 +-
 drivers/usb/misc/onboard_usb_hub.c                 |    2 +
 drivers/usb/misc/onboard_usb_hub.h                 |    7 +
 drivers/usb/misc/usb-ljca.c                        |   17 +-
 drivers/usb/serial/option.c                        |   11 +-
 drivers/usb/typec/tcpm/tcpm.c                      |   12 +-
 drivers/usb/typec/tipd/core.c                      |   14 +-
 include/linux/usb/phy.h                            |   13 -
 29 files changed, 175 insertions(+), 2245 deletions(-)
 delete mode 100644 drivers/phy/realtek/Kconfig
 delete mode 100644 drivers/phy/realtek/Makefile
 delete mode 100644 drivers/phy/realtek/phy-rtk-usb2.c
 delete mode 100644 drivers/phy/realtek/phy-rtk-usb3.c


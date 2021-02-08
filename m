Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FB79313333
	for <lists+linux-usb@lfdr.de>; Mon,  8 Feb 2021 14:27:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230461AbhBHN0k (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 8 Feb 2021 08:26:40 -0500
Received: from mail.kernel.org ([198.145.29.99]:56794 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231178AbhBHNYh (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 8 Feb 2021 08:24:37 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id A3B2C64EA1;
        Mon,  8 Feb 2021 13:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612790565;
        bh=65Gp+ddQ6Sn9QymRej9HRufnC4GaYF5KIJCVkGXLsr0=;
        h=Date:From:To:Cc:Subject:From;
        b=tAKDz4PCoo664Mw+QWD77qAg78N8imYL/qphUvQ0CNWb2g59tBILZseaUnvYNI7V8
         avFam8jk5mYeIuMqPQE+W8LUT8rWjGRTISHWYmw2+Tt6H0s4MhKDoNTgiRIsyGaUIA
         EJwUojAKSlyLCPGxWcd2Va3PXmqOMdeEn1BSRPLWJfRk1oJXoai55ovEGhktMq4C27
         5ypfbIO8/pc8BwG2SGTZMmZ/DVQHlHLfj7cgHrLQkqZt3n2gVzSOgGqp36Ftwq10Zr
         TqhjiabRQml0efenMb3Pal0PWGCOVXYd8vFN0Jr1ZKpMn/N6EHieEFlUXB09aeDpQB
         1nNli48YOy2qA==
Date:   Mon, 8 Feb 2021 21:22:38 +0800
From:   Peter Chen <peter.chen@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [GIT PULL] usb: changes for v5.12-rc1
Message-ID: <20210208132238.GA16704@b29397-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/peter.chen/usb.git/ tags/usb-v5.12-rc1

for you to fetch changes up to 1ee18ded86ece87227a76d7101034fd305b8c803:

  usb: cdnsp: Removes some useless trace events (2021-02-06 15:43:52 +0800)

----------------------------------------------------------------
In v5.12-rc1, it adds cdnsp drivers for Cadence USB3 Family,
it is different UDC driver with current cdns3 driver.

----------------------------------------------------------------
Aswath Govindraju (1):
      usb: cdns3: Add support for TI's AM64 SoC

Pawel Laszczak (19):
      usb: cdns3: Add support for DRD CDNSP
      usb: cdns3: Split core.c into cdns3-plat and core.c file
      usb: cdns3: Moves reusable code to separate module
      usb: cdns3: Refactoring names in reusable code
      usb: cdns3: Changed type of gadget_dev in cdns structure
      usb: cdnsp: Device side header file for CDNSP driver
      usb: cdnsp: cdns3 Add main part of Cadence USBSSP DRD Driver
      usb: cdnsp: Add tracepoints for CDNSP driver
      usb: cdns3: Change file names for cdns3 driver.
      MAINTAINERS: add Cadence USBSSP DRD IP driver entry
      usb: cdnsp: Removes some not useful function arguments
      usb: cdns3: Removes xhci_cdns3_suspend_quirk from host-export.h
      usb: cdnsp: fix error handling in cdnsp_mem_init()
      usb: cdns3: Fixes for sparse warnings
      usb: cdnsp: Fixes for sparse warnings
      usb: cdnsp: Fix for undefined reference to `usb_hcd_is_primary_hcd'
      usb: cdns3: Adds missing __iomem markers
      usb: cdnsp: fixes undefined reference to cdns_remove
      usb: cdnsp: Removes some useless trace events

Randy Dunlap (2):
      usb: cdns3: fix build when PM_SLEEP is not set
      usb: cdns3: fix warning when USB_CDNS_HOST is not set

Zou Wei (1):
      usb: cdnsp: Mark cdnsp_gadget_ops with static keyword

 MAINTAINERS                                    |    9 +
 drivers/usb/Makefile                           |    2 +
 drivers/usb/cdns3/Kconfig                      |   60 +-
 drivers/usb/cdns3/Makefile                     |   43 +-
 drivers/usb/cdns3/{debug.h => cdns3-debug.h}   |    0
 drivers/usb/cdns3/{ep0.c => cdns3-ep0.c}       |    8 +-
 drivers/usb/cdns3/{gadget.c => cdns3-gadget.c} |   34 +-
 drivers/usb/cdns3/{gadget.h => cdns3-gadget.h} |    0
 drivers/usb/cdns3/cdns3-imx.c                  |    2 +-
 drivers/usb/cdns3/cdns3-plat.c                 |  315 +++
 drivers/usb/cdns3/cdns3-ti.c                   |    1 +
 drivers/usb/cdns3/{trace.c => cdns3-trace.c}   |    2 +-
 drivers/usb/cdns3/{trace.h => cdns3-trace.h}   |    6 +-
 drivers/usb/cdns3/cdnsp-debug.h                |  583 ++++++
 drivers/usb/cdns3/cdnsp-ep0.c                  |  489 +++++
 drivers/usb/cdns3/cdnsp-gadget.c               | 2009 +++++++++++++++++++
 drivers/usb/cdns3/cdnsp-gadget.h               | 1601 ++++++++++++++++
 drivers/usb/cdns3/cdnsp-mem.c                  | 1336 +++++++++++++
 drivers/usb/cdns3/cdnsp-pci.c                  |  254 +++
 drivers/usb/cdns3/cdnsp-ring.c                 | 2438 ++++++++++++++++++++++++
 drivers/usb/cdns3/cdnsp-trace.c                |   12 +
 drivers/usb/cdns3/cdnsp-trace.h                |  830 ++++++++
 drivers/usb/cdns3/core.c                       |  455 ++---
 drivers/usb/cdns3/core.h                       |   65 +-
 drivers/usb/cdns3/drd.c                        |  224 ++-
 drivers/usb/cdns3/drd.h                        |   94 +-
 drivers/usb/cdns3/gadget-export.h              |   22 +-
 drivers/usb/cdns3/host-export.h                |   18 +-
 drivers/usb/cdns3/host.c                       |   26 +-
 29 files changed, 10415 insertions(+), 523 deletions(-)
 rename drivers/usb/cdns3/{debug.h => cdns3-debug.h} (100%)
 rename drivers/usb/cdns3/{ep0.c => cdns3-ep0.c} (99%)
 rename drivers/usb/cdns3/{gadget.c => cdns3-gadget.c} (99%)
 rename drivers/usb/cdns3/{gadget.h => cdns3-gadget.h} (100%)
 create mode 100644 drivers/usb/cdns3/cdns3-plat.c
 rename drivers/usb/cdns3/{trace.c => cdns3-trace.c} (89%)
 rename drivers/usb/cdns3/{trace.h => cdns3-trace.h} (99%)
 create mode 100644 drivers/usb/cdns3/cdnsp-debug.h
 create mode 100644 drivers/usb/cdns3/cdnsp-ep0.c
 create mode 100644 drivers/usb/cdns3/cdnsp-gadget.c
 create mode 100644 drivers/usb/cdns3/cdnsp-gadget.h
 create mode 100644 drivers/usb/cdns3/cdnsp-mem.c
 create mode 100644 drivers/usb/cdns3/cdnsp-pci.c
 create mode 100644 drivers/usb/cdns3/cdnsp-ring.c
 create mode 100644 drivers/usb/cdns3/cdnsp-trace.c
 create mode 100644 drivers/usb/cdns3/cdnsp-trace.h

-- 

Thanks,
Peter Chen


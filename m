Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A869D13C29D
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jan 2020 14:25:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729047AbgAONZu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Jan 2020 08:25:50 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:49138 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728904AbgAONZu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Jan 2020 08:25:50 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00FDPmWq068993;
        Wed, 15 Jan 2020 07:25:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1579094749;
        bh=Nzs7AVB+5S1N+P2Vwdzl0tfng7Wsg4zagWwcw1Qp7Ds=;
        h=From:To:CC:Subject:Date;
        b=vr3eUy6IH4dfWSnOKWSJ7SrWKY+13X/fFfcXKdju6zHtO0B+nEnlatADaUibm+e66
         lUzP065HoHl1DrhsadhKyfcM8CFjt4myAGjPlckJonikX8SlcAy8Ofx0KGagrWOpWr
         9fU+NUrj8OFDOs/Og+P4NZdtrTzYlcdF+rYTuZ0M=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00FDPmAl019829
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 15 Jan 2020 07:25:48 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 15
 Jan 2020 07:25:48 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 15 Jan 2020 07:25:48 -0600
Received: from uda0271908.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00FDPm2w066537;
        Wed, 15 Jan 2020 07:25:48 -0600
From:   Bin Liu <b-liu@ti.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Bin Liu <b-liu@ti.com>
Subject: [PATCH 00/25] musb patches for v5.6-rc1
Date:   Wed, 15 Jan 2020 07:25:22 -0600
Message-ID: <20200115132547.364-1-b-liu@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

Here are musb patches for the v5.6 merge window. The major work is
adding support of MediaTek device, jz4740 glue driver cleanup,
improvement in omap2430 glue driver, and other non-critical fixes
and cleanup.

Please let me know if anything change is needed.

Thanks,
-Bin.
---

Ben Dooks (Codethink) (1):
  USB: musb: fix __iomem in trace functions

Bin Liu (1):
  usb: musb: remove dummy driver musb_am335x.c

Linus Walleij (1):
  usb: musb: davinci: Convert to use GPIO descriptor

Mans Rullgard (1):
  usb: musb: sunxi: propagate devicetree node to glue pdev

Min Guo (5):
  dt-bindings: usb: musb: Add support for MediaTek musb controller
  usb: musb: Add get/set toggle hooks
  usb: musb: Add noirq type of dma create interface
  usb: musb: Add musb_clearb/w() interface
  usb: musb: Add support for MediaTek musb controller

Paul Cercueil (7):
  usb: musb: jz4740: Drop dependency on NOP_USB_XCEIV
  usb: musb: jz4740: Suppress useless field in priv structure
  usb: musb: jz4740: Add local dev variable to clean up probe
  usb: musb: jz4740: Constify jz4740_musb_pdata struct
  usb: musb: jz4740: Rename platform_device field in priv struct
  usb: musb: jz4740: Comments fix
  usb: musb: jz4740: Whitespace and indentation fixes

Peter Ujfalusi (1):
  usb: musb/ux500: Use dma_request_chan() instead
    dma_request_slave_channel()

Saurav Girepunje (1):
  usb: musb: core: Update the function description

Tony Lindgren (7):
  usb: musb: omap2430: Get rid of musb .set_vbus for omap2430 glue
  usb: musb: omap2430: Wait on enable to avoid babble
  usb: musb: omap2430: Handle multiple ID ground interrupts
  usb: musb: Add musb_set_host and peripheral and use them for omap2430
  usb: musb: omap2430: Clean up enable and remove devctl tinkering
  usb: musb: omap2430: Idle musb on init
  usb: musb: Get rid of omap2430_musb_set_vbus()

 .../devicetree/bindings/usb/mediatek,musb.txt |  57 ++
 arch/arm/mach-davinci/board-dm644x-evm.c      |  12 +
 drivers/usb/musb/Kconfig                      |  12 +-
 drivers/usb/musb/Makefile                     |   4 +-
 drivers/usb/musb/davinci.c                    |  57 +-
 drivers/usb/musb/jz4740.c                     |  75 ++-
 drivers/usb/musb/mediatek.c                   | 582 ++++++++++++++++++
 drivers/usb/musb/musb_am335x.c                |  44 --
 drivers/usb/musb/musb_core.c                  | 188 +++++-
 drivers/usb/musb/musb_core.h                  |  20 +-
 drivers/usb/musb/musb_dma.h                   |   9 +
 drivers/usb/musb/musb_host.c                  |  46 +-
 drivers/usb/musb/musb_io.h                    |  18 +-
 drivers/usb/musb/musb_trace.h                 |  33 +-
 drivers/usb/musb/musbhsdma.c                  |  56 +-
 drivers/usb/musb/omap2430.c                   | 164 ++---
 drivers/usb/musb/sunxi.c                      |   6 +-
 drivers/usb/musb/tusb6010.c                   |   2 +-
 drivers/usb/musb/ux500_dma.c                  |   4 +-
 19 files changed, 1061 insertions(+), 328 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/mediatek,musb.txt
 create mode 100644 drivers/usb/musb/mediatek.c
 delete mode 100644 drivers/usb/musb/musb_am335x.c

-- 
2.17.1


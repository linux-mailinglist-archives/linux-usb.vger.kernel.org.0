Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C8BFDA89E
	for <lists+linux-usb@lfdr.de>; Thu, 17 Oct 2019 11:41:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408590AbfJQJlh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 17 Oct 2019 05:41:37 -0400
Received: from Mailgw01.mediatek.com ([1.203.163.78]:53750 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S2408545AbfJQJlg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 17 Oct 2019 05:41:36 -0400
X-UUID: d9eb524e9892462cb4c6904975ff1904-20191017
X-UUID: d9eb524e9892462cb4c6904975ff1904-20191017
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
        (envelope-from <min.guo@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 62743265; Thu, 17 Oct 2019 17:41:29 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 17 Oct 2019 17:41:27 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 17 Oct 2019 17:41:26 +0800
From:   <min.guo@mediatek.com>
To:     Bin Liu <b-liu@ti.com>, Rob Herring <robh+dt@kernel.org>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        <chunfeng.yun@mediatek.com>, <linux-usb@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>, <tony@atomide.com>,
        <hdegoede@redhat.com>, Min Guo <min.guo@mediatek.com>
Subject: [PATCH v8 0/6] Add MediaTek MUSB Controller Driver
Date:   Thu, 17 Oct 2019 17:41:20 +0800
Message-ID: <20191017094126.29045-1-min.guo@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: FB3BF1A217BFD1229CABD4B982252F67D94ED1EAC4AA9EE77E21371648E7B5FB2000:8
X-MTK:  N
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Min Guo <min.guo@mediatek.com>

These patches introduce the MediaTek MUSB controller driver.

The driver can be configured as Dual-Role Device (DRD),
Peripheral Only and Host Only modes. This has beed tested on
MT2701 with a variety of devices in host mode and with the 
f_mass gadget driver in peripheral mode, plugging otg cables
in/out a lot of times in all possible imaginable plug orders.

changes in v8:
changes of dt-bindings:
1. Add reviewed by Rob

changes in v7:
changes of dt-bindings and DTS:
1. Change compatible string
2. Change usb connector child node compatible as "gpio-usb-b-connector" 

changes in v6:
changes of dt-bindings:
1. Modify usb connector child node
changes of DTS:
1. Modify usb connector child node
changes of driver:
1. Add of_platform_populate in probe to populate connector platform_devices
   from device tree data
2. Replace extcon with usb role switch mechanism to support dual-role mode,
   depends on [1]
3. Remove set vbus function

    [1] [v6,09/10] usb: roles: add USB Type-B GPIO connector driver
        https://patchwork.kernel.org/patch/10966361/

changes in v5:
changes of dt-bindings suggested by Rob:
1. Modify compatible as 
- compatible : should be one of:
               "mediatek,mt-2701"
               ...
               followed by "mediatek,mtk-musb"
2. Add usb connector child node
changes of DTS:
1. Add usb connector child node
changes of driver suggested by Bin:
1. Replace musb_readb() with musb_clearb() to clear dma pending interrupts
2. Replace musb_readb() with musb_clearb() to clear common/tx/rx pending interrupts
3. Make musb_clearb/w() return the value of musb_readb/w()

changes in v4:
changes of dt-bindings suggested by Sergei:
1. String alignment
changes of driver suggested by Tony and Bin:
1. Add a new patch for set/get_toggle()
2. Add a new patch for noirq type of dma
3. Add a new patch musb_clearb/w()
4. Abondon patch "usb: musb: Delete the const attribute of addr parameter in readb/w/l hooks"

changes in v3:
changes of driver suggested by Bin:
1. Add a new patch for musb_readb/w/l() to remove const attribute 
2. Use is_out as function parameter in set_toggle/get_toggle() hooks
3. Remove 'u8/u16 data' parameter in clearb/w() hooks
4. Remove musb_default_clearb/w()
5. Replace musb_readb/w() with musb_clearb/w() to clear pending interrupts 
6. Add comments to clearb/w() hooks
7. Replace musb_save_toggle() with musb->io.get_toggle()
8. Replace musb_set_toggle() with musb->io.set_toggle()

changes in v2:
changes of dt-bindings suggested by Rob and Bin:
1. Modify DRC to DRD
2. Drop the "<soc-model>-musb" in compatible
3. Remove phy-names
4. Add space after comma in clock-names
dtsi:
1. Remove phy-names
changes of driver suggested by Bin:
1. Add a new patch for musb_set_toggle
2. Add summarize of MediaTek musb controller differences in the commit log
3. Abondon patch "usb: musb: Move musbhsdma macro definition to musb_dma.h"
4. Add "|| COMPILE_TEST" in Kconfig
5. Add musb_clearb() and musb_clearw() hooks
6. Add get_toggle() and set_toggle() hooks
7. Replace musb_readl() with musb_readw() to read 16bit toggle register
8. Move MediaTek's private toggle registers from musb_regs.h to mediatek.c
9. Create musbhs_dma_controller_create_noirq()

Min Guo (6):
  dt-bindings: usb: musb: Add support for MediaTek musb controller
  arm: dts: mt2701: Add usb2 device nodes
  usb: musb: Add get/set toggle hooks
  usb: musb: Add noirq type of dma create interface
  usb: musb: Add musb_clearb/w() interface
  usb: musb: Add support for MediaTek musb controller

 .../devicetree/bindings/usb/mediatek,musb.txt      |  55 ++
 arch/arm/boot/dts/mt2701-evb.dts                   |  21 +
 arch/arm/boot/dts/mt2701.dtsi                      |  33 ++
 drivers/usb/musb/Kconfig                           |   9 +-
 drivers/usb/musb/Makefile                          |   1 +
 drivers/usb/musb/mediatek.c                        | 582 +++++++++++++++++++++
 drivers/usb/musb/musb_core.c                       |  74 ++-
 drivers/usb/musb/musb_core.h                       |  13 +-
 drivers/usb/musb/musb_dma.h                        |   9 +
 drivers/usb/musb/musb_host.c                       |  46 +-
 drivers/usb/musb/musb_io.h                         |  12 +-
 drivers/usb/musb/musbhsdma.c                       |  56 +-
 drivers/usb/musb/sunxi.c                           |   4 +-
 drivers/usb/musb/tusb6010.c                        |   2 +-
 14 files changed, 845 insertions(+), 72 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/mediatek,musb.txt
 create mode 100644 drivers/usb/musb/mediatek.c

-- 
1.9.1


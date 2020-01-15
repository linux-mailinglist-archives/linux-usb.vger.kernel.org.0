Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ECDD613C2A5
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jan 2020 14:25:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729078AbgAONZy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Jan 2020 08:25:54 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:38464 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729061AbgAONZw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Jan 2020 08:25:52 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00FDPoqM118464;
        Wed, 15 Jan 2020 07:25:50 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1579094750;
        bh=pgdaN1JDgmrn/r4gh2cJjvJnseLAxqRaA5PufWDw0+8=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=F9Bc79WD6znewX6MhEXZbZ19vWJP+cl4XqtvFnWLlAsjSQieFmDZ7dA2TXYx/1/+W
         FY30xJAWo0KmTyoy3cIBTg8z0knQGOw+YmA0L2D57fnZkzXKJl2RYU5o7ECDPi+P9S
         0L7SDiYTHAh04Ld7Pk/azqM9llC5H/vqEfAU/Ras=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00FDPol1110432
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 15 Jan 2020 07:25:50 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 15
 Jan 2020 07:25:49 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 15 Jan 2020 07:25:49 -0600
Received: from uda0271908.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00FDPm3K066537;
        Wed, 15 Jan 2020 07:25:49 -0600
From:   Bin Liu <b-liu@ti.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Bin Liu <b-liu@ti.com>
Subject: [PATCH 22/25] usb: musb: Add musb_clearb/w() interface
Date:   Wed, 15 Jan 2020 07:25:44 -0600
Message-ID: <20200115132547.364-23-b-liu@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200115132547.364-1-b-liu@ti.com>
References: <20200115132547.364-1-b-liu@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Min Guo <min.guo@mediatek.com>

Delete the const attribute of addr parameter in readb/w/l hooks, these
changes are for implementing clearing W1C registers.
Replace musb_readb/w with musb_clearb/w to clear the interrupt status.

While at here, change some unsigned type to u32 to fix checkpatch.pl
warnings.

Signed-off-by: Min Guo <min.guo@mediatek.com>
[b-liu@ti.com: fix checkpatch.pl warnings.]
Signed-off-by: Bin Liu <b-liu@ti.com>
---
 drivers/usb/musb/musb_core.c | 42 ++++++++++++++++++++++++------------
 drivers/usb/musb/musb_core.h | 12 +++++++----
 drivers/usb/musb/musb_io.h   | 14 ++++++------
 drivers/usb/musb/musbhsdma.c |  2 +-
 drivers/usb/musb/sunxi.c     |  4 ++--
 drivers/usb/musb/tusb6010.c  |  2 +-
 6 files changed, 48 insertions(+), 28 deletions(-)

diff --git a/drivers/usb/musb/musb_core.c b/drivers/usb/musb/musb_core.c
index f3c95cd12e04..71691a1f8ae3 100644
--- a/drivers/usb/musb/musb_core.c
+++ b/drivers/usb/musb/musb_core.c
@@ -247,7 +247,7 @@ static u32 musb_default_busctl_offset(u8 epnum, u16 offset)
 	return 0x80 + (0x08 * epnum) + offset;
 }
 
-static u8 musb_default_readb(const void __iomem *addr, unsigned offset)
+static u8 musb_default_readb(void __iomem *addr, u32 offset)
 {
 	u8 data =  __raw_readb(addr + offset);
 
@@ -255,13 +255,13 @@ static u8 musb_default_readb(const void __iomem *addr, unsigned offset)
 	return data;
 }
 
-static void musb_default_writeb(void __iomem *addr, unsigned offset, u8 data)
+static void musb_default_writeb(void __iomem *addr, u32 offset, u8 data)
 {
 	trace_musb_writeb(__builtin_return_address(0), addr, offset, data);
 	__raw_writeb(data, addr + offset);
 }
 
-static u16 musb_default_readw(const void __iomem *addr, unsigned offset)
+static u16 musb_default_readw(void __iomem *addr, u32 offset)
 {
 	u16 data = __raw_readw(addr + offset);
 
@@ -269,7 +269,7 @@ static u16 musb_default_readw(const void __iomem *addr, unsigned offset)
 	return data;
 }
 
-static void musb_default_writew(void __iomem *addr, unsigned offset, u16 data)
+static void musb_default_writew(void __iomem *addr, u32 offset, u16 data)
 {
 	trace_musb_writew(__builtin_return_address(0), addr, offset, data);
 	__raw_writew(data, addr + offset);
@@ -397,19 +397,25 @@ static void musb_default_read_fifo(struct musb_hw_ep *hw_ep, u16 len, u8 *dst)
 /*
  * Old style IO functions
  */
-u8 (*musb_readb)(const void __iomem *addr, unsigned offset);
+u8 (*musb_readb)(void __iomem *addr, u32 offset);
 EXPORT_SYMBOL_GPL(musb_readb);
 
-void (*musb_writeb)(void __iomem *addr, unsigned offset, u8 data);
+void (*musb_writeb)(void __iomem *addr, u32 offset, u8 data);
 EXPORT_SYMBOL_GPL(musb_writeb);
 
-u16 (*musb_readw)(const void __iomem *addr, unsigned offset);
+u8 (*musb_clearb)(void __iomem *addr, u32 offset);
+EXPORT_SYMBOL_GPL(musb_clearb);
+
+u16 (*musb_readw)(void __iomem *addr, u32 offset);
 EXPORT_SYMBOL_GPL(musb_readw);
 
-void (*musb_writew)(void __iomem *addr, unsigned offset, u16 data);
+void (*musb_writew)(void __iomem *addr, u32 offset, u16 data);
 EXPORT_SYMBOL_GPL(musb_writew);
 
-u32 musb_readl(const void __iomem *addr, unsigned offset)
+u16 (*musb_clearw)(void __iomem *addr, u32 offset);
+EXPORT_SYMBOL_GPL(musb_clearw);
+
+u32 musb_readl(void __iomem *addr, u32 offset)
 {
 	u32 data = __raw_readl(addr + offset);
 
@@ -418,7 +424,7 @@ u32 musb_readl(const void __iomem *addr, unsigned offset)
 }
 EXPORT_SYMBOL_GPL(musb_readl);
 
-void musb_writel(void __iomem *addr, unsigned offset, u32 data)
+void musb_writel(void __iomem *addr, u32 offset, u32 data)
 {
 	trace_musb_writel(__builtin_return_address(0), addr, offset, data);
 	__raw_writel(data, addr + offset);
@@ -1149,7 +1155,6 @@ static irqreturn_t musb_stage0_irq(struct musb *musb, u8 int_usb,
 static void musb_disable_interrupts(struct musb *musb)
 {
 	void __iomem	*mbase = musb->mregs;
-	u16	temp;
 
 	/* disable interrupts */
 	musb_writeb(mbase, MUSB_INTRUSBE, 0);
@@ -1159,9 +1164,9 @@ static void musb_disable_interrupts(struct musb *musb)
 	musb_writew(mbase, MUSB_INTRRXE, 0);
 
 	/*  flush pending interrupts */
-	temp = musb_readb(mbase, MUSB_INTRUSB);
-	temp = musb_readw(mbase, MUSB_INTRTX);
-	temp = musb_readw(mbase, MUSB_INTRRX);
+	musb_clearb(mbase, MUSB_INTRUSB);
+	musb_clearw(mbase, MUSB_INTRTX);
+	musb_clearw(mbase, MUSB_INTRRX);
 }
 
 static void musb_enable_interrupts(struct musb *musb)
@@ -2388,10 +2393,19 @@ musb_init_controller(struct device *dev, int nIrq, void __iomem *ctrl)
 		musb_readb = musb->ops->readb;
 	if (musb->ops->writeb)
 		musb_writeb = musb->ops->writeb;
+	if (musb->ops->clearb)
+		musb_clearb = musb->ops->clearb;
+	else
+		musb_clearb = musb_readb;
+
 	if (musb->ops->readw)
 		musb_readw = musb->ops->readw;
 	if (musb->ops->writew)
 		musb_writew = musb->ops->writew;
+	if (musb->ops->clearw)
+		musb_clearw = musb->ops->clearw;
+	else
+		musb_clearw = musb_readw;
 
 #ifndef CONFIG_MUSB_PIO_ONLY
 	if (!musb->ops->dma_init || !musb->ops->dma_exit) {
diff --git a/drivers/usb/musb/musb_core.h b/drivers/usb/musb/musb_core.h
index 2e4fcf1a1a5c..290a2bc46606 100644
--- a/drivers/usb/musb/musb_core.h
+++ b/drivers/usb/musb/musb_core.h
@@ -120,8 +120,10 @@ struct musb_io;
  * @fifo_offset: returns the fifo offset
  * @readb:	read 8 bits
  * @writeb:	write 8 bits
+ * @clearb:	could be clear-on-readb or W1C
  * @readw:	read 16 bits
  * @writew:	write 16 bits
+ * @clearw:	could be clear-on-readw or W1C
  * @read_fifo:	reads the fifo
  * @write_fifo:	writes to fifo
  * @get_toggle:	platform specific get toggle function
@@ -164,10 +166,12 @@ struct musb_platform_ops {
 	u16	fifo_mode;
 	u32	(*fifo_offset)(u8 epnum);
 	u32	(*busctl_offset)(u8 epnum, u16 offset);
-	u8	(*readb)(const void __iomem *addr, unsigned offset);
-	void	(*writeb)(void __iomem *addr, unsigned offset, u8 data);
-	u16	(*readw)(const void __iomem *addr, unsigned offset);
-	void	(*writew)(void __iomem *addr, unsigned offset, u16 data);
+	u8	(*readb)(void __iomem *addr, u32 offset);
+	void	(*writeb)(void __iomem *addr, u32 offset, u8 data);
+	u8	(*clearb)(void __iomem *addr, u32 offset);
+	u16	(*readw)(void __iomem *addr, u32 offset);
+	void	(*writew)(void __iomem *addr, u32 offset, u16 data);
+	u16	(*clearw)(void __iomem *addr, u32 offset);
 	void	(*read_fifo)(struct musb_hw_ep *hw_ep, u16 len, u8 *buf);
 	void	(*write_fifo)(struct musb_hw_ep *hw_ep, u16 len, const u8 *buf);
 	u16	(*get_toggle)(struct musb_qh *qh, int is_out);
diff --git a/drivers/usb/musb/musb_io.h b/drivers/usb/musb/musb_io.h
index 8179334f405b..f17aabd95a50 100644
--- a/drivers/usb/musb/musb_io.h
+++ b/drivers/usb/musb/musb_io.h
@@ -37,11 +37,13 @@ struct musb_io {
 };
 
 /* Do not add new entries here, add them the struct musb_io instead */
-extern u8 (*musb_readb)(const void __iomem *addr, unsigned offset);
-extern void (*musb_writeb)(void __iomem *addr, unsigned offset, u8 data);
-extern u16 (*musb_readw)(const void __iomem *addr, unsigned offset);
-extern void (*musb_writew)(void __iomem *addr, unsigned offset, u16 data);
-extern u32 musb_readl(const void __iomem *addr, unsigned offset);
-extern void musb_writel(void __iomem *addr, unsigned offset, u32 data);
+extern u8 (*musb_readb)(void __iomem *addr, u32 offset);
+extern void (*musb_writeb)(void __iomem *addr, u32 offset, u8 data);
+extern u8 (*musb_clearb)(void __iomem *addr, u32 offset);
+extern u16 (*musb_readw)(void __iomem *addr, u32 offset);
+extern void (*musb_writew)(void __iomem *addr, u32 offset, u16 data);
+extern u16 (*musb_clearw)(void __iomem *addr, u32 offset);
+extern u32 musb_readl(void __iomem *addr, u32 offset);
+extern void musb_writel(void __iomem *addr, u32 offset, u32 data);
 
 #endif
diff --git a/drivers/usb/musb/musbhsdma.c b/drivers/usb/musb/musbhsdma.c
index bcc0fbf42ba8..0aacfc8be5a1 100644
--- a/drivers/usb/musb/musbhsdma.c
+++ b/drivers/usb/musb/musbhsdma.c
@@ -284,7 +284,7 @@ irqreturn_t dma_controller_irq(int irq, void *private_data)
 
 	spin_lock_irqsave(&musb->lock, flags);
 
-	int_hsdma = musb_readb(mbase, MUSB_HSDMA_INTR);
+	int_hsdma = musb_clearb(mbase, MUSB_HSDMA_INTR);
 
 	if (!int_hsdma) {
 		musb_dbg(musb, "spurious DMA irq");
diff --git a/drivers/usb/musb/sunxi.c b/drivers/usb/musb/sunxi.c
index a72665fbf111..f3f76f2ac63f 100644
--- a/drivers/usb/musb/sunxi.c
+++ b/drivers/usb/musb/sunxi.c
@@ -407,7 +407,7 @@ static u32 sunxi_musb_busctl_offset(u8 epnum, u16 offset)
 	return SUNXI_MUSB_TXFUNCADDR + offset;
 }
 
-static u8 sunxi_musb_readb(const void __iomem *addr, unsigned offset)
+static u8 sunxi_musb_readb(void __iomem *addr, u32 offset)
 {
 	struct sunxi_glue *glue;
 
@@ -520,7 +520,7 @@ static void sunxi_musb_writeb(void __iomem *addr, unsigned offset, u8 data)
 		(int)(addr - sunxi_musb->mregs));
 }
 
-static u16 sunxi_musb_readw(const void __iomem *addr, unsigned offset)
+static u16 sunxi_musb_readw(void __iomem *addr, u32 offset)
 {
 	if (addr == sunxi_musb->mregs) {
 		/* generic control or fifo control reg access */
diff --git a/drivers/usb/musb/tusb6010.c b/drivers/usb/musb/tusb6010.c
index 39453287b5c3..5d449089e3ad 100644
--- a/drivers/usb/musb/tusb6010.c
+++ b/drivers/usb/musb/tusb6010.c
@@ -142,7 +142,7 @@ static void tusb_ep_select(void __iomem *mbase, u8 epnum)
 /*
  * TUSB6010 doesn't allow 8-bit access; 16-bit access is the minimum.
  */
-static u8 tusb_readb(const void __iomem *addr, unsigned offset)
+static u8 tusb_readb(void __iomem *addr, u32 offset)
 {
 	u16 tmp;
 	u8 val;
-- 
2.17.1


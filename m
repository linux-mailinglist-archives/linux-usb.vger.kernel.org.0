Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C5D913C2A8
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jan 2020 14:25:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729081AbgAONZ5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Jan 2020 08:25:57 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:38462 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729045AbgAONZv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Jan 2020 08:25:51 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00FDPoX1118460;
        Wed, 15 Jan 2020 07:25:50 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1579094750;
        bh=vOoxCgdjFPk/gb3BV2Cr2XSUU0X7a9qkhCYGis/qgcI=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=Ot1euxeeAnAd4ii30d4RaQRCymwPsm8ajm2LL0vK/o7u87erq0ir8GNEVygd2YXVh
         o8jtEN1Ems4NR402wXNWVsth75dQvHCZ/QHwMiMNKMFYHEjW0J8SbMxJ/+M847/5BI
         mcxgPO9QShjNTPRbYSIM5unqV703//m4WehCjuqo=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00FDPo9j018813;
        Wed, 15 Jan 2020 07:25:50 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 15
 Jan 2020 07:25:49 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 15 Jan 2020 07:25:49 -0600
Received: from uda0271908.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00FDPm3I066537;
        Wed, 15 Jan 2020 07:25:49 -0600
From:   Bin Liu <b-liu@ti.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Bin Liu <b-liu@ti.com>
Subject: [PATCH 20/25] usb: musb: Add get/set toggle hooks
Date:   Wed, 15 Jan 2020 07:25:42 -0600
Message-ID: <20200115132547.364-21-b-liu@ti.com>
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

Add get/set toggle hooks in struct musb_io and struct musb_platform_ops
for special platform; remove function musb_save_toggle, use the set/get
callback to handle toggle.

Signed-off-by: Min Guo <min.guo@mediatek.com>
Signed-off-by: Bin Liu <b-liu@ti.com>
---
 drivers/usb/musb/musb_core.c | 42 ++++++++++++++++++++++++++++++++
 drivers/usb/musb/musb_core.h |  5 ++++
 drivers/usb/musb/musb_host.c | 46 ++++++++----------------------------
 drivers/usb/musb/musb_io.h   |  4 ++++
 4 files changed, 61 insertions(+), 36 deletions(-)

diff --git a/drivers/usb/musb/musb_core.c b/drivers/usb/musb/musb_core.c
index 34090707d122..f3c95cd12e04 100644
--- a/drivers/usb/musb/musb_core.c
+++ b/drivers/usb/musb/musb_core.c
@@ -275,6 +275,38 @@ static void musb_default_writew(void __iomem *addr, unsigned offset, u16 data)
 	__raw_writew(data, addr + offset);
 }
 
+static u16 musb_default_get_toggle(struct musb_qh *qh, int is_out)
+{
+	void __iomem *epio = qh->hw_ep->regs;
+	u16 csr;
+
+	if (is_out)
+		csr = musb_readw(epio, MUSB_TXCSR) & MUSB_TXCSR_H_DATATOGGLE;
+	else
+		csr = musb_readw(epio, MUSB_RXCSR) & MUSB_RXCSR_H_DATATOGGLE;
+
+	return csr;
+}
+
+static u16 musb_default_set_toggle(struct musb_qh *qh, int is_out,
+				   struct urb *urb)
+{
+	u16 csr;
+	u16 toggle;
+
+	toggle = usb_gettoggle(urb->dev, qh->epnum, is_out);
+
+	if (is_out)
+		csr = toggle ? (MUSB_TXCSR_H_WR_DATATOGGLE
+				| MUSB_TXCSR_H_DATATOGGLE)
+				: MUSB_TXCSR_CLRDATATOG;
+	else
+		csr = toggle ? (MUSB_RXCSR_H_WR_DATATOGGLE
+				| MUSB_RXCSR_H_DATATOGGLE) : 0;
+
+	return csr;
+}
+
 /*
  * Load an endpoint's FIFO
  */
@@ -2381,6 +2413,16 @@ musb_init_controller(struct device *dev, int nIrq, void __iomem *ctrl)
 	else
 		musb->io.write_fifo = musb_default_write_fifo;
 
+	if (musb->ops->get_toggle)
+		musb->io.get_toggle = musb->ops->get_toggle;
+	else
+		musb->io.get_toggle = musb_default_get_toggle;
+
+	if (musb->ops->set_toggle)
+		musb->io.set_toggle = musb->ops->set_toggle;
+	else
+		musb->io.set_toggle = musb_default_set_toggle;
+
 	if (!musb->xceiv->io_ops) {
 		musb->xceiv->io_dev = musb->controller;
 		musb->xceiv->io_priv = musb->mregs;
diff --git a/drivers/usb/musb/musb_core.h b/drivers/usb/musb/musb_core.h
index 8a13a46cd891..2e4fcf1a1a5c 100644
--- a/drivers/usb/musb/musb_core.h
+++ b/drivers/usb/musb/musb_core.h
@@ -27,6 +27,7 @@
 struct musb;
 struct musb_hw_ep;
 struct musb_ep;
+struct musb_qh;
 
 /* Helper defines for struct musb->hwvers */
 #define MUSB_HWVERS_MAJOR(x)	((x >> 10) & 0x1f)
@@ -123,6 +124,8 @@ struct musb_io;
  * @writew:	write 16 bits
  * @read_fifo:	reads the fifo
  * @write_fifo:	writes to fifo
+ * @get_toggle:	platform specific get toggle function
+ * @set_toggle:	platform specific set toggle function
  * @dma_init:	platform specific dma init function
  * @dma_exit:	platform specific dma exit function
  * @init:	turns on clocks, sets up platform-specific registers, etc
@@ -167,6 +170,8 @@ struct musb_platform_ops {
 	void	(*writew)(void __iomem *addr, unsigned offset, u16 data);
 	void	(*read_fifo)(struct musb_hw_ep *hw_ep, u16 len, u8 *buf);
 	void	(*write_fifo)(struct musb_hw_ep *hw_ep, u16 len, const u8 *buf);
+	u16	(*get_toggle)(struct musb_qh *qh, int is_out);
+	u16	(*set_toggle)(struct musb_qh *qh, int is_out, struct urb *urb);
 	struct dma_controller *
 		(*dma_init) (struct musb *musb, void __iomem *base);
 	void	(*dma_exit)(struct dma_controller *c);
diff --git a/drivers/usb/musb/musb_host.c b/drivers/usb/musb/musb_host.c
index 5a44b70372d9..886c9b602f8c 100644
--- a/drivers/usb/musb/musb_host.c
+++ b/drivers/usb/musb/musb_host.c
@@ -286,26 +286,6 @@ __acquires(musb->lock)
 	spin_lock(&musb->lock);
 }
 
-/* For bulk/interrupt endpoints only */
-static inline void musb_save_toggle(struct musb_qh *qh, int is_in,
-				    struct urb *urb)
-{
-	void __iomem		*epio = qh->hw_ep->regs;
-	u16			csr;
-
-	/*
-	 * FIXME: the current Mentor DMA code seems to have
-	 * problems getting toggle correct.
-	 */
-
-	if (is_in)
-		csr = musb_readw(epio, MUSB_RXCSR) & MUSB_RXCSR_H_DATATOGGLE;
-	else
-		csr = musb_readw(epio, MUSB_TXCSR) & MUSB_TXCSR_H_DATATOGGLE;
-
-	usb_settoggle(urb->dev, qh->epnum, !is_in, csr ? 1 : 0);
-}
-
 /*
  * Advance this hardware endpoint's queue, completing the specified URB and
  * advancing to either the next URB queued to that qh, or else invalidating
@@ -320,6 +300,7 @@ static void musb_advance_schedule(struct musb *musb, struct urb *urb,
 	struct musb_hw_ep	*ep = qh->hw_ep;
 	int			ready = qh->is_ready;
 	int			status;
+	u16			toggle;
 
 	status = (urb->status == -EINPROGRESS) ? 0 : urb->status;
 
@@ -327,7 +308,8 @@ static void musb_advance_schedule(struct musb *musb, struct urb *urb,
 	switch (qh->type) {
 	case USB_ENDPOINT_XFER_BULK:
 	case USB_ENDPOINT_XFER_INT:
-		musb_save_toggle(qh, is_in, urb);
+		toggle = musb->io.get_toggle(qh, !is_in);
+		usb_settoggle(urb->dev, qh->epnum, !is_in, toggle ? 1 : 0);
 		break;
 	case USB_ENDPOINT_XFER_ISOC:
 		if (status == 0 && urb->error_count)
@@ -772,13 +754,8 @@ static void musb_ep_program(struct musb *musb, u8 epnum,
 					);
 			csr |= MUSB_TXCSR_MODE;
 
-			if (!hw_ep->tx_double_buffered) {
-				if (usb_gettoggle(urb->dev, qh->epnum, 1))
-					csr |= MUSB_TXCSR_H_WR_DATATOGGLE
-						| MUSB_TXCSR_H_DATATOGGLE;
-				else
-					csr |= MUSB_TXCSR_CLRDATATOG;
-			}
+			if (!hw_ep->tx_double_buffered)
+				csr |= musb->io.set_toggle(qh, is_out, urb);
 
 			musb_writew(epio, MUSB_TXCSR, csr);
 			/* REVISIT may need to clear FLUSHFIFO ... */
@@ -860,17 +837,12 @@ static void musb_ep_program(struct musb *musb, u8 epnum,
 
 	/* IN/receive */
 	} else {
-		u16	csr;
+		u16 csr = 0;
 
 		if (hw_ep->rx_reinit) {
 			musb_rx_reinit(musb, qh, epnum);
+			csr |= musb->io.set_toggle(qh, is_out, urb);
 
-			/* init new state: toggle and NYET, maybe DMA later */
-			if (usb_gettoggle(urb->dev, qh->epnum, 0))
-				csr = MUSB_RXCSR_H_WR_DATATOGGLE
-					| MUSB_RXCSR_H_DATATOGGLE;
-			else
-				csr = 0;
 			if (qh->type == USB_ENDPOINT_XFER_INT)
 				csr |= MUSB_RXCSR_DISNYET;
 
@@ -933,6 +905,7 @@ static void musb_bulk_nak_timeout(struct musb *musb, struct musb_hw_ep *ep,
 	void __iomem		*epio = ep->regs;
 	struct musb_qh		*cur_qh, *next_qh;
 	u16			rx_csr, tx_csr;
+	u16			toggle;
 
 	musb_ep_select(mbase, ep->epnum);
 	if (is_in) {
@@ -970,7 +943,8 @@ static void musb_bulk_nak_timeout(struct musb *musb, struct musb_hw_ep *ep,
 			urb->actual_length += dma->actual_len;
 			dma->actual_len = 0L;
 		}
-		musb_save_toggle(cur_qh, is_in, urb);
+		toggle = musb->io.get_toggle(cur_qh, !is_in);
+		usb_settoggle(urb->dev, cur_qh->epnum, !is_in, toggle ? 1 : 0);
 
 		if (is_in) {
 			/* move cur_qh to end of queue */
diff --git a/drivers/usb/musb/musb_io.h b/drivers/usb/musb/musb_io.h
index 8058a58092cf..8179334f405b 100644
--- a/drivers/usb/musb/musb_io.h
+++ b/drivers/usb/musb/musb_io.h
@@ -22,6 +22,8 @@
  * @read_fifo:	platform specific function to read fifo
  * @write_fifo:	platform specific function to write fifo
  * @busctl_offset: platform specific function to get busctl offset
+ * @get_toggle: platform specific function to get toggle
+ * @set_toggle: platform specific function to set toggle
  */
 struct musb_io {
 	u32	(*ep_offset)(u8 epnum, u16 offset);
@@ -30,6 +32,8 @@ struct musb_io {
 	void	(*read_fifo)(struct musb_hw_ep *hw_ep, u16 len, u8 *buf);
 	void	(*write_fifo)(struct musb_hw_ep *hw_ep, u16 len, const u8 *buf);
 	u32	(*busctl_offset)(u8 epnum, u16 offset);
+	u16	(*get_toggle)(struct musb_qh *qh, int is_out);
+	u16	(*set_toggle)(struct musb_qh *qh, int is_out, struct urb *urb);
 };
 
 /* Do not add new entries here, add them the struct musb_io instead */
-- 
2.17.1


Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B2C937B8D7
	for <lists+linux-usb@lfdr.de>; Wed, 12 May 2021 11:05:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230375AbhELJG5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 May 2021 05:06:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230401AbhELJG4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 12 May 2021 05:06:56 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63F97C06174A
        for <linux-usb@vger.kernel.org>; Wed, 12 May 2021 02:05:48 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id o127so12518484wmo.4
        for <linux-usb@vger.kernel.org>; Wed, 12 May 2021 02:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2y3bFm4c0/V4LwGocOdp1C1agkOU0+mlyY/uwsqMNd4=;
        b=TTBCh8WZUwAGO9yI96nzPiqAMScl/Rsx6iFAzkSpRxc/rbWvmtke7ecTt3qOgc2PHW
         vFguMhWxEVJJf/W1f+dRErRo5i7sGDzJ/j2dCeR4KmnhFdLjfut9+w8lgQITlr43vGv1
         +UAty9r4PqdfqEG+vfIU17wJfiMhZP6fytldjw8RolwoEjOxUnqcVuB4MVNS2D7Kcx7F
         ccc93lONEFW4S3acxDrAUTz6wVPMhV/5UEWYZyfZHFZo/C4MTFuppgI6jaNP1pTbEGpY
         rgdiJvz75WWIcJS4Usy04J07nRB33TDxLpfyLsPYttFY05VS8K1LnAOf+Qb/y8hBnOA2
         IXYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2y3bFm4c0/V4LwGocOdp1C1agkOU0+mlyY/uwsqMNd4=;
        b=gOHPA1k613KQy1Vz3fPR9McXpxHXRUb0e03ASX7pIoFAWvQHgzH06aZk7JJzmyPWkE
         eZqlCOez7vuVZpHOfRi4N3SVZkHMt5ByBob4MLfkbqGxlzBXJ1GxGMdCP81Yi8M+LpDv
         NmdpzI3zpPOaq2VIIJ68xIK9nDXAuq+icM2n2UXLAHgGCpE9y2VB/OdN937lS0IwBjdz
         79Z18X5x7fw54DqMeAo08VkcMF+/9qLoylxKS65FSnjrDgROKPg2QFWHqc7A7fiopU7/
         4Z7estbCmzLPgFvAEiiOjRLSCHy5TM1gCLz49iN5ivw2JDIMWIDbrOc6SvGZcjdhIyGo
         R+Dg==
X-Gm-Message-State: AOAM533cKTggSQ3/+DNwGTZSZNRciQP4l+eZS5nO5LVYAXia/UjW0J36
        C1lYI/zgc9K44722y0Ng/P5Gsw==
X-Google-Smtp-Source: ABdhPJyyE6Jr8giGqO7COA+GZD6kWrEQsrI3SMuLikxnr+WClfZeXygd0neyzta0ptN2YNdVbvKpYQ==
X-Received: by 2002:a05:600c:218d:: with SMTP id e13mr10407596wme.151.1620810347081;
        Wed, 12 May 2021 02:05:47 -0700 (PDT)
Received: from arch-thunder.local (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id v20sm26679451wmj.15.2021.05.12.02.05.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 May 2021 02:05:46 -0700 (PDT)
From:   Rui Miguel Silva <rui.silva@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sebastian Siewior <bigeasy@linutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        Rui Miguel Silva <rui.silva@linaro.org>
Subject: [PATCH v3 5/9] usb: isp1760: hcd: refactor mempool config and setup
Date:   Wed, 12 May 2021 10:05:25 +0100
Message-Id: <20210512090529.2283637-6-rui.silva@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210512090529.2283637-1-rui.silva@linaro.org>
References: <20210512090529.2283637-1-rui.silva@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In preparation to support other family member IP, which may have
different memory layout. Drop macros and setup a configuration
struct.

Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
---
 drivers/usb/isp1760/isp1760-core.c | 21 ++++++++
 drivers/usb/isp1760/isp1760-hcd.c  | 83 ++++++++++++++++++++----------
 drivers/usb/isp1760/isp1760-hcd.h  | 37 ++++++-------
 3 files changed, 92 insertions(+), 49 deletions(-)

diff --git a/drivers/usb/isp1760/isp1760-core.c b/drivers/usb/isp1760/isp1760-core.c
index c79ba98df9f9..35a7667e411c 100644
--- a/drivers/usb/isp1760/isp1760-core.c
+++ b/drivers/usb/isp1760/isp1760-core.c
@@ -101,6 +101,25 @@ void isp1760_set_pullup(struct isp1760_device *isp, bool enable)
 		isp1760_field_set(udc->fields, HW_DP_PULLUP_CLEAR);
 }
 
+/*
+ * 60kb divided in:
+ * - 32 blocks @ 256  bytes
+ * - 20 blocks @ 1024 bytes
+ * -  4 blocks @ 8192 bytes
+ */
+static const struct isp1760_memory_layout isp176x_memory_conf = {
+	.blocks[0]		= 32,
+	.blocks_size[0]		= 256,
+	.blocks[1]		= 20,
+	.blocks_size[1]		= 1024,
+	.blocks[2]		= 4,
+	.blocks_size[2]		= 8192,
+
+	.ptd_num		= 32,
+	.payload_blocks		= 32 + 20 + 4,
+	.payload_area_size	= 0xf000,
+};
+
 static const struct regmap_range isp176x_hc_volatile_ranges[] = {
 	regmap_reg_range(ISP176x_HC_USBCMD, ISP176x_HC_ATL_PTD_LASTPTD),
 	regmap_reg_range(ISP176x_HC_BUFFER_STATUS, ISP176x_HC_MEMORY),
@@ -302,6 +321,8 @@ int isp1760_register(struct resource *mem, int irq, unsigned long irqflags,
 		udc->fields[i] = f;
 	}
 
+	hcd->memory_layout = &isp176x_memory_conf;
+
 	isp1760_init_core(isp);
 
 	if (IS_ENABLED(CONFIG_USB_ISP1760_HCD) && !usb_disabled()) {
diff --git a/drivers/usb/isp1760/isp1760-hcd.c b/drivers/usb/isp1760/isp1760-hcd.c
index 2cc0555e029d..a65f5f917ebe 100644
--- a/drivers/usb/isp1760/isp1760-hcd.c
+++ b/drivers/usb/isp1760/isp1760-hcd.c
@@ -358,39 +358,29 @@ static void ptd_write(void __iomem *base, u32 ptd_offset, u32 slot,
 /* memory management of the 60kb on the chip from 0x1000 to 0xffff */
 static void init_memory(struct isp1760_hcd *priv)
 {
-	int i, curr;
+	const struct isp1760_memory_layout *mem = priv->memory_layout;
+	int i, j, curr;
 	u32 payload_addr;
 
 	payload_addr = PAYLOAD_OFFSET;
-	for (i = 0; i < BLOCK_1_NUM; i++) {
-		priv->memory_pool[i].start = payload_addr;
-		priv->memory_pool[i].size = BLOCK_1_SIZE;
-		priv->memory_pool[i].free = 1;
-		payload_addr += priv->memory_pool[i].size;
-	}
-
-	curr = i;
-	for (i = 0; i < BLOCK_2_NUM; i++) {
-		priv->memory_pool[curr + i].start = payload_addr;
-		priv->memory_pool[curr + i].size = BLOCK_2_SIZE;
-		priv->memory_pool[curr + i].free = 1;
-		payload_addr += priv->memory_pool[curr + i].size;
-	}
 
-	curr = i;
-	for (i = 0; i < BLOCK_3_NUM; i++) {
-		priv->memory_pool[curr + i].start = payload_addr;
-		priv->memory_pool[curr + i].size = BLOCK_3_SIZE;
-		priv->memory_pool[curr + i].free = 1;
-		payload_addr += priv->memory_pool[curr + i].size;
+	for (i = 0, curr = 0; i < ARRAY_SIZE(mem->blocks); i++) {
+		for (j = 0; j < mem->blocks[i]; j++, curr++) {
+			priv->memory_pool[curr + j].start = payload_addr;
+			priv->memory_pool[curr + j].size = mem->blocks_size[i];
+			priv->memory_pool[curr + j].free = 1;
+			payload_addr += priv->memory_pool[curr + j].size;
+		}
 	}
 
-	WARN_ON(payload_addr - priv->memory_pool[0].start > PAYLOAD_AREA_SIZE);
+	WARN_ON(payload_addr - priv->memory_pool[0].start >
+		mem->payload_area_size);
 }
 
 static void alloc_mem(struct usb_hcd *hcd, struct isp1760_qtd *qtd)
 {
 	struct isp1760_hcd *priv = hcd_to_priv(hcd);
+	const struct isp1760_memory_layout *mem = priv->memory_layout;
 	int i;
 
 	WARN_ON(qtd->payload_addr);
@@ -398,7 +388,7 @@ static void alloc_mem(struct usb_hcd *hcd, struct isp1760_qtd *qtd)
 	if (!qtd->length)
 		return;
 
-	for (i = 0; i < BLOCKS; i++) {
+	for (i = 0; i < mem->payload_blocks; i++) {
 		if (priv->memory_pool[i].size >= qtd->length &&
 				priv->memory_pool[i].free) {
 			priv->memory_pool[i].free = 0;
@@ -411,12 +401,13 @@ static void alloc_mem(struct usb_hcd *hcd, struct isp1760_qtd *qtd)
 static void free_mem(struct usb_hcd *hcd, struct isp1760_qtd *qtd)
 {
 	struct isp1760_hcd *priv = hcd_to_priv(hcd);
+	const struct isp1760_memory_layout *mem = priv->memory_layout;
 	int i;
 
 	if (!qtd->payload_addr)
 		return;
 
-	for (i = 0; i < BLOCKS; i++) {
+	for (i = 0; i < mem->payload_blocks; i++) {
 		if (priv->memory_pool[i].start == qtd->payload_addr) {
 			WARN_ON(priv->memory_pool[i].free);
 			priv->memory_pool[i].free = 1;
@@ -1407,8 +1398,6 @@ static int qtd_fill(struct isp1760_qtd *qtd, void *databuffer, size_t len)
 {
 	qtd->data_buffer = databuffer;
 
-	if (len > MAX_PAYLOAD_SIZE)
-		len = MAX_PAYLOAD_SIZE;
 	qtd->length = len;
 
 	return qtd->length;
@@ -1432,6 +1421,8 @@ static void qtd_list_free(struct list_head *qtd_list)
 static void packetize_urb(struct usb_hcd *hcd,
 		struct urb *urb, struct list_head *head, gfp_t flags)
 {
+	struct isp1760_hcd *priv = hcd_to_priv(hcd);
+	const struct isp1760_memory_layout *mem = priv->memory_layout;
 	struct isp1760_qtd *qtd;
 	void *buf;
 	int len, maxpacketsize;
@@ -1484,6 +1475,10 @@ static void packetize_urb(struct usb_hcd *hcd,
 		qtd = qtd_alloc(flags, urb, packet_type);
 		if (!qtd)
 			goto cleanup;
+
+		if (len > mem->blocks_size[ISP176x_BLOCK_NUM - 1])
+			len = mem->blocks_size[ISP176x_BLOCK_NUM - 1];
+
 		this_qtd_len = qtd_fill(qtd, buf, len);
 		list_add_tail(&qtd->qtd_list, head);
 
@@ -2212,6 +2207,7 @@ int isp1760_hcd_register(struct isp1760_hcd *priv, struct resource *mem,
 			 int irq, unsigned long irqflags,
 			 struct device *dev)
 {
+	const struct isp1760_memory_layout *mem_layout = priv->memory_layout;
 	struct usb_hcd *hcd;
 	int ret;
 
@@ -2223,6 +2219,28 @@ int isp1760_hcd_register(struct isp1760_hcd *priv, struct resource *mem,
 
 	priv->hcd = hcd;
 
+	priv->memory_pool = kcalloc(mem_layout->payload_blocks,
+				    sizeof(struct isp1760_memory_chunk),
+				    GFP_KERNEL);
+	if (!priv->memory_pool) {
+		ret = -ENOMEM;
+		goto put_hcd;
+	}
+
+	priv->atl_slots = kcalloc(mem_layout->ptd_num,
+				  sizeof(struct isp1760_slotinfo), GFP_KERNEL);
+	if (!priv->atl_slots) {
+		ret = -ENOMEM;
+		goto free_mem_pool;
+	}
+
+	priv->int_slots = kcalloc(mem_layout->ptd_num,
+				  sizeof(struct isp1760_slotinfo), GFP_KERNEL);
+	if (!priv->int_slots) {
+		ret = -ENOMEM;
+		goto free_atl_slots;
+	}
+
 	init_memory(priv);
 
 	hcd->irq = irq;
@@ -2234,13 +2252,19 @@ int isp1760_hcd_register(struct isp1760_hcd *priv, struct resource *mem,
 
 	ret = usb_add_hcd(hcd, irq, irqflags);
 	if (ret)
-		goto error;
+		goto free_int_slots;
 
 	device_wakeup_enable(hcd->self.controller);
 
 	return 0;
 
-error:
+free_int_slots:
+	kfree(priv->int_slots);
+free_atl_slots:
+	kfree(priv->atl_slots);
+free_mem_pool:
+	kfree(priv->memory_pool);
+put_hcd:
 	usb_put_hcd(hcd);
 	return ret;
 }
@@ -2252,4 +2276,7 @@ void isp1760_hcd_unregister(struct isp1760_hcd *priv)
 
 	usb_remove_hcd(priv->hcd);
 	usb_put_hcd(priv->hcd);
+	kfree(priv->atl_slots);
+	kfree(priv->int_slots);
+	kfree(priv->memory_pool);
 }
diff --git a/drivers/usb/isp1760/isp1760-hcd.h b/drivers/usb/isp1760/isp1760-hcd.h
index 34e1899e52c4..9d2427ce3f1a 100644
--- a/drivers/usb/isp1760/isp1760-hcd.h
+++ b/drivers/usb/isp1760/isp1760-hcd.h
@@ -12,24 +12,6 @@ struct isp1760_qtd;
 struct resource;
 struct usb_hcd;
 
-/*
- * 60kb divided in:
- * - 32 blocks @ 256  bytes
- * - 20 blocks @ 1024 bytes
- * -  4 blocks @ 8192 bytes
- */
-
-#define BLOCK_1_NUM 32
-#define BLOCK_2_NUM 20
-#define BLOCK_3_NUM 4
-
-#define BLOCK_1_SIZE 256
-#define BLOCK_2_SIZE 1024
-#define BLOCK_3_SIZE 8192
-#define BLOCKS (BLOCK_1_NUM + BLOCK_2_NUM + BLOCK_3_NUM)
-#define MAX_PAYLOAD_SIZE BLOCK_3_SIZE
-#define PAYLOAD_AREA_SIZE 0xf000
-
 struct isp1760_slotinfo {
 	struct isp1760_qh *qh;
 	struct isp1760_qtd *qtd;
@@ -37,6 +19,17 @@ struct isp1760_slotinfo {
 };
 
 /* chip memory management */
+#define ISP176x_BLOCK_NUM 3
+
+struct isp1760_memory_layout {
+	unsigned int blocks[ISP176x_BLOCK_NUM];
+	unsigned int blocks_size[ISP176x_BLOCK_NUM];
+
+	unsigned int ptd_num;
+	unsigned int payload_blocks;
+	unsigned int payload_area_size;
+};
+
 struct isp1760_memory_chunk {
 	unsigned int start;
 	unsigned int size;
@@ -58,12 +51,14 @@ struct isp1760_hcd {
 	struct regmap		*regs;
 	struct regmap_field	*fields[HC_FIELD_MAX];
 
+	const struct isp1760_memory_layout	*memory_layout;
+
 	spinlock_t		lock;
-	struct isp1760_slotinfo	atl_slots[32];
+	struct isp1760_slotinfo	*atl_slots;
 	int			atl_done_map;
-	struct isp1760_slotinfo	int_slots[32];
+	struct isp1760_slotinfo	*int_slots;
 	int			int_done_map;
-	struct isp1760_memory_chunk memory_pool[BLOCKS];
+	struct isp1760_memory_chunk *memory_pool;
 	struct list_head	qh_list[QH_END];
 
 	/* periodic schedule support */
-- 
2.31.1


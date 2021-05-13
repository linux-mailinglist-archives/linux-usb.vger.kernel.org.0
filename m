Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FF7237F463
	for <lists+linux-usb@lfdr.de>; Thu, 13 May 2021 10:47:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232157AbhEMIsw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 May 2021 04:48:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232143AbhEMIsr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 13 May 2021 04:48:47 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB729C061574
        for <linux-usb@vger.kernel.org>; Thu, 13 May 2021 01:47:36 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id o127so14197271wmo.4
        for <linux-usb@vger.kernel.org>; Thu, 13 May 2021 01:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2y3bFm4c0/V4LwGocOdp1C1agkOU0+mlyY/uwsqMNd4=;
        b=RobAJWPMLn94vUoP2YI03SUHsM1dfkJmISRl+D2NTlCyJ+PUwjAgzZZkBLOKvHFBZK
         eZOAp1XPi7/AsMJJw0/zrIHzsShfSdYZbHo4VAkWHyOQ/TYZe+ZAo5OVB1Hp4C7gFNpz
         bbCk1JdxJryauYEsW5B7D+jIV30jdWwkOFRgGHoqMT3+toxW86ZnDANlPoUobJx2ssVf
         R+XXplOtSSJ0YTlU8hEYKK5K+B5VGYxmN1+/9ZTyn79OQyaN0umcLE4AJZx+CKij6UcI
         0wsgtbXiquv4lbP2WHqf04U+/PydP67B0H10IkTqi3zfxIsKBr0iu+UayGcajcEs5gen
         /ZmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2y3bFm4c0/V4LwGocOdp1C1agkOU0+mlyY/uwsqMNd4=;
        b=tnobqxOWyulKZ/dSZVxOTWbgOidDfFOy/0xe7R7aQ4UDjw2QR34kP0bDjZGRV3xM3r
         d4H0syh0mWczWQeLcH0BEdglagYy8rZTxR0EI03o4QN+XgYB4kBMCATZJZYqBkKPUMjn
         EyMpiE7VTpZpujAnn6Txfn2ox21tjqDPSXGL39PWYSIFNpta815+I1/rwzjiDr0ydAZS
         mhby35aZg9VqG0m1oJtyNrVa1T78FkFug3erBm6MIS9OZW4qzOGscAMRB3osAi3wdryK
         hXkT3ZY0mjZWbbLwV+MUKxaPK5UdyaeDJVO/zKRZcEZjqsHcNm7xxuqPQZR5GcgCu/bx
         6waQ==
X-Gm-Message-State: AOAM532v6C9t57ev820qKcn2P7G0NqVQGXn6MrGY9pYleOObbf2xaZ0G
        vRFY68bHo1ZUDzSVj2tgVV5+cQ==
X-Google-Smtp-Source: ABdhPJxVcOrwqympmHdQFKQTehE+Q8oOqcOt+wv0+uKqakKEVHOWB5YQxAp8e2Je1h43H7gGAoIMnA==
X-Received: by 2002:a05:600c:354b:: with SMTP id i11mr11506972wmq.102.1620895655678;
        Thu, 13 May 2021 01:47:35 -0700 (PDT)
Received: from arch-thunder.local (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id h15sm1730282wmq.4.2021.05.13.01.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 May 2021 01:47:35 -0700 (PDT)
From:   Rui Miguel Silva <rui.silva@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sebastian Siewior <bigeasy@linutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        Rui Miguel Silva <rui.silva@linaro.org>
Subject: [PATCH v4 5/9] usb: isp1760: hcd: refactor mempool config and setup
Date:   Thu, 13 May 2021 09:47:13 +0100
Message-Id: <20210513084717.2487366-6-rui.silva@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210513084717.2487366-1-rui.silva@linaro.org>
References: <20210513084717.2487366-1-rui.silva@linaro.org>
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


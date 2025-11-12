Return-Path: <linux-usb+bounces-30466-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 332BDC54C92
	for <lists+linux-usb@lfdr.de>; Thu, 13 Nov 2025 00:16:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 96070345ECB
	for <lists+linux-usb@lfdr.de>; Wed, 12 Nov 2025 23:16:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E9712F0696;
	Wed, 12 Nov 2025 23:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FKDfcONp"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B56D12475CE
	for <linux-usb@vger.kernel.org>; Wed, 12 Nov 2025 23:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762989399; cv=none; b=LgB7yEGwa8HWnB0yyCPJC0wQ9L6iL5PpnbJjaydXYMeSST2yt8JSPsa2Ilw0n+l2aC+Z9+rBNK6UDTOS8WsolwFRzkszCHcxhnjlY7ASYft5H5m5AfFdbPzZgdBt8nzDfzFkHgXzcrji82ESMo3tk+rR2VMvYHZ6dD7b1anKuQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762989399; c=relaxed/simple;
	bh=9Yj5emEHIeCFz4GGx7n0uPiHuJ0FrMRJl1g47J5JkUU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TkZ9nPdB0vcBLdXNTJusrFSRsWInqGtwQrxidVdkTz4oVv/UDzGhYVEfXdBHiiYeZGpKQRc0UDtUpo9jiX+hvbvjexbcZ3kffyQodUL64mbWipWItPZcDMA8e+MuaVyhz261Pow3M01jIBzsGK9XkzS88ZvlAzI2h3zz21aV8nQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FKDfcONp; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-64088c6b309so323012a12.0
        for <linux-usb@vger.kernel.org>; Wed, 12 Nov 2025 15:16:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1762989396; x=1763594196; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ayspAr+IJhxW/A4vGh7sWzSq78eF/j3RG7VPa1WpZjY=;
        b=FKDfcONpF4pncEguPD8ggx6oZJYmQ808fLj5JHbsS79ShlQprNoc3hIQHEzih3kxp+
         GTqp45OX9/oy/AAj0YyUXJH07MiQ2ibKurmZWbbw/AswHx70gzx776FrX5bARFGWGr32
         PmDm2ca+Cs6h08rJ4IbATpZAPDLAxczHckR24=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762989396; x=1763594196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ayspAr+IJhxW/A4vGh7sWzSq78eF/j3RG7VPa1WpZjY=;
        b=uRFtCIXnyjuEIeKa3NNaEA8FVZ+9layJT5oVMiM+sGGaujdEhmaM47JqOi3bWWOpCn
         4Fa6F/83ulCMdk0oGvKn/aPaGjAJzcd3b1xHmgsYvh1soLesSXl6+pg2JmfWjRY/HYsh
         Rvti4BLWkLyOk4nRTWd4VaQZLVk9gI0xPf4ZLUngHhNio6+k3U8vlXBB74QERmuPbD24
         xFI/pX+7CVgDv3IkV2gl33DcEaLWNInXkATuSeveUPRoIXp7Y1ubkmHeGB4JU3IbDARn
         u7AEenTRWDp9fwXdvAOoGN/SXSm5Mz0/Up/n/Fk5+pSoFfM+0zAeeCucm8mP0EbUCLqn
         CJhw==
X-Forwarded-Encrypted: i=1; AJvYcCXrdyKAyLio41wbi+0xipaPQOXgj+ySn73LY9S3br7xYJbRBKxG3dYyc7C8ZoP8cwiWN/BfSGOmR68=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDRZbPIiT9B0vph1cXsfHd6Hr08EtZI+QQi1EBabqtxdPam9k2
	0TeuSJSUdmu6QaC673o15GUbf0AtDIJ6vgFpdp0pzasT66pWtG1cca4zGFwO2C9B
X-Gm-Gg: ASbGnctaKKBI+p+tDh+IJU/GDZuYyDAj5LoHmRq48lK+hdfYzWcZP8KyKikSTswY0WT
	8qNbCsNuaB3vnqjnmIDGDAzLG/OpE1fsGQFsKobypYvxONgqDkvbALzTZ6bYt3AZC/HuNO8VrX2
	VEz1bXbKFNMFandUE0pH0jqnvRJh/ZgW0TWfokLGSkcDbpy+JyPkj2zy6Ek+SVOGfD/G+2nz0Aj
	FMsE1di1M35Quqa3/PH7kP/eo/SCjIqTbhXxlvHtzt1oo9sqcGX/VXZQmBEWoZ0NMtR9lKaNzwW
	SsOuBGK8EwQp+DCVtGMWdulS+llszXHF0mnKaEr4xKBJI+hnT8t3HvHrxdLv05xcpkNkrAITNEe
	X2lsLhnYcGjiTawU7WOfkZzuPCbO6N8hGMhDAU0Cbzdsl4WpHeYZEjvNpL3rKOE3teSHCJL/Ih+
	R5moknq1vjLZKpsICnbZkToSrGR/BIkkWexqErMf2NnDoPNun2/t4Z
X-Google-Smtp-Source: AGHT+IGJHvu39DaEjTzmraj+/0W785qK+nqsZI8hAIe7+vxu/hF9IsgNK8i9qEDGs7nZp+C2x60umw==
X-Received: by 2002:a05:6402:1ed6:b0:643:18db:1d82 with SMTP id 4fb4d7f45d1cf-6431a4d535cmr4289868a12.11.1762989395985;
        Wed, 12 Nov 2025 15:16:35 -0800 (PST)
Received: from januszek.c.googlers.com.com (5.214.32.34.bc.googleusercontent.com. [34.32.214.5])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6433a4b2155sm124516a12.29.2025.11.12.15.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 15:16:35 -0800 (PST)
From: "=?UTF-8?q?=C5=81ukasz=20Bartosik?=" <ukaszb@chromium.org>
X-Google-Original-From: =?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@google.com>
To: Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alan Stern <stern@rowland.harvard.edu>,
	linux-usb@vger.kernel.org,
	=?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>
Subject: [PATCH v3 1/4] xhci: dbc: prepare to expose strings through sysfs
Date: Wed, 12 Nov 2025 23:15:54 +0000
Message-ID: <20251112231557.164797-2-ukaszb@google.com>
X-Mailer: git-send-email 2.51.2.1041.gc1ab5b90ca-goog
In-Reply-To: <20251112231557.164797-1-ukaszb@google.com>
References: <20251112231557.164797-1-ukaszb@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Łukasz Bartosik <ukaszb@chromium.org>

Reorganize the code to prepare ground for setting serial number,
product and manufacturer names through sysfs. This commit:
1. Introduces new buffers for storing serial number, product and
   manufacturer name in utf8. The buffers will be used by sysfs
   *_show and *_store functions.
2. Increases USB string descriptor data maximum length to the
   value from USB specification (126 bytes of data).
3. Adds new helper functions get_str_desc_len, prepare_len
   and xhci_dbc_populate_str_desc.

Signed-off-by: Łukasz Bartosik <ukaszb@chromium.org>
---
 drivers/usb/host/xhci-dbgcap.c | 150 ++++++++++++++++++---------------
 drivers/usb/host/xhci-dbgcap.h |  37 +++++---
 2 files changed, 109 insertions(+), 78 deletions(-)

diff --git a/drivers/usb/host/xhci-dbgcap.c b/drivers/usb/host/xhci-dbgcap.c
index cc5e7325af4f..6605833f807d 100644
--- a/drivers/usb/host/xhci-dbgcap.c
+++ b/drivers/usb/host/xhci-dbgcap.c
@@ -29,6 +29,12 @@
 #include "xhci-trace.h"
 #include "xhci-dbgcap.h"
 
+static const struct dbc_str dbc_str_default = {
+	.manufacturer = "Linux Foundation",
+	.product = "Linux USB Debug Target",
+	.serial = "0001",
+};
+
 static void dbc_free_ctx(struct device *dev, struct xhci_container_ctx *ctx)
 {
 	if (!ctx)
@@ -52,55 +58,6 @@ static void dbc_ring_free(struct device *dev, struct xhci_ring *ring)
 	kfree(ring);
 }
 
-static u32 xhci_dbc_populate_strings(struct dbc_str_descs *strings)
-{
-	struct usb_string_descriptor	*s_desc;
-	u32				string_length;
-
-	/* Serial string: */
-	s_desc = (struct usb_string_descriptor *)strings->serial;
-	utf8s_to_utf16s(DBC_STRING_SERIAL, strlen(DBC_STRING_SERIAL),
-			UTF16_LITTLE_ENDIAN, (wchar_t *)s_desc->wData,
-			DBC_MAX_STRING_LENGTH);
-
-	s_desc->bLength		= (strlen(DBC_STRING_SERIAL) + 1) * 2;
-	s_desc->bDescriptorType	= USB_DT_STRING;
-	string_length		= s_desc->bLength;
-	string_length		<<= 8;
-
-	/* Product string: */
-	s_desc = (struct usb_string_descriptor *)strings->product;
-	utf8s_to_utf16s(DBC_STRING_PRODUCT, strlen(DBC_STRING_PRODUCT),
-			UTF16_LITTLE_ENDIAN, (wchar_t *)s_desc->wData,
-			DBC_MAX_STRING_LENGTH);
-
-	s_desc->bLength		= (strlen(DBC_STRING_PRODUCT) + 1) * 2;
-	s_desc->bDescriptorType	= USB_DT_STRING;
-	string_length		+= s_desc->bLength;
-	string_length		<<= 8;
-
-	/* Manufacture string: */
-	s_desc = (struct usb_string_descriptor *)strings->manufacturer;
-	utf8s_to_utf16s(DBC_STRING_MANUFACTURER,
-			strlen(DBC_STRING_MANUFACTURER),
-			UTF16_LITTLE_ENDIAN, (wchar_t *)s_desc->wData,
-			DBC_MAX_STRING_LENGTH);
-
-	s_desc->bLength		= (strlen(DBC_STRING_MANUFACTURER) + 1) * 2;
-	s_desc->bDescriptorType	= USB_DT_STRING;
-	string_length		+= s_desc->bLength;
-	string_length		<<= 8;
-
-	/* String0: */
-	strings->string0[0]	= 4;
-	strings->string0[1]	= USB_DT_STRING;
-	strings->string0[2]	= 0x09;
-	strings->string0[3]	= 0x04;
-	string_length		+= 4;
-
-	return string_length;
-}
-
 static void xhci_dbc_init_ep_contexts(struct xhci_dbc *dbc)
 {
 	struct xhci_ep_ctx      *ep_ctx;
@@ -124,7 +81,64 @@ static void xhci_dbc_init_ep_contexts(struct xhci_dbc *dbc)
 	ep_ctx->deq             = cpu_to_le64(deq | dbc->ring_in->cycle_state);
 }
 
-static void xhci_dbc_init_contexts(struct xhci_dbc *dbc, u32 string_length)
+static u8 get_str_desc_len(const char *desc)
+{
+	return ((struct usb_string_descriptor *)desc)->bLength;
+}
+
+static u32 dbc_prepare_info_context_str_len(struct dbc_str_descs *descs)
+{
+	u32 len;
+
+	len = get_str_desc_len(descs->serial);
+	len <<= 8;
+	len += get_str_desc_len(descs->product);
+	len <<= 8;
+	len += get_str_desc_len(descs->manufacturer);
+	len <<= 8;
+	len += get_str_desc_len(descs->string0);
+
+	return len;
+}
+
+static int xhci_dbc_populate_str_desc(char *desc, const char *src)
+{
+	struct usb_string_descriptor	*s_desc;
+	int				len;
+
+	s_desc = (struct usb_string_descriptor *)desc;
+	/* len holds number of 2 byte UTF-16 characters */
+	len = utf8s_to_utf16s(src, strlen(src), UTF16_LITTLE_ENDIAN,
+			      (wchar_t *)s_desc->wData, 2*USB_MAX_STRING_LEN);
+	if (len < 0)
+		return len;
+
+	s_desc->bLength		= len * 2 + 2;
+	s_desc->bDescriptorType	= USB_DT_STRING;
+
+	return s_desc->bLength;
+}
+
+static void xhci_dbc_populate_str_descs(struct dbc_str_descs *str_descs,
+					struct dbc_str *str)
+{
+	/* Serial string: */
+	xhci_dbc_populate_str_desc(str_descs->serial, str->serial);
+
+	/* Product string: */
+	xhci_dbc_populate_str_desc(str_descs->product, str->product);
+
+	/* Manufacturer string: */
+	xhci_dbc_populate_str_desc(str_descs->manufacturer, str->manufacturer);
+
+	/* String0: */
+	str_descs->string0[0]	= 4;
+	str_descs->string0[1]	= USB_DT_STRING;
+	str_descs->string0[2]	= 0x09;
+	str_descs->string0[3]	= 0x04;
+}
+
+static void xhci_dbc_init_contexts(struct xhci_dbc *dbc)
 {
 	struct dbc_info_context	*info;
 	u32			dev_info;
@@ -135,12 +149,12 @@ static void xhci_dbc_init_contexts(struct xhci_dbc *dbc, u32 string_length)
 
 	/* Populate info Context: */
 	info			= (struct dbc_info_context *)dbc->ctx->bytes;
-	dma			= dbc->string_dma;
+	dma			= dbc->str_descs_dma;
 	info->string0		= cpu_to_le64(dma);
-	info->manufacturer	= cpu_to_le64(dma + DBC_MAX_STRING_LENGTH);
-	info->product		= cpu_to_le64(dma + DBC_MAX_STRING_LENGTH * 2);
-	info->serial		= cpu_to_le64(dma + DBC_MAX_STRING_LENGTH * 3);
-	info->length		= cpu_to_le32(string_length);
+	info->manufacturer	= cpu_to_le64(dma + USB_MAX_STRING_DESC_LEN);
+	info->product		= cpu_to_le64(dma + USB_MAX_STRING_DESC_LEN*2);
+	info->serial		= cpu_to_le64(dma + USB_MAX_STRING_DESC_LEN*3);
+	info->length		= cpu_to_le32(dbc_prepare_info_context_str_len(dbc->str_descs));
 
 	/* Populate bulk in and out endpoint contexts: */
 	xhci_dbc_init_ep_contexts(dbc);
@@ -524,7 +538,6 @@ static int xhci_dbc_mem_init(struct xhci_dbc *dbc, gfp_t flags)
 {
 	int			ret;
 	dma_addr_t		deq;
-	u32			string_length;
 	struct device		*dev = dbc->dev;
 
 	/* Allocate various rings for events and transfers: */
@@ -551,11 +564,11 @@ static int xhci_dbc_mem_init(struct xhci_dbc *dbc, gfp_t flags)
 		goto ctx_fail;
 
 	/* Allocate the string table: */
-	dbc->string_size = sizeof(*dbc->string);
-	dbc->string = dma_alloc_coherent(dev, dbc->string_size,
-					 &dbc->string_dma, flags);
-	if (!dbc->string)
-		goto string_fail;
+	dbc->str_descs_size = sizeof(*dbc->str_descs);
+	dbc->str_descs = dma_alloc_coherent(dev, dbc->str_descs_size,
+					    &dbc->str_descs_dma, flags);
+	if (!dbc->str_descs)
+		goto str_descs_fail;
 
 	/* Setup ERST register: */
 	writel(dbc->erst.num_entries, &dbc->regs->ersts);
@@ -565,16 +578,16 @@ static int xhci_dbc_mem_init(struct xhci_dbc *dbc, gfp_t flags)
 				   dbc->ring_evt->dequeue);
 	lo_hi_writeq(deq, &dbc->regs->erdp);
 
-	/* Setup strings and contexts: */
-	string_length = xhci_dbc_populate_strings(dbc->string);
-	xhci_dbc_init_contexts(dbc, string_length);
+	/* Setup string descriptors and contexts: */
+	xhci_dbc_populate_str_descs(dbc->str_descs, &dbc->str);
+	xhci_dbc_init_contexts(dbc);
 
 	xhci_dbc_eps_init(dbc);
 	dbc->state = DS_INITIALIZED;
 
 	return 0;
 
-string_fail:
+str_descs_fail:
 	dbc_free_ctx(dev, dbc->ctx);
 	dbc->ctx = NULL;
 ctx_fail:
@@ -599,8 +612,8 @@ static void xhci_dbc_mem_cleanup(struct xhci_dbc *dbc)
 
 	xhci_dbc_eps_exit(dbc);
 
-	dma_free_coherent(dbc->dev, dbc->string_size, dbc->string, dbc->string_dma);
-	dbc->string = NULL;
+	dma_free_coherent(dbc->dev, dbc->str_descs_size, dbc->str_descs, dbc->str_descs_dma);
+	dbc->str_descs = NULL;
 
 	dbc_free_ctx(dbc->dev, dbc->ctx);
 	dbc->ctx = NULL;
@@ -1313,6 +1326,9 @@ xhci_alloc_dbc(struct device *dev, void __iomem *base, const struct dbc_driver *
 	dbc->bInterfaceProtocol = DBC_PROTOCOL;
 	dbc->poll_interval = DBC_POLL_INTERVAL_DEFAULT;
 
+	/* initialize serial, product and manufacturer with default values */
+	dbc->str = dbc_str_default;
+
 	if (readl(&dbc->regs->control) & DBC_CTRL_DBC_ENABLE)
 		goto err;
 
diff --git a/drivers/usb/host/xhci-dbgcap.h b/drivers/usb/host/xhci-dbgcap.h
index 47ac72c2286d..07ce9c159b91 100644
--- a/drivers/usb/host/xhci-dbgcap.h
+++ b/drivers/usb/host/xhci-dbgcap.h
@@ -47,10 +47,6 @@ struct dbc_info_context {
 #define DBC_DOOR_BELL_TARGET(p)		(((p) & 0xff) << 8)
 
 #define DBC_MAX_PACKET			1024
-#define DBC_MAX_STRING_LENGTH		64
-#define DBC_STRING_MANUFACTURER		"Linux Foundation"
-#define DBC_STRING_PRODUCT		"Linux USB Debug Target"
-#define DBC_STRING_SERIAL		"0001"
 #define	DBC_CONTEXT_SIZE		64
 
 /*
@@ -63,11 +59,29 @@ struct dbc_info_context {
 #define DBC_PORTSC_LINK_CHANGE		BIT(22)
 #define DBC_PORTSC_CONFIG_CHANGE	BIT(23)
 
+/* The maximum length of a string descriptor is 255, because the bLength
+ * field in the usb_string_descriptor struct is __u8.  In practice the
+ * maximum length is 254, because a string descriptor consists of a 2 byte
+ * header followed by UTF-16 characters (2 bytes each). This allows for
+ * only 126 characters (code points) in the string, which is where
+ * USB_MAX_STRING_LEN comes from.
+ */
+#define USB_MAX_STRING_DESC_LEN		254
+
 struct dbc_str_descs {
-	char	string0[DBC_MAX_STRING_LENGTH];
-	char	manufacturer[DBC_MAX_STRING_LENGTH];
-	char	product[DBC_MAX_STRING_LENGTH];
-	char	serial[DBC_MAX_STRING_LENGTH];
+	char	string0[USB_MAX_STRING_DESC_LEN];
+	char	manufacturer[USB_MAX_STRING_DESC_LEN];
+	char	product[USB_MAX_STRING_DESC_LEN];
+	char	serial[USB_MAX_STRING_DESC_LEN];
+};
+
+/* NULL terminated UTF-8 strings used to create UTF-16 strings
+ * (with maxiumum USB_MAX_STRING_LEN 2 byte characters).
+ */
+struct dbc_str {
+	char	manufacturer[USB_MAX_STRING_LEN+1];
+	char	product[USB_MAX_STRING_LEN+1];
+	char	serial[USB_MAX_STRING_LEN+1];
 };
 
 #define DBC_PROTOCOL			1	/* GNU Remote Debug Command */
@@ -132,9 +146,10 @@ struct xhci_dbc {
 	struct xhci_erst		erst;
 	struct xhci_container_ctx	*ctx;
 
-	struct dbc_str_descs		*string;
-	dma_addr_t			string_dma;
-	size_t				string_size;
+	struct dbc_str_descs		*str_descs;
+	dma_addr_t			str_descs_dma;
+	size_t				str_descs_size;
+	struct dbc_str			str;
 	u16				idVendor;
 	u16				idProduct;
 	u16				bcdDevice;
-- 
2.51.2.1041.gc1ab5b90ca-goog



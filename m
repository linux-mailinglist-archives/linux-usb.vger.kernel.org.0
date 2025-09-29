Return-Path: <linux-usb+bounces-28770-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 794ABBA880F
	for <lists+linux-usb@lfdr.de>; Mon, 29 Sep 2025 11:02:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 23EC9172116
	for <lists+linux-usb@lfdr.de>; Mon, 29 Sep 2025 09:02:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5055F27D776;
	Mon, 29 Sep 2025 09:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cmAjeHDy"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8AED230BCB
	for <linux-usb@vger.kernel.org>; Mon, 29 Sep 2025 09:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759136534; cv=none; b=nqCWJxiesF16DnvlsKePmwC3N7NWZHlSrAGwp2De+2Vb9vKvERA0xguAsif6rss7P+vm7j4FOgnloLi82dJGDrdszw45i5WwetgTcyZCDM+1ATDd27yCupHvoYGaxe9s4LDDozMhSNgfHB9ewgkv6aBys1p8U8biiJ/kGyaGcso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759136534; c=relaxed/simple;
	bh=UF3IRbeAvU3/mhCmSEfWi0/Hv6qQ1iJmQ3VF+bpqxmg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NG+n5oe3XskRNAI8OHPChzVpCcrEXFh6DhhkrNArSulT2x0mrIi696+tofhHOHrj0B9qOZIVhOaW+3uQW+9GtnxFVgQYkaM6Ze9uOwQyK0Hrbny2xa9/VbE4OWL/TqqcOkGQG8s3h9cR7ObvFo2VcX8EKtnYC3+4SRfdH5HYtYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=cmAjeHDy; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b2e66a300cbso859331466b.3
        for <linux-usb@vger.kernel.org>; Mon, 29 Sep 2025 02:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1759136531; x=1759741331; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YhUZqZlZZYXeFoQCGfMJreiujePsVkt51+ye9L/xF5U=;
        b=cmAjeHDybEt3PE0MC0fSassgIypLevO/HHOJbYvwhTktT4gdMJNeHUc8Ii0Nle+Skz
         pmfeBEwPlgnwonWrRI0OMUigf3Ozxf6eiFZs90lQOd/hsFrazauZvecgJgflgxsHdX/K
         XiyL73W2jN2bWWrygEbdIUf4kHYsHnH34Qg9Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759136531; x=1759741331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YhUZqZlZZYXeFoQCGfMJreiujePsVkt51+ye9L/xF5U=;
        b=qcS36AMe9EQgT28L/FVBFowSMISNLqSqd33aFAB2TogamJZVQo1Q2h9I2buquUEKPf
         SzYgeYIhmhbYvyJhzKsZRJCKB2lE3FYDJFUXfSXaNdUijSXrgJjwNfSUsgpvAXhFcoue
         jHRAXMtUYGp5yHveIFQE36HBVkhNCkcZjkGQ6ZiAJ3lpZaoNIviGKicWxhslGubo6kpg
         XSNh5eLXmVQqEwpuCrFSig2fXHHsH4LvLdAGFgMFnZkH6xmvayycxRUKzjDRr2GydiPX
         gOBFXylk+yeN//5Uca11DELn7F54CAAkpKBCV2JyuVEtBl4Sjd2KR2fVBUel7knnaCLW
         eZ7w==
X-Gm-Message-State: AOJu0YwOq8e4Of96jRV1EqsWMQcVPd5Bz5MCOWRMAnTGvVC4AnaYmts/
	FgIWhpfKTTNhWhAP/8JsVU+WysQmMplBYJygNKpvAnJeKPQIThCf7b0CajnRilp3
X-Gm-Gg: ASbGncuvs+eGIW+MkUPgCLHizorftc3936H+7my0k3eENB90kvQwYjSGp3TwNXJ6gal
	aT1r7gjlvWr7cBVQ9Cxcc+6pT2XNx12S5LuN9EZga03IGCP8SiRM/pW71y3+Tim7z8ulmW4a0To
	/HijzEFROp2InMSMbELSk+OZysKmki+Lr0Vcih/EmDRiIhumUZQxST+0zwpf7xBIKN9oB9zX1Pw
	8ccTUZlm8feprdzQlxIaYKEPxp5xB3ojWWSdBKKQvuPHN5oaF2IXnbnERDd/JM0JflsrINOEzhs
	GTZgO0a/RkXSkqXJuwE6oSaAhg+ZXzrOGlQJB5HejPiwEy6nUalRSA0jvZyb+wYbqAshsO272D8
	t4R0wPyiLKRnVpQ2RCEa8u80vcOkE1n34r5uhb+RGQ+W/Puwo6MUD3NJR73teH5w6MNIcHiNomt
	Qo5Ljx9PXENFI=
X-Google-Smtp-Source: AGHT+IH9BObvZfOk469mCpW/FZe60n+LcKynpZ/5sU4n/AEptUBz8uHWjn2sryL2cA7aNUsc4RiECA==
X-Received: by 2002:a17:907:3f1d:b0:b40:8954:a8a9 with SMTP id a640c23a62f3a-b408954abb8mr88144566b.34.1759136530738;
        Mon, 29 Sep 2025 02:02:10 -0700 (PDT)
Received: from januszek.c.googlers.com.com (25.254.32.34.bc.googleusercontent.com. [34.32.254.25])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3545a98d7fsm880017666b.100.2025.09.29.02.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 02:02:10 -0700 (PDT)
From: "=?UTF-8?q?=C5=81ukasz=20Bartosik?=" <ukaszb@chromium.org>
X-Google-Original-From: =?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@google.com>
To: Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	=?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>
Subject: [PATCH v1 1/4] xhci: dbc: prepare to expose strings through sysfs
Date: Mon, 29 Sep 2025 09:02:03 +0000
Message-ID: <20250929090206.423937-2-ukaszb@google.com>
X-Mailer: git-send-email 2.51.0.536.g15c5d4f767-goog
In-Reply-To: <20250929090206.423937-1-ukaszb@google.com>
References: <20250929090206.423937-1-ukaszb@google.com>
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
 drivers/usb/host/xhci-dbgcap.c | 145 ++++++++++++++++++---------------
 drivers/usb/host/xhci-dbgcap.h |  24 ++++--
 2 files changed, 94 insertions(+), 75 deletions(-)

diff --git a/drivers/usb/host/xhci-dbgcap.c b/drivers/usb/host/xhci-dbgcap.c
index 63edf2d8f245..c2fecaffd6f3 100644
--- a/drivers/usb/host/xhci-dbgcap.c
+++ b/drivers/usb/host/xhci-dbgcap.c
@@ -52,55 +52,6 @@ static void dbc_ring_free(struct device *dev, struct xhci_ring *ring)
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
@@ -124,7 +75,63 @@ static void xhci_dbc_init_ep_contexts(struct xhci_dbc *dbc)
 	ep_ctx->deq             = cpu_to_le64(deq | dbc->ring_in->cycle_state);
 }
 
-static void xhci_dbc_init_contexts(struct xhci_dbc *dbc, u32 string_length)
+static u8 get_str_desc_len(const char *desc)
+{
+	return ((struct usb_string_descriptor *)desc)->bLength;
+}
+
+static u32 prepare_len(struct dbc_str_descs *descs)
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
+	int				utf16_len;
+
+	s_desc = (struct usb_string_descriptor *)desc;
+	utf16_len = utf8s_to_utf16s(src, strlen(src), UTF16_LITTLE_ENDIAN,
+				    (wchar_t *)s_desc->wData, USB_MAX_STRING_LEN);
+	if (utf16_len < 0)
+		return utf16_len;
+
+	s_desc->bLength		= utf16_len * 2 + 2;
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
@@ -135,12 +142,12 @@ static void xhci_dbc_init_contexts(struct xhci_dbc *dbc, u32 string_length)
 
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
+	info->length		= cpu_to_le32(prepare_len(dbc->str_descs));
 
 	/* Populate bulk in and out endpoint contexts: */
 	xhci_dbc_init_ep_contexts(dbc);
@@ -525,7 +532,6 @@ static int xhci_dbc_mem_init(struct xhci_dbc *dbc, gfp_t flags)
 {
 	int			ret;
 	dma_addr_t		deq;
-	u32			string_length;
 	struct device		*dev = dbc->dev;
 
 	/* Allocate various rings for events and transfers: */
@@ -552,11 +558,11 @@ static int xhci_dbc_mem_init(struct xhci_dbc *dbc, gfp_t flags)
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
@@ -566,16 +572,16 @@ static int xhci_dbc_mem_init(struct xhci_dbc *dbc, gfp_t flags)
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
@@ -600,8 +606,8 @@ static void xhci_dbc_mem_cleanup(struct xhci_dbc *dbc)
 
 	xhci_dbc_eps_exit(dbc);
 
-	dma_free_coherent(dbc->dev, dbc->string_size, dbc->string, dbc->string_dma);
-	dbc->string = NULL;
+	dma_free_coherent(dbc->dev, dbc->str_descs_size, dbc->str_descs, dbc->str_descs_dma);
+	dbc->str_descs = NULL;
 
 	dbc_free_ctx(dbc->dev, dbc->ctx);
 	dbc->ctx = NULL;
@@ -1314,6 +1320,11 @@ xhci_alloc_dbc(struct device *dev, void __iomem *base, const struct dbc_driver *
 	dbc->bInterfaceProtocol = DBC_PROTOCOL;
 	dbc->poll_interval = DBC_POLL_INTERVAL_DEFAULT;
 
+	/* initialize serial, product and manufacturer with default values */
+	memcpy(dbc->str.serial, DBC_STRING_SERIAL, strlen(DBC_STRING_SERIAL)+1);
+	memcpy(dbc->str.product, DBC_STRING_PRODUCT, strlen(DBC_STRING_PRODUCT)+1);
+	memcpy(dbc->str.manufacturer, DBC_STRING_MANUFACTURER, strlen(DBC_STRING_MANUFACTURER)+1);
+
 	if (readl(&dbc->regs->control) & DBC_CTRL_DBC_ENABLE)
 		goto err;
 
diff --git a/drivers/usb/host/xhci-dbgcap.h b/drivers/usb/host/xhci-dbgcap.h
index 47ac72c2286d..0e6addafea6c 100644
--- a/drivers/usb/host/xhci-dbgcap.h
+++ b/drivers/usb/host/xhci-dbgcap.h
@@ -47,7 +47,6 @@ struct dbc_info_context {
 #define DBC_DOOR_BELL_TARGET(p)		(((p) & 0xff) << 8)
 
 #define DBC_MAX_PACKET			1024
-#define DBC_MAX_STRING_LENGTH		64
 #define DBC_STRING_MANUFACTURER		"Linux Foundation"
 #define DBC_STRING_PRODUCT		"Linux USB Debug Target"
 #define DBC_STRING_SERIAL		"0001"
@@ -63,11 +62,19 @@ struct dbc_info_context {
 #define DBC_PORTSC_LINK_CHANGE		BIT(22)
 #define DBC_PORTSC_CONFIG_CHANGE	BIT(23)
 
+#define USB_MAX_STRING_DESC_LEN		(USB_MAX_STRING_LEN + 2)
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
+struct dbc_str {
+	char	manufacturer[USB_MAX_STRING_LEN/2+1];
+	char	product[USB_MAX_STRING_LEN/2+1];
+	char	serial[USB_MAX_STRING_LEN/2+1];
 };
 
 #define DBC_PROTOCOL			1	/* GNU Remote Debug Command */
@@ -132,9 +139,10 @@ struct xhci_dbc {
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
2.51.0.536.g15c5d4f767-goog



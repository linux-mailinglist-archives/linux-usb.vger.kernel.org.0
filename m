Return-Path: <linux-usb+bounces-28984-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC51BC2C67
	for <lists+linux-usb@lfdr.de>; Tue, 07 Oct 2025 23:41:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 77BE84E0254
	for <lists+linux-usb@lfdr.de>; Tue,  7 Oct 2025 21:41:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 986F6265281;
	Tue,  7 Oct 2025 21:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RRQWG9Tf"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB44E262FCD
	for <linux-usb@vger.kernel.org>; Tue,  7 Oct 2025 21:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759873180; cv=none; b=SJOhqPdAQYK1uEylAB3kg9tUm4PpOawo2M1G8wzMcslLEL49RMn54tUdKV+YNoNrGXmB+mFcdGgWYHNcIBcZAb8ymTppKIDEW7wYwzwEfj5PoQVIWXtNHhSlgTXRqPtMbuaGrt0rnY8fIZZ6nThy3oBWpPDsM6QS7yPN27bKSaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759873180; c=relaxed/simple;
	bh=cSxVvrqlzu3AGZ5FKyLo7K5QPfsnhpRvuuPCXrffvlQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OhrtHVDvXoMpZ7G/APUqdgHccRfhlw4eM/Pi4Vvx7dQpObdouM4RBSm11SwVB6gmBRKLLRMn9R5xsVCQdUhcO66XFj4EAodxoAq/a4fr86IQ0ff6K3K3r8ep0FayM5tgWYYZOeKjqbGc9PcQrC+/dVyYmRueKW0RKQiES4Ftm08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RRQWG9Tf; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-636de696e18so11389186a12.3
        for <linux-usb@vger.kernel.org>; Tue, 07 Oct 2025 14:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1759873175; x=1760477975; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kW7oBp/9BgnOl+YhUmgKiYAML4UPInWkaHVnOmUWbhE=;
        b=RRQWG9TfJpdgdCyIh2vBmAr59BdAR9VtDmbRCa/+RokZlKJdBCEO9JiHtBhur1fkKl
         4+SdiYiduDj1W7tWwpNVTgAuSo7KRN+aEaaN44uEKtY21kpXREZok9DWN2bURK60iDLP
         dEB88jITyDBhw2C2BoO5C8m9fjNpsI87qqH6A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759873175; x=1760477975;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kW7oBp/9BgnOl+YhUmgKiYAML4UPInWkaHVnOmUWbhE=;
        b=l0G/55M8Jeu1LdnM+tN7m9q0bH0FFSTGoSQTlNIfEiNrl8wPv+NGRrI4iqqEQljHtf
         DyJhjBSSbE6DpAYwIcNL+Wzi39gbdceYkpoJLUgnhwMofAGc6kczmo1uYqBBLWUhNINA
         Ae9q7b3yS6aXvGoAvn/79hyAqXYzD90n5botwUu+okt48rCESjN+jn1p2mbBEH81n7g6
         fGm2wjGpm2zJqzB46gu4LHDkocNVWQTgBof7QGXgSKOsmg63JMV7dT9Y36i8EkP6ulH3
         LVcdA2n9y6kk1RyekjxWj6TnJh56c3TQjuITEn5JW9bxGcHloPRDO9eeockN5FwVd3hB
         c1Iw==
X-Gm-Message-State: AOJu0YyzrNQCs9GDq8xyvzVkm3VcvrHr2W+/mkLIi/DItjWtGd10X6Bc
	/4xY0iMbGvXJCB/8NVQRsnty/7cLbXFWuELaM49pCJM+9oWi4fJ/EzmTLaOyCUIRbz3xVyXIP05
	vq0LwGOo=
X-Gm-Gg: ASbGncu7hPUtgpMboVVVHbP5Go83AnrXH/bKqgmNndcUPYdH1FWA8Q4/fy8+hEyjn7f
	2xi843Q0VDtDf5fEkAjvkkFG/Htu5Rm1HLDcOYHyJ4usM/Krb1EtDp0X7Z6ok70MIUihWg30+b0
	P0Va2IcmWu4ixnJ/xUPUfmpv8ctDVT8KqoEWrK/kDp7xaWjwUkwV3PonlvN90tFB9VDOP6GJzB4
	PsfwbT4wQOf8a/vZlXwyi56YHymoBapkzW/S96Ut5iiLdifvZeRI3xSA6SuonM2SftHMG3Nzui7
	5/0J1v5hVsW1TJBJAm76I8S9AGB7qcpBI+Sp5t4+RPGGV7SwgnRmrScW37UjsJdWlRENNQ7xLW0
	WdMEX65Rz0MSM6hnaTYP6/215hmvWPFJyZ2d+xV4Cg3qKpzYhxd8uyJoHKy+hxsj32P+zveWBFH
	2EkRECQ40perglqbCry2tDCJ86
X-Google-Smtp-Source: AGHT+IGPMuvK4MkyzpZkR+hHyTcz+1bTs8w2S7564rXhMow0GjYdr+WPzBdhp9COqNVOl7/NOmgjTg==
X-Received: by 2002:a17:907:3f1c:b0:b47:2be3:bc75 with SMTP id a640c23a62f3a-b50ac5d1dd9mr123066166b.60.1759873175447;
        Tue, 07 Oct 2025 14:39:35 -0700 (PDT)
Received: from januszek.c.googlers.com.com (25.254.32.34.bc.googleusercontent.com. [34.32.254.25])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4865f74002sm1506331366b.42.2025.10.07.14.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 14:39:35 -0700 (PDT)
From: "=?UTF-8?q?=C5=81ukasz=20Bartosik?=" <ukaszb@chromium.org>
X-Google-Original-From: =?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@google.com>
To: Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	=?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>
Subject: [PATCH v2 1/4] xhci: dbc: prepare to expose strings through sysfs
Date: Tue,  7 Oct 2025 21:38:59 +0000
Message-ID: <20251007213902.2231670-2-ukaszb@google.com>
X-Mailer: git-send-email 2.51.0.710.ga91ca5db03-goog
In-Reply-To: <20251007213902.2231670-1-ukaszb@google.com>
References: <20251007213902.2231670-1-ukaszb@google.com>
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
2.51.0.710.ga91ca5db03-goog



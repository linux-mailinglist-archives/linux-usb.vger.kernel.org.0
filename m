Return-Path: <linux-usb+bounces-32548-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gJ21Nr7Zb2n8RwAAu9opvQ
	(envelope-from <linux-usb+bounces-32548-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 20 Jan 2026 20:38:38 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A3824A96C
	for <lists+linux-usb@lfdr.de>; Tue, 20 Jan 2026 20:38:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6AC015EE97C
	for <lists+linux-usb@lfdr.de>; Tue, 20 Jan 2026 18:13:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E44433EFD26;
	Tue, 20 Jan 2026 18:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BW1pRjHN"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9036407568
	for <linux-usb@vger.kernel.org>; Tue, 20 Jan 2026 18:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768932730; cv=none; b=a+9lIVVeShjDdFcuAwTeqZ7zcYcDur7gAgajcT6IJD3PX8f4svglwG8XkyWNy+IeSBCI3SLqaBuNUu78TWLx2ovFtd7swavjNnycJvlxEXzHLZl962TFQT4kpCV9mzCghAXfn2LaqB//Jtxs+aEs5zufIgcaXMg4jr9A9qGc7HU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768932730; c=relaxed/simple;
	bh=sRtpbKlWE4uUY972wJvHiiSBYzA4bcUT5GXXEUv5OZg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Wfa6jB6bG2P8FbOveyYWvUBwjJmZ0XaDpli5BEavHU8WQfi4E50ujOk3z8rhdj9tmUTzgDz6Uwf75wFR3MnDZ9HZIVRsGB71GpB6Jao/dHCMOMN/j3IxoooUvB7Qtqonc8v3b458ZJkb/BkNJEsmsG0ZFadnfMA7sRQT4OI83II=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BW1pRjHN; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768932728; x=1800468728;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sRtpbKlWE4uUY972wJvHiiSBYzA4bcUT5GXXEUv5OZg=;
  b=BW1pRjHN89Pq7R4QvdA5PvN41ekRxhsBhs2WQgywNVbcrxcBTCP0N9i7
   YHts71aO2HgcCnFdMBNYZmmOlyM+PevHvcq7s79bZlFHpmpDbt9bO989z
   yR8xhSyMClIcLI3UAK2QzwpMkkc10VtfAM5Fqz0ajLZhJ9MofrGntTDge
   NollXal7nlaSvnOlGhiXtlApSleIzHHbAzoWRZ54LGBZb5bgE8iHWLokm
   +Qn+lvMKOXHACF7w5iO4wLx5nMXOgwfiB3X5n0KejidFPwyNJptkSHnN0
   lnyxx1RYSN+A0eaBGbAZLQ+f8xp/XhatciIDTxsFKPJjPoNx8hDOfhJPb
   g==;
X-CSE-ConnectionGUID: WYO6z6kJQXivD+OJAqdPJA==
X-CSE-MsgGUID: +dEjGd0tR4OsS+6fbiXuBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="70055579"
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; 
   d="scan'208";a="70055579"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 10:12:07 -0800
X-CSE-ConnectionGUID: jzGMwARQRzqkLsxPeVFX+w==
X-CSE-MsgGUID: cHsMWx0pRrSQ7isMZwoxIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; 
   d="scan'208";a="205997433"
Received: from abityuts-desk.ger.corp.intel.com (HELO mnyman-desk.home) ([10.245.244.215])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 10:12:06 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	=?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 1/4] xhci: dbc: prepare to expose strings through sysfs
Date: Tue, 20 Jan 2026 20:11:45 +0200
Message-ID: <20260120181148.128712-2-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260120181148.128712-1-mathias.nyman@linux.intel.com>
References: <20260120181148.128712-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[intel.com,none];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32548-lists,linux-usb=lfdr.de];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mathias.nyman@linux.intel.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-usb];
	RCVD_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:mid,chromium.org:email,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,intel.com:email,intel.com:dkim]
X-Rspamd-Queue-Id: 5A3824A96C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-dbgcap.c | 151 ++++++++++++++++++---------------
 drivers/usb/host/xhci-dbgcap.h |  39 ++++++---
 2 files changed, 112 insertions(+), 78 deletions(-)

diff --git a/drivers/usb/host/xhci-dbgcap.c b/drivers/usb/host/xhci-dbgcap.c
index 9da4f3b452cb..4ba8edb37e51 100644
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
@@ -124,7 +81,65 @@ static void xhci_dbc_init_ep_contexts(struct xhci_dbc *dbc)
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
+
+	/* len holds number of 2 byte UTF-16 characters */
+	len = utf8s_to_utf16s(src, strlen(src), UTF16_LITTLE_ENDIAN,
+			      (wchar_t *)s_desc->wData, USB_MAX_STRING_LEN * 2);
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
@@ -135,12 +150,12 @@ static void xhci_dbc_init_contexts(struct xhci_dbc *dbc, u32 string_length)
 
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
+	info->product		= cpu_to_le64(dma + USB_MAX_STRING_DESC_LEN * 2);
+	info->serial		= cpu_to_le64(dma + USB_MAX_STRING_DESC_LEN * 3);
+	info->length		= cpu_to_le32(dbc_prepare_info_context_str_len(dbc->str_descs));
 
 	/* Populate bulk in and out endpoint contexts: */
 	xhci_dbc_init_ep_contexts(dbc);
@@ -525,7 +540,6 @@ static int xhci_dbc_mem_init(struct xhci_dbc *dbc, gfp_t flags)
 {
 	int			ret;
 	dma_addr_t		deq;
-	u32			string_length;
 	struct device		*dev = dbc->dev;
 
 	/* Allocate various rings for events and transfers: */
@@ -552,11 +566,11 @@ static int xhci_dbc_mem_init(struct xhci_dbc *dbc, gfp_t flags)
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
@@ -566,16 +580,16 @@ static int xhci_dbc_mem_init(struct xhci_dbc *dbc, gfp_t flags)
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
@@ -600,8 +614,8 @@ static void xhci_dbc_mem_cleanup(struct xhci_dbc *dbc)
 
 	xhci_dbc_eps_exit(dbc);
 
-	dma_free_coherent(dbc->dev, dbc->string_size, dbc->string, dbc->string_dma);
-	dbc->string = NULL;
+	dma_free_coherent(dbc->dev, dbc->str_descs_size, dbc->str_descs, dbc->str_descs_dma);
+	dbc->str_descs = NULL;
 
 	dbc_free_ctx(dbc->dev, dbc->ctx);
 	dbc->ctx = NULL;
@@ -1316,6 +1330,9 @@ xhci_alloc_dbc(struct device *dev, void __iomem *base, const struct dbc_driver *
 	dbc->bInterfaceProtocol = DBC_PROTOCOL;
 	dbc->poll_interval = DBC_POLL_INTERVAL_DEFAULT;
 
+	/* initialize serial, product and manufacturer with default values */
+	dbc->str = dbc_str_default;
+
 	if (readl(&dbc->regs->control) & DBC_CTRL_DBC_ENABLE)
 		goto err;
 
diff --git a/drivers/usb/host/xhci-dbgcap.h b/drivers/usb/host/xhci-dbgcap.h
index 5426c971d2d3..20ae4e7617f2 100644
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
@@ -63,11 +59,31 @@ struct dbc_info_context {
 #define DBC_PORTSC_LINK_CHANGE		BIT(22)
 #define DBC_PORTSC_CONFIG_CHANGE	BIT(23)
 
+/*
+ * The maximum length of a string descriptor is 255, because the bLength
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
+/*
+ * NULL terminated UTF-8 strings used to create UTF-16 strings
+ * (with maxiumum USB_MAX_STRING_LEN 2 byte characters).
+ */
+struct dbc_str {
+	char	manufacturer[USB_MAX_STRING_LEN+1];
+	char	product[USB_MAX_STRING_LEN+1];
+	char	serial[USB_MAX_STRING_LEN+1];
 };
 
 #define DBC_PROTOCOL			1	/* GNU Remote Debug Command */
@@ -133,9 +149,10 @@ struct xhci_dbc {
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
2.43.0



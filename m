Return-Path: <linux-usb+bounces-11329-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BA416908B66
	for <lists+linux-usb@lfdr.de>; Fri, 14 Jun 2024 14:15:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0573DB23689
	for <lists+linux-usb@lfdr.de>; Fri, 14 Jun 2024 12:15:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93361196D9A;
	Fri, 14 Jun 2024 12:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T0gUXYNc"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A9A196DA2
	for <linux-usb@vger.kernel.org>; Fri, 14 Jun 2024 12:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718367320; cv=none; b=ODzaQLR0q09Y0lVoOtd/XDnR1QiLy4JhmiNTF/Aspzc0gTtubEKiyDaLlNKY23tmoBgXBHncLl67nADNWypJ3UYQWf2xpmg5/EvHNSKq8YeDi1SOaCqYwwGVqareCXuovQs0ulIhIgxtMr4cHOAxxa/4pRbDM6VaYMxquTbu8FI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718367320; c=relaxed/simple;
	bh=FZRp2aRGt4kYoke4wqHiT81QKoPwQ3i8HYs8UJypBd8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cHku1J9VSinZM68gyoXRXpnBLlOZllkSQtaeNVsJVufCwRpeDzBBTP+iH/nIRMfSaBsa4B6RLzakAhBGamlz6qjEKkhoj3+207ilJqX3TcMWva4qxXP8hWoWjsY4e2ruK40hscJovscBNU7LLMbwTmudqQ1bwVPEwRAKpxIxO/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T0gUXYNc; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718367318; x=1749903318;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FZRp2aRGt4kYoke4wqHiT81QKoPwQ3i8HYs8UJypBd8=;
  b=T0gUXYNcH+hSxgbMZqpP2Hdw8u99VoLTUFp95w6DOD93lkCHJAUUk4DG
   BVT69Z+Xxl8O9LFekkHrhijwzCoBXwJUqJVDU7LkXOnA7AQ4PROyxY1iG
   0WjnBFaSi5WFr4L35FQuBi1BE2CuR51OEhdCa4k8TpVj9HxWFzb1bdgJy
   AqdsoxOL0vce9GVdJZ3Vl2884AScmuFhK6rM8bYH2rgezLmL2dBJzVNb8
   vXHZUIiQ6F43XK/MTVAysx5Jhhu4zNRVIlFivJF9p2/jPyHGCQIRiBen0
   OAqeEs1YcHhX3wHZEtV0HjttU0ZgBDAwxrUl06mdlYRCXzs6CF0D2UAKL
   w==;
X-CSE-ConnectionGUID: A1pFMEglS5WVaBRokNmeHQ==
X-CSE-MsgGUID: nqsz+4YlThij8dGSvy+D9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="15410001"
X-IronPort-AV: E=Sophos;i="6.08,237,1712646000"; 
   d="scan'208";a="15410001"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2024 05:15:15 -0700
X-CSE-ConnectionGUID: vBkN0EPkS86q0OTdaauy5w==
X-CSE-MsgGUID: +LMIawAoS9yPm6bJ8fnn/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,237,1712646000"; 
   d="scan'208";a="45437712"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa005.jf.intel.com with ESMTP; 14 Jun 2024 05:15:13 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 5F416301; Fri, 14 Jun 2024 15:15:12 +0300 (EEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>
Cc: linux-usb@vger.kernel.org,
	Greg KH <gregkh@linuxfoundation.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v2 2/6] thunderbolt: Make usb4_port_sb_read/write() available outside of usb4.c
Date: Fri, 14 Jun 2024 15:15:08 +0300
Message-ID: <20240614121512.1361184-3-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240614121512.1361184-1-mika.westerberg@linux.intel.com>
References: <20240614121512.1361184-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We need to call these from other files too so make them available
outside of usb4.c.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/retimer.c |   8 +--
 drivers/thunderbolt/tb.h      |  21 +++++--
 drivers/thunderbolt/usb4.c    | 112 ++++++++++++++--------------------
 3 files changed, 66 insertions(+), 75 deletions(-)

diff --git a/drivers/thunderbolt/retimer.c b/drivers/thunderbolt/retimer.c
index 6eaaa5074ce8..9b66bff98f7e 100644
--- a/drivers/thunderbolt/retimer.c
+++ b/drivers/thunderbolt/retimer.c
@@ -372,16 +372,16 @@ static int tb_retimer_add(struct tb_port *port, u8 index, u32 auth_status)
 	u32 vendor, device;
 	int ret;
 
-	ret = usb4_port_retimer_read(port, index, USB4_SB_VENDOR_ID, &vendor,
-				     sizeof(vendor));
+	ret = usb4_port_sb_read(port, USB4_SB_TARGET_RETIMER, index,
+				USB4_SB_VENDOR_ID, &vendor, sizeof(vendor));
 	if (ret) {
 		if (ret != -ENODEV)
 			tb_port_warn(port, "failed read retimer VendorId: %d\n", ret);
 		return ret;
 	}
 
-	ret = usb4_port_retimer_read(port, index, USB4_SB_PRODUCT_ID, &device,
-				     sizeof(device));
+	ret = usb4_port_sb_read(port, USB4_SB_TARGET_RETIMER, index,
+				USB4_SB_PRODUCT_ID, &device, sizeof(device));
 	if (ret) {
 		if (ret != -ENODEV)
 			tb_port_warn(port, "failed read retimer ProductId: %d\n", ret);
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index ac9368c7a513..ab3366fcb0a3 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -1332,6 +1332,23 @@ bool usb4_port_asym_supported(struct tb_port *port);
 int usb4_port_asym_set_link_width(struct tb_port *port, enum tb_link_width width);
 int usb4_port_asym_start(struct tb_port *port);
 
+/**
+ * enum tb_sb_target - Sideband transaction target
+ * @USB4_SB_TARGET_ROUTER: Target is the router itself
+ * @USB4_SB_TARGET_PARTNER: Target is partner
+ * @USB4_SB_TARGET_RETIMER: Target is retimer
+ */
+enum usb4_sb_target {
+	USB4_SB_TARGET_ROUTER,
+	USB4_SB_TARGET_PARTNER,
+	USB4_SB_TARGET_RETIMER,
+};
+
+int usb4_port_sb_read(struct tb_port *port, enum usb4_sb_target target, u8 index,
+		      u8 reg, void *buf, u8 size);
+int usb4_port_sb_write(struct tb_port *port, enum usb4_sb_target target,
+		       u8 index, u8 reg, const void *buf, u8 size);
+
 int usb4_port_margining_caps(struct tb_port *port, u32 *caps);
 int usb4_port_hw_margin(struct tb_port *port, unsigned int lanes,
 			unsigned int ber_level, bool timing, bool right_high,
@@ -1342,10 +1359,6 @@ int usb4_port_sw_margin_errors(struct tb_port *port, u32 *errors);
 
 int usb4_port_retimer_set_inbound_sbtx(struct tb_port *port, u8 index);
 int usb4_port_retimer_unset_inbound_sbtx(struct tb_port *port, u8 index);
-int usb4_port_retimer_read(struct tb_port *port, u8 index, u8 reg, void *buf,
-			   u8 size);
-int usb4_port_retimer_write(struct tb_port *port, u8 index, u8 reg,
-			    const void *buf, u8 size);
 int usb4_port_retimer_is_last(struct tb_port *port, u8 index);
 int usb4_port_retimer_nvm_sector_size(struct tb_port *port, u8 index);
 int usb4_port_retimer_nvm_set_offset(struct tb_port *port, u8 index,
diff --git a/drivers/thunderbolt/usb4.c b/drivers/thunderbolt/usb4.c
index de480bf2a53d..140e0da3a8de 100644
--- a/drivers/thunderbolt/usb4.c
+++ b/drivers/thunderbolt/usb4.c
@@ -17,12 +17,6 @@
 #define USB4_DATA_RETRIES		3
 #define USB4_DATA_DWORDS		16
 
-enum usb4_sb_target {
-	USB4_SB_TARGET_ROUTER,
-	USB4_SB_TARGET_PARTNER,
-	USB4_SB_TARGET_RETIMER,
-};
-
 #define USB4_NVM_READ_OFFSET_MASK	GENMASK(23, 2)
 #define USB4_NVM_READ_OFFSET_SHIFT	2
 #define USB4_NVM_READ_LENGTH_MASK	GENMASK(27, 24)
@@ -1289,8 +1283,20 @@ static int usb4_port_write_data(struct tb_port *port, const void *data,
 			     dwords);
 }
 
-static int usb4_port_sb_read(struct tb_port *port, enum usb4_sb_target target,
-			     u8 index, u8 reg, void *buf, u8 size)
+/**
+ * usb4_port_sb_read() - Read from sideband register
+ * @port: USB4 port to read
+ * @target: Sideband target
+ * @index: Retimer index if taget is %USB4_SB_TARGET_RETIMER
+ * @reg: Sideband register index
+ * @buf: Buffer where the sideband data is copied
+ * @size: Size of @buf
+ *
+ * Reads data from sideband register @reg and copies it into @buf.
+ * Returns %0 in case of success and negative errno in case of failure.
+ */
+int usb4_port_sb_read(struct tb_port *port, enum usb4_sb_target target, u8 index,
+		      u8 reg, void *buf, u8 size)
 {
 	size_t dwords = DIV_ROUND_UP(size, 4);
 	int ret;
@@ -1329,8 +1335,20 @@ static int usb4_port_sb_read(struct tb_port *port, enum usb4_sb_target target,
 	return buf ? usb4_port_read_data(port, buf, dwords) : 0;
 }
 
-static int usb4_port_sb_write(struct tb_port *port, enum usb4_sb_target target,
-			      u8 index, u8 reg, const void *buf, u8 size)
+/**
+ * usb4_port_sb_write() - Write to sideband register
+ * @port: USB4 port to write
+ * @target: Sideband target
+ * @index: Retimer index if taget is %USB4_SB_TARGET_RETIMER
+ * @reg: Sideband register index
+ * @buf: Data to write
+ * @size: Size of @buf
+ *
+ * Writes @buf to sideband register @reg. Returns %0 in case of success
+ * and negative errno in case of failure.
+ */
+int usb4_port_sb_write(struct tb_port *port, enum usb4_sb_target target,
+		       u8 index, u8 reg, const void *buf, u8 size)
 {
 	size_t dwords = DIV_ROUND_UP(size, 4);
 	int ret;
@@ -1776,47 +1794,6 @@ int usb4_port_retimer_unset_inbound_sbtx(struct tb_port *port, u8 index)
 				    USB4_SB_OPCODE_UNSET_INBOUND_SBTX, 500);
 }
 
-/**
- * usb4_port_retimer_read() - Read from retimer sideband registers
- * @port: USB4 port
- * @index: Retimer index
- * @reg: Sideband register to read
- * @buf: Data from @reg is stored here
- * @size: Number of bytes to read
- *
- * Function reads retimer sideband registers starting from @reg. The
- * retimer is connected to @port at @index. Returns %0 in case of
- * success, and read data is copied to @buf. If there is no retimer
- * present at given @index returns %-ENODEV. In any other failure
- * returns negative errno.
- */
-int usb4_port_retimer_read(struct tb_port *port, u8 index, u8 reg, void *buf,
-			   u8 size)
-{
-	return usb4_port_sb_read(port, USB4_SB_TARGET_RETIMER, index, reg, buf,
-				 size);
-}
-
-/**
- * usb4_port_retimer_write() - Write to retimer sideband registers
- * @port: USB4 port
- * @index: Retimer index
- * @reg: Sideband register to write
- * @buf: Data that is written starting from @reg
- * @size: Number of bytes to write
- *
- * Writes retimer sideband registers starting from @reg. The retimer is
- * connected to @port at @index. Returns %0 in case of success. If there
- * is no retimer present at given @index returns %-ENODEV. In any other
- * failure returns negative errno.
- */
-int usb4_port_retimer_write(struct tb_port *port, u8 index, u8 reg,
-			    const void *buf, u8 size)
-{
-	return usb4_port_sb_write(port, USB4_SB_TARGET_RETIMER, index, reg, buf,
-				  size);
-}
-
 /**
  * usb4_port_retimer_is_last() - Is the retimer last on-board retimer
  * @port: USB4 port
@@ -1837,8 +1814,8 @@ int usb4_port_retimer_is_last(struct tb_port *port, u8 index)
 	if (ret)
 		return ret;
 
-	ret = usb4_port_retimer_read(port, index, USB4_SB_METADATA, &metadata,
-				     sizeof(metadata));
+	ret = usb4_port_sb_read(port, USB4_SB_TARGET_RETIMER, index,
+				USB4_SB_METADATA, &metadata, sizeof(metadata));
 	return ret ? ret : metadata & 1;
 }
 
@@ -1863,8 +1840,8 @@ int usb4_port_retimer_nvm_sector_size(struct tb_port *port, u8 index)
 	if (ret)
 		return ret;
 
-	ret = usb4_port_retimer_read(port, index, USB4_SB_METADATA, &metadata,
-				     sizeof(metadata));
+	ret = usb4_port_sb_read(port, USB4_SB_TARGET_RETIMER, index,
+				USB4_SB_METADATA, &metadata, sizeof(metadata));
 	return ret ? ret : metadata & USB4_NVM_SECTOR_SIZE_MASK;
 }
 
@@ -1889,8 +1866,8 @@ int usb4_port_retimer_nvm_set_offset(struct tb_port *port, u8 index,
 	metadata = (dwaddress << USB4_NVM_SET_OFFSET_SHIFT) &
 		  USB4_NVM_SET_OFFSET_MASK;
 
-	ret = usb4_port_retimer_write(port, index, USB4_SB_METADATA, &metadata,
-				      sizeof(metadata));
+	ret = usb4_port_sb_write(port, USB4_SB_TARGET_RETIMER, index,
+				 USB4_SB_METADATA, &metadata, sizeof(metadata));
 	if (ret)
 		return ret;
 
@@ -1912,8 +1889,8 @@ static int usb4_port_retimer_nvm_write_next_block(void *data,
 	u8 index = info->index;
 	int ret;
 
-	ret = usb4_port_retimer_write(port, index, USB4_SB_DATA,
-				      buf, dwords * 4);
+	ret = usb4_port_sb_write(port, USB4_SB_TARGET_RETIMER, index,
+				 USB4_SB_DATA, buf, dwords * 4);
 	if (ret)
 		return ret;
 
@@ -1992,8 +1969,8 @@ int usb4_port_retimer_nvm_authenticate_status(struct tb_port *port, u8 index,
 	u32 metadata, val;
 	int ret;
 
-	ret = usb4_port_retimer_read(port, index, USB4_SB_OPCODE, &val,
-				     sizeof(val));
+	ret = usb4_port_sb_read(port, USB4_SB_TARGET_RETIMER, index,
+				USB4_SB_OPCODE, &val, sizeof(val));
 	if (ret)
 		return ret;
 
@@ -2004,8 +1981,9 @@ int usb4_port_retimer_nvm_authenticate_status(struct tb_port *port, u8 index,
 		return 0;
 
 	case -EAGAIN:
-		ret = usb4_port_retimer_read(port, index, USB4_SB_METADATA,
-					     &metadata, sizeof(metadata));
+		ret = usb4_port_sb_read(port, USB4_SB_TARGET_RETIMER, index,
+					USB4_SB_METADATA, &metadata,
+					sizeof(metadata));
 		if (ret)
 			return ret;
 
@@ -2030,8 +2008,8 @@ static int usb4_port_retimer_nvm_read_block(void *data, unsigned int dwaddress,
 	if (dwords < USB4_DATA_DWORDS)
 		metadata |= dwords << USB4_NVM_READ_LENGTH_SHIFT;
 
-	ret = usb4_port_retimer_write(port, index, USB4_SB_METADATA, &metadata,
-				      sizeof(metadata));
+	ret = usb4_port_sb_write(port, USB4_SB_TARGET_RETIMER, index,
+				 USB4_SB_METADATA, &metadata, sizeof(metadata));
 	if (ret)
 		return ret;
 
@@ -2039,8 +2017,8 @@ static int usb4_port_retimer_nvm_read_block(void *data, unsigned int dwaddress,
 	if (ret)
 		return ret;
 
-	return usb4_port_retimer_read(port, index, USB4_SB_DATA, buf,
-				      dwords * 4);
+	return usb4_port_sb_read(port, USB4_SB_TARGET_RETIMER, index,
+				 USB4_SB_DATA, buf, dwords * 4);
 }
 
 /**
-- 
2.43.0



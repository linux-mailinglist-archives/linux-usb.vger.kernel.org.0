Return-Path: <linux-usb+bounces-11056-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E530D901EE7
	for <lists+linux-usb@lfdr.de>; Mon, 10 Jun 2024 12:07:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6DD842815EC
	for <lists+linux-usb@lfdr.de>; Mon, 10 Jun 2024 10:07:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CFD9762EB;
	Mon, 10 Jun 2024 10:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kiFin2P2"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14A7B282EA
	for <linux-usb@vger.kernel.org>; Mon, 10 Jun 2024 10:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718013992; cv=none; b=byEfaeXnFkXF0u3VAOemrnw1QT//7II7YWIWiKEqjxHnqUeng+a+77VtC9B/ZspbhC5pPCyrqROVakEVCuayY7L62iY3+8dVMATFare4/ujmo3ugAm+doMR0qPj8nn0Aj5plOcw8SSq7w4LQjCN4+fWrvsBuRVptuQltfpxuBro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718013992; c=relaxed/simple;
	bh=FZRp2aRGt4kYoke4wqHiT81QKoPwQ3i8HYs8UJypBd8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dCmSMcsEUq5GNbrbj+4JJIYGXlV+KdnvqrC5YCSmtsamNnhqce8Gz6ualgweYlD9f8T02Z6BQZjNRqfCaUHuUvGezF0TxFb9ezbAQ6/XCmHuwCR3MmmUY1liFQBq95ys8jauxCs1p8xq3zB7HGSRxqYW8ejwu3STuQ6RclVIjl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kiFin2P2; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718013991; x=1749549991;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FZRp2aRGt4kYoke4wqHiT81QKoPwQ3i8HYs8UJypBd8=;
  b=kiFin2P2zRiPr8eWYBS2v6T4nAIxZ772nyJvSL8CG60asHi5bG5hONv2
   kZUw9+zoVX/mGTMgrf9qe1CRenzStO6mGYyh4UbyIKLTE0c4Fh7s5z7q/
   Ing1j50jQcyaleR7+y+qQ9wK4U95vo7B/Na9JsP5NhpY35mmWcraFFtRv
   w2ovCtXwLfWyvr4MokKxaRst6iooxjzZC5ihPpu85mU0dVKbXCccCpk9h
   HRZAJ2cRgbAOnLKf6O7wbdt80OWZl1s74uJfngEikhCJkaYVfXlEiFCSv
   kx81qR6+arPPHlGRQZZ43MOFNS20WZ8Amebvg673emNKnBrjWB4wpBIQD
   w==;
X-CSE-ConnectionGUID: cg+s5C/PTOqtfrO3rqmlLw==
X-CSE-MsgGUID: thg1a4d/TpWRVwceffmdxg==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="32200984"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="32200984"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 03:06:30 -0700
X-CSE-ConnectionGUID: rfah7m80TQaku7+uIAOs/Q==
X-CSE-MsgGUID: VAP94LIkTmG78Sz4SGS50A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="43590835"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa004.fm.intel.com with ESMTP; 10 Jun 2024 03:06:28 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id E5859445; Mon, 10 Jun 2024 13:06:27 +0300 (EEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>
Cc: linux-usb@vger.kernel.org,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 2/6] thunderbolt: Make usb4_port_sb_read/write() available outside of usb4.c
Date: Mon, 10 Jun 2024 13:06:23 +0300
Message-ID: <20240610100627.3521887-3-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240610100627.3521887-1-mika.westerberg@linux.intel.com>
References: <20240610100627.3521887-1-mika.westerberg@linux.intel.com>
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



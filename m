Return-Path: <linux-usb+bounces-11331-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EBC7908B67
	for <lists+linux-usb@lfdr.de>; Fri, 14 Jun 2024 14:15:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 334301C217DF
	for <lists+linux-usb@lfdr.de>; Fri, 14 Jun 2024 12:15:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D70B0195FFC;
	Fri, 14 Jun 2024 12:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d00V9Jli"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF70192B8D
	for <linux-usb@vger.kernel.org>; Fri, 14 Jun 2024 12:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718367321; cv=none; b=UMUaHiIFB6dPoAzwfktNRhIntFmMnLMyxGlJ3MNVUWKwOIUC46IO5NiixQL6uvmQmU7zfJaXBUH2DVrLWKh55j9nEA9UsOzJ8C3m1OlkAmhZZPJUK/OJX08lGVf6RwKYgphaT0qEgMjkDd+1rnVBOZ7p/qxfm7IPeY4Qd3KZZNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718367321; c=relaxed/simple;
	bh=0qzMqwjMf/phMm8XHRioUKrHjMMP0UUbwl/nJooCsrc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BYuf1lGYc7mupA/e1hIeLGzNGPNJkDkQIDXM15kCiWP1l2hOBj1UATUGt60OiCFVM7uN8/n9mWhPYNEztdcIjzHVHh6tCEu2UOYwEE2gDtDGdnDLI4C2ruyPvl4Z1thoBoonnheKzWaB+IXfluz9aaQD1oVkLq3Fl2Uqvhy7Qk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d00V9Jli; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718367319; x=1749903319;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0qzMqwjMf/phMm8XHRioUKrHjMMP0UUbwl/nJooCsrc=;
  b=d00V9JlimfFKQxI+8jht2YgYtf5iXRz6C3biaVXI84/cIJZTp+VU4Ras
   b6omK+ZpMpCpHnnmfpFwgD6RqBPJ0Usm4mxrjvNeY4wowhm0BZ7Qdij3Q
   LGP2jy0LtD4SI1T9+Yj1qfODLncjPAN8qK0RnMRqqjxg2nn10RoKOu5Wa
   TfNEAX5foba1QAbyitrc+LyOrbyz0jbClqL0FMPFU2ZuU0BBqKZrkqRSx
   Y8zZ0pctaSB/qrs/8iIZpArLr0JIzpXmV+V5I9QUplzDexz3UzVBsWORP
   rUuJRXM2/k55bBMtuTkkeHUU1+u0Bb80xGAChMoo8XRZTrwCM6HVUbFJH
   w==;
X-CSE-ConnectionGUID: n92TyMt8SzyyUwC9kdA22A==
X-CSE-MsgGUID: 2lVz3muKTn6g8f9giSODDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="15410012"
X-IronPort-AV: E=Sophos;i="6.08,237,1712646000"; 
   d="scan'208";a="15410012"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2024 05:15:18 -0700
X-CSE-ConnectionGUID: MNCXekL6TQaEXRyIbS3cJQ==
X-CSE-MsgGUID: KTyFGZCPSSe4bNxsTwqp8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,237,1712646000"; 
   d="scan'208";a="45437735"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa005.jf.intel.com with ESMTP; 14 Jun 2024 05:15:16 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 7FC18360; Fri, 14 Jun 2024 15:15:12 +0300 (EEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>
Cc: linux-usb@vger.kernel.org,
	Greg KH <gregkh@linuxfoundation.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v2 5/6] thunderbolt: Make margining functions accept target and retimer index
Date: Fri, 14 Jun 2024 15:15:11 +0300
Message-ID: <20240614121512.1361184-6-mika.westerberg@linux.intel.com>
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

In order to add lane margining support for retimers make the margining
functions take sideband target and retimer index as parameters. This
makes it possible to access both router and retimer sideband using the
same functions.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/debugfs.c | 16 ++++++-----
 drivers/thunderbolt/tb.h      | 15 ++++++-----
 drivers/thunderbolt/usb4.c    | 51 +++++++++++++++++++++--------------
 3 files changed, 50 insertions(+), 32 deletions(-)

diff --git a/drivers/thunderbolt/debugfs.c b/drivers/thunderbolt/debugfs.c
index 0e871c7ae9c0..87b2c91a4656 100644
--- a/drivers/thunderbolt/debugfs.c
+++ b/drivers/thunderbolt/debugfs.c
@@ -774,22 +774,25 @@ static int margining_run_write(void *data, u64 val)
 	if (margining->software) {
 		tb_port_dbg(port, "running software %s lane margining for lanes %u\n",
 			    margining->time ? "time" : "voltage", margining->lanes);
-		ret = usb4_port_sw_margin(port, margining->lanes, margining->time,
+		ret = usb4_port_sw_margin(port, USB4_SB_TARGET_ROUTER, 0,
+					  margining->lanes, margining->time,
 					  margining->right_high,
 					  USB4_MARGIN_SW_COUNTER_CLEAR);
 		if (ret)
 			goto out_clx;
 
-		ret = usb4_port_sw_margin_errors(port, &margining->results[0]);
+		ret = usb4_port_sw_margin_errors(port, USB4_SB_TARGET_ROUTER, 0,
+						 &margining->results[0]);
 	} else {
 		tb_port_dbg(port, "running hardware %s lane margining for lanes %u\n",
 			    margining->time ? "time" : "voltage", margining->lanes);
 		/* Clear the results */
 		margining->results[0] = 0;
 		margining->results[1] = 0;
-		ret = usb4_port_hw_margin(port, margining->lanes,
-					  margining->ber_level, margining->time,
-					  margining->right_high, margining->results);
+		ret = usb4_port_hw_margin(port, USB4_SB_TARGET_ROUTER, 0,
+					  margining->lanes, margining->ber_level,
+					  margining->time, margining->right_high,
+					  margining->results);
 	}
 
 out_clx:
@@ -1063,7 +1066,8 @@ static void margining_port_init(struct tb_port *port)
 
 	margining->port = port;
 
-	ret = usb4_port_margining_caps(port, margining->caps);
+	ret = usb4_port_margining_caps(port, USB4_SB_TARGET_ROUTER, 0,
+				       margining->caps);
 	if (ret) {
 		kfree(margining);
 		return;
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index 1a53d18223d9..2f3de3d3c2e0 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -1349,13 +1349,16 @@ int usb4_port_sb_read(struct tb_port *port, enum usb4_sb_target target, u8 index
 int usb4_port_sb_write(struct tb_port *port, enum usb4_sb_target target,
 		       u8 index, u8 reg, const void *buf, u8 size);
 
-int usb4_port_margining_caps(struct tb_port *port, u32 *caps);
-int usb4_port_hw_margin(struct tb_port *port, unsigned int lanes,
-			unsigned int ber_level, bool timing, bool right_high,
-			u32 *results);
-int usb4_port_sw_margin(struct tb_port *port, unsigned int lanes, bool timing,
+int usb4_port_margining_caps(struct tb_port *port, enum usb4_sb_target target,
+			     u8 index, u32 *caps);
+int usb4_port_hw_margin(struct tb_port *port, enum usb4_sb_target target,
+			u8 index, unsigned int lanes, unsigned int ber_level,
+			bool timing, bool right_high, u32 *results);
+int usb4_port_sw_margin(struct tb_port *port, enum usb4_sb_target target,
+			u8 index, unsigned int lanes, bool timing,
 			bool right_high, u32 counter);
-int usb4_port_sw_margin_errors(struct tb_port *port, u32 *errors);
+int usb4_port_sw_margin_errors(struct tb_port *port, enum usb4_sb_target target,
+			       u8 index, u32 *errors);
 
 int usb4_port_retimer_set_inbound_sbtx(struct tb_port *port, u8 index);
 int usb4_port_retimer_unset_inbound_sbtx(struct tb_port *port, u8 index);
diff --git a/drivers/thunderbolt/usb4.c b/drivers/thunderbolt/usb4.c
index 140e0da3a8de..d952de07493f 100644
--- a/drivers/thunderbolt/usb4.c
+++ b/drivers/thunderbolt/usb4.c
@@ -1628,26 +1628,31 @@ int usb4_port_asym_start(struct tb_port *port)
 /**
  * usb4_port_margining_caps() - Read USB4 port marginig capabilities
  * @port: USB4 port
+ * @target: Sideband target
+ * @index: Retimer index if taget is %USB4_SB_TARGET_RETIMER
  * @caps: Array with at least two elements to hold the results
  *
  * Reads the USB4 port lane margining capabilities into @caps.
  */
-int usb4_port_margining_caps(struct tb_port *port, u32 *caps)
+int usb4_port_margining_caps(struct tb_port *port, enum usb4_sb_target target,
+			     u8 index, u32 *caps)
 {
 	int ret;
 
-	ret = usb4_port_sb_op(port, USB4_SB_TARGET_ROUTER, 0,
+	ret = usb4_port_sb_op(port, target, index,
 			      USB4_SB_OPCODE_READ_LANE_MARGINING_CAP, 500);
 	if (ret)
 		return ret;
 
-	return usb4_port_sb_read(port, USB4_SB_TARGET_ROUTER, 0,
-				 USB4_SB_DATA, caps, sizeof(*caps) * 2);
+	return usb4_port_sb_read(port, target, index, USB4_SB_DATA, caps,
+				 sizeof(*caps) * 2);
 }
 
 /**
  * usb4_port_hw_margin() - Run hardware lane margining on port
  * @port: USB4 port
+ * @target: Sideband target
+ * @index: Retimer index if taget is %USB4_SB_TARGET_RETIMER
  * @lanes: Which lanes to run (must match the port capabilities). Can be
  *	   %0, %1 or %7.
  * @ber_level: BER level contour value
@@ -1658,9 +1663,9 @@ int usb4_port_margining_caps(struct tb_port *port, u32 *caps)
  * Runs hardware lane margining on USB4 port and returns the result in
  * @results.
  */
-int usb4_port_hw_margin(struct tb_port *port, unsigned int lanes,
-			unsigned int ber_level, bool timing, bool right_high,
-			u32 *results)
+int usb4_port_hw_margin(struct tb_port *port, enum usb4_sb_target target,
+			u8 index, unsigned int lanes, unsigned int ber_level,
+			bool timing, bool right_high, u32 *results)
 {
 	u32 val;
 	int ret;
@@ -1674,23 +1679,25 @@ int usb4_port_hw_margin(struct tb_port *port, unsigned int lanes,
 		val |= (ber_level << USB4_MARGIN_HW_BER_SHIFT) &
 			USB4_MARGIN_HW_BER_MASK;
 
-	ret = usb4_port_sb_write(port, USB4_SB_TARGET_ROUTER, 0,
-				 USB4_SB_METADATA, &val, sizeof(val));
+	ret = usb4_port_sb_write(port, target, index, USB4_SB_METADATA, &val,
+				 sizeof(val));
 	if (ret)
 		return ret;
 
-	ret = usb4_port_sb_op(port, USB4_SB_TARGET_ROUTER, 0,
+	ret = usb4_port_sb_op(port, target, index,
 			      USB4_SB_OPCODE_RUN_HW_LANE_MARGINING, 2500);
 	if (ret)
 		return ret;
 
-	return usb4_port_sb_read(port, USB4_SB_TARGET_ROUTER, 0,
-				 USB4_SB_DATA, results, sizeof(*results) * 2);
+	return usb4_port_sb_read(port, target, index, USB4_SB_DATA, results,
+				 sizeof(*results) * 2);
 }
 
 /**
  * usb4_port_sw_margin() - Run software lane margining on port
  * @port: USB4 port
+ * @target: Sideband target
+ * @index: Retimer index if taget is %USB4_SB_TARGET_RETIMER
  * @lanes: Which lanes to run (must match the port capabilities). Can be
  *	   %0, %1 or %7.
  * @timing: Perform timing margining instead of voltage
@@ -1701,7 +1708,8 @@ int usb4_port_hw_margin(struct tb_port *port, unsigned int lanes,
  * counters by calling usb4_port_sw_margin_errors(). Returns %0 in
  * success and negative errno otherwise.
  */
-int usb4_port_sw_margin(struct tb_port *port, unsigned int lanes, bool timing,
+int usb4_port_sw_margin(struct tb_port *port, enum usb4_sb_target target,
+			u8 index, unsigned int lanes, bool timing,
 			bool right_high, u32 counter)
 {
 	u32 val;
@@ -1715,34 +1723,37 @@ int usb4_port_sw_margin(struct tb_port *port, unsigned int lanes, bool timing,
 	val |= (counter << USB4_MARGIN_SW_COUNTER_SHIFT) &
 		USB4_MARGIN_SW_COUNTER_MASK;
 
-	ret = usb4_port_sb_write(port, USB4_SB_TARGET_ROUTER, 0,
-				 USB4_SB_METADATA, &val, sizeof(val));
+	ret = usb4_port_sb_write(port, target, index, USB4_SB_METADATA, &val,
+				 sizeof(val));
 	if (ret)
 		return ret;
 
-	return usb4_port_sb_op(port, USB4_SB_TARGET_ROUTER, 0,
+	return usb4_port_sb_op(port, target, index,
 			       USB4_SB_OPCODE_RUN_SW_LANE_MARGINING, 2500);
 }
 
 /**
  * usb4_port_sw_margin_errors() - Read the software margining error counters
  * @port: USB4 port
+ * @target: Sideband target
+ * @index: Retimer index if taget is %USB4_SB_TARGET_RETIMER
  * @errors: Error metadata is copied here.
  *
  * This reads back the software margining error counters from the port.
  * Returns %0 in success and negative errno otherwise.
  */
-int usb4_port_sw_margin_errors(struct tb_port *port, u32 *errors)
+int usb4_port_sw_margin_errors(struct tb_port *port, enum usb4_sb_target target,
+			       u8 index, u32 *errors)
 {
 	int ret;
 
-	ret = usb4_port_sb_op(port, USB4_SB_TARGET_ROUTER, 0,
+	ret = usb4_port_sb_op(port, target, index,
 			      USB4_SB_OPCODE_READ_SW_MARGIN_ERR, 150);
 	if (ret)
 		return ret;
 
-	return usb4_port_sb_read(port, USB4_SB_TARGET_ROUTER, 0,
-				 USB4_SB_METADATA, errors, sizeof(*errors));
+	return usb4_port_sb_read(port, target, index, USB4_SB_METADATA, errors,
+				 sizeof(*errors));
 }
 
 static inline int usb4_port_retimer_op(struct tb_port *port, u8 index,
-- 
2.43.0



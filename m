Return-Path: <linux-usb+bounces-13370-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C118D95032E
	for <lists+linux-usb@lfdr.de>; Tue, 13 Aug 2024 13:01:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7E3092814D7
	for <lists+linux-usb@lfdr.de>; Tue, 13 Aug 2024 11:01:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54E0A16A955;
	Tue, 13 Aug 2024 11:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ap1UYjT3"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 796D619883C
	for <linux-usb@vger.kernel.org>; Tue, 13 Aug 2024 11:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723546906; cv=none; b=Dh4bkXsfl4f697MJLcOb97KdKsG0Qpr6/I7M4UVBshEMtJQUHiDfGeIzak7fdqaSUCxkwEcF5jmeu39CjXRztoauOU35B9E1pLkIEY0r7yQRPXDfFtrHoknjSb277c9CArV7nJN316eTjcySkJwVm+xqNmK3woZ/KS7nPnUd4D4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723546906; c=relaxed/simple;
	bh=kgLalTb/dWZbWi5S0NdM0Z5qxZySAA65KQNmc8+cfL0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qAERQ8mSKtkrlr4f0Tjf1s7EcIcJm9CHwBAc0ZpLG3zoJC3JYa3onTqt4RPh+JrY4FmfRECA/lwMNEttFSRDCmHJMyBSpGCqWc0C++voR/4F/KGbjGyYu1t1xEwLgS+QyGa81PfiwkU90c7DGe9UOwfSImS31uEA/ReQicr4ULg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ap1UYjT3; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723546906; x=1755082906;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kgLalTb/dWZbWi5S0NdM0Z5qxZySAA65KQNmc8+cfL0=;
  b=Ap1UYjT3RLpK4xwNF0DN4yftDb3LBDfgGTfROZms7JfIZ1c5r+dKlbXP
   QZrQMULrOgPpND7N40WjoTOpVtldVGPVovZjFvkrNy/uDNy0KPRvIaCWW
   2Cp8qahscs6QPl6GJtORvcvRTld+s3jtYTYeJeEzu+iGmGMyvm6TO/l6w
   2jrzgA9w1/KUHt1idKmL7+Pwu3/qIzkCYyOUbWmjBy/TDPa7/Cvza12XU
   SrwkLU5h7GRja/dAdhlMgWDM8u89YlreGD0IDgaQg0PzvTUqkwjzW/UDb
   lYgF1I74u5wLvfj2skUcDfatXt1FKye3QrZESD7EPAePyJHFfjQYKj4+f
   A==;
X-CSE-ConnectionGUID: P6zWhx1DTrmxDdM+foCk2w==
X-CSE-MsgGUID: y4PPUyOJSKCiWmoMkAlrhQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="25492561"
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; 
   d="scan'208";a="25492561"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2024 04:01:40 -0700
X-CSE-ConnectionGUID: WpO++ms6RXCo25Z12XfN8g==
X-CSE-MsgGUID: ctjn+EAeSkiTzxfoz1lATQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; 
   d="scan'208";a="62791035"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa003.fm.intel.com with ESMTP; 13 Aug 2024 04:01:37 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id BFA502CC; Tue, 13 Aug 2024 14:01:35 +0300 (EEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>
Cc: linux-usb@vger.kernel.org,
	Aapo Vienamo <aapo.vienamo@linux.intel.com>,
	Rene Sapiens <rene.sapiens@intel.com>,
	R Kannappan <r.kannappan@intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 2/4] thunderbolt: Consolidate margining parameters into a structure
Date: Tue, 13 Aug 2024 14:01:33 +0300
Message-ID: <20240813110135.2178900-3-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240813110135.2178900-1-mika.westerberg@linux.intel.com>
References: <20240813110135.2178900-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rene Sapiens <rene.sapiens@intel.com>

Consolidate the hardware and software margining parameters into a single
structure to reduce the number of parameters passed to the margining
functions.

Signed-off-by: Rene Sapiens <rene.sapiens@intel.com>
Co-developed-by: Aapo Vienamo <aapo.vienamo@linux.intel.com>
Signed-off-by: Aapo Vienamo <aapo.vienamo@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/debugfs.c | 32 +++++++++++++++++-------
 drivers/thunderbolt/sb_regs.h |  5 ----
 drivers/thunderbolt/tb.h      | 38 ++++++++++++++++++++++++++---
 drivers/thunderbolt/usb4.c    | 46 ++++++++++++++++-------------------
 4 files changed, 78 insertions(+), 43 deletions(-)

diff --git a/drivers/thunderbolt/debugfs.c b/drivers/thunderbolt/debugfs.c
index a0d07887990e..5d1588baea6a 100644
--- a/drivers/thunderbolt/debugfs.c
+++ b/drivers/thunderbolt/debugfs.c
@@ -780,13 +780,20 @@ static int margining_run_write(void *data, u64 val)
 	}
 
 	if (margining->software) {
+		struct usb4_port_margining_params params = {
+			.error_counter = USB4_MARGIN_SW_ERROR_COUNTER_CLEAR,
+			.lanes = margining->lanes,
+			.time = margining->time,
+			.right_high = margining->right_high,
+		};
+
 		tb_port_dbg(port,
 			    "running software %s lane margining for %s lanes %u\n",
 			    margining->time ? "time" : "voltage", dev_name(dev),
 			    margining->lanes);
-		ret = usb4_port_sw_margin(port, margining->target, margining->index,
-					  margining->lanes, margining->time, margining->right_high,
-					  USB4_MARGIN_SW_COUNTER_CLEAR, &margining->results[0]);
+
+		ret = usb4_port_sw_margin(port, margining->target, margining->index, &params,
+					  &margining->results[0]);
 		if (ret)
 			goto out_clx;
 
@@ -794,16 +801,23 @@ static int margining_run_write(void *data, u64 val)
 						 margining->index,
 						 &margining->results[0]);
 	} else {
+		struct usb4_port_margining_params params = {
+			.ber_level = margining->ber_level,
+			.lanes = margining->lanes,
+			.time = margining->time,
+			.right_high = margining->right_high,
+		};
+
+		/* Clear the results */
+		margining->results[0] = 0;
+		margining->results[1] = 0;
+
 		tb_port_dbg(port,
 			    "running hardware %s lane margining for %s lanes %u\n",
 			    margining->time ? "time" : "voltage", dev_name(dev),
 			    margining->lanes);
-		/* Clear the results */
-		margining->results[0] = 0;
-		margining->results[1] = 0;
-		ret = usb4_port_hw_margin(port, margining->target, margining->index,
-					  margining->lanes, margining->ber_level,
-					  margining->time, margining->right_high,
+
+		ret = usb4_port_hw_margin(port, margining->target, margining->index, &params,
 					  margining->results);
 	}
 
diff --git a/drivers/thunderbolt/sb_regs.h b/drivers/thunderbolt/sb_regs.h
index 2a88edfc97b2..86e80aa297f7 100644
--- a/drivers/thunderbolt/sb_regs.h
+++ b/drivers/thunderbolt/sb_regs.h
@@ -85,10 +85,5 @@ enum usb4_sb_opcode {
 #define USB4_MARGIN_SW_TIME			BIT(3)
 #define USB4_MARGIN_SW_RH			BIT(4)
 #define USB4_MARGIN_SW_COUNTER_MASK		GENMASK(14, 13)
-#define USB4_MARGIN_SW_COUNTER_SHIFT		13
-#define USB4_MARGIN_SW_COUNTER_NOP		0x0
-#define USB4_MARGIN_SW_COUNTER_CLEAR		0x1
-#define USB4_MARGIN_SW_COUNTER_START		0x2
-#define USB4_MARGIN_SW_COUNTER_STOP		0x3
 
 #endif
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index 321db4076573..89ea66f885a4 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -1353,14 +1353,44 @@ int usb4_port_sb_read(struct tb_port *port, enum usb4_sb_target target, u8 index
 int usb4_port_sb_write(struct tb_port *port, enum usb4_sb_target target,
 		       u8 index, u8 reg, const void *buf, u8 size);
 
+/**
+ * enum usb4_margin_sw_error_counter - Software margining error counter operation
+ * @USB4_MARGIN_SW_ERROR_COUNTER_NOP: No change in counter setup
+ * @USB4_MARGIN_SW_ERROR_COUNTER_CLEAR: Set the error counter to 0, enable counter
+ * @USB4_MARGIN_SW_ERROR_COUNTER_START: Start counter, count from last value
+ * @USB4_MARGIN_SW_ERROR_COUNTER_STOP: Stop counter, do not clear value
+ */
+enum usb4_margin_sw_error_counter {
+	USB4_MARGIN_SW_ERROR_COUNTER_NOP,
+	USB4_MARGIN_SW_ERROR_COUNTER_CLEAR,
+	USB4_MARGIN_SW_ERROR_COUNTER_START,
+	USB4_MARGIN_SW_ERROR_COUNTER_STOP,
+};
+
+/**
+ * struct usb4_port_margining_params - USB4 margining parameters
+ * @error_counter: Error counter operation for software margining
+ * @ber_level: Current BER level contour value
+ * @lanes: %0, %1 or %7 (all)
+ * @right_high: %false if left/low margin test is performed, %true if right/high
+ * @time: %true if time margining is used instead of voltage
+ */
+struct usb4_port_margining_params {
+	enum usb4_margin_sw_error_counter error_counter;
+	u32 ber_level;
+	u32 lanes;
+	bool right_high;
+	bool time;
+};
+
 int usb4_port_margining_caps(struct tb_port *port, enum usb4_sb_target target,
 			     u8 index, u32 *caps);
 int usb4_port_hw_margin(struct tb_port *port, enum usb4_sb_target target,
-			u8 index, unsigned int lanes, unsigned int ber_level,
-			bool timing, bool right_high, u32 *results);
+			u8 index, const struct usb4_port_margining_params *params,
+			u32 *results);
 int usb4_port_sw_margin(struct tb_port *port, enum usb4_sb_target target,
-			u8 index, unsigned int lanes, bool timing,
-			bool right_high, u32 counter, u32 *results);
+			u8 index, const struct usb4_port_margining_params *params,
+			u32 *results);
 int usb4_port_sw_margin_errors(struct tb_port *port, enum usb4_sb_target target,
 			       u8 index, u32 *errors);
 
diff --git a/drivers/thunderbolt/usb4.c b/drivers/thunderbolt/usb4.c
index 5505aa95c2ea..cb51cafcf20c 100644
--- a/drivers/thunderbolt/usb4.c
+++ b/drivers/thunderbolt/usb4.c
@@ -1653,31 +1653,29 @@ int usb4_port_margining_caps(struct tb_port *port, enum usb4_sb_target target,
  * @port: USB4 port
  * @target: Sideband target
  * @index: Retimer index if taget is %USB4_SB_TARGET_RETIMER
- * @lanes: Which lanes to run (must match the port capabilities). Can be
- *	   %0, %1 or %7.
- * @ber_level: BER level contour value
- * @timing: Perform timing margining instead of voltage
- * @right_high: Use Right/high margin instead of left/low
+ * @params: Parameters for USB4 hardware margining
  * @results: Array with at least two elements to hold the results
  *
  * Runs hardware lane margining on USB4 port and returns the result in
  * @results.
  */
 int usb4_port_hw_margin(struct tb_port *port, enum usb4_sb_target target,
-			u8 index, unsigned int lanes, unsigned int ber_level,
-			bool timing, bool right_high, u32 *results)
+			u8 index, const struct usb4_port_margining_params *params,
+			u32 *results)
 {
 	u32 val;
 	int ret;
 
-	val = lanes;
-	if (timing)
+	if (WARN_ON_ONCE(!params))
+		return -EINVAL;
+
+	val = params->lanes;
+	if (params->time)
 		val |= USB4_MARGIN_HW_TIME;
-	if (right_high)
+	if (params->right_high)
 		val |= USB4_MARGIN_HW_RH;
-	if (ber_level)
-		val |= (ber_level << USB4_MARGIN_HW_BER_SHIFT) &
-			USB4_MARGIN_HW_BER_MASK;
+	if (params->ber_level)
+		val |= FIELD_PREP(USB4_MARGIN_HW_BER_MASK, params->ber_level);
 
 	ret = usb4_port_sb_write(port, target, index, USB4_SB_METADATA, &val,
 				 sizeof(val));
@@ -1698,11 +1696,7 @@ int usb4_port_hw_margin(struct tb_port *port, enum usb4_sb_target target,
  * @port: USB4 port
  * @target: Sideband target
  * @index: Retimer index if taget is %USB4_SB_TARGET_RETIMER
- * @lanes: Which lanes to run (must match the port capabilities). Can be
- *	   %0, %1 or %7.
- * @timing: Perform timing margining instead of voltage
- * @right_high: Use Right/high margin instead of left/low
- * @counter: What to do with the error counter
+ * @params: Parameters for USB4 software margining
  * @results: Data word for the operation completion data
  *
  * Runs software lane margining on USB4 port. Read back the error
@@ -1710,19 +1704,21 @@ int usb4_port_hw_margin(struct tb_port *port, enum usb4_sb_target target,
  * success and negative errno otherwise.
  */
 int usb4_port_sw_margin(struct tb_port *port, enum usb4_sb_target target,
-			u8 index, unsigned int lanes, bool timing,
-			bool right_high, u32 counter, u32 *results)
+			u8 index, const struct usb4_port_margining_params *params,
+			u32 *results)
 {
 	u32 val;
 	int ret;
 
-	val = lanes;
-	if (timing)
+	if (WARN_ON_ONCE(!params))
+		return -EINVAL;
+
+	val = params->lanes;
+	if (params->time)
 		val |= USB4_MARGIN_SW_TIME;
-	if (right_high)
+	if (params->right_high)
 		val |= USB4_MARGIN_SW_RH;
-	val |= (counter << USB4_MARGIN_SW_COUNTER_SHIFT) &
-		USB4_MARGIN_SW_COUNTER_MASK;
+	val |= FIELD_PREP(USB4_MARGIN_SW_COUNTER_MASK, params->error_counter);
 
 	ret = usb4_port_sb_write(port, target, index, USB4_SB_METADATA, &val,
 				 sizeof(val));
-- 
2.43.0



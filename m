Return-Path: <linux-usb+bounces-16592-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5009AC788
	for <lists+linux-usb@lfdr.de>; Wed, 23 Oct 2024 12:11:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4D625B26DC8
	for <lists+linux-usb@lfdr.de>; Wed, 23 Oct 2024 10:11:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75E241A4F12;
	Wed, 23 Oct 2024 10:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WQbskab9"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 563651A2C29
	for <linux-usb@vger.kernel.org>; Wed, 23 Oct 2024 10:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729678281; cv=none; b=Unj4+NDfho49S0OxQKOnCw8/KUWfuz7ts4z0iPM6a+c+3qEN4afwr6/QfHHyMUz1FAP1oJRVDvfyDubrOR0hwqlsJ3lFhamKye6q4jK7FLWxJECGHDDZMgKWtpy290a3TMbi1QtL+up0W/cJHoqUWt84SQARA+fxQM6Q8UbdXRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729678281; c=relaxed/simple;
	bh=duEL0YiiFk7uKom6bDRLp7avASuvtmCBw1GfWXgIjxI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nIO6Tv57FEjyNOVfNh7+hvrxOJjAyGqEbUGnEFKnSMHFPpzw9nDWP/8swVAdG+Iw0C51ouw+BI8/6TFB97YDiAbs5bScByHunlY5syMUEU+nUiKAmGB9/KUabbVl/nSWgFW8ZmHcUhnmx5OgOlQkMlRhQcqmjcASj5CeP/tjKNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WQbskab9; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729678279; x=1761214279;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=duEL0YiiFk7uKom6bDRLp7avASuvtmCBw1GfWXgIjxI=;
  b=WQbskab9rp+5qpPJutLCTT9LAvMoTCFQLup+s1AV8Z0jsEWY3BPuX6UQ
   76OR6x6FEwXLuA5WyNrqQVg2AyJ2DQWAYam6GiPEOSUFBTW/21ZmxP/59
   /EmLmTHfk3gDfULy3Hvrm/2v99D9lb+74KwQC+nOc2iygGdnYJnbjDDSt
   J0f+J23ZQ+uSTZR+Nx6cOMteKO2BuxrNP7lwSqYAKOddE52xaOdaWmRLj
   STaSR5MVoOqglXU3nA8NiipQWvRVaKFfN5ZaXT5s/1yuWManyYNoC8Grt
   SNx5OGoJEg/94BX9vw61X/E2oqahLYKqLcDb/sr4emO9hunM/YWPppYpt
   g==;
X-CSE-ConnectionGUID: p8aFO5rlSr2s+WrAslJaKQ==
X-CSE-MsgGUID: GGbMQWm+QjCUcXZ+NXc5KA==
X-IronPort-AV: E=McAfee;i="6700,10204,11233"; a="29149614"
X-IronPort-AV: E=Sophos;i="6.11,225,1725346800"; 
   d="scan'208";a="29149614"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2024 03:11:18 -0700
X-CSE-ConnectionGUID: wMwy1pM/Tz+hNYWNocDjyQ==
X-CSE-MsgGUID: 21GU/grnSc6kPS0iKK2V2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,225,1725346800"; 
   d="scan'208";a="84954631"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa005.jf.intel.com with ESMTP; 23 Oct 2024 03:11:16 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 4C3647F9; Wed, 23 Oct 2024 13:11:12 +0300 (EEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Aapo Vienamo <aapo.vienamo@iki.fi>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 5/8] thunderbolt: debugfs: Replace margining lane numbers with an enum
Date: Wed, 23 Oct 2024 13:11:08 +0300
Message-ID: <20241023101111.3418311-6-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241023101111.3418311-1-mika.westerberg@linux.intel.com>
References: <20241023101111.3418311-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Aapo Vienamo <aapo.vienamo@iki.fi>

Replace the raw values and macros with an enum and use it consistently.
No functional changes.

Signed-off-by: Aapo Vienamo <aapo.vienamo@iki.fi>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/debugfs.c | 46 +++++++++++++++++++----------------
 drivers/thunderbolt/sb_regs.h |  3 ---
 drivers/thunderbolt/tb.h      | 10 ++++++--
 3 files changed, 33 insertions(+), 26 deletions(-)

diff --git a/drivers/thunderbolt/debugfs.c b/drivers/thunderbolt/debugfs.c
index 5f9f8babeae2..3404237d167b 100644
--- a/drivers/thunderbolt/debugfs.c
+++ b/drivers/thunderbolt/debugfs.c
@@ -447,7 +447,7 @@ struct tb_margining {
 	unsigned int gen;
 	u32 caps[3];
 	u32 results[2];
-	unsigned int lanes;
+	enum usb4_margining_lane lanes;
 	unsigned int min_ber_level;
 	unsigned int max_ber_level;
 	unsigned int ber_level;
@@ -757,13 +757,13 @@ margining_lanes_write(struct file *file, const char __user *user_buf,
 	}
 
 	if (!strcmp(buf, "0")) {
-		margining->lanes = 0;
+		margining->lanes = USB4_MARGINING_LANE_RX0;
 	} else if (!strcmp(buf, "1")) {
-		margining->lanes = 1;
+		margining->lanes = USB4_MARGINING_LANE_RX1;
 	} else if (!strcmp(buf, "all")) {
 		/* Needs to be supported */
 		if (all_lanes(margining))
-			margining->lanes = 7;
+			margining->lanes = USB4_MARGINING_LANE_ALL;
 		else
 			ret = -EINVAL;
 	} else {
@@ -781,21 +781,21 @@ static int margining_lanes_show(struct seq_file *s, void *not_used)
 {
 	struct tb_margining *margining = s->private;
 	struct tb *tb = margining->port->sw->tb;
-	unsigned int lanes;
+	enum usb4_margining_lane lanes;
 
 	if (mutex_lock_interruptible(&tb->lock))
 		return -ERESTARTSYS;
 
 	lanes = margining->lanes;
 	if (all_lanes(margining)) {
-		if (!lanes)
+		if (lanes == USB4_MARGINING_LANE_RX0)
 			seq_puts(s, "[0] 1 all\n");
-		else if (lanes == 1)
+		else if (lanes == USB4_MARGINING_LANE_RX1)
 			seq_puts(s, "0 [1] all\n");
 		else
 			seq_puts(s, "0 1 [all]\n");
 	} else {
-		if (!lanes)
+		if (lanes == USB4_MARGINING_LANE_RX0)
 			seq_puts(s, "[0] 1\n");
 		else
 			seq_puts(s, "0 [1]\n");
@@ -1089,13 +1089,13 @@ static int margining_run_sw(struct tb_margining *margining,
 		if (ret)
 			break;
 
-		if (margining->lanes == USB4_MARGIN_SW_LANE_0)
+		if (margining->lanes == USB4_MARGINING_LANE_RX0)
 			errors = FIELD_GET(USB4_MARGIN_SW_ERR_COUNTER_LANE_0_MASK,
 					   margining->results[1]);
-		else if (margining->lanes == USB4_MARGIN_SW_LANE_1)
+		else if (margining->lanes == USB4_MARGINING_LANE_RX1)
 			errors = FIELD_GET(USB4_MARGIN_SW_ERR_COUNTER_LANE_1_MASK,
 					   margining->results[1]);
-		else if (margining->lanes == USB4_MARGIN_SW_ALL_LANES)
+		else if (margining->lanes == USB4_MARGINING_LANE_ALL)
 			errors = margining->results[1];
 
 		/* Any errors stop the test */
@@ -1225,7 +1225,7 @@ static ssize_t margining_results_write(struct file *file,
 	if (margining->software) {
 		/* Clear the error counters */
 		margining_modify_error_counter(margining,
-					       USB4_MARGIN_SW_ALL_LANES,
+					       USB4_MARGINING_LANE_ALL,
 					       USB4_MARGIN_SW_ERROR_COUNTER_CLEAR);
 	}
 
@@ -1278,7 +1278,8 @@ static int margining_results_show(struct seq_file *s, void *not_used)
 		seq_printf(s, "0x%08x\n", margining->results[1]);
 
 		if (margining->time) {
-			if (!margining->lanes || margining->lanes == 7) {
+			if (margining->lanes == USB4_MARGINING_LANE_RX0 ||
+			    margining->lanes == USB4_MARGINING_LANE_ALL) {
 				val = margining->results[1];
 				seq_puts(s, "# lane 0 right time margin: ");
 				time_margin_show(s, margining, val);
@@ -1287,7 +1288,8 @@ static int margining_results_show(struct seq_file *s, void *not_used)
 				seq_puts(s, "# lane 0 left time margin: ");
 				time_margin_show(s, margining, val);
 			}
-			if (margining->lanes == 1 || margining->lanes == 7) {
+			if (margining->lanes == USB4_MARGINING_LANE_RX1 ||
+			    margining->lanes == USB4_MARGINING_LANE_ALL) {
 				val = margining->results[1] >>
 					USB4_MARGIN_HW_RES_1_L1_RH_MARGIN_SHIFT;
 				seq_puts(s, "# lane 1 right time margin: ");
@@ -1298,7 +1300,8 @@ static int margining_results_show(struct seq_file *s, void *not_used)
 				time_margin_show(s, margining, val);
 			}
 		} else {
-			if (!margining->lanes || margining->lanes == 7) {
+			if (margining->lanes == USB4_MARGINING_LANE_RX0 ||
+			    margining->lanes == USB4_MARGINING_LANE_ALL) {
 				val = margining->results[1];
 				seq_puts(s, "# lane 0 high voltage margin: ");
 				voltage_margin_show(s, margining, val);
@@ -1307,7 +1310,8 @@ static int margining_results_show(struct seq_file *s, void *not_used)
 				seq_puts(s, "# lane 0 low voltage margin: ");
 				voltage_margin_show(s, margining, val);
 			}
-			if (margining->lanes == 1 || margining->lanes == 7) {
+			if (margining->lanes == USB4_MARGINING_LANE_RX1 ||
+			    margining->lanes == USB4_MARGINING_LANE_ALL) {
 				val = margining->results[1] >>
 					USB4_MARGIN_HW_RES_1_L1_RH_MARGIN_SHIFT;
 				seq_puts(s, "# lane 1 high voltage margin: ");
@@ -1322,16 +1326,16 @@ static int margining_results_show(struct seq_file *s, void *not_used)
 		u32 lane_errors, result;
 
 		seq_printf(s, "0x%08x\n", margining->results[1]);
-		result = FIELD_GET(USB4_MARGIN_SW_LANES_MASK, margining->results[0]);
 
-		if (result == USB4_MARGIN_SW_LANE_0 ||
-		    result == USB4_MARGIN_SW_ALL_LANES) {
+		result = FIELD_GET(USB4_MARGIN_SW_LANES_MASK, margining->results[0]);
+		if (result == USB4_MARGINING_LANE_RX0 ||
+		    result == USB4_MARGINING_LANE_ALL) {
 			lane_errors = FIELD_GET(USB4_MARGIN_SW_ERR_COUNTER_LANE_0_MASK,
 						margining->results[1]);
 			seq_printf(s, "# lane 0 errors: %u\n", lane_errors);
 		}
-		if (result == USB4_MARGIN_SW_LANE_1 ||
-		    result == USB4_MARGIN_SW_ALL_LANES) {
+		if (result == USB4_MARGINING_LANE_RX1 ||
+		    result == USB4_MARGINING_LANE_ALL) {
 			lane_errors = FIELD_GET(USB4_MARGIN_SW_ERR_COUNTER_LANE_1_MASK,
 						margining->results[1]);
 			seq_printf(s, "# lane 1 errors: %u\n", lane_errors);
diff --git a/drivers/thunderbolt/sb_regs.h b/drivers/thunderbolt/sb_regs.h
index a3652b9cb246..91c6333d08c8 100644
--- a/drivers/thunderbolt/sb_regs.h
+++ b/drivers/thunderbolt/sb_regs.h
@@ -98,9 +98,6 @@ enum usb4_sb_opcode {
 
 /* USB4_SB_OPCODE_RUN_SW_LANE_MARGINING */
 #define USB4_MARGIN_SW_LANES_MASK		GENMASK(2, 0)
-#define USB4_MARGIN_SW_LANE_0			0x0
-#define USB4_MARGIN_SW_LANE_1			0x1
-#define USB4_MARGIN_SW_ALL_LANES		0x7
 #define USB4_MARGIN_SW_TIME			BIT(3)
 #define USB4_MARGIN_SW_RH			BIT(4)
 #define USB4_MARGIN_SW_OPT_VOLTAGE		BIT(5)
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index ced9be271620..fb2e1f089169 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -1367,11 +1367,17 @@ enum usb4_margin_sw_error_counter {
 	USB4_MARGIN_SW_ERROR_COUNTER_STOP,
 };
 
+enum usb4_margining_lane {
+	USB4_MARGINING_LANE_RX0 = 0,
+	USB4_MARGINING_LANE_RX1 = 1,
+	USB4_MARGINING_LANE_ALL = 7,
+};
+
 /**
  * struct usb4_port_margining_params - USB4 margining parameters
  * @error_counter: Error counter operation for software margining
  * @ber_level: Current BER level contour value
- * @lanes: %0, %1 or %7 (all)
+ * @lanes: Lanes to enable for the margining operation
  * @voltage_time_offset: Offset for voltage / time for software margining
  * @optional_voltage_offset_range: Enable optional extended voltage range
  * @right_high: %false if left/low margin test is performed, %true if right/high
@@ -1380,7 +1386,7 @@ enum usb4_margin_sw_error_counter {
 struct usb4_port_margining_params {
 	enum usb4_margin_sw_error_counter error_counter;
 	u32 ber_level;
-	u32 lanes;
+	enum usb4_margining_lane lanes;
 	u32 voltage_time_offset;
 	bool optional_voltage_offset_range;
 	bool right_high;
-- 
2.45.2



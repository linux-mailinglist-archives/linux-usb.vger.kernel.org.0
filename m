Return-Path: <linux-usb+bounces-16593-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B5B9AC789
	for <lists+linux-usb@lfdr.de>; Wed, 23 Oct 2024 12:12:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 44D531F23541
	for <lists+linux-usb@lfdr.de>; Wed, 23 Oct 2024 10:12:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAF6C1A7045;
	Wed, 23 Oct 2024 10:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e4ZwnjjS"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B26831A38E3
	for <linux-usb@vger.kernel.org>; Wed, 23 Oct 2024 10:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729678281; cv=none; b=ufZL11UjaGM4VpMFxmjw5a+CWI997QWV/lDly0fTcOOqydvt3oyYxpXp8dumEfYHvmA0JY/sCX243uSwfdTZjiLZLtxwLmRQD/vNcfVRNNLYLFYE6LQpFhj023J/Hs064jBuj2Xb/q0fBf9K+bF7rQ6dVaXpB8iFWgkNv75mVXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729678281; c=relaxed/simple;
	bh=9cZqaJ0msn7y4/dfoIXoe7Dselzmf+2DHyvcYbyJWrM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gpA/T8dr/uTl42mSkK3sQSZAC+t/6Lvy/iQaS/I4WHJ0gFGP5JED4mMkcX1z9u4sJxXiRhAb3yDrvdM46eq5ce738pRw3bfUxZciUmXPvVU4d00G5WQMZ4vSHzZXZNZQ1LGF2MCdvGoISUwBFYC/kKgILGTsSRJBAtNXQRxYhUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e4ZwnjjS; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729678280; x=1761214280;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9cZqaJ0msn7y4/dfoIXoe7Dselzmf+2DHyvcYbyJWrM=;
  b=e4ZwnjjSXD4bqGG0Kc/ZDXSSQoIf3FEt3VEY1c7yDRHgUp9W1DdV36pO
   Q0Pb4oRH+OlwZOpvD0ih28PM9tHi2CtG4rxIwu1j+E4OPpP86C4AvUorW
   4N4UHqp/zyK8VOwp+28xGJT1H+Hw78QONnnXzqNSLHTjWL+5f3mFveDIZ
   nrLTtAwhG1Clv1uycDq1Gyzrk/pAgpRz+TtW67+eV45bb2u4WWALqJh/E
   4DSAAcX4TKbESMSxsijSRaQuXX2MPRggzf5XthdwACxCAMxizBexvl+Pf
   SihbAmrBGOI5Sz8ch+/ttkhFRTB13/OMn6hqt+UqkjDT+gzauxR1XG29b
   g==;
X-CSE-ConnectionGUID: cN47MBfwRgeKc4gJ+WXlVg==
X-CSE-MsgGUID: /UL2xRe2SYmfJQvX/ZAG/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11233"; a="29149618"
X-IronPort-AV: E=Sophos;i="6.11,225,1725346800"; 
   d="scan'208";a="29149618"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2024 03:11:18 -0700
X-CSE-ConnectionGUID: XKEyBxxoRZqskIjP4YL3iw==
X-CSE-MsgGUID: gxeaXhrDSEuGqB/OB++Amg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,225,1725346800"; 
   d="scan'208";a="84954633"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa005.jf.intel.com with ESMTP; 23 Oct 2024 03:11:16 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 551FA7B8; Wed, 23 Oct 2024 13:11:12 +0300 (EEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Aapo Vienamo <aapo.vienamo@iki.fi>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 6/8] thunderbolt: debugfs: Refactor hardware margining result parsing
Date: Wed, 23 Oct 2024 13:11:09 +0300
Message-ID: <20241023101111.3418311-7-mika.westerberg@linux.intel.com>
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

Make the result parsing and formatting code less repetitive in
preparation for adding another result for Gen 4 asymmetric link support.

Signed-off-by: Aapo Vienamo <aapo.vienamo@iki.fi>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/debugfs.c | 99 ++++++++++++++++++-----------------
 drivers/thunderbolt/sb_regs.h | 12 ++---
 2 files changed, 56 insertions(+), 55 deletions(-)

diff --git a/drivers/thunderbolt/debugfs.c b/drivers/thunderbolt/debugfs.c
index 3404237d167b..2f9756c201b6 100644
--- a/drivers/thunderbolt/debugfs.c
+++ b/drivers/thunderbolt/debugfs.c
@@ -1238,10 +1238,10 @@ static void voltage_margin_show(struct seq_file *s,
 {
 	unsigned int tmp, voltage;
 
-	tmp = FIELD_GET(USB4_MARGIN_HW_RES_1_MARGIN_MASK, val);
+	tmp = FIELD_GET(USB4_MARGIN_HW_RES_MARGIN_MASK, val);
 	voltage = tmp * margining->max_voltage_offset / margining->voltage_steps;
 	seq_printf(s, "%u mV (%u)", voltage, tmp);
-	if (val & USB4_MARGIN_HW_RES_1_EXCEEDS)
+	if (val & USB4_MARGIN_HW_RES_EXCEEDS)
 		seq_puts(s, " exceeds maximum");
 	seq_puts(s, "\n");
 	if (margining->optional_voltage_offset_range)
@@ -1253,14 +1253,53 @@ static void time_margin_show(struct seq_file *s,
 {
 	unsigned int tmp, interval;
 
-	tmp = FIELD_GET(USB4_MARGIN_HW_RES_1_MARGIN_MASK, val);
+	tmp = FIELD_GET(USB4_MARGIN_HW_RES_MARGIN_MASK, val);
 	interval = tmp * margining->max_time_offset / margining->time_steps;
 	seq_printf(s, "%u mUI (%u)", interval, tmp);
-	if (val & USB4_MARGIN_HW_RES_1_EXCEEDS)
+	if (val & USB4_MARGIN_HW_RES_EXCEEDS)
 		seq_puts(s, " exceeds maximum");
 	seq_puts(s, "\n");
 }
 
+static u8 margining_hw_result_val(const u32 *results,
+				  enum usb4_margining_lane lane,
+				  bool right_high)
+{
+	u32 val;
+
+	if (lane == USB4_MARGINING_LANE_RX0)
+		val = results[1];
+	else if (lane == USB4_MARGINING_LANE_RX1)
+		val = results[1] >> USB4_MARGIN_HW_RES_LANE_SHIFT;
+	else
+		val = 0;
+
+	return right_high ? val : val >> USB4_MARGIN_HW_RES_LL_SHIFT;
+}
+
+static void margining_hw_result_format(struct seq_file *s,
+				       const struct tb_margining *margining,
+				       enum usb4_margining_lane lane)
+{
+	u8 val;
+
+	if (margining->time) {
+		val = margining_hw_result_val(margining->results, lane, true);
+		seq_printf(s, "# lane %u right time margin: ", lane);
+		time_margin_show(s, margining, val);
+		val = margining_hw_result_val(margining->results, lane, false);
+		seq_printf(s, "# lane %u left time margin: ", lane);
+		time_margin_show(s, margining, val);
+	} else {
+		val = margining_hw_result_val(margining->results, lane, true);
+		seq_printf(s, "# lane %u high voltage margin: ", lane);
+		voltage_margin_show(s, margining, val);
+		val = margining_hw_result_val(margining->results, lane, false);
+		seq_printf(s, "# lane %u low voltage margin: ", lane);
+		voltage_margin_show(s, margining, val);
+	}
+}
+
 static int margining_results_show(struct seq_file *s, void *not_used)
 {
 	struct tb_margining *margining = s->private;
@@ -1273,54 +1312,16 @@ static int margining_results_show(struct seq_file *s, void *not_used)
 	seq_printf(s, "0x%08x\n", margining->results[0]);
 	/* Only the hardware margining has two result dwords */
 	if (!margining->software) {
-		unsigned int val;
-
 		seq_printf(s, "0x%08x\n", margining->results[1]);
 
-		if (margining->time) {
-			if (margining->lanes == USB4_MARGINING_LANE_RX0 ||
-			    margining->lanes == USB4_MARGINING_LANE_ALL) {
-				val = margining->results[1];
-				seq_puts(s, "# lane 0 right time margin: ");
-				time_margin_show(s, margining, val);
-				val = margining->results[1] >>
-					USB4_MARGIN_HW_RES_1_L0_LL_MARGIN_SHIFT;
-				seq_puts(s, "# lane 0 left time margin: ");
-				time_margin_show(s, margining, val);
-			}
-			if (margining->lanes == USB4_MARGINING_LANE_RX1 ||
-			    margining->lanes == USB4_MARGINING_LANE_ALL) {
-				val = margining->results[1] >>
-					USB4_MARGIN_HW_RES_1_L1_RH_MARGIN_SHIFT;
-				seq_puts(s, "# lane 1 right time margin: ");
-				time_margin_show(s, margining, val);
-				val = margining->results[1] >>
-					USB4_MARGIN_HW_RES_1_L1_LL_MARGIN_SHIFT;
-				seq_puts(s, "# lane 1 left time margin: ");
-				time_margin_show(s, margining, val);
-			}
+		if (margining->lanes == USB4_MARGINING_LANE_ALL) {
+			margining_hw_result_format(s, margining,
+						   USB4_MARGINING_LANE_RX0);
+			margining_hw_result_format(s, margining,
+						   USB4_MARGINING_LANE_RX1);
 		} else {
-			if (margining->lanes == USB4_MARGINING_LANE_RX0 ||
-			    margining->lanes == USB4_MARGINING_LANE_ALL) {
-				val = margining->results[1];
-				seq_puts(s, "# lane 0 high voltage margin: ");
-				voltage_margin_show(s, margining, val);
-				val = margining->results[1] >>
-					USB4_MARGIN_HW_RES_1_L0_LL_MARGIN_SHIFT;
-				seq_puts(s, "# lane 0 low voltage margin: ");
-				voltage_margin_show(s, margining, val);
-			}
-			if (margining->lanes == USB4_MARGINING_LANE_RX1 ||
-			    margining->lanes == USB4_MARGINING_LANE_ALL) {
-				val = margining->results[1] >>
-					USB4_MARGIN_HW_RES_1_L1_RH_MARGIN_SHIFT;
-				seq_puts(s, "# lane 1 high voltage margin: ");
-				voltage_margin_show(s, margining, val);
-				val = margining->results[1] >>
-					USB4_MARGIN_HW_RES_1_L1_LL_MARGIN_SHIFT;
-				seq_puts(s, "# lane 1 low voltage margin: ");
-				voltage_margin_show(s, margining, val);
-			}
+			margining_hw_result_format(s, margining,
+						   margining->lanes);
 		}
 	} else {
 		u32 lane_errors, result;
diff --git a/drivers/thunderbolt/sb_regs.h b/drivers/thunderbolt/sb_regs.h
index 91c6333d08c8..7b5521ea0f74 100644
--- a/drivers/thunderbolt/sb_regs.h
+++ b/drivers/thunderbolt/sb_regs.h
@@ -89,12 +89,12 @@ enum usb4_sb_opcode {
 #define USB4_MARGIN_HW_OPT_VOLTAGE		BIT(10)
 
 /* Applicable to all margin values */
-#define USB4_MARGIN_HW_RES_1_MARGIN_MASK	GENMASK(6, 0)
-#define USB4_MARGIN_HW_RES_1_EXCEEDS		BIT(7)
-/* Different lane margin shifts */
-#define USB4_MARGIN_HW_RES_1_L0_LL_MARGIN_SHIFT	8
-#define USB4_MARGIN_HW_RES_1_L1_RH_MARGIN_SHIFT	16
-#define USB4_MARGIN_HW_RES_1_L1_LL_MARGIN_SHIFT	24
+#define USB4_MARGIN_HW_RES_MARGIN_MASK		GENMASK(6, 0)
+#define USB4_MARGIN_HW_RES_EXCEEDS		BIT(7)
+
+/* Shifts for parsing the lane results */
+#define USB4_MARGIN_HW_RES_LANE_SHIFT		16
+#define USB4_MARGIN_HW_RES_LL_SHIFT		8
 
 /* USB4_SB_OPCODE_RUN_SW_LANE_MARGINING */
 #define USB4_MARGIN_SW_LANES_MASK		GENMASK(2, 0)
-- 
2.45.2



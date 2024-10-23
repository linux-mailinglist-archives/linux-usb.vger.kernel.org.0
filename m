Return-Path: <linux-usb+bounces-16590-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD729AC786
	for <lists+linux-usb@lfdr.de>; Wed, 23 Oct 2024 12:11:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 802A4282C85
	for <lists+linux-usb@lfdr.de>; Wed, 23 Oct 2024 10:11:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A110F1A2C32;
	Wed, 23 Oct 2024 10:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e6FiTYa9"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB0519F438
	for <linux-usb@vger.kernel.org>; Wed, 23 Oct 2024 10:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729678279; cv=none; b=AqVt9qh6i9igp5y+z2CoI4/6JhOPN1V9Mn92M1lVOZULpT0dHDfJjrKP2ZCq/1QJROPo6LKDFKcV+L06w+yGkXoSaGW3Q9dLteq6hwIREVyIBWS8tEfDp5liFjyHYTq+ibVtFCOUoPrseuddGVbKm4BeJVf9XWIL/cnNrJk1pjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729678279; c=relaxed/simple;
	bh=tqGAXK2Jg7SLUZO+dTZt1sfym7dfAI1q4koqUg2dC6I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SGeUUKHyAp+TXr/U9bgFp3CiGKtJoBWsqHF9oohIaqsBQ2Q8ezfVIz0SuEE2kj9bRVRkgN0hCitF+2oT+XHK+w+sWvbDGC/U4kgd3U4+c2BH0XJ1XgH32HiXMAFVAzUMflicYdkF9BRCJpzfC77jj60gAwR8QoxLnAV1E4ujXbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e6FiTYa9; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729678278; x=1761214278;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tqGAXK2Jg7SLUZO+dTZt1sfym7dfAI1q4koqUg2dC6I=;
  b=e6FiTYa9TZmZh6/n50i9SQZKQudLlHD+dIFK2ebdLYb2tPuyLhxUd3kN
   jIN+OlTpf1CJqpyX6IVuvJWGDgo6y9bpNrmRBgxH/U/QWalMJenr28T/O
   m3uCN+saQph/6f8YBmCGfFfm+D2cqnycV7LBfIBhy0gxGMbgwb3PgDslV
   NzGewzd+3+qUTTd08PwajbvkyKDK6OV0WCyNeGw1IeImWQsOnHwEEL0pT
   +s2tx4KEF5Muu02ig4DROnfTGQ1feUOkyyRYUvjKmmsFXvhQ3XXW0hIqT
   AmZpA1/5CWISp/JzkbGfB3gVCIkxPlNBkSQWR5XfGBfCNSZadPjxnfSCl
   Q==;
X-CSE-ConnectionGUID: z2VB6IFqR7mKOo87GlfscA==
X-CSE-MsgGUID: GnI2X22hTfSCftvffqpZIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11233"; a="29149605"
X-IronPort-AV: E=Sophos;i="6.11,225,1725346800"; 
   d="scan'208";a="29149605"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2024 03:11:15 -0700
X-CSE-ConnectionGUID: UalW/7uTRx+Shxo4EQKCOA==
X-CSE-MsgGUID: kSztRxHGTa6a4852/mb+Jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,225,1725346800"; 
   d="scan'208";a="84954600"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa005.jf.intel.com with ESMTP; 23 Oct 2024 03:11:14 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 364614FD; Wed, 23 Oct 2024 13:11:12 +0300 (EEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Aapo Vienamo <aapo.vienamo@iki.fi>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 4/8] thunderbolt: debugfs: Replace "both lanes" with "all lanes"
Date: Wed, 23 Oct 2024 13:11:07 +0300
Message-ID: <20241023101111.3418311-5-mika.westerberg@linux.intel.com>
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

With USB4 Gen 4, the link can be configured into an asymmetric mode,
where there are three receivers and only one transmitter. The USB4
specification also uses the "all lanes" nomenclature instead of "both
lanes".

Signed-off-by: Aapo Vienamo <aapo.vienamo@iki.fi>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/debugfs.c | 12 ++++++------
 drivers/thunderbolt/sb_regs.h |  2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/thunderbolt/debugfs.c b/drivers/thunderbolt/debugfs.c
index 699e1632e3f5..5f9f8babeae2 100644
--- a/drivers/thunderbolt/debugfs.c
+++ b/drivers/thunderbolt/debugfs.c
@@ -499,9 +499,9 @@ static bool supports_hardware(const struct tb_margining *margining)
 	return margining->caps[2] & USB4_MARGIN_CAP_2_MODES_HW;
 }
 
-static bool both_lanes(const struct tb_margining *margining)
+static bool all_lanes(const struct tb_margining *margining)
 {
-	return margining->caps[0] & USB4_MARGIN_CAP_0_2_LANES;
+	return margining->caps[0] & USB4_MARGIN_CAP_0_ALL_LANES;
 }
 
 static enum usb4_margin_cap_voltage_indp
@@ -655,8 +655,8 @@ static int margining_caps_show(struct seq_file *s, void *not_used)
 		seq_puts(s, "# hardware margining: no\n");
 	}
 
-	seq_printf(s, "# both lanes simultaneously: %s\n",
-		  both_lanes(margining) ? "yes" : "no");
+	seq_printf(s, "# all lanes simultaneously: %s\n",
+		  str_yes_no(all_lanes(margining)));
 	seq_printf(s, "# voltage margin steps: %u\n",
 		   margining->voltage_steps);
 	seq_printf(s, "# maximum voltage offset: %u mV\n",
@@ -762,7 +762,7 @@ margining_lanes_write(struct file *file, const char __user *user_buf,
 		margining->lanes = 1;
 	} else if (!strcmp(buf, "all")) {
 		/* Needs to be supported */
-		if (both_lanes(margining))
+		if (all_lanes(margining))
 			margining->lanes = 7;
 		else
 			ret = -EINVAL;
@@ -787,7 +787,7 @@ static int margining_lanes_show(struct seq_file *s, void *not_used)
 		return -ERESTARTSYS;
 
 	lanes = margining->lanes;
-	if (both_lanes(margining)) {
+	if (all_lanes(margining)) {
 		if (!lanes)
 			seq_puts(s, "[0] 1 all\n");
 		else if (lanes == 1)
diff --git a/drivers/thunderbolt/sb_regs.h b/drivers/thunderbolt/sb_regs.h
index b7e91b99fefe..a3652b9cb246 100644
--- a/drivers/thunderbolt/sb_regs.h
+++ b/drivers/thunderbolt/sb_regs.h
@@ -49,7 +49,7 @@ enum usb4_sb_opcode {
 /* USB4_SB_OPCODE_READ_LANE_MARGINING_CAP */
 #define USB4_MARGIN_CAP_0_MODES_HW		BIT(0)
 #define USB4_MARGIN_CAP_0_MODES_SW		BIT(1)
-#define USB4_MARGIN_CAP_0_2_LANES		BIT(2)
+#define USB4_MARGIN_CAP_0_ALL_LANES		BIT(2)
 #define USB4_MARGIN_CAP_0_VOLTAGE_INDP_MASK	GENMASK(4, 3)
 #define USB4_MARGIN_CAP_0_VOLTAGE_MIN		0x0
 #define USB4_MARGIN_CAP_0_VOLTAGE_HL		0x1
-- 
2.45.2



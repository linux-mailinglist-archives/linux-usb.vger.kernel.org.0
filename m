Return-Path: <linux-usb+bounces-16591-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 178709AC787
	for <lists+linux-usb@lfdr.de>; Wed, 23 Oct 2024 12:11:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C475B28309D
	for <lists+linux-usb@lfdr.de>; Wed, 23 Oct 2024 10:11:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B87F19F438;
	Wed, 23 Oct 2024 10:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QsVwmmRK"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 251D21A2632
	for <linux-usb@vger.kernel.org>; Wed, 23 Oct 2024 10:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729678280; cv=none; b=YJ5xq9VJlK+v8415cWd4Ro98JA7yX/h7sv+/6emPxAW2R8GhT/tSjXlBnzToXgx5mOvdc46P8VvuHtSrwvnNegQd0X7Fyu46BlqXvwOuDpz4056Qjy5e7o/Iheo5LcdUOVm1Dsyw5MKt4RjehJ/BUsa6tH7OtZp27VNajMXS6hM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729678280; c=relaxed/simple;
	bh=kZ2tXljabZsX0pKzHnlb1jILEXpu8OB8wvuZ2v+TjOc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Kw4FKCreYtwKqTdhHdLtMEfgyyb/QHhL19m8Tu9VHUDcvhKSP0H+C8iJ6Pp30GY6wzWEjnoTyQxC+1YkX/fW8joNX/OHHVVESXv+6yMAlAphON5pxHCfc1jDBqKzBiZrAy4M35oN2VEZ/7/3DZVnWW1SsMiM2psRYdK7rOYX8tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QsVwmmRK; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729678278; x=1761214278;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kZ2tXljabZsX0pKzHnlb1jILEXpu8OB8wvuZ2v+TjOc=;
  b=QsVwmmRKL6HQLAk/CHinTvUeRskzc3YS28bddWNBYCYRAF70gwLbAGSf
   WRGFzsTORLx0fuGmbhAcHtJjIXeBWoZD00qtuT2/dCJ5U2EV4VtobL5zJ
   kk43HFN3lhS7idHWNApS3jpuPwuHThI47auSCSMflCboxBlfcbOQm9/Av
   yMYWFyH75HZOChekr3vqlkOFxxRToFLoThyxhvL0z/48nsOLfsrbNO9En
   bhQML20cjnlrzmUleSAxbiefbi13cXsgiSsrgZH8ijPQjwyzMFYv+At+M
   oHDm7pafAxzIker19uZL1+r6rzR88RZ76RSyzLzLABOhYGP0iwdh/82tJ
   Q==;
X-CSE-ConnectionGUID: 5H4ebyMkTl2/OftrIbBHnA==
X-CSE-MsgGUID: DjiJQPuUTiaMmWHSoXY8/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11233"; a="32116762"
X-IronPort-AV: E=Sophos;i="6.11,225,1725346800"; 
   d="scan'208";a="32116762"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2024 03:11:16 -0700
X-CSE-ConnectionGUID: dHpIBav5SXy97zDun1nhqA==
X-CSE-MsgGUID: LW65pxT8QkGd9DAhqZbEzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,225,1725346800"; 
   d="scan'208";a="80084197"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa010.jf.intel.com with ESMTP; 23 Oct 2024 03:11:13 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 1E3E437D; Wed, 23 Oct 2024 13:11:12 +0300 (EEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Aapo Vienamo <aapo.vienamo@iki.fi>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 2/8] thunderbolt: debugfs: Add USB4 Gen 4 margining capabilities
Date: Wed, 23 Oct 2024 13:11:05 +0300
Message-ID: <20241023101111.3418311-3-mika.westerberg@linux.intel.com>
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

Parse the Gen 4 specific capabilities. Change the return types of
independent_voltage_margins() and independent_time_margins() to enums
that distinguish between the Gen 2/3 and Gen 4 margins since they behave
differently between generations.

Signed-off-by: Aapo Vienamo <aapo.vienamo@iki.fi>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/debugfs.c | 143 ++++++++++++++++++++++++++++------
 drivers/thunderbolt/sb_regs.h |  11 +++
 2 files changed, 131 insertions(+), 23 deletions(-)

diff --git a/drivers/thunderbolt/debugfs.c b/drivers/thunderbolt/debugfs.c
index 972f1948725f..83721ca069a5 100644
--- a/drivers/thunderbolt/debugfs.c
+++ b/drivers/thunderbolt/debugfs.c
@@ -44,6 +44,24 @@
 #define MAX_DWELL_TIME		500 /* ms */
 #define DWELL_SAMPLE_INTERVAL	10
 
+enum usb4_margin_cap_voltage_indp {
+	USB4_MARGIN_CAP_VOLTAGE_INDP_GEN_2_3_MIN,
+	USB4_MARGIN_CAP_VOLTAGE_INDP_GEN_2_3_HL,
+	USB4_MARGIN_CAP_VOLTAGE_INDP_GEN_2_3_BOTH,
+	USB4_MARGIN_CAP_VOLTAGE_INDP_GEN_4_MIN,
+	USB4_MARGIN_CAP_VOLTAGE_INDP_GEN_4_BOTH,
+	USB4_MARGIN_CAP_VOLTAGE_INDP_UNKNOWN,
+};
+
+enum usb4_margin_cap_time_indp {
+	USB4_MARGIN_CAP_TIME_INDP_GEN_2_3_MIN,
+	USB4_MARGIN_CAP_TIME_INDP_GEN_2_3_LR,
+	USB4_MARGIN_CAP_TIME_INDP_GEN_2_3_BOTH,
+	USB4_MARGIN_CAP_TIME_INDP_GEN_4_MIN,
+	USB4_MARGIN_CAP_TIME_INDP_GEN_4_BOTH,
+	USB4_MARGIN_CAP_TIME_INDP_UNKNOWN,
+};
+
 /* Sideband registers and their sizes as defined in the USB4 spec */
 struct sb_reg {
 	unsigned int reg;
@@ -396,6 +414,7 @@ static ssize_t retimer_sb_regs_write(struct file *file,
  * @target: Sideband target
  * @index: Retimer index if taget is %USB4_SB_TARGET_RETIMER
  * @dev: Pointer to the device that is the target (USB4 port or retimer)
+ * @gen: Link generation
  * @caps: Port lane margining capabilities
  * @results: Last lane margining results
  * @lanes: %0, %1 or %7 (all)
@@ -423,7 +442,8 @@ struct tb_margining {
 	enum usb4_sb_target target;
 	u8 index;
 	struct device *dev;
-	u32 caps[2];
+	unsigned int gen;
+	u32 caps[3];
 	u32 results[2];
 	unsigned int lanes;
 	unsigned int min_ber_level;
@@ -464,12 +484,16 @@ static int margining_modify_error_counter(struct tb_margining *margining,
 
 static bool supports_software(const struct tb_margining *margining)
 {
-	return margining->caps[0] & USB4_MARGIN_CAP_0_MODES_SW;
+	if (margining->gen < 4)
+		return margining->caps[0] & USB4_MARGIN_CAP_0_MODES_SW;
+	return margining->caps[2] & USB4_MARGIN_CAP_2_MODES_SW;
 }
 
 static bool supports_hardware(const struct tb_margining *margining)
 {
-	return margining->caps[0] & USB4_MARGIN_CAP_0_MODES_HW;
+	if (margining->gen < 4)
+		return margining->caps[0] & USB4_MARGIN_CAP_0_MODES_HW;
+	return margining->caps[2] & USB4_MARGIN_CAP_2_MODES_HW;
 }
 
 static bool both_lanes(const struct tb_margining *margining)
@@ -477,22 +501,58 @@ static bool both_lanes(const struct tb_margining *margining)
 	return margining->caps[0] & USB4_MARGIN_CAP_0_2_LANES;
 }
 
-static unsigned int
+static enum usb4_margin_cap_voltage_indp
 independent_voltage_margins(const struct tb_margining *margining)
 {
-	return FIELD_GET(USB4_MARGIN_CAP_0_VOLTAGE_INDP_MASK, margining->caps[0]);
+	if (margining->gen < 4) {
+		switch (FIELD_GET(USB4_MARGIN_CAP_0_VOLTAGE_INDP_MASK, margining->caps[0])) {
+		case USB4_MARGIN_CAP_0_VOLTAGE_MIN:
+			return USB4_MARGIN_CAP_VOLTAGE_INDP_GEN_2_3_MIN;
+		case USB4_MARGIN_CAP_0_VOLTAGE_HL:
+			return USB4_MARGIN_CAP_VOLTAGE_INDP_GEN_2_3_HL;
+		case USB4_MARGIN_CAP_1_TIME_BOTH:
+			return USB4_MARGIN_CAP_VOLTAGE_INDP_GEN_2_3_BOTH;
+		}
+	} else {
+		switch (FIELD_GET(USB4_MARGIN_CAP_2_VOLTAGE_INDP_MASK, margining->caps[2])) {
+		case USB4_MARGIN_CAP_2_VOLTAGE_MIN:
+			return USB4_MARGIN_CAP_VOLTAGE_INDP_GEN_4_MIN;
+		case USB4_MARGIN_CAP_2_VOLTAGE_BOTH:
+			return USB4_MARGIN_CAP_VOLTAGE_INDP_GEN_4_BOTH;
+		}
+	}
+	return USB4_MARGIN_CAP_VOLTAGE_INDP_UNKNOWN;
 }
 
 static bool supports_time(const struct tb_margining *margining)
 {
-	return margining->caps[0] & USB4_MARGIN_CAP_0_TIME;
+	if (margining->gen < 4)
+		return margining->caps[0] & USB4_MARGIN_CAP_0_TIME;
+	return margining->caps[2] & USB4_MARGIN_CAP_2_TIME;
 }
 
 /* Only applicable if supports_time() returns true */
-static unsigned int
+static enum usb4_margin_cap_time_indp
 independent_time_margins(const struct tb_margining *margining)
 {
-	return FIELD_GET(USB4_MARGIN_CAP_1_TIME_INDP_MASK, margining->caps[1]);
+	if (margining->gen < 4) {
+		switch (FIELD_GET(USB4_MARGIN_CAP_1_TIME_INDP_MASK, margining->caps[1])) {
+		case USB4_MARGIN_CAP_1_TIME_MIN:
+			return USB4_MARGIN_CAP_TIME_INDP_GEN_2_3_MIN;
+		case USB4_MARGIN_CAP_1_TIME_LR:
+			return USB4_MARGIN_CAP_TIME_INDP_GEN_2_3_LR;
+		case USB4_MARGIN_CAP_1_TIME_BOTH:
+			return USB4_MARGIN_CAP_TIME_INDP_GEN_2_3_BOTH;
+		}
+	} else {
+		switch (FIELD_GET(USB4_MARGIN_CAP_2_TIME_INDP_MASK, margining->caps[2])) {
+		case USB4_MARGIN_CAP_2_TIME_MIN:
+			return USB4_MARGIN_CAP_TIME_INDP_GEN_4_MIN;
+		case USB4_MARGIN_CAP_2_TIME_BOTH:
+			return USB4_MARGIN_CAP_TIME_INDP_GEN_4_BOTH;
+		}
+	}
+	return USB4_MARGIN_CAP_TIME_INDP_UNKNOWN;
 }
 
 static bool
@@ -571,6 +631,7 @@ static int margining_caps_show(struct seq_file *s, void *not_used)
 {
 	struct tb_margining *margining = s->private;
 	struct tb *tb = margining->port->sw->tb;
+	int ret = 0;
 
 	if (mutex_lock_interruptible(&tb->lock))
 		return -ERESTARTSYS;
@@ -607,15 +668,26 @@ static int margining_caps_show(struct seq_file *s, void *not_used)
 	}
 
 	switch (independent_voltage_margins(margining)) {
-	case USB4_MARGIN_CAP_0_VOLTAGE_MIN:
+	case USB4_MARGIN_CAP_VOLTAGE_INDP_GEN_2_3_MIN:
 		seq_puts(s, "# returns minimum between high and low voltage margins\n");
 		break;
-	case USB4_MARGIN_CAP_0_VOLTAGE_HL:
+	case USB4_MARGIN_CAP_VOLTAGE_INDP_GEN_2_3_HL:
 		seq_puts(s, "# returns high or low voltage margin\n");
 		break;
-	case USB4_MARGIN_CAP_0_VOLTAGE_BOTH:
+	case USB4_MARGIN_CAP_VOLTAGE_INDP_GEN_2_3_BOTH:
 		seq_puts(s, "# returns both high and low margins\n");
 		break;
+	case USB4_MARGIN_CAP_VOLTAGE_INDP_GEN_4_MIN:
+		seq_puts(s, "# returns minimum between high and low voltage margins in both lower and upper eye\n");
+		break;
+	case USB4_MARGIN_CAP_VOLTAGE_INDP_GEN_4_BOTH:
+		seq_puts(s, "# returns both high and low margins of both upper and lower eye\n");
+		break;
+	case USB4_MARGIN_CAP_VOLTAGE_INDP_UNKNOWN:
+		tb_port_warn(margining->port,
+			     "failed to parse independent voltage margining capabilities\n");
+		ret = -EIO;
+		goto out;
 	}
 
 	if (supports_time(margining)) {
@@ -624,15 +696,26 @@ static int margining_caps_show(struct seq_file *s, void *not_used)
 			   str_yes_no(margining->caps[1] & USB4_MARGIN_CAP_1_TIME_DESTR));
 
 		switch (independent_time_margins(margining)) {
-		case USB4_MARGIN_CAP_1_TIME_MIN:
+		case USB4_MARGIN_CAP_TIME_INDP_GEN_2_3_MIN:
 			seq_puts(s, "# returns minimum between left and right time margins\n");
 			break;
-		case USB4_MARGIN_CAP_1_TIME_LR:
+		case USB4_MARGIN_CAP_TIME_INDP_GEN_2_3_LR:
 			seq_puts(s, "# returns left or right margin\n");
 			break;
-		case USB4_MARGIN_CAP_1_TIME_BOTH:
+		case USB4_MARGIN_CAP_TIME_INDP_GEN_2_3_BOTH:
 			seq_puts(s, "# returns both left and right margins\n");
 			break;
+		case USB4_MARGIN_CAP_TIME_INDP_GEN_4_MIN:
+			seq_puts(s, "# returns minimum between left and right time margins in both lower and upper eye\n");
+			break;
+		case USB4_MARGIN_CAP_TIME_INDP_GEN_4_BOTH:
+			seq_puts(s, "# returns both left and right margins of both upper and lower eye\n");
+			break;
+		case USB4_MARGIN_CAP_TIME_INDP_UNKNOWN:
+			tb_port_warn(margining->port,
+				     "failed to parse independent time margining capabilities\n");
+			ret = -EIO;
+			goto out;
 		}
 
 		seq_printf(s, "# time margin steps: %u\n",
@@ -643,8 +726,9 @@ static int margining_caps_show(struct seq_file *s, void *not_used)
 		seq_puts(s, "# time margining: no\n");
 	}
 
+out:
 	mutex_unlock(&tb->lock);
-	return 0;
+	return ret;
 }
 DEBUGFS_ATTR_RO(margining_caps);
 
@@ -1390,6 +1474,12 @@ static struct tb_margining *margining_alloc(struct tb_port *port,
 	unsigned int val;
 	int ret;
 
+	ret = tb_port_get_link_generation(port);
+	if (ret < 0) {
+		tb_port_warn(port, "failed to read link generation\n");
+		return NULL;
+	}
+
 	margining = kzalloc(sizeof(*margining), GFP_KERNEL);
 	if (!margining)
 		return NULL;
@@ -1398,6 +1488,7 @@ static struct tb_margining *margining_alloc(struct tb_port *port,
 	margining->target = target;
 	margining->index = index;
 	margining->dev = dev;
+	margining->gen = ret;
 
 	ret = usb4_port_margining_caps(port, target, index, margining->caps,
 				       ARRAY_SIZE(margining->caps));
@@ -1410,10 +1501,17 @@ static struct tb_margining *margining_alloc(struct tb_port *port,
 	if (supports_software(margining))
 		margining->software = true;
 
-	val = FIELD_GET(USB4_MARGIN_CAP_0_VOLTAGE_STEPS_MASK, margining->caps[0]);
-	margining->voltage_steps = val;
-	val = FIELD_GET(USB4_MARGIN_CAP_0_MAX_VOLTAGE_OFFSET_MASK, margining->caps[0]);
-	margining->max_voltage_offset = 74 + val * 2;
+	if (margining->gen < 4) {
+		val = FIELD_GET(USB4_MARGIN_CAP_0_VOLTAGE_STEPS_MASK, margining->caps[0]);
+		margining->voltage_steps = val;
+		val = FIELD_GET(USB4_MARGIN_CAP_0_MAX_VOLTAGE_OFFSET_MASK, margining->caps[0]);
+		margining->max_voltage_offset = 74 + val * 2;
+	} else {
+		val = FIELD_GET(USB4_MARGIN_CAP_2_VOLTAGE_STEPS_MASK, margining->caps[2]);
+		margining->voltage_steps = val;
+		val = FIELD_GET(USB4_MARGIN_CAP_2_MAX_VOLTAGE_OFFSET_MASK, margining->caps[2]);
+		margining->max_voltage_offset = 74 + val * 2;
+	}
 
 	if (supports_optional_voltage_offset_range(margining)) {
 		val = FIELD_GET(USB4_MARGIN_CAP_0_VOLT_STEPS_OPT_MASK,
@@ -1455,11 +1553,10 @@ static struct tb_margining *margining_alloc(struct tb_port *port,
 	debugfs_create_file("results", 0600, dir, margining,
 			    &margining_results_fops);
 	debugfs_create_file("test", 0600, dir, margining, &margining_test_fops);
-	if (independent_voltage_margins(margining) == USB4_MARGIN_CAP_0_VOLTAGE_HL ||
+	if (independent_voltage_margins(margining) == USB4_MARGIN_CAP_VOLTAGE_INDP_GEN_2_3_HL ||
 	    (supports_time(margining) &&
-	     independent_time_margins(margining) == USB4_MARGIN_CAP_1_TIME_LR))
-		debugfs_create_file("margin", 0600, dir, margining,
-				    &margining_margin_fops);
+	     independent_time_margins(margining) == USB4_MARGIN_CAP_TIME_INDP_GEN_2_3_LR))
+		debugfs_create_file("margin", 0600, dir, margining, &margining_margin_fops);
 
 	margining->error_counter = USB4_MARGIN_SW_ERROR_COUNTER_CLEAR;
 	margining->dwell_time = MIN_DWELL_TIME;
diff --git a/drivers/thunderbolt/sb_regs.h b/drivers/thunderbolt/sb_regs.h
index dbcad25ead50..f60b8d90a71a 100644
--- a/drivers/thunderbolt/sb_regs.h
+++ b/drivers/thunderbolt/sb_regs.h
@@ -69,6 +69,17 @@ enum usb4_sb_opcode {
 #define USB4_MARGIN_CAP_1_TIME_OFFSET_MASK	GENMASK(20, 16)
 #define USB4_MARGIN_CAP_1_MIN_BER_MASK		GENMASK(25, 21)
 #define USB4_MARGIN_CAP_1_MAX_BER_MASK		GENMASK(30, 26)
+#define USB4_MARGIN_CAP_2_MODES_HW		BIT(0)
+#define USB4_MARGIN_CAP_2_MODES_SW		BIT(1)
+#define USB4_MARGIN_CAP_2_TIME			BIT(2)
+#define USB4_MARGIN_CAP_2_MAX_VOLTAGE_OFFSET_MASK GENMASK(8, 3)
+#define USB4_MARGIN_CAP_2_VOLTAGE_STEPS_MASK	GENMASK(15, 9)
+#define USB4_MARGIN_CAP_2_VOLTAGE_INDP_MASK	GENMASK(17, 16)
+#define USB4_MARGIN_CAP_2_VOLTAGE_MIN		0x0
+#define USB4_MARGIN_CAP_2_VOLTAGE_BOTH		0x1
+#define USB4_MARGIN_CAP_2_TIME_INDP_MASK	GENMASK(19, 18)
+#define USB4_MARGIN_CAP_2_TIME_MIN		0x0
+#define USB4_MARGIN_CAP_2_TIME_BOTH		0x1
 
 /* USB4_SB_OPCODE_RUN_HW_LANE_MARGINING */
 #define USB4_MARGIN_HW_TIME			BIT(3)
-- 
2.45.2



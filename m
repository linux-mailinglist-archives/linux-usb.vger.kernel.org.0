Return-Path: <linux-usb+bounces-16595-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 66BEE9AC78C
	for <lists+linux-usb@lfdr.de>; Wed, 23 Oct 2024 12:12:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CCDDFB270F1
	for <lists+linux-usb@lfdr.de>; Wed, 23 Oct 2024 10:12:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE4981A724C;
	Wed, 23 Oct 2024 10:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BH7phyup"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B60A41A4B69
	for <linux-usb@vger.kernel.org>; Wed, 23 Oct 2024 10:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729678282; cv=none; b=UcNSOA1eeXjfrLKWkGdEOvHoefpF3xtPvv05bPPYHbLOsl6P7pJEglqQm06WTf3An5F3oCtL4tiO+S3AZHrROJAF2Jy+yI2REtqNO5+lKBs7osWT9sOUk/+4wVAQCXBO2cpgJ7jxwIUeO7/ezzB3sRiQPxrlctCYcFqYHKk4IxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729678282; c=relaxed/simple;
	bh=UZ82yjZjYDEM134h5ZOiNP2XIO0bvOtFKoI79OGZP40=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sSMgCcMKHrLUgvX2zRLXM9zdnHsNenlHU8SEV9V4or7MSHhXukVkDJFdcTK1CnVA+lTvG8+aZC2Q+WkbfTE/RD8tOhlfn6253/YUSnzNc5EJsyCiZc4r+TYrT+GhZmhDWBWBNjmFZTHULC8ic/d8/4cddd7CFsEDSxINCBaxymY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BH7phyup; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729678281; x=1761214281;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UZ82yjZjYDEM134h5ZOiNP2XIO0bvOtFKoI79OGZP40=;
  b=BH7phyup0+T/+Kji2EdBeju1FBpGK4mwEW+J4LwDehV+f5Qqlg1MRvTi
   Jcc3ofzaMD7VjLoQ6KjwoIphWF6KamroYEvuByJf4LQUwbW2R4cGripsh
   uYU+taOu9DNmMjSIxtNMJgSbdUbNJ0d7uTDJ0+Ms51ovExZO8zm40d+GC
   2B3Rd4gUpbNItrkpjbyF0iwdTqQ84clZyvIL29HiDbXT2T291AWYd4Lr2
   LX0Gb9sYtoajaJDmj0+7ClLYUO0XTas+hXSDj7TumnZrTs+OMKLMWn6X1
   6kqzPR35jdHJU5sZ7tnVsjduY3FuZWLa/+uQ0D1AEg0xgDDbRAdHmRScE
   A==;
X-CSE-ConnectionGUID: g307wtu9SH+cwBnGWqV12g==
X-CSE-MsgGUID: qPZq8jxHQwyVgbYjKofmNA==
X-IronPort-AV: E=McAfee;i="6700,10204,11233"; a="32116777"
X-IronPort-AV: E=Sophos;i="6.11,225,1725346800"; 
   d="scan'208";a="32116777"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2024 03:11:19 -0700
X-CSE-ConnectionGUID: 1pXYm8L1SeacmK9NZGExgQ==
X-CSE-MsgGUID: OAuOMTgUT8mIHvK2uROeKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,225,1725346800"; 
   d="scan'208";a="80084204"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa010.jf.intel.com with ESMTP; 23 Oct 2024 03:11:16 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 67F0C807; Wed, 23 Oct 2024 13:11:12 +0300 (EEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Aapo Vienamo <aapo.vienamo@iki.fi>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 8/8] thunderbolt: debugfs: Implement asymmetric lane margining
Date: Wed, 23 Oct 2024 13:11:11 +0300
Message-ID: <20241023101111.3418311-9-mika.westerberg@linux.intel.com>
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

Add support for the RX2 receiver which is used as the third receiver in
asymmetric links. This requires expanding the results array for the
additional third data word of the hardware margining results.

Signed-off-by: Aapo Vienamo <aapo.vienamo@iki.fi>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/debugfs.c | 157 +++++++++++++++++++++++++---------
 drivers/thunderbolt/sb_regs.h |   1 +
 drivers/thunderbolt/tb.h      |   1 +
 3 files changed, 117 insertions(+), 42 deletions(-)

diff --git a/drivers/thunderbolt/debugfs.c b/drivers/thunderbolt/debugfs.c
index 9899d88b7371..a1d0d8a33f20 100644
--- a/drivers/thunderbolt/debugfs.c
+++ b/drivers/thunderbolt/debugfs.c
@@ -415,6 +415,7 @@ static ssize_t retimer_sb_regs_write(struct file *file,
  * @index: Retimer index if taget is %USB4_SB_TARGET_RETIMER
  * @dev: Pointer to the device that is the target (USB4 port or retimer)
  * @gen: Link generation
+ * @asym_rx: %true% if @port supports asymmetric link with 3 Rx
  * @caps: Port lane margining capabilities
  * @results: Last lane margining results
  * @lanes: %0, %1 or %7 (all)
@@ -445,8 +446,9 @@ struct tb_margining {
 	u8 index;
 	struct device *dev;
 	unsigned int gen;
+	bool asym_rx;
 	u32 caps[3];
-	u32 results[2];
+	u32 results[3];
 	enum usb4_margining_lane lanes;
 	unsigned int min_ber_level;
 	unsigned int max_ber_level;
@@ -735,14 +737,37 @@ static int margining_caps_show(struct seq_file *s, void *not_used)
 }
 DEBUGFS_ATTR_RO(margining_caps);
 
+static const struct {
+	enum usb4_margining_lane lane;
+	const char *name;
+} lane_names[] = {
+	{
+		.lane = USB4_MARGINING_LANE_RX0,
+		.name = "0",
+	},
+	{
+		.lane = USB4_MARGINING_LANE_RX1,
+		.name = "1",
+	},
+	{
+		.lane = USB4_MARGINING_LANE_RX2,
+		.name = "2",
+	},
+	{
+		.lane = USB4_MARGINING_LANE_ALL,
+		.name = "all",
+	},
+};
+
 static ssize_t
 margining_lanes_write(struct file *file, const char __user *user_buf,
 		      size_t count, loff_t *ppos)
 {
 	struct seq_file *s = file->private_data;
 	struct tb_margining *margining = s->private;
-	struct tb *tb = margining->port->sw->tb;
-	int ret = 0;
+	struct tb_port *port = margining->port;
+	struct tb *tb = port->sw->tb;
+	int lane = -1;
 	char *buf;
 
 	buf = validate_and_copy_from_user(user_buf, &count);
@@ -751,57 +776,60 @@ margining_lanes_write(struct file *file, const char __user *user_buf,
 
 	buf[count - 1] = '\0';
 
-	if (mutex_lock_interruptible(&tb->lock)) {
-		ret = -ERESTARTSYS;
-		goto out_free;
+	for (int i = 0; i < ARRAY_SIZE(lane_names); i++) {
+		if (!strcmp(buf, lane_names[i].name)) {
+			lane = lane_names[i].lane;
+			break;
+		}
 	}
 
-	if (!strcmp(buf, "0")) {
-		margining->lanes = USB4_MARGINING_LANE_RX0;
-	} else if (!strcmp(buf, "1")) {
-		margining->lanes = USB4_MARGINING_LANE_RX1;
-	} else if (!strcmp(buf, "all")) {
-		/* Needs to be supported */
-		if (all_lanes(margining))
-			margining->lanes = USB4_MARGINING_LANE_ALL;
-		else
-			ret = -EINVAL;
-	} else {
-		ret = -EINVAL;
-	}
+	free_page((unsigned long)buf);
 
-	mutex_unlock(&tb->lock);
+	if (lane == -1)
+		return -EINVAL;
 
-out_free:
-	free_page((unsigned long)buf);
-	return ret < 0 ? ret : count;
+	scoped_cond_guard(mutex_intr, return -ERESTARTSYS, &tb->lock) {
+		if (lane == USB4_MARGINING_LANE_ALL && !all_lanes(margining))
+			return -EINVAL;
+		/*
+		 * Enabling on RX2 requires that it is supported by the
+		 * USB4 port.
+		 */
+		if (lane == USB4_MARGINING_LANE_RX2 && !margining->asym_rx)
+			return -EINVAL;
+
+		margining->lanes = lane;
+	}
+
+	return count;
 }
 
 static int margining_lanes_show(struct seq_file *s, void *not_used)
 {
 	struct tb_margining *margining = s->private;
-	struct tb *tb = margining->port->sw->tb;
-	enum usb4_margining_lane lanes;
-
-	if (mutex_lock_interruptible(&tb->lock))
-		return -ERESTARTSYS;
+	struct tb_port *port = margining->port;
+	struct tb *tb = port->sw->tb;
 
-	lanes = margining->lanes;
-	if (all_lanes(margining)) {
-		if (lanes == USB4_MARGINING_LANE_RX0)
-			seq_puts(s, "[0] 1 all\n");
-		else if (lanes == USB4_MARGINING_LANE_RX1)
-			seq_puts(s, "0 [1] all\n");
-		else
-			seq_puts(s, "0 1 [all]\n");
-	} else {
-		if (lanes == USB4_MARGINING_LANE_RX0)
-			seq_puts(s, "[0] 1\n");
-		else
-			seq_puts(s, "0 [1]\n");
+	scoped_cond_guard(mutex_intr, return -ERESTARTSYS, &tb->lock) {
+		for (int i = 0; i < ARRAY_SIZE(lane_names); i++) {
+			if (lane_names[i].lane == USB4_MARGINING_LANE_ALL &&
+			    !all_lanes(margining))
+				continue;
+			if (lane_names[i].lane == USB4_MARGINING_LANE_RX2 &&
+			    !margining->asym_rx)
+				continue;
+
+			if (i != 0)
+				seq_putc(s, ' ');
+
+			if (lane_names[i].lane == margining->lanes)
+				seq_printf(s, "[%s]", lane_names[i].name);
+			else
+				seq_printf(s, "%s", lane_names[i].name);
+		}
+		seq_puts(s, "\n");
 	}
 
-	mutex_unlock(&tb->lock);
 	return 0;
 }
 DEBUGFS_ATTR_RW(margining_lanes);
@@ -1095,6 +1123,9 @@ static int margining_run_sw(struct tb_margining *margining,
 		else if (margining->lanes == USB4_MARGINING_LANE_RX1)
 			errors = FIELD_GET(USB4_MARGIN_SW_ERR_COUNTER_LANE_1_MASK,
 					   margining->results[1]);
+		else if (margining->lanes == USB4_MARGINING_LANE_RX2)
+			errors = FIELD_GET(USB4_MARGIN_SW_ERR_COUNTER_LANE_2_MASK,
+					   margining->results[1]);
 		else if (margining->lanes == USB4_MARGINING_LANE_ALL)
 			errors = margining->results[1];
 
@@ -1115,6 +1146,31 @@ static int margining_run_sw(struct tb_margining *margining,
 	return ret;
 }
 
+static int validate_margining(struct tb_margining *margining)
+{
+	/*
+	 * For running on RX2 the link must be asymmetric with 3
+	 * receivers. Because this is can change dynamically, check it
+	 * here before we start the margining and report back error if
+	 * expectations are not met.
+	 */
+	if (margining->lanes == USB4_MARGINING_LANE_RX2) {
+		int ret;
+
+		ret = tb_port_get_link_width(margining->port);
+		if (ret < 0)
+			return ret;
+		if (ret != TB_LINK_WIDTH_ASYM_RX) {
+			tb_port_warn(margining->port, "link is %s expected %s",
+				     tb_width_name(ret),
+				     tb_width_name(TB_LINK_WIDTH_ASYM_RX));
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
 static int margining_run_write(void *data, u64 val)
 {
 	struct tb_margining *margining = data;
@@ -1135,6 +1191,10 @@ static int margining_run_write(void *data, u64 val)
 		goto out_rpm_put;
 	}
 
+	ret = validate_margining(margining);
+	if (ret)
+		goto out_unlock;
+
 	if (tb_is_upstream_port(port))
 		down_sw = sw;
 	else if (port->remote)
@@ -1270,6 +1330,8 @@ static u8 margining_hw_result_val(const u32 *results,
 		val = results[1];
 	else if (lane == USB4_MARGINING_LANE_RX1)
 		val = results[1] >> USB4_MARGIN_HW_RES_LANE_SHIFT;
+	else if (lane == USB4_MARGINING_LANE_RX2)
+		val = results[2];
 	else
 		val = 0;
 
@@ -1319,6 +1381,9 @@ static int margining_results_show(struct seq_file *s, void *not_used)
 						   USB4_MARGINING_LANE_RX0);
 			margining_hw_result_format(s, margining,
 						   USB4_MARGINING_LANE_RX1);
+			if (margining->asym_rx)
+				margining_hw_result_format(s, margining,
+						USB4_MARGINING_LANE_RX2);
 		} else {
 			margining_hw_result_format(s, margining,
 						   margining->lanes);
@@ -1341,6 +1406,13 @@ static int margining_results_show(struct seq_file *s, void *not_used)
 						margining->results[1]);
 			seq_printf(s, "# lane 1 errors: %u\n", lane_errors);
 		}
+		if (margining->asym_rx &&
+		    (result == USB4_MARGINING_LANE_RX2 ||
+		     result == USB4_MARGINING_LANE_ALL)) {
+			lane_errors = FIELD_GET(USB4_MARGIN_SW_ERR_COUNTER_LANE_2_MASK,
+						margining->results[1]);
+			seq_printf(s, "# lane 2 errors: %u\n", lane_errors);
+		}
 	}
 
 	mutex_unlock(&tb->lock);
@@ -1548,6 +1620,7 @@ static struct tb_margining *margining_alloc(struct tb_port *port,
 	margining->index = index;
 	margining->dev = dev;
 	margining->gen = ret;
+	margining->asym_rx = tb_port_width_supported(port, TB_LINK_WIDTH_ASYM_RX);
 
 	ret = usb4_port_margining_caps(port, target, index, margining->caps,
 				       ARRAY_SIZE(margining->caps));
diff --git a/drivers/thunderbolt/sb_regs.h b/drivers/thunderbolt/sb_regs.h
index 7b5521ea0f74..5391502a4b87 100644
--- a/drivers/thunderbolt/sb_regs.h
+++ b/drivers/thunderbolt/sb_regs.h
@@ -107,5 +107,6 @@ enum usb4_sb_opcode {
 
 #define USB4_MARGIN_SW_ERR_COUNTER_LANE_0_MASK	GENMASK(3, 0)
 #define USB4_MARGIN_SW_ERR_COUNTER_LANE_1_MASK	GENMASK(7, 4)
+#define USB4_MARGIN_SW_ERR_COUNTER_LANE_2_MASK	GENMASK(11, 8)
 
 #endif
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index 0954b8bafada..ddbf0cd78377 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -1370,6 +1370,7 @@ enum usb4_margin_sw_error_counter {
 enum usb4_margining_lane {
 	USB4_MARGINING_LANE_RX0 = 0,
 	USB4_MARGINING_LANE_RX1 = 1,
+	USB4_MARGINING_LANE_RX2 = 2,
 	USB4_MARGINING_LANE_ALL = 7,
 };
 
-- 
2.45.2



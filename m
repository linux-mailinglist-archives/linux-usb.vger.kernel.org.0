Return-Path: <linux-usb+bounces-13624-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F8F956984
	for <lists+linux-usb@lfdr.de>; Mon, 19 Aug 2024 13:41:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3930A2821F4
	for <lists+linux-usb@lfdr.de>; Mon, 19 Aug 2024 11:41:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40F6E166F01;
	Mon, 19 Aug 2024 11:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MAiL8QUg"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA21166F36
	for <linux-usb@vger.kernel.org>; Mon, 19 Aug 2024 11:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724067663; cv=none; b=iL5gn7grXdRX8rvBt40VFgp7vx1bAnk2lo9rdxmouUD6N+6s4G0fzhbadFZmwnH4XKMexUv5LoheQXL4oePTwNimxJQcZLKQd0NGFYlrWF/KYbt5J2RkZefHzOKIbEbBe36BMLmpZyGaiCREhsBx91GA+x0uX1gPDh3WwSekAME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724067663; c=relaxed/simple;
	bh=XI/0mqGiBldhh3acDlJ2+tv/KCxgYfKX6cF69vCRyBw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mzaiAiZRICbc4yYWn2PL8GEx4TrjEejAjrQRQRuUwYBtllPKazWPGC0CcL+rdImunllDWP2J5YM4MJ/PNiWZ26mUR1x5p9NzHrooyOuOqCpBQLc2PcgJX+HdQNQ4VenhF7qsWq3TXUbmlWKGTQb/x52f2f03YlZfnAaJ84dAbuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MAiL8QUg; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724067662; x=1755603662;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XI/0mqGiBldhh3acDlJ2+tv/KCxgYfKX6cF69vCRyBw=;
  b=MAiL8QUgKQn78QC05S/YIygTKXtqUZL78cbQaRgBWU1R4PX+B4dN7rWR
   HwFb0PzvUKwFkCz0NkBfaiwBq2dodgZ+LjpJgfGh30rKhXZoRxIQfNkZE
   z8WFmvW8ScfovLcTZCc0US7KTB8/Kdf4kbOvVfQbwo5KJ7JKAULPGg5z0
   9Z9AXlc+/kHgkud/JXGbb74/JoYeYswkBJ5VYqWZ1m+POUQe9YlDOAPRf
   ux0/Q096Hbm/q3LC1b25aW6kEc3x4LAlIGvUXPMLysxMupfvkUINflAOj
   5x7KgE7kOP/9Fa3YiRbD90XCPY5+c+rbfFEuDx9jMbIORIdo8uBXvNZQ+
   w==;
X-CSE-ConnectionGUID: i0nvXPVhTUCBKOhL96lsYg==
X-CSE-MsgGUID: AJLPSidLSZaCGS5K9NfXXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11168"; a="33688828"
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; 
   d="scan'208";a="33688828"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2024 04:40:59 -0700
X-CSE-ConnectionGUID: JBss5WKzQAqUQr6gcuOHlA==
X-CSE-MsgGUID: 8xO4a1VsSwqsYFpZRksYqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; 
   d="scan'208";a="83566112"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa002.fm.intel.com with ESMTP; 19 Aug 2024 04:40:55 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id AB5A551C; Mon, 19 Aug 2024 14:40:54 +0300 (EEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>
Cc: linux-usb@vger.kernel.org,
	Aapo Vienamo <aapo.vienamo@linux.intel.com>,
	Rene Sapiens <rene.sapiens@intel.com>,
	R Kannappan <r.kannappan@intel.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v2 3/4] thunderbolt: Add optional voltage offset range for receiver lane margining
Date: Mon, 19 Aug 2024 14:40:53 +0300
Message-ID: <20240819114054.4139941-4-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240819114054.4139941-1-mika.westerberg@linux.intel.com>
References: <20240819114054.4139941-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rene Sapiens <rene.sapiens@intel.com>

Add optional extended voltage offset range support for software and
hardware margining as defined by the USB4 specification.

If supported, it can be enabled like below:

 # cd /sys/kernel/debug/thunderbolt/ROUTER/portX/margining/
 # echo Y > optional_voltage_offset

Signed-off-by: Rene Sapiens <rene.sapiens@intel.com>
Co-developed-by: R Kannappan <r.kannappan@intel.com>
Signed-off-by: R Kannappan <r.kannappan@intel.com>
Co-developed-by: Aapo Vienamo <aapo.vienamo@linux.intel.com>
Signed-off-by: Aapo Vienamo <aapo.vienamo@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/debugfs.c | 74 +++++++++++++++++++++++++++++++++++
 drivers/thunderbolt/sb_regs.h |  5 +++
 drivers/thunderbolt/tb.h      |  2 +
 drivers/thunderbolt/usb4.c    |  4 ++
 4 files changed, 85 insertions(+)

diff --git a/drivers/thunderbolt/debugfs.c b/drivers/thunderbolt/debugfs.c
index 5d1588baea6a..9defa69ef3a7 100644
--- a/drivers/thunderbolt/debugfs.c
+++ b/drivers/thunderbolt/debugfs.c
@@ -394,8 +394,12 @@ static ssize_t retimer_sb_regs_write(struct file *file,
  * @ber_level: Current BER level contour value
  * @voltage_steps: Number of mandatory voltage steps
  * @max_voltage_offset: Maximum mandatory voltage offset (in mV)
+ * @voltage_steps_optional_range: Number of voltage steps for optional range
+ * @max_voltage_offset_optional_range: Maximum voltage offset for the optional
+ *					range (in mV).
  * @time_steps: Number of time margin steps
  * @max_time_offset: Maximum time margin offset (in mUI)
+ * @optional_voltage_offset_range: Enable optional extended voltage range
  * @software: %true if software margining is used instead of hardware
  * @time: %true if time margining is used instead of voltage
  * @right_high: %false if left/low margin test is performed, %true if
@@ -414,8 +418,11 @@ struct tb_margining {
 	unsigned int ber_level;
 	unsigned int voltage_steps;
 	unsigned int max_voltage_offset;
+	unsigned int voltage_steps_optional_range;
+	unsigned int max_voltage_offset_optional_range;
 	unsigned int time_steps;
 	unsigned int max_time_offset;
+	bool optional_voltage_offset_range;
 	bool software;
 	bool time;
 	bool right_high;
@@ -454,6 +461,12 @@ independent_time_margins(const struct tb_margining *margining)
 	return FIELD_GET(USB4_MARGIN_CAP_1_TIME_INDP_MASK, margining->caps[1]);
 }
 
+static bool
+supports_optional_voltage_offset_range(const struct tb_margining *margining)
+{
+	return margining->caps[0] & USB4_MARGIN_CAP_0_OPT_VOLTAGE_SUPPORT;
+}
+
 static ssize_t
 margining_ber_level_write(struct file *file, const char __user *user_buf,
 			   size_t count, loff_t *ppos)
@@ -553,6 +566,14 @@ static int margining_caps_show(struct seq_file *s, void *not_used)
 		   margining->voltage_steps);
 	seq_printf(s, "# maximum voltage offset: %u mV\n",
 		   margining->max_voltage_offset);
+	seq_printf(s, "# optional voltage offset range support: %s\n",
+		   str_yes_no(supports_optional_voltage_offset_range(margining)));
+	if (supports_optional_voltage_offset_range(margining)) {
+		seq_printf(s, "# voltage margin steps, optional range: %u\n",
+			   margining->voltage_steps_optional_range);
+		seq_printf(s, "# maximum voltage offset, optional range: %u mV\n",
+			   margining->max_voltage_offset_optional_range);
+	}
 
 	switch (independent_voltage_margins(margining)) {
 	case USB4_MARGIN_CAP_0_VOLTAGE_MIN:
@@ -667,6 +688,42 @@ static int margining_lanes_show(struct seq_file *s, void *not_used)
 }
 DEBUGFS_ATTR_RW(margining_lanes);
 
+static ssize_t
+margining_optional_voltage_offset_write(struct file *file,
+				   const char __user *user_buf,
+				   size_t count, loff_t *ppos)
+{
+	struct seq_file *s = file->private_data;
+	struct tb_margining *margining = s->private;
+	struct tb *tb = margining->port->sw->tb;
+	bool val;
+	int ret;
+
+	ret = kstrtobool_from_user(user_buf, count, &val);
+	if (ret)
+		return ret;
+
+	scoped_cond_guard(mutex_intr, return -ERESTARTSYS, &tb->lock) {
+		margining->optional_voltage_offset_range = val;
+	}
+
+	return count;
+}
+
+static int margining_optional_voltage_offset_show(struct seq_file *s,
+						  void *not_used)
+{
+	struct tb_margining *margining = s->private;
+	struct tb *tb = margining->port->sw->tb;
+
+	scoped_cond_guard(mutex_intr, return -ERESTARTSYS, &tb->lock) {
+		seq_printf(s, "%u\n", margining->optional_voltage_offset_range);
+	}
+
+	return 0;
+}
+DEBUGFS_ATTR_RW(margining_optional_voltage_offset);
+
 static ssize_t margining_mode_write(struct file *file,
 				   const char __user *user_buf,
 				   size_t count, loff_t *ppos)
@@ -785,6 +842,7 @@ static int margining_run_write(void *data, u64 val)
 			.lanes = margining->lanes,
 			.time = margining->time,
 			.right_high = margining->right_high,
+			.optional_voltage_offset_range = margining->optional_voltage_offset_range,
 		};
 
 		tb_port_dbg(port,
@@ -806,6 +864,7 @@ static int margining_run_write(void *data, u64 val)
 			.lanes = margining->lanes,
 			.time = margining->time,
 			.right_high = margining->right_high,
+			.optional_voltage_offset_range = margining->optional_voltage_offset_range,
 		};
 
 		/* Clear the results */
@@ -865,6 +924,8 @@ static void voltage_margin_show(struct seq_file *s,
 	if (val & USB4_MARGIN_HW_RES_1_EXCEEDS)
 		seq_puts(s, " exceeds maximum");
 	seq_puts(s, "\n");
+	if (margining->optional_voltage_offset_range)
+		seq_puts(s, " optional voltage offset range enabled\n");
 }
 
 static void time_margin_show(struct seq_file *s,
@@ -1104,6 +1165,15 @@ static struct tb_margining *margining_alloc(struct tb_port *port,
 	val = FIELD_GET(USB4_MARGIN_CAP_0_MAX_VOLTAGE_OFFSET_MASK, margining->caps[0]);
 	margining->max_voltage_offset = 74 + val * 2;
 
+	if (supports_optional_voltage_offset_range(margining)) {
+		val = FIELD_GET(USB4_MARGIN_CAP_0_VOLT_STEPS_OPT_MASK,
+				margining->caps[0]);
+		margining->voltage_steps_optional_range = val;
+		val = FIELD_GET(USB4_MARGIN_CAP_1_MAX_VOLT_OFS_OPT_MASK,
+				margining->caps[1]);
+		margining->max_voltage_offset_optional_range = 74 + val * 2;
+	}
+
 	if (supports_time(margining)) {
 		val = FIELD_GET(USB4_MARGIN_CAP_1_TIME_STEPS_MASK, margining->caps[1]);
 		margining->time_steps = val;
@@ -1140,6 +1210,10 @@ static struct tb_margining *margining_alloc(struct tb_port *port,
 	     independent_time_margins(margining) == USB4_MARGIN_CAP_1_TIME_LR))
 		debugfs_create_file("margin", 0600, dir, margining,
 				    &margining_margin_fops);
+
+	if (supports_optional_voltage_offset_range(margining))
+		debugfs_create_file("optional_voltage_offset", DEBUGFS_MODE, dir, margining,
+				    &margining_optional_voltage_offset_fops);
 	return margining;
 }
 
diff --git a/drivers/thunderbolt/sb_regs.h b/drivers/thunderbolt/sb_regs.h
index 86e80aa297f7..8bff0740222c 100644
--- a/drivers/thunderbolt/sb_regs.h
+++ b/drivers/thunderbolt/sb_regs.h
@@ -57,6 +57,9 @@ enum usb4_sb_opcode {
 #define USB4_MARGIN_CAP_0_TIME			BIT(5)
 #define USB4_MARGIN_CAP_0_VOLTAGE_STEPS_MASK	GENMASK(12, 6)
 #define USB4_MARGIN_CAP_0_MAX_VOLTAGE_OFFSET_MASK GENMASK(18, 13)
+#define USB4_MARGIN_CAP_0_OPT_VOLTAGE_SUPPORT	BIT(19)
+#define USB4_MARGIN_CAP_0_VOLT_STEPS_OPT_MASK	GENMASK(26, 20)
+#define USB4_MARGIN_CAP_1_MAX_VOLT_OFS_OPT_MASK GENMASK(7, 0)
 #define USB4_MARGIN_CAP_1_TIME_DESTR		BIT(8)
 #define USB4_MARGIN_CAP_1_TIME_INDP_MASK	GENMASK(10, 9)
 #define USB4_MARGIN_CAP_1_TIME_MIN		0x0
@@ -72,6 +75,7 @@ enum usb4_sb_opcode {
 #define USB4_MARGIN_HW_RH			BIT(4)
 #define USB4_MARGIN_HW_BER_MASK			GENMASK(9, 5)
 #define USB4_MARGIN_HW_BER_SHIFT		5
+#define USB4_MARGIN_HW_OPT_VOLTAGE		BIT(10)
 
 /* Applicable to all margin values */
 #define USB4_MARGIN_HW_RES_1_MARGIN_MASK	GENMASK(6, 0)
@@ -84,6 +88,7 @@ enum usb4_sb_opcode {
 /* USB4_SB_OPCODE_RUN_SW_LANE_MARGINING */
 #define USB4_MARGIN_SW_TIME			BIT(3)
 #define USB4_MARGIN_SW_RH			BIT(4)
+#define USB4_MARGIN_SW_OPT_VOLTAGE		BIT(5)
 #define USB4_MARGIN_SW_COUNTER_MASK		GENMASK(14, 13)
 
 #endif
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index 89ea66f885a4..262c333924b8 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -1372,6 +1372,7 @@ enum usb4_margin_sw_error_counter {
  * @error_counter: Error counter operation for software margining
  * @ber_level: Current BER level contour value
  * @lanes: %0, %1 or %7 (all)
+ * @optional_voltage_offset_range: Enable optional extended voltage range
  * @right_high: %false if left/low margin test is performed, %true if right/high
  * @time: %true if time margining is used instead of voltage
  */
@@ -1379,6 +1380,7 @@ struct usb4_port_margining_params {
 	enum usb4_margin_sw_error_counter error_counter;
 	u32 ber_level;
 	u32 lanes;
+	bool optional_voltage_offset_range;
 	bool right_high;
 	bool time;
 };
diff --git a/drivers/thunderbolt/usb4.c b/drivers/thunderbolt/usb4.c
index cb51cafcf20c..a2f81e17ad8d 100644
--- a/drivers/thunderbolt/usb4.c
+++ b/drivers/thunderbolt/usb4.c
@@ -1676,6 +1676,8 @@ int usb4_port_hw_margin(struct tb_port *port, enum usb4_sb_target target,
 		val |= USB4_MARGIN_HW_RH;
 	if (params->ber_level)
 		val |= FIELD_PREP(USB4_MARGIN_HW_BER_MASK, params->ber_level);
+	if (params->optional_voltage_offset_range)
+		val |= USB4_MARGIN_HW_OPT_VOLTAGE;
 
 	ret = usb4_port_sb_write(port, target, index, USB4_SB_METADATA, &val,
 				 sizeof(val));
@@ -1716,6 +1718,8 @@ int usb4_port_sw_margin(struct tb_port *port, enum usb4_sb_target target,
 	val = params->lanes;
 	if (params->time)
 		val |= USB4_MARGIN_SW_TIME;
+	if (params->optional_voltage_offset_range)
+		val |= USB4_MARGIN_SW_OPT_VOLTAGE;
 	if (params->right_high)
 		val |= USB4_MARGIN_SW_RH;
 	val |= FIELD_PREP(USB4_MARGIN_SW_COUNTER_MASK, params->error_counter);
-- 
2.43.0



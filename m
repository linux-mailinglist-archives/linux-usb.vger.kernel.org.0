Return-Path: <linux-usb+bounces-16596-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F909AC78B
	for <lists+linux-usb@lfdr.de>; Wed, 23 Oct 2024 12:12:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 770271C20CBA
	for <lists+linux-usb@lfdr.de>; Wed, 23 Oct 2024 10:12:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D2C21A7259;
	Wed, 23 Oct 2024 10:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Okpt+xDp"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B261A1A38E1
	for <linux-usb@vger.kernel.org>; Wed, 23 Oct 2024 10:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729678282; cv=none; b=rK+GJM0SqxiVRUT+ZQ1A2u6Ho2Yddjh6oGsHJ1/KbCgKFqFLBaXszuQD05iusAuYKj0YHBit9m+ktTe4/ej1kPVLhUtebS9ihg/6vBGXERY6/c3ntmRLA1KUwoyJpv1wM8jkTkXoQlHy1GvnhwQOU5l8mQdGy3TjlDelDeboEvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729678282; c=relaxed/simple;
	bh=9Doqg0wIvyHKPq8p3KJV96nqP7oiy48VughLE2RwEJ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mTaV9xe/SM+7I2E7XKlaXt1gM5pDQJZkfZi7pQ/O7LgQG6pPs9en4SjsZ7jVB+NedrzDzLCwWovzvefib3SpyGooyam3HD1yLdD1dPXAblu86jzgwZW/ffx0MsqPRAL+3pLtH8LfdWT5eB57A/xaHWeGiB9sqHeHbmfHSrLYC0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Okpt+xDp; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729678280; x=1761214280;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9Doqg0wIvyHKPq8p3KJV96nqP7oiy48VughLE2RwEJ8=;
  b=Okpt+xDp5mRvGNX7NXvbrSOGsd0IbO3ySE9YxP90rKlvcijVixnjkTZc
   wsIX2ssL8mL5esSE6wYAJ/CamE8roy31ELBp4aXAXNAqqunM+RYfNrFOg
   nacP7JKGq2jZrsH0cGUDVcmR7TUjcCdtt1PBOhBVQZtWiwkx4a3rqZdZ3
   sz0ElCqDaMZild9t+taPwpaHxIC6s60t8YgESZ2nm5aWUxfqyzTe1SQC9
   VO0a7d8fYVZcPdBQxHmD6dEwBiYp16vRXCKI2LjU84m/njTKpl/vSTOPK
   LLQ4SMWm2nDI8m+2wze8+YwVkGQoXzkdqIoZI4/EvGNzZrdBmSvbKwyQG
   Q==;
X-CSE-ConnectionGUID: nhfZecCcRaS34XjbP+si5A==
X-CSE-MsgGUID: SP2C9tgDSJSOtQkIQGr7Cg==
X-IronPort-AV: E=McAfee;i="6700,10204,11233"; a="29149608"
X-IronPort-AV: E=Sophos;i="6.11,225,1725346800"; 
   d="scan'208";a="29149608"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2024 03:11:15 -0700
X-CSE-ConnectionGUID: JYmgvN0qQq6Ujlp7K+EM0A==
X-CSE-MsgGUID: LnNb0yj7QKWFXKX2b+VFDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,225,1725346800"; 
   d="scan'208";a="84954602"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa005.jf.intel.com with ESMTP; 23 Oct 2024 03:11:14 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 286373F0; Wed, 23 Oct 2024 13:11:12 +0300 (EEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Aapo Vienamo <aapo.vienamo@iki.fi>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 3/8] thunderbolt: debugfs: Implement Gen 4 margining eye selection
Date: Wed, 23 Oct 2024 13:11:06 +0300
Message-ID: <20241023101111.3418311-4-mika.westerberg@linux.intel.com>
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

Add a debugfs knob for USB4 Gen 4 margining eye selection. Gen 4 uses
3-level pulse amplitude modulation (PAM3) which changes how margining
measurements are made because PAM3 has two eyes per lane from which
the margins can be measured.

Signed-off-by: Aapo Vienamo <aapo.vienamo@iki.fi>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/debugfs.c | 58 +++++++++++++++++++++++++++++++++++
 drivers/thunderbolt/sb_regs.h |  3 +-
 drivers/thunderbolt/tb.h      |  1 +
 drivers/thunderbolt/usb4.c    |  6 ++--
 4 files changed, 65 insertions(+), 3 deletions(-)

diff --git a/drivers/thunderbolt/debugfs.c b/drivers/thunderbolt/debugfs.c
index 83721ca069a5..699e1632e3f5 100644
--- a/drivers/thunderbolt/debugfs.c
+++ b/drivers/thunderbolt/debugfs.c
@@ -436,6 +436,8 @@ static ssize_t retimer_sb_regs_write(struct file *file,
  * @time: %true if time margining is used instead of voltage
  * @right_high: %false if left/low margin test is performed, %true if
  *		right/high
+ * @upper_eye: %false if the lower PAM3 eye is used, %true if the upper
+ *	       eye is used
  */
 struct tb_margining {
 	struct tb_port *port;
@@ -462,6 +464,7 @@ struct tb_margining {
 	bool software;
 	bool time;
 	bool right_high;
+	bool upper_eye;
 };
 
 static int margining_modify_error_counter(struct tb_margining *margining,
@@ -1162,6 +1165,7 @@ static int margining_run_write(void *data, u64 val)
 			.time = margining->time,
 			.voltage_time_offset = margining->voltage_time_offset,
 			.right_high = margining->right_high,
+			.upper_eye = margining->upper_eye,
 			.optional_voltage_offset_range = margining->optional_voltage_offset_range,
 		};
 
@@ -1177,6 +1181,7 @@ static int margining_run_write(void *data, u64 val)
 			.lanes = margining->lanes,
 			.time = margining->time,
 			.right_high = margining->right_high,
+			.upper_eye = margining->upper_eye,
 			.optional_voltage_offset_range = margining->optional_voltage_offset_range,
 		};
 
@@ -1464,6 +1469,55 @@ static int margining_margin_show(struct seq_file *s, void *not_used)
 }
 DEBUGFS_ATTR_RW(margining_margin);
 
+static ssize_t margining_eye_write(struct file *file,
+				   const char __user *user_buf,
+				   size_t count, loff_t *ppos)
+{
+	struct seq_file *s = file->private_data;
+	struct tb_port *port = s->private;
+	struct usb4_port *usb4 = port->usb4;
+	struct tb *tb = port->sw->tb;
+	int ret = 0;
+	char *buf;
+
+	buf = validate_and_copy_from_user(user_buf, &count);
+	if (IS_ERR(buf))
+		return PTR_ERR(buf);
+
+	buf[count - 1] = '\0';
+
+	scoped_cond_guard(mutex_intr, ret = -ERESTARTSYS, &tb->lock) {
+		if (!strcmp(buf, "lower"))
+			usb4->margining->upper_eye = false;
+		else if (!strcmp(buf, "upper"))
+			usb4->margining->upper_eye = true;
+		else
+			ret = -EINVAL;
+	}
+
+	free_page((unsigned long)buf);
+	return ret ? ret : count;
+}
+
+static int margining_eye_show(struct seq_file *s, void *not_used)
+{
+	struct tb_port *port = s->private;
+	struct usb4_port *usb4 = port->usb4;
+	struct tb *tb = port->sw->tb;
+
+	scoped_guard(mutex_intr, &tb->lock) {
+		if (usb4->margining->upper_eye)
+			seq_puts(s, "lower [upper]\n");
+		else
+			seq_puts(s, "[lower] upper\n");
+
+		return 0;
+	}
+
+	return -ERESTARTSYS;
+}
+DEBUGFS_ATTR_RW(margining_eye);
+
 static struct tb_margining *margining_alloc(struct tb_port *port,
 					    struct device *dev,
 					    enum usb4_sb_target target,
@@ -1573,6 +1627,10 @@ static struct tb_margining *margining_alloc(struct tb_port *port,
 		debugfs_create_file("dwell_time", DEBUGFS_MODE, dir, margining,
 				    &margining_dwell_time_fops);
 	}
+
+	if (margining->gen >= 4)
+		debugfs_create_file("eye", 0600, dir, port, &margining_eye_fops);
+
 	return margining;
 }
 
diff --git a/drivers/thunderbolt/sb_regs.h b/drivers/thunderbolt/sb_regs.h
index f60b8d90a71a..b7e91b99fefe 100644
--- a/drivers/thunderbolt/sb_regs.h
+++ b/drivers/thunderbolt/sb_regs.h
@@ -83,7 +83,7 @@ enum usb4_sb_opcode {
 
 /* USB4_SB_OPCODE_RUN_HW_LANE_MARGINING */
 #define USB4_MARGIN_HW_TIME			BIT(3)
-#define USB4_MARGIN_HW_RH			BIT(4)
+#define USB4_MARGIN_HW_RHU			BIT(4)
 #define USB4_MARGIN_HW_BER_MASK			GENMASK(9, 5)
 #define USB4_MARGIN_HW_BER_SHIFT		5
 #define USB4_MARGIN_HW_OPT_VOLTAGE		BIT(10)
@@ -106,6 +106,7 @@ enum usb4_sb_opcode {
 #define USB4_MARGIN_SW_OPT_VOLTAGE		BIT(5)
 #define USB4_MARGIN_SW_VT_MASK			GENMASK(12, 6)
 #define USB4_MARGIN_SW_COUNTER_MASK		GENMASK(14, 13)
+#define USB4_MARGIN_SW_UPPER_EYE		BIT(15)
 
 #define USB4_MARGIN_SW_ERR_COUNTER_LANE_0_MASK	GENMASK(3, 0)
 #define USB4_MARGIN_SW_ERR_COUNTER_LANE_1_MASK	GENMASK(7, 4)
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index fa7fc9bba70f..ced9be271620 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -1384,6 +1384,7 @@ struct usb4_port_margining_params {
 	u32 voltage_time_offset;
 	bool optional_voltage_offset_range;
 	bool right_high;
+	bool upper_eye;
 	bool time;
 };
 
diff --git a/drivers/thunderbolt/usb4.c b/drivers/thunderbolt/usb4.c
index 1fb72ff1268e..985f24b044b3 100644
--- a/drivers/thunderbolt/usb4.c
+++ b/drivers/thunderbolt/usb4.c
@@ -1673,8 +1673,8 @@ int usb4_port_hw_margin(struct tb_port *port, enum usb4_sb_target target,
 	val = params->lanes;
 	if (params->time)
 		val |= USB4_MARGIN_HW_TIME;
-	if (params->right_high)
-		val |= USB4_MARGIN_HW_RH;
+	if (params->right_high || params->upper_eye)
+		val |= USB4_MARGIN_HW_RHU;
 	if (params->ber_level)
 		val |= FIELD_PREP(USB4_MARGIN_HW_BER_MASK, params->ber_level);
 	if (params->optional_voltage_offset_range)
@@ -1723,6 +1723,8 @@ int usb4_port_sw_margin(struct tb_port *port, enum usb4_sb_target target,
 		val |= USB4_MARGIN_SW_OPT_VOLTAGE;
 	if (params->right_high)
 		val |= USB4_MARGIN_SW_RH;
+	if (params->upper_eye)
+		val |= USB4_MARGIN_SW_UPPER_EYE;
 	val |= FIELD_PREP(USB4_MARGIN_SW_COUNTER_MASK, params->error_counter);
 	val |= FIELD_PREP(USB4_MARGIN_SW_VT_MASK, params->voltage_time_offset);
 
-- 
2.45.2



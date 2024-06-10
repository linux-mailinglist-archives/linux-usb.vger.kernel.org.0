Return-Path: <linux-usb+bounces-11061-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 26FB8901EEE
	for <lists+linux-usb@lfdr.de>; Mon, 10 Jun 2024 12:08:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A6BAE1F27989
	for <lists+linux-usb@lfdr.de>; Mon, 10 Jun 2024 10:07:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3050F79B84;
	Mon, 10 Jun 2024 10:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ndmlzDXn"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C82F477119
	for <linux-usb@vger.kernel.org>; Mon, 10 Jun 2024 10:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718013996; cv=none; b=YyswaUYisx91QOPdC+347vXUAqdTUuftZ7c/kONK1V5NSTnnBf68JvonsftSozOuSBNfJumI3aLSWDDQ5Jky38kVawJ9dAXfhfmHBQO575k3q7EzlIbz9e8ohSg/PZIwrIxu5T/ochkogkVhGcLXwGeREJjPJU4b59OWBlbrn/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718013996; c=relaxed/simple;
	bh=zGExZnAvjEOmn2OnnPX4QQ/PDujqa15mFoj+W7PVTM8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sYyQK5YbG5nx32tBdSjf4HcHzGF9852Rg9u/ZUC5LVeMZaMHn5nziGC3jCw/AUqiKDzsxDs/y/xNgVy1vOKOaLl33grav2GbyW1YAY3V8ID9+2L7XihSFMk5ezjOHb3Rdzzt+JeTyU2Xhs58YHKMPfKo0Zz80Qizv950BqQD78E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ndmlzDXn; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718013995; x=1749549995;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zGExZnAvjEOmn2OnnPX4QQ/PDujqa15mFoj+W7PVTM8=;
  b=ndmlzDXnayOx4v/JVs1/41sF6uLQ9gqNRYcjmnZXERbRNtne68lpeXA7
   Pa8+njPfwi2tQrqv0dzgrtyfFXG24C5peB7BMrRn8+I8vAqTqytB+QBLf
   QukS9jogXwbgqIfoV1sl+0Io2lgll/16n/ulFXjtFVV60pqHkk9j2tj5G
   6L0nvHw6VmHMu9BT7KumPZwJ5qLYS5JoyufjLZWiixGpyKQPsMIns0GGB
   4rBItVu/Eq3OgjWyDCAxfbqkmy/cAHU2ldeJevMJ8aXCkV+t9ZvdQDKqN
   RuDLI7+a1exN3m25DeBthU+OXNr8aoUk28FM/4oyVPM42LVYR0iKVPCz1
   Q==;
X-CSE-ConnectionGUID: VoQaLhHjQ/ajJNHZKhxjig==
X-CSE-MsgGUID: o+tZLgtWT/u85cMQPRgYoA==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="32200996"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="32200996"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 03:06:31 -0700
X-CSE-ConnectionGUID: UE/a7VqBSeuHB1oG7FsYDw==
X-CSE-MsgGUID: CW/rxsVLQsqtnBUd7iE66g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="43590846"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa004.fm.intel.com with ESMTP; 10 Jun 2024 03:06:28 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 09CCC44E; Mon, 10 Jun 2024 13:06:28 +0300 (EEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>
Cc: linux-usb@vger.kernel.org,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 4/6] thunderbolt: Split out margining from USB4 port
Date: Mon, 10 Jun 2024 13:06:25 +0300
Message-ID: <20240610100627.3521887-5-mika.westerberg@linux.intel.com>
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

We are going to expand lane margining support for retimers too so split
out the generic margining functionality out of being specific to USB4
ports.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/debugfs.c | 234 ++++++++++++++++------------------
 1 file changed, 112 insertions(+), 122 deletions(-)

diff --git a/drivers/thunderbolt/debugfs.c b/drivers/thunderbolt/debugfs.c
index 8ca0dbfc0117..d1779a667272 100644
--- a/drivers/thunderbolt/debugfs.c
+++ b/drivers/thunderbolt/debugfs.c
@@ -379,6 +379,7 @@ static ssize_t retimer_sb_regs_write(struct file *file,
 #if IS_ENABLED(CONFIG_USB4_DEBUGFS_MARGINING)
 /**
  * struct tb_margining - Lane margining support
+ * @port: USB4 port through which the margining operations are run
  * @caps: Port lane margining capabilities
  * @results: Last lane margining results
  * @lanes: %0, %1 or %7 (all)
@@ -395,6 +396,7 @@ static ssize_t retimer_sb_regs_write(struct file *file,
  *		right/high
  */
 struct tb_margining {
+	struct tb_port *port;
 	u32 caps[2];
 	u32 results[2];
 	unsigned int lanes;
@@ -410,36 +412,38 @@ struct tb_margining {
 	bool right_high;
 };
 
-static bool supports_software(const struct usb4_port *usb4)
+static bool supports_software(const struct tb_margining *margining)
 {
-	return usb4->margining->caps[0] & USB4_MARGIN_CAP_0_MODES_SW;
+	return margining->caps[0] & USB4_MARGIN_CAP_0_MODES_SW;
 }
 
-static bool supports_hardware(const struct usb4_port *usb4)
+static bool supports_hardware(const struct tb_margining *margining)
 {
-	return usb4->margining->caps[0] & USB4_MARGIN_CAP_0_MODES_HW;
+	return margining->caps[0] & USB4_MARGIN_CAP_0_MODES_HW;
 }
 
-static bool both_lanes(const struct usb4_port *usb4)
+static bool both_lanes(const struct tb_margining *margining)
 {
-	return usb4->margining->caps[0] & USB4_MARGIN_CAP_0_2_LANES;
+	return margining->caps[0] & USB4_MARGIN_CAP_0_2_LANES;
 }
 
-static unsigned int independent_voltage_margins(const struct usb4_port *usb4)
+static unsigned int
+independent_voltage_margins(const struct tb_margining *margining)
 {
-	return (usb4->margining->caps[0] & USB4_MARGIN_CAP_0_VOLTAGE_INDP_MASK) >>
+	return (margining->caps[0] & USB4_MARGIN_CAP_0_VOLTAGE_INDP_MASK) >>
 		USB4_MARGIN_CAP_0_VOLTAGE_INDP_SHIFT;
 }
 
-static bool supports_time(const struct usb4_port *usb4)
+static bool supports_time(const struct tb_margining *margining)
 {
-	return usb4->margining->caps[0] & USB4_MARGIN_CAP_0_TIME;
+	return margining->caps[0] & USB4_MARGIN_CAP_0_TIME;
 }
 
 /* Only applicable if supports_time() returns true */
-static unsigned int independent_time_margins(const struct usb4_port *usb4)
+static unsigned int
+independent_time_margins(const struct tb_margining *margining)
 {
-	return (usb4->margining->caps[1] & USB4_MARGIN_CAP_1_TIME_INDP_MASK) >>
+	return (margining->caps[1] & USB4_MARGIN_CAP_1_TIME_INDP_MASK) >>
 		USB4_MARGIN_CAP_1_TIME_INDP_SHIFT;
 }
 
@@ -448,9 +452,8 @@ margining_ber_level_write(struct file *file, const char __user *user_buf,
 			   size_t count, loff_t *ppos)
 {
 	struct seq_file *s = file->private_data;
-	struct tb_port *port = s->private;
-	struct usb4_port *usb4 = port->usb4;
-	struct tb *tb = port->sw->tb;
+	struct tb_margining *margining = s->private;
+	struct tb *tb = margining->port->sw->tb;
 	unsigned int val;
 	int ret = 0;
 	char *buf;
@@ -458,7 +461,7 @@ margining_ber_level_write(struct file *file, const char __user *user_buf,
 	if (mutex_lock_interruptible(&tb->lock))
 		return -ERESTARTSYS;
 
-	if (usb4->margining->software) {
+	if (margining->software) {
 		ret = -EINVAL;
 		goto out_unlock;
 	}
@@ -475,13 +478,13 @@ margining_ber_level_write(struct file *file, const char __user *user_buf,
 	if (ret)
 		goto out_free;
 
-	if (val < usb4->margining->min_ber_level ||
-	    val > usb4->margining->max_ber_level) {
+	if (val < margining->min_ber_level ||
+	    val > margining->max_ber_level) {
 		ret = -EINVAL;
 		goto out_free;
 	}
 
-	usb4->margining->ber_level = val;
+	margining->ber_level = val;
 
 out_free:
 	free_page((unsigned long)buf);
@@ -501,52 +504,50 @@ static void ber_level_show(struct seq_file *s, unsigned int val)
 
 static int margining_ber_level_show(struct seq_file *s, void *not_used)
 {
-	struct tb_port *port = s->private;
-	struct usb4_port *usb4 = port->usb4;
+	const struct tb_margining *margining = s->private;
 
-	if (usb4->margining->software)
+	if (margining->software)
 		return -EINVAL;
-	ber_level_show(s, usb4->margining->ber_level);
+	ber_level_show(s, margining->ber_level);
 	return 0;
 }
 DEBUGFS_ATTR_RW(margining_ber_level);
 
 static int margining_caps_show(struct seq_file *s, void *not_used)
 {
-	struct tb_port *port = s->private;
-	struct usb4_port *usb4 = port->usb4;
-	struct tb *tb = port->sw->tb;
+	struct tb_margining *margining = s->private;
+	struct tb *tb = margining->port->sw->tb;
 	u32 cap0, cap1;
 
 	if (mutex_lock_interruptible(&tb->lock))
 		return -ERESTARTSYS;
 
 	/* Dump the raw caps first */
-	cap0 = usb4->margining->caps[0];
+	cap0 = margining->caps[0];
 	seq_printf(s, "0x%08x\n", cap0);
-	cap1 = usb4->margining->caps[1];
+	cap1 = margining->caps[1];
 	seq_printf(s, "0x%08x\n", cap1);
 
 	seq_printf(s, "# software margining: %s\n",
-		   supports_software(usb4) ? "yes" : "no");
-	if (supports_hardware(usb4)) {
+		   supports_software(margining) ? "yes" : "no");
+	if (supports_hardware(margining)) {
 		seq_puts(s, "# hardware margining: yes\n");
 		seq_puts(s, "# minimum BER level contour: ");
-		ber_level_show(s, usb4->margining->min_ber_level);
+		ber_level_show(s, margining->min_ber_level);
 		seq_puts(s, "# maximum BER level contour: ");
-		ber_level_show(s, usb4->margining->max_ber_level);
+		ber_level_show(s, margining->max_ber_level);
 	} else {
 		seq_puts(s, "# hardware margining: no\n");
 	}
 
 	seq_printf(s, "# both lanes simultaneously: %s\n",
-		  both_lanes(usb4) ? "yes" : "no");
+		  both_lanes(margining) ? "yes" : "no");
 	seq_printf(s, "# voltage margin steps: %u\n",
-		   usb4->margining->voltage_steps);
+		   margining->voltage_steps);
 	seq_printf(s, "# maximum voltage offset: %u mV\n",
-		   usb4->margining->max_voltage_offset);
+		   margining->max_voltage_offset);
 
-	switch (independent_voltage_margins(usb4)) {
+	switch (independent_voltage_margins(margining)) {
 	case USB4_MARGIN_CAP_0_VOLTAGE_MIN:
 		seq_puts(s, "# returns minimum between high and low voltage margins\n");
 		break;
@@ -558,12 +559,12 @@ static int margining_caps_show(struct seq_file *s, void *not_used)
 		break;
 	}
 
-	if (supports_time(usb4)) {
+	if (supports_time(margining)) {
 		seq_puts(s, "# time margining: yes\n");
 		seq_printf(s, "# time margining is destructive: %s\n",
 			   cap1 & USB4_MARGIN_CAP_1_TIME_DESTR ? "yes" : "no");
 
-		switch (independent_time_margins(usb4)) {
+		switch (independent_time_margins(margining)) {
 		case USB4_MARGIN_CAP_1_TIME_MIN:
 			seq_puts(s, "# returns minimum between left and right time margins\n");
 			break;
@@ -576,9 +577,9 @@ static int margining_caps_show(struct seq_file *s, void *not_used)
 		}
 
 		seq_printf(s, "# time margin steps: %u\n",
-			   usb4->margining->time_steps);
+			   margining->time_steps);
 		seq_printf(s, "# maximum time offset: %u mUI\n",
-			   usb4->margining->max_time_offset);
+			   margining->max_time_offset);
 	} else {
 		seq_puts(s, "# time margining: no\n");
 	}
@@ -593,9 +594,8 @@ margining_lanes_write(struct file *file, const char __user *user_buf,
 		      size_t count, loff_t *ppos)
 {
 	struct seq_file *s = file->private_data;
-	struct tb_port *port = s->private;
-	struct usb4_port *usb4 = port->usb4;
-	struct tb *tb = port->sw->tb;
+	struct tb_margining *margining = s->private;
+	struct tb *tb = margining->port->sw->tb;
 	int ret = 0;
 	char *buf;
 
@@ -611,13 +611,13 @@ margining_lanes_write(struct file *file, const char __user *user_buf,
 	}
 
 	if (!strcmp(buf, "0")) {
-		usb4->margining->lanes = 0;
+		margining->lanes = 0;
 	} else if (!strcmp(buf, "1")) {
-		usb4->margining->lanes = 1;
+		margining->lanes = 1;
 	} else if (!strcmp(buf, "all")) {
 		/* Needs to be supported */
-		if (both_lanes(usb4))
-			usb4->margining->lanes = 7;
+		if (both_lanes(margining))
+			margining->lanes = 7;
 		else
 			ret = -EINVAL;
 	} else {
@@ -633,16 +633,15 @@ margining_lanes_write(struct file *file, const char __user *user_buf,
 
 static int margining_lanes_show(struct seq_file *s, void *not_used)
 {
-	struct tb_port *port = s->private;
-	struct usb4_port *usb4 = port->usb4;
-	struct tb *tb = port->sw->tb;
+	struct tb_margining *margining = s->private;
+	struct tb *tb = margining->port->sw->tb;
 	unsigned int lanes;
 
 	if (mutex_lock_interruptible(&tb->lock))
 		return -ERESTARTSYS;
 
-	lanes = usb4->margining->lanes;
-	if (both_lanes(usb4)) {
+	lanes = margining->lanes;
+	if (both_lanes(margining)) {
 		if (!lanes)
 			seq_puts(s, "[0] 1 all\n");
 		else if (lanes == 1)
@@ -666,9 +665,8 @@ static ssize_t margining_mode_write(struct file *file,
 				   size_t count, loff_t *ppos)
 {
 	struct seq_file *s = file->private_data;
-	struct tb_port *port = s->private;
-	struct usb4_port *usb4 = port->usb4;
-	struct tb *tb = port->sw->tb;
+	struct tb_margining *margining = s->private;
+	struct tb *tb = margining->port->sw->tb;
 	int ret = 0;
 	char *buf;
 
@@ -684,13 +682,13 @@ static ssize_t margining_mode_write(struct file *file,
 	}
 
 	if (!strcmp(buf, "software")) {
-		if (supports_software(usb4))
-			usb4->margining->software = true;
+		if (supports_software(margining))
+			margining->software = true;
 		else
 			ret = -EINVAL;
 	} else if (!strcmp(buf, "hardware")) {
-		if (supports_hardware(usb4))
-			usb4->margining->software = false;
+		if (supports_hardware(margining))
+			margining->software = false;
 		else
 			ret = -EINVAL;
 	} else {
@@ -706,23 +704,22 @@ static ssize_t margining_mode_write(struct file *file,
 
 static int margining_mode_show(struct seq_file *s, void *not_used)
 {
-	const struct tb_port *port = s->private;
-	const struct usb4_port *usb4 = port->usb4;
-	struct tb *tb = port->sw->tb;
+	struct tb_margining *margining = s->private;
+	struct tb *tb = margining->port->sw->tb;
 	const char *space = "";
 
 	if (mutex_lock_interruptible(&tb->lock))
 		return -ERESTARTSYS;
 
-	if (supports_software(usb4)) {
-		if (usb4->margining->software)
+	if (supports_software(margining)) {
+		if (margining->software)
 			seq_puts(s, "[software]");
 		else
 			seq_puts(s, "software");
 		space = " ";
 	}
-	if (supports_hardware(usb4)) {
-		if (usb4->margining->software)
+	if (supports_hardware(margining)) {
+		if (margining->software)
 			seq_printf(s, "%shardware", space);
 		else
 			seq_printf(s, "%s[hardware]", space);
@@ -737,10 +734,9 @@ DEBUGFS_ATTR_RW(margining_mode);
 
 static int margining_run_write(void *data, u64 val)
 {
-	struct tb_port *port = data;
-	struct usb4_port *usb4 = port->usb4;
+	struct tb_margining *margining = data;
+	struct tb_port *port = margining->port;
 	struct tb_switch *sw = port->sw;
-	struct tb_margining *margining;
 	struct tb_switch *down_sw;
 	struct tb *tb = sw->tb;
 	int ret, clx;
@@ -775,8 +771,6 @@ static int margining_run_write(void *data, u64 val)
 		clx = ret;
 	}
 
-	margining = usb4->margining;
-
 	if (margining->software) {
 		tb_port_dbg(port, "running software %s lane margining for lanes %u\n",
 			    margining->time ? "time" : "voltage", margining->lanes);
@@ -817,16 +811,15 @@ static ssize_t margining_results_write(struct file *file,
 				       size_t count, loff_t *ppos)
 {
 	struct seq_file *s = file->private_data;
-	struct tb_port *port = s->private;
-	struct usb4_port *usb4 = port->usb4;
-	struct tb *tb = port->sw->tb;
+	struct tb_margining *margining = s->private;
+	struct tb *tb = margining->port->sw->tb;
 
 	if (mutex_lock_interruptible(&tb->lock))
 		return -ERESTARTSYS;
 
 	/* Just clear the results */
-	usb4->margining->results[0] = 0;
-	usb4->margining->results[1] = 0;
+	margining->results[0] = 0;
+	margining->results[1] = 0;
 
 	mutex_unlock(&tb->lock);
 	return count;
@@ -860,15 +853,12 @@ static void time_margin_show(struct seq_file *s,
 
 static int margining_results_show(struct seq_file *s, void *not_used)
 {
-	struct tb_port *port = s->private;
-	struct usb4_port *usb4 = port->usb4;
-	struct tb_margining *margining;
-	struct tb *tb = port->sw->tb;
+	struct tb_margining *margining = s->private;
+	struct tb *tb = margining->port->sw->tb;
 
 	if (mutex_lock_interruptible(&tb->lock))
 		return -ERESTARTSYS;
 
-	margining = usb4->margining;
 	/* Dump the raw results first */
 	seq_printf(s, "0x%08x\n", margining->results[0]);
 	/* Only the hardware margining has two result dwords */
@@ -930,9 +920,8 @@ static ssize_t margining_test_write(struct file *file,
 				    size_t count, loff_t *ppos)
 {
 	struct seq_file *s = file->private_data;
-	struct tb_port *port = s->private;
-	struct usb4_port *usb4 = port->usb4;
-	struct tb *tb = port->sw->tb;
+	struct tb_margining *margining = s->private;
+	struct tb *tb = margining->port->sw->tb;
 	int ret = 0;
 	char *buf;
 
@@ -947,10 +936,10 @@ static ssize_t margining_test_write(struct file *file,
 		goto out_free;
 	}
 
-	if (!strcmp(buf, "time") && supports_time(usb4))
-		usb4->margining->time = true;
+	if (!strcmp(buf, "time") && supports_time(margining))
+		margining->time = true;
 	else if (!strcmp(buf, "voltage"))
-		usb4->margining->time = false;
+		margining->time = false;
 	else
 		ret = -EINVAL;
 
@@ -963,15 +952,14 @@ static ssize_t margining_test_write(struct file *file,
 
 static int margining_test_show(struct seq_file *s, void *not_used)
 {
-	struct tb_port *port = s->private;
-	struct usb4_port *usb4 = port->usb4;
-	struct tb *tb = port->sw->tb;
+	struct tb_margining *margining = s->private;
+	struct tb *tb = margining->port->sw->tb;
 
 	if (mutex_lock_interruptible(&tb->lock))
 		return -ERESTARTSYS;
 
-	if (supports_time(usb4)) {
-		if (usb4->margining->time)
+	if (supports_time(margining)) {
+		if (margining->time)
 			seq_puts(s, "voltage [time]\n");
 		else
 			seq_puts(s, "[voltage] time\n");
@@ -989,9 +977,8 @@ static ssize_t margining_margin_write(struct file *file,
 				    size_t count, loff_t *ppos)
 {
 	struct seq_file *s = file->private_data;
-	struct tb_port *port = s->private;
-	struct usb4_port *usb4 = port->usb4;
-	struct tb *tb = port->sw->tb;
+	struct tb_margining *margining = s->private;
+	struct tb *tb = margining->port->sw->tb;
 	int ret = 0;
 	char *buf;
 
@@ -1006,18 +993,18 @@ static ssize_t margining_margin_write(struct file *file,
 		goto out_free;
 	}
 
-	if (usb4->margining->time) {
+	if (margining->time) {
 		if (!strcmp(buf, "left"))
-			usb4->margining->right_high = false;
+			margining->right_high = false;
 		else if (!strcmp(buf, "right"))
-			usb4->margining->right_high = true;
+			margining->right_high = true;
 		else
 			ret = -EINVAL;
 	} else {
 		if (!strcmp(buf, "low"))
-			usb4->margining->right_high = false;
+			margining->right_high = false;
 		else if (!strcmp(buf, "high"))
-			usb4->margining->right_high = true;
+			margining->right_high = true;
 		else
 			ret = -EINVAL;
 	}
@@ -1031,20 +1018,19 @@ static ssize_t margining_margin_write(struct file *file,
 
 static int margining_margin_show(struct seq_file *s, void *not_used)
 {
-	struct tb_port *port = s->private;
-	struct usb4_port *usb4 = port->usb4;
-	struct tb *tb = port->sw->tb;
+	struct tb_margining *margining = s->private;
+	struct tb *tb = margining->port->sw->tb;
 
 	if (mutex_lock_interruptible(&tb->lock))
 		return -ERESTARTSYS;
 
-	if (usb4->margining->time) {
-		if (usb4->margining->right_high)
+	if (margining->time) {
+		if (margining->right_high)
 			seq_puts(s, "left [right]\n");
 		else
 			seq_puts(s, "[left] right\n");
 	} else {
-		if (usb4->margining->right_high)
+		if (margining->right_high)
 			seq_puts(s, "low [high]\n");
 		else
 			seq_puts(s, "[low] high\n");
@@ -1075,16 +1061,16 @@ static void margining_port_init(struct tb_port *port)
 	if (!margining)
 		return;
 
+	margining->port = port;
+
 	ret = usb4_port_margining_caps(port, margining->caps);
 	if (ret) {
 		kfree(margining);
 		return;
 	}
 
-	usb4->margining = margining;
-
 	/* Set the initial mode */
-	if (supports_software(usb4))
+	if (supports_software(margining))
 		margining->software = true;
 
 	val = (margining->caps[0] & USB4_MARGIN_CAP_0_VOLTAGE_STEPS_MASK) >>
@@ -1094,7 +1080,7 @@ static void margining_port_init(struct tb_port *port)
 		USB4_MARGIN_CAP_0_MAX_VOLTAGE_OFFSET_SHIFT;
 	margining->max_voltage_offset = 74 + val * 2;
 
-	if (supports_time(usb4)) {
+	if (supports_time(margining)) {
 		val = (margining->caps[1] & USB4_MARGIN_CAP_1_TIME_STEPS_MASK) >>
 			USB4_MARGIN_CAP_1_TIME_STEPS_SHIFT;
 		margining->time_steps = val;
@@ -1108,7 +1094,7 @@ static void margining_port_init(struct tb_port *port)
 	}
 
 	dir = debugfs_create_dir("margining", parent);
-	if (supports_hardware(usb4)) {
+	if (supports_hardware(margining)) {
 		val = (margining->caps[1] & USB4_MARGIN_CAP_1_MIN_BER_MASK) >>
 			USB4_MARGIN_CAP_1_MIN_BER_SHIFT;
 		margining->min_ber_level = val;
@@ -1119,19 +1105,23 @@ static void margining_port_init(struct tb_port *port)
 		/* Set the default to minimum */
 		margining->ber_level = margining->min_ber_level;
 
-		debugfs_create_file("ber_level_contour", 0400, dir, port,
+		debugfs_create_file("ber_level_contour", 0400, dir, margining,
 				    &margining_ber_level_fops);
 	}
-	debugfs_create_file("caps", 0400, dir, port, &margining_caps_fops);
-	debugfs_create_file("lanes", 0600, dir, port, &margining_lanes_fops);
-	debugfs_create_file("mode", 0600, dir, port, &margining_mode_fops);
-	debugfs_create_file("run", 0600, dir, port, &margining_run_fops);
-	debugfs_create_file("results", 0600, dir, port, &margining_results_fops);
-	debugfs_create_file("test", 0600, dir, port, &margining_test_fops);
-	if (independent_voltage_margins(usb4) == USB4_MARGIN_CAP_0_VOLTAGE_HL ||
-	    (supports_time(usb4) &&
-	     independent_time_margins(usb4) == USB4_MARGIN_CAP_1_TIME_LR))
-		debugfs_create_file("margin", 0600, dir, port, &margining_margin_fops);
+	debugfs_create_file("caps", 0400, dir, margining, &margining_caps_fops);
+	debugfs_create_file("lanes", 0600, dir, margining, &margining_lanes_fops);
+	debugfs_create_file("mode", 0600, dir, margining, &margining_mode_fops);
+	debugfs_create_file("run", 0600, dir, margining, &margining_run_fops);
+	debugfs_create_file("results", 0600, dir, margining,
+			    &margining_results_fops);
+	debugfs_create_file("test", 0600, dir, margining, &margining_test_fops);
+	if (independent_voltage_margins(margining) == USB4_MARGIN_CAP_0_VOLTAGE_HL ||
+	    (supports_time(margining) &&
+	     independent_time_margins(margining) == USB4_MARGIN_CAP_1_TIME_LR))
+		debugfs_create_file("margin", 0600, dir, margining,
+				    &margining_margin_fops);
+
+	usb4->margining = margining;
 }
 
 static void margining_port_remove(struct tb_port *port)
-- 
2.43.0



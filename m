Return-Path: <linux-usb+bounces-11057-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AD196901EE8
	for <lists+linux-usb@lfdr.de>; Mon, 10 Jun 2024 12:07:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 461B7280D01
	for <lists+linux-usb@lfdr.de>; Mon, 10 Jun 2024 10:07:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1771177F12;
	Mon, 10 Jun 2024 10:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lpizRI/C"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA869762CD
	for <linux-usb@vger.kernel.org>; Mon, 10 Jun 2024 10:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718013994; cv=none; b=Midlke3UX8b9U6DMBXa8SIzafqJXO53Ks6Yje2KXXeyqDjMx/vJt5++cC0hZh2IHc9VGSwof1rh9cnQTS1nf8Li2cSo0+BH6xSNjD/bgDPSLwZixxYlTEyKGEW/emVsov0gff4lONInA2hBesgGrrKu9BjFFKzmJ1qVrakaUx7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718013994; c=relaxed/simple;
	bh=Udz2tWiW2g++6MQcl10ZXrRpW6pxtZTBibtR6fjT0y0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VPw9WSX1oXJTtY3tuOwDJLI11X5FvqmUcPpCK0ZJhfoPfj3tAiylnhmve8kK6Ty6BhdSskz1TrCOd/W4qnEDFDa6l0op23jV+VlvkWmUO3J3kpNoA7+isMs4x91uk3fDNlUSMrbqSJkig6brVHCQM8yUWOcy+3RfUCLDieZNB1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lpizRI/C; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718013993; x=1749549993;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Udz2tWiW2g++6MQcl10ZXrRpW6pxtZTBibtR6fjT0y0=;
  b=lpizRI/CToKuiHFx1bz9+PDzihAbf9d3ZkDP6/hJbS55EBFhZ32vSzlf
   hTnoDSb77BmgwA0QyRsdKmly3x34riKydUvAv/9bYt+bB2E7+wLesnHv8
   TEb2uTtx5q4FBGjAskZXS+TgoO7EmAqPVIrDJ0hPcoJS2Nd5T7Y8HDkjn
   vd/Z4SWIn/y650fVrJcZyMdHQWMfl0yigBiaRfpA3amzkhQx16iy0O8WO
   DDe9wi+h4INyi7+xeI1EtaPlUv3JK2t5Bby5yDdu3YY3vutE0ET3sGqSV
   G71/n0YP6Ey9YeKzzbjvAveNX4Hd4ltiYWqs+V3rp26yzELmAIiVFdALc
   A==;
X-CSE-ConnectionGUID: L5NzBbX4R0W24DNy0l52Dw==
X-CSE-MsgGUID: bkmSHyn2RFGLjoohqvgF2w==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="32200987"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="32200987"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 03:06:30 -0700
X-CSE-ConnectionGUID: 3+5PUG8PRA6tnwtfhFgFPQ==
X-CSE-MsgGUID: QQUjhgBeSXWDOSZv/Jp55w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="43590837"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa004.fm.intel.com with ESMTP; 10 Jun 2024 03:06:28 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id F393C456; Mon, 10 Jun 2024 13:06:27 +0300 (EEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>
Cc: linux-usb@vger.kernel.org,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 3/6] thunderbolt: Add sideband register access to debugfs
Date: Mon, 10 Jun 2024 13:06:24 +0300
Message-ID: <20240610100627.3521887-4-mika.westerberg@linux.intel.com>
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

This makes it possible to read and write USB4 port and retimer sideband
registers through debugfs which is useful for debugging and manufacturing
purposes. We add "sb_regs" debugfs attribute under each USB4 port and
retimer that is used to access the sideband.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/debugfs.c | 293 ++++++++++++++++++++++++++++++++++
 drivers/thunderbolt/retimer.c |   2 +
 drivers/thunderbolt/sb_regs.h |   8 +
 drivers/thunderbolt/tb.h      |   6 +
 4 files changed, 309 insertions(+)

diff --git a/drivers/thunderbolt/debugfs.c b/drivers/thunderbolt/debugfs.c
index 70b52aac3d97..8ca0dbfc0117 100644
--- a/drivers/thunderbolt/debugfs.c
+++ b/drivers/thunderbolt/debugfs.c
@@ -33,6 +33,44 @@
 
 #define COUNTER_SET_LEN		3
 
+/* Sideband registers and their sizes as defined in the USB4 spec */
+struct sb_reg {
+	unsigned int reg;
+	unsigned int size;
+};
+
+#define SB_MAX_SIZE		64
+
+/* Sideband registers for router */
+static const struct sb_reg port_sb_regs[] = {
+	{ USB4_SB_VENDOR_ID, 4 },
+	{ USB4_SB_PRODUCT_ID, 4 },
+	{ USB4_SB_DEBUG_CONF, 4 },
+	{ USB4_SB_DEBUG, 54 },
+	{ USB4_SB_LRD_TUNING, 4 },
+	{ USB4_SB_OPCODE, 4 },
+	{ USB4_SB_METADATA, 4 },
+	{ USB4_SB_LINK_CONF, 3 },
+	{ USB4_SB_GEN23_TXFFE, 4 },
+	{ USB4_SB_GEN4_TXFFE, 4 },
+	{ USB4_SB_VERSION, 4 },
+	{ USB4_SB_DATA, 64 },
+};
+
+/* Sideband registers for retimer */
+static const struct sb_reg retimer_sb_regs[] = {
+	{ USB4_SB_VENDOR_ID, 4 },
+	{ USB4_SB_PRODUCT_ID, 4 },
+	{ USB4_SB_FW_VERSION, 4 },
+	{ USB4_SB_LRD_TUNING, 4 },
+	{ USB4_SB_OPCODE, 4 },
+	{ USB4_SB_METADATA, 4 },
+	{ USB4_SB_GEN23_TXFFE, 4 },
+	{ USB4_SB_GEN4_TXFFE, 4 },
+	{ USB4_SB_VERSION, 4 },
+	{ USB4_SB_DATA, 64 },
+};
+
 #define DEBUGFS_ATTR(__space, __write)					\
 static int __space ## _open(struct inode *inode, struct file *file)	\
 {									\
@@ -184,10 +222,157 @@ static ssize_t switch_regs_write(struct file *file, const char __user *user_buf,
 
 	return regs_write(sw, NULL, user_buf, count, ppos);
 }
+
+static bool parse_sb_line(char **line, u8 *reg, u8 *data, size_t data_size,
+			  size_t *bytes_read)
+{
+	char *field, *token;
+	int i;
+
+	token = strsep(line, "\n");
+	if (!token)
+		return false;
+
+	/* Parse the register first */
+	field = strsep(&token, " ");
+	if (!field)
+		return false;
+	if (kstrtou8(field, 0, reg))
+		return false;
+
+	/* Then the values for the register, up to data_size */
+	for (i = 0; i < data_size; i++) {
+		field = strsep(&token, " ");
+		if (!field)
+			break;
+		if (kstrtou8(field, 0, &data[i]))
+			return false;
+	}
+
+	*bytes_read = i;
+	return true;
+}
+
+static ssize_t sb_regs_write(struct tb_port *port, const struct sb_reg *sb_regs,
+			     size_t size, enum usb4_sb_target target, u8 index,
+			     char *buf, size_t count, loff_t *ppos)
+{
+	u8 reg, data[SB_MAX_SIZE];
+	size_t bytes_read;
+	char *line = buf;
+
+	/* User did hardware changes behind the driver's back */
+	add_taint(TAINT_USER, LOCKDEP_STILL_OK);
+
+	/*
+	 * For sideband registers we accept:
+	 * reg b0 b1 b2...\n
+	 *
+	 * Here "reg" is the byte offset of the sideband register and "b0"..
+	 * are the byte values. There can be less byte values than the register
+	 * size. The leftovers will not be overwritten.
+	 */
+	while (parse_sb_line(&line, &reg, data, ARRAY_SIZE(data), &bytes_read)) {
+		const struct sb_reg *sb_reg;
+		int ret;
+
+		/* At least one byte must be passed */
+		if (bytes_read < 1)
+			return -EINVAL;
+
+		/* Find the register */
+		sb_reg = NULL;
+		for (int i = 0; i < size; i++) {
+			if (sb_regs[i].reg == reg) {
+				sb_reg = &sb_regs[i];
+				break;
+			}
+		}
+
+		if (!sb_reg)
+			return -EINVAL;
+
+		if (bytes_read > sb_regs->size)
+			return -E2BIG;
+
+		ret = usb4_port_sb_write(port, target, index, sb_reg->reg, data,
+					 bytes_read);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static ssize_t port_sb_regs_write(struct file *file, const char __user *user_buf,
+				  size_t count, loff_t *ppos)
+{
+	struct seq_file *s = file->private_data;
+	struct tb_port *port = s->private;
+	struct tb_switch *sw = port->sw;
+	struct tb *tb = sw->tb;
+	char *buf;
+	int ret;
+
+	buf = validate_and_copy_from_user(user_buf, &count);
+	if (IS_ERR(buf))
+		return PTR_ERR(buf);
+
+	pm_runtime_get_sync(&sw->dev);
+
+	if (mutex_lock_interruptible(&tb->lock)) {
+		ret = -ERESTARTSYS;
+		goto out_rpm_put;
+	}
+
+	ret = sb_regs_write(port, port_sb_regs, ARRAY_SIZE(port_sb_regs),
+			    USB4_SB_TARGET_ROUTER, 0, buf, count, ppos);
+
+	mutex_unlock(&tb->lock);
+out_rpm_put:
+	pm_runtime_mark_last_busy(&sw->dev);
+	pm_runtime_put_autosuspend(&sw->dev);
+
+	return ret < 0 ? ret : count;
+}
+
+static ssize_t retimer_sb_regs_write(struct file *file,
+				     const char __user *user_buf,
+				     size_t count, loff_t *ppos)
+{
+	struct seq_file *s = file->private_data;
+	struct tb_retimer *rt = s->private;
+	struct tb *tb = rt->tb;
+	char *buf;
+	int ret;
+
+	buf = validate_and_copy_from_user(user_buf, &count);
+	if (IS_ERR(buf))
+		return PTR_ERR(buf);
+
+	pm_runtime_get_sync(&rt->dev);
+
+	if (mutex_lock_interruptible(&tb->lock)) {
+		ret = -ERESTARTSYS;
+		goto out_rpm_put;
+	}
+
+	ret = sb_regs_write(rt->port, retimer_sb_regs, ARRAY_SIZE(retimer_sb_regs),
+			    USB4_SB_TARGET_RETIMER, rt->index, buf, count, ppos);
+
+	mutex_unlock(&tb->lock);
+out_rpm_put:
+	pm_runtime_mark_last_busy(&rt->dev);
+	pm_runtime_put_autosuspend(&rt->dev);
+
+	return ret < 0 ? ret : count;
+}
 #define DEBUGFS_MODE		0600
 #else
 #define port_regs_write		NULL
 #define switch_regs_write	NULL
+#define port_sb_regs_write	NULL
+#define retimer_sb_regs_write	NULL
 #define DEBUGFS_MODE		0400
 #endif
 
@@ -1505,6 +1690,60 @@ static int counters_show(struct seq_file *s, void *not_used)
 }
 DEBUGFS_ATTR_RW(counters);
 
+static int sb_regs_show(struct tb_port *port, const struct sb_reg *sb_regs,
+			size_t size, enum usb4_sb_target target, u8 index,
+			struct seq_file *s)
+{
+	int ret, i;
+
+	seq_puts(s, "# register value\n");
+
+	for (i = 0; i < size; i++) {
+		const struct sb_reg *regs = &sb_regs[i];
+		u8 data[64];
+		int j;
+
+		memset(data, 0, sizeof(data));
+		ret = usb4_port_sb_read(port, target, index, regs->reg, data,
+					regs->size);
+		if (ret)
+			return ret;
+
+		seq_printf(s, "0x%02x", regs->reg);
+		for (j = 0; j < regs->size; j++)
+			seq_printf(s, " 0x%02x", data[j]);
+		seq_puts(s, "\n");
+	}
+
+	return 0;
+}
+
+static int port_sb_regs_show(struct seq_file *s, void *not_used)
+{
+	struct tb_port *port = s->private;
+	struct tb_switch *sw = port->sw;
+	struct tb *tb = sw->tb;
+	int ret;
+
+	pm_runtime_get_sync(&sw->dev);
+
+	if (mutex_lock_interruptible(&tb->lock)) {
+		ret = -ERESTARTSYS;
+		goto out_rpm_put;
+	}
+
+	ret = sb_regs_show(port, port_sb_regs, ARRAY_SIZE(port_sb_regs),
+			   USB4_SB_TARGET_ROUTER, 0, s);
+
+	mutex_unlock(&tb->lock);
+out_rpm_put:
+	pm_runtime_mark_last_busy(&sw->dev);
+	pm_runtime_put_autosuspend(&sw->dev);
+
+	return ret;
+}
+DEBUGFS_ATTR_RW(port_sb_regs);
+
 /**
  * tb_switch_debugfs_init() - Add debugfs entries for router
  * @sw: Pointer to the router
@@ -1539,6 +1778,9 @@ void tb_switch_debugfs_init(struct tb_switch *sw)
 		if (port->config.counters_support)
 			debugfs_create_file("counters", 0600, debugfs_dir, port,
 					    &counters_fops);
+		if (port->usb4)
+			debugfs_create_file("sb_regs", DEBUGFS_MODE, debugfs_dir,
+					    port, &port_sb_regs_fops);
 	}
 
 	margining_switch_init(sw);
@@ -1590,6 +1832,57 @@ void tb_service_debugfs_remove(struct tb_service *svc)
 	svc->debugfs_dir = NULL;
 }
 
+static int retimer_sb_regs_show(struct seq_file *s, void *not_used)
+{
+	struct tb_retimer *rt = s->private;
+	struct tb *tb = rt->tb;
+	int ret;
+
+	pm_runtime_get_sync(&rt->dev);
+
+	if (mutex_lock_interruptible(&tb->lock)) {
+		ret = -ERESTARTSYS;
+		goto out_rpm_put;
+	}
+
+	ret = sb_regs_show(rt->port, retimer_sb_regs, ARRAY_SIZE(retimer_sb_regs),
+			   USB4_SB_TARGET_RETIMER, rt->index, s);
+
+	mutex_unlock(&tb->lock);
+out_rpm_put:
+	pm_runtime_mark_last_busy(&rt->dev);
+	pm_runtime_put_autosuspend(&rt->dev);
+
+	return ret;
+}
+DEBUGFS_ATTR_RW(retimer_sb_regs);
+
+/**
+ * tb_retimer_debugfs_init() - Add debugfs directory for retimer
+ * @rt: Pointer to retimer structure
+ *
+ * Adds and populates retimer debugfs directory.
+ */
+void tb_retimer_debugfs_init(struct tb_retimer *rt)
+{
+	rt->debugfs_dir = debugfs_create_dir(dev_name(&rt->dev),
+					     tb_debugfs_root);
+	debugfs_create_file("sb_regs", DEBUGFS_MODE, rt->debugfs_dir, rt,
+			    &retimer_sb_regs_fops);
+}
+
+/**
+ * tb_retimer_debugfs_remove() - Remove retimer debugfs directory
+ * @rt: Pointer to retimer structure
+ *
+ * Removes the retimer debugfs directory along with its contents.
+ */
+void tb_retimer_debugfs_remove(struct tb_retimer *rt)
+{
+	debugfs_remove_recursive(rt->debugfs_dir);
+	rt->debugfs_dir = NULL;
+}
+
 void tb_debugfs_init(void)
 {
 	tb_debugfs_root = debugfs_create_dir("thunderbolt", NULL);
diff --git a/drivers/thunderbolt/retimer.c b/drivers/thunderbolt/retimer.c
index 9b66bff98f7e..8ce1dc7bbfad 100644
--- a/drivers/thunderbolt/retimer.c
+++ b/drivers/thunderbolt/retimer.c
@@ -437,12 +437,14 @@ static int tb_retimer_add(struct tb_port *port, u8 index, u32 auth_status)
 	pm_runtime_mark_last_busy(&rt->dev);
 	pm_runtime_use_autosuspend(&rt->dev);
 
+	tb_retimer_debugfs_init(rt);
 	return 0;
 }
 
 static void tb_retimer_remove(struct tb_retimer *rt)
 {
 	dev_info(&rt->dev, "retimer disconnected\n");
+	tb_retimer_debugfs_remove(rt);
 	tb_nvm_free(rt->nvm);
 	device_unregister(&rt->dev);
 }
diff --git a/drivers/thunderbolt/sb_regs.h b/drivers/thunderbolt/sb_regs.h
index f37a4320f10a..b2a6add82161 100644
--- a/drivers/thunderbolt/sb_regs.h
+++ b/drivers/thunderbolt/sb_regs.h
@@ -12,6 +12,10 @@
 
 #define USB4_SB_VENDOR_ID			0x00
 #define USB4_SB_PRODUCT_ID			0x01
+#define USB4_SB_FW_VERSION			0x02
+#define USB4_SB_DEBUG_CONF			0x05
+#define USB4_SB_DEBUG				0x06
+#define USB4_SB_LRD_TUNING			0x07
 #define USB4_SB_OPCODE				0x08
 
 enum usb4_sb_opcode {
@@ -35,6 +39,10 @@ enum usb4_sb_opcode {
 
 #define USB4_SB_METADATA			0x09
 #define USB4_SB_METADATA_NVM_AUTH_WRITE_MASK	GENMASK(5, 0)
+#define USB4_SB_LINK_CONF			0x0c
+#define USB4_SB_GEN23_TXFFE			0x0d
+#define USB4_SB_GEN4_TXFFE			0x0e
+#define USB4_SB_VERSION				0x0f
 #define USB4_SB_DATA				0x12
 
 /* USB4_SB_OPCODE_READ_LANE_MARGINING_CAP */
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index ab3366fcb0a3..3caaa056316c 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -329,6 +329,7 @@ struct usb4_port {
  * @nvm: Pointer to the NVM if the retimer has one (%NULL otherwise)
  * @no_nvm_upgrade: Prevent NVM upgrade of this retimer
  * @auth_status: Status of last NVM authentication
+ * @debugfs_dir: Pointer to the debugfs structure
  */
 struct tb_retimer {
 	struct device dev;
@@ -340,6 +341,7 @@ struct tb_retimer {
 	struct tb_nvm *nvm;
 	bool no_nvm_upgrade;
 	u32 auth_status;
+	struct dentry *debugfs_dir;
 };
 
 /**
@@ -1458,6 +1460,8 @@ void tb_xdomain_debugfs_init(struct tb_xdomain *xd);
 void tb_xdomain_debugfs_remove(struct tb_xdomain *xd);
 void tb_service_debugfs_init(struct tb_service *svc);
 void tb_service_debugfs_remove(struct tb_service *svc);
+void tb_retimer_debugfs_init(struct tb_retimer *rt);
+void tb_retimer_debugfs_remove(struct tb_retimer *rt);
 #else
 static inline void tb_debugfs_init(void) { }
 static inline void tb_debugfs_exit(void) { }
@@ -1467,6 +1471,8 @@ static inline void tb_xdomain_debugfs_init(struct tb_xdomain *xd) { }
 static inline void tb_xdomain_debugfs_remove(struct tb_xdomain *xd) { }
 static inline void tb_service_debugfs_init(struct tb_service *svc) { }
 static inline void tb_service_debugfs_remove(struct tb_service *svc) { }
+static inline void tb_retimer_debugfs_init(struct tb_retimer *rt) { }
+static inline void tb_retimer_debugfs_remove(struct tb_retimer *rt) { }
 #endif
 
 #endif
-- 
2.43.0



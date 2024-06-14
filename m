Return-Path: <linux-usb+bounces-11332-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4466D908B69
	for <lists+linux-usb@lfdr.de>; Fri, 14 Jun 2024 14:15:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C1077285764
	for <lists+linux-usb@lfdr.de>; Fri, 14 Jun 2024 12:15:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CF14196427;
	Fri, 14 Jun 2024 12:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OParuzMd"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF9E198A1B
	for <linux-usb@vger.kernel.org>; Fri, 14 Jun 2024 12:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718367322; cv=none; b=g0UPzJ8ETulrWbD3J6f9zWprP9HM/1DK7rMjJURFDUlGXQjm3TeJJFcfNNy5qfvfPdsm90bQjmfiNVZsO/ALvOPVtDayyeSJIJk/h8MYNM6Y13b9vvGWvLftIE+rsQE4hLeaS/8Z7bpSVm4Dqb+pCIdkV9AmLYrom3r8U8+NdS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718367322; c=relaxed/simple;
	bh=QX3PW/e8/TRJ42WkgchBT0vm0g2gj1MhhXfqPIjL9S8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jdwMKlxwuwXTkEYkd0vp355xY3teYcqBTuIM0DaOC+i58Pk6xO+HqiKTEfRrCbhuTsKzSXlA6gEdU8tJZ1+zJn4FJAbem+3o9j0CX3Z6LUGQImd4YpyMUDN1HZBA7ejy4q8rU/0I8EVntA7sUd5Ryxd+E0FSFYBroqc2q79jVzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OParuzMd; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718367320; x=1749903320;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QX3PW/e8/TRJ42WkgchBT0vm0g2gj1MhhXfqPIjL9S8=;
  b=OParuzMd79+nwURKEYbAWt2dk/wd0rrJU9o+kS1Xih7uO0XdYB3NhcJh
   EMtaj37uD9FW0oxivw9XPLFX8Jt1HwT5t9yGFnBO5dF8jfiXcrnntrEi2
   cNHdqY1npuUIscT/IgfGJxg2Zl1noFhYhhEGJpUPPpulCtiKKTLc4CEY6
   LxjqNZrEWH6r+zRmAahyhk4zvCAApjoD9ta6JzfXVA3K12pjlqedfamj3
   n0MMsYbP4IgQkFTyayLO5iMj4txkrOQnpGDe4otSJhwt54n9Ie4wXxHxw
   9GUNDqkNX3lAgnmiWTfd1GS4HzO9eTHsiphR6hTmHHwWeJ4wsw1oowWOm
   g==;
X-CSE-ConnectionGUID: TZKf+Sg0SgqOiwKM3Z9pww==
X-CSE-MsgGUID: KpZV03o2TjGk7ulEYfBmyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="15410016"
X-IronPort-AV: E=Sophos;i="6.08,237,1712646000"; 
   d="scan'208";a="15410016"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2024 05:15:18 -0700
X-CSE-ConnectionGUID: 5fmS5AbtQGqKGDWrEWytKg==
X-CSE-MsgGUID: eLU5RAyBQR+RDgkr9qaHgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,237,1712646000"; 
   d="scan'208";a="45437737"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa005.jf.intel.com with ESMTP; 14 Jun 2024 05:15:16 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 88BED44E; Fri, 14 Jun 2024 15:15:12 +0300 (EEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>
Cc: linux-usb@vger.kernel.org,
	Greg KH <gregkh@linuxfoundation.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v2 6/6] thunderbolt: Add receiver lane margining support for retimers
Date: Fri, 14 Jun 2024 15:15:12 +0300
Message-ID: <20240614121512.1361184-7-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240614121512.1361184-1-mika.westerberg@linux.intel.com>
References: <20240614121512.1361184-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Retimers support lane margining as well so make this available through
debugfs in the same way as we do for the USB4 ports. When this is
enabled we also expose retimers on the other side of the cable because
typically margining is implemented only on direction towards the cable.
However, for the retimers on the other side of the cable we do not allow
NVM upgrade to avoid confusing the existing userspace (the same retimer
may now appear twice with different name) and is probably not a good
idea anyway.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/Kconfig   | 11 +++--
 drivers/thunderbolt/debugfs.c | 92 +++++++++++++++++++++++++----------
 drivers/thunderbolt/retimer.c | 43 +++++++++-------
 drivers/thunderbolt/sb_regs.h |  1 +
 drivers/thunderbolt/tb.h      |  5 ++
 drivers/thunderbolt/usb4.c    | 24 +++++++++
 6 files changed, 128 insertions(+), 48 deletions(-)

diff --git a/drivers/thunderbolt/Kconfig b/drivers/thunderbolt/Kconfig
index 3e01f41e9d66..0abdb69ee9f4 100644
--- a/drivers/thunderbolt/Kconfig
+++ b/drivers/thunderbolt/Kconfig
@@ -32,14 +32,15 @@ config USB4_DEBUGFS_WRITE
 	  this for production systems or distro kernels.
 
 config USB4_DEBUGFS_MARGINING
-	bool "Expose receiver lane margining operations under USB4 ports (DANGEROUS)"
+	bool "Expose receiver lane margining operations under USB4 ports and retimers (DANGEROUS)"
 	depends on DEBUG_FS
 	depends on USB4_DEBUGFS_WRITE
 	help
-	  Enables hardware and software based receiver lane margining support
-	  under each USB4 port. Used for electrical quality and robustness
-	  validation during manufacturing. Should not be enabled by distro
-	  kernels.
+	  Enables hardware and software based receiver lane margining
+	  support under each USB4 port and retimer, including retimers
+	  on the other side of the cable. Used for electrical quality
+	  and robustness validation during manufacturing. Should not be
+	  enabled by distro kernels.
 
 config USB4_KUNIT_TEST
 	bool "KUnit tests" if !KUNIT_ALL_TESTS
diff --git a/drivers/thunderbolt/debugfs.c b/drivers/thunderbolt/debugfs.c
index 87b2c91a4656..c2a735421609 100644
--- a/drivers/thunderbolt/debugfs.c
+++ b/drivers/thunderbolt/debugfs.c
@@ -380,6 +380,9 @@ static ssize_t retimer_sb_regs_write(struct file *file,
 /**
  * struct tb_margining - Lane margining support
  * @port: USB4 port through which the margining operations are run
+ * @target: Sideband target
+ * @index: Retimer index if taget is %USB4_SB_TARGET_RETIMER
+ * @dev: Pointer to the device that is the target (USB4 port or retimer)
  * @caps: Port lane margining capabilities
  * @results: Last lane margining results
  * @lanes: %0, %1 or %7 (all)
@@ -397,6 +400,9 @@ static ssize_t retimer_sb_regs_write(struct file *file,
  */
 struct tb_margining {
 	struct tb_port *port;
+	enum usb4_sb_target target;
+	u8 index;
+	struct device *dev;
 	u32 caps[2];
 	u32 results[2];
 	unsigned int lanes;
@@ -736,6 +742,7 @@ static int margining_run_write(void *data, u64 val)
 {
 	struct tb_margining *margining = data;
 	struct tb_port *port = margining->port;
+	struct device *dev = margining->dev;
 	struct tb_switch *sw = port->sw;
 	struct tb_switch *down_sw;
 	struct tb *tb = sw->tb;
@@ -744,7 +751,7 @@ static int margining_run_write(void *data, u64 val)
 	if (val != 1)
 		return -EINVAL;
 
-	pm_runtime_get_sync(&sw->dev);
+	pm_runtime_get_sync(dev);
 
 	if (mutex_lock_interruptible(&tb->lock)) {
 		ret = -ERESTARTSYS;
@@ -772,24 +779,29 @@ static int margining_run_write(void *data, u64 val)
 	}
 
 	if (margining->software) {
-		tb_port_dbg(port, "running software %s lane margining for lanes %u\n",
-			    margining->time ? "time" : "voltage", margining->lanes);
-		ret = usb4_port_sw_margin(port, USB4_SB_TARGET_ROUTER, 0,
+		tb_port_dbg(port,
+			    "running software %s lane margining for %s lanes %u\n",
+			    margining->time ? "time" : "voltage", dev_name(dev),
+			    margining->lanes);
+		ret = usb4_port_sw_margin(port, margining->target, margining->index,
 					  margining->lanes, margining->time,
 					  margining->right_high,
 					  USB4_MARGIN_SW_COUNTER_CLEAR);
 		if (ret)
 			goto out_clx;
 
-		ret = usb4_port_sw_margin_errors(port, USB4_SB_TARGET_ROUTER, 0,
+		ret = usb4_port_sw_margin_errors(port, margining->target,
+						 margining->index,
 						 &margining->results[0]);
 	} else {
-		tb_port_dbg(port, "running hardware %s lane margining for lanes %u\n",
-			    margining->time ? "time" : "voltage", margining->lanes);
+		tb_port_dbg(port,
+			    "running hardware %s lane margining for %s lanes %u\n",
+			    margining->time ? "time" : "voltage", dev_name(dev),
+			    margining->lanes);
 		/* Clear the results */
 		margining->results[0] = 0;
 		margining->results[1] = 0;
-		ret = usb4_port_hw_margin(port, USB4_SB_TARGET_ROUTER, 0,
+		ret = usb4_port_hw_margin(port, margining->target, margining->index,
 					  margining->lanes, margining->ber_level,
 					  margining->time, margining->right_high,
 					  margining->results);
@@ -801,8 +813,8 @@ static int margining_run_write(void *data, u64 val)
 out_unlock:
 	mutex_unlock(&tb->lock);
 out_rpm_put:
-	pm_runtime_mark_last_busy(&sw->dev);
-	pm_runtime_put_autosuspend(&sw->dev);
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_put_autosuspend(dev);
 
 	return ret;
 }
@@ -1044,33 +1056,29 @@ static int margining_margin_show(struct seq_file *s, void *not_used)
 }
 DEBUGFS_ATTR_RW(margining_margin);
 
-static void margining_port_init(struct tb_port *port)
+static struct tb_margining *margining_alloc(struct tb_port *port,
+					    struct device *dev,
+					    enum usb4_sb_target target,
+					    u8 index, struct dentry *parent)
 {
 	struct tb_margining *margining;
-	struct dentry *dir, *parent;
-	struct usb4_port *usb4;
-	char dir_name[10];
+	struct dentry *dir;
 	unsigned int val;
 	int ret;
 
-	usb4 = port->usb4;
-	if (!usb4)
-		return;
-
-	snprintf(dir_name, sizeof(dir_name), "port%d", port->port);
-	parent = debugfs_lookup(dir_name, port->sw->debugfs_dir);
-
 	margining = kzalloc(sizeof(*margining), GFP_KERNEL);
 	if (!margining)
-		return;
+		return NULL;
 
 	margining->port = port;
+	margining->target = target;
+	margining->index = index;
+	margining->dev = dev;
 
-	ret = usb4_port_margining_caps(port, USB4_SB_TARGET_ROUTER, 0,
-				       margining->caps);
+	ret = usb4_port_margining_caps(port, target, index, margining->caps);
 	if (ret) {
 		kfree(margining);
-		return;
+		return NULL;
 	}
 
 	/* Set the initial mode */
@@ -1124,8 +1132,22 @@ static void margining_port_init(struct tb_port *port)
 	     independent_time_margins(margining) == USB4_MARGIN_CAP_1_TIME_LR))
 		debugfs_create_file("margin", 0600, dir, margining,
 				    &margining_margin_fops);
+	return margining;
+}
 
-	usb4->margining = margining;
+static void margining_port_init(struct tb_port *port)
+{
+	struct dentry *parent;
+	char dir_name[10];
+
+	if (!port->usb4)
+		return;
+
+	snprintf(dir_name, sizeof(dir_name), "port%d", port->port);
+	parent = debugfs_lookup(dir_name, port->sw->debugfs_dir);
+	port->usb4->margining = margining_alloc(port, &port->usb4->dev,
+						USB4_SB_TARGET_ROUTER, 0,
+						parent);
 }
 
 static void margining_port_remove(struct tb_port *port)
@@ -1199,11 +1221,27 @@ static void margining_xdomain_remove(struct tb_xdomain *xd)
 	downstream = tb_port_at(xd->route, parent_sw);
 	margining_port_remove(downstream);
 }
+
+static void margining_retimer_init(struct tb_retimer *rt, struct dentry *debugfs_dir)
+{
+	rt->margining = margining_alloc(rt->port, &rt->dev,
+					USB4_SB_TARGET_RETIMER, rt->index,
+					debugfs_dir);
+}
+
+static void margining_retimer_remove(struct tb_retimer *rt)
+{
+	kfree(rt->margining);
+	rt->margining = NULL;
+}
 #else
 static inline void margining_switch_init(struct tb_switch *sw) { }
 static inline void margining_switch_remove(struct tb_switch *sw) { }
 static inline void margining_xdomain_init(struct tb_xdomain *xd) { }
 static inline void margining_xdomain_remove(struct tb_xdomain *xd) { }
+static inline void margining_retimer_init(struct tb_retimer *rt,
+					  struct dentry *debugfs_dir) { }
+static inline void margining_retimer_remove(struct tb_retimer *rt) { }
 #endif
 
 static int port_clear_all_counters(struct tb_port *port)
@@ -1864,6 +1902,7 @@ void tb_retimer_debugfs_init(struct tb_retimer *rt)
 	debugfs_dir = debugfs_create_dir(dev_name(&rt->dev), tb_debugfs_root);
 	debugfs_create_file("sb_regs", DEBUGFS_MODE, debugfs_dir, rt,
 			    &retimer_sb_regs_fops);
+	margining_retimer_init(rt, debugfs_dir);
 }
 
 /**
@@ -1875,6 +1914,7 @@ void tb_retimer_debugfs_init(struct tb_retimer *rt)
 void tb_retimer_debugfs_remove(struct tb_retimer *rt)
 {
 	debugfs_lookup_and_remove(dev_name(&rt->dev), tb_debugfs_root);
+	margining_retimer_remove(rt);
 }
 
 void tb_debugfs_init(void)
diff --git a/drivers/thunderbolt/retimer.c b/drivers/thunderbolt/retimer.c
index 8ce1dc7bbfad..721319329afa 100644
--- a/drivers/thunderbolt/retimer.c
+++ b/drivers/thunderbolt/retimer.c
@@ -14,7 +14,11 @@
 #include "sb_regs.h"
 #include "tb.h"
 
+#if IS_ENABLED(CONFIG_USB4_DEBUGFS_MARGINING)
 #define TB_MAX_RETIMER_INDEX	6
+#else
+#define TB_MAX_RETIMER_INDEX	2
+#endif
 
 /**
  * tb_retimer_nvm_read() - Read contents of retimer NVM
@@ -319,6 +323,8 @@ static ssize_t nvm_version_show(struct device *dev,
 
 	if (!rt->nvm)
 		ret = -EAGAIN;
+	else if (rt->no_nvm_upgrade)
+		ret = -EOPNOTSUPP;
 	else
 		ret = sysfs_emit(buf, "%x.%x\n", rt->nvm->major, rt->nvm->minor);
 
@@ -366,7 +372,8 @@ const struct device_type tb_retimer_type = {
 	.release = tb_retimer_release,
 };
 
-static int tb_retimer_add(struct tb_port *port, u8 index, u32 auth_status)
+static int tb_retimer_add(struct tb_port *port, u8 index, u32 auth_status,
+			  bool on_board)
 {
 	struct tb_retimer *rt;
 	u32 vendor, device;
@@ -388,13 +395,6 @@ static int tb_retimer_add(struct tb_port *port, u8 index, u32 auth_status)
 		return ret;
 	}
 
-	/*
-	 * Check that it supports NVM operations. If not then don't add
-	 * the device at all.
-	 */
-	ret = usb4_port_retimer_nvm_sector_size(port, index);
-	if (ret < 0)
-		return ret;
 
 	rt = kzalloc(sizeof(*rt), GFP_KERNEL);
 	if (!rt)
@@ -407,6 +407,13 @@ static int tb_retimer_add(struct tb_port *port, u8 index, u32 auth_status)
 	rt->port = port;
 	rt->tb = port->sw->tb;
 
+	/*
+	 * Only support NVM upgrade for on-board retimers. The retimers
+	 * on the other side of the connection.
+	 */
+	if (!on_board || usb4_port_retimer_nvm_sector_size(port, index) <= 0)
+		rt->no_nvm_upgrade = true;
+
 	rt->dev.parent = &port->usb4->dev;
 	rt->dev.bus = &tb_bus_type;
 	rt->dev.type = &tb_retimer_type;
@@ -487,7 +494,7 @@ static struct tb_retimer *tb_port_find_retimer(struct tb_port *port, u8 index)
 int tb_retimer_scan(struct tb_port *port, bool add)
 {
 	u32 status[TB_MAX_RETIMER_INDEX + 1] = {};
-	int ret, i, last_idx = 0;
+	int ret, i, max, last_idx = 0;
 
 	/*
 	 * Send broadcast RT to make sure retimer indices facing this
@@ -522,26 +529,28 @@ int tb_retimer_scan(struct tb_port *port, bool add)
 			break;
 	}
 
-	tb_retimer_unset_inbound_sbtx(port);
-
-	if (!last_idx)
-		return 0;
-
-	/* Add on-board retimers if they do not exist already */
+	max = i;
 	ret = 0;
-	for (i = 1; i <= last_idx; i++) {
+
+	/* Add retimers if they do not exist already */
+	for (i = 1; i <= max; i++) {
 		struct tb_retimer *rt;
 
+		/* Skip cable retimers */
+		if (usb4_port_retimer_is_cable(port, i))
+			continue;
+
 		rt = tb_port_find_retimer(port, i);
 		if (rt) {
 			put_device(&rt->dev);
 		} else if (add) {
-			ret = tb_retimer_add(port, i, status[i]);
+			ret = tb_retimer_add(port, i, status[i], i <= last_idx);
 			if (ret && ret != -EOPNOTSUPP)
 				break;
 		}
 	}
 
+	tb_retimer_unset_inbound_sbtx(port);
 	return ret;
 }
 
diff --git a/drivers/thunderbolt/sb_regs.h b/drivers/thunderbolt/sb_regs.h
index b2a6add82161..a29ef3c19422 100644
--- a/drivers/thunderbolt/sb_regs.h
+++ b/drivers/thunderbolt/sb_regs.h
@@ -26,6 +26,7 @@ enum usb4_sb_opcode {
 	USB4_SB_OPCODE_SET_INBOUND_SBTX = 0x5055534c,		/* "LSUP" */
 	USB4_SB_OPCODE_UNSET_INBOUND_SBTX = 0x50555355,		/* "USUP" */
 	USB4_SB_OPCODE_QUERY_LAST_RETIMER = 0x5453414c,		/* "LAST" */
+	USB4_SB_OPCODE_QUERY_CABLE_RETIMER = 0x524c4243,	/* "CBLR" */
 	USB4_SB_OPCODE_GET_NVM_SECTOR_SIZE = 0x53534e47,	/* "GNSS" */
 	USB4_SB_OPCODE_NVM_SET_OFFSET = 0x53504f42,		/* "BOPS" */
 	USB4_SB_OPCODE_NVM_BLOCK_WRITE = 0x574b4c42,		/* "BLKW" */
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index 2f3de3d3c2e0..b47f7873c847 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -329,6 +329,7 @@ struct usb4_port {
  * @nvm: Pointer to the NVM if the retimer has one (%NULL otherwise)
  * @no_nvm_upgrade: Prevent NVM upgrade of this retimer
  * @auth_status: Status of last NVM authentication
+ * @margining: Pointer to margining structure if enabled
  */
 struct tb_retimer {
 	struct device dev;
@@ -340,6 +341,9 @@ struct tb_retimer {
 	struct tb_nvm *nvm;
 	bool no_nvm_upgrade;
 	u32 auth_status;
+#ifdef CONFIG_USB4_DEBUGFS_MARGINING
+	struct tb_margining *margining;
+#endif
 };
 
 /**
@@ -1363,6 +1367,7 @@ int usb4_port_sw_margin_errors(struct tb_port *port, enum usb4_sb_target target,
 int usb4_port_retimer_set_inbound_sbtx(struct tb_port *port, u8 index);
 int usb4_port_retimer_unset_inbound_sbtx(struct tb_port *port, u8 index);
 int usb4_port_retimer_is_last(struct tb_port *port, u8 index);
+int usb4_port_retimer_is_cable(struct tb_port *port, u8 index);
 int usb4_port_retimer_nvm_sector_size(struct tb_port *port, u8 index);
 int usb4_port_retimer_nvm_set_offset(struct tb_port *port, u8 index,
 				     unsigned int address);
diff --git a/drivers/thunderbolt/usb4.c b/drivers/thunderbolt/usb4.c
index d952de07493f..4d83b65afb5b 100644
--- a/drivers/thunderbolt/usb4.c
+++ b/drivers/thunderbolt/usb4.c
@@ -1830,6 +1830,30 @@ int usb4_port_retimer_is_last(struct tb_port *port, u8 index)
 	return ret ? ret : metadata & 1;
 }
 
+/**
+ * usb4_port_retimer_is_cable() - Is the retimer cable retimer
+ * @port: USB4 port
+ * @index: Retimer index
+ *
+ * If the retimer at @index is last cable retimer this function returns
+ * %1 and %0 if it is on-board retimer. In case a retimer is not present
+ * at @index returns %-ENODEV. Otherwise returns negative errno.
+ */
+int usb4_port_retimer_is_cable(struct tb_port *port, u8 index)
+{
+	u32 metadata;
+	int ret;
+
+	ret = usb4_port_retimer_op(port, index, USB4_SB_OPCODE_QUERY_CABLE_RETIMER,
+				   500);
+	if (ret)
+		return ret;
+
+	ret = usb4_port_sb_read(port, USB4_SB_TARGET_RETIMER, index,
+				USB4_SB_METADATA, &metadata, sizeof(metadata));
+	return ret ? ret : metadata & 1;
+}
+
 /**
  * usb4_port_retimer_nvm_sector_size() - Read retimer NVM sector size
  * @port: USB4 port
-- 
2.43.0



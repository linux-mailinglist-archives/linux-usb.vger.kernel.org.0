Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90147252C2F
	for <lists+linux-usb@lfdr.de>; Wed, 26 Aug 2020 13:07:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728712AbgHZLHy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Aug 2020 07:07:54 -0400
Received: from mga18.intel.com ([134.134.136.126]:62740 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728776AbgHZLHp (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 26 Aug 2020 07:07:45 -0400
IronPort-SDR: 3TMm19zPgEgVEsDn+95kvfAH/X9woYwKPZNXc9i16IDigkIScqD6e4w65FLe1e/aWoZ6AVrY7p
 Evza4Evqiy9w==
X-IronPort-AV: E=McAfee;i="6000,8403,9724"; a="143933885"
X-IronPort-AV: E=Sophos;i="5.76,355,1592895600"; 
   d="scan'208";a="143933885"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2020 04:07:43 -0700
IronPort-SDR: zmg0oT2efcUMHSOsmx+CDa/pqvQ3PShQSlz+1iRXQMCXPJ8d2sd2p7+iBVCXCsVRZv8CcqdKiQ
 qbOlgWymq3Sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,355,1592895600"; 
   d="scan'208";a="336804660"
Received: from black.fi.intel.com ([10.237.72.28])
  by FMSMGA003.fm.intel.com with ESMTP; 26 Aug 2020 04:07:40 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 1AE115FF; Wed, 26 Aug 2020 14:07:37 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Gil Fine <gil.fine@intel.com>, Lukas Wunner <lukas@wunner.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 9/9] thunderbolt: Add debugfs interface
Date:   Wed, 26 Aug 2020 14:07:36 +0300
Message-Id: <20200826110736.55186-10-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200826110736.55186-1-mika.westerberg@linux.intel.com>
References: <20200826110736.55186-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Gil Fine <gil.fine@intel.com>

This adds debugfs interface that can be used for debugging possible
issues in hardware/software. It exposes router and adapter config spaces
through files like this:

  /sys/kernel/debug/thunderbolt/<DEVICE>/regs
  /sys/kernel/debug/thunderbolt/<DEVICE>/<PORT1>/regs
  /sys/kernel/debug/thunderbolt/<DEVICE>/<PORT1>/path
  /sys/kernel/debug/thunderbolt/<DEVICE>/<PORT1>/counters
  /sys/kernel/debug/thunderbolt/<DEVICE>/<PORT2>/regs
  /sys/kernel/debug/thunderbolt/<DEVICE>/<PORT2>/path
  /sys/kernel/debug/thunderbolt/<DEVICE>/<PORT2>/counters
  ...

The "regs" is either the router or port configuration space register
dump. The "path" is the port path configuration space and "counters" is
the optional counters configuration space.

These files contains one register per line so it should be easy to use
normal filtering tools to find the registers of interest if needed.

The router and adapter regs file becomes writable when
CONFIG_USB4_DEBUGFS_WRITE is enabled (which is not supposed to be done
in production systems) and in this case the developer can write "offset
value" lines there to modify the hardware directly. For convenience this
also supports the long format the read side produces (but ignores the
additional fields). The counters file can be written even when
CONFIG_USB4_DEBUGFS_WRITE is not enabled and it is only used to clear
the counter values.

Signed-off-by: Gil Fine <gil.fine@intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/Kconfig   |  10 +
 drivers/thunderbolt/Makefile  |   1 +
 drivers/thunderbolt/debugfs.c | 700 ++++++++++++++++++++++++++++++++++
 drivers/thunderbolt/domain.c  |  13 +-
 drivers/thunderbolt/switch.c  |   3 +
 drivers/thunderbolt/tb.h      |  14 +
 drivers/thunderbolt/tb_regs.h |   4 +-
 7 files changed, 742 insertions(+), 3 deletions(-)
 create mode 100644 drivers/thunderbolt/debugfs.c

diff --git a/drivers/thunderbolt/Kconfig b/drivers/thunderbolt/Kconfig
index 354e61c0f2e5..2257c22f8ab3 100644
--- a/drivers/thunderbolt/Kconfig
+++ b/drivers/thunderbolt/Kconfig
@@ -16,6 +16,16 @@ menuconfig USB4
 	  To compile this driver a module, choose M here. The module will be
 	  called thunderbolt.
 
+config USB4_DEBUGFS_WRITE
+	bool "Enable write by debugfs to configuration spaces (DANGEROUS)"
+	depends on USB4
+	help
+	  Enables writing to device configuration registers through
+	  debugfs interface.
+
+	  Only enable this if you know what you are doing! Never enable
+	  this for production systems or distro kernels.
+
 config USB4_KUNIT_TEST
 	bool "KUnit tests"
 	depends on KUNIT=y
diff --git a/drivers/thunderbolt/Makefile b/drivers/thunderbolt/Makefile
index 754a529aa132..61d5dff445b6 100644
--- a/drivers/thunderbolt/Makefile
+++ b/drivers/thunderbolt/Makefile
@@ -5,5 +5,6 @@ thunderbolt-objs += domain.o dma_port.o icm.o property.o xdomain.o lc.o tmu.o us
 thunderbolt-objs += nvm.o retimer.o quirks.o
 
 thunderbolt-${CONFIG_ACPI} += acpi.o
+thunderbolt-$(CONFIG_DEBUG_FS) += debugfs.o
 
 obj-${CONFIG_USB4_KUNIT_TEST} += test.o
diff --git a/drivers/thunderbolt/debugfs.c b/drivers/thunderbolt/debugfs.c
new file mode 100644
index 000000000000..fdfe6e4afbfe
--- /dev/null
+++ b/drivers/thunderbolt/debugfs.c
@@ -0,0 +1,700 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Debugfs interface
+ *
+ * Copyright (C) 2020, Intel Corporation
+ * Authors: Gil Fine <gil.fine@intel.com>
+ *	    Mika Westerberg <mika.westerberg@linux.intel.com>
+ */
+
+#include <linux/debugfs.h>
+#include <linux/pm_runtime.h>
+
+#include "tb.h"
+
+#define PORT_CAP_PCIE_LEN	1
+#define PORT_CAP_POWER_LEN	2
+#define PORT_CAP_LANE_LEN	3
+#define PORT_CAP_USB3_LEN	5
+#define PORT_CAP_DP_LEN		8
+#define PORT_CAP_TMU_LEN	8
+#define PORT_CAP_BASIC_LEN	9
+#define PORT_CAP_USB4_LEN	20
+
+#define SWITCH_CAP_TMU_LEN	26
+#define SWITCH_CAP_BASIC_LEN	27
+
+#define PATH_LEN		2
+
+#define COUNTER_SET_LEN		3
+
+#define DEBUGFS_ATTR(__space, __write)					\
+static int __space ## _open(struct inode *inode, struct file *file)	\
+{									\
+	return single_open(file, __space ## _show, inode->i_private);	\
+}									\
+									\
+static const struct file_operations __space ## _fops = {		\
+	.owner = THIS_MODULE,						\
+	.open = __space ## _open,					\
+	.release = single_release,					\
+	.read  = seq_read,						\
+	.write = __write,						\
+	.llseek = seq_lseek,						\
+}
+
+#define DEBUGFS_ATTR_RO(__space)					\
+	DEBUGFS_ATTR(__space, NULL)
+
+#define DEBUGFS_ATTR_RW(__space)					\
+	DEBUGFS_ATTR(__space, __space ## _write)
+
+static struct dentry *tb_debugfs_root;
+
+static void *validate_and_copy_from_user(const void __user *user_buf,
+					 size_t *count)
+{
+	size_t nbytes;
+	void *buf;
+
+	if (!*count)
+		return ERR_PTR(-EINVAL);
+
+	if (!access_ok(user_buf, *count))
+		return ERR_PTR(-EFAULT);
+
+	buf = (void *)get_zeroed_page(GFP_KERNEL);
+	if (!buf)
+		return ERR_PTR(-ENOMEM);
+
+	nbytes = min_t(size_t, *count, PAGE_SIZE);
+	if (copy_from_user(buf, user_buf, nbytes)) {
+		free_page((unsigned long)buf);
+		return ERR_PTR(-EFAULT);
+	}
+
+	*count = nbytes;
+	return buf;
+}
+
+static bool parse_line(char **line, u32 *offs, u32 *val, int short_fmt_len,
+		       int long_fmt_len)
+{
+	char *token;
+	u32 v[5];
+	int ret;
+
+	token = strsep(line, "\n");
+	if (!token)
+		return false;
+
+	/*
+	 * For Adapter/Router configuration space:
+	 * Short format is: offset value\n
+	 *		    v[0]   v[1]
+	 * Long format as produced from the read side:
+	 * offset relative_offset cap_id vs_cap_id value\n
+	 * v[0]   v[1]            v[2]   v[3]      v[4]
+	 *
+	 * For Counter configuration space:
+	 * Short format is: offset\n
+	 *		    v[0]
+	 * Long format as produced from the read side:
+	 * offset relative_offset counter_id value\n
+	 * v[0]   v[1]            v[2]       v[3]
+	 */
+	ret = sscanf(token, "%i %i %i %i %i", &v[0], &v[1], &v[2], &v[3], &v[4]);
+	/* In case of Counters, clear counter, "val" content is NA */
+	if (ret == short_fmt_len) {
+		*offs = v[0];
+		*val = v[short_fmt_len - 1];
+		return true;
+	} else if (ret == long_fmt_len) {
+		*offs = v[0];
+		*val = v[long_fmt_len - 1];
+		return true;
+	}
+
+	return false;
+}
+
+#if IS_ENABLED(CONFIG_USB4_DEBUGFS_WRITE)
+static ssize_t regs_write(struct tb_switch *sw, struct tb_port *port,
+			  const char __user *user_buf, size_t count,
+			  loff_t *ppos)
+{
+	struct tb *tb = sw->tb;
+	char *line, *buf;
+	u32 val, offset;
+	int ret = 0;
+
+	buf = validate_and_copy_from_user(user_buf, &count);
+	if (IS_ERR(buf))
+		return PTR_ERR(buf);
+
+	pm_runtime_get_sync(&sw->dev);
+
+	if (mutex_lock_interruptible(&tb->lock)) {
+		ret = -ERESTARTSYS;
+		goto out;
+	}
+
+	/* User did hardware changes behind the driver's back */
+	add_taint(TAINT_USER, LOCKDEP_STILL_OK);
+
+	line = buf;
+	while (parse_line(&line, &offset, &val, 2, 5)) {
+		if (port)
+			ret = tb_port_write(port, &val, TB_CFG_PORT, offset, 1);
+		else
+			ret = tb_sw_write(sw, &val, TB_CFG_SWITCH, offset, 1);
+		if (ret)
+			break;
+	}
+
+	mutex_unlock(&tb->lock);
+
+out:
+	pm_runtime_mark_last_busy(&sw->dev);
+	pm_runtime_put_autosuspend(&sw->dev);
+	free_page((unsigned long)buf);
+
+	return ret < 0 ? ret : count;
+}
+
+static ssize_t port_regs_write(struct file *file, const char __user *user_buf,
+			       size_t count, loff_t *ppos)
+{
+	struct seq_file *s = file->private_data;
+	struct tb_port *port = s->private;
+
+	return regs_write(port->sw, port, user_buf, count, ppos);
+}
+
+static ssize_t switch_regs_write(struct file *file, const char __user *user_buf,
+				 size_t count, loff_t *ppos)
+{
+	struct seq_file *s = file->private_data;
+	struct tb_switch *sw = s->private;
+
+	return regs_write(sw, NULL, user_buf, count, ppos);
+}
+#define DEBUGFS_MODE		0600
+#else
+#define port_regs_write		NULL
+#define switch_regs_write	NULL
+#define DEBUGFS_MODE		0400
+#endif
+
+static int port_clear_all_counters(struct tb_port *port)
+{
+	u32 *buf;
+	int ret;
+
+	buf = kcalloc(COUNTER_SET_LEN * port->config.max_counters, sizeof(u32),
+		      GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	ret = tb_port_write(port, buf, TB_CFG_COUNTERS, 0,
+			    COUNTER_SET_LEN * port->config.max_counters);
+	kfree(buf);
+
+	return ret;
+}
+
+static ssize_t counters_write(struct file *file, const char __user *user_buf,
+			      size_t count, loff_t *ppos)
+{
+	struct seq_file *s = file->private_data;
+	struct tb_port *port = s->private;
+	struct tb_switch *sw = port->sw;
+	struct tb *tb = port->sw->tb;
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
+		goto out;
+	}
+
+	/* If written delimiter only, clear all counters in one shot */
+	if (buf[0] == '\n') {
+		ret = port_clear_all_counters(port);
+	} else  {
+		char *line = buf;
+		u32 val, offset;
+
+		while (parse_line(&line, &offset, &val, 1, 4)) {
+			ret = tb_port_write(port, &val, TB_CFG_COUNTERS,
+					    offset, 1);
+			if (ret)
+				break;
+		}
+	}
+
+	mutex_unlock(&tb->lock);
+
+out:
+	pm_runtime_mark_last_busy(&sw->dev);
+	pm_runtime_put_autosuspend(&sw->dev);
+	free_page((unsigned long)buf);
+
+	return ret < 0 ? ret : count;
+}
+
+static void cap_show(struct seq_file *s, struct tb_switch *sw,
+		     struct tb_port *port, unsigned int cap, u8 cap_id,
+		     u8 vsec_id, int length)
+{
+	int ret, offset = 0;
+
+	while (length > 0) {
+		int i, dwords = min(length, TB_MAX_CONFIG_RW_LENGTH);
+		u32 data[TB_MAX_CONFIG_RW_LENGTH];
+
+		if (port)
+			ret = tb_port_read(port, data, TB_CFG_PORT, cap + offset,
+					   dwords);
+		else
+			ret = tb_sw_read(sw, data, TB_CFG_SWITCH, cap + offset, dwords);
+		if (ret) {
+			seq_printf(s, "0x%04x <not accessible>\n",
+				   cap + offset);
+			if (dwords > 1)
+				seq_printf(s, "0x%04x ...\n", cap + offset + 1);
+			return;
+		}
+
+		for (i = 0; i < dwords; i++) {
+			seq_printf(s, "0x%04x %4d 0x%02x 0x%02x 0x%08x\n",
+				   cap + offset + i, offset + i,
+				   cap_id, vsec_id, data[i]);
+		}
+
+		length -= dwords;
+		offset += dwords;
+	}
+}
+
+static void port_cap_show(struct tb_port *port, struct seq_file *s,
+			  unsigned int cap)
+{
+	struct tb_cap_any header;
+	u8 vsec_id = 0;
+	size_t length;
+	int ret;
+
+	ret = tb_port_read(port, &header, TB_CFG_PORT, cap, 1);
+	if (ret) {
+		seq_printf(s, "0x%04x <capability read failed>\n", cap);
+		return;
+	}
+
+	switch (header.basic.cap) {
+	case TB_PORT_CAP_PHY:
+		length = PORT_CAP_LANE_LEN;
+		break;
+
+	case TB_PORT_CAP_TIME1:
+		length = PORT_CAP_TMU_LEN;
+		break;
+
+	case TB_PORT_CAP_POWER:
+		length = PORT_CAP_POWER_LEN;
+		break;
+
+	case TB_PORT_CAP_ADAP:
+		if (tb_port_is_pcie_down(port) || tb_port_is_pcie_up(port)) {
+			length = PORT_CAP_PCIE_LEN;
+		} else if (tb_port_is_dpin(port) || tb_port_is_dpout(port)) {
+			length = PORT_CAP_DP_LEN;
+		} else if (tb_port_is_usb3_down(port) ||
+			   tb_port_is_usb3_up(port)) {
+			length = PORT_CAP_USB3_LEN;
+		} else {
+			seq_printf(s, "0x%04x <unsupported capability 0x%02x>\n",
+				   cap, header.basic.cap);
+			return;
+		}
+		break;
+
+	case TB_PORT_CAP_VSE:
+		if (!header.extended_short.length) {
+			ret = tb_port_read(port, (u32 *)&header + 1, TB_CFG_PORT,
+					   cap + 1, 1);
+			if (ret) {
+				seq_printf(s, "0x%04x <capability read failed>\n",
+					   cap + 1);
+				return;
+			}
+			length = header.extended_long.length;
+			vsec_id = header.extended_short.vsec_id;
+		} else {
+			length = header.extended_short.length;
+			vsec_id = header.extended_short.vsec_id;
+			/*
+			 * Ice Lake and Tiger Lake do not implement the
+			 * full length of the capability, only first 32
+			 * dwords so hard-code it here.
+			 */
+			if (!vsec_id &&
+			    (tb_switch_is_ice_lake(port->sw) ||
+			     tb_switch_is_tiger_lake(port->sw)))
+				length = 32;
+		}
+		break;
+
+	case TB_PORT_CAP_USB4:
+		length = PORT_CAP_USB4_LEN;
+		break;
+
+	default:
+		seq_printf(s, "0x%04x <unsupported capability 0x%02x>\n",
+			   cap, header.basic.cap);
+		return;
+	}
+
+	cap_show(s, NULL, port, cap, header.basic.cap, vsec_id, length);
+}
+
+static void port_caps_show(struct tb_port *port, struct seq_file *s)
+{
+	int cap;
+
+	cap = tb_port_next_cap(port, 0);
+	while (cap > 0) {
+		port_cap_show(port, s, cap);
+		cap = tb_port_next_cap(port, cap);
+	}
+}
+
+static int port_basic_regs_show(struct tb_port *port, struct seq_file *s)
+{
+	u32 data[PORT_CAP_BASIC_LEN];
+	int ret, i;
+
+	ret = tb_port_read(port, data, TB_CFG_PORT, 0, ARRAY_SIZE(data));
+	if (ret)
+		return ret;
+
+	for (i = 0; i < ARRAY_SIZE(data); i++)
+		seq_printf(s, "0x%04x %4d 0x00 0x00 0x%08x\n", i, i, data[i]);
+
+	return 0;
+}
+
+static int port_regs_show(struct seq_file *s, void *not_used)
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
+	seq_puts(s, "# offset relative_offset cap_id vs_cap_id value\n");
+
+	ret = port_basic_regs_show(port, s);
+	if (ret)
+		goto out_unlock;
+
+	port_caps_show(port, s);
+
+out_unlock:
+	mutex_unlock(&tb->lock);
+out_rpm_put:
+	pm_runtime_mark_last_busy(&sw->dev);
+	pm_runtime_put_autosuspend(&sw->dev);
+
+	return ret;
+}
+DEBUGFS_ATTR_RW(port_regs);
+
+static void switch_cap_show(struct tb_switch *sw, struct seq_file *s,
+			    unsigned int cap)
+{
+	struct tb_cap_any header;
+	int ret, length;
+	u8 vsec_id = 0;
+
+	ret = tb_sw_read(sw, &header, TB_CFG_SWITCH, cap, 1);
+	if (ret) {
+		seq_printf(s, "0x%04x <capability read failed>\n", cap);
+		return;
+	}
+
+	if (header.basic.cap == TB_SWITCH_CAP_VSE) {
+		if (!header.extended_short.length) {
+			ret = tb_sw_read(sw, (u32 *)&header + 1, TB_CFG_SWITCH,
+					 cap + 1, 1);
+			if (ret) {
+				seq_printf(s, "0x%04x <capability read failed>\n",
+					   cap + 1);
+				return;
+			}
+			length = header.extended_long.length;
+		} else {
+			length = header.extended_short.length;
+		}
+		vsec_id = header.extended_short.vsec_id;
+	} else {
+		if (header.basic.cap == TB_SWITCH_CAP_TMU) {
+			length = SWITCH_CAP_TMU_LEN;
+		} else  {
+			seq_printf(s, "0x%04x <unknown capability 0x%02x>\n",
+				   cap, header.basic.cap);
+			return;
+		}
+	}
+
+	cap_show(s, sw, NULL, cap, header.basic.cap, vsec_id, length);
+}
+
+static void switch_caps_show(struct tb_switch *sw, struct seq_file *s)
+{
+	int cap;
+
+	cap = tb_switch_next_cap(sw, 0);
+	while (cap > 0) {
+		switch_cap_show(sw, s, cap);
+		cap = tb_switch_next_cap(sw, cap);
+	}
+}
+
+static int switch_basic_regs_show(struct tb_switch *sw, struct seq_file *s)
+{
+	u32 data[SWITCH_CAP_BASIC_LEN];
+	size_t dwords;
+	int ret, i;
+
+	/* Only USB4 has the additional registers */
+	if (tb_switch_is_usb4(sw))
+		dwords = ARRAY_SIZE(data);
+	else
+		dwords = 7;
+
+	ret = tb_sw_read(sw, data, TB_CFG_SWITCH, 0, dwords);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < dwords; i++)
+		seq_printf(s, "0x%04x %4d 0x00 0x00 0x%08x\n", i, i, data[i]);
+
+	return 0;
+}
+
+static int switch_regs_show(struct seq_file *s, void *not_used)
+{
+	struct tb_switch *sw = s->private;
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
+	seq_puts(s, "# offset relative_offset cap_id vs_cap_id value\n");
+
+	ret = switch_basic_regs_show(sw, s);
+	if (ret)
+		goto out_unlock;
+
+	switch_caps_show(sw, s);
+
+out_unlock:
+	mutex_unlock(&tb->lock);
+out_rpm_put:
+	pm_runtime_mark_last_busy(&sw->dev);
+	pm_runtime_put_autosuspend(&sw->dev);
+
+	return ret;
+}
+DEBUGFS_ATTR_RW(switch_regs);
+
+static int path_show_one(struct tb_port *port, struct seq_file *s, int hopid)
+{
+	u32 data[PATH_LEN];
+	int ret, i;
+
+	ret = tb_port_read(port, data, TB_CFG_HOPS, hopid * PATH_LEN,
+			   ARRAY_SIZE(data));
+	if (ret) {
+		seq_printf(s, "0x%04x <not accessible>\n", hopid * PATH_LEN);
+		return ret;
+	}
+
+	for (i = 0; i < ARRAY_SIZE(data); i++) {
+		seq_printf(s, "0x%04x %4d 0x%02x 0x%08x\n",
+			   hopid * PATH_LEN + i, i, hopid, data[i]);
+	}
+
+	return 0;
+}
+
+static int path_show(struct seq_file *s, void *not_used)
+{
+	struct tb_port *port = s->private;
+	struct tb_switch *sw = port->sw;
+	struct tb *tb = sw->tb;
+	int start, i, ret = 0;
+
+	pm_runtime_get_sync(&sw->dev);
+
+	if (mutex_lock_interruptible(&tb->lock)) {
+		ret = -ERESTARTSYS;
+		goto out_rpm_put;
+	}
+
+	seq_puts(s, "# offset relative_offset in_hop_id value\n");
+
+	/* NHI and lane adapters have entry for path 0 */
+	if (tb_port_is_null(port) || tb_port_is_nhi(port)) {
+		ret = path_show_one(port, s, 0);
+		if (ret)
+			goto out_unlock;
+	}
+
+	start = tb_port_is_nhi(port) ? 1 : TB_PATH_MIN_HOPID;
+
+	for (i = start; i <= port->config.max_in_hop_id; i++) {
+		ret = path_show_one(port, s, i);
+		if (ret)
+			break;
+	}
+
+out_unlock:
+	mutex_unlock(&tb->lock);
+out_rpm_put:
+	pm_runtime_mark_last_busy(&sw->dev);
+	pm_runtime_put_autosuspend(&sw->dev);
+
+	return ret;
+}
+DEBUGFS_ATTR_RO(path);
+
+static int counter_set_regs_show(struct tb_port *port, struct seq_file *s,
+				 int counter)
+{
+	u32 data[COUNTER_SET_LEN];
+	int ret, i;
+
+	ret = tb_port_read(port, data, TB_CFG_COUNTERS,
+			   counter * COUNTER_SET_LEN, ARRAY_SIZE(data));
+	if (ret) {
+		seq_printf(s, "0x%04x <not accessible>\n",
+			   counter * COUNTER_SET_LEN);
+		return ret;
+	}
+
+	for (i = 0; i < ARRAY_SIZE(data); i++) {
+		seq_printf(s, "0x%04x %4d 0x%02x 0x%08x\n",
+			   counter * COUNTER_SET_LEN + i, i, counter, data[i]);
+	}
+
+	return 0;
+}
+
+static int counters_show(struct seq_file *s, void *not_used)
+{
+	struct tb_port *port = s->private;
+	struct tb_switch *sw = port->sw;
+	struct tb *tb = sw->tb;
+	int i, ret = 0;
+
+	pm_runtime_get_sync(&sw->dev);
+
+	if (mutex_lock_interruptible(&tb->lock)) {
+		ret = -ERESTARTSYS;
+		goto out;
+	}
+
+	seq_puts(s, "# offset relative_offset counter_id value\n");
+
+	for (i = 0; i < port->config.max_counters; i++) {
+		ret = counter_set_regs_show(port, s, i);
+		if (ret)
+			break;
+	}
+
+	mutex_unlock(&tb->lock);
+
+out:
+	pm_runtime_mark_last_busy(&sw->dev);
+	pm_runtime_put_autosuspend(&sw->dev);
+
+	return ret;
+}
+DEBUGFS_ATTR_RW(counters);
+
+/**
+ * tb_switch_debugfs_init() - Add debugfs entries for router
+ * @sw: Pointer to the router
+ *
+ * Adds debugfs directories and files for given router.
+ */
+void tb_switch_debugfs_init(struct tb_switch *sw)
+{
+	struct dentry *debugfs_dir;
+	struct tb_port *port;
+
+	debugfs_dir = debugfs_create_dir(dev_name(&sw->dev), tb_debugfs_root);
+	sw->debugfs_dir = debugfs_dir;
+	debugfs_create_file("regs", DEBUGFS_MODE, debugfs_dir, sw,
+			    &switch_regs_fops);
+
+	tb_switch_for_each_port(sw, port) {
+		struct dentry *debugfs_dir;
+		char dir_name[10];
+
+		if (port->disabled)
+			continue;
+		if (port->config.type == TB_TYPE_INACTIVE)
+			continue;
+
+		snprintf(dir_name, sizeof(dir_name), "port%d", port->port);
+		debugfs_dir = debugfs_create_dir(dir_name, sw->debugfs_dir);
+		debugfs_create_file("regs", DEBUGFS_MODE, debugfs_dir,
+				    port, &port_regs_fops);
+		debugfs_create_file("path", 0400, debugfs_dir, port,
+				    &path_fops);
+		if (port->config.counters_support)
+			debugfs_create_file("counters", 0600, debugfs_dir, port,
+					    &counters_fops);
+	}
+}
+
+/**
+ * tb_switch_debugfs_remove() - Remove all router debugfs entries
+ * @sw: Pointer to the router
+ *
+ * Removes all previously added debugfs entries under this router.
+ */
+void tb_switch_debugfs_remove(struct tb_switch *sw)
+{
+	debugfs_remove_recursive(sw->debugfs_dir);
+}
+
+void tb_debugfs_init(void)
+{
+	tb_debugfs_root = debugfs_create_dir("thunderbolt", NULL);
+}
+
+void tb_debugfs_exit(void)
+{
+	debugfs_remove_recursive(tb_debugfs_root);
+}
diff --git a/drivers/thunderbolt/domain.c b/drivers/thunderbolt/domain.c
index 7ca6a2b34ddc..753f98c25a3b 100644
--- a/drivers/thunderbolt/domain.c
+++ b/drivers/thunderbolt/domain.c
@@ -800,12 +800,20 @@ int tb_domain_init(void)
 {
 	int ret;
 
+	tb_debugfs_init();
 	ret = tb_xdomain_init();
 	if (ret)
-		return ret;
+		goto err_debugfs;
 	ret = bus_register(&tb_bus_type);
 	if (ret)
-		tb_xdomain_exit();
+		goto err_xdomain;
+
+	return 0;
+
+err_xdomain:
+	tb_xdomain_exit();
+err_debugfs:
+	tb_debugfs_exit();
 
 	return ret;
 }
@@ -816,4 +824,5 @@ void tb_domain_exit(void)
 	ida_destroy(&tb_domain_ida);
 	tb_nvm_exit();
 	tb_xdomain_exit();
+	tb_debugfs_exit();
 }
diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index d7164843cf8b..6b246945429f 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -2517,6 +2517,7 @@ int tb_switch_add(struct tb_switch *sw)
 		pm_request_autosuspend(&sw->dev);
 	}
 
+	tb_switch_debugfs_init(sw);
 	return 0;
 }
 
@@ -2532,6 +2533,8 @@ void tb_switch_remove(struct tb_switch *sw)
 {
 	struct tb_port *port;
 
+	tb_switch_debugfs_remove(sw);
+
 	if (sw->rpm) {
 		pm_runtime_get_sync(&sw->dev);
 		pm_runtime_disable(&sw->dev);
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index 3035258b3afa..450f9cf16005 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -125,6 +125,7 @@ struct tb_switch_tmu {
  * @rpm: The switch supports runtime PM
  * @authorized: Whether the switch is authorized by user or policy
  * @security_level: Switch supported security level
+ * @debugfs_dir: Pointer to the debugfs structure
  * @key: Contains the key used to challenge the device or %NULL if not
  *	 supported. Size of the key is %TB_SWITCH_KEY_SIZE.
  * @connection_id: Connection ID used with ICM messaging
@@ -166,6 +167,7 @@ struct tb_switch {
 	bool rpm;
 	unsigned int authorized;
 	enum tb_security_level security_level;
+	struct dentry *debugfs_dir;
 	u8 *key;
 	u8 connection_id;
 	u8 connection_key;
@@ -1010,4 +1012,16 @@ void tb_acpi_add_links(struct tb_nhi *nhi);
 static inline void tb_acpi_add_links(struct tb_nhi *nhi) { }
 #endif
 
+#ifdef CONFIG_DEBUG_FS
+void tb_debugfs_init(void);
+void tb_debugfs_exit(void);
+void tb_switch_debugfs_init(struct tb_switch *sw);
+void tb_switch_debugfs_remove(struct tb_switch *sw);
+#else
+static inline void tb_debugfs_init(void) { }
+static inline void tb_debugfs_exit(void) { }
+static inline void tb_switch_debugfs_init(struct tb_switch *sw) { }
+static inline void tb_switch_debugfs_remove(struct tb_switch *sw) { }
+#endif
+
 #endif
diff --git a/drivers/thunderbolt/tb_regs.h b/drivers/thunderbolt/tb_regs.h
index c33751be0f56..e7d9529822fa 100644
--- a/drivers/thunderbolt/tb_regs.h
+++ b/drivers/thunderbolt/tb_regs.h
@@ -39,6 +39,7 @@ enum tb_switch_vse_cap {
 
 enum tb_port_cap {
 	TB_PORT_CAP_PHY			= 0x01,
+	TB_PORT_CAP_POWER		= 0x02,
 	TB_PORT_CAP_TIME1		= 0x03,
 	TB_PORT_CAP_ADAP		= 0x04,
 	TB_PORT_CAP_VSE			= 0x05,
@@ -252,7 +253,8 @@ struct tb_regs_port_header {
 	/* DWORD 1 */
 	u32 first_cap_offset:8;
 	u32 max_counters:11;
-	u32 __unknown1:5;
+	u32 counters_support:1;
+	u32 __unknown1:4;
 	u32 revision:8;
 	/* DWORD 2 */
 	enum tb_port_type type:24;
-- 
2.28.0


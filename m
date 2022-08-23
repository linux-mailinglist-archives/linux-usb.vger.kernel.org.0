Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4451F59E4AC
	for <lists+linux-usb@lfdr.de>; Tue, 23 Aug 2022 15:50:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240963AbiHWNuS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 23 Aug 2022 09:50:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240931AbiHWNuA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 23 Aug 2022 09:50:00 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2F142122A5
        for <linux-usb@vger.kernel.org>; Tue, 23 Aug 2022 03:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661252141; x=1692788141;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Cej1SbtEc2bcPzQ1LJ3YG0ku46vU8F75kFA8QAJSKag=;
  b=Je7URtuDXQdegkxH0JQ+uyLBoZfQTbGyEgi9by7CtKtuK1yOYp6gDc5p
   fikRRBJj+ZewHrQZ7qNelSQYUyfLz5adFZt3gn88cNHy/ToGS+9fjWzED
   9/57FByLP0ZUuoy0NUZ/ue8CUH9KuU6Cfy7vDZC2wslqXRbA86U+LdHiK
   vYOg6LNGsJl5I6OAJZTrdghFvfce/tifgJ8/z768PJo01wvNW89NLgT2e
   7ifQU2XiYg9q0Ri/bUVsDVHTb5rJgRRNwQL+aiV7zfji8rJfR5ihu5soj
   IXUnPslOPUv5wNRqpqvk5f+S0EIiOpAHDearuV/qe+W50DKlDDnXMVBfS
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10447"; a="294444228"
X-IronPort-AV: E=Sophos;i="5.93,257,1654585200"; 
   d="scan'208";a="294444228"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2022 03:53:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,257,1654585200"; 
   d="scan'208";a="609303747"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga002.jf.intel.com with ESMTP; 23 Aug 2022 03:53:39 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 37968238; Tue, 23 Aug 2022 13:53:53 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 4/4] thunderbolt: Add support for receiver lane margining
Date:   Tue, 23 Aug 2022 13:53:52 +0300
Message-Id: <20220823105352.56306-5-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220823105352.56306-1-mika.westerberg@linux.intel.com>
References: <20220823105352.56306-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

USB4 spec defines standard set of registers to be used for receiver lane
margining. This is useful for I/O interface quality and electrical
robustness validation during manufacturing. Expose receiver lane
margining through new debugfs directory "margining" that is added under
each connected USB4 port. Users can then run the margining by writing to
the exposed attributes under that directory.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/Kconfig   |  10 +
 drivers/thunderbolt/debugfs.c | 836 ++++++++++++++++++++++++++++++++++
 drivers/thunderbolt/sb_regs.h |  58 +++
 drivers/thunderbolt/tb.h      |  15 +
 drivers/thunderbolt/usb4.c    | 120 +++++
 drivers/thunderbolt/xdomain.c |   4 +
 6 files changed, 1043 insertions(+)

diff --git a/drivers/thunderbolt/Kconfig b/drivers/thunderbolt/Kconfig
index e76a6c173637..d76ba4faca0d 100644
--- a/drivers/thunderbolt/Kconfig
+++ b/drivers/thunderbolt/Kconfig
@@ -27,6 +27,16 @@ config USB4_DEBUGFS_WRITE
 	  Only enable this if you know what you are doing! Never enable
 	  this for production systems or distro kernels.
 
+config USB4_DEBUGFS_MARGINING
+	bool "Expose receiver lane margining operations under USB4 ports (DANGEROUS)"
+	depends on DEBUG_FS
+	depends on USB4_DEBUGFS_WRITE
+	help
+	  Enables hardware and software based receiver lane margining support
+	  under each USB4 port. Used for electrical quality and robustness
+	  validation during manufacturing. Should not be enabled by distro
+	  kernels.
+
 config USB4_KUNIT_TEST
 	bool "KUnit tests" if !KUNIT_ALL_TESTS
 	depends on (USB4=m || KUNIT=y)
diff --git a/drivers/thunderbolt/debugfs.c b/drivers/thunderbolt/debugfs.c
index c850b0ac098c..32cd2023a7f6 100644
--- a/drivers/thunderbolt/debugfs.c
+++ b/drivers/thunderbolt/debugfs.c
@@ -12,6 +12,7 @@
 #include <linux/uaccess.h>
 
 #include "tb.h"
+#include "sb_regs.h"
 
 #define PORT_CAP_PCIE_LEN	1
 #define PORT_CAP_POWER_LEN	2
@@ -187,6 +188,828 @@ static ssize_t switch_regs_write(struct file *file, const char __user *user_buf,
 #define DEBUGFS_MODE		0400
 #endif
 
+#if IS_ENABLED(CONFIG_USB4_DEBUGFS_MARGINING)
+/**
+ * struct tb_margining - Lane margining support
+ * @caps: Port lane margining capabilities
+ * @results: Last lane margining results
+ * @lanes: %0, %1 or %7 (all)
+ * @min_ber_level: Minimum supported BER level contour value
+ * @max_ber_level: Maximum supported BER level contour value
+ * @ber_level: Current BER level contour value
+ * @voltage_steps: Number of mandatory voltage steps
+ * @max_voltage_offset: Maximum mandatory voltage offset (in mV)
+ * @time_steps: Number of time margin steps
+ * @max_time_offset: Maximum time margin offset (in mUI)
+ * @software: %true if software margining is used instead of hardware
+ * @time: %true if time margining is used instead of voltage
+ * @right_high: %false if left/low margin test is performed, %true if
+ *		right/high
+ */
+struct tb_margining {
+	u32 caps[2];
+	u32 results[2];
+	unsigned int lanes;
+	unsigned int min_ber_level;
+	unsigned int max_ber_level;
+	unsigned int ber_level;
+	unsigned int voltage_steps;
+	unsigned int max_voltage_offset;
+	unsigned int time_steps;
+	unsigned int max_time_offset;
+	bool software;
+	bool time;
+	bool right_high;
+};
+
+static bool supports_software(const struct usb4_port *usb4)
+{
+	return usb4->margining->caps[0] & USB4_MARGIN_CAP_0_MODES_SW;
+}
+
+static bool supports_hardware(const struct usb4_port *usb4)
+{
+	return usb4->margining->caps[0] & USB4_MARGIN_CAP_0_MODES_HW;
+}
+
+static bool both_lanes(const struct usb4_port *usb4)
+{
+	return usb4->margining->caps[0] & USB4_MARGIN_CAP_0_2_LANES;
+}
+
+static unsigned int independent_voltage_margins(const struct usb4_port *usb4)
+{
+	return (usb4->margining->caps[0] & USB4_MARGIN_CAP_0_VOLTAGE_INDP_MASK) >>
+		USB4_MARGIN_CAP_0_VOLTAGE_INDP_SHIFT;
+}
+
+static bool supports_time(const struct usb4_port *usb4)
+{
+	return usb4->margining->caps[0] & USB4_MARGIN_CAP_0_TIME;
+}
+
+/* Only applicable if supports_time() returns true */
+static unsigned int independent_time_margins(const struct usb4_port *usb4)
+{
+	return (usb4->margining->caps[1] & USB4_MARGIN_CAP_1_TIME_INDP_MASK) >>
+		USB4_MARGIN_CAP_1_TIME_INDP_SHIFT;
+}
+
+static ssize_t
+margining_ber_level_write(struct file *file, const char __user *user_buf,
+			   size_t count, loff_t *ppos)
+{
+	struct seq_file *s = file->private_data;
+	struct tb_port *port = s->private;
+	struct usb4_port *usb4 = port->usb4;
+	struct tb *tb = port->sw->tb;
+	unsigned int val;
+	int ret = 0;
+	char *buf;
+
+	if (mutex_lock_interruptible(&tb->lock))
+		return -ERESTARTSYS;
+
+	if (usb4->margining->software) {
+		ret = -EINVAL;
+		goto out_unlock;
+	}
+
+	buf = validate_and_copy_from_user(user_buf, &count);
+	if (IS_ERR(buf)) {
+		ret = PTR_ERR(buf);
+		goto out_unlock;
+	}
+
+	buf[count - 1] = '\0';
+
+	ret = kstrtouint(buf, 10, &val);
+	if (ret)
+		goto out_free;
+
+	if (val < usb4->margining->min_ber_level ||
+	    val > usb4->margining->max_ber_level) {
+		ret = -EINVAL;
+		goto out_free;
+	}
+
+	usb4->margining->ber_level = val;
+
+out_free:
+	free_page((unsigned long)buf);
+out_unlock:
+	mutex_unlock(&tb->lock);
+
+	return ret < 0 ? ret : count;
+}
+
+static void ber_level_show(struct seq_file *s, unsigned int val)
+{
+	if (val % 2)
+		seq_printf(s, "3 * 1e%d (%u)\n", -12 + (val + 1) / 2, val);
+	else
+		seq_printf(s, "1e%d (%u)\n", -12 + val / 2, val);
+}
+
+static int margining_ber_level_show(struct seq_file *s, void *not_used)
+{
+	struct tb_port *port = s->private;
+	struct usb4_port *usb4 = port->usb4;
+
+	if (usb4->margining->software)
+		return -EINVAL;
+	ber_level_show(s, usb4->margining->ber_level);
+	return 0;
+}
+DEBUGFS_ATTR_RW(margining_ber_level);
+
+static int margining_caps_show(struct seq_file *s, void *not_used)
+{
+	struct tb_port *port = s->private;
+	struct usb4_port *usb4 = port->usb4;
+	struct tb *tb = port->sw->tb;
+	u32 cap0, cap1;
+
+	if (mutex_lock_interruptible(&tb->lock))
+		return -ERESTARTSYS;
+
+	/* Dump the raw caps first */
+	cap0 = usb4->margining->caps[0];
+	seq_printf(s, "0x%08x\n", cap0);
+	cap1 = usb4->margining->caps[1];
+	seq_printf(s, "0x%08x\n", cap1);
+
+	seq_printf(s, "# software margining: %s\n",
+		   supports_software(usb4) ? "yes" : "no");
+	if (supports_hardware(usb4)) {
+		seq_puts(s, "# hardware margining: yes\n");
+		seq_puts(s, "# minimum BER level contour: ");
+		ber_level_show(s, usb4->margining->min_ber_level);
+		seq_puts(s, "# maximum BER level contour: ");
+		ber_level_show(s, usb4->margining->max_ber_level);
+	} else {
+		seq_puts(s, "# hardware margining: no\n");
+	}
+
+	seq_printf(s, "# both lanes simultaneusly: %s\n",
+		  both_lanes(usb4) ? "yes" : "no");
+	seq_printf(s, "# voltage margin steps: %u\n",
+		   usb4->margining->voltage_steps);
+	seq_printf(s, "# maximum voltage offset: %u mV\n",
+		   usb4->margining->max_voltage_offset);
+
+	switch (independent_voltage_margins(usb4)) {
+	case USB4_MARGIN_CAP_0_VOLTAGE_MIN:
+		seq_puts(s, "# returns minimum between high and low voltage margins\n");
+		break;
+	case USB4_MARGIN_CAP_0_VOLTAGE_HL:
+		seq_puts(s, "# returns high or low voltage margin\n");
+		break;
+	case USB4_MARGIN_CAP_0_VOLTAGE_BOTH:
+		seq_puts(s, "# returns both hight and low margings\n");
+		break;
+	}
+
+	if (supports_time(usb4)) {
+		seq_puts(s, "# time margining: yes\n");
+		seq_printf(s, "# time margining is destructive: %s\n",
+			   cap1 & USB4_MARGIN_CAP_1_TIME_DESTR ? "yes" : "no");
+
+		switch (independent_time_margins(usb4)) {
+		case USB4_MARGIN_CAP_1_TIME_MIN:
+			seq_puts(s, "# returns minimum between left and right time margins\n");
+			break;
+		case USB4_MARGIN_CAP_1_TIME_LR:
+			seq_puts(s, "# returns left or right margin\n");
+			break;
+		case USB4_MARGIN_CAP_1_TIME_BOTH:
+			seq_puts(s, "# returns both left and right margins\n");
+			break;
+		}
+
+		seq_printf(s, "# time margin steps: %u\n",
+			   usb4->margining->time_steps);
+		seq_printf(s, "# maximum time offset: %u mUI\n",
+			   usb4->margining->max_time_offset);
+	} else {
+		seq_puts(s, "# time margining: no\n");
+	}
+
+	mutex_unlock(&tb->lock);
+	return 0;
+}
+DEBUGFS_ATTR_RO(margining_caps);
+
+static ssize_t
+margining_lanes_write(struct file *file, const char __user *user_buf,
+		      size_t count, loff_t *ppos)
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
+	if (mutex_lock_interruptible(&tb->lock)) {
+		ret = -ERESTARTSYS;
+		goto out_free;
+	}
+
+	if (!strcmp(buf, "0")) {
+		usb4->margining->lanes = 0;
+	} else if (!strcmp(buf, "1")) {
+		usb4->margining->lanes = 1;
+	} else if (!strcmp(buf, "all")) {
+		/* Needs to be supported */
+		if (both_lanes(usb4))
+			usb4->margining->lanes = 7;
+		else
+			ret = -EINVAL;
+	} else {
+		ret = -EINVAL;
+	}
+
+	mutex_unlock(&tb->lock);
+
+out_free:
+	free_page((unsigned long)buf);
+	return ret < 0 ? ret : count;
+}
+
+static int margining_lanes_show(struct seq_file *s, void *not_used)
+{
+	struct tb_port *port = s->private;
+	struct usb4_port *usb4 = port->usb4;
+	struct tb *tb = port->sw->tb;
+	unsigned int lanes;
+
+	if (mutex_lock_interruptible(&tb->lock))
+		return -ERESTARTSYS;
+
+	lanes = usb4->margining->lanes;
+	if (both_lanes(usb4)) {
+		if (!lanes)
+			seq_puts(s, "[0] 1 all\n");
+		else if (lanes == 1)
+			seq_puts(s, "0 [1] all\n");
+		else
+			seq_puts(s, "0 1 [all]\n");
+	} else {
+		if (!lanes)
+			seq_puts(s, "[0] 1\n");
+		else
+			seq_puts(s, "0 [1]\n");
+	}
+
+	mutex_unlock(&tb->lock);
+	return 0;
+}
+DEBUGFS_ATTR_RW(margining_lanes);
+
+static ssize_t margining_mode_write(struct file *file,
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
+	if (mutex_lock_interruptible(&tb->lock)) {
+		ret = -ERESTARTSYS;
+		goto out_free;
+	}
+
+	if (!strcmp(buf, "software")) {
+		if (supports_software(usb4))
+			usb4->margining->software = true;
+		else
+			ret = -EINVAL;
+	} else if (!strcmp(buf, "hardware")) {
+		if (supports_hardware(usb4))
+			usb4->margining->software = false;
+		else
+			ret = -EINVAL;
+	} else {
+		ret = -EINVAL;
+	}
+
+	mutex_unlock(&tb->lock);
+
+out_free:
+	free_page((unsigned long)buf);
+	return ret ? ret : count;
+}
+
+static int margining_mode_show(struct seq_file *s, void *not_used)
+{
+	const struct tb_port *port = s->private;
+	const struct usb4_port *usb4 = port->usb4;
+	struct tb *tb = port->sw->tb;
+	const char *space = "";
+
+	if (mutex_lock_interruptible(&tb->lock))
+		return -ERESTARTSYS;
+
+	if (supports_software(usb4)) {
+		if (usb4->margining->software)
+			seq_puts(s, "[software]");
+		else
+			seq_puts(s, "software");
+		space = " ";
+	}
+	if (supports_hardware(usb4)) {
+		if (usb4->margining->software)
+			seq_printf(s, "%shardware", space);
+		else
+			seq_printf(s, "%s[hardware]", space);
+	}
+
+	mutex_unlock(&tb->lock);
+
+	seq_puts(s, "\n");
+	return 0;
+}
+DEBUGFS_ATTR_RW(margining_mode);
+
+static int margining_run_write(void *data, u64 val)
+{
+	struct tb_port *port = data;
+	struct usb4_port *usb4 = port->usb4;
+	struct tb_switch *sw = port->sw;
+	struct tb_margining *margining;
+	struct tb *tb = sw->tb;
+	int ret;
+
+	if (val != 1)
+		return -EINVAL;
+
+	pm_runtime_get_sync(&sw->dev);
+
+	if (mutex_lock_interruptible(&tb->lock)) {
+		ret = -ERESTARTSYS;
+		goto out_rpm_put;
+	}
+
+	/*
+	 * CL states may interfere with lane margining so inform the user know
+	 * and bail out.
+	 */
+	if (tb_port_are_clx_enabled(port)) {
+		tb_port_warn(port,
+			     "CL states are enabled, Disable them with clx=0 and re-connect\n");
+		ret = -EINVAL;
+		goto out_unlock;
+	}
+
+	margining = usb4->margining;
+
+	if (margining->software) {
+		tb_port_dbg(port, "running software %s lane margining for lanes %u\n",
+			    margining->time ? "time" : "voltage", margining->lanes);
+		ret = usb4_port_sw_margin(port, margining->lanes, margining->time,
+					  margining->right_high,
+					  USB4_MARGIN_SW_COUNTER_CLEAR);
+		if (ret)
+			goto out_unlock;
+
+		ret = usb4_port_sw_margin_errors(port, &margining->results[0]);
+	} else {
+		tb_port_dbg(port, "running hardware %s lane margining for lanes %u\n",
+			    margining->time ? "time" : "voltage", margining->lanes);
+		/* Clear the results */
+		margining->results[0] = 0;
+		margining->results[1] = 0;
+		ret = usb4_port_hw_margin(port, margining->lanes,
+					  margining->ber_level, margining->time,
+					  margining->right_high, margining->results);
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
+DEFINE_DEBUGFS_ATTRIBUTE(margining_run_fops, NULL, margining_run_write,
+			 "%llu\n");
+
+static ssize_t margining_results_write(struct file *file,
+				       const char __user *user_buf,
+				       size_t count, loff_t *ppos)
+{
+	struct seq_file *s = file->private_data;
+	struct tb_port *port = s->private;
+	struct usb4_port *usb4 = port->usb4;
+	struct tb *tb = port->sw->tb;
+
+	if (mutex_lock_interruptible(&tb->lock))
+		return -ERESTARTSYS;
+
+	/* Just clear the results */
+	usb4->margining->results[0] = 0;
+	usb4->margining->results[1] = 0;
+
+	mutex_unlock(&tb->lock);
+	return count;
+}
+
+static void voltage_margin_show(struct seq_file *s,
+				const struct tb_margining *margining, u8 val)
+{
+	unsigned int tmp, voltage;
+
+	tmp = val & USB4_MARGIN_HW_RES_1_MARGIN_MASK;
+	voltage = tmp * margining->max_voltage_offset / margining->voltage_steps;
+	seq_printf(s, "%u mV (%u)", voltage, tmp);
+	if (val & USB4_MARGIN_HW_RES_1_EXCEEDS)
+		seq_puts(s, " exceeds maximum");
+	seq_puts(s, "\n");
+}
+
+static void time_margin_show(struct seq_file *s,
+			     const struct tb_margining *margining, u8 val)
+{
+	unsigned int tmp, interval;
+
+	tmp = val & USB4_MARGIN_HW_RES_1_MARGIN_MASK;
+	interval = tmp * margining->max_time_offset / margining->time_steps;
+	seq_printf(s, "%u mUI (%u)", interval, tmp);
+	if (val & USB4_MARGIN_HW_RES_1_EXCEEDS)
+		seq_puts(s, " exceeds maximum");
+	seq_puts(s, "\n");
+}
+
+static int margining_results_show(struct seq_file *s, void *not_used)
+{
+	struct tb_port *port = s->private;
+	struct usb4_port *usb4 = port->usb4;
+	struct tb_margining *margining;
+	struct tb *tb = port->sw->tb;
+
+	if (mutex_lock_interruptible(&tb->lock))
+		return -ERESTARTSYS;
+
+	margining = usb4->margining;
+	/* Dump the raw results first */
+	seq_printf(s, "0x%08x\n", margining->results[0]);
+	/* Only the hardware margining has two result dwords */
+	if (!margining->software) {
+		unsigned int val;
+
+		seq_printf(s, "0x%08x\n", margining->results[1]);
+
+		if (margining->time) {
+			if (!margining->lanes || margining->lanes == 7) {
+				val = margining->results[1];
+				seq_puts(s, "# lane 0 right time margin: ");
+				time_margin_show(s, margining, val);
+				val = margining->results[1] >>
+					USB4_MARGIN_HW_RES_1_L0_LL_MARGIN_SHIFT;
+				seq_puts(s, "# lane 0 left time margin: ");
+				time_margin_show(s, margining, val);
+			}
+			if (margining->lanes == 1 || margining->lanes == 7) {
+				val = margining->results[1] >>
+					USB4_MARGIN_HW_RES_1_L1_RH_MARGIN_SHIFT;
+				seq_puts(s, "# lane 1 right time margin: ");
+				time_margin_show(s, margining, val);
+				val = margining->results[1] >>
+					USB4_MARGIN_HW_RES_1_L1_LL_MARGIN_SHIFT;
+				seq_puts(s, "# lane 1 left time margin: ");
+				time_margin_show(s, margining, val);
+			}
+		} else {
+			if (!margining->lanes || margining->lanes == 7) {
+				val = margining->results[1];
+				seq_puts(s, "# lane 0 high voltage margin: ");
+				voltage_margin_show(s, margining, val);
+				val = margining->results[1] >>
+					USB4_MARGIN_HW_RES_1_L0_LL_MARGIN_SHIFT;
+				seq_puts(s, "# lane 0 low voltage margin: ");
+				voltage_margin_show(s, margining, val);
+			}
+			if (margining->lanes == 1 || margining->lanes == 7) {
+				val = margining->results[1] >>
+					USB4_MARGIN_HW_RES_1_L1_RH_MARGIN_SHIFT;
+				seq_puts(s, "# lane 1 high voltage margin: ");
+				voltage_margin_show(s, margining, val);
+				val = margining->results[1] >>
+					USB4_MARGIN_HW_RES_1_L1_LL_MARGIN_SHIFT;
+				seq_puts(s, "# lane 1 low voltage margin: ");
+				voltage_margin_show(s, margining, val);
+			}
+		}
+	}
+
+	mutex_unlock(&tb->lock);
+	return 0;
+}
+DEBUGFS_ATTR_RW(margining_results);
+
+static ssize_t margining_test_write(struct file *file,
+				    const char __user *user_buf,
+				    size_t count, loff_t *ppos)
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
+	if (mutex_lock_interruptible(&tb->lock)) {
+		ret = -ERESTARTSYS;
+		goto out_free;
+	}
+
+	if (!strcmp(buf, "time") && supports_time(usb4))
+		usb4->margining->time = true;
+	else if (!strcmp(buf, "voltage"))
+		usb4->margining->time = false;
+	else
+		ret = -EINVAL;
+
+	mutex_unlock(&tb->lock);
+
+out_free:
+	free_page((unsigned long)buf);
+	return ret ? ret : count;
+}
+
+static int margining_test_show(struct seq_file *s, void *not_used)
+{
+	struct tb_port *port = s->private;
+	struct usb4_port *usb4 = port->usb4;
+	struct tb *tb = port->sw->tb;
+
+	if (mutex_lock_interruptible(&tb->lock))
+		return -ERESTARTSYS;
+
+	if (supports_time(usb4)) {
+		if (usb4->margining->time)
+			seq_puts(s, "voltage [time]\n");
+		else
+			seq_puts(s, "[voltage] time\n");
+	} else {
+		seq_puts(s, "[voltage]\n");
+	}
+
+	mutex_unlock(&tb->lock);
+	return 0;
+}
+DEBUGFS_ATTR_RW(margining_test);
+
+static ssize_t margining_margin_write(struct file *file,
+				    const char __user *user_buf,
+				    size_t count, loff_t *ppos)
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
+	if (mutex_lock_interruptible(&tb->lock)) {
+		ret = -ERESTARTSYS;
+		goto out_free;
+	}
+
+	if (usb4->margining->time) {
+		if (!strcmp(buf, "left"))
+			usb4->margining->right_high = false;
+		else if (!strcmp(buf, "right"))
+			usb4->margining->right_high = true;
+		else
+			ret = -EINVAL;
+	} else {
+		if (!strcmp(buf, "low"))
+			usb4->margining->right_high = false;
+		else if (!strcmp(buf, "high"))
+			usb4->margining->right_high = true;
+		else
+			ret = -EINVAL;
+	}
+
+	mutex_unlock(&tb->lock);
+
+out_free:
+	free_page((unsigned long)buf);
+	return ret ? ret : count;
+}
+
+static int margining_margin_show(struct seq_file *s, void *not_used)
+{
+	struct tb_port *port = s->private;
+	struct usb4_port *usb4 = port->usb4;
+	struct tb *tb = port->sw->tb;
+
+	if (mutex_lock_interruptible(&tb->lock))
+		return -ERESTARTSYS;
+
+	if (usb4->margining->time) {
+		if (usb4->margining->right_high)
+			seq_puts(s, "left [right]\n");
+		else
+			seq_puts(s, "[left] right\n");
+	} else {
+		if (usb4->margining->right_high)
+			seq_puts(s, "low [high]\n");
+		else
+			seq_puts(s, "[low] high\n");
+	}
+
+	mutex_unlock(&tb->lock);
+	return 0;
+}
+DEBUGFS_ATTR_RW(margining_margin);
+
+static void margining_port_init(struct tb_port *port)
+{
+	struct tb_margining *margining;
+	struct dentry *dir, *parent;
+	struct usb4_port *usb4;
+	char dir_name[10];
+	unsigned int val;
+	int ret;
+
+	usb4 = port->usb4;
+	if (!usb4)
+		return;
+
+	snprintf(dir_name, sizeof(dir_name), "port%d", port->port);
+	parent = debugfs_lookup(dir_name, port->sw->debugfs_dir);
+
+	margining = kzalloc(sizeof(*margining), GFP_KERNEL);
+	if (!margining)
+		return;
+
+	ret = usb4_port_margining_caps(port, margining->caps);
+	if (ret) {
+		kfree(margining);
+		return;
+	}
+
+	usb4->margining = margining;
+
+	/* Set the initial mode */
+	if (supports_software(usb4))
+		margining->software = true;
+
+	val = (margining->caps[0] & USB4_MARGIN_CAP_0_VOLTAGE_STEPS_MASK) >>
+		USB4_MARGIN_CAP_0_VOLTAGE_STEPS_SHIFT;
+	margining->voltage_steps = val;
+	val = (margining->caps[0] & USB4_MARGIN_CAP_0_MAX_VOLTAGE_OFFSET_MASK) >>
+		USB4_MARGIN_CAP_0_MAX_VOLTAGE_OFFSET_SHIFT;
+	margining->max_voltage_offset = 74 + val * 2;
+
+	if (supports_time(usb4)) {
+		val = (margining->caps[1] & USB4_MARGIN_CAP_1_TIME_STEPS_MASK) >>
+			USB4_MARGIN_CAP_1_TIME_STEPS_SHIFT;
+		margining->time_steps = val;
+		val = (margining->caps[1] & USB4_MARGIN_CAP_1_TIME_OFFSET_MASK) >>
+			USB4_MARGIN_CAP_1_TIME_OFFSET_SHIFT;
+		/*
+		 * Store it as mUI (milli Unit Interval) because we want
+		 * to keep it as integer.
+		 */
+		margining->max_time_offset = 200 + 10 * val;
+	}
+
+	dir = debugfs_create_dir("margining", parent);
+	if (supports_hardware(usb4)) {
+		val = (margining->caps[1] & USB4_MARGIN_CAP_1_MIN_BER_MASK) >>
+			USB4_MARGIN_CAP_1_MIN_BER_SHIFT;
+		margining->min_ber_level = val;
+		val = (margining->caps[1] & USB4_MARGIN_CAP_1_MAX_BER_MASK) >>
+			USB4_MARGIN_CAP_1_MAX_BER_SHIFT;
+		margining->max_ber_level = val;
+
+		/* Set the default to minimum */
+		margining->ber_level = margining->min_ber_level;
+
+		debugfs_create_file("ber_level_contour", 0400, dir, port,
+				    &margining_ber_level_fops);
+	}
+	debugfs_create_file("caps", 0400, dir, port, &margining_caps_fops);
+	debugfs_create_file("lanes", 0600, dir, port, &margining_lanes_fops);
+	debugfs_create_file("mode", 0600, dir, port, &margining_mode_fops);
+	debugfs_create_file("run", 0600, dir, port, &margining_run_fops);
+	debugfs_create_file("results", 0600, dir, port, &margining_results_fops);
+	debugfs_create_file("test", 0600, dir, port, &margining_test_fops);
+	if (independent_voltage_margins(usb4) ||
+	    (supports_time(usb4) && independent_time_margins(usb4)))
+		debugfs_create_file("margin", 0600, dir, port, &margining_margin_fops);
+}
+
+static void margining_port_remove(struct tb_port *port)
+{
+	struct dentry *parent;
+	char dir_name[10];
+
+	if (!port->usb4)
+		return;
+
+	snprintf(dir_name, sizeof(dir_name), "port%d", port->port);
+	parent = debugfs_lookup(dir_name, port->sw->debugfs_dir);
+	debugfs_remove_recursive(debugfs_lookup("margining", parent));
+
+	kfree(port->usb4->margining);
+	port->usb4->margining = NULL;
+}
+
+static void margining_switch_init(struct tb_switch *sw)
+{
+	struct tb_port *upstream, *downstream;
+	struct tb_switch *parent_sw;
+	u64 route = tb_route(sw);
+
+	if (!route)
+		return;
+
+	upstream = tb_upstream_port(sw);
+	parent_sw = tb_switch_parent(sw);
+	downstream = tb_port_at(route, parent_sw);
+
+	margining_port_init(downstream);
+	margining_port_init(upstream);
+}
+
+static void margining_switch_remove(struct tb_switch *sw)
+{
+	struct tb_switch *parent_sw;
+	struct tb_port *downstream;
+	u64 route = tb_route(sw);
+
+	if (!route)
+		return;
+
+	/*
+	 * Upstream is removed with the router itself but we need to
+	 * remove the downstream port margining directory.
+	 */
+	parent_sw = tb_switch_parent(sw);
+	downstream = tb_port_at(route, parent_sw);
+	margining_port_remove(downstream);
+}
+
+static void margining_xdomain_init(struct tb_xdomain *xd)
+{
+	struct tb_switch *parent_sw;
+	struct tb_port *downstream;
+
+	parent_sw = tb_xdomain_parent(xd);
+	downstream = tb_port_at(xd->route, parent_sw);
+
+	margining_port_init(downstream);
+}
+
+static void margining_xdomain_remove(struct tb_xdomain *xd)
+{
+	struct tb_switch *parent_sw;
+	struct tb_port *downstream;
+
+	parent_sw = tb_xdomain_parent(xd);
+	downstream = tb_port_at(xd->route, parent_sw);
+	margining_port_remove(downstream);
+}
+#else
+static inline void margining_switch_init(struct tb_switch *sw) { }
+static inline void margining_switch_remove(struct tb_switch *sw) { }
+static inline void margining_xdomain_init(struct tb_xdomain *xd) { }
+static inline void margining_xdomain_remove(struct tb_xdomain *xd) { }
+#endif
+
 static int port_clear_all_counters(struct tb_port *port)
 {
 	u32 *buf;
@@ -689,6 +1512,8 @@ void tb_switch_debugfs_init(struct tb_switch *sw)
 			debugfs_create_file("counters", 0600, debugfs_dir, port,
 					    &counters_fops);
 	}
+
+	margining_switch_init(sw);
 }
 
 /**
@@ -699,9 +1524,20 @@ void tb_switch_debugfs_init(struct tb_switch *sw)
  */
 void tb_switch_debugfs_remove(struct tb_switch *sw)
 {
+	margining_switch_remove(sw);
 	debugfs_remove_recursive(sw->debugfs_dir);
 }
 
+void tb_xdomain_debugfs_init(struct tb_xdomain *xd)
+{
+	margining_xdomain_init(xd);
+}
+
+void tb_xdomain_debugfs_remove(struct tb_xdomain *xd)
+{
+	margining_xdomain_remove(xd);
+}
+
 /**
  * tb_service_debugfs_init() - Add debugfs directory for service
  * @svc: Thunderbolt service pointer
diff --git a/drivers/thunderbolt/sb_regs.h b/drivers/thunderbolt/sb_regs.h
index bda889ff3bda..5185cf3e4d97 100644
--- a/drivers/thunderbolt/sb_regs.h
+++ b/drivers/thunderbolt/sb_regs.h
@@ -26,10 +26,68 @@ enum usb4_sb_opcode {
 	USB4_SB_OPCODE_NVM_BLOCK_WRITE = 0x574b4c42,		/* "BLKW" */
 	USB4_SB_OPCODE_NVM_AUTH_WRITE = 0x48545541,		/* "AUTH" */
 	USB4_SB_OPCODE_NVM_READ = 0x52524641,			/* "AFRR" */
+	USB4_SB_OPCODE_READ_LANE_MARGINING_CAP = 0x50434452,	/* "RDCP" */
+	USB4_SB_OPCODE_RUN_HW_LANE_MARGINING = 0x474d4852,	/* "RHMG" */
+	USB4_SB_OPCODE_RUN_SW_LANE_MARGINING = 0x474d5352,	/* "RSMG" */
+	USB4_SB_OPCODE_READ_SW_MARGIN_ERR = 0x57534452,		/* "RDSW" */
 };
 
 #define USB4_SB_METADATA			0x09
 #define USB4_SB_METADATA_NVM_AUTH_WRITE_MASK	GENMASK(5, 0)
 #define USB4_SB_DATA				0x12
 
+/* USB4_SB_OPCODE_READ_LANE_MARGINING_CAP */
+#define USB4_MARGIN_CAP_0_MODES_HW		BIT(0)
+#define USB4_MARGIN_CAP_0_MODES_SW		BIT(1)
+#define USB4_MARGIN_CAP_0_2_LANES		BIT(2)
+#define USB4_MARGIN_CAP_0_VOLTAGE_INDP_MASK	GENMASK(4, 3)
+#define USB4_MARGIN_CAP_0_VOLTAGE_INDP_SHIFT	3
+#define USB4_MARGIN_CAP_0_VOLTAGE_MIN		0x0
+#define USB4_MARGIN_CAP_0_VOLTAGE_HL		0x1
+#define USB4_MARGIN_CAP_0_VOLTAGE_BOTH		0x2
+#define USB4_MARGIN_CAP_0_TIME			BIT(5)
+#define USB4_MARGIN_CAP_0_VOLTAGE_STEPS_MASK	GENMASK(12, 6)
+#define USB4_MARGIN_CAP_0_VOLTAGE_STEPS_SHIFT	6
+#define USB4_MARGIN_CAP_0_MAX_VOLTAGE_OFFSET_MASK GENMASK(18, 13)
+#define USB4_MARGIN_CAP_0_MAX_VOLTAGE_OFFSET_SHIFT 13
+#define USB4_MARGIN_CAP_1_TIME_DESTR		BIT(8)
+#define USB4_MARGIN_CAP_1_TIME_INDP_MASK	GENMASK(10, 9)
+#define USB4_MARGIN_CAP_1_TIME_INDP_SHIFT	9
+#define USB4_MARGIN_CAP_1_TIME_MIN		0x0
+#define USB4_MARGIN_CAP_1_TIME_LR		0x1
+#define USB4_MARGIN_CAP_1_TIME_BOTH		0x2
+#define USB4_MARGIN_CAP_1_TIME_STEPS_MASK	GENMASK(15, 11)
+#define USB4_MARGIN_CAP_1_TIME_STEPS_SHIFT	11
+#define USB4_MARGIN_CAP_1_TIME_OFFSET_MASK	GENMASK(20, 16)
+#define USB4_MARGIN_CAP_1_TIME_OFFSET_SHIFT	16
+#define USB4_MARGIN_CAP_1_MIN_BER_MASK		GENMASK(25, 21)
+#define USB4_MARGIN_CAP_1_MIN_BER_SHIFT		21
+#define USB4_MARGIN_CAP_1_MAX_BER_MASK		GENMASK(30, 26)
+#define USB4_MARGIN_CAP_1_MAX_BER_SHIFT		26
+#define USB4_MARGIN_CAP_1_MAX_BER_SHIFT		26
+
+/* USB4_SB_OPCODE_RUN_HW_LANE_MARGINING */
+#define USB4_MARGIN_HW_TIME			BIT(3)
+#define USB4_MARGIN_HW_RH			BIT(4)
+#define USB4_MARGIN_HW_BER_MASK			GENMASK(9, 5)
+#define USB4_MARGIN_HW_BER_SHIFT		5
+
+/* Applicable to all margin values */
+#define USB4_MARGIN_HW_RES_1_MARGIN_MASK	GENMASK(6, 0)
+#define USB4_MARGIN_HW_RES_1_EXCEEDS		BIT(7)
+/* Different lane margin shifts */
+#define USB4_MARGIN_HW_RES_1_L0_LL_MARGIN_SHIFT	8
+#define USB4_MARGIN_HW_RES_1_L1_RH_MARGIN_SHIFT	16
+#define USB4_MARGIN_HW_RES_1_L1_LL_MARGIN_SHIFT	24
+
+/* USB4_SB_OPCODE_RUN_SW_LANE_MARGINING */
+#define USB4_MARGIN_SW_TIME			BIT(3)
+#define USB4_MARGIN_SW_RH			BIT(4)
+#define USB4_MARGIN_SW_COUNTER_MASK		GENMASK(14, 13)
+#define USB4_MARGIN_SW_COUNTER_SHIFT		13
+#define USB4_MARGIN_SW_COUNTER_NOP		0x0
+#define USB4_MARGIN_SW_COUNTER_CLEAR		0x1
+#define USB4_MARGIN_SW_COUNTER_START		0x2
+#define USB4_MARGIN_SW_COUNTER_STOP		0x3
+
 #endif
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index 2154b59c39ec..d334b3a17ae0 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -279,12 +279,16 @@ struct tb_port {
  * @can_offline: Does the port have necessary platform support to moved
  *		 it into offline mode and back
  * @offline: The port is currently in offline mode
+ * @margining: Pointer to margining structure if enabled
  */
 struct usb4_port {
 	struct device dev;
 	struct tb_port *port;
 	bool can_offline;
 	bool offline;
+#ifdef CONFIG_USB4_DEBUGFS_MARGINING
+	struct tb_margining *margining;
+#endif
 };
 
 /**
@@ -1194,6 +1198,13 @@ int usb4_port_router_offline(struct tb_port *port);
 int usb4_port_router_online(struct tb_port *port);
 int usb4_port_enumerate_retimers(struct tb_port *port);
 bool usb4_port_clx_supported(struct tb_port *port);
+int usb4_port_margining_caps(struct tb_port *port, u32 *caps);
+int usb4_port_hw_margin(struct tb_port *port, unsigned int lanes,
+			unsigned int ber_level, bool timing, bool right_high,
+			u32 *results);
+int usb4_port_sw_margin(struct tb_port *port, unsigned int lanes, bool timing,
+			bool right_high, u32 counter);
+int usb4_port_sw_margin_errors(struct tb_port *port, u32 *errors);
 
 int usb4_port_retimer_set_inbound_sbtx(struct tb_port *port, u8 index);
 int usb4_port_retimer_read(struct tb_port *port, u8 index, u8 reg, void *buf,
@@ -1276,6 +1287,8 @@ void tb_debugfs_init(void);
 void tb_debugfs_exit(void);
 void tb_switch_debugfs_init(struct tb_switch *sw);
 void tb_switch_debugfs_remove(struct tb_switch *sw);
+void tb_xdomain_debugfs_init(struct tb_xdomain *xd);
+void tb_xdomain_debugfs_remove(struct tb_xdomain *xd);
 void tb_service_debugfs_init(struct tb_service *svc);
 void tb_service_debugfs_remove(struct tb_service *svc);
 #else
@@ -1283,6 +1296,8 @@ static inline void tb_debugfs_init(void) { }
 static inline void tb_debugfs_exit(void) { }
 static inline void tb_switch_debugfs_init(struct tb_switch *sw) { }
 static inline void tb_switch_debugfs_remove(struct tb_switch *sw) { }
+static inline void tb_xdomain_debugfs_init(struct tb_xdomain *xd) { }
+static inline void tb_xdomain_debugfs_remove(struct tb_xdomain *xd) { }
 static inline void tb_service_debugfs_init(struct tb_service *svc) { }
 static inline void tb_service_debugfs_remove(struct tb_service *svc) { }
 #endif
diff --git a/drivers/thunderbolt/usb4.c b/drivers/thunderbolt/usb4.c
index 3a2e7126db9d..70036f3e37a5 100644
--- a/drivers/thunderbolt/usb4.c
+++ b/drivers/thunderbolt/usb4.c
@@ -1384,6 +1384,126 @@ bool usb4_port_clx_supported(struct tb_port *port)
 	return !!(val & PORT_CS_18_CPS);
 }
 
+/**
+ * usb4_port_margining_caps() - Read USB4 port marginig capabilities
+ * @port: USB4 port
+ * @caps: Array with at least two elements to hold the results
+ *
+ * Reads the USB4 port lane margining capabilities into @caps.
+ */
+int usb4_port_margining_caps(struct tb_port *port, u32 *caps)
+{
+	int ret;
+
+	ret = usb4_port_sb_op(port, USB4_SB_TARGET_ROUTER, 0,
+			      USB4_SB_OPCODE_READ_LANE_MARGINING_CAP, 500);
+	if (ret)
+		return ret;
+
+	return usb4_port_sb_read(port, USB4_SB_TARGET_ROUTER, 0,
+				 USB4_SB_DATA, caps, sizeof(*caps) * 2);
+}
+
+/**
+ * usb4_port_hw_margin() - Run hardware lane margining on port
+ * @port: USB4 port
+ * @lanes: Which lanes to run (must match the port capabilities). Can be
+ *	   %0, %1 or %7.
+ * @ber_level: BER level contour value
+ * @timing: Perform timing margining instead of voltage
+ * @right_high: Use Right/high margin instead of left/low
+ * @results: Array with at least two elements to hold the results
+ *
+ * Runs hardware lane margining on USB4 port and returns the result in
+ * @results.
+ */
+int usb4_port_hw_margin(struct tb_port *port, unsigned int lanes,
+			unsigned int ber_level, bool timing, bool right_high,
+			u32 *results)
+{
+	u32 val;
+	int ret;
+
+	val = lanes;
+	if (timing)
+		val |= USB4_MARGIN_HW_TIME;
+	if (right_high)
+		val |= USB4_MARGIN_HW_RH;
+	if (ber_level)
+		val |= (ber_level << USB4_MARGIN_HW_BER_SHIFT) &
+			USB4_MARGIN_HW_BER_MASK;
+
+	ret = usb4_port_sb_write(port, USB4_SB_TARGET_ROUTER, 0,
+				 USB4_SB_METADATA, &val, sizeof(val));
+	if (ret)
+		return ret;
+
+	ret = usb4_port_sb_op(port, USB4_SB_TARGET_ROUTER, 0,
+			      USB4_SB_OPCODE_RUN_HW_LANE_MARGINING, 2500);
+	if (ret)
+		return ret;
+
+	return usb4_port_sb_read(port, USB4_SB_TARGET_ROUTER, 0,
+				 USB4_SB_DATA, results, sizeof(*results) * 2);
+}
+
+/**
+ * usb4_port_sw_margin() - Run software lane margining on port
+ * @port: USB4 port
+ * @lanes: Which lanes to run (must match the port capabilities). Can be
+ *	   %0, %1 or %7.
+ * @timing: Perform timing margining instead of voltage
+ * @right_high: Use Right/high margin instead of left/low
+ * @counter: What to do with the error counter
+ *
+ * Runs software lane margining on USB4 port. Read back the error
+ * counters by calling usb4_port_sw_margin_errors(). Returns %0 in
+ * success and negative errno otherwise.
+ */
+int usb4_port_sw_margin(struct tb_port *port, unsigned int lanes, bool timing,
+			bool right_high, u32 counter)
+{
+	u32 val;
+	int ret;
+
+	val = lanes;
+	if (timing)
+		val |= USB4_MARGIN_SW_TIME;
+	if (right_high)
+		val |= USB4_MARGIN_SW_RH;
+	val |= (counter << USB4_MARGIN_SW_COUNTER_SHIFT) &
+		USB4_MARGIN_SW_COUNTER_MASK;
+
+	ret = usb4_port_sb_write(port, USB4_SB_TARGET_ROUTER, 0,
+				 USB4_SB_METADATA, &val, sizeof(val));
+	if (ret)
+		return ret;
+
+	return usb4_port_sb_op(port, USB4_SB_TARGET_ROUTER, 0,
+			       USB4_SB_OPCODE_RUN_SW_LANE_MARGINING, 2500);
+}
+
+/**
+ * usb4_port_sw_margin_errors() - Read the software margining error counters
+ * @port: USB4 port
+ * @errors: Error metadata is copied here.
+ *
+ * This reads back the software margining error counters from the port.
+ * Returns %0 in success and negative errno otherwise.
+ */
+int usb4_port_sw_margin_errors(struct tb_port *port, u32 *errors)
+{
+	int ret;
+
+	ret = usb4_port_sb_op(port, USB4_SB_TARGET_ROUTER, 0,
+			      USB4_SB_OPCODE_READ_SW_MARGIN_ERR, 150);
+	if (ret)
+		return ret;
+
+	return usb4_port_sb_read(port, USB4_SB_TARGET_ROUTER, 0,
+				 USB4_SB_METADATA, errors, sizeof(*errors));
+}
+
 static inline int usb4_port_retimer_op(struct tb_port *port, u8 index,
 				       enum usb4_sb_opcode opcode,
 				       int timeout_msec)
diff --git a/drivers/thunderbolt/xdomain.c b/drivers/thunderbolt/xdomain.c
index e4bbc4cb5f97..dcee91f25075 100644
--- a/drivers/thunderbolt/xdomain.c
+++ b/drivers/thunderbolt/xdomain.c
@@ -1435,6 +1435,8 @@ static int tb_xdomain_get_properties(struct tb_xdomain *xd)
 		if (xd->vendor_name && xd->device_name)
 			dev_info(&xd->dev, "%s %s\n", xd->vendor_name,
 				 xd->device_name);
+
+		tb_xdomain_debugfs_init(xd);
 	} else {
 		kobject_uevent(&xd->dev.kobj, KOBJ_CHANGE);
 	}
@@ -1935,6 +1937,8 @@ static int unregister_service(struct device *dev, void *data)
  */
 void tb_xdomain_remove(struct tb_xdomain *xd)
 {
+	tb_xdomain_debugfs_remove(xd);
+
 	stop_handshake(xd);
 
 	device_for_each_child_reverse(&xd->dev, xd, unregister_service);
-- 
2.35.1


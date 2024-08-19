Return-Path: <linux-usb+bounces-13625-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0398956985
	for <lists+linux-usb@lfdr.de>; Mon, 19 Aug 2024 13:41:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 767EE282721
	for <lists+linux-usb@lfdr.de>; Mon, 19 Aug 2024 11:41:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5B73166F32;
	Mon, 19 Aug 2024 11:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IjB2ZW3l"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D37E166F3F
	for <linux-usb@vger.kernel.org>; Mon, 19 Aug 2024 11:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724067664; cv=none; b=oJ7ak1Ae2jUJHF8udfFnmUj2AMAHNFrSDIG/eCCDmxJA8hoH6AjIvhMMz87Hxddtv5vDrPgWVVXANprGbfDkNveKixF1ujz3khbet5SrG9mpawUOur18UGy7fAjk70nBleQHaBEh1LqUAJU1x4gZP8JjdbTmS/ZadXN39HOqxXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724067664; c=relaxed/simple;
	bh=cLAPe3F3bdIqxPk8iGfLAbChAAB+JzuT3yBe/n0kAiI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ALiReoCkuh6s5X2TpmoCFkckeBjy1BLJ8UPlBiLBJ/M18qqcIFGOAecqCH7bJItWG4h7ayEFHFOsWy2ZxpnIPJdDGsNtMeecIsZ8Kz6mm/V/JIhoO1B2/PZqlpWQCacuzbmgKYp/Ehrn2ri/mVo1ctx3H8VG4f80F3KG+YfY3wE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IjB2ZW3l; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724067662; x=1755603662;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cLAPe3F3bdIqxPk8iGfLAbChAAB+JzuT3yBe/n0kAiI=;
  b=IjB2ZW3lLsrPW0gusi6pkbX1lrdz7r3UONQLJJtSFxTD5xOKaRn4olQ+
   RTw68QW4FT4py07YnhVcEBBeUmxPHWJZSyBqP5G/f7pV1NSesGkyS/yav
   L54BCBKoW+tnsRRtiu/iuW1gkIz0eBHc16fcPqlT0E6S+ArWxc2GofqdZ
   NCm6A6rrvt4ZUP3bodQ4vC7HlL8GAUGSWOuYBA2goCfTe7GYCxiQWrg2w
   KZKpOie9o57pH1fNnuxjJhreZxbi9qWyF68+n4q/nWtBZv0DEdhlZtWz8
   HP3eZbz/kyF8hpLmN4z2cHlubCda/sPBI/KN6omhPkdwenwhvxl0MmYvC
   w==;
X-CSE-ConnectionGUID: oUsZt3sqRTuXdRQPBhGBQw==
X-CSE-MsgGUID: 8R0rLe/5QiiUeTMU/Qx/xw==
X-IronPort-AV: E=McAfee;i="6700,10204,11168"; a="33688831"
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; 
   d="scan'208";a="33688831"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2024 04:40:59 -0700
X-CSE-ConnectionGUID: e/uSW8zATXWyCi9fGflzLw==
X-CSE-MsgGUID: xWBAV5u8Qj++WdsRFwxpsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; 
   d="scan'208";a="83566114"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa002.fm.intel.com with ESMTP; 19 Aug 2024 04:40:55 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id B903D644; Mon, 19 Aug 2024 14:40:54 +0300 (EEST)
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
Subject: [PATCH v2 4/4] thunderbolt: Improve software receiver lane margining
Date: Mon, 19 Aug 2024 14:40:54 +0300
Message-ID: <20240819114054.4139941-5-mika.westerberg@linux.intel.com>
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

From: R Kannappan <r.kannappan@intel.com>

USB4 specification defines the metadata needed to perform software
margining, as well as the necessary steps which include waiting for
dwell time.

- Add dwell_time attribute to set the wait time while performing
  margining and checking for link errors.
- Add error_counter attribute to configure error counter prior to
  margining test.
- Add voltage_time_offset attribute to set the voltage or time offset
  steps before performing the software margining test.
- Perform software margining test for dwell duration, break if there are
  link errors, stop the clocks and provide results.

Below is a minimalistic example how this can be used. Note these values
are just examples. The exact values in practice depend on host specific
capabilities and the type of measurement to be performed.

  # cd /sys/kernel/debug/thunderbolt/ROUTER/portX/margining/
  # echo software > mode
  # echo 400 > dwell_time
  # echo 1 > run

As usual the results attribute contains the results of a succesfull run.

Signed-off-by: R Kannappan <r.kannappan@intel.com>
Co-developed-by: Rene Sapiens <rene.sapiens@intel.com>
Signed-off-by: Rene Sapiens <rene.sapiens@intel.com>
Co-developed-by: Aapo Vienamo <aapo.vienamo@linux.intel.com>
Signed-off-by: Aapo Vienamo <aapo.vienamo@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/debugfs.c | 295 ++++++++++++++++++++++++++++++++--
 drivers/thunderbolt/sb_regs.h |   8 +
 drivers/thunderbolt/tb.h      |   2 +
 drivers/thunderbolt/usb4.c    |   1 +
 4 files changed, 290 insertions(+), 16 deletions(-)

diff --git a/drivers/thunderbolt/debugfs.c b/drivers/thunderbolt/debugfs.c
index 9defa69ef3a7..350310bd0fee 100644
--- a/drivers/thunderbolt/debugfs.c
+++ b/drivers/thunderbolt/debugfs.c
@@ -9,6 +9,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/debugfs.h>
+#include <linux/delay.h>
 #include <linux/pm_runtime.h>
 #include <linux/uaccess.h>
 
@@ -34,6 +35,14 @@
 
 #define COUNTER_SET_LEN		3
 
+/*
+ * USB4 spec doesn't specify dwell range, the range of 100 ms to 500 ms
+ * probed to give good results.
+ */
+#define MIN_DWELL_TIME		100 /* ms */
+#define MAX_DWELL_TIME		500 /* ms */
+#define DWELL_SAMPLE_INTERVAL	10
+
 /* Sideband registers and their sizes as defined in the USB4 spec */
 struct sb_reg {
 	unsigned int reg;
@@ -399,6 +408,9 @@ static ssize_t retimer_sb_regs_write(struct file *file,
  *					range (in mV).
  * @time_steps: Number of time margin steps
  * @max_time_offset: Maximum time margin offset (in mUI)
+ * @voltage_time_offset: Offset for voltage / time for software margining
+ * @dwell_time: Dwell time for software margining (in ms)
+ * @error_counter: Error counter operation for software margining
  * @optional_voltage_offset_range: Enable optional extended voltage range
  * @software: %true if software margining is used instead of hardware
  * @time: %true if time margining is used instead of voltage
@@ -422,12 +434,33 @@ struct tb_margining {
 	unsigned int max_voltage_offset_optional_range;
 	unsigned int time_steps;
 	unsigned int max_time_offset;
+	unsigned int voltage_time_offset;
+	unsigned int dwell_time;
+	enum usb4_margin_sw_error_counter error_counter;
 	bool optional_voltage_offset_range;
 	bool software;
 	bool time;
 	bool right_high;
 };
 
+static int margining_modify_error_counter(struct tb_margining *margining,
+	u32 lanes, enum usb4_margin_sw_error_counter error_counter)
+{
+	struct usb4_port_margining_params params = { 0 };
+	struct tb_port *port = margining->port;
+	u32 result;
+
+	if (error_counter != USB4_MARGIN_SW_ERROR_COUNTER_CLEAR &&
+	    error_counter != USB4_MARGIN_SW_ERROR_COUNTER_STOP)
+		return -EOPNOTSUPP;
+
+	params.error_counter = error_counter;
+	params.lanes = lanes;
+
+	return usb4_port_sw_margin(port, margining->target, margining->index,
+				   &params, &result);
+}
+
 static bool supports_software(const struct tb_margining *margining)
 {
 	return margining->caps[0] & USB4_MARGIN_CAP_0_MODES_SW;
@@ -689,9 +722,165 @@ static int margining_lanes_show(struct seq_file *s, void *not_used)
 DEBUGFS_ATTR_RW(margining_lanes);
 
 static ssize_t
-margining_optional_voltage_offset_write(struct file *file,
-				   const char __user *user_buf,
-				   size_t count, loff_t *ppos)
+margining_voltage_time_offset_write(struct file *file,
+				    const char __user *user_buf,
+				    size_t count, loff_t *ppos)
+{
+	struct seq_file *s = file->private_data;
+	struct tb_margining *margining = s->private;
+	struct tb *tb = margining->port->sw->tb;
+	unsigned int max_margin;
+	unsigned int val;
+	int ret;
+
+	ret = kstrtouint_from_user(user_buf, count, 10, &val);
+	if (ret)
+		return ret;
+
+	scoped_cond_guard(mutex_intr, return -ERESTARTSYS, &tb->lock) {
+		if (!margining->software)
+			return -EOPNOTSUPP;
+
+		if (margining->time)
+			max_margin = margining->time_steps;
+		else
+			if (margining->optional_voltage_offset_range)
+				max_margin = margining->voltage_steps_optional_range;
+			else
+				max_margin = margining->voltage_steps;
+
+		margining->voltage_time_offset = clamp(val, 0, max_margin);
+	}
+
+	return count;
+}
+
+static int margining_voltage_time_offset_show(struct seq_file *s,
+					      void *not_used)
+{
+	const struct tb_margining *margining = s->private;
+	struct tb *tb = margining->port->sw->tb;
+
+	scoped_cond_guard(mutex_intr, return -ERESTARTSYS, &tb->lock) {
+		if (!margining->software)
+			return -EOPNOTSUPP;
+
+		seq_printf(s, "%d\n", margining->voltage_time_offset);
+	}
+
+	return 0;
+}
+DEBUGFS_ATTR_RW(margining_voltage_time_offset);
+
+static ssize_t
+margining_error_counter_write(struct file *file, const char __user *user_buf,
+			      size_t count, loff_t *ppos)
+{
+	enum usb4_margin_sw_error_counter error_counter;
+	struct seq_file *s = file->private_data;
+	struct tb_margining *margining = s->private;
+	struct tb *tb = margining->port->sw->tb;
+	char *buf;
+
+	buf = validate_and_copy_from_user(user_buf, &count);
+	if (IS_ERR(buf))
+		return PTR_ERR(buf);
+
+	buf[count - 1] = '\0';
+
+	if (!strcmp(buf, "nop"))
+		error_counter = USB4_MARGIN_SW_ERROR_COUNTER_NOP;
+	else if (!strcmp(buf, "clear"))
+		error_counter = USB4_MARGIN_SW_ERROR_COUNTER_CLEAR;
+	else if (!strcmp(buf, "start"))
+		error_counter = USB4_MARGIN_SW_ERROR_COUNTER_START;
+	else if (!strcmp(buf, "stop"))
+		error_counter = USB4_MARGIN_SW_ERROR_COUNTER_STOP;
+	else
+		return -EINVAL;
+
+	scoped_cond_guard(mutex_intr, return -ERESTARTSYS, &tb->lock) {
+		if (!margining->software)
+			return -EOPNOTSUPP;
+
+		margining->error_counter = error_counter;
+	}
+
+	return count;
+}
+
+static int margining_error_counter_show(struct seq_file *s, void *not_used)
+{
+	const struct tb_margining *margining = s->private;
+	struct tb *tb = margining->port->sw->tb;
+
+	scoped_cond_guard(mutex_intr, return -ERESTARTSYS, &tb->lock) {
+		if (!margining->software)
+			return -EOPNOTSUPP;
+
+		switch (margining->error_counter) {
+		case USB4_MARGIN_SW_ERROR_COUNTER_NOP:
+			seq_puts(s, "[nop] clear start stop\n");
+			break;
+		case USB4_MARGIN_SW_ERROR_COUNTER_CLEAR:
+			seq_puts(s, "nop [clear] start stop\n");
+			break;
+		case USB4_MARGIN_SW_ERROR_COUNTER_START:
+			seq_puts(s, "nop clear [start] stop\n");
+			break;
+		case USB4_MARGIN_SW_ERROR_COUNTER_STOP:
+			seq_puts(s, "nop clear start [stop]\n");
+			break;
+		}
+	}
+
+	return 0;
+}
+DEBUGFS_ATTR_RW(margining_error_counter);
+
+static ssize_t
+margining_dwell_time_write(struct file *file, const char __user *user_buf,
+			   size_t count, loff_t *ppos)
+{
+	struct seq_file *s = file->private_data;
+	struct tb_margining *margining = s->private;
+	struct tb *tb = margining->port->sw->tb;
+	unsigned int val;
+	int ret;
+
+	ret = kstrtouint_from_user(user_buf, count, 10, &val);
+	if (ret)
+		return ret;
+
+	scoped_cond_guard(mutex_intr, return -ERESTARTSYS, &tb->lock) {
+		if (!margining->software)
+			return -EOPNOTSUPP;
+
+		margining->dwell_time = clamp(val, MIN_DWELL_TIME, MAX_DWELL_TIME);
+	}
+
+	return count;
+}
+
+static int margining_dwell_time_show(struct seq_file *s, void *not_used)
+{
+	struct tb_margining *margining = s->private;
+	struct tb *tb = margining->port->sw->tb;
+
+	scoped_cond_guard(mutex_intr, return -ERESTARTSYS, &tb->lock) {
+		if (!margining->software)
+			return -EOPNOTSUPP;
+
+		seq_printf(s, "%d\n", margining->dwell_time);
+	}
+
+	return 0;
+}
+DEBUGFS_ATTR_RW(margining_dwell_time);
+
+static ssize_t
+margining_optional_voltage_offset_write(struct file *file, const char __user *user_buf,
+					size_t count, loff_t *ppos)
 {
 	struct seq_file *s = file->private_data;
 	struct tb_margining *margining = s->private;
@@ -796,6 +985,51 @@ static int margining_mode_show(struct seq_file *s, void *not_used)
 }
 DEBUGFS_ATTR_RW(margining_mode);
 
+static int margining_run_sw(struct tb_margining *margining,
+			    struct usb4_port_margining_params *params)
+{
+	u32 nsamples = margining->dwell_time / DWELL_SAMPLE_INTERVAL;
+	int ret, i;
+
+	ret = usb4_port_sw_margin(margining->port, margining->target, margining->index,
+				  params, margining->results);
+	if (ret)
+		goto out_stop;
+
+	for (i = 0; i <= nsamples; i++) {
+		u32 errors = 0;
+
+		ret = usb4_port_sw_margin_errors(margining->port, margining->target,
+						 margining->index, &margining->results[1]);
+		if (ret)
+			break;
+
+		if (margining->lanes == USB4_MARGIN_SW_LANE_0)
+			errors = FIELD_GET(USB4_MARGIN_SW_ERR_COUNTER_LANE_0_MASK,
+					   margining->results[1]);
+		else if (margining->lanes == USB4_MARGIN_SW_LANE_1)
+			errors = FIELD_GET(USB4_MARGIN_SW_ERR_COUNTER_LANE_1_MASK,
+					   margining->results[1]);
+		else if (margining->lanes == USB4_MARGIN_SW_ALL_LANES)
+			errors = margining->results[1];
+
+		/* Any errors stop the test */
+		if (errors)
+			break;
+
+		fsleep(DWELL_SAMPLE_INTERVAL * USEC_PER_MSEC);
+	}
+
+out_stop:
+	/*
+	 * Stop the counters but don't clear them to allow the
+	 * different error counter configurations.
+	 */
+	margining_modify_error_counter(margining, margining->lanes,
+				       USB4_MARGIN_SW_ERROR_COUNTER_STOP);
+	return ret;
+}
+
 static int margining_run_write(void *data, u64 val)
 {
 	struct tb_margining *margining = data;
@@ -836,11 +1070,15 @@ static int margining_run_write(void *data, u64 val)
 		clx = ret;
 	}
 
+	/* Clear the results */
+	memset(margining->results, 0, sizeof(margining->results));
+
 	if (margining->software) {
 		struct usb4_port_margining_params params = {
 			.error_counter = USB4_MARGIN_SW_ERROR_COUNTER_CLEAR,
 			.lanes = margining->lanes,
 			.time = margining->time,
+			.voltage_time_offset = margining->voltage_time_offset,
 			.right_high = margining->right_high,
 			.optional_voltage_offset_range = margining->optional_voltage_offset_range,
 		};
@@ -850,14 +1088,7 @@ static int margining_run_write(void *data, u64 val)
 			    margining->time ? "time" : "voltage", dev_name(dev),
 			    margining->lanes);
 
-		ret = usb4_port_sw_margin(port, margining->target, margining->index, &params,
-					  &margining->results[0]);
-		if (ret)
-			goto out_clx;
-
-		ret = usb4_port_sw_margin_errors(port, margining->target,
-						 margining->index,
-						 &margining->results[0]);
+		ret = margining_run_sw(margining, &params);
 	} else {
 		struct usb4_port_margining_params params = {
 			.ber_level = margining->ber_level,
@@ -867,10 +1098,6 @@ static int margining_run_write(void *data, u64 val)
 			.optional_voltage_offset_range = margining->optional_voltage_offset_range,
 		};
 
-		/* Clear the results */
-		margining->results[0] = 0;
-		margining->results[1] = 0;
-
 		tb_port_dbg(port,
 			    "running hardware %s lane margining for %s lanes %u\n",
 			    margining->time ? "time" : "voltage", dev_name(dev),
@@ -880,7 +1107,6 @@ static int margining_run_write(void *data, u64 val)
 					  margining->results);
 	}
 
-out_clx:
 	if (down_sw)
 		tb_switch_clx_enable(down_sw, clx);
 out_unlock:
@@ -909,6 +1135,13 @@ static ssize_t margining_results_write(struct file *file,
 	margining->results[0] = 0;
 	margining->results[1] = 0;
 
+	if (margining->software) {
+		/* Clear the error counters */
+		margining_modify_error_counter(margining,
+					       USB4_MARGIN_SW_ALL_LANES,
+					       USB4_MARGIN_SW_ERROR_COUNTER_CLEAR);
+	}
+
 	mutex_unlock(&tb->lock);
 	return count;
 }
@@ -998,6 +1231,24 @@ static int margining_results_show(struct seq_file *s, void *not_used)
 				voltage_margin_show(s, margining, val);
 			}
 		}
+	} else {
+		u32 lane_errors, result;
+
+		seq_printf(s, "0x%08x\n", margining->results[1]);
+		result = FIELD_GET(USB4_MARGIN_SW_LANES_MASK, margining->results[0]);
+
+		if (result == USB4_MARGIN_SW_LANE_0 ||
+		    result == USB4_MARGIN_SW_ALL_LANES) {
+			lane_errors = FIELD_GET(USB4_MARGIN_SW_ERR_COUNTER_LANE_0_MASK,
+						margining->results[1]);
+			seq_printf(s, "# lane 0 errors: %u\n", lane_errors);
+		}
+		if (result == USB4_MARGIN_SW_LANE_1 ||
+		    result == USB4_MARGIN_SW_ALL_LANES) {
+			lane_errors = FIELD_GET(USB4_MARGIN_SW_ERR_COUNTER_LANE_1_MASK,
+						margining->results[1]);
+			seq_printf(s, "# lane 1 errors: %u\n", lane_errors);
+		}
 	}
 
 	mutex_unlock(&tb->lock);
@@ -1211,9 +1462,21 @@ static struct tb_margining *margining_alloc(struct tb_port *port,
 		debugfs_create_file("margin", 0600, dir, margining,
 				    &margining_margin_fops);
 
+	margining->error_counter = USB4_MARGIN_SW_ERROR_COUNTER_CLEAR;
+	margining->dwell_time = MIN_DWELL_TIME;
+
 	if (supports_optional_voltage_offset_range(margining))
 		debugfs_create_file("optional_voltage_offset", DEBUGFS_MODE, dir, margining,
 				    &margining_optional_voltage_offset_fops);
+
+	if (supports_software(margining)) {
+		debugfs_create_file("voltage_time_offset", DEBUGFS_MODE, dir, margining,
+				    &margining_voltage_time_offset_fops);
+		debugfs_create_file("error_counter", DEBUGFS_MODE, dir, margining,
+				    &margining_error_counter_fops);
+		debugfs_create_file("dwell_time", DEBUGFS_MODE, dir, margining,
+				    &margining_dwell_time_fops);
+	}
 	return margining;
 }
 
diff --git a/drivers/thunderbolt/sb_regs.h b/drivers/thunderbolt/sb_regs.h
index 8bff0740222c..dbcad25ead50 100644
--- a/drivers/thunderbolt/sb_regs.h
+++ b/drivers/thunderbolt/sb_regs.h
@@ -86,9 +86,17 @@ enum usb4_sb_opcode {
 #define USB4_MARGIN_HW_RES_1_L1_LL_MARGIN_SHIFT	24
 
 /* USB4_SB_OPCODE_RUN_SW_LANE_MARGINING */
+#define USB4_MARGIN_SW_LANES_MASK		GENMASK(2, 0)
+#define USB4_MARGIN_SW_LANE_0			0x0
+#define USB4_MARGIN_SW_LANE_1			0x1
+#define USB4_MARGIN_SW_ALL_LANES		0x7
 #define USB4_MARGIN_SW_TIME			BIT(3)
 #define USB4_MARGIN_SW_RH			BIT(4)
 #define USB4_MARGIN_SW_OPT_VOLTAGE		BIT(5)
+#define USB4_MARGIN_SW_VT_MASK			GENMASK(12, 6)
 #define USB4_MARGIN_SW_COUNTER_MASK		GENMASK(14, 13)
 
+#define USB4_MARGIN_SW_ERR_COUNTER_LANE_0_MASK	GENMASK(3, 0)
+#define USB4_MARGIN_SW_ERR_COUNTER_LANE_1_MASK	GENMASK(7, 4)
+
 #endif
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index 262c333924b8..6737188f2581 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -1372,6 +1372,7 @@ enum usb4_margin_sw_error_counter {
  * @error_counter: Error counter operation for software margining
  * @ber_level: Current BER level contour value
  * @lanes: %0, %1 or %7 (all)
+ * @voltage_time_offset: Offset for voltage / time for software margining
  * @optional_voltage_offset_range: Enable optional extended voltage range
  * @right_high: %false if left/low margin test is performed, %true if right/high
  * @time: %true if time margining is used instead of voltage
@@ -1380,6 +1381,7 @@ struct usb4_port_margining_params {
 	enum usb4_margin_sw_error_counter error_counter;
 	u32 ber_level;
 	u32 lanes;
+	u32 voltage_time_offset;
 	bool optional_voltage_offset_range;
 	bool right_high;
 	bool time;
diff --git a/drivers/thunderbolt/usb4.c b/drivers/thunderbolt/usb4.c
index a2f81e17ad8d..0a9b4aeb3fa1 100644
--- a/drivers/thunderbolt/usb4.c
+++ b/drivers/thunderbolt/usb4.c
@@ -1723,6 +1723,7 @@ int usb4_port_sw_margin(struct tb_port *port, enum usb4_sb_target target,
 	if (params->right_high)
 		val |= USB4_MARGIN_SW_RH;
 	val |= FIELD_PREP(USB4_MARGIN_SW_COUNTER_MASK, params->error_counter);
+	val |= FIELD_PREP(USB4_MARGIN_SW_VT_MASK, params->voltage_time_offset);
 
 	ret = usb4_port_sb_write(port, target, index, USB4_SB_METADATA, &val,
 				 sizeof(val));
-- 
2.43.0



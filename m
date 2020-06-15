Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C6EC1F9A21
	for <lists+linux-usb@lfdr.de>; Mon, 15 Jun 2020 16:27:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730553AbgFOO1D (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 15 Jun 2020 10:27:03 -0400
Received: from mga09.intel.com ([134.134.136.24]:59953 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730534AbgFOO1C (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 15 Jun 2020 10:27:02 -0400
IronPort-SDR: LgNZrbIO40UKIUlSfaPJxcQxVtsZ3eQ5yV3Qu418RnHKqEDyukYCWD3M5ghAUWGNZt1sKHNNmB
 ZUG5x58cMAGA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2020 07:26:52 -0700
IronPort-SDR: 0gVB4LNjwuGbyotekIcGZiump0gxXnYX+HpvMCAdAr8Kb1q6hOHE2zW7+8mVqRbaytMs9g+EcX
 CKhuMNh2yIPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,514,1583222400"; 
   d="scan'208";a="308143467"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga008.jf.intel.com with ESMTP; 15 Jun 2020 07:26:50 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 44349913; Mon, 15 Jun 2020 17:26:46 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rajmohan Mani <rajmohan.mani@intel.com>,
        Lukas Wunner <lukas@wunner.de>
Subject: [PATCH 14/17] thunderbolt: Implement USB3 bandwidth negotiation routines
Date:   Mon, 15 Jun 2020 17:26:42 +0300
Message-Id: <20200615142645.56209-15-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.27.0.rc2
In-Reply-To: <20200615142645.56209-1-mika.westerberg@linux.intel.com>
References: <20200615142645.56209-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Each host router USB3 downstream adapter has a set of registers that are
used to negotiate bandwidth between the connection manager and the
internal xHCI controller. These registers allow dynamic bandwidth
management for USB3 isochronous traffic based on what is actually
consumed vs. allocated at any given time.

Implement these USB3 bandwidth negotiation routines to allow the
software connection manager take advantage of these.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tb.h      |   9 +
 drivers/thunderbolt/tb_regs.h |  19 ++
 drivers/thunderbolt/usb4.c    | 341 ++++++++++++++++++++++++++++++++++
 3 files changed, 369 insertions(+)

diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index de8124949eaf..cb53a94fe4f8 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -853,4 +853,13 @@ struct tb_port *usb4_switch_map_usb3_down(struct tb_switch *sw,
 					  const struct tb_port *port);
 
 int usb4_port_unlock(struct tb_port *port);
+
+int usb4_usb3_port_max_link_rate(struct tb_port *port);
+int usb4_usb3_port_actual_link_rate(struct tb_port *port);
+int usb4_usb3_port_allocated_bandwidth(struct tb_port *port, int *upstream_bw,
+				       int *downstream_bw);
+int usb4_usb3_port_allocate_bandwidth(struct tb_port *port, int *upstream_bw,
+				      int *downstream_bw);
+int usb4_usb3_port_release_bandwidth(struct tb_port *port, int *upstream_bw,
+				     int *downstream_bw);
 #endif
diff --git a/drivers/thunderbolt/tb_regs.h b/drivers/thunderbolt/tb_regs.h
index 77d4b8598835..4fc561347b7c 100644
--- a/drivers/thunderbolt/tb_regs.h
+++ b/drivers/thunderbolt/tb_regs.h
@@ -338,6 +338,25 @@ struct tb_regs_port_header {
 #define ADP_USB3_CS_0				0x00
 #define ADP_USB3_CS_0_V				BIT(30)
 #define ADP_USB3_CS_0_PE			BIT(31)
+#define ADP_USB3_CS_1				0x01
+#define ADP_USB3_CS_1_CUBW_MASK			GENMASK(11, 0)
+#define ADP_USB3_CS_1_CDBW_MASK			GENMASK(23, 12)
+#define ADP_USB3_CS_1_CDBW_SHIFT		12
+#define ADP_USB3_CS_1_HCA			BIT(31)
+#define ADP_USB3_CS_2				0x02
+#define ADP_USB3_CS_2_AUBW_MASK			GENMASK(11, 0)
+#define ADP_USB3_CS_2_ADBW_MASK			GENMASK(23, 12)
+#define ADP_USB3_CS_2_ADBW_SHIFT		12
+#define ADP_USB3_CS_2_CMR			BIT(31)
+#define ADP_USB3_CS_3				0x03
+#define ADP_USB3_CS_3_SCALE_MASK		GENMASK(5, 0)
+#define ADP_USB3_CS_4				0x04
+#define ADP_USB3_CS_4_ALR_MASK			GENMASK(6, 0)
+#define ADP_USB3_CS_4_ALR_20G			0x1
+#define ADP_USB3_CS_4_ULV			BIT(7)
+#define ADP_USB3_CS_4_MSLR_MASK			GENMASK(18, 12)
+#define ADP_USB3_CS_4_MSLR_SHIFT		12
+#define ADP_USB3_CS_4_MSLR_20G			0x1
 
 /* Hop register from TB_CFG_HOPS. 8 byte per entry. */
 struct tb_regs_hop {
diff --git a/drivers/thunderbolt/usb4.c b/drivers/thunderbolt/usb4.c
index dd1c0498a8ee..d1a554fd09ae 100644
--- a/drivers/thunderbolt/usb4.c
+++ b/drivers/thunderbolt/usb4.c
@@ -787,3 +787,344 @@ int usb4_port_unlock(struct tb_port *port)
 	val &= ~ADP_CS_4_LCK;
 	return tb_port_write(port, &val, TB_CFG_PORT, ADP_CS_4, 1);
 }
+
+static int usb4_port_wait_for_bit(struct tb_port *port, u32 offset, u32 bit,
+				  u32 value, int timeout_msec)
+{
+	ktime_t timeout = ktime_add_ms(ktime_get(), timeout_msec);
+
+	do {
+		u32 val;
+		int ret;
+
+		ret = tb_port_read(port, &val, TB_CFG_PORT, offset, 1);
+		if (ret)
+			return ret;
+
+		if ((val & bit) == value)
+			return 0;
+
+		usleep_range(50, 100);
+	} while (ktime_before(ktime_get(), timeout));
+
+	return -ETIMEDOUT;
+}
+
+/**
+ * usb4_usb3_port_max_link_rate() - Maximum support USB3 link rate
+ * @port: USB3 adapter port
+ *
+ * Return maximum supported link rate of a USB3 adapter in Mb/s.
+ * Negative errno in case of error.
+ */
+int usb4_usb3_port_max_link_rate(struct tb_port *port)
+{
+	int ret, lr;
+	u32 val;
+
+	if (!tb_port_is_usb3_down(port) && !tb_port_is_usb3_up(port))
+		return -EINVAL;
+
+	ret = tb_port_read(port, &val, TB_CFG_PORT,
+			   port->cap_adap + ADP_USB3_CS_4, 1);
+	if (ret)
+		return ret;
+
+	lr = (val & ADP_USB3_CS_4_MSLR_MASK) >> ADP_USB3_CS_4_MSLR_SHIFT;
+	return lr == ADP_USB3_CS_4_MSLR_20G ? 20000 : 10000;
+}
+
+/**
+ * usb4_usb3_port_actual_link_rate() - Established USB3 link rate
+ * @port: USB3 adapter port
+ *
+ * Return actual established link rate of a USB3 adapter in Mb/s. If the
+ * link is not up returns %0 and negative errno in case of failure.
+ */
+int usb4_usb3_port_actual_link_rate(struct tb_port *port)
+{
+	int ret, lr;
+	u32 val;
+
+	if (!tb_port_is_usb3_down(port) && !tb_port_is_usb3_up(port))
+		return -EINVAL;
+
+	ret = tb_port_read(port, &val, TB_CFG_PORT,
+			   port->cap_adap + ADP_USB3_CS_4, 1);
+	if (ret)
+		return ret;
+
+	if (!(val & ADP_USB3_CS_4_ULV))
+		return 0;
+
+	lr = val & ADP_USB3_CS_4_ALR_MASK;
+	return lr == ADP_USB3_CS_4_ALR_20G ? 20000 : 10000;
+}
+
+static int usb4_usb3_port_cm_request(struct tb_port *port, bool request)
+{
+	int ret;
+	u32 val;
+
+	if (!tb_port_is_usb3_down(port))
+		return -EINVAL;
+	if (tb_route(port->sw))
+		return -EINVAL;
+
+	ret = tb_port_read(port, &val, TB_CFG_PORT,
+			   port->cap_adap + ADP_USB3_CS_2, 1);
+	if (ret)
+		return ret;
+
+	if (request)
+		val |= ADP_USB3_CS_2_CMR;
+	else
+		val &= ~ADP_USB3_CS_2_CMR;
+
+	ret = tb_port_write(port, &val, TB_CFG_PORT,
+			    port->cap_adap + ADP_USB3_CS_2, 1);
+	if (ret)
+		return ret;
+
+	/*
+	 * We can use val here directly as the CMR bit is in the same place
+	 * as HCA. Just mask out others.
+	 */
+	val &= ADP_USB3_CS_2_CMR;
+	return usb4_port_wait_for_bit(port, port->cap_adap + ADP_USB3_CS_1,
+				      ADP_USB3_CS_1_HCA, val, 1500);
+}
+
+static inline int usb4_usb3_port_set_cm_request(struct tb_port *port)
+{
+	return usb4_usb3_port_cm_request(port, true);
+}
+
+static inline int usb4_usb3_port_clear_cm_request(struct tb_port *port)
+{
+	return usb4_usb3_port_cm_request(port, false);
+}
+
+static unsigned int usb3_bw_to_mbps(u32 bw, u8 scale)
+{
+	unsigned long uframes;
+
+	uframes = bw * 512 << scale;
+	return DIV_ROUND_CLOSEST(uframes * 8000, 1000 * 1000);
+}
+
+static u32 mbps_to_usb3_bw(unsigned int mbps, u8 scale)
+{
+	unsigned long uframes;
+
+	/* 1 uframe is 1/8 ms (125 us) -> 1 / 8000 s */
+	uframes = ((unsigned long)mbps * 1000 *  1000) / 8000;
+	return DIV_ROUND_UP(uframes, 512 << scale);
+}
+
+static int usb4_usb3_port_read_allocated_bandwidth(struct tb_port *port,
+						   int *upstream_bw,
+						   int *downstream_bw)
+{
+	u32 val, bw, scale;
+	int ret;
+
+	ret = tb_port_read(port, &val, TB_CFG_PORT,
+			   port->cap_adap + ADP_USB3_CS_2, 1);
+	if (ret)
+		return ret;
+
+	ret = tb_port_read(port, &scale, TB_CFG_PORT,
+			   port->cap_adap + ADP_USB3_CS_3, 1);
+	if (ret)
+		return ret;
+
+	scale &= ADP_USB3_CS_3_SCALE_MASK;
+
+	bw = val & ADP_USB3_CS_2_AUBW_MASK;
+	*upstream_bw = usb3_bw_to_mbps(bw, scale);
+
+	bw = (val & ADP_USB3_CS_2_ADBW_MASK) >> ADP_USB3_CS_2_ADBW_SHIFT;
+	*downstream_bw = usb3_bw_to_mbps(bw, scale);
+
+	return 0;
+}
+
+/**
+ * usb4_usb3_port_allocated_bandwidth() - Bandwidth allocated for USB3
+ * @port: USB3 adapter port
+ * @upstream_bw: Allocated upstream bandwidth is stored here
+ * @downstream_bw: Allocated downstream bandwidth is stored here
+ *
+ * Stores currently allocated USB3 bandwidth into @upstream_bw and
+ * @downstream_bw in Mb/s. Returns %0 in case of success and negative
+ * errno in failure.
+ */
+int usb4_usb3_port_allocated_bandwidth(struct tb_port *port, int *upstream_bw,
+				       int *downstream_bw)
+{
+	int ret;
+
+	ret = usb4_usb3_port_set_cm_request(port);
+	if (ret)
+		return ret;
+
+	ret = usb4_usb3_port_read_allocated_bandwidth(port, upstream_bw,
+						      downstream_bw);
+	usb4_usb3_port_clear_cm_request(port);
+
+	return ret;
+}
+
+static int usb4_usb3_port_read_consumed_bandwidth(struct tb_port *port,
+						  int *upstream_bw,
+						  int *downstream_bw)
+{
+	u32 val, bw, scale;
+	int ret;
+
+	ret = tb_port_read(port, &val, TB_CFG_PORT,
+			   port->cap_adap + ADP_USB3_CS_1, 1);
+	if (ret)
+		return ret;
+
+	ret = tb_port_read(port, &scale, TB_CFG_PORT,
+			   port->cap_adap + ADP_USB3_CS_3, 1);
+	if (ret)
+		return ret;
+
+	scale &= ADP_USB3_CS_3_SCALE_MASK;
+
+	bw = val & ADP_USB3_CS_1_CUBW_MASK;
+	*upstream_bw = usb3_bw_to_mbps(bw, scale);
+
+	bw = (val & ADP_USB3_CS_1_CDBW_MASK) >> ADP_USB3_CS_1_CDBW_SHIFT;
+	*downstream_bw = usb3_bw_to_mbps(bw, scale);
+
+	return 0;
+}
+
+static int usb4_usb3_port_write_allocated_bandwidth(struct tb_port *port,
+						    int upstream_bw,
+						    int downstream_bw)
+{
+	u32 val, ubw, dbw, scale;
+	int ret;
+
+	/* Read the used scale, hardware default is 0 */
+	ret = tb_port_read(port, &scale, TB_CFG_PORT,
+			   port->cap_adap + ADP_USB3_CS_3, 1);
+	if (ret)
+		return ret;
+
+	scale &= ADP_USB3_CS_3_SCALE_MASK;
+	ubw = mbps_to_usb3_bw(upstream_bw, scale);
+	dbw = mbps_to_usb3_bw(downstream_bw, scale);
+
+	ret = tb_port_read(port, &val, TB_CFG_PORT,
+			   port->cap_adap + ADP_USB3_CS_2, 1);
+	if (ret)
+		return ret;
+
+	val &= ~(ADP_USB3_CS_2_AUBW_MASK | ADP_USB3_CS_2_ADBW_MASK);
+	val |= dbw << ADP_USB3_CS_2_ADBW_SHIFT;
+	val |= ubw;
+
+	return tb_port_write(port, &val, TB_CFG_PORT,
+			     port->cap_adap + ADP_USB3_CS_2, 1);
+}
+
+/**
+ * usb4_usb3_port_allocate_bandwidth() - Allocate bandwidth for USB3
+ * @port: USB3 adapter port
+ * @upstream_bw: New upstream bandwidth
+ * @downstream_bw: New downstream bandwidth
+ *
+ * This can be used to set how much bandwidth is allocated for the USB3
+ * tunneled isochronous traffic. @upstream_bw and @downstream_bw are the
+ * new values programmed to the USB3 adapter allocation registers. If
+ * the values are lower than what is currently consumed the allocation
+ * is set to what is currently consumed instead (consumed bandwidth
+ * cannot be taken away by CM). The actual new values are returned in
+ * @upstream_bw and @downstream_bw.
+ *
+ * Returns %0 in case of success and negative errno if there was a
+ * failure.
+ */
+int usb4_usb3_port_allocate_bandwidth(struct tb_port *port, int *upstream_bw,
+				      int *downstream_bw)
+{
+	int ret, consumed_up, consumed_down, allocate_up, allocate_down;
+
+	ret = usb4_usb3_port_set_cm_request(port);
+	if (ret)
+		return ret;
+
+	ret = usb4_usb3_port_read_consumed_bandwidth(port, &consumed_up,
+						     &consumed_down);
+	if (ret)
+		goto err_request;
+
+	/* Don't allow it go lower than what is consumed */
+	allocate_up = max(*upstream_bw, consumed_up);
+	allocate_down = max(*downstream_bw, consumed_down);
+
+	ret = usb4_usb3_port_write_allocated_bandwidth(port, allocate_up,
+						       allocate_down);
+	if (ret)
+		goto err_request;
+
+	*upstream_bw = allocate_up;
+	*downstream_bw = allocate_down;
+
+err_request:
+	usb4_usb3_port_clear_cm_request(port);
+	return ret;
+}
+
+/**
+ * usb4_usb3_port_release_bandwidth() - Release allocated USB3 bandwidth
+ * @port: USB3 adapter port
+ * @upstream_bw: New allocated upstream bandwidth
+ * @downstream_bw: New allocated downstream bandwidth
+ *
+ * Releases USB3 allocated bandwidth down to what is actually consumed.
+ * The new bandwidth is returned in @upstream_bw and @downstream_bw.
+ *
+ * Returns 0% in success and negative errno in case of failure.
+ */
+int usb4_usb3_port_release_bandwidth(struct tb_port *port, int *upstream_bw,
+				     int *downstream_bw)
+{
+	int ret, consumed_up, consumed_down;
+
+	ret = usb4_usb3_port_set_cm_request(port);
+	if (ret)
+		return ret;
+
+	ret = usb4_usb3_port_read_consumed_bandwidth(port, &consumed_up,
+						     &consumed_down);
+	if (ret)
+		goto err_request;
+
+	/*
+	 * Always keep 1000 Mb/s to make sure xHCI has at least some
+	 * bandwidth available for isochronous traffic.
+	 */
+	if (consumed_up < 1000)
+		consumed_up = 1000;
+	if (consumed_down < 1000)
+		consumed_down = 1000;
+
+	ret = usb4_usb3_port_write_allocated_bandwidth(port, consumed_up,
+						       consumed_down);
+	if (ret)
+		goto err_request;
+
+	*upstream_bw = consumed_up;
+	*downstream_bw = consumed_down;
+
+err_request:
+	usb4_usb3_port_clear_cm_request(port);
+	return ret;
+}
-- 
2.27.0.rc2


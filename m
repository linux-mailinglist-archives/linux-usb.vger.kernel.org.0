Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 87E7565EA08
	for <lists+linux-usb@lfdr.de>; Thu,  5 Jan 2023 12:36:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232667AbjAELfx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 5 Jan 2023 06:35:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232541AbjAELfd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 5 Jan 2023 06:35:33 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D75058D22
        for <linux-usb@vger.kernel.org>; Thu,  5 Jan 2023 03:35:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672918532; x=1704454532;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ICKeZGLg8d37u78+pgqW1snBojDf7RGvdCTX3xkZ3Ig=;
  b=eRNTpCap7vTyN9TxgFDxvjCgYb+TEsK5xyeC4vfw08xCk5ytQHuRkTal
   FHAne9/oWzX/mnM2B8lCi4Xc3FGyYlKTBr6SAfpdktT0qVPKyPChgfhw1
   AzbEKaKR+zR4MlB2Tzcq7G8/ShCyslTl06V3m5w01ca6J6eJ7tLb1Ralm
   xY3uxhpAFAsD6Kjl18YT9QFf9H0RThDWiaRiaKRGjdOgTazF6tuTwMWvp
   tpzkUOOoQ5bhy/GTGqNLjcxoU+cZZTs86ORtgo81+gkihtztDH34b5NRQ
   Hs6zRG3MXUQ9XOyMYMCKcpGXZLTTCFHsnB3vemsR+eS73WfT7ZyrBSEKh
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10580"; a="319888881"
X-IronPort-AV: E=Sophos;i="5.96,302,1665471600"; 
   d="scan'208";a="319888881"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2023 03:35:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10580"; a="829527671"
X-IronPort-AV: E=Sophos;i="5.96,302,1665471600"; 
   d="scan'208";a="829527671"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga005.jf.intel.com with ESMTP; 05 Jan 2023 03:35:29 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id BF39A2AA; Thu,  5 Jan 2023 13:35:59 +0200 (EET)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 6/8] thunderbolt: Add functions to support DisplayPort bandwidth allocation mode
Date:   Thu,  5 Jan 2023 13:35:57 +0200
Message-Id: <20230105113559.68531-7-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230105113559.68531-1-mika.westerberg@linux.intel.com>
References: <20230105113559.68531-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

USB4 spec defines an additional feature that DP IN adapters can
implement (alongside with the graphics DPCD register set) to support
more dynamic bandwidth management for DisplayPort tunnels. For the
connection manager the communication happens through the DP IN adapter
using a set of registers in the adapter config space allocated for this.
Add functions that export this functionality for the rest of the driver.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tb.h      |  15 +
 drivers/thunderbolt/tb_regs.h |  32 ++
 drivers/thunderbolt/usb4.c    | 571 ++++++++++++++++++++++++++++++++++
 3 files changed, 618 insertions(+)

diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index 6c4a26b1c37c..cd6c9eeaf049 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -1238,6 +1238,21 @@ int usb4_usb3_port_allocate_bandwidth(struct tb_port *port, int *upstream_bw,
 int usb4_usb3_port_release_bandwidth(struct tb_port *port, int *upstream_bw,
 				     int *downstream_bw);
 
+int usb4_dp_port_set_cm_id(struct tb_port *port, int cm_id);
+bool usb4_dp_port_bw_mode_supported(struct tb_port *port);
+bool usb4_dp_port_bw_mode_enabled(struct tb_port *port);
+int usb4_dp_port_set_cm_bw_mode_supported(struct tb_port *port, bool supported);
+int usb4_dp_port_group_id(struct tb_port *port);
+int usb4_dp_port_set_group_id(struct tb_port *port, int group_id);
+int usb4_dp_port_nrd(struct tb_port *port, int *rate, int *lanes);
+int usb4_dp_port_set_nrd(struct tb_port *port, int rate, int lanes);
+int usb4_dp_port_granularity(struct tb_port *port);
+int usb4_dp_port_set_granularity(struct tb_port *port, int granularity);
+int usb4_dp_port_set_estimated_bw(struct tb_port *port, int bw);
+int usb4_dp_port_allocated_bw(struct tb_port *port);
+int usb4_dp_port_allocate_bw(struct tb_port *port, int bw);
+int usb4_dp_port_requested_bw(struct tb_port *port);
+
 static inline bool tb_is_usb4_port_device(const struct device *dev)
 {
 	return dev->type == &usb4_port_device_type;
diff --git a/drivers/thunderbolt/tb_regs.h b/drivers/thunderbolt/tb_regs.h
index f4a194cc0d63..2636423748cd 100644
--- a/drivers/thunderbolt/tb_regs.h
+++ b/drivers/thunderbolt/tb_regs.h
@@ -385,15 +385,42 @@ struct tb_regs_port_header {
 #define ADP_DP_CS_1_AUX_RX_HOPID_MASK		GENMASK(21, 11)
 #define ADP_DP_CS_1_AUX_RX_HOPID_SHIFT		11
 #define ADP_DP_CS_2				0x02
+#define ADP_DP_CS_2_NRD_MLC_MASK		GENMASK(2, 0)
 #define ADP_DP_CS_2_HDP				BIT(6)
+#define ADP_DP_CS_2_NRD_MLR_MASK		GENMASK(9, 7)
+#define ADP_DP_CS_2_NRD_MLR_SHIFT		7
+#define ADP_DP_CS_2_CA				BIT(10)
+#define ADP_DP_CS_2_GR_MASK			GENMASK(12, 11)
+#define ADP_DP_CS_2_GR_SHIFT			11
+#define ADP_DP_CS_2_GR_0_25G			0x0
+#define ADP_DP_CS_2_GR_0_5G			0x1
+#define ADP_DP_CS_2_GR_1G			0x2
+#define ADP_DP_CS_2_GROUP_ID_MASK		GENMASK(15, 13)
+#define ADP_DP_CS_2_GROUP_ID_SHIFT		13
+#define ADP_DP_CS_2_CM_ID_MASK			GENMASK(19, 16)
+#define ADP_DP_CS_2_CM_ID_SHIFT			16
+#define ADP_DP_CS_2_CMMS			BIT(20)
+#define ADP_DP_CS_2_ESTIMATED_BW_MASK		GENMASK(31, 24)
+#define ADP_DP_CS_2_ESTIMATED_BW_SHIFT		24
 #define ADP_DP_CS_3				0x03
 #define ADP_DP_CS_3_HDPC			BIT(9)
 #define DP_LOCAL_CAP				0x04
 #define DP_REMOTE_CAP				0x05
+/* For DP IN adapter */
+#define DP_STATUS				0x06
+#define DP_STATUS_ALLOCATED_BW_MASK		GENMASK(31, 24)
+#define DP_STATUS_ALLOCATED_BW_SHIFT		24
+/* For DP OUT adapter */
 #define DP_STATUS_CTRL				0x06
 #define DP_STATUS_CTRL_CMHS			BIT(25)
 #define DP_STATUS_CTRL_UF			BIT(26)
 #define DP_COMMON_CAP				0x07
+/* Only if DP IN supports BW allocation mode */
+#define ADP_DP_CS_8				0x08
+#define ADP_DP_CS_8_REQUESTED_BW_MASK		GENMASK(7, 0)
+#define ADP_DP_CS_8_DPME			BIT(30)
+#define ADP_DP_CS_8_DR				BIT(31)
+
 /*
  * DP_COMMON_CAP offsets work also for DP_LOCAL_CAP and DP_REMOTE_CAP
  * with exception of DPRX done.
@@ -410,7 +437,12 @@ struct tb_regs_port_header {
 #define DP_COMMON_CAP_2_LANES			0x1
 #define DP_COMMON_CAP_4_LANES			0x2
 #define DP_COMMON_CAP_LTTPR_NS			BIT(27)
+#define DP_COMMON_CAP_BW_MODE			BIT(28)
 #define DP_COMMON_CAP_DPRX_DONE			BIT(31)
+/* Only present if DP IN supports BW allocation mode */
+#define ADP_DP_CS_8				0x08
+#define ADP_DP_CS_8_DPME			BIT(30)
+#define ADP_DP_CS_8_DR				BIT(31)
 
 /* PCIe adapter registers */
 #define ADP_PCIE_CS_0				0x00
diff --git a/drivers/thunderbolt/usb4.c b/drivers/thunderbolt/usb4.c
index 2ed50fcbcca7..2a9266fb5c0f 100644
--- a/drivers/thunderbolt/usb4.c
+++ b/drivers/thunderbolt/usb4.c
@@ -2186,3 +2186,574 @@ int usb4_usb3_port_release_bandwidth(struct tb_port *port, int *upstream_bw,
 	usb4_usb3_port_clear_cm_request(port);
 	return ret;
 }
+
+static bool is_usb4_dpin(const struct tb_port *port)
+{
+	if (!tb_port_is_dpin(port))
+		return false;
+	if (!tb_switch_is_usb4(port->sw))
+		return false;
+	return true;
+}
+
+/**
+ * usb4_dp_port_set_cm_id() - Assign CM ID to the DP IN adapter
+ * @port: DP IN adapter
+ * @cm_id: CM ID to assign
+ *
+ * Sets CM ID for the @port. Returns %0 on success and negative errno
+ * otherwise. Speficially returns %-EOPNOTSUPP if the @port does not
+ * support this.
+ */
+int usb4_dp_port_set_cm_id(struct tb_port *port, int cm_id)
+{
+	u32 val;
+	int ret;
+
+	if (!is_usb4_dpin(port))
+		return -EOPNOTSUPP;
+
+	ret = tb_port_read(port, &val, TB_CFG_PORT,
+			   port->cap_adap + ADP_DP_CS_2, 1);
+	if (ret)
+		return ret;
+
+	val &= ~ADP_DP_CS_2_CM_ID_MASK;
+	val |= cm_id << ADP_DP_CS_2_CM_ID_SHIFT;
+
+	return tb_port_write(port, &val, TB_CFG_PORT,
+			     port->cap_adap + ADP_DP_CS_2, 1);
+}
+
+/**
+ * usb4_dp_port_bw_mode_supported() - Is the bandwidth allocation mode supported
+ * @port: DP IN adapter to check
+ *
+ * Can be called to any DP IN adapter. Returns true if the adapter
+ * supports USB4 bandwidth allocation mode, false otherwise.
+ */
+bool usb4_dp_port_bw_mode_supported(struct tb_port *port)
+{
+	int ret;
+	u32 val;
+
+	if (!is_usb4_dpin(port))
+		return false;
+
+	ret = tb_port_read(port, &val, TB_CFG_PORT,
+			   port->cap_adap + DP_LOCAL_CAP, 1);
+	if (ret)
+		return false;
+
+	return !!(val & DP_COMMON_CAP_BW_MODE);
+}
+
+/**
+ * usb4_dp_port_bw_mode_enabled() - Is the bandwidth allocation mode enabled
+ * @port: DP IN adapter to check
+ *
+ * Can be called to any DP IN adapter. Returns true if the bandwidth
+ * allocation mode has been enabled, false otherwise.
+ */
+bool usb4_dp_port_bw_mode_enabled(struct tb_port *port)
+{
+	int ret;
+	u32 val;
+
+	if (!is_usb4_dpin(port))
+		return false;
+
+	ret = tb_port_read(port, &val, TB_CFG_PORT,
+			   port->cap_adap + ADP_DP_CS_8, 1);
+	if (ret)
+		return false;
+
+	return !!(val & ADP_DP_CS_8_DPME);
+}
+
+/**
+ * usb4_dp_port_set_cm_bw_mode_supported() - Set/clear CM support for bandwidth allocation mode
+ * @port: DP IN adapter
+ * @supported: Does the CM support bandwidth allocation mode
+ *
+ * Can be called to any DP IN adapter. Sets or clears the CM support bit
+ * of the DP IN adapter. Returns %0 in success and negative errno
+ * otherwise. Specifically returns %-OPNOTSUPP if the passed in adapter
+ * does not support this.
+ */
+int usb4_dp_port_set_cm_bw_mode_supported(struct tb_port *port, bool supported)
+{
+	u32 val;
+	int ret;
+
+	if (!is_usb4_dpin(port))
+		return -EOPNOTSUPP;
+
+	ret = tb_port_read(port, &val, TB_CFG_PORT,
+			   port->cap_adap + ADP_DP_CS_2, 1);
+	if (ret)
+		return ret;
+
+	if (supported)
+		val |= ADP_DP_CS_2_CMMS;
+	else
+		val &= ~ADP_DP_CS_2_CMMS;
+
+	return tb_port_write(port, &val, TB_CFG_PORT,
+			     port->cap_adap + ADP_DP_CS_2, 1);
+}
+
+/**
+ * usb4_dp_port_group_id() - Return Group ID assigned for the adapter
+ * @port: DP IN adapter
+ *
+ * Reads bandwidth allocation Group ID from the DP IN adapter and
+ * returns it. If the adapter does not support setting Group_ID
+ * %-EOPNOTSUPP is returned.
+ */
+int usb4_dp_port_group_id(struct tb_port *port)
+{
+	u32 val;
+	int ret;
+
+	if (!is_usb4_dpin(port))
+		return -EOPNOTSUPP;
+
+	ret = tb_port_read(port, &val, TB_CFG_PORT,
+			   port->cap_adap + ADP_DP_CS_2, 1);
+	if (ret)
+		return ret;
+
+	return (val & ADP_DP_CS_2_GROUP_ID_MASK) >> ADP_DP_CS_2_GROUP_ID_SHIFT;
+}
+
+/**
+ * usb4_dp_port_set_group_id() - Set adapter Group ID
+ * @port: DP IN adapter
+ * @group_id: Group ID for the adapter
+ *
+ * Sets bandwidth allocation mode Group ID for the DP IN adapter.
+ * Returns %0 in case of success and negative errno otherwise.
+ * Specifically returns %-EOPNOTSUPP if the adapter does not support
+ * this.
+ */
+int usb4_dp_port_set_group_id(struct tb_port *port, int group_id)
+{
+	u32 val;
+	int ret;
+
+	if (!is_usb4_dpin(port))
+		return -EOPNOTSUPP;
+
+	ret = tb_port_read(port, &val, TB_CFG_PORT,
+			   port->cap_adap + ADP_DP_CS_2, 1);
+	if (ret)
+		return ret;
+
+	val &= ~ADP_DP_CS_2_GROUP_ID_MASK;
+	val |= group_id << ADP_DP_CS_2_GROUP_ID_SHIFT;
+
+	return tb_port_write(port, &val, TB_CFG_PORT,
+			     port->cap_adap + ADP_DP_CS_2, 1);
+}
+
+/**
+ * usb4_dp_port_nrd() - Read non-reduced rate and lanes
+ * @port: DP IN adapter
+ * @rate: Non-reduced rate in Mb/s is placed here
+ * @lanes: Non-reduced lanes are placed here
+ *
+ * Reads the non-reduced rate and lanes from the DP IN adapter. Returns
+ * %0 in success and negative errno otherwise. Specifically returns
+ * %-EOPNOTSUPP if the adapter does not support this.
+ */
+int usb4_dp_port_nrd(struct tb_port *port, int *rate, int *lanes)
+{
+	u32 val, tmp;
+	int ret;
+
+	if (!is_usb4_dpin(port))
+		return -EOPNOTSUPP;
+
+	ret = tb_port_read(port, &val, TB_CFG_PORT,
+			   port->cap_adap + ADP_DP_CS_2, 1);
+	if (ret)
+		return ret;
+
+	tmp = (val & ADP_DP_CS_2_NRD_MLR_MASK) >> ADP_DP_CS_2_NRD_MLR_SHIFT;
+	switch (tmp) {
+	case DP_COMMON_CAP_RATE_RBR:
+		*rate = 1620;
+		break;
+	case DP_COMMON_CAP_RATE_HBR:
+		*rate = 2700;
+		break;
+	case DP_COMMON_CAP_RATE_HBR2:
+		*rate = 5400;
+		break;
+	case DP_COMMON_CAP_RATE_HBR3:
+		*rate = 8100;
+		break;
+	}
+
+	tmp = val & ADP_DP_CS_2_NRD_MLC_MASK;
+	switch (tmp) {
+	case DP_COMMON_CAP_1_LANE:
+		*lanes = 1;
+		break;
+	case DP_COMMON_CAP_2_LANES:
+		*lanes = 2;
+		break;
+	case DP_COMMON_CAP_4_LANES:
+		*lanes = 4;
+		break;
+	}
+
+	return 0;
+}
+
+/**
+ * usb4_dp_port_set_nrd() - Set non-reduced rate and lanes
+ * @port: DP IN adapter
+ * @rate: Non-reduced rate in Mb/s
+ * @lanes: Non-reduced lanes
+ *
+ * Before the capabilities reduction this function can be used to set
+ * the non-reduced values for the DP IN adapter. Returns %0 in success
+ * and negative errno otherwise. If the adapter does not support this
+ * %-EOPNOTSUPP is returned.
+ */
+int usb4_dp_port_set_nrd(struct tb_port *port, int rate, int lanes)
+{
+	u32 val;
+	int ret;
+
+	if (!is_usb4_dpin(port))
+		return -EOPNOTSUPP;
+
+	ret = tb_port_read(port, &val, TB_CFG_PORT,
+			   port->cap_adap + ADP_DP_CS_2, 1);
+	if (ret)
+		return ret;
+
+	val &= ~ADP_DP_CS_2_NRD_MLR_MASK;
+
+	switch (rate) {
+	case 1620:
+		break;
+	case 2700:
+		val |= (DP_COMMON_CAP_RATE_HBR << ADP_DP_CS_2_NRD_MLR_SHIFT)
+			& ADP_DP_CS_2_NRD_MLR_MASK;
+		break;
+	case 5400:
+		val |= (DP_COMMON_CAP_RATE_HBR2 << ADP_DP_CS_2_NRD_MLR_SHIFT)
+			& ADP_DP_CS_2_NRD_MLR_MASK;
+		break;
+	case 8100:
+		val |= (DP_COMMON_CAP_RATE_HBR3 << ADP_DP_CS_2_NRD_MLR_SHIFT)
+			& ADP_DP_CS_2_NRD_MLR_MASK;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	val &= ~ADP_DP_CS_2_NRD_MLC_MASK;
+
+	switch (lanes) {
+	case 1:
+		break;
+	case 2:
+		val |= DP_COMMON_CAP_2_LANES;
+		break;
+	case 4:
+		val |= DP_COMMON_CAP_4_LANES;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return tb_port_write(port, &val, TB_CFG_PORT,
+			     port->cap_adap + ADP_DP_CS_2, 1);
+}
+
+/**
+ * usb4_dp_port_granularity() - Return granularity for the bandwidth values
+ * @port: DP IN adapter
+ *
+ * Reads the programmed granularity from @port. If the DP IN adapter does
+ * not support bandwidth allocation mode returns %-EOPNOTSUPP and negative
+ * errno in other error cases.
+ */
+int usb4_dp_port_granularity(struct tb_port *port)
+{
+	u32 val;
+	int ret;
+
+	if (!is_usb4_dpin(port))
+		return -EOPNOTSUPP;
+
+	ret = tb_port_read(port, &val, TB_CFG_PORT,
+			   port->cap_adap + ADP_DP_CS_2, 1);
+	if (ret)
+		return ret;
+
+	val &= ADP_DP_CS_2_GR_MASK;
+	val >>= ADP_DP_CS_2_GR_SHIFT;
+
+	switch (val) {
+	case ADP_DP_CS_2_GR_0_25G:
+		return 250;
+	case ADP_DP_CS_2_GR_0_5G:
+		return 500;
+	case ADP_DP_CS_2_GR_1G:
+		return 1000;
+	}
+
+	return -EINVAL;
+}
+
+/**
+ * usb4_dp_port_set_granularity() - Set granularity for the bandwidth values
+ * @port: DP IN adapter
+ * @granularity: Granularity in Mb/s. Supported values: 1000, 500 and 250.
+ *
+ * Sets the granularity used with the estimated, allocated and requested
+ * bandwidth. Returns %0 in success and negative errno otherwise. If the
+ * adapter does not support this %-EOPNOTSUPP is returned.
+ */
+int usb4_dp_port_set_granularity(struct tb_port *port, int granularity)
+{
+	u32 val;
+	int ret;
+
+	if (!is_usb4_dpin(port))
+		return -EOPNOTSUPP;
+
+	ret = tb_port_read(port, &val, TB_CFG_PORT,
+			   port->cap_adap + ADP_DP_CS_2, 1);
+	if (ret)
+		return ret;
+
+	val &= ~ADP_DP_CS_2_GR_MASK;
+
+	switch (granularity) {
+	case 250:
+		val |= ADP_DP_CS_2_GR_0_25G << ADP_DP_CS_2_GR_SHIFT;
+		break;
+	case 500:
+		val |= ADP_DP_CS_2_GR_0_5G << ADP_DP_CS_2_GR_SHIFT;
+		break;
+	case 1000:
+		val |= ADP_DP_CS_2_GR_1G << ADP_DP_CS_2_GR_SHIFT;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return tb_port_write(port, &val, TB_CFG_PORT,
+			     port->cap_adap + ADP_DP_CS_2, 1);
+}
+
+/**
+ * usb4_dp_port_set_estimated_bw() - Set estimated bandwidth
+ * @port: DP IN adapter
+ * @bw: Estimated bandwidth in Mb/s.
+ *
+ * Sets the estimated bandwidth to @bw. Set the granularity by calling
+ * usb4_dp_port_set_granularity() before calling this. The @bw is round
+ * down to the closest granularity multiplier. Returns %0 in success
+ * and negative errno otherwise. Specifically returns %-EOPNOTSUPP if
+ * the adapter does not support this.
+ */
+int usb4_dp_port_set_estimated_bw(struct tb_port *port, int bw)
+{
+	u32 val, granularity;
+	int ret;
+
+	if (!is_usb4_dpin(port))
+		return -EOPNOTSUPP;
+
+	ret = usb4_dp_port_granularity(port);
+	if (ret < 0)
+		return ret;
+	granularity = ret;
+
+	ret = tb_port_read(port, &val, TB_CFG_PORT,
+			   port->cap_adap + ADP_DP_CS_2, 1);
+	if (ret)
+		return ret;
+
+	val &= ~ADP_DP_CS_2_ESTIMATED_BW_MASK;
+	val |= (bw / granularity) << ADP_DP_CS_2_ESTIMATED_BW_SHIFT;
+
+	return tb_port_write(port, &val, TB_CFG_PORT,
+			     port->cap_adap + ADP_DP_CS_2, 1);
+}
+
+/**
+ * usb4_dp_port_allocated_bw() - Return allocated bandwidth
+ * @port: DP IN adapter
+ *
+ * Reads and returns allocated bandwidth for @port in Mb/s (taking into
+ * account the programmed granularity). Returns negative errno in case
+ * of error.
+ */
+int usb4_dp_port_allocated_bw(struct tb_port *port)
+{
+	u32 val, granularity;
+	int ret;
+
+	if (!is_usb4_dpin(port))
+		return -EOPNOTSUPP;
+
+	ret = usb4_dp_port_granularity(port);
+	if (ret < 0)
+		return ret;
+	granularity = ret;
+
+	ret = tb_port_read(port, &val, TB_CFG_PORT,
+			   port->cap_adap + DP_STATUS, 1);
+	if (ret)
+		return ret;
+
+	val &= DP_STATUS_ALLOCATED_BW_MASK;
+	val >>= DP_STATUS_ALLOCATED_BW_SHIFT;
+
+	return val * granularity;
+}
+
+static int __usb4_dp_port_set_cm_ack(struct tb_port *port, bool ack)
+{
+	u32 val;
+	int ret;
+
+	ret = tb_port_read(port, &val, TB_CFG_PORT,
+			   port->cap_adap + ADP_DP_CS_2, 1);
+	if (ret)
+		return ret;
+
+	if (ack)
+		val |= ADP_DP_CS_2_CA;
+	else
+		val &= ~ADP_DP_CS_2_CA;
+
+	return tb_port_write(port, &val, TB_CFG_PORT,
+			     port->cap_adap + ADP_DP_CS_2, 1);
+}
+
+static inline int usb4_dp_port_set_cm_ack(struct tb_port *port)
+{
+	return __usb4_dp_port_set_cm_ack(port, true);
+}
+
+static int usb4_dp_port_wait_and_clear_cm_ack(struct tb_port *port,
+					      int timeout_msec)
+{
+	ktime_t end;
+	u32 val;
+	int ret;
+
+	ret = __usb4_dp_port_set_cm_ack(port, false);
+	if (ret)
+		return ret;
+
+	end = ktime_add_ms(ktime_get(), timeout_msec);
+	do {
+		ret = tb_port_read(port, &val, TB_CFG_PORT,
+				   port->cap_adap + ADP_DP_CS_8, 1);
+		if (ret)
+			return ret;
+
+		if (!(val & ADP_DP_CS_8_DR))
+			break;
+
+		usleep_range(50, 100);
+	} while (ktime_before(ktime_get(), end));
+
+	if (val & ADP_DP_CS_8_DR)
+		return -ETIMEDOUT;
+
+	ret = tb_port_read(port, &val, TB_CFG_PORT,
+			   port->cap_adap + ADP_DP_CS_2, 1);
+	if (ret)
+		return ret;
+
+	val &= ~ADP_DP_CS_2_CA;
+	return tb_port_write(port, &val, TB_CFG_PORT,
+			     port->cap_adap + ADP_DP_CS_2, 1);
+}
+
+/**
+ * usb4_dp_port_allocate_bw() - Set allocated bandwidth
+ * @port: DP IN adapter
+ * @bw: New allocated bandwidth in Mb/s
+ *
+ * Communicates the new allocated bandwidth with the DPCD (graphics
+ * driver). Takes into account the programmed granularity. Returns %0 in
+ * success and negative errno in case of error.
+ */
+int usb4_dp_port_allocate_bw(struct tb_port *port, int bw)
+{
+	u32 val, granularity;
+	int ret;
+
+	if (!is_usb4_dpin(port))
+		return -EOPNOTSUPP;
+
+	ret = usb4_dp_port_granularity(port);
+	if (ret < 0)
+		return ret;
+	granularity = ret;
+
+	ret = tb_port_read(port, &val, TB_CFG_PORT,
+			   port->cap_adap + DP_STATUS, 1);
+	if (ret)
+		return ret;
+
+	val &= ~DP_STATUS_ALLOCATED_BW_MASK;
+	val |= (bw / granularity) << DP_STATUS_ALLOCATED_BW_SHIFT;
+
+	ret = tb_port_write(port, &val, TB_CFG_PORT,
+			    port->cap_adap + DP_STATUS, 1);
+	if (ret)
+		return ret;
+
+	ret = usb4_dp_port_set_cm_ack(port);
+	if (ret)
+		return ret;
+
+	return usb4_dp_port_wait_and_clear_cm_ack(port, 500);
+}
+
+/**
+ * usb4_dp_port_requested_bw() - Read requested bandwidth
+ * @port: DP IN adapter
+ *
+ * Reads the DPCD (graphics driver) requested bandwidth and returns it
+ * in Mb/s. Takes the programmed granularity into account. In case of
+ * error returns negative errno. Specifically returns %-EOPNOTSUPP if
+ * the adapter does not support bandwidth allocation mode.
+ */
+int usb4_dp_port_requested_bw(struct tb_port *port)
+{
+	u32 val, granularity;
+	int ret;
+
+	if (!is_usb4_dpin(port))
+		return -EOPNOTSUPP;
+
+	ret = usb4_dp_port_granularity(port);
+	if (ret < 0)
+		return ret;
+	granularity = ret;
+
+	ret = tb_port_read(port, &val, TB_CFG_PORT,
+			   port->cap_adap + ADP_DP_CS_8, 1);
+	if (ret)
+		return 0;
+
+	if (!(val & ADP_DP_CS_8_DR))
+		return 0;
+
+	return (val & ADP_DP_CS_8_REQUESTED_BW_MASK) * granularity;
+}
-- 
2.35.1


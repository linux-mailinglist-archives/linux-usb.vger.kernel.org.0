Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C6A550FBEE
	for <lists+linux-usb@lfdr.de>; Tue, 26 Apr 2022 13:26:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349549AbiDZL3G (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 26 Apr 2022 07:29:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349528AbiDZL2x (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 26 Apr 2022 07:28:53 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C90B1837F
        for <linux-usb@vger.kernel.org>; Tue, 26 Apr 2022 04:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650972345; x=1682508345;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gWxaQy7lu7OIRrxF2l+CS51MpXnnWrcfE+rtD2qF32Y=;
  b=B3A68Y/OJ45H4xK5ChT4uXdE5gmp2IBL/Z1JhiNPL5xWv1wfTmb6OSjN
   mQmzgxUaaAPv9cn2AC/sR2IX8F/xssmT7u6I12//3DgLuOEGKrjN3Fg64
   l541UTXWgSo6yjVJfOBd342+vCIrZN+/L6lFaQVsov7x2ByrqHsXgmNgT
   U6t8Yq9Mti9u61MhDhpqEPlDfVNh9smKevV+uKr1uGepaSCLr1MA+WzMe
   mvfl9RGpm4b+NVWfar7QdM+hpdhJ2pj73ltNOiNwkldFnTMljSFw6qMHb
   bbkHQ4qKKIJYEiXiRM+OCsxi7MmGjZPAkWM4mZVKLA/d3v3pYFQ5T55Fq
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10328"; a="328488134"
X-IronPort-AV: E=Sophos;i="5.90,290,1643702400"; 
   d="scan'208";a="328488134"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2022 04:25:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,290,1643702400"; 
   d="scan'208";a="558263113"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 26 Apr 2022 04:25:42 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 81BCF6E2; Tue, 26 Apr 2022 14:25:40 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Lukas Wunner <lukas@wunner.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 5/5] thunderbolt: Add support for XDomain lane bonding
Date:   Tue, 26 Apr 2022 14:25:40 +0300
Message-Id: <20220426112540.6053-6-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220426112540.6053-1-mika.westerberg@linux.intel.com>
References: <20220426112540.6053-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The USB4 Inter-Domain Service specification defines a protocol that can
be used to establish lane bonding between two USB4 domains (hosts). So
far we have not implemented it because the host controller DMA was not
fast enough to be able to go over 20 Gbits/s even if lanes were bonded.
However, starting from Intel Alder Lake CPUs the DMA can go over
20 Gbits/s so now it makes more sense to add this support to the driver.

Because both ends need to negotiate the bonding we add a simple state
machine that tracks the connection state and does the necessary steps
described by the USB4 Inter-Domain Service specification. We only
establish lane bonding when both sides of the link support it. Otherwise
we default to use the single lane. Also this is only done when software
connection manager is used. On systems with firmware based connection
manager, it handles the high-speed tunneling so bonding lanes is
specific to the implementation (Intel firmware based connection manager
does not support lane bonding).

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tb.c      |   6 -
 drivers/thunderbolt/tb_msgs.h |  39 +++
 drivers/thunderbolt/tb_regs.h |   5 +
 drivers/thunderbolt/xdomain.c | 609 ++++++++++++++++++++++++++++++----
 include/linux/thunderbolt.h   |  19 +-
 5 files changed, 595 insertions(+), 83 deletions(-)

diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index 44d04b651a8b..9a3214fb5038 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -169,12 +169,6 @@ static void tb_discover_tunnels(struct tb *tb)
 
 static int tb_port_configure_xdomain(struct tb_port *port)
 {
-	/*
-	 * XDomain paths currently only support single lane so we must
-	 * disable the other lane according to USB4 spec.
-	 */
-	tb_port_disable(port->dual_link_port);
-
 	if (tb_switch_is_usb4(port->sw))
 		return usb4_port_configure_xdomain(port);
 	return tb_lc_configure_xdomain(port);
diff --git a/drivers/thunderbolt/tb_msgs.h b/drivers/thunderbolt/tb_msgs.h
index fe1afa44c56d..33c4c7aed56d 100644
--- a/drivers/thunderbolt/tb_msgs.h
+++ b/drivers/thunderbolt/tb_msgs.h
@@ -527,6 +527,10 @@ enum tb_xdp_type {
 	PROPERTIES_CHANGED_RESPONSE,
 	ERROR_RESPONSE,
 	UUID_REQUEST = 12,
+	LINK_STATE_STATUS_REQUEST = 15,
+	LINK_STATE_STATUS_RESPONSE,
+	LINK_STATE_CHANGE_REQUEST,
+	LINK_STATE_CHANGE_RESPONSE,
 };
 
 struct tb_xdp_header {
@@ -540,6 +544,41 @@ struct tb_xdp_error_response {
 	u32 error;
 };
 
+struct tb_xdp_link_state_status {
+	struct tb_xdp_header hdr;
+};
+
+struct tb_xdp_link_state_status_response {
+	union {
+		struct tb_xdp_error_response err;
+		struct {
+			struct tb_xdp_header hdr;
+			u32 status;
+			u8 slw;
+			u8 tlw;
+			u8 sls;
+			u8 tls;
+		};
+	};
+};
+
+struct tb_xdp_link_state_change {
+	struct tb_xdp_header hdr;
+	u8 tlw;
+	u8 tls;
+	u16 reserved;
+};
+
+struct tb_xdp_link_state_change_response {
+	union {
+		struct tb_xdp_error_response err;
+		struct {
+			struct tb_xdp_header hdr;
+			u32 status;
+		};
+	};
+};
+
 struct tb_xdp_uuid {
 	struct tb_xdp_header hdr;
 };
diff --git a/drivers/thunderbolt/tb_regs.h b/drivers/thunderbolt/tb_regs.h
index b301eeb0c89b..6a16f61a72a1 100644
--- a/drivers/thunderbolt/tb_regs.h
+++ b/drivers/thunderbolt/tb_regs.h
@@ -311,11 +311,16 @@ struct tb_regs_port_header {
 
 /* Lane adapter registers */
 #define LANE_ADP_CS_0				0x00
+#define LANE_ADP_CS_0_SUPPORTED_SPEED_MASK	GENMASK(19, 16)
+#define LANE_ADP_CS_0_SUPPORTED_SPEED_SHIFT	16
 #define LANE_ADP_CS_0_SUPPORTED_WIDTH_MASK	GENMASK(25, 20)
 #define LANE_ADP_CS_0_SUPPORTED_WIDTH_SHIFT	20
+#define LANE_ADP_CS_0_SUPPORTED_WIDTH_DUAL	0x2
 #define LANE_ADP_CS_0_CL0S_SUPPORT		BIT(26)
 #define LANE_ADP_CS_0_CL1_SUPPORT		BIT(27)
 #define LANE_ADP_CS_1				0x01
+#define LANE_ADP_CS_1_TARGET_SPEED_MASK		GENMASK(3, 0)
+#define LANE_ADP_CS_1_TARGET_SPEED_GEN3		0xc
 #define LANE_ADP_CS_1_TARGET_WIDTH_MASK		GENMASK(9, 4)
 #define LANE_ADP_CS_1_TARGET_WIDTH_SHIFT	4
 #define LANE_ADP_CS_1_TARGET_WIDTH_SINGLE	0x1
diff --git a/drivers/thunderbolt/xdomain.c b/drivers/thunderbolt/xdomain.c
index 01d6b724ca51..c31c0d94d8b3 100644
--- a/drivers/thunderbolt/xdomain.c
+++ b/drivers/thunderbolt/xdomain.c
@@ -19,13 +19,38 @@
 
 #include "tb.h"
 
-#define XDOMAIN_DEFAULT_TIMEOUT			1000 /* ms */
-#define XDOMAIN_UUID_RETRIES			10
-#define XDOMAIN_PROPERTIES_RETRIES		10
-#define XDOMAIN_PROPERTIES_CHANGED_RETRIES	10
-#define XDOMAIN_BONDING_WAIT			100  /* ms */
+#define XDOMAIN_SHORT_TIMEOUT			100	/* ms */
+#define XDOMAIN_DEFAULT_TIMEOUT			1000	/* ms */
+#define XDOMAIN_BONDING_TIMEOUT			10000	/* ms */
+#define XDOMAIN_RETRIES				10
 #define XDOMAIN_DEFAULT_MAX_HOPID		15
 
+enum {
+	XDOMAIN_STATE_INIT,
+	XDOMAIN_STATE_UUID,
+	XDOMAIN_STATE_LINK_STATUS,
+	XDOMAIN_STATE_LINK_STATE_CHANGE,
+	XDOMAIN_STATE_LINK_STATUS2,
+	XDOMAIN_STATE_BONDING_UUID_LOW,
+	XDOMAIN_STATE_BONDING_UUID_HIGH,
+	XDOMAIN_STATE_PROPERTIES,
+	XDOMAIN_STATE_ENUMERATED,
+	XDOMAIN_STATE_ERROR,
+};
+
+static const char * const state_names[] = {
+	[XDOMAIN_STATE_INIT] = "INIT",
+	[XDOMAIN_STATE_UUID] = "UUID",
+	[XDOMAIN_STATE_LINK_STATUS] = "LINK_STATUS",
+	[XDOMAIN_STATE_LINK_STATE_CHANGE] = "LINK_STATE_CHANGE",
+	[XDOMAIN_STATE_LINK_STATUS2] = "LINK_STATUS2",
+	[XDOMAIN_STATE_BONDING_UUID_LOW] = "BONDING_UUID_LOW",
+	[XDOMAIN_STATE_BONDING_UUID_HIGH] = "BONDING_UUID_HIGH",
+	[XDOMAIN_STATE_PROPERTIES] = "PROPERTIES",
+	[XDOMAIN_STATE_ENUMERATED] = "ENUMERATED",
+	[XDOMAIN_STATE_ERROR] = "ERROR",
+};
+
 struct xdomain_request_work {
 	struct work_struct work;
 	struct tb_xdp_header *pkg;
@@ -235,7 +260,7 @@ static int tb_xdp_handle_error(const struct tb_xdp_error_response *res)
 }
 
 static int tb_xdp_uuid_request(struct tb_ctl *ctl, u64 route, int retry,
-			       uuid_t *uuid)
+			       uuid_t *uuid, u64 *remote_route)
 {
 	struct tb_xdp_uuid_response res;
 	struct tb_xdp_uuid req;
@@ -258,6 +283,8 @@ static int tb_xdp_uuid_request(struct tb_ctl *ctl, u64 route, int retry,
 		return ret;
 
 	uuid_copy(uuid, &res.src_uuid);
+	*remote_route = (u64)res.src_route_hi << 32 | res.src_route_lo;
+
 	return 0;
 }
 
@@ -473,6 +500,112 @@ tb_xdp_properties_changed_response(struct tb_ctl *ctl, u64 route, u8 sequence)
 				     TB_CFG_PKG_XDOMAIN_RESP);
 }
 
+static int tb_xdp_link_state_status_request(struct tb_ctl *ctl, u64 route,
+					    u8 sequence, u8 *slw, u8 *tlw,
+					    u8 *sls, u8 *tls)
+{
+	struct tb_xdp_link_state_status_response res;
+	struct tb_xdp_link_state_status req;
+	int ret;
+
+	memset(&req, 0, sizeof(req));
+	tb_xdp_fill_header(&req.hdr, route, sequence, LINK_STATE_STATUS_REQUEST,
+			   sizeof(req));
+
+	memset(&res, 0, sizeof(res));
+	ret = __tb_xdomain_request(ctl, &req, sizeof(req), TB_CFG_PKG_XDOMAIN_REQ,
+				   &res, sizeof(res), TB_CFG_PKG_XDOMAIN_RESP,
+				   XDOMAIN_DEFAULT_TIMEOUT);
+	if (ret)
+		return ret;
+
+	ret = tb_xdp_handle_error(&res.err);
+	if (ret)
+		return ret;
+
+	if (res.status != 0)
+		return -EREMOTEIO;
+
+	*slw = res.slw;
+	*tlw = res.tlw;
+	*sls = res.sls;
+	*tls = res.tls;
+
+	return 0;
+}
+
+static int tb_xdp_link_state_status_response(struct tb *tb, struct tb_ctl *ctl,
+					     struct tb_xdomain *xd, u8 sequence)
+{
+	struct tb_switch *sw = tb_to_switch(xd->dev.parent);
+	struct tb_xdp_link_state_status_response res;
+	struct tb_port *port = tb_port_at(xd->route, sw);
+	u32 val[2];
+	int ret;
+
+	memset(&res, 0, sizeof(res));
+	tb_xdp_fill_header(&res.hdr, xd->route, sequence,
+			   LINK_STATE_STATUS_RESPONSE, sizeof(res));
+
+	ret = tb_port_read(port, val, TB_CFG_PORT,
+			   port->cap_phy + LANE_ADP_CS_0, ARRAY_SIZE(val));
+	if (ret)
+		return ret;
+
+	res.slw = (val[0] & LANE_ADP_CS_0_SUPPORTED_WIDTH_MASK) >>
+			LANE_ADP_CS_0_SUPPORTED_WIDTH_SHIFT;
+	res.sls = (val[0] & LANE_ADP_CS_0_SUPPORTED_SPEED_MASK) >>
+			LANE_ADP_CS_0_SUPPORTED_SPEED_SHIFT;
+	res.tls = val[1] & LANE_ADP_CS_1_TARGET_SPEED_MASK;
+	res.tlw = (val[1] & LANE_ADP_CS_1_TARGET_WIDTH_MASK) >>
+			LANE_ADP_CS_1_TARGET_WIDTH_SHIFT;
+
+	return __tb_xdomain_response(ctl, &res, sizeof(res),
+				     TB_CFG_PKG_XDOMAIN_RESP);
+}
+
+static int tb_xdp_link_state_change_request(struct tb_ctl *ctl, u64 route,
+					    u8 sequence, u8 tlw, u8 tls)
+{
+	struct tb_xdp_link_state_change_response res;
+	struct tb_xdp_link_state_change req;
+	int ret;
+
+	memset(&req, 0, sizeof(req));
+	tb_xdp_fill_header(&req.hdr, route, sequence, LINK_STATE_CHANGE_REQUEST,
+			   sizeof(req));
+	req.tlw = tlw;
+	req.tls = tls;
+
+	memset(&res, 0, sizeof(res));
+	ret = __tb_xdomain_request(ctl, &req, sizeof(req), TB_CFG_PKG_XDOMAIN_REQ,
+				   &res, sizeof(res), TB_CFG_PKG_XDOMAIN_RESP,
+				   XDOMAIN_DEFAULT_TIMEOUT);
+	if (ret)
+		return ret;
+
+	ret = tb_xdp_handle_error(&res.err);
+	if (ret)
+		return ret;
+
+	return res.status != 0 ? -EREMOTEIO : 0;
+}
+
+static int tb_xdp_link_state_change_response(struct tb_ctl *ctl, u64 route,
+					     u8 sequence, u32 status)
+{
+	struct tb_xdp_link_state_change_response res;
+
+	memset(&res, 0, sizeof(res));
+	tb_xdp_fill_header(&res.hdr, route, sequence, LINK_STATE_CHANGE_RESPONSE,
+			   sizeof(res));
+
+	res.status = status;
+
+	return __tb_xdomain_response(ctl, &res, sizeof(res),
+				     TB_CFG_PKG_XDOMAIN_RESP);
+}
+
 /**
  * tb_register_protocol_handler() - Register protocol handler
  * @handler: Handler to register
@@ -600,14 +733,13 @@ static void tb_xdp_handle_request(struct work_struct *work)
 		goto out;
 	}
 
-	tb_dbg(tb, "%llx: received XDomain request %#x\n", route, pkg->type);
-
 	xd = tb_xdomain_find_by_route_locked(tb, route);
 	if (xd)
 		update_property_block(xd);
 
 	switch (pkg->type) {
 	case PROPERTIES_REQUEST:
+		tb_dbg(tb, "%llx: received XDomain properties request\n", route);
 		if (xd) {
 			ret = tb_xdp_properties_response(tb, ctl, xd, sequence,
 				(const struct tb_xdp_properties *)pkg);
@@ -615,6 +747,9 @@ static void tb_xdp_handle_request(struct work_struct *work)
 		break;
 
 	case PROPERTIES_CHANGED_REQUEST:
+		tb_dbg(tb, "%llx: received XDomain properties changed request\n",
+		       route);
+
 		ret = tb_xdp_properties_changed_response(ctl, route, sequence);
 
 		/*
@@ -622,18 +757,51 @@ static void tb_xdp_handle_request(struct work_struct *work)
 		 * the xdomain related to this connection as well in
 		 * case there is a change in services it offers.
 		 */
-		if (xd && device_is_registered(&xd->dev)) {
-			queue_delayed_work(tb->wq, &xd->get_properties_work,
-					   msecs_to_jiffies(50));
-		}
+		if (xd && device_is_registered(&xd->dev))
+			queue_delayed_work(tb->wq, &xd->state_work,
+					   msecs_to_jiffies(XDOMAIN_SHORT_TIMEOUT));
 		break;
 
 	case UUID_REQUEST_OLD:
 	case UUID_REQUEST:
+		tb_dbg(tb, "%llx: received XDomain UUID request\n", route);
 		ret = tb_xdp_uuid_response(ctl, route, sequence, uuid);
 		break;
 
+	case LINK_STATE_STATUS_REQUEST:
+		tb_dbg(tb, "%llx: received XDomain link state status request\n",
+		       route);
+
+		if (xd) {
+			ret = tb_xdp_link_state_status_response(tb, ctl, xd,
+								sequence);
+		} else {
+			tb_xdp_error_response(ctl, route, sequence,
+					      ERROR_NOT_READY);
+		}
+		break;
+
+	case LINK_STATE_CHANGE_REQUEST:
+		tb_dbg(tb, "%llx: received XDomain link state change request\n",
+		       route);
+
+		if (xd && xd->state == XDOMAIN_STATE_BONDING_UUID_HIGH) {
+			const struct tb_xdp_link_state_change *lsc =
+				(const struct tb_xdp_link_state_change *)pkg;
+
+			ret = tb_xdp_link_state_change_response(ctl, route,
+								sequence, 0);
+			xd->target_link_width = lsc->tlw;
+			queue_delayed_work(tb->wq, &xd->state_work,
+					   msecs_to_jiffies(XDOMAIN_SHORT_TIMEOUT));
+		} else {
+			tb_xdp_error_response(ctl, route, sequence,
+					      ERROR_NOT_READY);
+		}
+		break;
+
 	default:
+		tb_dbg(tb, "%llx: unknown XDomain request %#x\n", route, pkg->type);
 		tb_xdp_error_response(ctl, route, sequence,
 				      ERROR_NOT_SUPPORTED);
 		break;
@@ -1000,32 +1168,38 @@ static int tb_xdomain_update_link_attributes(struct tb_xdomain *xd)
 	return 0;
 }
 
-static void tb_xdomain_get_uuid(struct work_struct *work)
+static int tb_xdomain_get_uuid(struct tb_xdomain *xd)
 {
-	struct tb_xdomain *xd = container_of(work, typeof(*xd),
-					     get_uuid_work.work);
 	struct tb *tb = xd->tb;
 	uuid_t uuid;
+	u64 route;
 	int ret;
 
 	dev_dbg(&xd->dev, "requesting remote UUID\n");
 
-	ret = tb_xdp_uuid_request(tb->ctl, xd->route, xd->uuid_retries, &uuid);
+	ret = tb_xdp_uuid_request(tb->ctl, xd->route, xd->state_retries, &uuid,
+				  &route);
 	if (ret < 0) {
-		if (xd->uuid_retries-- > 0) {
+		if (xd->state_retries-- > 0) {
 			dev_dbg(&xd->dev, "failed to request UUID, retrying\n");
-			queue_delayed_work(xd->tb->wq, &xd->get_uuid_work,
-					   msecs_to_jiffies(100));
+			return -EAGAIN;
 		} else {
 			dev_dbg(&xd->dev, "failed to read remote UUID\n");
 		}
-		return;
+		return ret;
 	}
 
 	dev_dbg(&xd->dev, "got remote UUID %pUb\n", &uuid);
 
-	if (uuid_equal(&uuid, xd->local_uuid))
-		dev_dbg(&xd->dev, "intra-domain loop detected\n");
+	if (uuid_equal(&uuid, xd->local_uuid)) {
+		if (route == xd->route)
+			dev_dbg(&xd->dev, "loop back detected\n");
+		else
+			dev_dbg(&xd->dev, "intra-domain loop detected\n");
+
+		/* Don't bond lanes automatically for loops */
+		xd->bonding_possible = false;
+	}
 
 	/*
 	 * If the UUID is different, there is another domain connected
@@ -1035,27 +1209,152 @@ static void tb_xdomain_get_uuid(struct work_struct *work)
 	if (xd->remote_uuid && !uuid_equal(&uuid, xd->remote_uuid)) {
 		dev_dbg(&xd->dev, "remote UUID is different, unplugging\n");
 		xd->is_unplugged = true;
-		return;
+		return -ENODEV;
 	}
 
 	/* First time fill in the missing UUID */
 	if (!xd->remote_uuid) {
 		xd->remote_uuid = kmemdup(&uuid, sizeof(uuid_t), GFP_KERNEL);
 		if (!xd->remote_uuid)
-			return;
+			return -ENOMEM;
 	}
 
-	/* Now we can start the normal properties exchange */
-	queue_delayed_work(xd->tb->wq, &xd->properties_changed_work,
-			   msecs_to_jiffies(100));
-	queue_delayed_work(xd->tb->wq, &xd->get_properties_work,
-			   msecs_to_jiffies(1000));
+	return 0;
 }
 
-static void tb_xdomain_get_properties(struct work_struct *work)
+static int tb_xdomain_get_link_status(struct tb_xdomain *xd)
+{
+	struct tb *tb = xd->tb;
+	u8 slw, tlw, sls, tls;
+	int ret;
+
+	dev_dbg(&xd->dev, "sending link state status request to %pUb\n",
+		xd->remote_uuid);
+
+	ret = tb_xdp_link_state_status_request(tb->ctl, xd->route,
+					       xd->state_retries, &slw, &tlw, &sls,
+					       &tls);
+	if (ret) {
+		if (ret != -EOPNOTSUPP && xd->state_retries-- > 0) {
+			dev_dbg(&xd->dev,
+				"failed to request remote link status, retrying\n");
+			return -EAGAIN;
+		}
+		dev_dbg(&xd->dev, "failed to receive remote link status\n");
+		return ret;
+	}
+
+	dev_dbg(&xd->dev, "remote link supports width %#x speed %#x\n", slw, sls);
+
+	if (slw < LANE_ADP_CS_0_SUPPORTED_WIDTH_DUAL) {
+		dev_dbg(&xd->dev, "remote adapter is single lane only\n");
+		return -EOPNOTSUPP;
+	}
+
+	return 0;
+}
+
+static int tb_xdomain_link_state_change(struct tb_xdomain *xd,
+					unsigned int width)
+{
+	struct tb_switch *sw = tb_to_switch(xd->dev.parent);
+	struct tb_port *port = tb_port_at(xd->route, sw);
+	struct tb *tb = xd->tb;
+	u8 tlw, tls;
+	u32 val;
+	int ret;
+
+	if (width == 2)
+		tlw = LANE_ADP_CS_1_TARGET_WIDTH_DUAL;
+	else if (width == 1)
+		tlw = LANE_ADP_CS_1_TARGET_WIDTH_SINGLE;
+	else
+		return -EINVAL;
+
+	/* Use the current target speed */
+	ret = tb_port_read(port, &val, TB_CFG_PORT, port->cap_phy + LANE_ADP_CS_1, 1);
+	if (ret)
+		return ret;
+	tls = val & LANE_ADP_CS_1_TARGET_SPEED_MASK;
+
+	dev_dbg(&xd->dev, "sending link state change request with width %#x speed %#x\n",
+		tlw, tls);
+
+	ret = tb_xdp_link_state_change_request(tb->ctl, xd->route,
+					       xd->state_retries, tlw, tls);
+	if (ret) {
+		if (ret != -EOPNOTSUPP && xd->state_retries-- > 0) {
+			dev_dbg(&xd->dev,
+				"failed to change remote link state, retrying\n");
+			return -EAGAIN;
+		}
+		dev_err(&xd->dev, "failed request link state change, aborting\n");
+		return ret;
+	}
+
+	dev_dbg(&xd->dev, "received link state change response\n");
+	return 0;
+}
+
+static int tb_xdomain_bond_lanes_uuid_high(struct tb_xdomain *xd)
+{
+	struct tb_port *port;
+	int ret, width;
+
+	if (xd->target_link_width == LANE_ADP_CS_1_TARGET_WIDTH_SINGLE) {
+		width = 1;
+	} else if (xd->target_link_width == LANE_ADP_CS_1_TARGET_WIDTH_DUAL) {
+		width = 2;
+	} else {
+		if (xd->state_retries-- > 0) {
+			dev_dbg(&xd->dev,
+				"link state change request not received yet, retrying\n");
+			return -EAGAIN;
+		}
+		dev_dbg(&xd->dev, "timeout waiting for link change request\n");
+		return -ETIMEDOUT;
+	}
+
+	port = tb_port_at(xd->route, tb_xdomain_parent(xd));
+
+	/*
+	 * We can't use tb_xdomain_lane_bonding_enable() here because it
+	 * is the other side that initiates lane bonding. So here we
+	 * just set the width to both lane adapters and wait for the
+	 * link to transition bonded.
+	 */
+	ret = tb_port_set_link_width(port->dual_link_port, width);
+	if (ret) {
+		tb_port_warn(port->dual_link_port,
+			     "failed to set link width to %d\n", width);
+		return ret;
+	}
+
+	ret = tb_port_set_link_width(port, width);
+	if (ret) {
+		tb_port_warn(port, "failed to set link width to %d\n", width);
+		return ret;
+	}
+
+	ret = tb_port_wait_for_link_width(port, width, XDOMAIN_BONDING_TIMEOUT);
+	if (ret) {
+		dev_warn(&xd->dev, "error waiting for link width to become %d\n",
+			 width);
+		return ret;
+	}
+
+	port->bonded = width == 2;
+	port->dual_link_port->bonded = width == 2;
+
+	tb_port_update_credits(port);
+	tb_xdomain_update_link_attributes(xd);
+
+	dev_dbg(&xd->dev, "lane bonding %sabled\n", width == 2 ? "en" : "dis");
+	return 0;
+}
+
+static int tb_xdomain_get_properties(struct tb_xdomain *xd)
 {
-	struct tb_xdomain *xd = container_of(work, typeof(*xd),
-					     get_properties_work.work);
 	struct tb_property_dir *dir;
 	struct tb *tb = xd->tb;
 	bool update = false;
@@ -1066,34 +1365,35 @@ static void tb_xdomain_get_properties(struct work_struct *work)
 	dev_dbg(&xd->dev, "requesting remote properties\n");
 
 	ret = tb_xdp_properties_request(tb->ctl, xd->route, xd->local_uuid,
-					xd->remote_uuid, xd->properties_retries,
+					xd->remote_uuid, xd->state_retries,
 					&block, &gen);
 	if (ret < 0) {
-		if (xd->properties_retries-- > 0) {
+		if (xd->state_retries-- > 0) {
 			dev_dbg(&xd->dev,
 				"failed to request remote properties, retrying\n");
-			queue_delayed_work(xd->tb->wq, &xd->get_properties_work,
-					   msecs_to_jiffies(1000));
+			return -EAGAIN;
 		} else {
 			/* Give up now */
 			dev_err(&xd->dev,
 				"failed read XDomain properties from %pUb\n",
 				xd->remote_uuid);
 		}
-		return;
-	}
 
-	xd->properties_retries = XDOMAIN_PROPERTIES_RETRIES;
+		return ret;
+	}
 
 	mutex_lock(&xd->lock);
 
 	/* Only accept newer generation properties */
-	if (xd->remote_properties && gen <= xd->remote_property_block_gen)
+	if (xd->remote_properties && gen <= xd->remote_property_block_gen) {
+		ret = 0;
 		goto err_free_block;
+	}
 
 	dir = tb_property_parse_dir(block, ret);
 	if (!dir) {
 		dev_err(&xd->dev, "failed to parse XDomain properties\n");
+		ret = -ENOMEM;
 		goto err_free_block;
 	}
 
@@ -1124,9 +1424,16 @@ static void tb_xdomain_get_properties(struct work_struct *work)
 	 * registered, we notify the userspace that it has changed.
 	 */
 	if (!update) {
+		struct tb_port *port;
+
+		/* Now disable lane 1 if bonding was not enabled */
+		port = tb_port_at(xd->route, tb_xdomain_parent(xd));
+		if (!port->bonded)
+			tb_port_disable(port->dual_link_port);
+
 		if (device_add(&xd->dev)) {
 			dev_err(&xd->dev, "failed to add XDomain device\n");
-			return;
+			return -ENODEV;
 		}
 		dev_info(&xd->dev, "new host found, vendor=%#x device=%#x\n",
 			 xd->vendor, xd->device);
@@ -1138,13 +1445,193 @@ static void tb_xdomain_get_properties(struct work_struct *work)
 	}
 
 	enumerate_services(xd);
-	return;
+	return 0;
 
 err_free_dir:
 	tb_property_free_dir(dir);
 err_free_block:
 	kfree(block);
 	mutex_unlock(&xd->lock);
+
+	return ret;
+}
+
+static void tb_xdomain_queue_uuid(struct tb_xdomain *xd)
+{
+	xd->state = XDOMAIN_STATE_UUID;
+	xd->state_retries = XDOMAIN_RETRIES;
+	queue_delayed_work(xd->tb->wq, &xd->state_work,
+			   msecs_to_jiffies(XDOMAIN_SHORT_TIMEOUT));
+}
+
+static void tb_xdomain_queue_link_status(struct tb_xdomain *xd)
+{
+	xd->state = XDOMAIN_STATE_LINK_STATUS;
+	xd->state_retries = XDOMAIN_RETRIES;
+	queue_delayed_work(xd->tb->wq, &xd->state_work,
+			   msecs_to_jiffies(XDOMAIN_DEFAULT_TIMEOUT));
+}
+
+static void tb_xdomain_queue_link_status2(struct tb_xdomain *xd)
+{
+	xd->state = XDOMAIN_STATE_LINK_STATUS2;
+	xd->state_retries = XDOMAIN_RETRIES;
+	queue_delayed_work(xd->tb->wq, &xd->state_work,
+			   msecs_to_jiffies(XDOMAIN_DEFAULT_TIMEOUT));
+}
+
+static void tb_xdomain_queue_bonding(struct tb_xdomain *xd)
+{
+	if (memcmp(xd->local_uuid, xd->remote_uuid, UUID_SIZE) > 0) {
+		dev_dbg(&xd->dev, "we have higher UUID, other side bonds the lanes\n");
+		xd->state = XDOMAIN_STATE_BONDING_UUID_HIGH;
+	} else {
+		dev_dbg(&xd->dev, "we have lower UUID, bonding lanes\n");
+		xd->state = XDOMAIN_STATE_LINK_STATE_CHANGE;
+	}
+
+	xd->state_retries = XDOMAIN_RETRIES;
+	queue_delayed_work(xd->tb->wq, &xd->state_work,
+			   msecs_to_jiffies(XDOMAIN_DEFAULT_TIMEOUT));
+}
+
+static void tb_xdomain_queue_bonding_uuid_low(struct tb_xdomain *xd)
+{
+	xd->state = XDOMAIN_STATE_BONDING_UUID_LOW;
+	xd->state_retries = XDOMAIN_RETRIES;
+	queue_delayed_work(xd->tb->wq, &xd->state_work,
+			   msecs_to_jiffies(XDOMAIN_DEFAULT_TIMEOUT));
+}
+
+static void tb_xdomain_queue_properties(struct tb_xdomain *xd)
+{
+	xd->state = XDOMAIN_STATE_PROPERTIES;
+	xd->state_retries = XDOMAIN_RETRIES;
+	queue_delayed_work(xd->tb->wq, &xd->state_work,
+			   msecs_to_jiffies(XDOMAIN_DEFAULT_TIMEOUT));
+}
+
+static void tb_xdomain_queue_properties_changed(struct tb_xdomain *xd)
+{
+	xd->properties_changed_retries = XDOMAIN_RETRIES;
+	queue_delayed_work(xd->tb->wq, &xd->properties_changed_work,
+			   msecs_to_jiffies(XDOMAIN_SHORT_TIMEOUT));
+}
+
+static void tb_xdomain_state_work(struct work_struct *work)
+{
+	struct tb_xdomain *xd = container_of(work, typeof(*xd), state_work.work);
+	int ret, state = xd->state;
+
+	if (WARN_ON_ONCE(state < XDOMAIN_STATE_INIT ||
+			 state > XDOMAIN_STATE_ERROR))
+		return;
+
+	dev_dbg(&xd->dev, "running state %s\n", state_names[state]);
+
+	switch (state) {
+	case XDOMAIN_STATE_INIT:
+		if (xd->needs_uuid) {
+			tb_xdomain_queue_uuid(xd);
+		} else {
+			tb_xdomain_queue_properties_changed(xd);
+			tb_xdomain_queue_properties(xd);
+		}
+		break;
+
+	case XDOMAIN_STATE_UUID:
+		ret = tb_xdomain_get_uuid(xd);
+		if (ret) {
+			if (ret == -EAGAIN)
+				goto retry_state;
+			xd->state = XDOMAIN_STATE_ERROR;
+		} else {
+			tb_xdomain_queue_properties_changed(xd);
+			if (xd->bonding_possible)
+				tb_xdomain_queue_link_status(xd);
+			else
+				tb_xdomain_queue_properties(xd);
+		}
+		break;
+
+	case XDOMAIN_STATE_LINK_STATUS:
+		ret = tb_xdomain_get_link_status(xd);
+		if (ret) {
+			if (ret == -EAGAIN)
+				goto retry_state;
+
+			/*
+			 * If any of the lane bonding states fail we skip
+			 * bonding completely and try to continue from
+			 * reading properties.
+			 */
+			tb_xdomain_queue_properties(xd);
+		} else {
+			tb_xdomain_queue_bonding(xd);
+		}
+		break;
+
+	case XDOMAIN_STATE_LINK_STATE_CHANGE:
+		ret = tb_xdomain_link_state_change(xd, 2);
+		if (ret) {
+			if (ret == -EAGAIN)
+				goto retry_state;
+			tb_xdomain_queue_properties(xd);
+		} else {
+			tb_xdomain_queue_link_status2(xd);
+		}
+		break;
+
+	case XDOMAIN_STATE_LINK_STATUS2:
+		ret = tb_xdomain_get_link_status(xd);
+		if (ret) {
+			if (ret == -EAGAIN)
+				goto retry_state;
+			tb_xdomain_queue_properties(xd);
+		} else {
+			tb_xdomain_queue_bonding_uuid_low(xd);
+		}
+		break;
+
+	case XDOMAIN_STATE_BONDING_UUID_LOW:
+		tb_xdomain_lane_bonding_enable(xd);
+		tb_xdomain_queue_properties(xd);
+		break;
+
+	case XDOMAIN_STATE_BONDING_UUID_HIGH:
+		if (tb_xdomain_bond_lanes_uuid_high(xd) == -EAGAIN)
+			goto retry_state;
+		tb_xdomain_queue_properties(xd);
+		break;
+
+	case XDOMAIN_STATE_PROPERTIES:
+		ret = tb_xdomain_get_properties(xd);
+		if (ret) {
+			if (ret == -EAGAIN)
+				goto retry_state;
+			xd->state = XDOMAIN_STATE_ERROR;
+		} else {
+			xd->state = XDOMAIN_STATE_ENUMERATED;
+		}
+		break;
+
+	case XDOMAIN_STATE_ENUMERATED:
+		tb_xdomain_queue_properties(xd);
+		break;
+
+	case XDOMAIN_STATE_ERROR:
+		break;
+
+	default:
+		dev_warn(&xd->dev, "unexpected state %d\n", state);
+		break;
+	}
+
+	return;
+
+retry_state:
+	queue_delayed_work(xd->tb->wq, &xd->state_work,
+			   msecs_to_jiffies(XDOMAIN_DEFAULT_TIMEOUT));
 }
 
 static void tb_xdomain_properties_changed(struct work_struct *work)
@@ -1163,13 +1650,13 @@ static void tb_xdomain_properties_changed(struct work_struct *work)
 				"failed to send properties changed notification, retrying\n");
 			queue_delayed_work(xd->tb->wq,
 					   &xd->properties_changed_work,
-					   msecs_to_jiffies(1000));
+					   msecs_to_jiffies(XDOMAIN_DEFAULT_TIMEOUT));
 		}
 		dev_err(&xd->dev, "failed to send properties changed notification\n");
 		return;
 	}
 
-	xd->properties_changed_retries = XDOMAIN_PROPERTIES_CHANGED_RETRIES;
+	xd->properties_changed_retries = XDOMAIN_RETRIES;
 }
 
 static ssize_t device_show(struct device *dev, struct device_attribute *attr,
@@ -1304,31 +1791,17 @@ static void tb_xdomain_release(struct device *dev)
 
 static void start_handshake(struct tb_xdomain *xd)
 {
-	xd->uuid_retries = XDOMAIN_UUID_RETRIES;
-	xd->properties_retries = XDOMAIN_PROPERTIES_RETRIES;
-	xd->properties_changed_retries = XDOMAIN_PROPERTIES_CHANGED_RETRIES;
-
-	if (xd->needs_uuid) {
-		queue_delayed_work(xd->tb->wq, &xd->get_uuid_work,
-				   msecs_to_jiffies(100));
-	} else {
-		/* Start exchanging properties with the other host */
-		queue_delayed_work(xd->tb->wq, &xd->properties_changed_work,
-				   msecs_to_jiffies(100));
-		queue_delayed_work(xd->tb->wq, &xd->get_properties_work,
-				   msecs_to_jiffies(1000));
-	}
+	xd->state = XDOMAIN_STATE_INIT;
+	queue_delayed_work(xd->tb->wq, &xd->state_work,
+			   msecs_to_jiffies(XDOMAIN_SHORT_TIMEOUT));
 }
 
 static void stop_handshake(struct tb_xdomain *xd)
 {
-	xd->uuid_retries = 0;
-	xd->properties_retries = 0;
-	xd->properties_changed_retries = 0;
-
-	cancel_delayed_work_sync(&xd->get_uuid_work);
-	cancel_delayed_work_sync(&xd->get_properties_work);
 	cancel_delayed_work_sync(&xd->properties_changed_work);
+	cancel_delayed_work_sync(&xd->state_work);
+	xd->properties_changed_retries = 0;
+	xd->state_retries = 0;
 }
 
 static int __maybe_unused tb_xdomain_suspend(struct device *dev)
@@ -1389,8 +1862,7 @@ struct tb_xdomain *tb_xdomain_alloc(struct tb *tb, struct device *parent,
 	ida_init(&xd->in_hopids);
 	ida_init(&xd->out_hopids);
 	mutex_init(&xd->lock);
-	INIT_DELAYED_WORK(&xd->get_uuid_work, tb_xdomain_get_uuid);
-	INIT_DELAYED_WORK(&xd->get_properties_work, tb_xdomain_get_properties);
+	INIT_DELAYED_WORK(&xd->state_work, tb_xdomain_state_work);
 	INIT_DELAYED_WORK(&xd->properties_changed_work,
 			  tb_xdomain_properties_changed);
 
@@ -1405,6 +1877,7 @@ struct tb_xdomain *tb_xdomain_alloc(struct tb *tb, struct device *parent,
 			goto err_free_local_uuid;
 	} else {
 		xd->needs_uuid = true;
+		xd->bonding_possible = !!down->dual_link_port;
 	}
 
 	device_initialize(&xd->dev);
@@ -1523,9 +1996,9 @@ int tb_xdomain_lane_bonding_enable(struct tb_xdomain *xd)
 		return ret;
 	}
 
-	ret = tb_port_wait_for_link_width(port, 2, 100);
+	ret = tb_port_wait_for_link_width(port, 2, XDOMAIN_BONDING_TIMEOUT);
 	if (ret) {
-		tb_port_warn(port, "timeout enabling lane bonding\n");
+		tb_port_warn(port, "failed to enable lane bonding\n");
 		return ret;
 	}
 
diff --git a/include/linux/thunderbolt.h b/include/linux/thunderbolt.h
index 124e13cb1469..e13fe15e6a51 100644
--- a/include/linux/thunderbolt.h
+++ b/include/linux/thunderbolt.h
@@ -198,15 +198,15 @@ void tb_unregister_property_dir(const char *key, struct tb_property_dir *dir);
  * @local_property_block_len: Length of the @local_property_block in dwords
  * @remote_properties: Properties exported by the remote domain
  * @remote_property_block_gen: Generation of @remote_properties
- * @get_uuid_work: Work used to retrieve @remote_uuid
- * @uuid_retries: Number of times left @remote_uuid is requested before
- *		  giving up
- * @get_properties_work: Work used to get remote domain properties
- * @properties_retries: Number of times left to read properties
+ * @state: Next XDomain discovery state to run
+ * @state_work: Work used to run the next state
+ * @state_retries: Number of retries remain for the state
  * @properties_changed_work: Work used to notify the remote domain that
  *			     our properties have changed
  * @properties_changed_retries: Number of times left to send properties
  *				changed notification
+ * @bonding_possible: True if lane bonding is possible on local side
+ * @target_link_width: Target link width from the remote host
  * @link: Root switch link the remote domain is connected (ICM only)
  * @depth: Depth in the chain the remote domain is connected (ICM only)
  *
@@ -244,12 +244,13 @@ struct tb_xdomain {
 	u32 local_property_block_len;
 	struct tb_property_dir *remote_properties;
 	u32 remote_property_block_gen;
-	struct delayed_work get_uuid_work;
-	int uuid_retries;
-	struct delayed_work get_properties_work;
-	int properties_retries;
+	int state;
+	struct delayed_work state_work;
+	int state_retries;
 	struct delayed_work properties_changed_work;
 	int properties_changed_retries;
+	bool bonding_possible;
+	u8 target_link_width;
 	u8 link;
 	u8 depth;
 };
-- 
2.35.1


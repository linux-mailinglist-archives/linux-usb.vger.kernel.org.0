Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB20B50FBEF
	for <lists+linux-usb@lfdr.de>; Tue, 26 Apr 2022 13:26:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349532AbiDZL2x (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 26 Apr 2022 07:28:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349517AbiDZL2v (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 26 Apr 2022 07:28:51 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67C8C167DC
        for <linux-usb@vger.kernel.org>; Tue, 26 Apr 2022 04:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650972343; x=1682508343;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=t7r5A+10aK/wrsTP9wrtNZZNpmneAano+kGOk2pPVdM=;
  b=ndEfGxE0f6cCRI/613FuiI8WOBtCuHaLtbXt4iot7QNHRvgg1OtMMFKa
   u+c97nxYPjoB/LeqUJkK/VXVeV78ROAfajZL413jlNEu/3DcqXuY6U2Jn
   mEsmNoN9aWg2zUu6wrSUzGeOGBPbmBEcS2FKDYv0oUBmxd5I5204aGEX6
   kwG7XF5IcqErcn0dEuLlUTq4hjjp7S33oDjh45KYjv6gjlme25UK92DpR
   84y9D/UzAU50NzbslnefHBRxPR9BlZ/I0cYEnAPFyJpCN9AuaBiYzXVjo
   hXoIiqzWruxeoLxAHrj/YWxCyTucFgDDhJtkqFoAhHiNG3w0TVhmQx7/x
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10328"; a="326034380"
X-IronPort-AV: E=Sophos;i="5.90,290,1643702400"; 
   d="scan'208";a="326034380"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2022 04:25:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,290,1643702400"; 
   d="scan'208";a="513106664"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga003.jf.intel.com with ESMTP; 26 Apr 2022 04:25:40 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 6DE395F2; Tue, 26 Apr 2022 14:25:40 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Lukas Wunner <lukas@wunner.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 3/5] thunderbolt: Split setting link width and lane bonding into own functions
Date:   Tue, 26 Apr 2022 14:25:38 +0300
Message-Id: <20220426112540.6053-4-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220426112540.6053-1-mika.westerberg@linux.intel.com>
References: <20220426112540.6053-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

When bonding lanes over XDomain the host that has "higher" UUID triggers
link re-train for bonding, and the host that has "lower" UUID just waits
for this to happen. To support this split setting the link width and
triggering the actual bonding a separate functions that can be called as
needed.

While there remove duplicated empty line in the kernel-doc comment of
tb_port_lane_bonding_disable().

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/switch.c | 86 ++++++++++++++++++++++++++++++------
 drivers/thunderbolt/tb.h     |  2 +
 2 files changed, 74 insertions(+), 14 deletions(-)

diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index 2d8a0fd3469c..525be2aa3ad9 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -999,7 +999,17 @@ static bool tb_port_is_width_supported(struct tb_port *port, int width)
 	return !!(widths & width);
 }
 
-static int tb_port_set_link_width(struct tb_port *port, unsigned int width)
+/**
+ * tb_port_set_link_width() - Set target link width of the lane adapter
+ * @port: Lane adapter
+ * @width: Target link width (%1 or %2)
+ *
+ * Sets the target link width of the lane adapter to @width. Does not
+ * enable/disable lane bonding. For that call tb_port_set_lane_bonding().
+ *
+ * Return: %0 in case of success and negative errno in case of error
+ */
+int tb_port_set_link_width(struct tb_port *port, unsigned int width)
 {
 	u32 val;
 	int ret;
@@ -1026,12 +1036,58 @@ static int tb_port_set_link_width(struct tb_port *port, unsigned int width)
 		return -EINVAL;
 	}
 
-	val |= LANE_ADP_CS_1_LB;
-
 	return tb_port_write(port, &val, TB_CFG_PORT,
 			     port->cap_phy + LANE_ADP_CS_1, 1);
 }
 
+/**
+ * tb_port_set_lane_bonding() - Enable/disable lane bonding
+ * @port: Lane adapter
+ * @bonding: enable/disable bonding
+ *
+ * Enables or disables lane bonding. This should be called after target
+ * link width has been set (tb_port_set_link_width()). Note in most
+ * cases one should use tb_port_lane_bonding_enable() instead to enable
+ * lane bonding.
+ *
+ * As a side effect sets @port->bonding accordingly (and does the same
+ * for lane 1 too).
+ *
+ * Return: %0 in case of success and negative errno in case of error
+ */
+int tb_port_set_lane_bonding(struct tb_port *port, bool bonding)
+{
+	u32 val;
+	int ret;
+
+	if (!port->cap_phy)
+		return -EINVAL;
+
+	ret = tb_port_read(port, &val, TB_CFG_PORT,
+			   port->cap_phy + LANE_ADP_CS_1, 1);
+	if (ret)
+		return ret;
+
+	if (bonding)
+		val |= LANE_ADP_CS_1_LB;
+	else
+		val &= ~LANE_ADP_CS_1_LB;
+
+	ret = tb_port_write(port, &val, TB_CFG_PORT,
+			    port->cap_phy + LANE_ADP_CS_1, 1);
+	if (ret)
+		return ret;
+
+	/*
+	 * When lane 0 bonding is set it will affect lane 1 too so
+	 * update both.
+	 */
+	port->bonded = bonding;
+	port->dual_link_port->bonded = bonding;
+
+	return 0;
+}
+
 /**
  * tb_port_lane_bonding_enable() - Enable bonding on port
  * @port: port to enable
@@ -1056,22 +1112,27 @@ int tb_port_lane_bonding_enable(struct tb_port *port)
 	if (ret == 1) {
 		ret = tb_port_set_link_width(port, 2);
 		if (ret)
-			return ret;
+			goto err_lane0;
 	}
 
 	ret = tb_port_get_link_width(port->dual_link_port);
 	if (ret == 1) {
 		ret = tb_port_set_link_width(port->dual_link_port, 2);
-		if (ret) {
-			tb_port_set_link_width(port, 1);
-			return ret;
-		}
+		if (ret)
+			goto err_lane0;
 	}
 
-	port->bonded = true;
-	port->dual_link_port->bonded = true;
+	ret = tb_port_set_lane_bonding(port, true);
+	if (ret)
+		goto err_lane1;
 
 	return 0;
+
+err_lane1:
+	tb_port_set_link_width(port->dual_link_port, 1);
+err_lane0:
+	tb_port_set_link_width(port, 1);
+	return ret;
 }
 
 /**
@@ -1080,13 +1141,10 @@ int tb_port_lane_bonding_enable(struct tb_port *port)
  *
  * Disable bonding by setting the link width of the port and the
  * other port in case of dual link port.
- *
  */
 void tb_port_lane_bonding_disable(struct tb_port *port)
 {
-	port->dual_link_port->bonded = false;
-	port->bonded = false;
-
+	tb_port_set_lane_bonding(port, false);
 	tb_port_set_link_width(port->dual_link_port, 1);
 	tb_port_set_link_width(port, 1);
 }
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index 8848e8de1fc3..4602c69913fa 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -1024,6 +1024,8 @@ static inline bool tb_port_use_credit_allocation(const struct tb_port *port)
 
 int tb_port_get_link_speed(struct tb_port *port);
 int tb_port_get_link_width(struct tb_port *port);
+int tb_port_set_link_width(struct tb_port *port, unsigned int width);
+int tb_port_set_lane_bonding(struct tb_port *port, bool bonding);
 int tb_port_lane_bonding_enable(struct tb_port *port);
 void tb_port_lane_bonding_disable(struct tb_port *port);
 int tb_port_wait_for_link_width(struct tb_port *port, int width,
-- 
2.35.1


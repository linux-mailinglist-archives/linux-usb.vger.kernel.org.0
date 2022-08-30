Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 462965A64B1
	for <lists+linux-usb@lfdr.de>; Tue, 30 Aug 2022 15:28:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230239AbiH3N2T (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 30 Aug 2022 09:28:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229669AbiH3N1p (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 30 Aug 2022 09:27:45 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C6339C8F0
        for <linux-usb@vger.kernel.org>; Tue, 30 Aug 2022 06:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661866062; x=1693402062;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=thtzIx7KBlO2CVcFELLqSIpPod3DbJ7OMeoA9urAECo=;
  b=GiZqZLjSUNaFVTu3rvjfyHNurwjThqEKIkWfwrmpK6Odde9QLTB/ssEn
   UJwJmPsU/U/NhDPLWS4fn72+XT+cCsliUKqyDoRQ1RYiGgIoQJEYo1LBw
   3/+LEH6pxp/rQwbTplx4FrvxTISrQUZwym8Ft66B3sJ2f5aaLwqDY2jdI
   xn+q1N9EsCDrUtzErd1QQmy6ctTXaQ7sW9z0iLZKTbLrAawidQG19fmxb
   rKanIFZlBScaZjWkXhcmn/Y+YfZp+tyvE3RQ9rFANnASvj6PcN5rxd4yn
   gbpWPkZK1+Mju42+wPe9tkQGgyl1Ovp5WFhz+VHVSC22k6Dc3y/DPXpy+
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10455"; a="321301068"
X-IronPort-AV: E=Sophos;i="5.93,275,1654585200"; 
   d="scan'208";a="321301068"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2022 06:27:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,275,1654585200"; 
   d="scan'208";a="562643202"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga003.jf.intel.com with ESMTP; 30 Aug 2022 06:27:37 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 341E71C3; Tue, 30 Aug 2022 16:27:52 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v2 4/5] thunderbolt: Add helper to check if CL states are enabled on port
Date:   Tue, 30 Aug 2022 16:27:50 +0300
Message-Id: <20220830132751.42518-5-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220830132751.42518-1-mika.westerberg@linux.intel.com>
References: <20220830132751.42518-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

We will need this when enabling lane margining support.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/switch.c  | 28 ++++++++++++++++++++++++++++
 drivers/thunderbolt/tb.h      |  1 +
 drivers/thunderbolt/tb_regs.h |  1 +
 3 files changed, 30 insertions(+)

diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index 0671f5361b5b..bd815e2cc6ec 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -1330,6 +1330,34 @@ static int tb_port_clx_enable(struct tb_port *port, enum tb_clx clx)
 	return __tb_port_clx_set(port, clx, true);
 }
 
+/**
+ * tb_port_is_clx_enabled() - Is given CL state enabled
+ * @port: USB4 port to check
+ * @clx_mask: Mask of CL states to check
+ *
+ * Returns true if any of the given CL states is enabled for @port.
+ */
+bool tb_port_is_clx_enabled(struct tb_port *port, unsigned int clx_mask)
+{
+	u32 val, mask = 0;
+	int ret;
+
+	if (!tb_port_clx_supported(port, clx_mask))
+		return false;
+
+	if (clx_mask & TB_CL1)
+		mask |= LANE_ADP_CS_1_CL0S_ENABLE | LANE_ADP_CS_1_CL1_ENABLE;
+	if (clx_mask & TB_CL2)
+		mask |= LANE_ADP_CS_1_CL2_ENABLE;
+
+	ret = tb_port_read(port, &val, TB_CFG_PORT,
+			   port->cap_phy + LANE_ADP_CS_1, 1);
+	if (ret)
+		return false;
+
+	return !!(val & mask);
+}
+
 static int tb_port_start_lane_initialization(struct tb_port *port)
 {
 	int ret;
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index 8555ad9d7234..ded1f1d6c12e 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -1035,6 +1035,7 @@ void tb_port_lane_bonding_disable(struct tb_port *port);
 int tb_port_wait_for_link_width(struct tb_port *port, int width,
 				int timeout_msec);
 int tb_port_update_credits(struct tb_port *port);
+bool tb_port_is_clx_enabled(struct tb_port *port, enum tb_clx clx);
 
 int tb_switch_find_vse_cap(struct tb_switch *sw, enum tb_switch_vse_cap vsec);
 int tb_switch_find_cap(struct tb_switch *sw, enum tb_switch_cap cap);
diff --git a/drivers/thunderbolt/tb_regs.h b/drivers/thunderbolt/tb_regs.h
index a45f295533cd..0fe1daa21423 100644
--- a/drivers/thunderbolt/tb_regs.h
+++ b/drivers/thunderbolt/tb_regs.h
@@ -334,6 +334,7 @@ struct tb_regs_port_header {
 #define LANE_ADP_CS_1_TARGET_WIDTH_DUAL		0x3
 #define LANE_ADP_CS_1_CL0S_ENABLE		BIT(10)
 #define LANE_ADP_CS_1_CL1_ENABLE		BIT(11)
+#define LANE_ADP_CS_1_CL2_ENABLE		BIT(12)
 #define LANE_ADP_CS_1_LD			BIT(14)
 #define LANE_ADP_CS_1_LB			BIT(15)
 #define LANE_ADP_CS_1_CURRENT_SPEED_MASK	GENMASK(19, 16)
-- 
2.35.1


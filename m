Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D3457147B8
	for <lists+linux-usb@lfdr.de>; Mon, 29 May 2023 12:04:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231944AbjE2KEz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 29 May 2023 06:04:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231955AbjE2KEm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 29 May 2023 06:04:42 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0C81DC
        for <linux-usb@vger.kernel.org>; Mon, 29 May 2023 03:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685354680; x=1716890680;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jg2dp+ihyvbHVduyz8Ezy3Sgn1CKDV3r6B3tpgCPtQU=;
  b=WFt1Duq1lnJg1bSQAlP4qnQok5Z1sWiXC0LHSJvtN3BQO9L5FEWNPSM0
   eL3citpkZ1gepTdbiYLEyP+Tg2b5AvsqFngjmujop/1mB5TQsBcpLVzcZ
   rXFiSqq5Rcbux3mT4HF0SBKssz3Fi0Pd6i4oPYD03w7ntyxxlaBPNtYjz
   BVH75MMMhTcdePP6g8pwdH7u8PtJ+xR9auRiJ4RZla9tU1N+/GHtZs8/v
   T3U7YNbD70U0++H3vW7wFpjVUDFRaUvehfVXbywxUiDNwXezgpUqRtE9S
   bdPq3vT3NLBbjuClLroI8OIm2KtGYRgaHMakcSZEbleApmjwQZxC9PsgL
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="354684483"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; 
   d="scan'208";a="354684483"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2023 03:04:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="683518665"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; 
   d="scan'208";a="683518665"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 29 May 2023 03:04:28 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 7D1AD11A3; Mon, 29 May 2023 13:04:26 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Gil Fine <gil.fine@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 18/20] thunderbolt: Initialize CL states from the hardware
Date:   Mon, 29 May 2023 13:04:23 +0300
Message-Id: <20230529100425.6125-19-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230529100425.6125-1-mika.westerberg@linux.intel.com>
References: <20230529100425.6125-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In case the boot firmware enabled any of them, read the currently
configured CL states and update the router structure accordingly.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/clx.c    | 100 +++++++++++++++++++++++++----------
 drivers/thunderbolt/switch.c |   4 ++
 drivers/thunderbolt/tb.h     |   1 +
 3 files changed, 78 insertions(+), 27 deletions(-)

diff --git a/drivers/thunderbolt/clx.c b/drivers/thunderbolt/clx.c
index 5e745386c413..960409df4405 100644
--- a/drivers/thunderbolt/clx.c
+++ b/drivers/thunderbolt/clx.c
@@ -15,6 +15,21 @@ static bool clx_enabled = true;
 module_param_named(clx, clx_enabled, bool, 0444);
 MODULE_PARM_DESC(clx, "allow low power states on the high-speed lanes (default: true)");
 
+static const char *clx_name(unsigned int clx)
+{
+	if (!clx)
+		return "disabled";
+
+	if (clx & TB_CL2)
+		return "CL0s/CL1/CL2";
+	if (clx & TB_CL1)
+		return "CL0s/CL1";
+	if (clx & TB_CL0S)
+		return "CL0s";
+
+	return "unknown";
+}
+
 static int tb_port_pm_secondary_set(struct tb_port *port, bool secondary)
 {
 	u32 phy;
@@ -117,6 +132,29 @@ static int tb_port_clx_enable(struct tb_port *port, unsigned int clx)
 	return tb_port_clx_set(port, clx, true);
 }
 
+static int tb_port_clx(struct tb_port *port)
+{
+	u32 val;
+	int ret;
+
+	if (!tb_port_clx_supported(port, TB_CL0S | TB_CL1 | TB_CL2))
+		return 0;
+
+	ret = tb_port_read(port, &val, TB_CFG_PORT,
+			   port->cap_phy + LANE_ADP_CS_1, 1);
+	if (ret)
+		return ret;
+
+	if (val & LANE_ADP_CS_1_CL0S_ENABLE)
+		ret |= TB_CL0S;
+	if (val & LANE_ADP_CS_1_CL1_ENABLE)
+		ret |= TB_CL1;
+	if (val & LANE_ADP_CS_1_CL2_ENABLE)
+		ret |= TB_CL2;
+
+	return ret;
+}
+
 /**
  * tb_port_clx_is_enabled() - Is given CL state enabled
  * @port: USB4 port to check
@@ -126,25 +164,45 @@ static int tb_port_clx_enable(struct tb_port *port, unsigned int clx)
  */
 bool tb_port_clx_is_enabled(struct tb_port *port, unsigned int clx)
 {
-	u32 val, mask = 0;
-	int ret;
+	return !!(tb_port_clx(port) & clx);
+}
 
-	if (!tb_port_clx_supported(port, clx))
-		return false;
+/**
+ * tb_switch_clx_init() - Initialize router CL states
+ * @sw: Router
+ *
+ * Can be called for any router. Initializes the current CL state by
+ * reading it from the hardware.
+ *
+ * Returns %0 in case of success and negative errno in case of failure.
+ */
+int tb_switch_clx_init(struct tb_switch *sw)
+{
+	struct tb_port *up, *down;
+	unsigned int clx, tmp;
 
-	if (clx & TB_CL0S)
-		mask |= LANE_ADP_CS_1_CL0S_ENABLE;
-	if (clx & TB_CL1)
-		mask |= LANE_ADP_CS_1_CL1_ENABLE;
-	if (clx & TB_CL2)
-		mask |= LANE_ADP_CS_1_CL2_ENABLE;
+	if (tb_switch_is_icm(sw))
+		return 0;
 
-	ret = tb_port_read(port, &val, TB_CFG_PORT,
-			   port->cap_phy + LANE_ADP_CS_1, 1);
-	if (ret)
-		return false;
+	if (!tb_route(sw))
+		return 0;
 
-	return !!(val & mask);
+	if (!tb_switch_clx_is_supported(sw))
+		return 0;
+
+	up = tb_upstream_port(sw);
+	down = tb_switch_downstream_port(sw);
+
+	clx = tb_port_clx(up);
+	tmp = tb_port_clx(down);
+	if (clx != tmp)
+		tb_sw_warn(sw, "CLx: inconsistent configuration %#x != %#x\n",
+			   clx, tmp);
+
+	tb_sw_dbg(sw, "CLx: current mode: %s\n", clx_name(clx));
+
+	sw->clx = clx;
+	return 0;
 }
 
 static int tb_switch_pm_secondary_resolve(struct tb_switch *sw)
@@ -240,18 +298,6 @@ static bool validate_mask(unsigned int clx)
 	return true;
 }
 
-static const char *clx_name(unsigned int clx)
-{
-	if (clx & TB_CL2)
-		return "CL0s/CL1/CL2";
-	if (clx & TB_CL1)
-		return "CL0s/CL1";
-	if (clx & TB_CL0S)
-		return "CL0s";
-
-	return "unknown";
-}
-
 /**
  * tb_switch_clx_enable() - Enable CLx on upstream port of specified router
  * @sw: Router to enable CLx for
diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index f33a09d92c9b..0c11caec7e8e 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -2859,6 +2859,10 @@ int tb_switch_add(struct tb_switch *sw)
 		if (ret)
 			return ret;
 
+		ret = tb_switch_clx_init(sw);
+		if (ret)
+			return ret;
+
 		ret = tb_switch_tmu_init(sw);
 		if (ret)
 			return ret;
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index 72e245639eb8..58df106aaa5e 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -1002,6 +1002,7 @@ static inline bool tb_switch_tmu_is_enabled(const struct tb_switch *sw)
 
 bool tb_port_clx_is_enabled(struct tb_port *port, unsigned int clx);
 
+int tb_switch_clx_init(struct tb_switch *sw);
 bool tb_switch_clx_is_supported(const struct tb_switch *sw);
 int tb_switch_clx_enable(struct tb_switch *sw, unsigned int clx);
 int tb_switch_clx_disable(struct tb_switch *sw);
-- 
2.39.2


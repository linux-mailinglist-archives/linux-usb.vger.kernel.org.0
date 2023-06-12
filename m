Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A110372BB50
	for <lists+linux-usb@lfdr.de>; Mon, 12 Jun 2023 10:53:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233373AbjFLIxr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 12 Jun 2023 04:53:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233964AbjFLIxK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 12 Jun 2023 04:53:10 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E40B7110
        for <linux-usb@vger.kernel.org>; Mon, 12 Jun 2023 01:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686559946; x=1718095946;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4pv4f2XjddlBjRx0U7zA7xCKm72RQ1gYEtA71wQ6mOs=;
  b=LK9R5C3AyW86UXmQ4oUYDkZPjOgwLSKoq2NPx44U3xtrJyKgyXqD/kVE
   EnDYOgYQG6hzKBbhBEbY994qVGsW+I4ei7EUUY5LV7pC5g5eZDzykOUJp
   OAG5hr4/sFitCAjtpv4ulnfQT1mt5ecpuzMrP/eMtzVXjYxWqdJWnwS0s
   pmvDJ3qplPu8TMAWpybwQA0Wl1HdaY1E2soFkytazOkjJKsHZBHVixBP5
   /k2toNWlC2Ek38f7S3wfUoJSZHTs3pzgYUPHx6IYzN4vCEACS+RgKJJe0
   9QhiWnmoWKAIkvpwnWbsTKgOLMH4IjnsF24SxF+7VLmqzZ/hbV+ZCSWET
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10738"; a="347627317"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; 
   d="scan'208";a="347627317"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2023 01:21:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10738"; a="744247781"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; 
   d="scan'208";a="744247781"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 12 Jun 2023 01:21:42 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 107CCAC0; Mon, 12 Jun 2023 11:21:46 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Gil Fine <gil.fine@linux.intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v2 17/20] thunderbolt: Enable CL2 low power state
Date:   Mon, 12 Jun 2023 11:21:42 +0300
Message-Id: <20230612082145.62218-18-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230612082145.62218-1-mika.westerberg@linux.intel.com>
References: <20230612082145.62218-1-mika.westerberg@linux.intel.com>
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

For USB4 v2 routers we can also enable CL2 which allows better power
savings and thermal management than CL0s and CL1.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/clx.c | 31 +++++++++++++++++++------------
 drivers/thunderbolt/tb.c  |  9 ++++++---
 2 files changed, 25 insertions(+), 15 deletions(-)

diff --git a/drivers/thunderbolt/clx.c b/drivers/thunderbolt/clx.c
index 604cceb23659..13d217ae98e6 100644
--- a/drivers/thunderbolt/clx.c
+++ b/drivers/thunderbolt/clx.c
@@ -17,17 +17,22 @@ MODULE_PARM_DESC(clx, "allow low power states on the high-speed lanes (default:
 
 static const char *clx_name(unsigned int clx)
 {
-	if (!clx)
-		return "disabled";
-
-	if (clx & TB_CL2)
+	switch (clx) {
+	case TB_CL0S | TB_CL1 | TB_CL2:
 		return "CL0s/CL1/CL2";
-	if (clx & TB_CL1)
+	case TB_CL1 | TB_CL2:
+		return "CL1/CL2";
+	case TB_CL0S | TB_CL2:
+		return "CL0s/CL2";
+	case TB_CL0S | TB_CL1:
 		return "CL0s/CL1";
-	if (clx & TB_CL0S)
+	case TB_CL0S:
 		return "CL0s";
-
-	return "unknown";
+	case 0:
+		return "disabled";
+	default:
+		return "unknown";
+	}
 }
 
 static int tb_port_pm_secondary_set(struct tb_port *port, bool secondary)
@@ -104,6 +109,8 @@ static int tb_port_clx_set(struct tb_port *port, unsigned int clx, bool enable)
 		mask |= LANE_ADP_CS_1_CL0S_ENABLE;
 	if (clx & TB_CL1)
 		mask |= LANE_ADP_CS_1_CL1_ENABLE;
+	if (clx & TB_CL2)
+		mask |= LANE_ADP_CS_1_CL2_ENABLE;
 
 	if (!mask)
 		return -EOPNOTSUPP;
@@ -291,8 +298,6 @@ bool tb_switch_clx_is_supported(const struct tb_switch *sw)
 static bool validate_mask(unsigned int clx)
 {
 	/* Previous states need to be enabled */
-	if (clx & TB_CL2)
-		return (clx & (TB_CL0S | TB_CL1)) == (TB_CL0S | TB_CL1);
 	if (clx & TB_CL1)
 		return (clx & TB_CL0S) == TB_CL0S;
 	return true;
@@ -331,8 +336,10 @@ int tb_switch_clx_enable(struct tb_switch *sw, unsigned int clx)
 	    !tb_switch_clx_is_supported(sw))
 		return 0;
 
-	/* CL2 is not yet supported */
-	if (clx & TB_CL2)
+	/* Only support CL2 for v2 routers */
+	if ((clx & TB_CL2) &&
+	    (usb4_switch_version(parent_sw) < 2 ||
+	     usb4_switch_version(sw) < 2))
 		return -EOPNOTSUPP;
 
 	ret = tb_switch_pm_secondary_resolve(sw);
diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index ff034975a87e..79efc85db38b 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -244,6 +244,7 @@ static void tb_discover_dp_resources(struct tb *tb)
 static int tb_enable_clx(struct tb_switch *sw)
 {
 	struct tb_cm *tcm = tb_priv(sw->tb);
+	unsigned int clx = TB_CL0S | TB_CL1;
 	const struct tb_tunnel *tunnel;
 	int ret;
 
@@ -275,10 +276,12 @@ static int tb_enable_clx(struct tb_switch *sw)
 	}
 
 	/*
-	 * CL0s and CL1 are enabled and supported together.
-	 * Silently ignore CLx enabling in case CLx is not supported.
+	 * Initially try with CL2. If that's not supported by the
+	 * topology try with CL0s and CL1 and then give up.
 	 */
-	ret = tb_switch_clx_enable(sw, TB_CL0S | TB_CL1);
+	ret = tb_switch_clx_enable(sw, clx | TB_CL2);
+	if (ret == -EOPNOTSUPP)
+		ret = tb_switch_clx_enable(sw, clx);
 	return ret == -EOPNOTSUPP ? 0 : ret;
 }
 
-- 
2.39.2


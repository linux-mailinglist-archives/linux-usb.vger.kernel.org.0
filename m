Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C1ACE5A64B5
	for <lists+linux-usb@lfdr.de>; Tue, 30 Aug 2022 15:28:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230117AbiH3N2N (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 30 Aug 2022 09:28:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230249AbiH3N1n (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 30 Aug 2022 09:27:43 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4BA4AA372
        for <linux-usb@vger.kernel.org>; Tue, 30 Aug 2022 06:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661866059; x=1693402059;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lQpIV7884lpcPkiRulpfnEph/jS57pzoYY9Mr2GzWwU=;
  b=UbHtPNsjfalVI7nL7Z3r1zb+g+5fykL74p+IAWo4Ke022QWZEws9sxhV
   FvKBF8lCchNAI3f4Q3UdGP0aZL8/WgGmpkuUQw4As902+6XhF0QOw2PVm
   qgAuee/rfKjUNJiJ3QG/om+9z0fZk6d+bLLn/p+/KDq8iVkmmLaes5XXT
   BTqGXuxqfNZDvd5iuHH2hoTh9dRD6OZcNB9PpdByp5FP2NkYbT741uJ5Q
   UMGMnaJA9X9lURdCEs/v/5ZuQSCP2kVVz37bQvlTLygBDCBHRcFkFLXfk
   JgCwI5et6uUir7QtdjK3gj6j2fY2h49y3qb2fYBvJa4qSL1ewcJWdOrlH
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10455"; a="274921771"
X-IronPort-AV: E=Sophos;i="5.93,275,1654585200"; 
   d="scan'208";a="274921771"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2022 06:27:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,275,1654585200"; 
   d="scan'208";a="644826288"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 30 Aug 2022 06:27:37 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 2A1A119D; Tue, 30 Aug 2022 16:27:52 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v2 3/5] thunderbolt: Pass CL state bitmask to tb_port_clx_supported()
Date:   Tue, 30 Aug 2022 16:27:49 +0300
Message-Id: <20220830132751.42518-4-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220830132751.42518-1-mika.westerberg@linux.intel.com>
References: <20220830132751.42518-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Instead of testing just a single CL state we can pass a bitmask of
states to check. This makes it simpler for callers of the function.

We also add a check for CL2 even though not fully supported by the
driver yet.

Suggested-by: Lukas Wunner <lukas@wunner.de>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/switch.c  | 17 ++++++-----------
 drivers/thunderbolt/tb.h      |  4 ++--
 drivers/thunderbolt/tb_regs.h |  1 +
 3 files changed, 9 insertions(+), 13 deletions(-)

diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index deefc92c7c60..0671f5361b5b 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -1259,9 +1259,9 @@ static int tb_port_pm_secondary_disable(struct tb_port *port)
 }
 
 /* Called for USB4 or Titan Ridge routers only */
-static bool tb_port_clx_supported(struct tb_port *port, enum tb_clx clx)
+static bool tb_port_clx_supported(struct tb_port *port, unsigned int clx_mask)
 {
-	u32 mask, val;
+	u32 val, mask = 0;
 	bool ret;
 
 	/* Don't enable CLx in case of two single-lane links */
@@ -1279,17 +1279,12 @@ static bool tb_port_clx_supported(struct tb_port *port, enum tb_clx clx)
 		return false;
 	}
 
-	switch (clx) {
-	case TB_CL1:
+	if (clx_mask & TB_CL1) {
 		/* CL0s and CL1 are enabled and supported together */
-		mask = LANE_ADP_CS_0_CL0S_SUPPORT | LANE_ADP_CS_0_CL1_SUPPORT;
-		break;
-
-	/* For now we support only CL0s and CL1. Not CL2 */
-	case TB_CL2:
-	default:
-		return false;
+		mask |= LANE_ADP_CS_0_CL0S_SUPPORT | LANE_ADP_CS_0_CL1_SUPPORT;
 	}
+	if (clx_mask & TB_CL2)
+		mask |= LANE_ADP_CS_0_CL2_SUPPORT;
 
 	ret = tb_port_read(port, &val, TB_CFG_PORT,
 			   port->cap_phy + LANE_ADP_CS_0, 1);
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index 8291cabd2e92..8555ad9d7234 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -113,8 +113,8 @@ struct tb_switch_tmu {
 enum tb_clx {
 	TB_CLX_DISABLE,
 	/* CL0s and CL1 are enabled and supported together */
-	TB_CL1,
-	TB_CL2,
+	TB_CL1 = BIT(0),
+	TB_CL2 = BIT(1),
 };
 
 /**
diff --git a/drivers/thunderbolt/tb_regs.h b/drivers/thunderbolt/tb_regs.h
index 166054110388..a45f295533cd 100644
--- a/drivers/thunderbolt/tb_regs.h
+++ b/drivers/thunderbolt/tb_regs.h
@@ -324,6 +324,7 @@ struct tb_regs_port_header {
 #define LANE_ADP_CS_0_SUPPORTED_WIDTH_DUAL	0x2
 #define LANE_ADP_CS_0_CL0S_SUPPORT		BIT(26)
 #define LANE_ADP_CS_0_CL1_SUPPORT		BIT(27)
+#define LANE_ADP_CS_0_CL2_SUPPORT		BIT(28)
 #define LANE_ADP_CS_1				0x01
 #define LANE_ADP_CS_1_TARGET_SPEED_MASK		GENMASK(3, 0)
 #define LANE_ADP_CS_1_TARGET_SPEED_GEN3		0xc
-- 
2.35.1


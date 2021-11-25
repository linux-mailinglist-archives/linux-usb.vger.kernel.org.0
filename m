Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0B0F45DC76
	for <lists+linux-usb@lfdr.de>; Thu, 25 Nov 2021 15:37:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355652AbhKYOji (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 25 Nov 2021 09:39:38 -0500
Received: from mga09.intel.com ([134.134.136.24]:2371 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239448AbhKYOhg (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 25 Nov 2021 09:37:36 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10178"; a="235345403"
X-IronPort-AV: E=Sophos;i="5.87,263,1631602800"; 
   d="scan'208";a="235345403"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2021 06:32:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,263,1631602800"; 
   d="scan'208";a="741301363"
Received: from ccdjpclinux26.jer.intel.com ([10.12.48.253])
  by fmsmga005.fm.intel.com with ESMTP; 25 Nov 2021 06:32:30 -0800
From:   Gil Fine <gil.fine@intel.com>
To:     andreas.noever@gmail.com, michael.jamet@intel.com,
        mika.westerberg@linux.intel.com, YehezkelShB@gmail.com
Cc:     gil.fine@intel.com, linux-usb@vger.kernel.org, lukas@wunner.de
Subject: [PATCH 4/7] thunderbolt: Enable TMU for Titan Ridge device
Date:   Thu, 25 Nov 2021 16:38:18 +0200
Message-Id: <20211125143821.16558-5-gil.fine@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211125143821.16558-1-gil.fine@intel.com>
References: <20211125143821.16558-1-gil.fine@intel.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In this patch we enable TMU for Titan Ridge device.
This is used once needed to enable CLx.

Signed-off-by: Gil Fine <gil.fine@intel.com>
---
 drivers/thunderbolt/switch.c  |  4 ++++
 drivers/thunderbolt/tb.h      |  2 ++
 drivers/thunderbolt/tb_regs.h |  4 ++++
 drivers/thunderbolt/tmu.c     | 18 +++++++++++++-----
 4 files changed, 23 insertions(+), 5 deletions(-)

diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index 754ff79e48ab..6ff2866a4c2b 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -2194,6 +2194,10 @@ struct tb_switch *tb_switch_alloc(struct tb *tb, struct device *parent,
 	if (ret > 0)
 		sw->cap_plug_events = ret;
 
+	ret = tb_switch_find_vse_cap(sw, TB_VSE_CAP_TIME2);
+	if (ret > 0)
+		sw->cap_vsec_tmu = ret;
+
 	ret = tb_switch_find_vse_cap(sw, TB_VSE_CAP_LINK_CONTROLLER);
 	if (ret > 0)
 		sw->cap_lc = ret;
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index 3601c2b5e4bc..0fcc279277df 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -138,6 +138,7 @@ enum tb_clx {
  * @link_usb4: Upstream link is USB4
  * @generation: Switch Thunderbolt generation
  * @cap_plug_events: Offset to the plug events capability (%0 if not found)
+ * @cap_vsec_tmu: Offset to the TMU vendor specific capability (%0 if not found)
  * @cap_lc: Offset to the link controller capability (%0 if not found)
  * @is_unplugged: The switch is going away
  * @drom: DROM of the switch (%NULL if not found)
@@ -189,6 +190,7 @@ struct tb_switch {
 	bool link_usb4;
 	unsigned int generation;
 	int cap_plug_events;
+	int cap_vsec_tmu;
 	int cap_lc;
 	bool is_unplugged;
 	u8 *drom;
diff --git a/drivers/thunderbolt/tb_regs.h b/drivers/thunderbolt/tb_regs.h
index 8b432d3e3c6f..2ceed608573f 100644
--- a/drivers/thunderbolt/tb_regs.h
+++ b/drivers/thunderbolt/tb_regs.h
@@ -446,6 +446,10 @@ struct tb_regs_hop {
 	u32 unknown3:3; /* set to zero */
 } __packed;
 
+/* TMU Thunderbolt 3 registers */
+#define TB_TIME_VSEC_3_CS_26		0x1a
+#define TB_TIME_VSEC_3_CS_26_TD		BIT(22)
+
 /* Common link controller registers */
 #define TB_LC_DESC			0x02
 #define TB_LC_DESC_NLC_MASK		GENMASK(3, 0)
diff --git a/drivers/thunderbolt/tmu.c b/drivers/thunderbolt/tmu.c
index 1374813bfc5c..bbb5b1df8409 100644
--- a/drivers/thunderbolt/tmu.c
+++ b/drivers/thunderbolt/tmu.c
@@ -152,21 +152,29 @@ static int tb_port_tmu_time_sync_enable(struct tb_port *port)
 
 static int tb_switch_tmu_set_time_disruption(struct tb_switch *sw, bool set)
 {
+	u32 val, offset, bit;
 	int ret;
-	u32 val;
+
+	if (tb_switch_is_usb4(sw)) {
+		offset = sw->tmu.cap + TMU_RTR_CS_0;
+		bit = TMU_RTR_CS_0_TD;
+	} else {
+		offset = sw->cap_vsec_tmu + TB_TIME_VSEC_3_CS_26;
+		bit = TB_TIME_VSEC_3_CS_26_TD;
+	}
 
 	ret = tb_sw_read(sw, &val, TB_CFG_SWITCH,
-			 sw->tmu.cap + TMU_RTR_CS_0, 1);
+			 offset, 1);
 	if (ret)
 		return ret;
 
 	if (set)
-		val |= TMU_RTR_CS_0_TD;
+		val |= bit;
 	else
-		val &= ~TMU_RTR_CS_0_TD;
+		val &= ~bit;
 
 	return tb_sw_write(sw, &val, TB_CFG_SWITCH,
-			   sw->tmu.cap + TMU_RTR_CS_0, 1);
+			   offset, 1);
 }
 
 /**
-- 
2.17.1

---------------------------------------------------------------------
Intel Israel (74) Limited

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.


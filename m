Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EFBC4781F1
	for <lists+linux-usb@lfdr.de>; Fri, 17 Dec 2021 02:10:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231658AbhLQBKe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 Dec 2021 20:10:34 -0500
Received: from mga09.intel.com ([134.134.136.24]:64461 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231656AbhLQBKd (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 16 Dec 2021 20:10:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639703433; x=1671239433;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=EEZiImbWgDolWjuC92Ci/601o8UAARHgLrnguBJTLdM=;
  b=Fxd3JEOrMLr5HNDevfxUEkwBrRZMS0NQvzuSmcnWT1YVkDCH3XYf53MD
   ca518qnSddgJyHbnV69gLBklCqbCviZYGQlXI0f7CM1rz3puv4Uj6/aWA
   BE5YVyFjd9necoDXLAiDptj81PokHEH2fPNxEqdaiZpqrLNkNU7ASqrUq
   KE15AsUyXrz38+ev8f8D6LO/GJmjx0/qfG3qQNT98IM+R2O9Z0nvf89qb
   E+iSYm9MajHO9817BH31PC/tjI2//QuF9kPWN898RMc2FwDfgaI4y1W3f
   65ihPBt3eTRwA8kb+cWxUMd00a7FzBFG+9rK5NswY5Kdbo0GQy93ZVCfG
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10200"; a="239460857"
X-IronPort-AV: E=Sophos;i="5.88,212,1635231600"; 
   d="scan'208";a="239460857"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2021 17:10:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,212,1635231600"; 
   d="scan'208";a="605733711"
Received: from ccdjpclinux26.jer.intel.com ([10.12.48.253])
  by FMSMGA003.fm.intel.com with ESMTP; 16 Dec 2021 17:10:18 -0800
From:   Gil Fine <gil.fine@intel.com>
To:     andreas.noever@gmail.com, michael.jamet@intel.com,
        mika.westerberg@linux.intel.com, YehezkelShB@gmail.com
Cc:     gil.fine@intel.com, linux-usb@vger.kernel.org, lukas@wunner.de
Subject: [PATCH v2 3/7] thunderbolt: Move usb4_switch_wait_for_bit() to switch.c
Date:   Fri, 17 Dec 2021 03:16:40 +0200
Message-Id: <20211217011644.21634-4-gil.fine@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211217011644.21634-1-gil.fine@intel.com>
References: <20211217011644.21634-1-gil.fine@intel.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Currently usb4_switch_wait_for_bit() used only in usb4.c
Moving to switch.c to call it from other files.
Also change the prefix to "tb_" to follow to the naming convention.

Signed-off-by: Gil Fine <gil.fine@intel.com>
---
 drivers/thunderbolt/switch.c | 34 ++++++++++++++++++++++++++++++++++
 drivers/thunderbolt/tb.h     |  2 ++
 drivers/thunderbolt/usb4.c   | 32 +++++---------------------------
 3 files changed, 41 insertions(+), 27 deletions(-)

diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index 2e8cb4acdf72..d58d78647175 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -3224,6 +3224,40 @@ struct tb_port *tb_switch_find_port(struct tb_switch *sw,
 	return NULL;
 }
 
+/**
+ * tb_switch_wait_for_bit() - Wait for specified value of bits in offset
+ * @sw: Switch to read the offset value from
+ * @offset: Offset in the router config space to read from
+ * @bit: Bit mask in the offset to wait for
+ * @value: Value of the bits to wait for
+ * @timeout_msec: Timeout in ms how long to wait
+ *
+ * Wait till the specified bits in specified offset reach specified value.
+ * Returns %0 in case of success, %-ETIMEDOUT if the @value was not reached
+ * within the given timeout or a negative errno in case of failure.
+ */
+int tb_switch_wait_for_bit(struct tb_switch *sw, u32 offset, u32 bit,
+			   u32 value, int timeout_msec)
+{
+	ktime_t timeout = ktime_add_ms(ktime_get(), timeout_msec);
+
+	do {
+		u32 val;
+		int ret;
+
+		ret = tb_sw_read(sw, &val, TB_CFG_SWITCH, offset, 1);
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
 static int __tb_port_pm_secondary_set(struct tb_port *port, bool secondary)
 {
 	u32 phy;
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index 527b461a5c49..c7c135120a55 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -1155,6 +1155,8 @@ struct usb4_port *usb4_port_device_add(struct tb_port *port);
 void usb4_port_device_remove(struct usb4_port *usb4);
 int usb4_port_device_resume(struct usb4_port *usb4);
 bool usb4_port_clx_supported(struct tb_port *port);
+int tb_switch_wait_for_bit(struct tb_switch *sw, u32 offset, u32 bit,
+			   u32 value, int timeout_msec);
 
 /* Keep link controller awake during update */
 #define QUIRK_FORCE_POWER_LINK_CONTROLLER		BIT(0)
diff --git a/drivers/thunderbolt/usb4.c b/drivers/thunderbolt/usb4.c
index 704820c9a042..64613cafcbc3 100644
--- a/drivers/thunderbolt/usb4.c
+++ b/drivers/thunderbolt/usb4.c
@@ -50,28 +50,6 @@ enum usb4_ba_index {
 #define USB4_BA_VALUE_MASK		GENMASK(31, 16)
 #define USB4_BA_VALUE_SHIFT		16
 
-static int usb4_switch_wait_for_bit(struct tb_switch *sw, u32 offset, u32 bit,
-				    u32 value, int timeout_msec)
-{
-	ktime_t timeout = ktime_add_ms(ktime_get(), timeout_msec);
-
-	do {
-		u32 val;
-		int ret;
-
-		ret = tb_sw_read(sw, &val, TB_CFG_SWITCH, offset, 1);
-		if (ret)
-			return ret;
-
-		if ((val & bit) == value)
-			return 0;
-
-		usleep_range(50, 100);
-	} while (ktime_before(ktime_get(), timeout));
-
-	return -ETIMEDOUT;
-}
-
 static int usb4_native_switch_op(struct tb_switch *sw, u16 opcode,
 				 u32 *metadata, u8 *status,
 				 const void *tx_data, size_t tx_dwords,
@@ -97,7 +75,7 @@ static int usb4_native_switch_op(struct tb_switch *sw, u16 opcode,
 	if (ret)
 		return ret;
 
-	ret = usb4_switch_wait_for_bit(sw, ROUTER_CS_26, ROUTER_CS_26_OV, 0, 500);
+	ret = tb_switch_wait_for_bit(sw, ROUTER_CS_26, ROUTER_CS_26_OV, 0, 500);
 	if (ret)
 		return ret;
 
@@ -303,8 +281,8 @@ int usb4_switch_setup(struct tb_switch *sw)
 	if (ret)
 		return ret;
 
-	return usb4_switch_wait_for_bit(sw, ROUTER_CS_6, ROUTER_CS_6_CR,
-					ROUTER_CS_6_CR, 50);
+	return tb_switch_wait_for_bit(sw, ROUTER_CS_6, ROUTER_CS_6_CR,
+				      ROUTER_CS_6_CR, 50);
 }
 
 /**
@@ -480,8 +458,8 @@ int usb4_switch_set_sleep(struct tb_switch *sw)
 	if (ret)
 		return ret;
 
-	return usb4_switch_wait_for_bit(sw, ROUTER_CS_6, ROUTER_CS_6_SLPR,
-					ROUTER_CS_6_SLPR, 500);
+	return tb_switch_wait_for_bit(sw, ROUTER_CS_6, ROUTER_CS_6_SLPR,
+				      ROUTER_CS_6_SLPR, 500);
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


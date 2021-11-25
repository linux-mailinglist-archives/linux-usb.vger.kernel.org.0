Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2145945DC75
	for <lists+linux-usb@lfdr.de>; Thu, 25 Nov 2021 15:37:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355637AbhKYOjg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 25 Nov 2021 09:39:36 -0500
Received: from mga09.intel.com ([134.134.136.24]:2368 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238813AbhKYOhe (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 25 Nov 2021 09:37:34 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10178"; a="235345398"
X-IronPort-AV: E=Sophos;i="5.87,263,1631602800"; 
   d="scan'208";a="235345398"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2021 06:32:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,263,1631602800"; 
   d="scan'208";a="741301354"
Received: from ccdjpclinux26.jer.intel.com ([10.12.48.253])
  by fmsmga005.fm.intel.com with ESMTP; 25 Nov 2021 06:32:27 -0800
From:   Gil Fine <gil.fine@intel.com>
To:     andreas.noever@gmail.com, michael.jamet@intel.com,
        mika.westerberg@linux.intel.com, YehezkelShB@gmail.com
Cc:     gil.fine@intel.com, linux-usb@vger.kernel.org, lukas@wunner.de
Subject: [PATCH 3/7] thunderbolt: Move usb4_switch_wait_for_bit() to switch.c
Date:   Thu, 25 Nov 2021 16:38:17 +0200
Message-Id: <20211125143821.16558-4-gil.fine@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211125143821.16558-1-gil.fine@intel.com>
References: <20211125143821.16558-1-gil.fine@intel.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Currently usb4_switch_wait_for_bit() used only in usb4.c
Moving to switch.c to call it from other files.
Also change the prefix to "tb_" to follow to the naming convention.

Signed-off-by: Gil Fine <gil.fine@intel.com>
---
 drivers/thunderbolt/switch.c | 36 +++++++++++++++++++++++++++++++++++-
 drivers/thunderbolt/tb.h     |  2 ++
 drivers/thunderbolt/usb4.c   | 32 +++++---------------------------
 3 files changed, 42 insertions(+), 28 deletions(-)

diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index 05aaa34bbfd9..754ff79e48ab 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -643,7 +643,7 @@ int tb_port_add_nfc_credits(struct tb_port *port, int credits)
  * @port: Port whose counters to clear
  * @counter: Counter index to clear
  *
- * Return: Returns 0 on success or an error code on failure.
+ * Return:  success or an error code on failure.
  */
 int tb_port_clear_counter(struct tb_port *port, int counter)
 {
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
index e7792b090bc7..3601c2b5e4bc 100644
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


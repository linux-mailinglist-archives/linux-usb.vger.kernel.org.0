Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CB8C382CE7
	for <lists+linux-usb@lfdr.de>; Mon, 17 May 2021 15:09:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237258AbhEQNKx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 May 2021 09:10:53 -0400
Received: from mga02.intel.com ([134.134.136.20]:52611 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235153AbhEQNKw (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 17 May 2021 09:10:52 -0400
IronPort-SDR: V/1NBMTxnVlBlsUTAvEEjP2colt3vTgYKUIhbCFsiEfpYCwIHFHc6mZBhIAq1ufvut1Ar/pi/3
 BjYAIXKTGbUA==
X-IronPort-AV: E=McAfee;i="6200,9189,9986"; a="187582858"
X-IronPort-AV: E=Sophos;i="5.82,307,1613462400"; 
   d="scan'208";a="187582858"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2021 06:06:54 -0700
IronPort-SDR: T99TydOySQKbk/JGHhFZEl7vtcKzt0u6HrXBFyYuv+/CVmB2UsSdZYkL5BgoCq9dXrZUvzZBXE
 bFV07ZBCwNGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,307,1613462400"; 
   d="scan'208";a="629982074"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga005.fm.intel.com with ESMTP; 17 May 2021 06:06:51 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 36AA2662; Mon, 17 May 2021 16:07:13 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Lukas Wunner <lukas@wunner.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 2/3] thunderbolt: Add wake from DisplayPort
Date:   Mon, 17 May 2021 16:07:12 +0300
Message-Id: <20210517130713.30005-3-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210517130713.30005-1-mika.westerberg@linux.intel.com>
References: <20210517130713.30005-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Latest USB4 spec added a new wake bit for DisplayPort so add this to the
driver when runtime suspending. This way wake up the domain when a new
monitor is plugged in to any of the device routers.

Also do the same for pre-USB4 devices through the link controller
registers as documented in chapter 13 of the USB4 spec.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/lc.c      | 6 ++++--
 drivers/thunderbolt/switch.c  | 3 ++-
 drivers/thunderbolt/tb.h      | 1 +
 drivers/thunderbolt/tb_regs.h | 3 +++
 drivers/thunderbolt/usb4.c    | 6 ++++--
 5 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/thunderbolt/lc.c b/drivers/thunderbolt/lc.c
index bc671730a11f..c178f0d7beab 100644
--- a/drivers/thunderbolt/lc.c
+++ b/drivers/thunderbolt/lc.c
@@ -208,8 +208,8 @@ static int tb_lc_set_wake_one(struct tb_switch *sw, unsigned int offset,
 	if (ret)
 		return ret;
 
-	ctrl &= ~(TB_LC_SX_CTRL_WOC | TB_LC_SX_CTRL_WOD | TB_LC_SX_CTRL_WOP |
-		  TB_LC_SX_CTRL_WOU4);
+	ctrl &= ~(TB_LC_SX_CTRL_WOC | TB_LC_SX_CTRL_WOD | TB_LC_SX_CTRL_WODPC |
+		  TB_LC_SX_CTRL_WODPD | TB_LC_SX_CTRL_WOP | TB_LC_SX_CTRL_WOU4);
 
 	if (flags & TB_WAKE_ON_CONNECT)
 		ctrl |= TB_LC_SX_CTRL_WOC | TB_LC_SX_CTRL_WOD;
@@ -217,6 +217,8 @@ static int tb_lc_set_wake_one(struct tb_switch *sw, unsigned int offset,
 		ctrl |= TB_LC_SX_CTRL_WOU4;
 	if (flags & TB_WAKE_ON_PCIE)
 		ctrl |= TB_LC_SX_CTRL_WOP;
+	if (flags & TB_WAKE_ON_DP)
+		ctrl |= TB_LC_SX_CTRL_WODPC | TB_LC_SX_CTRL_WODPD;
 
 	return tb_sw_write(sw, &ctrl, TB_CFG_SWITCH, offset + TB_LC_SX_CTRL, 1);
 }
diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index e73cd296db7e..4d4bc50a3c44 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -2844,7 +2844,8 @@ void tb_switch_suspend(struct tb_switch *sw, bool runtime)
 	if (runtime) {
 		/* Trigger wake when something is plugged in/out */
 		flags |= TB_WAKE_ON_CONNECT | TB_WAKE_ON_DISCONNECT;
-		flags |= TB_WAKE_ON_USB4 | TB_WAKE_ON_USB3 | TB_WAKE_ON_PCIE;
+		flags |= TB_WAKE_ON_USB4;
+		flags |= TB_WAKE_ON_USB3 | TB_WAKE_ON_PCIE | TB_WAKE_ON_DP;
 	} else if (device_may_wakeup(&sw->dev)) {
 		flags |= TB_WAKE_ON_USB4 | TB_WAKE_ON_USB3 | TB_WAKE_ON_PCIE;
 	}
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index d9d1adc4cfd3..60a987c748ca 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -347,6 +347,7 @@ struct tb_path {
 #define TB_WAKE_ON_USB4		BIT(2)
 #define TB_WAKE_ON_USB3		BIT(3)
 #define TB_WAKE_ON_PCIE		BIT(4)
+#define TB_WAKE_ON_DP		BIT(5)
 
 /**
  * struct tb_cm_ops - Connection manager specific operations vector
diff --git a/drivers/thunderbolt/tb_regs.h b/drivers/thunderbolt/tb_regs.h
index 626751e06292..113d7903b183 100644
--- a/drivers/thunderbolt/tb_regs.h
+++ b/drivers/thunderbolt/tb_regs.h
@@ -195,6 +195,7 @@ struct tb_regs_switch_header {
 #define ROUTER_CS_5_SLP				BIT(0)
 #define ROUTER_CS_5_WOP				BIT(1)
 #define ROUTER_CS_5_WOU				BIT(2)
+#define ROUTER_CS_5_WOD				BIT(3)
 #define ROUTER_CS_5_C3S				BIT(23)
 #define ROUTER_CS_5_PTO				BIT(24)
 #define ROUTER_CS_5_UTO				BIT(25)
@@ -458,6 +459,8 @@ struct tb_regs_hop {
 #define TB_LC_SX_CTRL			0x96
 #define TB_LC_SX_CTRL_WOC		BIT(1)
 #define TB_LC_SX_CTRL_WOD		BIT(2)
+#define TB_LC_SX_CTRL_WODPC		BIT(3)
+#define TB_LC_SX_CTRL_WODPD		BIT(4)
 #define TB_LC_SX_CTRL_WOU4		BIT(5)
 #define TB_LC_SX_CTRL_WOP		BIT(6)
 #define TB_LC_SX_CTRL_L1C		BIT(16)
diff --git a/drivers/thunderbolt/usb4.c b/drivers/thunderbolt/usb4.c
index c0a14bfa36d4..7e8b5ca3114c 100644
--- a/drivers/thunderbolt/usb4.c
+++ b/drivers/thunderbolt/usb4.c
@@ -413,7 +413,7 @@ int usb4_switch_set_wake(struct tb_switch *sw, unsigned int flags)
 	}
 
 	/*
-	 * Enable wakes from PCIe and USB 3.x on this router. Only
+	 * Enable wakes from PCIe, USB 3.x and DP on this router. Only
 	 * needed for device routers.
 	 */
 	if (route) {
@@ -421,11 +421,13 @@ int usb4_switch_set_wake(struct tb_switch *sw, unsigned int flags)
 		if (ret)
 			return ret;
 
-		val &= ~(ROUTER_CS_5_WOP | ROUTER_CS_5_WOU);
+		val &= ~(ROUTER_CS_5_WOP | ROUTER_CS_5_WOU | ROUTER_CS_5_WOD);
 		if (flags & TB_WAKE_ON_USB3)
 			val |= ROUTER_CS_5_WOU;
 		if (flags & TB_WAKE_ON_PCIE)
 			val |= ROUTER_CS_5_WOP;
+		if (flags & TB_WAKE_ON_DP)
+			val |= ROUTER_CS_5_WOD;
 
 		ret = tb_sw_write(sw, &val, TB_CFG_SWITCH, ROUTER_CS_5, 1);
 		if (ret)
-- 
2.30.2


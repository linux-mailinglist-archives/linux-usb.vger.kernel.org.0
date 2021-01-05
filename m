Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC20C2EA785
	for <lists+linux-usb@lfdr.de>; Tue,  5 Jan 2021 10:33:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728450AbhAEJal (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 Jan 2021 04:30:41 -0500
Received: from mga07.intel.com ([134.134.136.100]:30799 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728416AbhAEJ35 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 5 Jan 2021 04:29:57 -0500
IronPort-SDR: oQCX5kzFkmkv1eFy9JUK7RtlJPBU0zF7aYhJKT+ui6fCGY2+p0lPd8lOXnrdRsTrdmqru7uaSt
 Ypo9pXaaLSVg==
X-IronPort-AV: E=McAfee;i="6000,8403,9854"; a="241162154"
X-IronPort-AV: E=Sophos;i="5.78,476,1599548400"; 
   d="scan'208";a="241162154"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2021 01:28:10 -0800
IronPort-SDR: iPJr0DktAeid50fginWTGzUjQQz5SbuYhiMNKy7XtRceRQ/C4AjBH7vLpf3xpRe6PH3SFHrXPQ
 DS+W2+VP4lIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,476,1599548400"; 
   d="scan'208";a="462238984"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 05 Jan 2021 01:28:09 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 5A1F3F2; Tue,  5 Jan 2021 11:28:08 +0200 (EET)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Christian Kellner <christian@kellner.me>,
        Mario Limonciello <mario.limonciello@dell.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 1/2] thunderbolt: Start lane initialization after sleep
Date:   Tue,  5 Jan 2021 12:28:07 +0300
Message-Id: <20210105092808.15817-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

USB4 spec says that for TBT3 compatible device routers the connection
manager needs to set SLI (Start Lane Initialization) to get the lanes
that were not connected back to functional state after sleep. Same needs
to be done if the link was XDomain.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/lc.c      | 35 +++++++++++++++++++++++++++++++++++
 drivers/thunderbolt/switch.c  | 27 ++++++++++++++++++++++++++-
 drivers/thunderbolt/tb.h      |  1 +
 drivers/thunderbolt/tb_regs.h |  1 +
 4 files changed, 63 insertions(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/lc.c b/drivers/thunderbolt/lc.c
index 41e6c738f6c8..bc671730a11f 100644
--- a/drivers/thunderbolt/lc.c
+++ b/drivers/thunderbolt/lc.c
@@ -158,6 +158,41 @@ void tb_lc_unconfigure_xdomain(struct tb_port *port)
 	tb_lc_set_xdomain_configured(port, false);
 }
 
+/**
+ * tb_lc_start_lane_initialization() - Start lane initialization
+ * @port: Device router lane 0 adapter
+ *
+ * Starts lane initialization for @port after the router resumed from
+ * sleep. Should be called for those downstream lane adapters that were
+ * not connected (tb_lc_configure_port() was not called) before sleep.
+ *
+ * Returns %0 in success and negative errno in case of failure.
+ */
+int tb_lc_start_lane_initialization(struct tb_port *port)
+{
+	struct tb_switch *sw = port->sw;
+	int ret, cap;
+	u32 ctrl;
+
+	if (!tb_route(sw))
+		return 0;
+
+	if (sw->generation < 2)
+		return 0;
+
+	cap = find_port_lc_cap(port);
+	if (cap < 0)
+		return cap;
+
+	ret = tb_sw_read(sw, &ctrl, TB_CFG_SWITCH, cap + TB_LC_SX_CTRL, 1);
+	if (ret)
+		return ret;
+
+	ctrl |= TB_LC_SX_CTRL_SLI;
+
+	return tb_sw_write(sw, &ctrl, TB_CFG_SWITCH, cap + TB_LC_SX_CTRL, 1);
+}
+
 static int tb_lc_set_wake_one(struct tb_switch *sw, unsigned int offset,
 			      unsigned int flags)
 {
diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index a8572f49d3ad..e7e6726ff5d1 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -1065,6 +1065,17 @@ void tb_port_lane_bonding_disable(struct tb_port *port)
 	tb_port_set_link_width(port, 1);
 }
 
+static int tb_port_start_lane_initialization(struct tb_port *port)
+{
+	int ret;
+
+	if (tb_switch_is_usb4(port->sw))
+		return 0;
+
+	ret = tb_lc_start_lane_initialization(port);
+	return ret == -EINVAL ? 0 : ret;
+}
+
 /**
  * tb_port_is_enabled() - Is the adapter port enabled
  * @port: Port to check
@@ -2694,8 +2705,22 @@ int tb_switch_resume(struct tb_switch *sw)
 
 	/* check for surviving downstream switches */
 	tb_switch_for_each_port(sw, port) {
-		if (!tb_port_has_remote(port) && !port->xdomain)
+		if (!tb_port_has_remote(port) && !port->xdomain) {
+			/*
+			 * For disconnected downstream lane adapters
+			 * start lane initialization now so we detect
+			 * future connects.
+			 */
+			if (!tb_is_upstream_port(port) && tb_port_is_null(port))
+				tb_port_start_lane_initialization(port);
 			continue;
+		} else if (port->xdomain) {
+			/*
+			 * Start lane initialization for XDomain so the
+			 * link gets re-established.
+			 */
+			tb_port_start_lane_initialization(port);
+		}
 
 		if (tb_wait_for_port(port, true) <= 0) {
 			tb_port_warn(port,
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index 554feda1e359..34ae83b9e52a 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -923,6 +923,7 @@ int tb_lc_configure_port(struct tb_port *port);
 void tb_lc_unconfigure_port(struct tb_port *port);
 int tb_lc_configure_xdomain(struct tb_port *port);
 void tb_lc_unconfigure_xdomain(struct tb_port *port);
+int tb_lc_start_lane_initialization(struct tb_port *port);
 int tb_lc_set_wake(struct tb_switch *sw, unsigned int flags);
 int tb_lc_set_sleep(struct tb_switch *sw);
 bool tb_lc_lane_bonding_possible(struct tb_switch *sw);
diff --git a/drivers/thunderbolt/tb_regs.h b/drivers/thunderbolt/tb_regs.h
index ae427a953489..626751e06292 100644
--- a/drivers/thunderbolt/tb_regs.h
+++ b/drivers/thunderbolt/tb_regs.h
@@ -464,6 +464,7 @@ struct tb_regs_hop {
 #define TB_LC_SX_CTRL_L1D		BIT(17)
 #define TB_LC_SX_CTRL_L2C		BIT(20)
 #define TB_LC_SX_CTRL_L2D		BIT(21)
+#define TB_LC_SX_CTRL_SLI		BIT(29)
 #define TB_LC_SX_CTRL_UPSTREAM		BIT(30)
 #define TB_LC_SX_CTRL_SLP		BIT(31)
 
-- 
2.29.2


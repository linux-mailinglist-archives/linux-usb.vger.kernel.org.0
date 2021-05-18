Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95037387AB4
	for <lists+linux-usb@lfdr.de>; Tue, 18 May 2021 16:09:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349805AbhEROLG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 May 2021 10:11:06 -0400
Received: from mga11.intel.com ([192.55.52.93]:35580 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232783AbhEROLC (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 18 May 2021 10:11:02 -0400
IronPort-SDR: KVvMlC4SclKmA+2/HzVq0YL66zlwC8kGRQjXG+WOyjNNs44A3e402STDZ6hCyWx0xkJmjns0mI
 qhvT+00ELK7Q==
X-IronPort-AV: E=McAfee;i="6200,9189,9987"; a="197632960"
X-IronPort-AV: E=Sophos;i="5.82,310,1613462400"; 
   d="scan'208";a="197632960"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2021 07:09:43 -0700
IronPort-SDR: sYaIbpymRlRCCIdc77LzQJA9AcaP3g5jZfEEnZgOfVI1SgJftSWhIFXaDZj4d0akpOMFHzoMfh
 9CRQ2gzv6JaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,310,1613462400"; 
   d="scan'208";a="544131778"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 18 May 2021 07:09:41 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 8EF8A752; Tue, 18 May 2021 17:10:02 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Gil Fine <gil.fine@intel.com>,
        Casey G Bowman <casey.g.bowman@intel.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Lukas Wunner <lukas@wunner.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 3/8] thunderbolt: Wait for the lanes to actually bond
Date:   Tue, 18 May 2021 17:09:57 +0300
Message-Id: <20210518141002.63616-4-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210518141002.63616-1-mika.westerberg@linux.intel.com>
References: <20210518141002.63616-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

It may take some time until the two lanes enter bonded state so poll for
the link width to match what is expected before going forward. This ensures
the link is in expected state before we start establishing paths through
it.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/switch.c  | 50 +++++++++++++++++++++++++++++++++--
 drivers/thunderbolt/tb.h      |  2 ++
 drivers/thunderbolt/xdomain.c |  8 ++++++
 3 files changed, 58 insertions(+), 2 deletions(-)

diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index 0edc452c2ac9..d5420eefe25d 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -991,8 +991,11 @@ static int tb_port_set_link_width(struct tb_port *port, unsigned int width)
  * tb_port_lane_bonding_enable() - Enable bonding on port
  * @port: port to enable
  *
- * Enable bonding by setting the link width of the port and the
- * other port in case of dual link port.
+ * Enable bonding by setting the link width of the port and the other
+ * port in case of dual link port. Does not wait for the link to
+ * actually reach the bonded state so caller needs to call
+ * tb_port_wait_for_link_width() before enabling any paths through the
+ * link to make sure the link is in expected state.
  *
  * Return: %0 in case of success and negative errno in case of error
  */
@@ -1043,6 +1046,36 @@ void tb_port_lane_bonding_disable(struct tb_port *port)
 	tb_port_set_link_width(port, 1);
 }
 
+/**
+ * tb_port_wait_for_link_width() - Wait until link reaches specific width
+ * @port: Port to wait for
+ * @width: Expected link width (%1 or %2)
+ * @timeout_msec: Timeout in ms how long to wait
+ *
+ * Should be used after both ends of the link have been bonded (or
+ * bonding has been disabled) to wait until the link actually reaches
+ * the expected state. Returns %-ETIMEDOUT if the @width was not reached
+ * within the given timeout, %0 if it did.
+ */
+int tb_port_wait_for_link_width(struct tb_port *port, int width,
+				int timeout_msec)
+{
+	ktime_t timeout = ktime_add_ms(ktime_get(), timeout_msec);
+	int ret;
+
+	do {
+		ret = tb_port_get_link_width(port);
+		if (ret < 0)
+			return ret;
+		else if (ret == width)
+			return 0;
+
+		usleep_range(1000, 2000);
+	} while (ktime_before(ktime_get(), timeout));
+
+	return -ETIMEDOUT;
+}
+
 static int tb_port_start_lane_initialization(struct tb_port *port)
 {
 	int ret;
@@ -2432,6 +2465,12 @@ int tb_switch_lane_bonding_enable(struct tb_switch *sw)
 		return ret;
 	}
 
+	ret = tb_port_wait_for_link_width(down, 2, 100);
+	if (ret) {
+		tb_port_warn(down, "timeout enabling lane bonding\n");
+		return ret;
+	}
+
 	tb_switch_update_link_attributes(sw);
 
 	tb_sw_dbg(sw, "lane bonding enabled\n");
@@ -2462,6 +2501,13 @@ void tb_switch_lane_bonding_disable(struct tb_switch *sw)
 	tb_port_lane_bonding_disable(up);
 	tb_port_lane_bonding_disable(down);
 
+	/*
+	 * It is fine if we get other errors as the router might have
+	 * been unplugged.
+	 */
+	if (tb_port_wait_for_link_width(down, 1, 100) == -ETIMEDOUT)
+		tb_sw_warn(sw, "timeout disabling lane bonding\n");
+
 	tb_switch_update_link_attributes(sw);
 	tb_sw_dbg(sw, "lane bonding disabled\n");
 }
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index b4bc25b82fdb..e6c5e8fc7de7 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -883,6 +883,8 @@ int tb_port_get_link_width(struct tb_port *port);
 int tb_port_state(struct tb_port *port);
 int tb_port_lane_bonding_enable(struct tb_port *port);
 void tb_port_lane_bonding_disable(struct tb_port *port);
+int tb_port_wait_for_link_width(struct tb_port *port, int width,
+				int timeout_msec);
 
 int tb_switch_find_vse_cap(struct tb_switch *sw, enum tb_switch_vse_cap vsec);
 int tb_switch_find_cap(struct tb_switch *sw, enum tb_switch_cap cap);
diff --git a/drivers/thunderbolt/xdomain.c b/drivers/thunderbolt/xdomain.c
index b21d99d59412..39c2da112238 100644
--- a/drivers/thunderbolt/xdomain.c
+++ b/drivers/thunderbolt/xdomain.c
@@ -1527,6 +1527,12 @@ int tb_xdomain_lane_bonding_enable(struct tb_xdomain *xd)
 		return ret;
 	}
 
+	ret = tb_port_wait_for_link_width(port, 2, 100);
+	if (ret) {
+		tb_port_warn(port, "timeout enabling lane bonding\n");
+		return ret;
+	}
+
 	tb_xdomain_update_link_attributes(xd);
 
 	dev_dbg(&xd->dev, "lane bonding enabled\n");
@@ -1548,6 +1554,8 @@ void tb_xdomain_lane_bonding_disable(struct tb_xdomain *xd)
 	port = tb_port_at(xd->route, tb_xdomain_parent(xd));
 	if (port->dual_link_port) {
 		tb_port_lane_bonding_disable(port);
+		if (tb_port_wait_for_link_width(port, 1, 100) == -ETIMEDOUT)
+			tb_port_warn(port, "timeout disabling lane bonding\n");
 		tb_port_disable(port->dual_link_port);
 		tb_xdomain_update_link_attributes(xd);
 
-- 
2.30.2


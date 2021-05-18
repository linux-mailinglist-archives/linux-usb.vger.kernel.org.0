Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F845387ABA
	for <lists+linux-usb@lfdr.de>; Tue, 18 May 2021 16:10:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349817AbhEROLO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 May 2021 10:11:14 -0400
Received: from mga04.intel.com ([192.55.52.120]:3122 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1349818AbhEROLN (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 18 May 2021 10:11:13 -0400
IronPort-SDR: H9Ao/FJ8camnERYpBtA67TUnTGL2tfuCLmBKexbzXsVlad6FZ6l7UTh0wdEptctoHPanv0WNn9
 Jtufs/+wZ38g==
X-IronPort-AV: E=McAfee;i="6200,9189,9987"; a="198769251"
X-IronPort-AV: E=Sophos;i="5.82,310,1613462400"; 
   d="scan'208";a="198769251"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2021 07:09:46 -0700
IronPort-SDR: i6/PtZcBcSBmBQw35j70UHgioyh1mJJVpzEGYqhDEiALTJQKAjBjT6kpeFLoDSsnywma4ZXZfF
 14ybn/8mESiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,310,1613462400"; 
   d="scan'208";a="404835755"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 18 May 2021 07:09:44 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id A44C77E6; Tue, 18 May 2021 17:10:02 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Gil Fine <gil.fine@intel.com>,
        Casey G Bowman <casey.g.bowman@intel.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Lukas Wunner <lukas@wunner.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 5/8] thunderbolt: Update port credits after bonding is enabled/disabled
Date:   Tue, 18 May 2021 17:09:59 +0300
Message-Id: <20210518141002.63616-6-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210518141002.63616-1-mika.westerberg@linux.intel.com>
References: <20210518141002.63616-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Once lane bonding has been enabled (or disabled) both lane adapters may
update their total credits accordingly. For this reason re-read the port
credits after lane bonding has been enabled or disabled.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/switch.c  | 48 +++++++++++++++++++++++++++++++++++
 drivers/thunderbolt/tb.h      |  1 +
 drivers/thunderbolt/xdomain.c |  2 ++
 3 files changed, 51 insertions(+)

diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index ac6cb304c49f..e015dc93a916 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -1099,6 +1099,49 @@ int tb_port_wait_for_link_width(struct tb_port *port, int width,
 	return -ETIMEDOUT;
 }
 
+static int tb_port_do_update_credits(struct tb_port *port)
+{
+	u32 nfc_credits;
+	int ret;
+
+	ret = tb_port_read(port, &nfc_credits, TB_CFG_PORT, ADP_CS_4, 1);
+	if (ret)
+		return ret;
+
+	if (nfc_credits != port->config.nfc_credits) {
+		u32 total;
+
+		total = (nfc_credits & ADP_CS_4_TOTAL_BUFFERS_MASK) >>
+			ADP_CS_4_TOTAL_BUFFERS_SHIFT;
+
+		tb_port_dbg(port, "total credits changed %u -> %u\n",
+			    port->total_credits, total);
+
+		port->config.nfc_credits = nfc_credits;
+		port->total_credits = total;
+	}
+
+	return 0;
+}
+
+/**
+ * tb_port_update_credits() - Re-read port total credits
+ * @port: Port to update
+ *
+ * After the link is bonded (or bonding was disabled) the port total
+ * credits may change, so this function needs to be called to re-read
+ * the credits. Updates also the second lane adapter.
+ */
+int tb_port_update_credits(struct tb_port *port)
+{
+	int ret;
+
+	ret = tb_port_do_update_credits(port);
+	if (ret)
+		return ret;
+	return tb_port_do_update_credits(port->dual_link_port);
+}
+
 static int tb_port_start_lane_initialization(struct tb_port *port)
 {
 	int ret;
@@ -2494,6 +2537,8 @@ int tb_switch_lane_bonding_enable(struct tb_switch *sw)
 		return ret;
 	}
 
+	tb_port_update_credits(down);
+	tb_port_update_credits(up);
 	tb_switch_update_link_attributes(sw);
 
 	tb_sw_dbg(sw, "lane bonding enabled\n");
@@ -2531,7 +2576,10 @@ void tb_switch_lane_bonding_disable(struct tb_switch *sw)
 	if (tb_port_wait_for_link_width(down, 1, 100) == -ETIMEDOUT)
 		tb_sw_warn(sw, "timeout disabling lane bonding\n");
 
+	tb_port_update_credits(down);
+	tb_port_update_credits(up);
 	tb_switch_update_link_attributes(sw);
+
 	tb_sw_dbg(sw, "lane bonding disabled\n");
 }
 
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index a8190009815c..e2f304d4a65d 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -906,6 +906,7 @@ int tb_port_lane_bonding_enable(struct tb_port *port);
 void tb_port_lane_bonding_disable(struct tb_port *port);
 int tb_port_wait_for_link_width(struct tb_port *port, int width,
 				int timeout_msec);
+int tb_port_update_credits(struct tb_port *port);
 
 int tb_switch_find_vse_cap(struct tb_switch *sw, enum tb_switch_vse_cap vsec);
 int tb_switch_find_cap(struct tb_switch *sw, enum tb_switch_cap cap);
diff --git a/drivers/thunderbolt/xdomain.c b/drivers/thunderbolt/xdomain.c
index 39c2da112238..d66ea4d616fd 100644
--- a/drivers/thunderbolt/xdomain.c
+++ b/drivers/thunderbolt/xdomain.c
@@ -1533,6 +1533,7 @@ int tb_xdomain_lane_bonding_enable(struct tb_xdomain *xd)
 		return ret;
 	}
 
+	tb_port_update_credits(port);
 	tb_xdomain_update_link_attributes(xd);
 
 	dev_dbg(&xd->dev, "lane bonding enabled\n");
@@ -1557,6 +1558,7 @@ void tb_xdomain_lane_bonding_disable(struct tb_xdomain *xd)
 		if (tb_port_wait_for_link_width(port, 1, 100) == -ETIMEDOUT)
 			tb_port_warn(port, "timeout disabling lane bonding\n");
 		tb_port_disable(port->dual_link_port);
+		tb_port_update_credits(port);
 		tb_xdomain_update_link_attributes(xd);
 
 		dev_dbg(&xd->dev, "lane bonding disabled\n");
-- 
2.30.2


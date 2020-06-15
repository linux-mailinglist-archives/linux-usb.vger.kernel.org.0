Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC7BE1F9A1D
	for <lists+linux-usb@lfdr.de>; Mon, 15 Jun 2020 16:27:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730552AbgFOO05 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 15 Jun 2020 10:26:57 -0400
Received: from mga05.intel.com ([192.55.52.43]:1143 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729243AbgFOO0y (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 15 Jun 2020 10:26:54 -0400
IronPort-SDR: hfY1MFcl/eSO9PHZU1XhREqkFIKwoHw1T4hXV9gtboSik7PjCZY/CkIRSaQkwn1AgLckMDQRgM
 7qUSLvlp6eOw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2020 07:26:52 -0700
IronPort-SDR: oMdi/Xeo3CjPY17C47hf8rjLNPJXi5JmQMEmRuHhUWk4KYyl3fk28ARUHCNw3SLZzVkqzYFxfn
 1hAkYrzfR+tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,514,1583222400"; 
   d="scan'208";a="449412040"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga005.jf.intel.com with ESMTP; 15 Jun 2020 07:26:49 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 01B93574; Mon, 15 Jun 2020 17:26:46 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rajmohan Mani <rajmohan.mani@intel.com>,
        Lukas Wunner <lukas@wunner.de>
Subject: [PATCH 08/17] thunderbolt: Add DP IN resources for all routers
Date:   Mon, 15 Jun 2020 17:26:36 +0300
Message-Id: <20200615142645.56209-9-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.27.0.rc2
In-Reply-To: <20200615142645.56209-1-mika.westerberg@linux.intel.com>
References: <20200615142645.56209-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

USB4 spec allows DP tunneling from any router that has DP IN adapter,
not just from host router. The driver currently only added the DP IN
resources for the host router because Thunderbolt 1, 2 and 3 devices do
not have DP IN adapters. However, USB4 allows device routers to have DP
IN adapter as well so update the driver to add DP IN resources for each
device that has one. One example would be an eGPU enclosure where the
eGPU output is forwarded to DP IN port and then tunneled over the USB4
fabric.

Only limitation we add now is that the DP IN and DP OUT that gets paired
for tunnel creation should both be under the same topology starting from
host router downstream port. In other words we do not create DP tunnels
across host router at this time even though that is possible as well but
it complicates the bandwidth management and there is no real use-case
for this anyway.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tb.c | 50 ++++++++++++++++++++++++++++++++++++----
 1 file changed, 46 insertions(+), 4 deletions(-)

diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index 107cd232f486..55daa7f1a87d 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -404,6 +404,7 @@ static void tb_scan_port(struct tb_port *port)
 	if (tcm->hotplug_active && tb_tunnel_usb3(sw->tb, sw))
 		tb_sw_warn(sw, "USB3 tunnel creation failed\n");
 
+	tb_add_dp_resources(sw);
 	tb_scan_switch(sw);
 }
 
@@ -573,6 +574,43 @@ static int tb_available_bw(struct tb_cm *tcm, struct tb_port *in,
 	return available_bw;
 }
 
+static struct tb_port *tb_find_dp_out(struct tb *tb, struct tb_port *in)
+{
+	struct tb_port *host_port, *port;
+	struct tb_cm *tcm = tb_priv(tb);
+
+	host_port = tb_route(in->sw) ?
+		tb_port_at(tb_route(in->sw), tb->root_switch) : NULL;
+
+	list_for_each_entry(port, &tcm->dp_resources, list) {
+		if (!tb_port_is_dpout(port))
+			continue;
+
+		if (tb_port_is_enabled(port)) {
+			tb_port_dbg(port, "in use\n");
+			continue;
+		}
+
+		tb_port_dbg(port, "DP OUT available\n");
+
+		/*
+		 * Keep the DP tunnel under the topology starting from
+		 * the same host router downstream port.
+		 */
+		if (host_port && tb_route(port->sw)) {
+			struct tb_port *p;
+
+			p = tb_port_at(tb_route(port->sw), tb->root_switch);
+			if (p != host_port)
+				continue;
+		}
+
+		return port;
+	}
+
+	return NULL;
+}
+
 static void tb_tunnel_dp(struct tb *tb)
 {
 	struct tb_cm *tcm = tb_priv(tb);
@@ -589,17 +627,21 @@ static void tb_tunnel_dp(struct tb *tb)
 	in = NULL;
 	out = NULL;
 	list_for_each_entry(port, &tcm->dp_resources, list) {
+		if (!tb_port_is_dpin(port))
+			continue;
+
 		if (tb_port_is_enabled(port)) {
 			tb_port_dbg(port, "in use\n");
 			continue;
 		}
 
-		tb_port_dbg(port, "available\n");
+		tb_port_dbg(port, "DP IN available\n");
 
-		if (!in && tb_port_is_dpin(port))
+		out = tb_find_dp_out(tb, port);
+		if (out) {
 			in = port;
-		else if (!out && tb_port_is_dpout(port))
-			out = port;
+			break;
+		}
 	}
 
 	if (!in) {
-- 
2.27.0.rc2


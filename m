Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1AB61F9A15
	for <lists+linux-usb@lfdr.de>; Mon, 15 Jun 2020 16:26:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730500AbgFOO0y (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 15 Jun 2020 10:26:54 -0400
Received: from mga09.intel.com ([134.134.136.24]:59953 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729243AbgFOO0u (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 15 Jun 2020 10:26:50 -0400
IronPort-SDR: aI7uARs1On4bD5BLcIWOKgb+qMf6OluQqD9HwF0Qs6o6PxytDdwxThJ0gSmdSqxVVmLWhI5JaK
 dE8CqSr9LJ6A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2020 07:26:49 -0700
IronPort-SDR: m17V032QInMJDwB1Sp9Jshy9Nz5fOeO6/ApDZ/1VXHkC/jJRDKYnL7ONcKZFhxQvy341VnU6Y8
 Ap8wN6s2yMsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,514,1583222400"; 
   d="scan'208";a="262736087"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 15 Jun 2020 07:26:47 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id C37BA217; Mon, 15 Jun 2020 17:26:45 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rajmohan Mani <rajmohan.mani@intel.com>,
        Lukas Wunner <lukas@wunner.de>
Subject: [PATCH 02/17] thunderbolt: Make tb_next_port_on_path() work with tree topologies
Date:   Mon, 15 Jun 2020 17:26:30 +0300
Message-Id: <20200615142645.56209-3-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.27.0.rc2
In-Reply-To: <20200615142645.56209-1-mika.westerberg@linux.intel.com>
References: <20200615142645.56209-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

USB4 makes it possible to have tree topology of devices connected in the
same way than USB3. This was actually possible in Thunderbolt 1, 2 and 3
as well but all the available devices only had two ports which allows
building only daisy-chains of devices.

With USB4 it is possible for example that there is DP IN adapter as part
of eGPU device router and that should be tunneled over the tree topology
to a DP OUT adapter. This updates the tb_next_port_on_path() to support
such topologies.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/switch.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index 95b75a712ade..29db484d2c74 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -850,6 +850,13 @@ void tb_port_release_out_hopid(struct tb_port *port, int hopid)
 	ida_simple_remove(&port->out_hopids, hopid);
 }
 
+static inline bool tb_switch_is_reachable(const struct tb_switch *parent,
+					  const struct tb_switch *sw)
+{
+	u64 mask = (1ULL << parent->config.depth * 8) - 1;
+	return (tb_route(parent) & mask) == (tb_route(sw) & mask);
+}
+
 /**
  * tb_next_port_on_path() - Return next port for given port on a path
  * @start: Start port of the walk
@@ -879,12 +886,12 @@ struct tb_port *tb_next_port_on_path(struct tb_port *start, struct tb_port *end,
 		return end;
 	}
 
-	if (start->sw->config.depth < end->sw->config.depth) {
+	if (tb_switch_is_reachable(prev->sw, end->sw)) {
+		next = tb_port_at(tb_route(end->sw), prev->sw);
+		/* Walk down the topology if next == prev */
 		if (prev->remote &&
-		    prev->remote->sw->config.depth > prev->sw->config.depth)
+		    (next == prev || next->dual_link_port == prev))
 			next = prev->remote;
-		else
-			next = tb_port_at(tb_route(end->sw), prev->sw);
 	} else {
 		if (tb_is_upstream_port(prev)) {
 			next = prev->remote;
@@ -901,7 +908,7 @@ struct tb_port *tb_next_port_on_path(struct tb_port *start, struct tb_port *end,
 		}
 	}
 
-	return next;
+	return next != prev ? next : NULL;
 }
 
 static int tb_port_get_link_speed(struct tb_port *port)
-- 
2.27.0.rc2


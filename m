Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C50D7147A5
	for <lists+linux-usb@lfdr.de>; Mon, 29 May 2023 12:04:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231919AbjE2KEf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 29 May 2023 06:04:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231912AbjE2KEc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 29 May 2023 06:04:32 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64F0AC7
        for <linux-usb@vger.kernel.org>; Mon, 29 May 2023 03:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685354665; x=1716890665;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aeEjKOCY7V43+0gX+kNnDgo8aWHhA9v8g1czZssCKbM=;
  b=RDRJXZ+bot52FH44J5RluulusDBcgHmSzmU4GT4HzezEDvwZTtNK6gts
   NLK81KBcUFnN2fBRk/FkG14SODT0wy2UeJN2vC0Wg6uwinns3qfAj3e+u
   34DD0gbfrH8VGppWdmd+TFAlUglsrOI8bGQRy9LIC3H8aMqDU6T81JKmY
   IxkD6c8qWVOvsyNKH6ZVFWb4QCdQ9nMvGQJCJkJoHdNLLjvkxOhqJOiHI
   MsymXt7LmjFgsRjiRV2EAVhRmE+e3RSSXLNhdj+MkkJ+4X/3+RUpid6Kl
   cyK+OtwHdgwfzawdrdP6zngHfTH04uJsx+RU9yyNMjMhrHosGu6POMifV
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="354684412"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; 
   d="scan'208";a="354684412"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2023 03:04:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="683518284"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; 
   d="scan'208";a="683518284"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 29 May 2023 03:04:21 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id D3FD753A; Mon, 29 May 2023 13:04:25 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Gil Fine <gil.fine@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 02/20] thunderbolt: Introduce tb_xdomain_downstream_port()
Date:   Mon, 29 May 2023 13:04:07 +0300
Message-Id: <20230529100425.6125-3-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230529100425.6125-1-mika.westerberg@linux.intel.com>
References: <20230529100425.6125-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In the same way we did for the routers add a function that returns the
parent routers downstream facing port for XDomain devices.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tb.h      | 11 +++++++++++
 drivers/thunderbolt/xdomain.c | 16 +++++++---------
 2 files changed, 18 insertions(+), 9 deletions(-)

diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index beaeea679e10..797d8bb73bfa 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -1197,6 +1197,17 @@ static inline struct tb_switch *tb_xdomain_parent(struct tb_xdomain *xd)
 	return tb_to_switch(xd->dev.parent);
 }
 
+/**
+ * tb_xdomain_downstream_port() - Return downstream facing port of parent router
+ * @xd: Xdomain pointer
+ *
+ * Returns the downstream port the XDomain is connected to.
+ */
+static inline struct tb_port *tb_xdomain_downstream_port(struct tb_xdomain *xd)
+{
+	return tb_port_at(xd->route, tb_xdomain_parent(xd));
+}
+
 int tb_retimer_nvm_read(struct tb_retimer *rt, unsigned int address, void *buf,
 			size_t size);
 int tb_retimer_scan(struct tb_port *port, bool add);
diff --git a/drivers/thunderbolt/xdomain.c b/drivers/thunderbolt/xdomain.c
index e2b54887d331..8389961b2d45 100644
--- a/drivers/thunderbolt/xdomain.c
+++ b/drivers/thunderbolt/xdomain.c
@@ -537,9 +537,8 @@ static int tb_xdp_link_state_status_request(struct tb_ctl *ctl, u64 route,
 static int tb_xdp_link_state_status_response(struct tb *tb, struct tb_ctl *ctl,
 					     struct tb_xdomain *xd, u8 sequence)
 {
-	struct tb_switch *sw = tb_to_switch(xd->dev.parent);
 	struct tb_xdp_link_state_status_response res;
-	struct tb_port *port = tb_port_at(xd->route, sw);
+	struct tb_port *port = tb_xdomain_downstream_port(xd);
 	u32 val[2];
 	int ret;
 
@@ -1137,7 +1136,7 @@ static int tb_xdomain_update_link_attributes(struct tb_xdomain *xd)
 	struct tb_port *port;
 	int ret;
 
-	port = tb_port_at(xd->route, tb_xdomain_parent(xd));
+	port = tb_xdomain_downstream_port(xd);
 
 	ret = tb_port_get_link_speed(port);
 	if (ret < 0)
@@ -1251,8 +1250,7 @@ static int tb_xdomain_get_link_status(struct tb_xdomain *xd)
 static int tb_xdomain_link_state_change(struct tb_xdomain *xd,
 					unsigned int width)
 {
-	struct tb_switch *sw = tb_to_switch(xd->dev.parent);
-	struct tb_port *port = tb_port_at(xd->route, sw);
+	struct tb_port *port = tb_xdomain_downstream_port(xd);
 	struct tb *tb = xd->tb;
 	u8 tlw, tls;
 	u32 val;
@@ -1309,7 +1307,7 @@ static int tb_xdomain_bond_lanes_uuid_high(struct tb_xdomain *xd)
 		return -ETIMEDOUT;
 	}
 
-	port = tb_port_at(xd->route, tb_xdomain_parent(xd));
+	port = tb_xdomain_downstream_port(xd);
 
 	/*
 	 * We can't use tb_xdomain_lane_bonding_enable() here because it
@@ -1425,7 +1423,7 @@ static int tb_xdomain_get_properties(struct tb_xdomain *xd)
 		if (xd->bonding_possible) {
 			struct tb_port *port;
 
-			port = tb_port_at(xd->route, tb_xdomain_parent(xd));
+			port = tb_xdomain_downstream_port(xd);
 			if (!port->bonded)
 				tb_port_disable(port->dual_link_port);
 		}
@@ -1979,7 +1977,7 @@ int tb_xdomain_lane_bonding_enable(struct tb_xdomain *xd)
 	struct tb_port *port;
 	int ret;
 
-	port = tb_port_at(xd->route, tb_xdomain_parent(xd));
+	port = tb_xdomain_downstream_port(xd);
 	if (!port->dual_link_port)
 		return -ENODEV;
 
@@ -2024,7 +2022,7 @@ void tb_xdomain_lane_bonding_disable(struct tb_xdomain *xd)
 {
 	struct tb_port *port;
 
-	port = tb_port_at(xd->route, tb_xdomain_parent(xd));
+	port = tb_xdomain_downstream_port(xd);
 	if (port->dual_link_port) {
 		tb_port_lane_bonding_disable(port);
 		if (tb_port_wait_for_link_width(port, 1, 100) == -ETIMEDOUT)
-- 
2.39.2


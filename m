Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 77BCD65EA07
	for <lists+linux-usb@lfdr.de>; Thu,  5 Jan 2023 12:35:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232512AbjAELfu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 5 Jan 2023 06:35:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232529AbjAELfc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 5 Jan 2023 06:35:32 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54CE758D07
        for <linux-usb@vger.kernel.org>; Thu,  5 Jan 2023 03:35:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672918531; x=1704454531;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OGmbCqBoMCK0KN0Lv9sl+lwXNjFFd6CxWn+EP8AmwHU=;
  b=EBhgpCLKvM/+4fY4iKpkha3xOw13UCzdsa0IU2jO3S+E4N13CqKJWxNX
   F5CQQB0F3EMiUQVwASgZgJo61DLT9AH25o/kWN+CH0dj11alJJuobPW6h
   fFAtARNI/2NRjhEsdeg+la+tsJzMh3G1rhXFe0rk3TXpvFY1+uwAQ2D6c
   2dIte3ZvFSWwn0O1kLp+g1OOygkzrN23h+01MS+EvtliCmwFPKg1Ou9N8
   tgd2s7No/n5NqGfYQQOPGy6j3KyjVKivJHCdv8+tCI8tMwPEv5AFOllaJ
   o2AJlYu0pawYp1XxjtLNZ6UvhEhsKxBlTWMItbchL+5BhQCZBrZnGwWkh
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10580"; a="319888867"
X-IronPort-AV: E=Sophos;i="5.96,302,1665471600"; 
   d="scan'208";a="319888867"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2023 03:35:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10580"; a="829527657"
X-IronPort-AV: E=Sophos;i="5.96,302,1665471600"; 
   d="scan'208";a="829527657"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga005.jf.intel.com with ESMTP; 05 Jan 2023 03:35:26 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id B022C252; Thu,  5 Jan 2023 13:35:59 +0200 (EET)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 4/8] thunderbolt: Take CL states into account when waiting for link to come up
Date:   Thu,  5 Jan 2023 13:35:55 +0200
Message-Id: <20230105113559.68531-5-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230105113559.68531-1-mika.westerberg@linux.intel.com>
References: <20230105113559.68531-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

If CL states are enabled for the link it may be in these states too when
reading the lane adapter state but it will enter CL0 as soon as there is
traffic in the high-speed lanes. Upon discovery we want to make sure
that is accounted as the link being up, otherwise we end up tearing down
the topology with no good reason.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/switch.c  | 42 +++++++++++++++++++++--------------
 drivers/thunderbolt/tb_regs.h |  4 ++++
 2 files changed, 29 insertions(+), 17 deletions(-)

diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index 363d712aa364..e1ad1b437291 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -513,36 +513,44 @@ int tb_wait_for_port(struct tb_port *port, bool wait_if_unplugged)
 
 	while (retries--) {
 		state = tb_port_state(port);
-		if (state < 0)
-			return state;
-		if (state == TB_PORT_DISABLED) {
+		switch (state) {
+		case TB_PORT_DISABLED:
 			tb_port_dbg(port, "is disabled (state: 0)\n");
 			return 0;
-		}
-		if (state == TB_PORT_UNPLUGGED) {
+
+		case TB_PORT_UNPLUGGED:
 			if (wait_if_unplugged) {
 				/* used during resume */
 				tb_port_dbg(port,
 					    "is unplugged (state: 7), retrying...\n");
 				msleep(100);
-				continue;
+				break;
 			}
 			tb_port_dbg(port, "is unplugged (state: 7)\n");
 			return 0;
-		}
-		if (state == TB_PORT_UP) {
-			tb_port_dbg(port, "is connected, link is up (state: 2)\n");
+
+		case TB_PORT_UP:
+		case TB_PORT_TX_CL0S:
+		case TB_PORT_RX_CL0S:
+		case TB_PORT_CL1:
+		case TB_PORT_CL2:
+			tb_port_dbg(port, "is connected, link is up (state: %d)\n", state);
 			return 1;
+
+		default:
+			if (state < 0)
+				return state;
+
+			/*
+			 * After plug-in the state is TB_PORT_CONNECTING. Give it some
+			 * time.
+			 */
+			tb_port_dbg(port,
+				    "is connected, link is not up (state: %d), retrying...\n",
+				    state);
+			msleep(100);
 		}
 
-		/*
-		 * After plug-in the state is TB_PORT_CONNECTING. Give it some
-		 * time.
-		 */
-		tb_port_dbg(port,
-			    "is connected, link is not up (state: %d), retrying...\n",
-			    state);
-		msleep(100);
 	}
 	tb_port_warn(port,
 		     "failed to reach state TB_PORT_UP. Ignoring port...\n");
diff --git a/drivers/thunderbolt/tb_regs.h b/drivers/thunderbolt/tb_regs.h
index 3c38b0cb8f74..f4a194cc0d63 100644
--- a/drivers/thunderbolt/tb_regs.h
+++ b/drivers/thunderbolt/tb_regs.h
@@ -50,6 +50,10 @@ enum tb_port_state {
 	TB_PORT_DISABLED	= 0, /* tb_cap_phy.disable == 1 */
 	TB_PORT_CONNECTING	= 1, /* retry */
 	TB_PORT_UP		= 2,
+	TB_PORT_TX_CL0S		= 3,
+	TB_PORT_RX_CL0S		= 4,
+	TB_PORT_CL1		= 5,
+	TB_PORT_CL2		= 6,
 	TB_PORT_UNPLUGGED	= 7,
 };
 
-- 
2.35.1


Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 619997147A7
	for <lists+linux-usb@lfdr.de>; Mon, 29 May 2023 12:04:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231926AbjE2KEh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 29 May 2023 06:04:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231910AbjE2KEe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 29 May 2023 06:04:34 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B89BEDC
        for <linux-usb@vger.kernel.org>; Mon, 29 May 2023 03:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685354672; x=1716890672;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+2ayWDfJL/O7lNBfeF1TJTPlsjPZjczFxtUoiT4QpG0=;
  b=WjKjoLbKfQ2KmvRneCZiPZSiwSLfshqrWA3CY8bbeNmbOs+zAbeq058k
   0unhDjcgC2o6E9U5j6Njs/AFf/feXa3kAxeykolos9peVHHXHJDn6TMVV
   OoNSR0B8eD3Ufgs9sUME9UGB6MyLZPE2jmfDBKn4ZAQeid7Ugj+0alDIU
   Gnky2q2KqXPqCDl9cT1N5fqH2xhNiujvwfjT7PeVvUQmkguneFjXf/luG
   JWk+9VCiGuu/6cT6ERUpp/a8DZg5eOgBOqP9Y0PKWhwPi4ZhbLZxsQy/0
   clhewH0BYv572uPgJZqK8JPrsBwRadjpHMaT2trtJYYLp75axH9sr3J+X
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="354684424"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; 
   d="scan'208";a="354684424"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2023 03:04:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="683518432"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; 
   d="scan'208";a="683518432"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 29 May 2023 03:04:24 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 12A875FD; Mon, 29 May 2023 13:04:26 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Gil Fine <gil.fine@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 06/20] thunderbolt: Get rid of tb_switch_enable_tmu_1st_child()
Date:   Mon, 29 May 2023 13:04:11 +0300
Message-Id: <20230529100425.6125-7-mika.westerberg@linux.intel.com>
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

This is better to be part of the software connection manager flows in
tb.c. Also name the new function tb_increase_tmu_accuracy() to match
what it actually does.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tb.c  | 43 +++++++++++++++++++++++++++++++--------
 drivers/thunderbolt/tb.h  |  2 --
 drivers/thunderbolt/tmu.c | 29 --------------------------
 3 files changed, 34 insertions(+), 40 deletions(-)

diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index 72041e29e544..39ec7094fe17 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -240,6 +240,38 @@ static void tb_discover_dp_resources(struct tb *tb)
 	}
 }
 
+static int tb_increase_switch_tmu_accuracy(struct device *dev, void *data)
+{
+	struct tb_switch *sw;
+
+	sw = tb_to_switch(dev);
+	if (sw) {
+		tb_switch_tmu_configure(sw, TB_SWITCH_TMU_RATE_HIFI,
+					tb_switch_is_clx_enabled(sw, TB_CL1));
+		if (tb_switch_tmu_enable(sw))
+			tb_sw_warn(sw, "failed to increase TMU rate\n");
+	}
+
+	return 0;
+}
+
+static void tb_increase_tmu_accuracy(struct tb_tunnel *tunnel)
+{
+	struct tb_switch *sw;
+
+	if (!tunnel)
+		return;
+
+	/*
+	 * Once first DP tunnel is established we change the TMU
+	 * accuracy of first depth child routers (and the host router)
+	 * to the highest. This is needed for the DP tunneling to work
+	 * but also allows CL0s.
+	 */
+	sw = tunnel->tb->root_switch;
+	device_for_each_child(&sw->dev, NULL, tb_increase_switch_tmu_accuracy);
+}
+
 static void tb_switch_discover_tunnels(struct tb_switch *sw,
 				       struct list_head *list,
 				       bool alloc_hopids)
@@ -253,13 +285,7 @@ static void tb_switch_discover_tunnels(struct tb_switch *sw,
 		switch (port->config.type) {
 		case TB_TYPE_DP_HDMI_IN:
 			tunnel = tb_tunnel_discover_dp(tb, port, alloc_hopids);
-			/*
-			 * In case of DP tunnel exists, change host router's
-			 * 1st children TMU mode to HiFi for CL0s to work.
-			 */
-			if (tunnel)
-				tb_switch_enable_tmu_1st_child(tb->root_switch,
-						TB_SWITCH_TMU_RATE_HIFI);
+			tb_increase_tmu_accuracy(tunnel);
 			break;
 
 		case TB_TYPE_PCIE_DOWN:
@@ -1263,8 +1289,7 @@ static void tb_tunnel_dp(struct tb *tb)
 	 * In case of DP tunnel exists, change host router's 1st children
 	 * TMU mode to HiFi for CL0s to work.
 	 */
-	tb_switch_enable_tmu_1st_child(tb->root_switch, TB_SWITCH_TMU_RATE_HIFI);
-
+	tb_increase_tmu_accuracy(tunnel);
 	return;
 
 err_free:
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index 0ac653bfd97e..8cc64b79f35c 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -990,8 +990,6 @@ int tb_switch_tmu_enable(struct tb_switch *sw);
 void tb_switch_tmu_configure(struct tb_switch *sw,
 			     enum tb_switch_tmu_rate rate,
 			     bool unidirectional);
-void tb_switch_enable_tmu_1st_child(struct tb_switch *sw,
-				    enum tb_switch_tmu_rate rate);
 /**
  * tb_switch_tmu_is_enabled() - Checks if the specified TMU mode is enabled
  * @sw: Router whose TMU mode to check
diff --git a/drivers/thunderbolt/tmu.c b/drivers/thunderbolt/tmu.c
index 30f18806abb7..84abb783a6d9 100644
--- a/drivers/thunderbolt/tmu.c
+++ b/drivers/thunderbolt/tmu.c
@@ -731,32 +731,3 @@ void tb_switch_tmu_configure(struct tb_switch *sw,
 	sw->tmu.unidirectional_request = unidirectional;
 	sw->tmu.rate_request = rate;
 }
-
-static int tb_switch_tmu_config_enable(struct device *dev, void *rate)
-{
-	if (tb_is_switch(dev)) {
-		struct tb_switch *sw = tb_to_switch(dev);
-
-		tb_switch_tmu_configure(sw, *(enum tb_switch_tmu_rate *)rate,
-					tb_switch_is_clx_enabled(sw, TB_CL1));
-		if (tb_switch_tmu_enable(sw))
-			tb_sw_dbg(sw, "fail switching TMU mode for 1st depth router\n");
-	}
-
-	return 0;
-}
-
-/**
- * tb_switch_enable_tmu_1st_child - Configure and enable TMU for 1st chidren
- * @sw: The router to configure and enable it's children TMU
- * @rate: Rate of the TMU to configure the router's chidren to
- *
- * Configures and enables the TMU mode of 1st depth children of the specified
- * router to the specified rate.
- */
-void tb_switch_enable_tmu_1st_child(struct tb_switch *sw,
-				    enum tb_switch_tmu_rate rate)
-{
-	device_for_each_child(&sw->dev, &rate,
-			      tb_switch_tmu_config_enable);
-}
-- 
2.39.2


Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A883534D92
	for <lists+linux-usb@lfdr.de>; Thu, 26 May 2022 12:49:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344503AbiEZKtm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 May 2022 06:49:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346086AbiEZKtk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 26 May 2022 06:49:40 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B0FBCEB89
        for <linux-usb@vger.kernel.org>; Thu, 26 May 2022 03:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653562179; x=1685098179;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=lggRQY48TRxA/ZrYW99zA1j1zqJyccov+vd5bCTuFj8=;
  b=a8m4hQ3MMTO0FCISyt9ZsQGfCg8Lv2f2xIU58YVNjWta8823Jlw0qiCl
   W08v88yHZUrhn+/5489WcuQ8WTPzlK/APNR2cHAmWm7/O1Kzd1SwuPx4T
   I2QrkiOTouNHzBGJks3t/GCzHIf3YwhezkZ8Fk9NzkdB67Q1/bwvM40KT
   kg1XdG1SvNKTkL6xXbZ3yWqFewhst2MTFw2Daxi+ZpYGU3HT0P6nsrUgy
   6jAtYod5h/mrdTjw1TcLdLR2ZKjzVqnMxEvSmo8tvNZMAN9Rh4nL0FCth
   AlHk7mibW35HEGW3y6hRJCXBoShkRB2bk2TEc4XDCI8QnR5cTFc6gIDAb
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10358"; a="274223380"
X-IronPort-AV: E=Sophos;i="5.91,252,1647327600"; 
   d="scan'208";a="274223380"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2022 03:49:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,252,1647327600"; 
   d="scan'208";a="704474320"
Received: from ccdjpclinux26.jer.intel.com ([10.12.48.253])
  by orsmga004.jf.intel.com with ESMTP; 26 May 2022 03:49:37 -0700
From:   Gil Fine <gil.fine@intel.com>
To:     andreas.noever@gmail.com, michael.jamet@intel.com,
        mika.westerberg@linux.intel.com, YehezkelShB@gmail.com
Cc:     gil.fine@intel.com, linux-usb@vger.kernel.org, lukas@wunner.de
Subject: [PATCH v4 6/6] thunderbolt: Change TMU mode to HiFi uni-directional once DisplayPort tunneled
Date:   Thu, 26 May 2022 13:59:21 +0300
Message-Id: <20220526105921.17214-7-gil.fine@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220526105921.17214-1-gil.fine@intel.com>
References: <20220526105921.17214-1-gil.fine@intel.com>
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Here we configure TMU mode to HiFi uni-directional once DP tunnel
is created. This is due to accuracy requirement for DP tunneling
as appears in CM guide 1.0, section 7.3.2.
Due to Intel hardware limitation, once we changed the TMU mode to HiFi
uni-directional (when DP tunnel exists), we don't change TMU mode back to
normal uni-directional, even if DP tunnel is torn down later.

Signed-off-by: Gil Fine <gil.fine@intel.com>
---
 drivers/thunderbolt/tb.c  | 13 +++++++++++++
 drivers/thunderbolt/tb.h  |  2 ++
 drivers/thunderbolt/tmu.c | 29 +++++++++++++++++++++++++++++
 3 files changed, 44 insertions(+)

diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index f512197e719b..482079a75fbb 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -118,6 +118,13 @@ static void tb_switch_discover_tunnels(struct tb_switch *sw,
 		switch (port->config.type) {
 		case TB_TYPE_DP_HDMI_IN:
 			tunnel = tb_tunnel_discover_dp(tb, port, alloc_hopids);
+			/*
+			 * In case of DP tunnel exists, change host router's
+			 * 1st children TMU mode to HiFi for CL0s to work.
+			 */
+			if (tunnel)
+				tb_switch_enable_tmu_1st_child(tb->root_switch,
+						TB_SWITCH_TMU_RATE_HIFI);
 			break;
 
 		case TB_TYPE_PCIE_DOWN:
@@ -985,6 +992,12 @@ static void tb_tunnel_dp(struct tb *tb)
 
 	list_add_tail(&tunnel->list, &tcm->tunnel_list);
 	tb_reclaim_usb3_bandwidth(tb, in, out);
+	/*
+	 * In case of DP tunnel exists, change host router's 1st children
+	 * TMU mode to HiFi for CL0s to work.
+	 */
+	tb_switch_enable_tmu_1st_child(tb->root_switch, TB_SWITCH_TMU_RATE_HIFI);
+
 	return;
 
 err_free:
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index a16fffba9dd2..d781dd282465 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -934,6 +934,8 @@ int tb_switch_tmu_enable(struct tb_switch *sw);
 void tb_switch_tmu_configure(struct tb_switch *sw,
 			     enum tb_switch_tmu_rate rate,
 			     bool unidirectional);
+void tb_switch_enable_tmu_1st_child(struct tb_switch *sw,
+				    enum tb_switch_tmu_rate rate);
 /**
  * tb_switch_tmu_is_enabled() - Checks if the specified TMU mode is enabled
  * @sw: Router whose TMU mode to check
diff --git a/drivers/thunderbolt/tmu.c b/drivers/thunderbolt/tmu.c
index e822ab90338b..626aca3124b1 100644
--- a/drivers/thunderbolt/tmu.c
+++ b/drivers/thunderbolt/tmu.c
@@ -742,3 +742,32 @@ void tb_switch_tmu_configure(struct tb_switch *sw,
 	sw->tmu.unidirectional_request = unidirectional;
 	sw->tmu.rate_request = rate;
 }
+
+static int tb_switch_tmu_config_enable(struct device *dev, void *rate)
+{
+	if (tb_is_switch(dev)) {
+		struct tb_switch *sw = tb_to_switch(dev);
+
+		tb_switch_tmu_configure(sw, *(enum tb_switch_tmu_rate *)rate,
+					tb_switch_is_clx_enabled(sw, TB_CL1));
+		if (tb_switch_tmu_enable(sw))
+			tb_sw_dbg(sw, "fail switching TMU mode for 1st depth router\n");
+	}
+
+	return 0;
+}
+
+/**
+ * tb_switch_enable_tmu_1st_child - Configure and enable TMU for 1st chidren
+ * @sw: The router to configure and enable it's children TMU
+ * @rate: Rate of the TMU to configure the router's chidren to
+ *
+ * Configures and enables the TMU mode of 1st depth children of the specified
+ * router to the specified rate.
+ */
+void tb_switch_enable_tmu_1st_child(struct tb_switch *sw,
+				    enum tb_switch_tmu_rate rate)
+{
+	device_for_each_child(&sw->dev, &rate,
+			      tb_switch_tmu_config_enable);
+}
-- 
2.17.1

---------------------------------------------------------------------
Intel Israel (74) Limited

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.


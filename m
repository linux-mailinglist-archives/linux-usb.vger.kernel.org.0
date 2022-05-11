Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9EA35234CC
	for <lists+linux-usb@lfdr.de>; Wed, 11 May 2022 15:56:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244374AbiEKN4t (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 May 2022 09:56:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233422AbiEKN42 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 11 May 2022 09:56:28 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F4CC245AD
        for <linux-usb@vger.kernel.org>; Wed, 11 May 2022 06:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652277387; x=1683813387;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=+TRL0uHBAyz8TejRaUdGNfAO2e3pjyP4MTiVBcya6g8=;
  b=R6cI5sTvO8aAkz6qxb0+H/SXYyTeAoIr8606JGOzeJiwNfVcCNYDMuxQ
   cpgLvrw1RRo2V1ZHWqnwm2X837U9r4DcJCiGL31fZqIV2UAjzhsTaMpkT
   POe3Df7UBX6iJp+YCpeXHc6wYuDY6hjjRnulWtyrTmsJxN7JU3Jswukuy
   auag32fWzTEz5VRY3WpccfNTreLdcQ3cI1miodIpESoCcwGMvp6JZBNgl
   x6flPsFn4Ohvx5avejf+yuGHlIwcmbGVwTllG89z7XoBg13Ns4+Ec2dF7
   w//Nz/qIcxp6vhkAKbSQs61Sl/SqESLaTYo3TqXc+35TMhJbX/zYKoz2Q
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10343"; a="249599730"
X-IronPort-AV: E=Sophos;i="5.91,217,1647327600"; 
   d="scan'208";a="249599730"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2022 06:56:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,217,1647327600"; 
   d="scan'208";a="553332036"
Received: from ccdjpclinux26.jer.intel.com ([10.12.48.253])
  by orsmga002.jf.intel.com with ESMTP; 11 May 2022 06:56:24 -0700
From:   Gil Fine <gil.fine@intel.com>
To:     andreas.noever@gmail.com, michael.jamet@intel.com,
        mika.westerberg@linux.intel.com, YehezkelShB@gmail.com
Cc:     gil.fine@intel.com, linux-usb@vger.kernel.org, lukas@wunner.de
Subject: [PATCH v3 6/6] thunderbolt: Change TMU mode to HiFi uni-directional once DisplayPort tunneled
Date:   Wed, 11 May 2022 17:05:49 +0300
Message-Id: <20220511140549.10571-7-gil.fine@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220511140549.10571-1-gil.fine@intel.com>
References: <20220511140549.10571-1-gil.fine@intel.com>
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
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
 drivers/thunderbolt/tb.c  | 28 ++++++++++++++++++++++++++++
 drivers/thunderbolt/tb.h  |  5 +++++
 drivers/thunderbolt/tmu.c | 14 ++++++++++++++
 3 files changed, 47 insertions(+)

diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index f512197e719b..d0f85a8c56de 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -50,6 +50,8 @@ struct tb_hotplug_event {
 };
 
 static void tb_handle_hotplug(struct work_struct *work);
+static void tb_enable_tmu_1st_child(struct tb *tb,
+				    enum tb_switch_tmu_rate rate);
 
 static void tb_queue_hotplug(struct tb *tb, u64 route, u8 port, bool unplug)
 {
@@ -118,6 +120,13 @@ static void tb_switch_discover_tunnels(struct tb_switch *sw,
 		switch (port->config.type) {
 		case TB_TYPE_DP_HDMI_IN:
 			tunnel = tb_tunnel_discover_dp(tb, port, alloc_hopids);
+			/*
+			 * In case of DP tunnel exists, change TMU mode to
+			 * HiFi for CL0s to work.
+			 */
+			if (tunnel)
+				tb_enable_tmu_1st_child(tb,
+						TB_SWITCH_TMU_RATE_HIFI);
 			break;
 
 		case TB_TYPE_PCIE_DOWN:
@@ -235,6 +244,19 @@ static int tb_enable_tmu(struct tb_switch *sw)
 	return tb_switch_tmu_enable(sw);
 }
 
+/*
+ * Once a DP tunnel exists in the domain, we set the TMU mode so that
+ * it meets the accuracy requirements and also enables CLx entry (CL0s).
+ * We set the TMU mode of the first depth router(s) for CL0s to work.
+ */
+static void tb_enable_tmu_1st_child(struct tb *tb, enum tb_switch_tmu_rate rate)
+{
+	struct tb_sw_tmu_config tmu = { .rate = rate };
+
+	device_for_each_child(&tb->root_switch->dev, &tmu,
+			      tb_switch_tmu_config_enable);
+}
+
 /**
  * tb_find_unused_port() - return the first inactive port on @sw
  * @sw: Switch to find the port on
@@ -985,6 +1007,12 @@ static void tb_tunnel_dp(struct tb *tb)
 
 	list_add_tail(&tunnel->list, &tcm->tunnel_list);
 	tb_reclaim_usb3_bandwidth(tb, in, out);
+	/*
+	 * In case of DP tunnel exists, change TMU mode to
+	 * HiFi for CL0s to work.
+	 */
+	tb_enable_tmu_1st_child(tb, TB_SWITCH_TMU_RATE_HIFI);
+
 	return;
 
 err_free:
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index a16fffba9dd2..3dbd9d919d5f 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -110,6 +110,10 @@ struct tb_switch_tmu {
 	enum tb_switch_tmu_rate rate_request;
 };
 
+struct tb_sw_tmu_config {
+	enum tb_switch_tmu_rate rate;
+};
+
 enum tb_clx {
 	TB_CLX_DISABLE,
 	/* CL0s and CL1 are enabled and supported together */
@@ -934,6 +938,7 @@ int tb_switch_tmu_enable(struct tb_switch *sw);
 void tb_switch_tmu_configure(struct tb_switch *sw,
 			     enum tb_switch_tmu_rate rate,
 			     bool unidirectional);
+int tb_switch_tmu_config_enable(struct device *dev, void *data);
 /**
  * tb_switch_tmu_is_enabled() - Checks if the specified TMU mode is enabled
  * @sw: Router whose TMU mode to check
diff --git a/drivers/thunderbolt/tmu.c b/drivers/thunderbolt/tmu.c
index e822ab90338b..b8ff9f64a71e 100644
--- a/drivers/thunderbolt/tmu.c
+++ b/drivers/thunderbolt/tmu.c
@@ -727,6 +727,20 @@ int tb_switch_tmu_enable(struct tb_switch *sw)
 	return tb_switch_tmu_set_time_disruption(sw, false);
 }
 
+int tb_switch_tmu_config_enable(struct device *dev, void *data)
+{
+	if (tb_is_switch(dev)) {
+		struct tb_switch *sw = tb_to_switch(dev);
+		struct tb_sw_tmu_config *tmu = data;
+
+		tb_switch_tmu_configure(sw, tmu->rate, tb_switch_is_clx_enabled(sw, TB_CL1));
+		if (tb_switch_tmu_enable(sw))
+			tb_sw_dbg(sw, "Fail switching TMU to HiFi for 1st depth router\n");
+	}
+
+	return 0;
+}
+
 /**
  * tb_switch_tmu_configure() - Configure the TMU rate and directionality
  * @sw: Router whose mode to change
-- 
2.17.1

---------------------------------------------------------------------
Intel Israel (74) Limited

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.


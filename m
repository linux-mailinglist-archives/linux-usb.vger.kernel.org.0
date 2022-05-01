Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 183045167BB
	for <lists+linux-usb@lfdr.de>; Sun,  1 May 2022 22:24:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354331AbiEAU1d (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 1 May 2022 16:27:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354343AbiEAU1c (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 1 May 2022 16:27:32 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AD4A3EF39
        for <linux-usb@vger.kernel.org>; Sun,  1 May 2022 13:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651436646; x=1682972646;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=qB8FXQ0fDT7sJ4/yVweDns83nJ1kKPZHSiUWavVKEdE=;
  b=hNo/Xd4OaVppTzN68zXZb1EqFp6B2VeHhiK7uQFLKWKd7GX0TLaKo5n+
   Wr8p4F4rvbZCXIOPtXC8pezqz3LmhN9vJJWH/ZAewZxTdJpK9QUzr9ZJi
   I0HH+WMQMqqcsUCZUuF0xwGHsmBOgx314BYODdRe72L7ma15GU4CkbRMY
   efwp8m+h0TuKiJLwT2aTFXcNQFwoF++PgJ9VUXb07/cnmRiPGAJlXgaVR
   O7D+1Y2I2a+5FKiLhWBYrQ/WgA8JZL/V6/FjXD4U7iiCMrgU7SvI7rLHB
   yQF+TsQavM8hhbTEfxCbjJi1+U/b1PkLxm44RjZPzleWki/fR7xg4hkIL
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10334"; a="247611839"
X-IronPort-AV: E=Sophos;i="5.91,190,1647327600"; 
   d="scan'208";a="247611839"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2022 13:24:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,190,1647327600"; 
   d="scan'208";a="583310238"
Received: from ccdjpclinux26.jer.intel.com ([10.12.48.253])
  by orsmga008.jf.intel.com with ESMTP; 01 May 2022 13:24:03 -0700
From:   Gil Fine <gil.fine@intel.com>
To:     andreas.noever@gmail.com, michael.jamet@intel.com,
        mika.westerberg@linux.intel.com, YehezkelShB@gmail.com
Cc:     gil.fine@intel.com, linux-usb@vger.kernel.org, lukas@wunner.de
Subject: [PATCH 5/5] thunderbolt: Change TMU mode to Hifi-Uni once DP tunneled
Date:   Sun,  1 May 2022 23:33:21 +0300
Message-Id: <20220501203321.19021-6-gil.fine@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220501203321.19021-1-gil.fine@intel.com>
References: <20220501203321.19021-1-gil.fine@intel.com>
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Here we configure TMU mode to Hifi-Uni once DP tunnel is created.
This is due to accuracy requirement for DP tunneling as appears in
CM guide 1.0, section 7.3.2
Due to Intel HW limitation, once we changed the TMU mode to Hifi-Uni
(when DP is tunnel exists), we don't change TMU mode back to Normal-Uni,
even if DP tunnel is teared-down later.

Signed-off-by: Gil Fine <gil.fine@intel.com>
---
 drivers/thunderbolt/tb.c | 40 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index 05a084e3e9f6..efe53d221ca8 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -50,6 +50,8 @@ struct tb_hotplug_event {
 };
 
 static void tb_handle_hotplug(struct work_struct *work);
+static int tb_enable_tmu_1st_child(struct tb *tb,
+				   enum tb_switch_tmu_rate rate);
 
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
@@ -235,6 +244,31 @@ static int tb_enable_tmu(struct tb_switch *sw)
 	return tb_switch_tmu_enable(sw);
 }
 
+/*
+ * Once a DP tunnel exists in the domain, we set the TMU mode so that
+ * it meets the accuracy requirements and also enables CLx entry (CL0s).
+ * We set the TMU mode of the first depth router(s) for CL0s to work.
+ */
+static int tb_enable_tmu_1st_child(struct tb *tb, enum tb_switch_tmu_rate rate)
+{
+	struct tb_switch *root_sw = tb->root_switch;
+	struct tb_port *port;
+
+	tb_switch_for_each_port(root_sw, port) {
+		struct tb_switch *sw;
+		int ret;
+
+		if (!tb_port_has_remote(port) || !tb_port_is_null(port))
+			continue;
+		sw = port->remote->sw;
+		tb_switch_tmu_configure(sw, rate, tb_switch_is_clx_enabled(sw));
+		if (tb_switch_tmu_enable(sw))
+			tb_dbg(tb, "Fail switching TMU to HiFi for 1st depth router %d\n", ret);
+	}
+
+	return 0;
+}
+
 /**
  * tb_find_unused_port() - return the first inactive port on @sw
  * @sw: Switch to find the port on
@@ -981,6 +1015,12 @@ static void tb_tunnel_dp(struct tb *tb)
 
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
-- 
2.17.1

---------------------------------------------------------------------
Intel Israel (74) Limited

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.


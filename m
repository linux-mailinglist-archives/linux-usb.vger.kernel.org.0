Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A24D5167B7
	for <lists+linux-usb@lfdr.de>; Sun,  1 May 2022 22:24:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347241AbiEAU1Y (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 1 May 2022 16:27:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245521AbiEAU1X (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 1 May 2022 16:27:23 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2871C3EF39
        for <linux-usb@vger.kernel.org>; Sun,  1 May 2022 13:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651436637; x=1682972637;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=8FcK3JT6tLgXermoJZpvyCzZDB/VYzv6Hi6+HVyZybI=;
  b=bnlqyHkHNSDk8MlZxIsY+8vq685n02xv1/ZDEckW6XeoZPN6QOVlKXtW
   GVlzA+v3mZfVJLVpoFN2Qp7ZKcPhqaXk4zy00qgmmCRdH7yjx8jc2v1dl
   1vzy+FNjyNky93NOOTNgDT8bUxjqGBWLpkv/yD+xR6vU1l/swW35Yl8rq
   7Xc1t6PcctHKytdVF1UQdCA34EtPeixrxescy3X9iTaCv8Zj7NU716TT0
   4If7RWf3nNb0tz2vw08rcToh5d0hVM2nkdt9E2uf1uKi5QaMyUhskRQmE
   lYBEvUY+8cuI2IC8im5FnuDT7eThidvEkbqzD+wr+W9iopgIdAtMIsqQp
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10334"; a="247611826"
X-IronPort-AV: E=Sophos;i="5.91,190,1647327600"; 
   d="scan'208";a="247611826"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2022 13:23:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,190,1647327600"; 
   d="scan'208";a="583310203"
Received: from ccdjpclinux26.jer.intel.com ([10.12.48.253])
  by orsmga008.jf.intel.com with ESMTP; 01 May 2022 13:23:54 -0700
From:   Gil Fine <gil.fine@intel.com>
To:     andreas.noever@gmail.com, michael.jamet@intel.com,
        mika.westerberg@linux.intel.com, YehezkelShB@gmail.com
Cc:     gil.fine@intel.com, linux-usb@vger.kernel.org, lukas@wunner.de
Subject: [PATCH 1/5] thunderbolt: Silently ignore CLx enabling in case CLx is not supported
Date:   Sun,  1 May 2022 23:33:17 +0300
Message-Id: <20220501203321.19021-2-gil.fine@intel.com>
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

We can't enable CLx if it is not supported either by the host or device,
or by the USB4/TBT link (e.g. when an optical cable is used).
We silently ignore CLx enabling in this case.

Signed-off-by: Gil Fine <gil.fine@intel.com>
---
 drivers/thunderbolt/tb.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index 44d04b651a8b..7419cd1aefba 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -581,6 +581,7 @@ static void tb_scan_port(struct tb_port *port)
 	struct tb_cm *tcm = tb_priv(port->sw->tb);
 	struct tb_port *upstream_port;
 	struct tb_switch *sw;
+	int ret;
 
 	if (tb_is_upstream_port(port))
 		return;
@@ -669,7 +670,9 @@ static void tb_scan_port(struct tb_port *port)
 	tb_switch_lane_bonding_enable(sw);
 	/* Set the link configured */
 	tb_switch_configure_link(sw);
-	if (tb_switch_enable_clx(sw, TB_CL0S))
+	/* Silently ignore CLx enabling in case CLx is not supported */
+	ret = tb_switch_enable_clx(sw, TB_CL0S);
+	if (ret && ret != -EOPNOTSUPP)
 		tb_sw_warn(sw, "failed to enable CLx on upstream port\n");
 
 	tb_switch_tmu_configure(sw, TB_SWITCH_TMU_RATE_HIFI,
@@ -1452,12 +1455,15 @@ static int tb_suspend_noirq(struct tb *tb)
 static void tb_restore_children(struct tb_switch *sw)
 {
 	struct tb_port *port;
+	int ret;
 
 	/* No need to restore if the router is already unplugged */
 	if (sw->is_unplugged)
 		return;
 
-	if (tb_switch_enable_clx(sw, TB_CL0S))
+	/* Silently ignore CLx re-enabling in case CLx is not supported */
+	ret = tb_switch_enable_clx(sw, TB_CL0S);
+	if (ret && ret != -EOPNOTSUPP)
 		tb_sw_warn(sw, "failed to re-enable CLx on upstream port\n");
 
 	/*
-- 
2.17.1

---------------------------------------------------------------------
Intel Israel (74) Limited

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.


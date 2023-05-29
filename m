Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A33807147B7
	for <lists+linux-usb@lfdr.de>; Mon, 29 May 2023 12:04:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231987AbjE2KEv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 29 May 2023 06:04:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231948AbjE2KEl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 29 May 2023 06:04:41 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48CECD8
        for <linux-usb@vger.kernel.org>; Mon, 29 May 2023 03:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685354680; x=1716890680;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=irYC6Sj79QrXvnGR34ko/0r4dO3FcJ77FQfYDtxPzxg=;
  b=XuoJVNiCQrDf0APOJ40PWEWzLBkV7IYplApDwjKbL/NWgHFmHiRKxFZm
   vePgUeasi3WMEeoazk9J+Ji6Ay+zmnnvaXJsMFOeCebiaQJt2L95axb+l
   btTfdGoGhYhF4XTeta6LD1A9eXIk1BlExWnl2n4UpbJ/EyZ3PedkM1jlm
   l/z+GFcg/yuNCcV/nTLCY13Yvzn9WNBx6InlGelb7UTWsehBfmtztgT6v
   8T9LKyGuRzb817wS1lLpNjxbI9wOmM8M06HNfbzFJbBHY2sI7d/y24gK7
   ExoHc7oeB1QORn1ugJLJRRmhTgsifjuyfYDzr2y/e5tRQxPGaKuRM10zN
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="354684477"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; 
   d="scan'208";a="354684477"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2023 03:04:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="683518646"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; 
   d="scan'208";a="683518646"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 29 May 2023 03:04:28 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 8C7DF11DA; Mon, 29 May 2023 13:04:26 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Gil Fine <gil.fine@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 20/20] thunderbolt: Disable CL states when a DMA tunnel is established
Date:   Mon, 29 May 2023 13:04:25 +0300
Message-Id: <20230529100425.6125-21-mika.westerberg@linux.intel.com>
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

Tunnels between hosts should not have CL states enabled because
otherwise they might enter a low power state without the other end
noticing which causes packets to be lost. For this reason disable all
CL states upon first DMA tunnel creation. Once the last DMA tunnel is
torn down we try to re-enable them.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/clx.c |  2 +-
 drivers/thunderbolt/tb.c  | 62 +++++++++++++++++++++++++++++++++++----
 2 files changed, 58 insertions(+), 6 deletions(-)

diff --git a/drivers/thunderbolt/clx.c b/drivers/thunderbolt/clx.c
index 4f0cfbb24dd9..604cceb23659 100644
--- a/drivers/thunderbolt/clx.c
+++ b/drivers/thunderbolt/clx.c
@@ -317,7 +317,7 @@ int tb_switch_clx_enable(struct tb_switch *sw, unsigned int clx)
 	struct tb_port *up, *down;
 	int ret;
 
-	if (!clx)
+	if (!clx || sw->clx == clx)
 		return 0;
 
 	if (!validate_mask(clx))
diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index 1d056ff6d77f..aa6e11589c28 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -240,8 +240,11 @@ static void tb_discover_dp_resources(struct tb *tb)
 	}
 }
 
+/* Enables CL states up to host router */
 static int tb_enable_clx(struct tb_switch *sw)
 {
+	struct tb_cm *tcm = tb_priv(sw->tb);
+	const struct tb_tunnel *tunnel;
 	int ret;
 
 	/*
@@ -251,9 +254,26 @@ static int tb_enable_clx(struct tb_switch *sw)
 	 * this in the future to cover the whole topology if it turns
 	 * out to be beneficial.
 	 */
+	while (sw && sw->config.depth > 1)
+		sw = tb_switch_parent(sw);
+
+	if (!sw)
+		return 0;
+
 	if (sw->config.depth != 1)
 		return 0;
 
+	/*
+	 * If we are re-enabling then check if there is an active DMA
+	 * tunnel and in that case bail out.
+	 */
+	list_for_each_entry(tunnel, &tcm->tunnel_list, list) {
+		if (tb_tunnel_is_dma(tunnel)) {
+			if (tb_tunnel_port_on_path(tunnel, tb_upstream_port(sw)))
+				return 0;
+		}
+	}
+
 	/*
 	 * CL0s and CL1 are enabled and supported together.
 	 * Silently ignore CLx enabling in case CLx is not supported.
@@ -262,6 +282,16 @@ static int tb_enable_clx(struct tb_switch *sw)
 	return ret == -EOPNOTSUPP ? 0 : ret;
 }
 
+/* Disables CL states up to the host router */
+static void tb_disable_clx(struct tb_switch *sw)
+{
+	do {
+		if (tb_switch_clx_disable(sw) < 0)
+			tb_sw_warn(sw, "failed to disable CL states\n");
+		sw = tb_switch_parent(sw);
+	} while (sw);
+}
+
 static int tb_increase_switch_tmu_accuracy(struct device *dev, void *data)
 {
 	struct tb_switch *sw;
@@ -1470,30 +1500,45 @@ static int tb_approve_xdomain_paths(struct tb *tb, struct tb_xdomain *xd,
 	struct tb_port *nhi_port, *dst_port;
 	struct tb_tunnel *tunnel;
 	struct tb_switch *sw;
+	int ret;
 
 	sw = tb_to_switch(xd->dev.parent);
 	dst_port = tb_port_at(xd->route, sw);
 	nhi_port = tb_switch_find_port(tb->root_switch, TB_TYPE_NHI);
 
 	mutex_lock(&tb->lock);
+
+	/*
+	 * When tunneling DMA paths the link should not enter CL states
+	 * so disable them now.
+	 */
+	tb_disable_clx(sw);
+
 	tunnel = tb_tunnel_alloc_dma(tb, nhi_port, dst_port, transmit_path,
 				     transmit_ring, receive_path, receive_ring);
 	if (!tunnel) {
-		mutex_unlock(&tb->lock);
-		return -ENOMEM;
+		ret = -ENOMEM;
+		goto err_clx;
 	}
 
 	if (tb_tunnel_activate(tunnel)) {
 		tb_port_info(nhi_port,
 			     "DMA tunnel activation failed, aborting\n");
-		tb_tunnel_free(tunnel);
-		mutex_unlock(&tb->lock);
-		return -EIO;
+		ret = -EIO;
+		goto err_free;
 	}
 
 	list_add_tail(&tunnel->list, &tcm->tunnel_list);
 	mutex_unlock(&tb->lock);
 	return 0;
+
+err_free:
+	tb_tunnel_free(tunnel);
+err_clx:
+	tb_enable_clx(sw);
+	mutex_unlock(&tb->lock);
+
+	return ret;
 }
 
 static void __tb_disconnect_xdomain_paths(struct tb *tb, struct tb_xdomain *xd,
@@ -1519,6 +1564,13 @@ static void __tb_disconnect_xdomain_paths(struct tb *tb, struct tb_xdomain *xd,
 					receive_path, receive_ring))
 			tb_deactivate_and_free_tunnel(tunnel);
 	}
+
+	/*
+	 * Try to re-enable CL states now, it is OK if this fails
+	 * because we may still have another DMA tunnel active through
+	 * the same host router USB4 downstream port.
+	 */
+	tb_enable_clx(sw);
 }
 
 static int tb_disconnect_xdomain_paths(struct tb *tb, struct tb_xdomain *xd,
-- 
2.39.2


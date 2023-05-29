Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C0A37147B5
	for <lists+linux-usb@lfdr.de>; Mon, 29 May 2023 12:04:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231978AbjE2KEu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 29 May 2023 06:04:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231945AbjE2KEl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 29 May 2023 06:04:41 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08863CD
        for <linux-usb@vger.kernel.org>; Mon, 29 May 2023 03:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685354679; x=1716890679;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XTKX5qCmJMJCmaW84u5HqRgEOZTjbzdZ+twNLR/kNKE=;
  b=MnM0xTVCAOgpBG6zUJi+MPEpoCSpUMhpCuc2iXa5BSLXF2UvUd4afFC6
   5ztE5I7zhvzLW0kgjiIKOEgDf3qWsvcX67/MTUc2o+4E9pOYiQ17qKQbm
   tYOXereu86g+Xn/iL4tVYpV6DolpjTcscYuCLbq2dVJgtkzsDs5DKFn2+
   8FIpgQBwjTvL2YUGVdGd523PzuMskoUGgUSBbSSTMF43BqLXyaTv0iUbb
   5mQNrIeqNuDtUf50MZyMfHq0Q9XVgX9fBk2+TbmohILczmN9omG5fV1XT
   zOoF+pUj2fkNa0TXQF6HOYF87J6Xx9oM/NBXBbF4B8lrrysx8BgKGZn08
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="354684474"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; 
   d="scan'208";a="354684474"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2023 03:04:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="683518636"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; 
   d="scan'208";a="683518636"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 29 May 2023 03:04:28 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 82C487A6; Mon, 29 May 2023 13:04:26 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Gil Fine <gil.fine@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 19/20] thunderbolt: Make tb_switch_clx_disable() return CL states that were enabled
Date:   Mon, 29 May 2023 13:04:24 +0300
Message-Id: <20230529100425.6125-20-mika.westerberg@linux.intel.com>
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

This allows us to disable all CL states temporarily when running lane
margining and then return back the previously enabled states.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/clx.c     |  8 ++++++--
 drivers/thunderbolt/debugfs.c | 35 ++++++++++++++++++++++++-----------
 2 files changed, 30 insertions(+), 13 deletions(-)

diff --git a/drivers/thunderbolt/clx.c b/drivers/thunderbolt/clx.c
index 960409df4405..4f0cfbb24dd9 100644
--- a/drivers/thunderbolt/clx.c
+++ b/drivers/thunderbolt/clx.c
@@ -317,6 +317,9 @@ int tb_switch_clx_enable(struct tb_switch *sw, unsigned int clx)
 	struct tb_port *up, *down;
 	int ret;
 
+	if (!clx)
+		return 0;
+
 	if (!validate_mask(clx))
 		return -EINVAL;
 
@@ -380,7 +383,8 @@ int tb_switch_clx_enable(struct tb_switch *sw, unsigned int clx)
  * Disables all CL states of the given router. Can be called on any
  * router and if the states were not enabled already does nothing.
  *
- * Returns %0 on success or an error code on failure.
+ * Returns the CL states that were disabled or negative errno in case of
+ * failure.
  */
 int tb_switch_clx_disable(struct tb_switch *sw)
 {
@@ -408,5 +412,5 @@ int tb_switch_clx_disable(struct tb_switch *sw)
 	sw->clx = 0;
 
 	tb_sw_dbg(sw, "CLx: %s disabled\n", clx_name(clx));
-	return 0;
+	return clx;
 }
diff --git a/drivers/thunderbolt/debugfs.c b/drivers/thunderbolt/debugfs.c
index e376ad25bf60..40b59e662ee3 100644
--- a/drivers/thunderbolt/debugfs.c
+++ b/drivers/thunderbolt/debugfs.c
@@ -553,8 +553,9 @@ static int margining_run_write(void *data, u64 val)
 	struct usb4_port *usb4 = port->usb4;
 	struct tb_switch *sw = port->sw;
 	struct tb_margining *margining;
+	struct tb_switch *down_sw;
 	struct tb *tb = sw->tb;
-	int ret;
+	int ret, clx;
 
 	if (val != 1)
 		return -EINVAL;
@@ -566,15 +567,24 @@ static int margining_run_write(void *data, u64 val)
 		goto out_rpm_put;
 	}
 
-	/*
-	 * CL states may interfere with lane margining so inform the user know
-	 * and bail out.
-	 */
-	if (tb_port_clx_is_enabled(port, TB_CL1 | TB_CL2)) {
-		tb_port_warn(port,
-			     "CL states are enabled, Disable them with clx=0 and re-connect\n");
-		ret = -EINVAL;
-		goto out_unlock;
+	if (tb_is_upstream_port(port))
+		down_sw = sw;
+	else if (port->remote)
+		down_sw = port->remote->sw;
+	else
+		down_sw = NULL;
+
+	if (down_sw) {
+		/*
+		 * CL states may interfere with lane margining so
+		 * disable them temporarily now.
+		 */
+		ret = tb_switch_clx_disable(down_sw);
+		if (ret < 0) {
+			tb_sw_warn(down_sw, "failed to disable CL states\n");
+			goto out_unlock;
+		}
+		clx = ret;
 	}
 
 	margining = usb4->margining;
@@ -586,7 +596,7 @@ static int margining_run_write(void *data, u64 val)
 					  margining->right_high,
 					  USB4_MARGIN_SW_COUNTER_CLEAR);
 		if (ret)
-			goto out_unlock;
+			goto out_clx;
 
 		ret = usb4_port_sw_margin_errors(port, &margining->results[0]);
 	} else {
@@ -600,6 +610,9 @@ static int margining_run_write(void *data, u64 val)
 					  margining->right_high, margining->results);
 	}
 
+out_clx:
+	if (down_sw)
+		tb_switch_clx_enable(down_sw, clx);
 out_unlock:
 	mutex_unlock(&tb->lock);
 out_rpm_put:
-- 
2.39.2


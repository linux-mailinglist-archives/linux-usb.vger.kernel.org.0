Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E4F67147AC
	for <lists+linux-usb@lfdr.de>; Mon, 29 May 2023 12:04:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231947AbjE2KEl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 29 May 2023 06:04:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231929AbjE2KEg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 29 May 2023 06:04:36 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CB59D8
        for <linux-usb@vger.kernel.org>; Mon, 29 May 2023 03:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685354675; x=1716890675;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6ySPkHQ1Gq6BFKw2AQMmKvvZhXbGRgwqFzDOGrbZknk=;
  b=estcqlSm+9dxZLSk+R3rkJXaABHkaDACZdX0fFz9viBNA1DC5OmQjiY+
   vYDQ1rw1jiKj7UBJXbBARxsNGc8UM5hd6VGiY8z4u46y0RAMxvti5EDX6
   dLrkw2qEJegTvp6TnOPYYB3ds76Ycn+Ktnp5A7xtS2jOkbWSFrB5H8wGd
   EN1+PGEEjmS3MS4H3tB737j8Mu/hXlio2Bn/Bd/91W79dQQbAlkuQ+hup
   mKc5nSkUMNFBQIkXzBWBBD5r54PsUfBxjzbpF58goL2XpIsHkn7keKrBg
   4MK0eFT6rIvpQ4QNENAiVJmJjEQGNQOiWCNoUublo3Dg2HgwtO6YR0l82
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="354684437"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; 
   d="scan'208";a="354684437"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2023 03:04:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="683518470"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; 
   d="scan'208";a="683518470"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 29 May 2023 03:04:25 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 4970FA11; Mon, 29 May 2023 13:04:26 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Gil Fine <gil.fine@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 12/20] thunderbolt: Move CLx enabling into tb_enable_clx()
Date:   Mon, 29 May 2023 13:04:17 +0300
Message-Id: <20230529100425.6125-13-mika.westerberg@linux.intel.com>
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

This avoids some duplication and makes the flow slightly easier to
understand. Also follows what we do in tb_enable_tmu().

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tb.c | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index c7cfd740520a..e4f1233eb958 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -240,6 +240,18 @@ static void tb_discover_dp_resources(struct tb *tb)
 	}
 }
 
+static int tb_enable_clx(struct tb_switch *sw)
+{
+	int ret;
+
+	/*
+	 * CL0s and CL1 are enabled and supported together.
+	 * Silently ignore CLx enabling in case CLx is not supported.
+	 */
+	ret = tb_switch_clx_enable(sw, TB_CL1);
+	return ret == -EOPNOTSUPP ? 0 : ret;
+}
+
 static int tb_increase_switch_tmu_accuracy(struct device *dev, void *data)
 {
 	struct tb_switch *sw;
@@ -777,7 +789,6 @@ static void tb_scan_port(struct tb_port *port)
 	struct tb_port *upstream_port;
 	bool discovery = false;
 	struct tb_switch *sw;
-	int ret;
 
 	if (tb_is_upstream_port(port))
 		return;
@@ -876,14 +887,10 @@ static void tb_scan_port(struct tb_port *port)
 	 * CL0s and CL1 are enabled and supported together.
 	 * Silently ignore CLx enabling in case CLx is not supported.
 	 */
-	if (discovery) {
+	if (discovery)
 		tb_sw_dbg(sw, "discovery, not touching CL states\n");
-	} else {
-		ret = tb_switch_clx_enable(sw, TB_CL1);
-		if (ret && ret != -EOPNOTSUPP)
-			tb_sw_warn(sw, "failed to enable %s on upstream port\n",
-				   tb_switch_clx_name(TB_CL1));
-	}
+	else if (tb_enable_clx(sw))
+		tb_sw_warn(sw, "failed to enable CL states\n");
 
 	if (tb_enable_tmu(sw))
 		tb_sw_warn(sw, "failed to enable TMU\n");
@@ -2022,20 +2029,13 @@ static int tb_suspend_noirq(struct tb *tb)
 static void tb_restore_children(struct tb_switch *sw)
 {
 	struct tb_port *port;
-	int ret;
 
 	/* No need to restore if the router is already unplugged */
 	if (sw->is_unplugged)
 		return;
 
-	/*
-	 * CL0s and CL1 are enabled and supported together.
-	 * Silently ignore CLx re-enabling in case CLx is not supported.
-	 */
-	ret = tb_switch_clx_enable(sw, TB_CL1);
-	if (ret && ret != -EOPNOTSUPP)
-		tb_sw_warn(sw, "failed to re-enable %s on upstream port\n",
-			   tb_switch_clx_name(TB_CL1));
+	if (tb_enable_clx(sw))
+		tb_sw_warn(sw, "failed to re-enable CL states\n");
 
 	if (tb_enable_tmu(sw))
 		tb_sw_warn(sw, "failed to restore TMU configuration\n");
-- 
2.39.2


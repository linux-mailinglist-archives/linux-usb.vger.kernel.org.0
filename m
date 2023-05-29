Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C918C7147AD
	for <lists+linux-usb@lfdr.de>; Mon, 29 May 2023 12:04:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231953AbjE2KEm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 29 May 2023 06:04:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231910AbjE2KEh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 29 May 2023 06:04:37 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E10B3A7
        for <linux-usb@vger.kernel.org>; Mon, 29 May 2023 03:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685354675; x=1716890675;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZGw1wDKauYZ3GmGFcp+GyjaqHNurd7o4dNvWNQaOh6w=;
  b=LYkkEQsOw9svmGFEEOQSj25p1aUbepUcINEhEHva5b5i5p1hjfpgF3p3
   z2nCTCTvBa5/yeT0eQzgf/V4ikSYYqyXF4gX5Vc5rsQwkRvbgFXKCh6Jw
   XrSMtfcMTKEa3V/mMkwaKzQDFR6PVtJnuEAA/D4V+YH4VvMRN/huTQJf+
   D+hoi4ej2HnPlzfRQbTr2HAAyr4J0PPGmbCjQTQP+sJVXEIXVfA8xTx+A
   E1ubxMTdbZNsWKkfFs97KSV5AiHSFba/RmOx0gWQBl/6nafbC8pAI2OLt
   0EeQqRVJpG5d8xrOk+fa6sjy+6rY8GcpZEiylBIc2SHiPagOFcvPV/qVs
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="354684440"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; 
   d="scan'208";a="354684440"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2023 03:04:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="683518472"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; 
   d="scan'208";a="683518472"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 29 May 2023 03:04:24 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 269D285F; Mon, 29 May 2023 13:04:26 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Gil Fine <gil.fine@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 08/20] thunderbolt: Move tb_enable_tmu() close to other TMU functions
Date:   Mon, 29 May 2023 13:04:13 +0300
Message-Id: <20230529100425.6125-9-mika.westerberg@linux.intel.com>
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

This makes the code easier to follow. No functional changes.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tb.c | 58 ++++++++++++++++++++--------------------
 1 file changed, 29 insertions(+), 29 deletions(-)

diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index 0630b877136e..41c353f462e7 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -272,6 +272,35 @@ static void tb_increase_tmu_accuracy(struct tb_tunnel *tunnel)
 	device_for_each_child(&sw->dev, NULL, tb_increase_switch_tmu_accuracy);
 }
 
+static int tb_enable_tmu(struct tb_switch *sw)
+{
+	int ret;
+
+	/*
+	 * If CL1 is enabled then we need to configure the TMU accuracy
+	 * level to normal. Otherwise we keep the TMU running at the
+	 * highest accuracy.
+	 */
+	if (tb_switch_is_clx_enabled(sw, TB_CL1))
+		tb_switch_tmu_configure(sw, TB_SWITCH_TMU_RATE_NORMAL, true);
+	else
+		tb_switch_tmu_configure(sw, TB_SWITCH_TMU_RATE_HIFI, false);
+
+	/* If it is already enabled in correct mode, don't touch it */
+	if (tb_switch_tmu_is_enabled(sw))
+		return 0;
+
+	ret = tb_switch_tmu_disable(sw);
+	if (ret)
+		return ret;
+
+	ret = tb_switch_tmu_post_time(sw);
+	if (ret)
+		return ret;
+
+	return tb_switch_tmu_enable(sw);
+}
+
 static void tb_switch_discover_tunnels(struct tb_switch *sw,
 				       struct list_head *list,
 				       bool alloc_hopids)
@@ -383,35 +412,6 @@ static void tb_scan_xdomain(struct tb_port *port)
 	}
 }
 
-static int tb_enable_tmu(struct tb_switch *sw)
-{
-	int ret;
-
-	/*
-	 * If CL1 is enabled then we need to configure the TMU accuracy
-	 * level to normal. Otherwise we keep the TMU running at the
-	 * highest accuracy.
-	 */
-	if (tb_switch_is_clx_enabled(sw, TB_CL1))
-		tb_switch_tmu_configure(sw, TB_SWITCH_TMU_RATE_NORMAL, true);
-	else
-		tb_switch_tmu_configure(sw, TB_SWITCH_TMU_RATE_HIFI, false);
-
-	/* If it is already enabled in correct mode, don't touch it */
-	if (tb_switch_tmu_is_enabled(sw))
-		return 0;
-
-	ret = tb_switch_tmu_disable(sw);
-	if (ret)
-		return ret;
-
-	ret = tb_switch_tmu_post_time(sw);
-	if (ret)
-		return ret;
-
-	return tb_switch_tmu_enable(sw);
-}
-
 /**
  * tb_find_unused_port() - return the first inactive port on @sw
  * @sw: Switch to find the port on
-- 
2.39.2


Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 55D617147AA
	for <lists+linux-usb@lfdr.de>; Mon, 29 May 2023 12:04:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231935AbjE2KEj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 29 May 2023 06:04:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230165AbjE2KEf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 29 May 2023 06:04:35 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5DA6C7
        for <linux-usb@vger.kernel.org>; Mon, 29 May 2023 03:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685354674; x=1716890674;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kQTOYUoMDmr5dcQi06Bmkoj6RO0YAh9/GuMM/UdkwFQ=;
  b=ZkLarrB3T8LV4JIWVmVqV8ImZM5EG2ViGSl7q7cCbQpdpoujHIDrmy6E
   SISqjvs6wujTgX9YCgpkYH93/HYVvdUaeJTIJnQLXftSSY2TBwnO2bpJT
   1+sBVFWpxB3EcX9K7lHRtGIB8sKcuhHYuQ8wKGEG+Y486GG98aAOi5+DO
   ArSrpF/oDXt/lx0wVxPbTwUbmoCNDSMyWswdxUbvNPYs1zzzghHTO2c+n
   mCMG3yFk7flcP1cdLgnQNLePPUKQlEplxcLRxeLePE8X1yjdJgZ/6z3mA
   VChrufdWuKF/XNe2tWEDXiqiTqNaWrqutzt/6q0JqVaxi6tF7083hLrBi
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="354684429"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; 
   d="scan'208";a="354684429"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2023 03:04:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="683518454"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; 
   d="scan'208";a="683518454"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 29 May 2023 03:04:24 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 03738589; Mon, 29 May 2023 13:04:26 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Gil Fine <gil.fine@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 05/20] thunderbolt: Rework Titan Ridge TMU objection disable function
Date:   Mon, 29 May 2023 13:04:10 +0300
Message-Id: <20230529100425.6125-6-mika.westerberg@linux.intel.com>
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

Now this is split into two with one having a misleading name
(tb_switch_tmu_unidirectional_enable()).

Make this easier to read, rename and consolidate the two functions into
one with name that explains what it actually does. Use the two constants
as well that were added but never used to make it clear which bits are
being set.

No functional changes.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tmu.c | 24 ++++++++++--------------
 1 file changed, 10 insertions(+), 14 deletions(-)

diff --git a/drivers/thunderbolt/tmu.c b/drivers/thunderbolt/tmu.c
index 5d508ea8baa5..30f18806abb7 100644
--- a/drivers/thunderbolt/tmu.c
+++ b/drivers/thunderbolt/tmu.c
@@ -503,8 +503,10 @@ static int tb_switch_tmu_enable_bidirectional(struct tb_switch *sw)
 	return ret;
 }
 
-static int tb_switch_tmu_objection_mask(struct tb_switch *sw)
+/* Only needed for Titan Ridge */
+static int tb_switch_tmu_disable_objections(struct tb_switch *sw)
 {
+	struct tb_port *up = tb_upstream_port(sw);
 	u32 val;
 	int ret;
 
@@ -515,17 +517,15 @@ static int tb_switch_tmu_objection_mask(struct tb_switch *sw)
 
 	val &= ~TB_TIME_VSEC_3_CS_9_TMU_OBJ_MASK;
 
-	return tb_sw_write(sw, &val, TB_CFG_SWITCH,
-			   sw->cap_vsec_tmu + TB_TIME_VSEC_3_CS_9, 1);
-}
-
-static int tb_switch_tmu_unidirectional_enable(struct tb_switch *sw)
-{
-	struct tb_port *up = tb_upstream_port(sw);
+	ret = tb_sw_write(sw, &val, TB_CFG_SWITCH,
+			  sw->cap_vsec_tmu + TB_TIME_VSEC_3_CS_9, 1);
+	if (ret)
+		return ret;
 
 	return tb_port_tmu_write(up, TMU_ADP_CS_6,
 				 TMU_ADP_CS_6_DISABLE_TMU_OBJ_MASK,
-				 TMU_ADP_CS_6_DISABLE_TMU_OBJ_MASK);
+				 TMU_ADP_CS_6_DISABLE_TMU_OBJ_CL1 |
+				 TMU_ADP_CS_6_DISABLE_TMU_OBJ_CL2);
 }
 
 /*
@@ -670,11 +670,7 @@ int tb_switch_tmu_enable(struct tb_switch *sw)
 		if (!tb_switch_is_clx_enabled(sw, TB_CL1))
 			return -EOPNOTSUPP;
 
-		ret = tb_switch_tmu_objection_mask(sw);
-		if (ret)
-			return ret;
-
-		ret = tb_switch_tmu_unidirectional_enable(sw);
+		ret = tb_switch_tmu_disable_objections(sw);
 		if (ret)
 			return ret;
 	}
-- 
2.39.2


Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 776EE7147AB
	for <lists+linux-usb@lfdr.de>; Mon, 29 May 2023 12:04:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231942AbjE2KEk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 29 May 2023 06:04:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231927AbjE2KEg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 29 May 2023 06:04:36 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38B71C9
        for <linux-usb@vger.kernel.org>; Mon, 29 May 2023 03:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685354675; x=1716890675;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9Y5z3g5TftJxMhLHmZWlksqIqcdpHEd4zPzYPV21f8A=;
  b=HmW9naQz1wDXo2duxOUGTgz/Vxy9ykXPaWZBxVpA+Oj8W+v/4BQxfLv0
   CYo8A64sI03H+w5+FyRtPaw62SEOIkBJ9psxl6urcIQdRKDoVg9eAGYu8
   V88NTO9kMSfdX3gjga/Lnhf83bT9pDB+t05D/2UkevRfz/p/M/C6OTTM2
   bOyJNWUAMU1r0Z+cpRAPLwHOBDbjlY7oWesL9T2LTZvXqi3HhCXSziMeL
   tO8ZIKyE19WIMu0qCYpox3BsL2RXYA5JuYd87pTLE2FLsI6Uuf5fn1yY+
   4vPKqfeDgl2CES+vnFgL/5DLZZmfREat+A4hO5rBvhK9I1GxTOzU/ZdL+
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="354684434"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; 
   d="scan'208";a="354684434"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2023 03:04:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="683518465"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; 
   d="scan'208";a="683518465"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 29 May 2023 03:04:24 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 17FE75E2; Mon, 29 May 2023 13:04:26 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Gil Fine <gil.fine@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 07/20] thunderbolt: Move TMU configuration to tb_enable_tmu()
Date:   Mon, 29 May 2023 13:04:12 +0300
Message-Id: <20230529100425.6125-8-mika.westerberg@linux.intel.com>
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

There is no need to duplicate the code the enables TMU. Also update the
comment to better explain why we do this in the first place.

No functional changes.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tb.c | 30 ++++++++++--------------------
 1 file changed, 10 insertions(+), 20 deletions(-)

diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index 39ec7094fe17..0630b877136e 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -387,6 +387,16 @@ static int tb_enable_tmu(struct tb_switch *sw)
 {
 	int ret;
 
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
 	/* If it is already enabled in correct mode, don't touch it */
 	if (tb_switch_tmu_is_enabled(sw))
 		return 0;
@@ -873,16 +883,6 @@ static void tb_scan_port(struct tb_port *port)
 				   tb_switch_clx_name(TB_CL1));
 	}
 
-	if (tb_switch_is_clx_enabled(sw, TB_CL1))
-		/*
-		 * To support highest CLx state, we set router's TMU to
-		 * Normal-Uni mode.
-		 */
-		tb_switch_tmu_configure(sw, TB_SWITCH_TMU_RATE_NORMAL, true);
-	else
-		/* If CLx disabled, configure router's TMU to HiFi-Bidir mode*/
-		tb_switch_tmu_configure(sw, TB_SWITCH_TMU_RATE_HIFI, false);
-
 	if (tb_enable_tmu(sw))
 		tb_sw_warn(sw, "failed to enable TMU\n");
 
@@ -2035,16 +2035,6 @@ static void tb_restore_children(struct tb_switch *sw)
 		tb_sw_warn(sw, "failed to re-enable %s on upstream port\n",
 			   tb_switch_clx_name(TB_CL1));
 
-	if (tb_switch_is_clx_enabled(sw, TB_CL1))
-		/*
-		 * To support highest CLx state, we set router's TMU to
-		 * Normal-Uni mode.
-		 */
-		tb_switch_tmu_configure(sw, TB_SWITCH_TMU_RATE_NORMAL, true);
-	else
-		/* If CLx disabled, configure router's TMU to HiFi-Bidir mode*/
-		tb_switch_tmu_configure(sw, TB_SWITCH_TMU_RATE_HIFI, false);
-
 	if (tb_enable_tmu(sw))
 		tb_sw_warn(sw, "failed to restore TMU configuration\n");
 
-- 
2.39.2


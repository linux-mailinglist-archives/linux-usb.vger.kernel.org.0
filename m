Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8DB047147A6
	for <lists+linux-usb@lfdr.de>; Mon, 29 May 2023 12:04:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231920AbjE2KEg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 29 May 2023 06:04:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231913AbjE2KEf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 29 May 2023 06:04:35 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74599B5
        for <linux-usb@vger.kernel.org>; Mon, 29 May 2023 03:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685354674; x=1716890674;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wF5KjFmzuNFzp2s2TaW5HikN5gf8ZbKj9Zl30x3Pgbs=;
  b=OOjrLhpjMdFFAR1jhI+h9b83yKA0g01qaBpOqo93vwitqQzSGMr/LFYM
   EX5gVHsr8P3XnF4xtHwV6cRMoDQYWoM9pgdTdkXo9qkgygOU0lNaupFhm
   qw8b+9kMF3LYdRnt7pUzUtmffeNAazIoJ5IBocph/e/R7dzJfH/oVsrO5
   cdTYzt+iDDu3uR/UINkwyUx1FWNIJY+91uK5DT8nxAQ85P3WkFo+DuKyJ
   lj43YfoPP7uigCqQZthcdCl5/kMyJ1fuC8HQX53HbI9/mSJBGxqaMw9C2
   c0NrcTdyon4cqcUITNH0Kucfyk1f18A2zZRC6ki/ETGVT9PgpqySzJhvP
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="354684426"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; 
   d="scan'208";a="354684426"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2023 03:04:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="683518444"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; 
   d="scan'208";a="683518444"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 29 May 2023 03:04:24 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 2DBDB911; Mon, 29 May 2023 13:04:26 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Gil Fine <gil.fine@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 09/20] thunderbolt: Check valid TMU configuration in tb_switch_tmu_configure()
Date:   Mon, 29 May 2023 13:04:14 +0300
Message-Id: <20230529100425.6125-10-mika.westerberg@linux.intel.com>
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

Instead of at enable time we can do this already in
tb_switch_tmu_configure().

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tb.c  |  6 ++++--
 drivers/thunderbolt/tb.h  |  5 ++---
 drivers/thunderbolt/tmu.c | 13 ++++++++-----
 3 files changed, 14 insertions(+), 10 deletions(-)

diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index 41c353f462e7..91459bf2fd0f 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -282,9 +282,11 @@ static int tb_enable_tmu(struct tb_switch *sw)
 	 * highest accuracy.
 	 */
 	if (tb_switch_is_clx_enabled(sw, TB_CL1))
-		tb_switch_tmu_configure(sw, TB_SWITCH_TMU_RATE_NORMAL, true);
+		ret = tb_switch_tmu_configure(sw, TB_SWITCH_TMU_RATE_NORMAL, true);
 	else
-		tb_switch_tmu_configure(sw, TB_SWITCH_TMU_RATE_HIFI, false);
+		ret = tb_switch_tmu_configure(sw, TB_SWITCH_TMU_RATE_HIFI, false);
+	if (ret)
+		return ret;
 
 	/* If it is already enabled in correct mode, don't touch it */
 	if (tb_switch_tmu_is_enabled(sw))
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index 8cc64b79f35c..07e4e7b37f13 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -987,9 +987,8 @@ int tb_switch_tmu_init(struct tb_switch *sw);
 int tb_switch_tmu_post_time(struct tb_switch *sw);
 int tb_switch_tmu_disable(struct tb_switch *sw);
 int tb_switch_tmu_enable(struct tb_switch *sw);
-void tb_switch_tmu_configure(struct tb_switch *sw,
-			     enum tb_switch_tmu_rate rate,
-			     bool unidirectional);
+int tb_switch_tmu_configure(struct tb_switch *sw, enum tb_switch_tmu_rate rate,
+			    bool unidirectional);
 /**
  * tb_switch_tmu_is_enabled() - Checks if the specified TMU mode is enabled
  * @sw: Router whose TMU mode to check
diff --git a/drivers/thunderbolt/tmu.c b/drivers/thunderbolt/tmu.c
index 84abb783a6d9..be310d97ea7b 100644
--- a/drivers/thunderbolt/tmu.c
+++ b/drivers/thunderbolt/tmu.c
@@ -648,9 +648,6 @@ int tb_switch_tmu_enable(struct tb_switch *sw)
 	bool unidirectional = sw->tmu.unidirectional_request;
 	int ret;
 
-	if (unidirectional && !sw->tmu.has_ucap)
-		return -EOPNOTSUPP;
-
 	/*
 	 * No need to enable TMU on devices that don't support CLx since on
 	 * these devices e.g. Alpine Ridge and earlier, the TMU mode HiFi
@@ -724,10 +721,16 @@ int tb_switch_tmu_enable(struct tb_switch *sw)
  *
  * Selects the rate of the TMU and directionality (uni-directional or
  * bi-directional). Must be called before tb_switch_tmu_enable().
+ *
+ * Returns %0 in success and negative errno otherwise.
  */
-void tb_switch_tmu_configure(struct tb_switch *sw,
-			     enum tb_switch_tmu_rate rate, bool unidirectional)
+int tb_switch_tmu_configure(struct tb_switch *sw, enum tb_switch_tmu_rate rate,
+			    bool unidirectional)
 {
+	if (unidirectional && !sw->tmu.has_ucap)
+		return -EINVAL;
+
 	sw->tmu.unidirectional_request = unidirectional;
 	sw->tmu.rate_request = rate;
+	return 0;
 }
-- 
2.39.2


Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9AAA87147A4
	for <lists+linux-usb@lfdr.de>; Mon, 29 May 2023 12:04:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231918AbjE2KEd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 29 May 2023 06:04:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231913AbjE2KEc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 29 May 2023 06:04:32 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B360D8
        for <linux-usb@vger.kernel.org>; Mon, 29 May 2023 03:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685354664; x=1716890664;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Mn6wpix0zC80VSEJEo+QauGVQmlo5JsGlzseY/0ncUM=;
  b=CIiWqvgZJEoX/qBgh3Xaq2l4xKXXn1TZG2rIf9DiusHCEArmb/44CYhC
   zhGy9rT+lxZPLsHOfHgkHdIwU40mPWJgHquiXuPmrnH+f4yS1nXSBq+WO
   jv2Vy4y7s5h7g+kccz8oapLDmgAmlbuy0r0aBWYGKDYYmxXP31dpHO4rT
   GVsPIBYRxJlQu91KKLgejp7WQX6Bexy9S/JbfTdj+DJlLV5tY7aVow32k
   mLgQxfVisAPRgpUs15gFN6I61rh6vXXIsTlMxu5aoz+0Sl6V9FwhLzgIB
   kXFcq93iuGY9iTX4k5EHhjBOcXKo2xlhT5lUvP4D8KkCYeL6W1YEBm4EJ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="354684407"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; 
   d="scan'208";a="354684407"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2023 03:04:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="683518282"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; 
   d="scan'208";a="683518282"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 29 May 2023 03:04:21 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id F1F43597; Mon, 29 May 2023 13:04:25 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Gil Fine <gil.fine@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 04/20] thunderbolt: Drop useless 'unidirectional' parameter from tb_switch_tmu_is_enabled()
Date:   Mon, 29 May 2023 13:04:09 +0300
Message-Id: <20230529100425.6125-5-mika.westerberg@linux.intel.com>
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

There is no point passing it as we already have a field for that. While
there clean up the kernel-doc of things that do not really belong to the
API documentation (these can be figured out from the spec itself).

No functional changes.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tb.c  |  2 +-
 drivers/thunderbolt/tb.h  | 10 ++++------
 drivers/thunderbolt/tmu.c | 11 ++++-------
 3 files changed, 9 insertions(+), 14 deletions(-)

diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index 1ab3aa114a17..72041e29e544 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -362,7 +362,7 @@ static int tb_enable_tmu(struct tb_switch *sw)
 	int ret;
 
 	/* If it is already enabled in correct mode, don't touch it */
-	if (tb_switch_tmu_is_enabled(sw, sw->tmu.unidirectional_request))
+	if (tb_switch_tmu_is_enabled(sw))
 		return 0;
 
 	ret = tb_switch_tmu_disable(sw);
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index 797d8bb73bfa..0ac653bfd97e 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -995,16 +995,14 @@ void tb_switch_enable_tmu_1st_child(struct tb_switch *sw,
 /**
  * tb_switch_tmu_is_enabled() - Checks if the specified TMU mode is enabled
  * @sw: Router whose TMU mode to check
- * @unidirectional: If uni-directional (bi-directional otherwise)
  *
- * Return true if hardware TMU configuration matches the one passed in
- * as parameter. That is HiFi/Normal and either uni-directional or bi-directional.
+ * Return true if hardware TMU configuration matches the requested
+ * configuration.
  */
-static inline bool tb_switch_tmu_is_enabled(const struct tb_switch *sw,
-					    bool unidirectional)
+static inline bool tb_switch_tmu_is_enabled(const struct tb_switch *sw)
 {
 	return sw->tmu.rate == sw->tmu.rate_request &&
-	       sw->tmu.unidirectional == unidirectional;
+	       sw->tmu.unidirectional == sw->tmu.unidirectional_request;
 }
 
 static inline const char *tb_switch_clx_name(enum tb_clx clx)
diff --git a/drivers/thunderbolt/tmu.c b/drivers/thunderbolt/tmu.c
index 8614e154be5f..5d508ea8baa5 100644
--- a/drivers/thunderbolt/tmu.c
+++ b/drivers/thunderbolt/tmu.c
@@ -639,12 +639,9 @@ static int tb_switch_tmu_change_mode(struct tb_switch *sw)
  * tb_switch_tmu_enable() - Enable TMU on a router
  * @sw: Router whose TMU to enable
  *
- * Enables TMU of a router to be in uni-directional Normal/HiFi
- * or bi-directional HiFi mode. Calling tb_switch_tmu_configure() is required
- * before calling this function, to select the mode Normal/HiFi and
- * directionality (uni-directional/bi-directional).
- * In HiFi mode all tunneling should work. In Normal mode, DP tunneling can't
- * work. Uni-directional mode is required for CLx (Link Low-Power) to work.
+ * Enables TMU of a router to be in uni-directional Normal/HiFi or
+ * bi-directional HiFi mode. Calling tb_switch_tmu_configure() is
+ * required before calling this function.
  */
 int tb_switch_tmu_enable(struct tb_switch *sw)
 {
@@ -662,7 +659,7 @@ int tb_switch_tmu_enable(struct tb_switch *sw)
 	if (!tb_switch_is_clx_supported(sw))
 		return 0;
 
-	if (tb_switch_tmu_is_enabled(sw, sw->tmu.unidirectional_request))
+	if (tb_switch_tmu_is_enabled(sw))
 		return 0;
 
 	if (tb_switch_is_titan_ridge(sw) && unidirectional) {
-- 
2.39.2


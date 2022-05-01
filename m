Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD2405167B8
	for <lists+linux-usb@lfdr.de>; Sun,  1 May 2022 22:24:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349185AbiEAU10 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 1 May 2022 16:27:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350727AbiEAU1Z (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 1 May 2022 16:27:25 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 433B13EF3B
        for <linux-usb@vger.kernel.org>; Sun,  1 May 2022 13:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651436639; x=1682972639;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=IEyQOyW3hNL974+61WXnKmMPgwKRZ6TSermT7En55bk=;
  b=FhmjCOJBGIUBHk3jipiSa15BDaYE8S+iupo8lZUIOmB6j6yGT0IeR6nC
   oxjfnLnO2kDmlENTO+7XvrvvfOEXhpqf5+Cr7lRwobkq41M5qbStJnOP3
   x+oWQLmIL/7SF98b/W4uSMDidLyqhS+NFQfPrcZhqBGiLlFwmnJPbw0Ql
   qpHpphNXeo1RnGzPFwmcUD3Jpvfvd+3QXW5VMMxq0n0R5DxgROHs5uH1n
   e6V8LCnFRdjpa/K3IpRR8x++8sIfsV0yrKHC9Q0RvMC1ni8T5LuzxGaW+
   dNh8n8mFA+qVfBpjCw9wtgSPyeXMwaMZWjwIZDxPixcBE0lPdkRpIcVP8
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10334"; a="247611830"
X-IronPort-AV: E=Sophos;i="5.91,190,1647327600"; 
   d="scan'208";a="247611830"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2022 13:23:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,190,1647327600"; 
   d="scan'208";a="583310212"
Received: from ccdjpclinux26.jer.intel.com ([10.12.48.253])
  by orsmga008.jf.intel.com with ESMTP; 01 May 2022 13:23:57 -0700
From:   Gil Fine <gil.fine@intel.com>
To:     andreas.noever@gmail.com, michael.jamet@intel.com,
        mika.westerberg@linux.intel.com, YehezkelShB@gmail.com
Cc:     gil.fine@intel.com, linux-usb@vger.kernel.org, lukas@wunner.de
Subject: [PATCH 2/5] thunderbolt: CLx disable before system suspend only if previously enabled
Date:   Sun,  1 May 2022 23:33:18 +0300
Message-Id: <20220501203321.19021-3-gil.fine@intel.com>
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

Disable CLx before system suspended only if previously was enabled.
Also fix few typos.

Signed-off-by: Gil Fine <gil.fine@intel.com>
---
 drivers/thunderbolt/switch.c | 8 +++++---
 drivers/thunderbolt/tmu.c    | 2 +-
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index ac87e8b50e52..42b7daaf9c4d 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -3063,8 +3063,10 @@ void tb_switch_suspend(struct tb_switch *sw, bool runtime)
 	 * Actually only needed for Titan Ridge but for simplicity can be
 	 * done for USB4 device too as CLx is re-enabled at resume.
 	 */
-	if (tb_switch_disable_clx(sw, TB_CL0S))
-		tb_sw_warn(sw, "failed to disable CLx on upstream port\n");
+	if (tb_switch_is_clx_enabled(sw)) {
+		if (tb_switch_disable_clx(sw, TB_CL0S))
+			tb_sw_warn(sw, "failed to disable CLx on upstream port\n");
+	}
 
 	err = tb_plug_events_active(sw, false);
 	if (err)
@@ -3483,7 +3485,7 @@ static int tb_switch_enable_cl0s(struct tb_switch *sw)
  * to improve performance. CLx is enabled only if both sides of the link
  * support CLx, and if both sides of the link are not configured as two
  * single lane links and only if the link is not inter-domain link. The
- * complete set of conditions is descibed in CM Guide 1.0 section 8.1.
+ * complete set of conditions is described in CM Guide 1.0 section 8.1.
  *
  * Return: Returns 0 on success or an error code on failure.
  */
diff --git a/drivers/thunderbolt/tmu.c b/drivers/thunderbolt/tmu.c
index e4a07a26f693..b656659d02fb 100644
--- a/drivers/thunderbolt/tmu.c
+++ b/drivers/thunderbolt/tmu.c
@@ -606,7 +606,7 @@ int tb_switch_tmu_enable(struct tb_switch *sw)
 /**
  * tb_switch_tmu_configure() - Configure the TMU rate and directionality
  * @sw: Router whose mode to change
- * @rate: Rate to configure Off/LowRes/HiFi
+ * @rate: Rate to configure Off/Normal/HiFi
  * @unidirectional: If uni-directional (bi-directional otherwise)
  *
  * Selects the rate of the TMU and directionality (uni-directional or
-- 
2.17.1

---------------------------------------------------------------------
Intel Israel (74) Limited

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.


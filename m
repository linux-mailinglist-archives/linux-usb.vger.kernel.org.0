Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 50C4D7147B4
	for <lists+linux-usb@lfdr.de>; Mon, 29 May 2023 12:04:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231969AbjE2KEt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 29 May 2023 06:04:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231927AbjE2KEk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 29 May 2023 06:04:40 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA169C7
        for <linux-usb@vger.kernel.org>; Mon, 29 May 2023 03:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685354679; x=1716890679;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xhQ0CLgyvioITgCAlqeRaHAtGfsHJS91Trn+TaWrv28=;
  b=f39bkz6I2GgXJVZDcpQ284jy1Zrg92AZm7klMcNGgbG2Z5vgcBTck/hO
   Q4p/ulu+yrs7rWMg97fD6zZwIANiI5E5eAHBJ2XuBI7ySTDoPBqJ0YV1r
   Mo/c6IlLqT+4KPug+WnzmTNpM4dQSS4DqKgXq95FfSssGr8G1doyBxan1
   INElyaOPI1YsWkyavK5TuENQ7hNoUuX7/cRyMm8XOD4iCZaSkjB2I812u
   VRdlXcVLXMOja5o6eak5T43ngHe9QNlvoom7FMzFpCNFMxftG18VBRawC
   ZAVqezYcQMguXBc/M2Df9qQ5O/MC7pkPyloxDFuFGu7SLpc3v9BSAHGen
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="354684470"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; 
   d="scan'208";a="354684470"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2023 03:04:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="683518627"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; 
   d="scan'208";a="683518627"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 29 May 2023 03:04:27 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 60BB8D79; Mon, 29 May 2023 13:04:26 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Gil Fine <gil.fine@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 15/20] thunderbolt: Do not call CLx functions from TMU code
Date:   Mon, 29 May 2023 13:04:20 +0300
Message-Id: <20230529100425.6125-16-mika.westerberg@linux.intel.com>
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

There is really no need to call any of the CLx functions in the TMU code
so remove all these checks. This makes the TMU enable/disable flows
easier to follow as well.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tmu.c | 23 -----------------------
 1 file changed, 23 deletions(-)

diff --git a/drivers/thunderbolt/tmu.c b/drivers/thunderbolt/tmu.c
index 6988704c845c..7d06bacf24ff 100644
--- a/drivers/thunderbolt/tmu.c
+++ b/drivers/thunderbolt/tmu.c
@@ -383,14 +383,6 @@ int tb_switch_tmu_post_time(struct tb_switch *sw)
  */
 int tb_switch_tmu_disable(struct tb_switch *sw)
 {
-	/*
-	 * No need to disable TMU on devices that don't support CLx since
-	 * on these devices e.g. Alpine Ridge and earlier, the TMU mode
-	 * HiFi bi-directional is enabled by default and we don't change it.
-	 */
-	if (!tb_switch_clx_is_supported(sw))
-		return 0;
-
 	/* Already disabled? */
 	if (sw->tmu.rate == TB_SWITCH_TMU_RATE_OFF)
 		return 0;
@@ -648,25 +640,10 @@ int tb_switch_tmu_enable(struct tb_switch *sw)
 	bool unidirectional = sw->tmu.unidirectional_request;
 	int ret;
 
-	/*
-	 * No need to enable TMU on devices that don't support CLx since on
-	 * these devices e.g. Alpine Ridge and earlier, the TMU mode HiFi
-	 * bi-directional is enabled by default.
-	 */
-	if (!tb_switch_clx_is_supported(sw))
-		return 0;
-
 	if (tb_switch_tmu_is_enabled(sw))
 		return 0;
 
 	if (tb_switch_is_titan_ridge(sw) && unidirectional) {
-		/*
-		 * Titan Ridge supports CL0s and CL1 only. CL0s and CL1 are
-		 * enabled and supported together.
-		 */
-		if (!tb_switch_clx_is_enabled(sw, TB_CL1))
-			return -EOPNOTSUPP;
-
 		ret = tb_switch_tmu_disable_objections(sw);
 		if (ret)
 			return ret;
-- 
2.39.2


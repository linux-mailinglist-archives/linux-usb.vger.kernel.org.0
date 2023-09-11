Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD6F779B622
	for <lists+linux-usb@lfdr.de>; Tue, 12 Sep 2023 02:04:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350384AbjIKVhq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 11 Sep 2023 17:37:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236254AbjIKKEz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 11 Sep 2023 06:04:55 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C1D0E68
        for <linux-usb@vger.kernel.org>; Mon, 11 Sep 2023 03:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694426691; x=1725962691;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=b0hAZciQJZLXXC8aetb8VC3iZTftmHhM+W5FL9Kyf4s=;
  b=cqhKUenQgLwqrkOXoOG0kUNmM6g4nROpdAlBuBXuO6RaGyp+UCOSs9ZK
   dz7kZ9qz167paPa8Th9SuGaYnwS/bGLRUdJ2rFDRuBWdg3cenqmVQHMCW
   QMpo758IJRrAK4HJnO9lCXEpy5SlAHhH2RaXed/UMcDDumZbICDajeyAg
   b57lLPyrPjFAMVtzhJidR3m34+YD11Seowjb4SWG9cuUQ0Wfv6AIUrfSO
   fQDPV20t0pHpYnN+RVV5uw0ds0sivfbQZwfOd+yXoTtfvL6YA0q7kIXbm
   i5ye0u/EJaMqXGQ8UmFwzz/LRQBURRxox9B7cwrCuq+AOiiXslHrHNn1g
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="376956500"
X-IronPort-AV: E=Sophos;i="6.02,243,1688454000"; 
   d="scan'208";a="376956500"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2023 03:04:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="916964180"
X-IronPort-AV: E=Sophos;i="6.02,243,1688454000"; 
   d="scan'208";a="916964180"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga005.jf.intel.com with ESMTP; 11 Sep 2023 03:04:47 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id D4E94A22; Mon, 11 Sep 2023 13:04:45 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Werner Sembach <wse@tuxedocomputers.com>,
        Konrad J Hambrick <kjhambrick@gmail.com>,
        Calvin Walton <calvin.walton@kepstin.ca>,
        =?UTF-8?q?Marek=20=C5=A0anta?= <teslan223@gmail.com>,
        David Binderman <dcb314@hotmail.com>,
        Alex Balcanquall <alex@alexbal.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 3/5] thunderbolt: Correct TMU mode initialization from hardware
Date:   Mon, 11 Sep 2023 13:04:43 +0300
Message-Id: <20230911100445.3612655-4-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230911100445.3612655-1-mika.westerberg@linux.intel.com>
References: <20230911100445.3612655-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

David reported that cppcheck found following possible copy & paste
error from tmu_mode_init():

  tmu.c:385:50: style: Expression is always false because 'else if' condition matches previous condition at line 383. [multiCondition]

And indeed this is a bug. Fix it to use correct index
(TB_SWITCH_TMU_MODE_HIFI_UNI).

Reported-by: David Binderman <dcb314@hotmail.com>
Fixes: d49b4f043d63 ("thunderbolt: Add support for enhanced uni-directional TMU mode")
Cc: stable@vger.kernel.org
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/tmu.c b/drivers/thunderbolt/tmu.c
index 747f88703d5c..11f2aec2a5d3 100644
--- a/drivers/thunderbolt/tmu.c
+++ b/drivers/thunderbolt/tmu.c
@@ -382,7 +382,7 @@ static int tmu_mode_init(struct tb_switch *sw)
 		} else if (ucap && tb_port_tmu_is_unidirectional(up)) {
 			if (tmu_rates[TB_SWITCH_TMU_MODE_LOWRES] == rate)
 				sw->tmu.mode = TB_SWITCH_TMU_MODE_LOWRES;
-			else if (tmu_rates[TB_SWITCH_TMU_MODE_LOWRES] == rate)
+			else if (tmu_rates[TB_SWITCH_TMU_MODE_HIFI_UNI] == rate)
 				sw->tmu.mode = TB_SWITCH_TMU_MODE_HIFI_UNI;
 		} else if (rate) {
 			sw->tmu.mode = TB_SWITCH_TMU_MODE_HIFI_BI;
-- 
2.40.1


Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0C137147B0
	for <lists+linux-usb@lfdr.de>; Mon, 29 May 2023 12:04:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231936AbjE2KEp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 29 May 2023 06:04:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231938AbjE2KEj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 29 May 2023 06:04:39 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E58CCC2
        for <linux-usb@vger.kernel.org>; Mon, 29 May 2023 03:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685354678; x=1716890678;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Hp+aoosGxfnW+/8U6JARpfP8sJ7cuKSNBe//Y2VD7E8=;
  b=CWva9aold5jYveb3MGNzwIjgls6TH2C62kcgx0Ho7YqRmEsGpHefqIAk
   pvxWE3BpN/jyI8kZJnL8H/kVXKJxNauXH48c+e5clrWuNnQ1pTc+EmbZ+
   HT9YFfJsdR8U23QAP2b/By9lkEzcMe9EZSa3CgRAX1DkP2SxA2MC5yyDx
   s03GWVVfXhbo7P/o2AzrDUFTCtOF7vX/x2z9uNUBfR2f3PQb6kVaNKlxN
   3jiP+Ox2WGDZ7eGsiDWIAFfc207qP6fqfTtVJC9S/XWz5cAKZ6bbxaDD9
   L8NyTNw/WzE4K0IEYvvwWYQIKHJXJRwRIgr1DTrksDPppyhVEunvzf2Su
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="354684467"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; 
   d="scan'208";a="354684467"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2023 03:04:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="683518620"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; 
   d="scan'208";a="683518620"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 29 May 2023 03:04:27 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 68249FE6; Mon, 29 May 2023 13:04:26 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Gil Fine <gil.fine@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 16/20] thunderbolt: Prefix TMU post time log message with "TMU: "
Date:   Mon, 29 May 2023 13:04:21 +0300
Message-Id: <20230529100425.6125-17-mika.westerberg@linux.intel.com>
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

Following what we do with other messages in this file. No functional
changes.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/tmu.c b/drivers/thunderbolt/tmu.c
index 7d06bacf24ff..c926fb71c43d 100644
--- a/drivers/thunderbolt/tmu.c
+++ b/drivers/thunderbolt/tmu.c
@@ -308,7 +308,7 @@ int tb_switch_tmu_post_time(struct tb_switch *sw)
 		return ret;
 
 	for (i = 0; i < ARRAY_SIZE(gm_local_time); i++)
-		tb_sw_dbg(root_switch, "local_time[%d]=0x%08x\n", i,
+		tb_sw_dbg(root_switch, "TMU: local_time[%d]=0x%08x\n", i,
 			  gm_local_time[i]);
 
 	/* Convert to nanoseconds (drop fractional part) */
-- 
2.39.2


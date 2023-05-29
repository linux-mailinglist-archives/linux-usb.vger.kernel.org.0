Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 57D907147B6
	for <lists+linux-usb@lfdr.de>; Mon, 29 May 2023 12:04:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232002AbjE2KEw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 29 May 2023 06:04:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231952AbjE2KEm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 29 May 2023 06:04:42 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8AB4DB
        for <linux-usb@vger.kernel.org>; Mon, 29 May 2023 03:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685354680; x=1716890680;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=o6fVvWAIOSTWk0LSvbD6edTBjS2MdOYtX+ksmcZ51Gk=;
  b=HrkT98Z+TvNYxftQ3zDiM/iGuSKf2ZfbRj0wr3heLj/ukPKEN/ZRsOAG
   uliEUlobg03pdZCjvWqPvaLY0sFT3c0OInedKTEz9RV9/QxQYoafGTr69
   zIgJUPFuDqpEFHU3tzteuKeEWbSffNeWFqQ0dhZxWv/bn9esvKA+CY9Am
   GPsSDXdF1rnEPmBcU07ful9DVMTJSTZt2tk/A4NyGGyaRqDHeihYvJlvn
   3cO0mubhwL6lOw/m2D94pNUK0brVI4voM35/7KxpjYj8UL7YMe5FYiUF/
   HiaSEpF6tfexRV3HhtIoBuI1aBhrvQTlDwanc18WCxb/2hu+bGdP4QyZl
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="354684480"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; 
   d="scan'208";a="354684480"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2023 03:04:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="683518650"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; 
   d="scan'208";a="683518650"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 29 May 2023 03:04:28 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 6F9311040; Mon, 29 May 2023 13:04:26 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Gil Fine <gil.fine@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 17/20] thunderbolt: Prefix CL state related log messages with "CLx: "
Date:   Mon, 29 May 2023 13:04:22 +0300
Message-Id: <20230529100425.6125-18-mika.westerberg@linux.intel.com>
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

This makes it easier to spot from the logs and follows what we do with
the TMU code already. We also log enabling/disabling CL states using the
tb_sw_dbg() instead of tb_port_dbg().

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/clx.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/thunderbolt/clx.c b/drivers/thunderbolt/clx.c
index b8cfbd643311..5e745386c413 100644
--- a/drivers/thunderbolt/clx.c
+++ b/drivers/thunderbolt/clx.c
@@ -296,9 +296,9 @@ int tb_switch_clx_enable(struct tb_switch *sw, unsigned int clx)
 	up_clx_support = tb_port_clx_supported(up, clx);
 	down_clx_support = tb_port_clx_supported(down, clx);
 
-	tb_port_dbg(up, "%s %ssupported\n", clx_name(clx),
+	tb_port_dbg(up, "CLx: %s %ssupported\n", clx_name(clx),
 		    up_clx_support ? "" : "not ");
-	tb_port_dbg(down, "%s %ssupported\n", clx_name(clx),
+	tb_port_dbg(down, "CLx: %s %ssupported\n", clx_name(clx),
 		    down_clx_support ? "" : "not ");
 
 	if (!up_clx_support || !down_clx_support)
@@ -323,7 +323,7 @@ int tb_switch_clx_enable(struct tb_switch *sw, unsigned int clx)
 
 	sw->clx |= clx;
 
-	tb_port_dbg(up, "%s enabled\n", clx_name(clx));
+	tb_sw_dbg(sw, "CLx: %s enabled\n", clx_name(clx));
 	return 0;
 }
 
@@ -361,6 +361,6 @@ int tb_switch_clx_disable(struct tb_switch *sw)
 
 	sw->clx = 0;
 
-	tb_port_dbg(up, "%s disabled\n", clx_name(clx));
+	tb_sw_dbg(sw, "CLx: %s disabled\n", clx_name(clx));
 	return 0;
 }
-- 
2.39.2


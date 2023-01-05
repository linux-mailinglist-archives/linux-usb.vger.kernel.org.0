Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 329F465EA03
	for <lists+linux-usb@lfdr.de>; Thu,  5 Jan 2023 12:35:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232933AbjAELfr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 5 Jan 2023 06:35:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232235AbjAELfb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 5 Jan 2023 06:35:31 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32DB25833E
        for <linux-usb@vger.kernel.org>; Thu,  5 Jan 2023 03:35:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672918530; x=1704454530;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2WAy+1nJjVaxbEluB9kU5YTVIAGCFb8nK2Pg1MOv1Hs=;
  b=DhxYSwGoO3kPaZn5eFGW33S9VIAkPOiluonb/QEC3UZhIqxEb33LAi8F
   Q/+taw5i88qEvMipdiWaQD0GnrnPlWLp5x/zkojraJJR5l92hPUlHVTbK
   i2UpYKdJA3Ic2zjXlyZbG/8qOsYn2utA2Ekh3wa2eznK7lhAUFgREat1O
   XnZcivZnVXD4fvDQ9CmaRECTh+LcTQ4/PrSkQFMFOp4DUzJpZxb9VGL7R
   aJzFYvzI8lwt+DICxatD7UHCFymdiijqMg1vwNWJrBaVcJlQkCaFuRtWt
   RoJSUw9tzb5Ohqx/p9HOFtmvW1QFP0oE/yGKkElfimHKoSRCVTNJ0MKiK
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10580"; a="319888860"
X-IronPort-AV: E=Sophos;i="5.96,302,1665471600"; 
   d="scan'208";a="319888860"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2023 03:35:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10580"; a="829527653"
X-IronPort-AV: E=Sophos;i="5.96,302,1665471600"; 
   d="scan'208";a="829527653"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga005.jf.intel.com with ESMTP; 05 Jan 2023 03:35:26 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 9B6A019E; Thu,  5 Jan 2023 13:35:59 +0200 (EET)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 2/8] thunderbolt: Log DP adapter type
Date:   Thu,  5 Jan 2023 13:35:53 +0200
Message-Id: <20230105113559.68531-3-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230105113559.68531-1-mika.westerberg@linux.intel.com>
References: <20230105113559.68531-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This makes it easier to see from the debug logs what type of DisplayPort
adapter is in use or available.

No functional changes.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index 3f1ab30c4fb1..db9dade7b4b0 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -892,7 +892,7 @@ static struct tb_port *tb_find_dp_out(struct tb *tb, struct tb_port *in)
 			continue;
 
 		if (tb_port_is_enabled(port)) {
-			tb_port_dbg(port, "in use\n");
+			tb_port_dbg(port, "DP OUT in use\n");
 			continue;
 		}
 
@@ -941,7 +941,7 @@ static void tb_tunnel_dp(struct tb *tb)
 			continue;
 
 		if (tb_port_is_enabled(port)) {
-			tb_port_dbg(port, "in use\n");
+			tb_port_dbg(port, "DP IN in use\n");
 			continue;
 		}
 
-- 
2.35.1


Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1126C534D8E
	for <lists+linux-usb@lfdr.de>; Thu, 26 May 2022 12:49:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242773AbiEZKtb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 May 2022 06:49:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237146AbiEZKt3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 26 May 2022 06:49:29 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53413CEB86
        for <linux-usb@vger.kernel.org>; Thu, 26 May 2022 03:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653562169; x=1685098169;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=DqPAPw8qgQY+R2Ioy5u5gNT27Lof2P8GFRvoRMzp6kM=;
  b=FwaPwXhMc3VclSNzc0xnZvcp1asmwnnw+q9f0P1uS9w1X+lswrs1ai3B
   l36OBJUYmeWiN7bQZWaCqlUOwphEEQze9o19hYXASLwLYsotxBRbk53h1
   NDNp1Bhk1c2/JK/beIRK5aHxKM8xfY3WeenmGD+AWbZiS5vWpqlfKU+vB
   SxN7TYzWlx6t2nG7nwtyNWBgIw6/bd70GWHupq5O1RyX0QrxlLapbpL9V
   apvxMso44gPaNmIp3tsaJrQPRQ401INFELZATpu2IDgMqVk3IX3rRV0IH
   V6di+tHj4RJd1fLGCWaFR2FFBx1fHlAPtF7zNQ2asV8SyvxB1sEGtAYqO
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10358"; a="274223356"
X-IronPort-AV: E=Sophos;i="5.91,252,1647327600"; 
   d="scan'208";a="274223356"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2022 03:49:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,252,1647327600"; 
   d="scan'208";a="704474289"
Received: from ccdjpclinux26.jer.intel.com ([10.12.48.253])
  by orsmga004.jf.intel.com with ESMTP; 26 May 2022 03:49:27 -0700
From:   Gil Fine <gil.fine@intel.com>
To:     andreas.noever@gmail.com, michael.jamet@intel.com,
        mika.westerberg@linux.intel.com, YehezkelShB@gmail.com
Cc:     gil.fine@intel.com, linux-usb@vger.kernel.org, lukas@wunner.de
Subject: [PATCH v4 2/6] thunderbolt: CLx disable before system suspend only if previously enabled
Date:   Thu, 26 May 2022 13:59:17 +0300
Message-Id: <20220526105921.17214-3-gil.fine@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220526105921.17214-1-gil.fine@intel.com>
References: <20220526105921.17214-1-gil.fine@intel.com>
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Disable CLx before system suspended only if previously was enabled.

Signed-off-by: Gil Fine <gil.fine@intel.com>
---
 drivers/thunderbolt/switch.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index ac87e8b50e52..549523c9a543 100644
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
-- 
2.17.1

---------------------------------------------------------------------
Intel Israel (74) Limited

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.


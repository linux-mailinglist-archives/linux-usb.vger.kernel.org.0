Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1C415205C2
	for <lists+linux-usb@lfdr.de>; Mon,  9 May 2022 22:21:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229600AbiEIUZP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 May 2022 16:25:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229683AbiEIUY2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 9 May 2022 16:24:28 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 165E924DC1B
        for <linux-usb@vger.kernel.org>; Mon,  9 May 2022 13:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652126859; x=1683662859;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=DqPAPw8qgQY+R2Ioy5u5gNT27Lof2P8GFRvoRMzp6kM=;
  b=hvh2jEv3FoePPvnbJ9ws9R44jB6KeBBTFnd5camOVDhHBMZF5NN03+UL
   3fBVrbkwaHgL9y+1yFO1L5uQSjEo1F7GpggUd7Kun135XS2noxu2LrtDX
   IGLAo3AAwqORFrAtaUJ5WEnjQ8lUP0QSmifdoLvD9v5Cbb0WwCpqGM5me
   ms0besXBKY8ztjxuUdVEbyHXyT1f7qHntJWH4R94BQ01WwZpqLgLFAk/b
   W0p/BpUSXVedUaJqK5A3Ic0DfzjuNDq6qBc3mrGcYp2f2ftv1iYfTMeQq
   4sEpPSGAwXDdAvDZ6CRmKkZAKu/y4+bqQ+L7A55kcU0LEf/zOwafuUMG3
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10342"; a="249692917"
X-IronPort-AV: E=Sophos;i="5.91,212,1647327600"; 
   d="scan'208";a="249692917"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2022 13:07:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,212,1647327600"; 
   d="scan'208";a="710688872"
Received: from ccdjpclinux26.jer.intel.com ([10.12.48.253])
  by fmsmga001.fm.intel.com with ESMTP; 09 May 2022 13:07:36 -0700
From:   Gil Fine <gil.fine@intel.com>
To:     andreas.noever@gmail.com, michael.jamet@intel.com,
        mika.westerberg@linux.intel.com, YehezkelShB@gmail.com
Cc:     gil.fine@intel.com, linux-usb@vger.kernel.org, lukas@wunner.de
Subject: [PATCH 2/6] thunderbolt: CLx disable before system suspend only if previously enabled
Date:   Mon,  9 May 2022 23:16:52 +0300
Message-Id: <20220509201656.502-3-gil.fine@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220509201656.502-1-gil.fine@intel.com>
References: <20220509201656.502-1-gil.fine@intel.com>
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


Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD5805205C3
	for <lists+linux-usb@lfdr.de>; Mon,  9 May 2022 22:21:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229611AbiEIUZS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 May 2022 16:25:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229710AbiEIUYf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 9 May 2022 16:24:35 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59BD424DC44
        for <linux-usb@vger.kernel.org>; Mon,  9 May 2022 13:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652126863; x=1683662863;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=BAFJ+DR2d6Bu7mqJI39cIz/ZIgjvFu/xGC4HeIIR05Q=;
  b=aBvhv7sJzsdI1s5Lw5pnmZcfpqvNJNP16R3k0FD2iUcydMhJJd9pmfNm
   ZBD0BunXsNPwTlOiq2rhbrc8fdA9/p+n8onUwAhW5z0yU5oKLWDQ8GC4K
   uifEgtDnq47PLE3NFLNfCQkGY1OlYdOf0WSRCugk8bH4pDldObNVcby0o
   qI78AKPwXutsRgqFPeUvR1YoAZjHumgRs/wVZo46EijOmKR/Tsorhzz1s
   aRShvdKL3nR9PP+BXK5Tug6OkeA2F3byoO7uOEVj14Tf7hTL9fkqsrvMK
   X0sOvY2nwopbb65MUK5Y6uYFUubFbiTKYRFOUjw7vDMGvUgg8c2mIl52u
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10342"; a="249692940"
X-IronPort-AV: E=Sophos;i="5.91,212,1647327600"; 
   d="scan'208";a="249692940"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2022 13:07:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,212,1647327600"; 
   d="scan'208";a="710688889"
Received: from ccdjpclinux26.jer.intel.com ([10.12.48.253])
  by fmsmga001.fm.intel.com with ESMTP; 09 May 2022 13:07:41 -0700
From:   Gil Fine <gil.fine@intel.com>
To:     andreas.noever@gmail.com, michael.jamet@intel.com,
        mika.westerberg@linux.intel.com, YehezkelShB@gmail.com
Cc:     gil.fine@intel.com, linux-usb@vger.kernel.org, lukas@wunner.de
Subject: [PATCH 4/6] thunderbolt: Change downstream router's TMU rate in both TMU uni/bidir mode
Date:   Mon,  9 May 2022 23:16:54 +0300
Message-Id: <20220509201656.502-5-gil.fine@intel.com>
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

In case of uni-directional time sync, TMU handshake is
initiated by upstream router. In case of bi-directional
time sync, TMU handshake is initiated by downstream router.
In order to handle correctly the case of uni-directional mode,
we avoid changing the upstream router's rate to off,
because it might have another downstream router plugged that is set to
uni-directional mode (and we don't want to change its mode).
Instead, we always change downstream router's rate.

Signed-off-by: Gil Fine <gil.fine@intel.com>
---
 drivers/thunderbolt/tmu.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/thunderbolt/tmu.c b/drivers/thunderbolt/tmu.c
index b656659d02fb..985ca43b8f39 100644
--- a/drivers/thunderbolt/tmu.c
+++ b/drivers/thunderbolt/tmu.c
@@ -359,13 +359,14 @@ int tb_switch_tmu_disable(struct tb_switch *sw)
 		 * In case of uni-directional time sync, TMU handshake is
 		 * initiated by upstream router. In case of bi-directional
 		 * time sync, TMU handshake is initiated by downstream router.
-		 * Therefore, we change the rate to off in the respective
-		 * router.
+		 * We change downstream router's rate to off for both uni/bidir
+		 * cases although it is needed only for the bi-directional mode.
+		 * We avoid changing upstream router's mode since it might
+		 * have another downstream router plugged, that is set to
+		 * uni-directional mode and we don't want to change it's TMU
+		 * mode.
 		 */
-		if (unidirectional)
-			tb_switch_tmu_rate_write(parent, TB_SWITCH_TMU_RATE_OFF);
-		else
-			tb_switch_tmu_rate_write(sw, TB_SWITCH_TMU_RATE_OFF);
+		tb_switch_tmu_rate_write(sw, TB_SWITCH_TMU_RATE_OFF);
 
 		tb_port_tmu_time_sync_disable(up);
 		ret = tb_port_tmu_time_sync_disable(down);
-- 
2.17.1

---------------------------------------------------------------------
Intel Israel (74) Limited

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.


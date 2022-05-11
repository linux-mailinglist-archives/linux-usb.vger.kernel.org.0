Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C9BE5234C9
	for <lists+linux-usb@lfdr.de>; Wed, 11 May 2022 15:56:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244403AbiEKN4q (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 May 2022 09:56:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244374AbiEKN4Y (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 11 May 2022 09:56:24 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 448FC22BD0
        for <linux-usb@vger.kernel.org>; Wed, 11 May 2022 06:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652277382; x=1683813382;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=BAFJ+DR2d6Bu7mqJI39cIz/ZIgjvFu/xGC4HeIIR05Q=;
  b=CZ5dEYIANCyEhUlUsJ4OaGgUDzeMHkeLh+QlrWXscIpB1j/YKIUAF1fy
   6GAnMoB8t6rBQdOt+ki+Sodl5grKXB2+ZNxhVXP/pNwb7hz5c1paLyeVx
   8yzrEVEo/rJO6vkWWJIEZ335PEiD0fnhdHwjNX56wjkuO5zZFOVlUxiJw
   Cx+PRO/J/fvc15y9Q72sgdjdHyAAQmeGHTiGvrhNC+apvA5htxBkRDAQ/
   Tf95sO8++a6jIc6YBktfk07G5mE5YsXcsA/72oKu+TA8GVbSFfGjm8Wcg
   +5/BpBzy4oTg867HGwleclC09Od4aPFdczoMq6CQW8IjtAuPSk0G27kmr
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10343"; a="249599715"
X-IronPort-AV: E=Sophos;i="5.91,217,1647327600"; 
   d="scan'208";a="249599715"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2022 06:56:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,217,1647327600"; 
   d="scan'208";a="553332027"
Received: from ccdjpclinux26.jer.intel.com ([10.12.48.253])
  by orsmga002.jf.intel.com with ESMTP; 11 May 2022 06:56:20 -0700
From:   Gil Fine <gil.fine@intel.com>
To:     andreas.noever@gmail.com, michael.jamet@intel.com,
        mika.westerberg@linux.intel.com, YehezkelShB@gmail.com
Cc:     gil.fine@intel.com, linux-usb@vger.kernel.org, lukas@wunner.de
Subject: [PATCH v3 4/6] thunderbolt: Change downstream router's TMU rate in both TMU uni/bidir mode
Date:   Wed, 11 May 2022 17:05:47 +0300
Message-Id: <20220511140549.10571-5-gil.fine@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220511140549.10571-1-gil.fine@intel.com>
References: <20220511140549.10571-1-gil.fine@intel.com>
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
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


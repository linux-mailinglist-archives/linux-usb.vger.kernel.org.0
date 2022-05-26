Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 269E6534D91
	for <lists+linux-usb@lfdr.de>; Thu, 26 May 2022 12:49:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237146AbiEZKtj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 May 2022 06:49:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232894AbiEZKtf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 26 May 2022 06:49:35 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7D2DC8BF4
        for <linux-usb@vger.kernel.org>; Thu, 26 May 2022 03:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653562173; x=1685098173;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=BAFJ+DR2d6Bu7mqJI39cIz/ZIgjvFu/xGC4HeIIR05Q=;
  b=ILXemWkwirVHugD0E4dR8Bsom5NSMfH37kt6Om3EcGUB9kZYapPENKiw
   Wq00AXXkJVbaD7TJLUftpOmfY/b4TD7W9AUHedhBhB3KWlb9UqZCZeAAR
   SBVB6MzunWQ1kdLhT097wqvR2euEatn+HkdQF8Pn6l80S5peoqcKWTAM6
   5BC+82AgZuw3QtEv0o+2LKNdK7Yb7RbDxZelsTPUAN/kMgzBs9nzcyysz
   kR+Ii/hxUPo7/JLi98eLV5vym3mVIXsfhYXDQIpCkITko0w6m53kVZxYb
   j6V4POBh5vEzYRZkMBMPDDDztbzhxVUQ6W+zVgeupTKcmlnIfY7X4vZSb
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10358"; a="274223367"
X-IronPort-AV: E=Sophos;i="5.91,252,1647327600"; 
   d="scan'208";a="274223367"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2022 03:49:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,252,1647327600"; 
   d="scan'208";a="704474307"
Received: from ccdjpclinux26.jer.intel.com ([10.12.48.253])
  by orsmga004.jf.intel.com with ESMTP; 26 May 2022 03:49:31 -0700
From:   Gil Fine <gil.fine@intel.com>
To:     andreas.noever@gmail.com, michael.jamet@intel.com,
        mika.westerberg@linux.intel.com, YehezkelShB@gmail.com
Cc:     gil.fine@intel.com, linux-usb@vger.kernel.org, lukas@wunner.de
Subject: [PATCH v4 4/6] thunderbolt: Change downstream router's TMU rate in both TMU uni/bidir mode
Date:   Thu, 26 May 2022 13:59:19 +0300
Message-Id: <20220526105921.17214-5-gil.fine@intel.com>
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


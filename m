Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0068D52060C
	for <lists+linux-usb@lfdr.de>; Mon,  9 May 2022 22:41:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229437AbiEIUng (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 May 2022 16:43:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229499AbiEIUn2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 9 May 2022 16:43:28 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E29911E0588
        for <linux-usb@vger.kernel.org>; Mon,  9 May 2022 13:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652128773; x=1683664773;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=CoJ7Hbf07h6BGs2XG9GXAoPBjUQVKwMhZahSXN6+j8g=;
  b=Gi6tUd6+LahaqhhO009SHE4nTazbe5MxQewz+PHgIcbjZVQF4V3eppFJ
   +rGOV71lNY065eCuLD1jc1iLHZ3O/NKFpCCgJhVkjwemvQROrBOwgBeWZ
   +AFKB6cxhSegagAcBg8X5MDvPB0QQ6Zn04mqEwDUK+f1OOOxngBws864F
   VexABwKCP42X1lRLr/yfE/9rL4j7xGH5IAVHWZYbYdJERElAwyYynhGTK
   6/pKVQ+5yGJ70Z4GfWbt/90jhNgcxNITkHjFBgjFH2bR66Hq4d2oUjLQb
   kyc7NCLrr0HSpGLyZxapNreKvBgnpHR3+coVPUHkwgx25gI7AXlc/DAA1
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10342"; a="269301513"
X-IronPort-AV: E=Sophos;i="5.91,212,1647327600"; 
   d="scan'208";a="269301513"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2022 13:39:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,212,1647327600"; 
   d="scan'208";a="738339135"
Received: from ccdjpclinux26.jer.intel.com ([10.12.48.253])
  by orsmga005.jf.intel.com with ESMTP; 09 May 2022 13:39:31 -0700
From:   Gil Fine <gil.fine@intel.com>
To:     andreas.noever@gmail.com, michael.jamet@intel.com,
        mika.westerberg@linux.intel.com, YehezkelShB@gmail.com
Cc:     gil.fine@intel.com, linux-usb@vger.kernel.org, lukas@wunner.de
Subject: [PATCH 1/2] thunderbolt: Fix buffers allocation for device without DisplayPort adaptors
Date:   Mon,  9 May 2022 23:49:03 +0300
Message-Id: <20220509204904.8936-2-gil.fine@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220509204904.8936-1-gil.fine@intel.com>
References: <20220509204904.8936-1-gil.fine@intel.com>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

For the case of device without DP adaptors, we calculate incorrectly the
buffers allocation. Here we fix the calculation for this case.

Signed-off-by: Gil Fine <gil.fine@intel.com>
---
 drivers/thunderbolt/tunnel.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/thunderbolt/tunnel.c b/drivers/thunderbolt/tunnel.c
index 8ccd70920b6a..2c3cf7fc3357 100644
--- a/drivers/thunderbolt/tunnel.c
+++ b/drivers/thunderbolt/tunnel.c
@@ -102,8 +102,11 @@ static unsigned int tb_available_credits(const struct tb_port *port,
 		 * Maximum number of DP streams possible through the
 		 * lane adapter.
 		 */
-		ndp = (credits - (usb3 + pcie + spare)) /
-		      (sw->min_dp_aux_credits + sw->min_dp_main_credits);
+		if (sw->min_dp_aux_credits + sw->min_dp_main_credits)
+			ndp = (credits - (usb3 + pcie + spare)) /
+			      (sw->min_dp_aux_credits + sw->min_dp_main_credits);
+		else
+			ndp = 0;
 	} else {
 		ndp = 0;
 	}
-- 
2.17.1

---------------------------------------------------------------------
Intel Israel (74) Limited

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.


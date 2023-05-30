Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D23FC7157B6
	for <lists+linux-usb@lfdr.de>; Tue, 30 May 2023 09:56:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229633AbjE3H4L (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 30 May 2023 03:56:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229623AbjE3H4K (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 30 May 2023 03:56:10 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8998FF1
        for <linux-usb@vger.kernel.org>; Tue, 30 May 2023 00:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685433353; x=1716969353;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=kZElLRbz5wDonx5jo805gHYCRvxa9gUzPWvxobbMozI=;
  b=UpIWbTwwc1mq+9XjQ0wraPCsZVE9/Vj9QRbUTTeVJqKENafz8N8aJp38
   XrvT2nBLNDWRSCke4qe2ZdvMFOnMSI9/EdP62ZkruJLITthiDJNGvgEli
   wGvJ4WGJunWF4UqHmk+AVtbS3Jdokz12+aFrjDycjZEroycI4FdXimSKz
   U5Zhf76WA6xOXEndmS+ZnaMEPnbwNkairz5QknwYIMPCHae95k560RYOX
   phiDnQpX97bIb8IGXEbHeivrgGSayb+dCZpOzw+S9ZouN8GTsmtDwGH2O
   n3YPbP4/ZVbjb04SrCuy53Z7ToVpGyXfEQpUHERVQFW6gfUESgDEpDSzv
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="418329453"
X-IronPort-AV: E=Sophos;i="6.00,203,1681196400"; 
   d="scan'208";a="418329453"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2023 00:55:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="683849260"
X-IronPort-AV: E=Sophos;i="6.00,203,1681196400"; 
   d="scan'208";a="683849260"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 30 May 2023 00:55:50 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id B874253A; Tue, 30 May 2023 10:55:55 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        beld zhang <beldzhang@gmail.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Bagas Sanjaya <bagasdotme@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH] thunderbolt: Mask ring interrupt on Intel hardware as well
Date:   Tue, 30 May 2023 10:55:55 +0300
Message-Id: <20230530075555.35239-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

When resuming from system sleep states the driver issues following
warning on Intel hardware:

  thunderbolt 0000:07:00.0: interrupt for TX ring 0 is already enabled

The reason for this is that the commit in question did not mask the ring
interrupt on Intel hardware leaving the interrupt active. Fix this by
masking it also in Intel hardware.

Reported-by: beld zhang <beldzhang@gmail.com>
Closes: https://lore.kernel.org/linux-usb/ZHKW5NeabmfhgLbY@debian.me/
Fixes: c4af8e3fecd0 ("thunderbolt: Clear registers properly when auto clear isn't in use")
Cc: stable@vger.kernel.org
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/nhi.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
index 565892a2cdb9..a979f47109e3 100644
--- a/drivers/thunderbolt/nhi.c
+++ b/drivers/thunderbolt/nhi.c
@@ -56,9 +56,14 @@ static int ring_interrupt_index(const struct tb_ring *ring)
 
 static void nhi_mask_interrupt(struct tb_nhi *nhi, int mask, int ring)
 {
-	if (nhi->quirks & QUIRK_AUTO_CLEAR_INT)
-		return;
-	iowrite32(mask, nhi->iobase + REG_RING_INTERRUPT_MASK_CLEAR_BASE + ring);
+	if (nhi->quirks & QUIRK_AUTO_CLEAR_INT) {
+		u32 val;
+
+		val = ioread32(nhi->iobase + REG_RING_INTERRUPT_BASE + ring);
+		iowrite32(val & ~mask, nhi->iobase + REG_RING_INTERRUPT_BASE + ring);
+	} else {
+		iowrite32(mask, nhi->iobase + REG_RING_INTERRUPT_MASK_CLEAR_BASE + ring);
+	}
 }
 
 static void nhi_clear_interrupt(struct tb_nhi *nhi, int ring)
-- 
2.39.2


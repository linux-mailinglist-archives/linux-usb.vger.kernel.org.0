Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F2235A1539
	for <lists+linux-usb@lfdr.de>; Thu, 25 Aug 2022 17:07:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238853AbiHYPHg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 25 Aug 2022 11:07:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237360AbiHYPHe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 25 Aug 2022 11:07:34 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17AF780B41
        for <linux-usb@vger.kernel.org>; Thu, 25 Aug 2022 08:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661440054; x=1692976054;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=98pTz264WIAILIYNx8GIZGA3HQbV043MLCs4XkgjBZ8=;
  b=gIQylwi9mwD/s50T6ui82EYYggg49d2PbocgPt1lmQ1o8veEQHfq7TZT
   PEs2Ku7egwlluWSr9uwSbZIS9xDJbYsgxniWHlwM1jfgc3APH5k65RDpA
   SIi09yMuOZdZkxeyOZ9mkiw0BtzSiXqAAs7NbipTdPME6aPn8LaEcGDz/
   THc7KT31AYp5wOx4OxknUOh9UJp60GSKOvL8IRxKUpEOu2veDqhfHnznh
   dulsE9aCBpgU6lGqTbVpCFycJiq3M34Va72PproZGbp08xxqWCfT0Nw4z
   Y72JlcjlUyeIB4R+bP4ujlPsC5c9zLcCQ1xLVOZGJf8lnmcYyFGsCliTL
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10450"; a="355981794"
X-IronPort-AV: E=Sophos;i="5.93,263,1654585200"; 
   d="scan'208";a="355981794"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2022 08:07:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,263,1654585200"; 
   d="scan'208";a="643284822"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orsmga001.jf.intel.com with ESMTP; 25 Aug 2022 08:07:29 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>,
        Alexey Sheplyakov <asheplyakov@basealt.ru>
Subject: [PATCH 1/3] xhci: Fix null pointer dereference in remove if xHC has only one roothub
Date:   Thu, 25 Aug 2022 18:08:38 +0300
Message-Id: <20220825150840.132216-2-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220825150840.132216-1-mathias.nyman@linux.intel.com>
References: <20220825150840.132216-1-mathias.nyman@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The remove path in xhci platform driver tries to remove and put both main
and shared hcds even if only a main hcd exists (one roothub)

This causes a null pointer dereference in reboot for those controllers.

Check that the shared_hcd exists before trying to remove it.

Fixes: e0fe986972f5 ("usb: host: xhci-plat: prepare operation w/o shared hcd")
Reported-by: Alexey Sheplyakov <asheplyakov@basealt.ru>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-plat.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index 044855818cb1..a8641b6536ee 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -398,12 +398,17 @@ static int xhci_plat_remove(struct platform_device *dev)
 	pm_runtime_get_sync(&dev->dev);
 	xhci->xhc_state |= XHCI_STATE_REMOVING;
 
-	usb_remove_hcd(shared_hcd);
-	xhci->shared_hcd = NULL;
+	if (shared_hcd) {
+		usb_remove_hcd(shared_hcd);
+		xhci->shared_hcd = NULL;
+	}
+
 	usb_phy_shutdown(hcd->usb_phy);
 
 	usb_remove_hcd(hcd);
-	usb_put_hcd(shared_hcd);
+
+	if (shared_hcd)
+		usb_put_hcd(shared_hcd);
 
 	clk_disable_unprepare(clk);
 	clk_disable_unprepare(reg_clk);
-- 
2.25.1


Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 171625BFDFC
	for <lists+linux-usb@lfdr.de>; Wed, 21 Sep 2022 14:33:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230034AbiIUMdw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Sep 2022 08:33:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230028AbiIUMdk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 21 Sep 2022 08:33:40 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6F5995AEA
        for <linux-usb@vger.kernel.org>; Wed, 21 Sep 2022 05:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663763618; x=1695299618;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yTbRBo90pcB/fBqv5liREs7w64JtHDfBcp6r2nk6iBQ=;
  b=gfD1w020dJtNqu6PhWQleEZx0N41dMj4kPTzGgsgewJL7f16mEQ97aC+
   jhum+rh1Kdtbo+xictspyyOlnHiRSa/xVF4CdpTGmB9mG7JRNc57Djuo2
   EbBkg2Xf9qvSpqLpufLTnp+6rpma9YYQQYkF5FikW49PzkshI8rW2OUME
   CfXVLrMmKdrs8bdU979woiabAF/lbfwVViKE9ylcFb90Gd8q8OuISIxiI
   G/G2wYonA8n1kqGb8F4c2+Cbj/dWYoxIN0ntXLEzXZ/e89OgMG2ZS9A8U
   ubyYr6ybxwxxKyavKaH1sJaYgM78VCeR6BYLTX5PrdB/e10pTFAFs+RBa
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10477"; a="363965111"
X-IronPort-AV: E=Sophos;i="5.93,333,1654585200"; 
   d="scan'208";a="363965111"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2022 05:33:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,333,1654585200"; 
   d="scan'208";a="708429477"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by FMSMGA003.fm.intel.com with ESMTP; 21 Sep 2022 05:33:37 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 4/6] xhci: show fault reason for a failed enable slot command
Date:   Wed, 21 Sep 2022 15:34:48 +0300
Message-Id: <20220921123450.671459-5-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220921123450.671459-1-mathias.nyman@linux.intel.com>
References: <20220921123450.671459-1-mathias.nyman@linux.intel.com>
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

Show the completion code of a unsuccessful "enable slot" command.
Add it in a human readable form to the existing error message.

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index a7ef675f00fd..17f5dda913be 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -4096,7 +4096,8 @@ int xhci_alloc_dev(struct usb_hcd *hcd, struct usb_device *udev)
 	slot_id = command->slot_id;
 
 	if (!slot_id || command->status != COMP_SUCCESS) {
-		xhci_err(xhci, "Error while assigning device slot ID\n");
+		xhci_err(xhci, "Error while assigning device slot ID: %s\n",
+			 xhci_trb_comp_code_string(command->status));
 		xhci_err(xhci, "Max number of devices this xHCI host supports is %u.\n",
 				HCS_MAX_SLOTS(
 					readl(&xhci->cap_regs->hcs_params1)));
-- 
2.25.1


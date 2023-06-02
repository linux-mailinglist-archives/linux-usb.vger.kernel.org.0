Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0AD6E720496
	for <lists+linux-usb@lfdr.de>; Fri,  2 Jun 2023 16:39:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236028AbjFBOjA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 2 Jun 2023 10:39:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235983AbjFBOi7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 2 Jun 2023 10:38:59 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0614EBC
        for <linux-usb@vger.kernel.org>; Fri,  2 Jun 2023 07:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685716739; x=1717252739;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HDM/7vbm+BPyZ52vnGwOz5UNyHQ6oKM2WK+m3+r0RqA=;
  b=hlELZfZ4RHNJ5Bw5HK6Y+eJxPYbNEoDHM3hiVw1MpCAINOKxM45fK8L4
   l/yzmHZ0+G5qCiliSERrpXr0whIc/ZIgVbskFFl+6Rjtrj6eWAVCPim/5
   q9/wk0GWPxEdzx/JdJiG3JtyabwWaLaAdMjzXFZeMiwuzmT4FeJXUtkak
   iHVuTJiNcoh5PIZK59HPXPb6awRn9eUGbFgc/z8ePZGTHBfPwy1Xxbpl4
   vuBZotONFGk/YjqABFjyoUpcnoexpzONvkYF7L/vVrQA/idBbK3QpyY7/
   ET0p9xnMBEk4pjTnUcdOmQxDHwjk5Gb2wbnjpFS+ZfgQFA3V51ev/Hemg
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="358311235"
X-IronPort-AV: E=Sophos;i="6.00,213,1681196400"; 
   d="scan'208";a="358311235"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2023 07:38:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="707877446"
X-IronPort-AV: E=Sophos;i="6.00,213,1681196400"; 
   d="scan'208";a="707877446"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orsmga002.jf.intel.com with ESMTP; 02 Jun 2023 07:38:56 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 03/11] xhci: Don't require a valid get_quirks() function pointer during xhci setup
Date:   Fri,  2 Jun 2023 17:40:01 +0300
Message-Id: <20230602144009.1225632-4-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230602144009.1225632-1-mathias.nyman@linux.intel.com>
References: <20230602144009.1225632-1-mathias.nyman@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Not all platforms drivers need to set up custom quirks during the xhci
generic setup. Allow them to pass NULL as the function pointer when
calling xhci_gen_setup()

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 3a13e2453203..176969bf2d5c 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -5181,7 +5181,8 @@ int xhci_gen_setup(struct usb_hcd *hcd, xhci_get_quirks_t get_quirks)
 
 	xhci->quirks |= quirks;
 
-	get_quirks(dev, xhci);
+	if (get_quirks)
+		get_quirks(dev, xhci);
 
 	/* In xhci controllers which follow xhci 1.0 spec gives a spurious
 	 * success event after a short transfer. This quirk will ignore such
-- 
2.25.1


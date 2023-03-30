Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 75E736D0857
	for <lists+linux-usb@lfdr.de>; Thu, 30 Mar 2023 16:30:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232446AbjC3OaB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 30 Mar 2023 10:30:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231862AbjC3OaA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 30 Mar 2023 10:30:00 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBB2710DD
        for <linux-usb@vger.kernel.org>; Thu, 30 Mar 2023 07:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680186600; x=1711722600;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oMmY+b1g2KGoiAZvCSckQgQ9KZLKSzt0B0nSDdMkzJ8=;
  b=Zc01aqSvnOxfq6ecK/qecst65JF06XviZ21pL8+nw7fbhS9GTStVZqC4
   ZkgEfIGyc7iYkRcLM1RA9C2IEBuUn9hGsPoOjFaLvuNgnG4sR9jak/hDV
   4N/LcgIyaPv24AkIZDZxFLmoEYhIMT/o6rx1XVgnY3UHyqStvyQR8ifjQ
   BuqNG35OvTN/Vqj+nK8wPoGGGDDwno0rTLctkYQpZgU3meGbsB5+iVyMP
   wPNrBvNimDyqbmN7QTN/4hoAjvU+UqOkqi1c1dEqLP5IRsCNjMlh+XBjA
   QI8HgQhcJUwHAW1ccU0VtEr86ei+G3+QNN/wXNP8be5pjnoVJN3T5V15x
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="406172536"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; 
   d="scan'208";a="406172536"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2023 07:29:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="774021094"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; 
   d="scan'208";a="774021094"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by FMSMGA003.fm.intel.com with ESMTP; 30 Mar 2023 07:29:49 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 2/3] Revert "usb: xhci-pci: Set PROBE_PREFER_ASYNCHRONOUS"
Date:   Thu, 30 Mar 2023 17:30:55 +0300
Message-Id: <20230330143056.1390020-3-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230330143056.1390020-1-mathias.nyman@linux.intel.com>
References: <20230330143056.1390020-1-mathias.nyman@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This reverts commit 4c2604a9a6899bab195edbee35fc8d64ce1444aa.

Asynch probe caused regression in a setup with both Renesas and Intel xHC
controllers. Devices connected to the Renesas disconnected shortly after
boot. With Asynch probe the busnumbers got interleaved.

xhci_hcd 0000:00:14.0: new USB bus registered, assigned bus number 1
xhci_hcd 0000:04:00.0: new USB bus registered, assigned bus number 2
xhci_hcd 0000:00:14.0: new USB bus registered, assigned bus number 3
xhci_hcd 0000:04:00.0: new USB bus registered, assigned bus number 4

Reason why this commit causes regression is still unknown, but revert it
while debugging the issue.

Link: https://lore.kernel.org/linux-usb/20230307132120.5897c5af@deangelis.fenrir.org.uk
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-pci.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index fb988e4ea924..6db07ca419c3 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -771,12 +771,11 @@ static struct pci_driver xhci_pci_driver = {
 	/* suspend and resume implemented later */
 
 	.shutdown = 	usb_hcd_pci_shutdown,
-	.driver = {
 #ifdef CONFIG_PM
-		.pm = &usb_hcd_pci_pm_ops,
-#endif
-		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
+	.driver = {
+		.pm = &usb_hcd_pci_pm_ops
 	},
+#endif
 };
 
 static int __init xhci_pci_init(void)
-- 
2.25.1


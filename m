Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A8564557891
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jun 2022 13:18:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230461AbiFWLS2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Jun 2022 07:18:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231196AbiFWLS0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 23 Jun 2022 07:18:26 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40B1A1AD8E
        for <linux-usb@vger.kernel.org>; Thu, 23 Jun 2022 04:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655983106; x=1687519106;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vQe2BKb4uPsVRym5VCIKwpL1749Ve84qy83CDmmHl9s=;
  b=GqxAzd2tMVS2mU1gKAB+MnVFoIgSneixbMivCTDyZ5Z9apXmXtaPgCxq
   43VZRnbXciRr7OSbRNwllUrYhztbzY9lv0ojdaL0XPXFZplQD09AX6umn
   A18AkurZMWE9WKkbt+gxGGiymr++8akz9vzic0fcAEOIi2qBQqWBePK+W
   7GRTkWSK71UAiy4S5IbKKeTcgYnn1jVWZ3vOIS5dJc2QJWMv12keqUUBa
   wb2FCJHE/72XVngYm0KEEI9RLvuDmiy89sf4FwEZuMAR/8zPwIdbYWAW7
   JSxXwwiraGQoNBFfh86fUWDX+WzjyrbXwgBRoF3V+usWWujZ4ACuisYTX
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10386"; a="367010662"
X-IronPort-AV: E=Sophos;i="5.92,215,1650956400"; 
   d="scan'208";a="367010662"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2022 04:18:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,215,1650956400"; 
   d="scan'208";a="915148756"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by fmsmga005.fm.intel.com with ESMTP; 23 Jun 2022 04:18:24 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Utkarsh Patel <utkarsh.h.patel@intel.com>, stable@kernel.org,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 4/4] xhci-pci: Allow host runtime PM as default for Intel Meteor Lake xHCI
Date:   Thu, 23 Jun 2022 14:19:45 +0300
Message-Id: <20220623111945.1557702-5-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220623111945.1557702-1-mathias.nyman@linux.intel.com>
References: <20220623111945.1557702-1-mathias.nyman@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Utkarsh Patel <utkarsh.h.patel@intel.com>

Meteor Lake TCSS(Type-C Subsystem) xHCI needs to be runtime suspended
whenever possible to allow the TCSS hardware block to enter D3cold and
thus save energy.

Cc: stable@kernel.org
Signed-off-by: Utkarsh Patel <utkarsh.h.patel@intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-pci.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index d66ea276ccec..dce6c0ec8d34 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -62,6 +62,7 @@
 #define PCI_DEVICE_ID_INTEL_ALDER_LAKE_N_XHCI		0x464e
 #define PCI_DEVICE_ID_INTEL_ALDER_LAKE_PCH_XHCI	0x51ed
 #define PCI_DEVICE_ID_INTEL_RAPTOR_LAKE_XHCI		0xa71e
+#define PCI_DEVICE_ID_INTEL_METEOR_LAKE_XHCI		0x7ec0
 
 #define PCI_DEVICE_ID_AMD_RENOIR_XHCI			0x1639
 #define PCI_DEVICE_ID_AMD_PROMONTORYA_4			0x43b9
@@ -271,7 +272,8 @@ static void xhci_pci_quirks(struct device *dev, struct xhci_hcd *xhci)
 	     pdev->device == PCI_DEVICE_ID_INTEL_ALDER_LAKE_XHCI ||
 	     pdev->device == PCI_DEVICE_ID_INTEL_ALDER_LAKE_N_XHCI ||
 	     pdev->device == PCI_DEVICE_ID_INTEL_ALDER_LAKE_PCH_XHCI ||
-	     pdev->device == PCI_DEVICE_ID_INTEL_RAPTOR_LAKE_XHCI))
+	     pdev->device == PCI_DEVICE_ID_INTEL_RAPTOR_LAKE_XHCI ||
+	     pdev->device == PCI_DEVICE_ID_INTEL_METEOR_LAKE_XHCI))
 		xhci->quirks |= XHCI_DEFAULT_PM_RUNTIME_ALLOW;
 
 	if (pdev->vendor == PCI_VENDOR_ID_ETRON &&
-- 
2.25.1


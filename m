Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B3B96BED35
	for <lists+linux-usb@lfdr.de>; Fri, 17 Mar 2023 16:46:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230335AbjCQPqF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 17 Mar 2023 11:46:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230064AbjCQPqE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 17 Mar 2023 11:46:04 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85E2093E09
        for <linux-usb@vger.kernel.org>; Fri, 17 Mar 2023 08:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679067960; x=1710603960;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=8327cCUqvOG2EkRUlvFeMKnuNS0t/+cGeNor2sIrLdY=;
  b=SHlhY4xLGEvU6gHb90PK5o3e79kigOK6OLoDIwaAaVfMeHBk8vFeuZRS
   dg/XtrplWz7ZG4/KySpo6bBoL9OTHa+5R9CkiJAj9c3HOSWxb/o4yTqy0
   BEHvRv9oHPRikODaSgo4NsQH9xHf1b4whKGWacA7iWDoFeY8S8YdiDZG8
   GZw4UWBPeGd53Qc3c8KjUWIKoIrANI8hEuBsbnFNBzNmO/2htwmFRlIe8
   4x48EXCzLNZIVmSrsnjnXXUOdj7dIugxTNfMShhXhHJ43HzCQpy6n4jII
   QRu02PTax6NrIe+I4CqFoW53uR88mQdEW1sJgGK9ksPA0YIAA46w9Ijh1
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="338309720"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; 
   d="scan'208";a="338309720"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2023 08:46:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="630311982"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; 
   d="scan'208";a="630311982"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orsmga003.jf.intel.com with ESMTP; 17 Mar 2023 08:45:58 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 00/14] xhci features for usb-next
Date:   Fri, 17 Mar 2023 17:47:01 +0200
Message-Id: <20230317154715.535523-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg

A set of xhci features and cleanups for usb-next

- Add sysfs entries to modify usb descriptor values shown by xHC in DbC
  device mode.

- Decouple PCI specific MSI code from usb core.

- Generic cleanups by Andy.

Thanks
-Mathias


Andy Shevchenko (7):
  xhci: mem: Carefully calculate size for memory allocations
  xhci: mem: Use dma_poll_zalloc() instead of explicit memset()
  xhci: mem: Get rid of redundant 'else'
  xhci: mem: Drop useless return:s
  xhci: mem: Use while (i--) pattern to clean up
  xhci: mem: Replace explicit castings with appropriate specifiers
  xhci: mem: Join string literals back

Josue David Hernandez Gutierrez (6):
  xhci: Avoid PCI MSI/MSIX interrupt reinitialization at resume
  xhci: Move functions to setup msi to xhci-pci
  xhci: move PCI specific MSI/MSIX cleanup away from generic xhci
    functions
  xhci: Move functions to cleanup MSI to xhci-pci
  xhci: Call MSI sync function from xhci-pci instead of generic xhci
    code
  xhci: Move xhci MSI sync function to to xhci-pci

Mathias Nyman (1):
  xhci: dbc: Provide sysfs option to configure dbc descriptors

 .../testing/sysfs-bus-pci-drivers-xhci_hcd    |  52 +++++
 drivers/usb/host/xhci-dbgcap.c                | 191 ++++++++++++++++-
 drivers/usb/host/xhci-dbgcap.h                |   4 +
 drivers/usb/host/xhci-mem.c                   |  83 +++----
 drivers/usb/host/xhci-pci.c                   | 199 +++++++++++++++++
 drivers/usb/host/xhci-ring.c                  |   1 +
 drivers/usb/host/xhci-trace.c                 |   1 +
 drivers/usb/host/xhci.c                       | 202 +-----------------
 drivers/usb/host/xhci.h                       |   1 +
 9 files changed, 480 insertions(+), 254 deletions(-)

-- 
2.25.1


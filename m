Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B9C550DDFF
	for <lists+linux-usb@lfdr.de>; Mon, 25 Apr 2022 12:35:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232242AbiDYKii (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 25 Apr 2022 06:38:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235863AbiDYKi0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 25 Apr 2022 06:38:26 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55B7BCB
        for <linux-usb@vger.kernel.org>; Mon, 25 Apr 2022 03:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650882920; x=1682418920;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=LhOqtA3q2kNYzVkIPotpeA0BKeo527F7zQ7EuGKdu84=;
  b=h8uwbbwuvVU8J9H+P/aBp+dW9eCDjggcyvVjE8efv8IIc/WluUvSjct+
   +KhE1GIVlQ58IDkDuMpd5o+kOGgmsq1LmAUfPTg0ka7o0ngKBBhikuFHQ
   ski0K4tE1+ePK148PSi2V++tFev34+7PJaGZsNBQ/6AmSSqG6ArWIbwJI
   z/VziJxFUCitqR/GxdLooAIVaz92qqTTWr5D9b2SL8iG+VkXks8fmMkz7
   49+t0X6pb2gxN2UH+ITbdqfsWhEdnMKWgMI52CXgqcB//GXf1Nv2wq/Zr
   a5Kl63MB+JV11iWTnLyVdRSODlzCKLyvNXi1GIo6gUI2dckM7nPZTa1vQ
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10327"; a="351658143"
X-IronPort-AV: E=Sophos;i="5.90,287,1643702400"; 
   d="scan'208";a="351658143"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2022 03:35:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,287,1643702400"; 
   d="scan'208";a="704503651"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 25 Apr 2022 03:35:18 -0700
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: [PATCH] usb: dwc3: pci: add support for the Intel Meteor Lake-P
Date:   Mon, 25 Apr 2022 13:35:18 +0300
Message-Id: <20220425103518.44028-1-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch adds the necessary PCI IDs for Intel Meteor Lake-P
devices.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/dwc3/dwc3-pci.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-pci.c b/drivers/usb/dwc3/dwc3-pci.c
index 33f657d832460..2e19e0e4ea538 100644
--- a/drivers/usb/dwc3/dwc3-pci.c
+++ b/drivers/usb/dwc3/dwc3-pci.c
@@ -45,6 +45,8 @@
 #define PCI_DEVICE_ID_INTEL_ADLM		0x54ee
 #define PCI_DEVICE_ID_INTEL_ADLS		0x7ae1
 #define PCI_DEVICE_ID_INTEL_RPLS		0x7a61
+#define PCI_DEVICE_ID_INTEL_MTLP		0x7ec1
+#define PCI_DEVICE_ID_INTEL_MTL			0x7e7e
 #define PCI_DEVICE_ID_INTEL_TGL			0x9a15
 #define PCI_DEVICE_ID_AMD_MR			0x163a
 
@@ -456,6 +458,12 @@ static const struct pci_device_id dwc3_pci_id_table[] = {
 	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_RPLS),
 	  (kernel_ulong_t) &dwc3_pci_intel_swnode, },
 
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_MTLP),
+	  (kernel_ulong_t) &dwc3_pci_intel_swnode, },
+
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_MTL),
+	  (kernel_ulong_t) &dwc3_pci_intel_swnode, },
+
 	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_TGL),
 	  (kernel_ulong_t) &dwc3_pci_intel_swnode, },
 
-- 
2.35.1


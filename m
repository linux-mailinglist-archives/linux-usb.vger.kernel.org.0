Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2DBBF697D2C
	for <lists+linux-usb@lfdr.de>; Wed, 15 Feb 2023 14:26:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229487AbjBON0p (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Feb 2023 08:26:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232363AbjBON0n (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Feb 2023 08:26:43 -0500
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9498E39B95
        for <linux-usb@vger.kernel.org>; Wed, 15 Feb 2023 05:26:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676467593; x=1708003593;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=YaL9//kTR1+jf6OjfJY9LAJU5eDvWRxcX7K7GQkquLc=;
  b=CVb6mQE1tyX9oRO8b/ApLg/hxVgsYveXvpGxRGr4TQEF7Ik+bCabMlXW
   vTu4LAotBVshE2Cfl9EqRq8tEQB69dwaFlt/sj9o/osJW15ZO53yTJsiW
   EyAzerzDpSgB8AavHUStF4d9mx9vQ7kxXJg4kYbPCC6XcXdQI5b41kI+L
   jolbB8JVP5fO+7Ht/r8GurabwuKp7S5IkuzTwUgzqjPNgfE0yVLGsusKj
   0AMqoIUoOTeR09y/rk3ndUk+9LFUPpOWPHUza8HwPV+0MkK4H5DfQqef7
   d7Eeqrj+31o9jj1x8uwr7sU2j6YyIR1FiiZrNoUnAh8Wd0xAmrz3VACHn
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="319460464"
X-IronPort-AV: E=Sophos;i="5.97,299,1669104000"; 
   d="scan'208";a="319460464"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2023 05:26:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="812442098"
X-IronPort-AV: E=Sophos;i="5.97,299,1669104000"; 
   d="scan'208";a="812442098"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 15 Feb 2023 05:26:31 -0800
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>, linux-usb@vger.kernel.org
Subject: [PATCH v2] usb: dwc3: pci: add support for the Intel Meteor Lake-M
Date:   Wed, 15 Feb 2023 15:27:11 +0200
Message-Id: <20230215132711.35668-1-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch adds the necessary PCI IDs for Intel Meteor Lake-M
devices.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: stable@vger.kernel.org
---
Changed since v1: Added the stable tag.

---
 drivers/usb/dwc3/dwc3-pci.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-pci.c b/drivers/usb/dwc3/dwc3-pci.c
index 89c9ab2b19f85..a23ddbb819795 100644
--- a/drivers/usb/dwc3/dwc3-pci.c
+++ b/drivers/usb/dwc3/dwc3-pci.c
@@ -47,6 +47,7 @@
 #define PCI_DEVICE_ID_INTEL_ADLS		0x7ae1
 #define PCI_DEVICE_ID_INTEL_RPL			0xa70e
 #define PCI_DEVICE_ID_INTEL_RPLS		0x7a61
+#define PCI_DEVICE_ID_INTEL_MTLM		0x7eb1
 #define PCI_DEVICE_ID_INTEL_MTLP		0x7ec1
 #define PCI_DEVICE_ID_INTEL_MTL			0x7e7e
 #define PCI_DEVICE_ID_INTEL_TGL			0x9a15
@@ -467,6 +468,9 @@ static const struct pci_device_id dwc3_pci_id_table[] = {
 	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_RPLS),
 	  (kernel_ulong_t) &dwc3_pci_intel_swnode, },
 
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_MTLM),
+	  (kernel_ulong_t) &dwc3_pci_intel_swnode, },
+
 	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_MTLP),
 	  (kernel_ulong_t) &dwc3_pci_intel_swnode, },
 
-- 
2.39.1


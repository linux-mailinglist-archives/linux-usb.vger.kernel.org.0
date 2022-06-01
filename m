Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 75DA053B027
	for <lists+linux-usb@lfdr.de>; Thu,  2 Jun 2022 00:51:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232214AbiFAWlR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Jun 2022 18:41:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232212AbiFAWlQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 1 Jun 2022 18:41:16 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54F4C267CED
        for <linux-usb@vger.kernel.org>; Wed,  1 Jun 2022 15:41:15 -0700 (PDT)
X-IronPort-AV: E=McAfee;i="6400,9594,10365"; a="255622610"
X-IronPort-AV: E=Sophos;i="5.91,269,1647327600"; 
   d="scan'208";a="255622610"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2022 15:41:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,269,1647327600"; 
   d="scan'208";a="667659224"
Received: from otc-chromeosbuild-5.ostc.intel.com (HELO otc-chromeosbuild-5.intel.com) ([10.54.29.149])
  by FMSMGA003.fm.intel.com with ESMTP; 01 Jun 2022 15:41:04 -0700
From:   George D Sworo <gdsworo@vger.kernel.org>
To:     mika.westerberg@linux.intel.com
Cc:     linux-usb@vger.kernel.org,
        George D Sworo <george.d.sworo@intel.com>
Subject: [PATCH] thunderbolt: Add support for Intel Raptor Lake
Date:   Wed,  1 Jun 2022 15:41:02 -0700
Message-Id: <20220601224102.15266-1-george.d.sworo@intel.com>
X-Mailer: git-send-email 2.17.1
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: George D Sworo <george.d.sworo@intel.com>

 Raptor Lake has the same integrated Thunderbolt/USB4 controller as
 Intel Alder Lake. By default it is still using firmware based
 connection manager so we can use most of the Alder Lake flows.

Signed-off-by: George D Sworo <george.d.sworo@intel.com>
Change-Id: Ida8d0876913baa1ffb3c0bc888d6503f3175406e
---
 drivers/thunderbolt/icm.c | 2 ++
 drivers/thunderbolt/nhi.c | 4 ++++
 drivers/thunderbolt/nhi.h | 2 ++
 3 files changed, 8 insertions(+)

diff --git a/drivers/thunderbolt/icm.c b/drivers/thunderbolt/icm.c
index fff0c740c8f3..ae38f0d25a8d 100644
--- a/drivers/thunderbolt/icm.c
+++ b/drivers/thunderbolt/icm.c
@@ -2516,6 +2516,8 @@ struct tb *icm_probe(struct tb_nhi *nhi)
 	case PCI_DEVICE_ID_INTEL_TGL_H_NHI1:
 	case PCI_DEVICE_ID_INTEL_ADL_NHI0:
 	case PCI_DEVICE_ID_INTEL_ADL_NHI1:
+	case PCI_DEVICE_ID_INTEL_RPL_NHI0:
+	case PCI_DEVICE_ID_INTEL_RPL_NHI1:
 		icm->is_supported = icm_tgl_is_supported;
 		icm->driver_ready = icm_icl_driver_ready;
 		icm->set_uuid = icm_icl_set_uuid;
diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
index 4a582183f675..b488c1b945bc 100644
--- a/drivers/thunderbolt/nhi.c
+++ b/drivers/thunderbolt/nhi.c
@@ -1366,6 +1366,10 @@ static struct pci_device_id nhi_ids[] = {
 	  .driver_data = (kernel_ulong_t)&icl_nhi_ops },
 	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_ADL_NHI1),
 	  .driver_data = (kernel_ulong_t)&icl_nhi_ops },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_RPL_NHI0),
+	  .driver_data = (kernel_ulong_t)&icl_nhi_ops },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_RPL_NHI1),
+	  .driver_data = (kernel_ulong_t)&icl_nhi_ops },
 
 	/* Any USB4 compliant host */
 	{ PCI_DEVICE_CLASS(PCI_CLASS_SERIAL_USB_USB4, ~0) },
diff --git a/drivers/thunderbolt/nhi.h b/drivers/thunderbolt/nhi.h
index 69083aab2736..a0f843a6e219 100644
--- a/drivers/thunderbolt/nhi.h
+++ b/drivers/thunderbolt/nhi.h
@@ -72,6 +72,8 @@ extern const struct tb_nhi_ops icl_nhi_ops;
 #define PCI_DEVICE_ID_INTEL_TITAN_RIDGE_4C_BRIDGE	0x15ea
 #define PCI_DEVICE_ID_INTEL_TITAN_RIDGE_4C_NHI		0x15eb
 #define PCI_DEVICE_ID_INTEL_TITAN_RIDGE_DD_BRIDGE	0x15ef
+#define PCI_DEVICE_ID_INTEL_RPL_NHI0			0xa73e
+#define PCI_DEVICE_ID_INTEL_RPL_NHI1			0xa76d
 #define PCI_DEVICE_ID_INTEL_ADL_NHI0			0x463e
 #define PCI_DEVICE_ID_INTEL_ADL_NHI1			0x466d
 #define PCI_DEVICE_ID_INTEL_ICL_NHI1			0x8a0d
-- 
2.17.1


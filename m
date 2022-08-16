Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 832BD595A36
	for <lists+linux-usb@lfdr.de>; Tue, 16 Aug 2022 13:33:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234049AbiHPLcy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 16 Aug 2022 07:32:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234665AbiHPLch (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 16 Aug 2022 07:32:37 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99B48C8
        for <linux-usb@vger.kernel.org>; Tue, 16 Aug 2022 03:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660647104; x=1692183104;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=g5AM6AEEbciWTavAPpf9QV8G/ZYSCWe9A9weYuujhsY=;
  b=CoC5eWt67E7BjFryDdETd4DM1Zc/3pEXd8wiKgvjWAfjMyllIjdIFa6t
   g8Nz7zYeCB82pmONEmV5NHASVvnfuJWI9iHHNlPWoPhGzASQdxlWGNoOY
   oEfck+VnHXA8uumyKjEErUPx3gZ9Dry6g71ZNVXDZgGZWz2t5L+LOssWn
   fHZxxJzspzUOSeqgsLIZHntVLILov9F59IdrbAsSHhgSL/bVy+VzJyH5F
   Kb8C6Ah1Zc57FXYL1f80hTpt8bqiUFYC8Ra+3fbntjYMWBVQgBIfkTp33
   R01d6Qah9IGhg6ULtOB2KBOu8NaoVUD0VC70kUcCfV7LiwguZp9chkGZy
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10440"; a="275240208"
X-IronPort-AV: E=Sophos;i="5.93,240,1654585200"; 
   d="scan'208";a="275240208"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2022 03:51:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,240,1654585200"; 
   d="scan'208";a="606987229"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga002.jf.intel.com with ESMTP; 16 Aug 2022 03:51:33 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id CA49A2D5; Tue, 16 Aug 2022 13:51:46 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        utkarsh.h.patel@intel.com,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 2/2] thunderbolt: Add support for Intel Meteor Lake
Date:   Tue, 16 Aug 2022 13:51:46 +0300
Message-Id: <20220816105146.72098-2-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220816105146.72098-1-mika.westerberg@linux.intel.com>
References: <20220816105146.72098-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Intel Meteor Lake has the same integrated Thunderbolt/USB4 controller as
Intel Alder Lake. Add the Intel Meteor Lake PCI IDs to the driver list
of supported devices.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/icm.c | 3 +++
 drivers/thunderbolt/nhi.c | 6 ++++++
 drivers/thunderbolt/nhi.h | 3 +++
 3 files changed, 12 insertions(+)

diff --git a/drivers/thunderbolt/icm.c b/drivers/thunderbolt/icm.c
index ae38f0d25a8d..c01f2c3052c3 100644
--- a/drivers/thunderbolt/icm.c
+++ b/drivers/thunderbolt/icm.c
@@ -2518,6 +2518,9 @@ struct tb *icm_probe(struct tb_nhi *nhi)
 	case PCI_DEVICE_ID_INTEL_ADL_NHI1:
 	case PCI_DEVICE_ID_INTEL_RPL_NHI0:
 	case PCI_DEVICE_ID_INTEL_RPL_NHI1:
+	case PCI_DEVICE_ID_INTEL_MTL_M_NHI0:
+	case PCI_DEVICE_ID_INTEL_MTL_P_NHI0:
+	case PCI_DEVICE_ID_INTEL_MTL_P_NHI1:
 		icm->is_supported = icm_tgl_is_supported;
 		icm->driver_ready = icm_icl_driver_ready;
 		icm->set_uuid = icm_icl_set_uuid;
diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
index 8b8b5a8bd9b2..75c8bfdeb1fe 100644
--- a/drivers/thunderbolt/nhi.c
+++ b/drivers/thunderbolt/nhi.c
@@ -1415,6 +1415,12 @@ static struct pci_device_id nhi_ids[] = {
 	  .driver_data = (kernel_ulong_t)&icl_nhi_ops },
 	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_RPL_NHI1),
 	  .driver_data = (kernel_ulong_t)&icl_nhi_ops },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_MTL_M_NHI0),
+	  .driver_data = (kernel_ulong_t)&icl_nhi_ops },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_MTL_P_NHI0),
+	  .driver_data = (kernel_ulong_t)&icl_nhi_ops },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_MTL_P_NHI1),
+	  .driver_data = (kernel_ulong_t)&icl_nhi_ops },
 
 	/* Any USB4 compliant host */
 	{ PCI_DEVICE_CLASS(PCI_CLASS_SERIAL_USB_USB4, ~0) },
diff --git a/drivers/thunderbolt/nhi.h b/drivers/thunderbolt/nhi.h
index f09da5b62233..c64e1641ac8d 100644
--- a/drivers/thunderbolt/nhi.h
+++ b/drivers/thunderbolt/nhi.h
@@ -74,6 +74,9 @@ extern const struct tb_nhi_ops icl_nhi_ops;
 #define PCI_DEVICE_ID_INTEL_TITAN_RIDGE_DD_BRIDGE	0x15ef
 #define PCI_DEVICE_ID_INTEL_ADL_NHI0			0x463e
 #define PCI_DEVICE_ID_INTEL_ADL_NHI1			0x466d
+#define PCI_DEVICE_ID_INTEL_MTL_M_NHI0			0x7eb2
+#define PCI_DEVICE_ID_INTEL_MTL_P_NHI0			0x7ec2
+#define PCI_DEVICE_ID_INTEL_MTL_P_NHI1			0x7ec3
 #define PCI_DEVICE_ID_INTEL_ICL_NHI1			0x8a0d
 #define PCI_DEVICE_ID_INTEL_ICL_NHI0			0x8a17
 #define PCI_DEVICE_ID_INTEL_TGL_NHI0			0x9a1b
-- 
2.35.1


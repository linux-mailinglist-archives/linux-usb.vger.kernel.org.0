Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40A5739DA76
	for <lists+linux-usb@lfdr.de>; Mon,  7 Jun 2021 13:00:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231281AbhFGLCF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Jun 2021 07:02:05 -0400
Received: from mga01.intel.com ([192.55.52.88]:32027 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231160AbhFGLCE (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 7 Jun 2021 07:02:04 -0400
IronPort-SDR: lTVzP93gU1O5msTVMb6u1H8Rq5DpK6zQFKiL4wVkdgDBq6o5YXUqFT6e1J8JJ0iFQIdjxntBNB
 5ukGGYeyZHPA==
X-IronPort-AV: E=McAfee;i="6200,9189,10007"; a="225934234"
X-IronPort-AV: E=Sophos;i="5.83,254,1616482800"; 
   d="scan'208";a="225934234"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2021 04:00:12 -0700
IronPort-SDR: d5y8M/iCBvC69Xxyva2d3Nb9fTOXb+nSo8Yw2Xub0I+6lwDRgfjZziUXybi8M/QwcQUBDYDGvm
 nKTMQe6q8nVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,254,1616482800"; 
   d="scan'208";a="551850265"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 07 Jun 2021 04:00:09 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 83FA8314; Mon,  7 Jun 2021 14:00:30 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        kernel test robot <lkp@intel.com>,
        Gil Fine <gil.fine@intel.com>,
        Azhar Shaikh <azhar.shaikh@intel.com>
Subject: [PATCH 5/5] thunderbolt: Add support for Intel Alder Lake
Date:   Mon,  7 Jun 2021 14:00:30 +0300
Message-Id: <20210607110030.38664-6-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210607110030.38664-1-mika.westerberg@linux.intel.com>
References: <20210607110030.38664-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Azhar Shaikh <azhar.shaikh@intel.com>

Alder Lake has the same integrated Thunderbolt/USB4 controller as
Intel Tiger Lake. By default it is still using firmware based connection
manager so we can use most of the Tiger Lake flows.

Add the Alder Lake PCI IDs to the driver list of supported devices.

Signed-off-by: Azhar Shaikh <azhar.shaikh@intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/icm.c | 2 ++
 drivers/thunderbolt/nhi.c | 4 ++++
 drivers/thunderbolt/nhi.h | 2 ++
 3 files changed, 8 insertions(+)

diff --git a/drivers/thunderbolt/icm.c b/drivers/thunderbolt/icm.c
index 0f25cf9fe519..6255f1ef9599 100644
--- a/drivers/thunderbolt/icm.c
+++ b/drivers/thunderbolt/icm.c
@@ -2509,6 +2509,8 @@ struct tb *icm_probe(struct tb_nhi *nhi)
 	case PCI_DEVICE_ID_INTEL_TGL_NHI1:
 	case PCI_DEVICE_ID_INTEL_TGL_H_NHI0:
 	case PCI_DEVICE_ID_INTEL_TGL_H_NHI1:
+	case PCI_DEVICE_ID_INTEL_ADL_NHI0:
+	case PCI_DEVICE_ID_INTEL_ADL_NHI1:
 		icm->is_supported = icm_tgl_is_supported;
 		icm->driver_ready = icm_icl_driver_ready;
 		icm->set_uuid = icm_icl_set_uuid;
diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
index 478bf6701145..fa44332845a1 100644
--- a/drivers/thunderbolt/nhi.c
+++ b/drivers/thunderbolt/nhi.c
@@ -1333,6 +1333,10 @@ static struct pci_device_id nhi_ids[] = {
 	  .driver_data = (kernel_ulong_t)&icl_nhi_ops },
 	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_TGL_H_NHI1),
 	  .driver_data = (kernel_ulong_t)&icl_nhi_ops },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_ADL_NHI0),
+	  .driver_data = (kernel_ulong_t)&icl_nhi_ops },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_ADL_NHI1),
+	  .driver_data = (kernel_ulong_t)&icl_nhi_ops },
 
 	/* Any USB4 compliant host */
 	{ PCI_DEVICE_CLASS(PCI_CLASS_SERIAL_USB_USB4, ~0) },
diff --git a/drivers/thunderbolt/nhi.h b/drivers/thunderbolt/nhi.h
index 69770beca792..69083aab2736 100644
--- a/drivers/thunderbolt/nhi.h
+++ b/drivers/thunderbolt/nhi.h
@@ -72,6 +72,8 @@ extern const struct tb_nhi_ops icl_nhi_ops;
 #define PCI_DEVICE_ID_INTEL_TITAN_RIDGE_4C_BRIDGE	0x15ea
 #define PCI_DEVICE_ID_INTEL_TITAN_RIDGE_4C_NHI		0x15eb
 #define PCI_DEVICE_ID_INTEL_TITAN_RIDGE_DD_BRIDGE	0x15ef
+#define PCI_DEVICE_ID_INTEL_ADL_NHI0			0x463e
+#define PCI_DEVICE_ID_INTEL_ADL_NHI1			0x466d
 #define PCI_DEVICE_ID_INTEL_ICL_NHI1			0x8a0d
 #define PCI_DEVICE_ID_INTEL_ICL_NHI0			0x8a17
 #define PCI_DEVICE_ID_INTEL_TGL_NHI0			0x9a1b
-- 
2.30.2


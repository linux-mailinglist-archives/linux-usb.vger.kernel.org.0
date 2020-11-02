Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB62D2A2F46
	for <lists+linux-usb@lfdr.de>; Mon,  2 Nov 2020 17:07:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726739AbgKBQGY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 2 Nov 2020 11:06:24 -0500
Received: from mga01.intel.com ([192.55.52.88]:11906 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727207AbgKBQGW (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 2 Nov 2020 11:06:22 -0500
IronPort-SDR: 2hCclloUiIBWlpdgZhg29CN9wsNsBj8SU4hcfDNBLmc0Gjupv52AjtSpB/0zodNaNdqEXW37ZP
 Tg6lM2LcH/eA==
X-IronPort-AV: E=McAfee;i="6000,8403,9793"; a="186741717"
X-IronPort-AV: E=Sophos;i="5.77,445,1596524400"; 
   d="scan'208";a="186741717"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2020 08:06:20 -0800
IronPort-SDR: pzeMJ8Ka2GVXpFiOpPpkMPk1di367FVqgWEBAAVLV6F+P4HNhAc9nvB6es7VJFFKhZ73+Ck7IO
 0CBrxZDo6r4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,445,1596524400"; 
   d="scan'208";a="538072759"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga005.jf.intel.com with ESMTP; 02 Nov 2020 08:06:18 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 0AB381D7; Mon,  2 Nov 2020 18:06:17 +0200 (EET)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Lukas Wunner <lukas@wunner.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH] thunderbolt: Add support for Intel Tiger Lake-H
Date:   Mon,  2 Nov 2020 19:06:17 +0300
Message-Id: <20201102160617.40101-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Intel Tiger Lake-H has the same Thunderbolt/USB4 controller as Tiger
Lake-LP. Add the Tiger Lake-H PCI IDs to the driver list of supported
devices.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/icm.c | 2 ++
 drivers/thunderbolt/nhi.c | 4 ++++
 drivers/thunderbolt/nhi.h | 2 ++
 drivers/thunderbolt/tb.h  | 2 ++
 4 files changed, 10 insertions(+)

diff --git a/drivers/thunderbolt/icm.c b/drivers/thunderbolt/icm.c
index b51fc3f62b1f..977ba91f4d0e 100644
--- a/drivers/thunderbolt/icm.c
+++ b/drivers/thunderbolt/icm.c
@@ -2284,6 +2284,8 @@ struct tb *icm_probe(struct tb_nhi *nhi)
 
 	case PCI_DEVICE_ID_INTEL_TGL_NHI0:
 	case PCI_DEVICE_ID_INTEL_TGL_NHI1:
+	case PCI_DEVICE_ID_INTEL_TGL_H_NHI0:
+	case PCI_DEVICE_ID_INTEL_TGL_H_NHI1:
 		icm->is_supported = icm_tgl_is_supported;
 		icm->driver_ready = icm_icl_driver_ready;
 		icm->set_uuid = icm_icl_set_uuid;
diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
index 3f79baa54829..d3b6178d841a 100644
--- a/drivers/thunderbolt/nhi.c
+++ b/drivers/thunderbolt/nhi.c
@@ -1334,6 +1334,10 @@ static struct pci_device_id nhi_ids[] = {
 	  .driver_data = (kernel_ulong_t)&icl_nhi_ops },
 	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_TGL_NHI1),
 	  .driver_data = (kernel_ulong_t)&icl_nhi_ops },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_TGL_H_NHI0),
+	  .driver_data = (kernel_ulong_t)&icl_nhi_ops },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_TGL_H_NHI1),
+	  .driver_data = (kernel_ulong_t)&icl_nhi_ops },
 
 	/* Any USB4 compliant host */
 	{ PCI_DEVICE_CLASS(PCI_CLASS_SERIAL_USB_USB4, ~0) },
diff --git a/drivers/thunderbolt/nhi.h b/drivers/thunderbolt/nhi.h
index 80162e4b013f..4e0861d75072 100644
--- a/drivers/thunderbolt/nhi.h
+++ b/drivers/thunderbolt/nhi.h
@@ -75,6 +75,8 @@ extern const struct tb_nhi_ops icl_nhi_ops;
 #define PCI_DEVICE_ID_INTEL_ICL_NHI0			0x8a17
 #define PCI_DEVICE_ID_INTEL_TGL_NHI0			0x9a1b
 #define PCI_DEVICE_ID_INTEL_TGL_NHI1			0x9a1d
+#define PCI_DEVICE_ID_INTEL_TGL_H_NHI0			0x9a1f
+#define PCI_DEVICE_ID_INTEL_TGL_H_NHI1			0x9a21
 
 #define PCI_CLASS_SERIAL_USB_USB4			0x0c0340
 
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index a9995e21b916..8ea360b0ff77 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -784,6 +784,8 @@ static inline bool tb_switch_is_tiger_lake(const struct tb_switch *sw)
 		switch (sw->config.device_id) {
 		case PCI_DEVICE_ID_INTEL_TGL_NHI0:
 		case PCI_DEVICE_ID_INTEL_TGL_NHI1:
+		case PCI_DEVICE_ID_INTEL_TGL_H_NHI0:
+		case PCI_DEVICE_ID_INTEL_TGL_H_NHI1:
 			return true;
 		}
 	}
-- 
2.28.0


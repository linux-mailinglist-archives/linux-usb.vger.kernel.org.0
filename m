Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B45631AC0C3
	for <lists+linux-usb@lfdr.de>; Thu, 16 Apr 2020 14:09:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2635045AbgDPMIn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 Apr 2020 08:08:43 -0400
Received: from mga11.intel.com ([192.55.52.93]:29180 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2635001AbgDPMIa (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 16 Apr 2020 08:08:30 -0400
IronPort-SDR: E1iakBb6sEnUqIiAPZIiBMIYJbMBsvcriHPcPXBW2YR74CV9lAEYzbhxYXBM5xmZABQIIIdoqu
 tGKjYtksVrTg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2020 05:08:28 -0700
IronPort-SDR: H2+fcalK0Fx1fCumrEqaV1I1v27iCIhBVQ4pLCaiuwyVFjbhq2Ch6hKdcY97Cs8UQ0hSrtRIG0
 e0nJ95nxPDzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,390,1580803200"; 
   d="scan'208";a="253839666"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga003.jf.intel.com with ESMTP; 16 Apr 2020 05:08:26 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 0897919C; Thu, 16 Apr 2020 15:08:25 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Lukas Wunner <lukas@wunner.de>
Subject: [PATCH] thunderbolt: Add support for Intel Tiger Lake
Date:   Thu, 16 Apr 2020 15:08:25 +0300
Message-Id: <20200416120825.65013-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Tiger Lake integrated Thunderbolt/USB4 controller is quite close to
Intel Ice Lake. By default it is still using firmware based connection
manager so we can use most of the Ice Lake flows in Tiger Lake as well.
We check if the firmware connection manager is running and in that case
use it, otherwise use the software based connection manager.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/icm.c | 22 ++++++++++++++++++++++
 drivers/thunderbolt/nhi.c |  4 ++++
 drivers/thunderbolt/nhi.h |  2 ++
 3 files changed, 28 insertions(+)

diff --git a/drivers/thunderbolt/icm.c b/drivers/thunderbolt/icm.c
index fbbe32ca1e69..ffcc8c3459e5 100644
--- a/drivers/thunderbolt/icm.c
+++ b/drivers/thunderbolt/icm.c
@@ -1633,6 +1633,15 @@ static void icm_icl_rtd3_veto(struct tb *tb, const struct icm_pkg_header *hdr)
 		icm_veto_end(tb);
 }
 
+static bool icm_tgl_is_supported(struct tb *tb)
+{
+	/*
+	 * If the firmware is not running use software CM. This platform
+	 * should fully support both.
+	 */
+	return icm_firmware_running(tb->nhi);
+}
+
 static void icm_handle_notification(struct work_struct *work)
 {
 	struct icm_notification *n = container_of(work, typeof(*n), work);
@@ -2269,6 +2278,19 @@ struct tb *icm_probe(struct tb_nhi *nhi)
 		icm->rtd3_veto = icm_icl_rtd3_veto;
 		tb->cm_ops = &icm_icl_ops;
 		break;
+
+	case PCI_DEVICE_ID_INTEL_TGL_NHI0:
+	case PCI_DEVICE_ID_INTEL_TGL_NHI1:
+		icm->is_supported = icm_tgl_is_supported;
+		icm->driver_ready = icm_icl_driver_ready;
+		icm->set_uuid = icm_icl_set_uuid;
+		icm->device_connected = icm_icl_device_connected;
+		icm->device_disconnected = icm_tr_device_disconnected;
+		icm->xdomain_connected = icm_tr_xdomain_connected;
+		icm->xdomain_disconnected = icm_tr_xdomain_disconnected;
+		icm->rtd3_veto = icm_icl_rtd3_veto;
+		tb->cm_ops = &icm_icl_ops;
+		break;
 	}
 
 	if (!icm->is_supported || !icm->is_supported(tb)) {
diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
index 1be491ecbb45..2e51d06e8e8d 100644
--- a/drivers/thunderbolt/nhi.c
+++ b/drivers/thunderbolt/nhi.c
@@ -1270,6 +1270,10 @@ static struct pci_device_id nhi_ids[] = {
 	  .driver_data = (kernel_ulong_t)&icl_nhi_ops },
 	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_ICL_NHI1),
 	  .driver_data = (kernel_ulong_t)&icl_nhi_ops },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_TGL_NHI0),
+	  .driver_data = (kernel_ulong_t)&icl_nhi_ops },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_TGL_NHI1),
+	  .driver_data = (kernel_ulong_t)&icl_nhi_ops },
 
 	/* Any USB4 compliant host */
 	{ PCI_DEVICE_CLASS(PCI_CLASS_SERIAL_USB_USB4, ~0) },
diff --git a/drivers/thunderbolt/nhi.h b/drivers/thunderbolt/nhi.h
index 5d276ee9b38e..80162e4b013f 100644
--- a/drivers/thunderbolt/nhi.h
+++ b/drivers/thunderbolt/nhi.h
@@ -73,6 +73,8 @@ extern const struct tb_nhi_ops icl_nhi_ops;
 #define PCI_DEVICE_ID_INTEL_TITAN_RIDGE_DD_BRIDGE	0x15ef
 #define PCI_DEVICE_ID_INTEL_ICL_NHI1			0x8a0d
 #define PCI_DEVICE_ID_INTEL_ICL_NHI0			0x8a17
+#define PCI_DEVICE_ID_INTEL_TGL_NHI0			0x9a1b
+#define PCI_DEVICE_ID_INTEL_TGL_NHI1			0x9a1d
 
 #define PCI_CLASS_SERIAL_USB_USB4			0x0c0340
 
-- 
2.25.1


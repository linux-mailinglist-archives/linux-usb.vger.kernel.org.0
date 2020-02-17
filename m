Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A14316150D
	for <lists+linux-usb@lfdr.de>; Mon, 17 Feb 2020 15:49:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729179AbgBQOtS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 Feb 2020 09:49:18 -0500
Received: from mga03.intel.com ([134.134.136.65]:14573 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728841AbgBQOtS (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 17 Feb 2020 09:49:18 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 17 Feb 2020 06:49:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,453,1574150400"; 
   d="scan'208";a="348510134"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 17 Feb 2020 06:49:16 -0800
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Ajay Gupta <ajayg@nvidia.com>,
        Colin Ian King <colin.king@canonical.com>,
        linux-usb@vger.kernel.org
Subject: [PATCH 1/3] usb: typec: ucsi: register DP only for NVIDIA DP VDO
Date:   Mon, 17 Feb 2020 17:49:11 +0300
Message-Id: <20200217144913.55330-2-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200217144913.55330-1-heikki.krogerus@linux.intel.com>
References: <20200217144913.55330-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Ajay Gupta <ajayg@nvidia.com>

NVIDIA VirtualLink (svid 0x955) has two altmode, vdo=0x1 for
VirtualLink DP mode and vdo=0x3 for NVIDIA test mode.
Register display altmode driver only for vdo=0x1

Signed-off-by: Ajay Gupta <ajayg@nvidia.com>
Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/ucsi/ucsi.c | 12 ++++++++++--
 drivers/usb/typec/ucsi/ucsi.h |  7 +++++++
 2 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index d5a6aac86327..eca9d598a42f 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -270,9 +270,16 @@ static int ucsi_register_altmode(struct ucsi_connector *con,
 
 		switch (desc->svid) {
 		case USB_TYPEC_DP_SID:
-		case USB_TYPEC_NVIDIA_VLINK_SID:
 			alt = ucsi_register_displayport(con, override, i, desc);
 			break;
+		case USB_TYPEC_NVIDIA_VLINK_SID:
+			if (desc->vdo == USB_TYPEC_NVIDIA_VLINK_DBG_VDO)
+				alt = typec_port_register_altmode(con->port,
+								  desc);
+			else
+				alt = ucsi_register_displayport(con, override,
+								i, desc);
+			break;
 		default:
 			alt = typec_port_register_altmode(con->port, desc);
 			break;
@@ -475,7 +482,8 @@ static void ucsi_unregister_altmodes(struct ucsi_connector *con, u8 recipient)
 	while (adev[i]) {
 		if (recipient == UCSI_RECIPIENT_SOP &&
 		    (adev[i]->svid == USB_TYPEC_DP_SID ||
-			adev[i]->svid == USB_TYPEC_NVIDIA_VLINK_SID)) {
+			(adev[i]->svid == USB_TYPEC_NVIDIA_VLINK_SID &&
+			adev[i]->vdo != USB_TYPEC_NVIDIA_VLINK_DBG_VDO))) {
 			pdev = typec_altmode_get_partner(adev[i]);
 			ucsi_displayport_remove_partner((void *)pdev);
 		}
diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index e434b9c9a9eb..a89112b69cd5 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -340,4 +340,11 @@ static inline void
 ucsi_displayport_remove_partner(struct typec_altmode *adev) { }
 #endif /* CONFIG_TYPEC_DP_ALTMODE */
 
+/*
+ * NVIDIA VirtualLink (svid 0x955) has two altmode. VirtualLink
+ * DP mode with vdo=0x1 and NVIDIA test mode with vdo=0x3
+ */
+#define USB_TYPEC_NVIDIA_VLINK_DP_VDO	0x1
+#define USB_TYPEC_NVIDIA_VLINK_DBG_VDO	0x3
+
 #endif /* __DRIVER_USB_TYPEC_UCSI_H */
-- 
2.25.0


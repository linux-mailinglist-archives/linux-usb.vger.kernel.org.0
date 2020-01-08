Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6EFE4134394
	for <lists+linux-usb@lfdr.de>; Wed,  8 Jan 2020 14:13:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727666AbgAHNNv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 Jan 2020 08:13:51 -0500
Received: from mga07.intel.com ([134.134.136.100]:59114 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727621AbgAHNNv (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 8 Jan 2020 08:13:51 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 08 Jan 2020 05:13:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,410,1571727600"; 
   d="scan'208";a="225901612"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 08 Jan 2020 05:13:49 -0800
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [PATCH 1/2] usb: typec: ucsi: Fix the notification bit offsets
Date:   Wed,  8 Jan 2020 16:13:46 +0300
Message-Id: <20200108131347.43217-2-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200108131347.43217-1-heikki.krogerus@linux.intel.com>
References: <20200108131347.43217-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The bit offsets for the Set Notification Enable command were
not considering the reserved bits in the middle.

Fixes: 470ce43a1a81 ("usb: typec: ucsi: Remove struct ucsi_control")
Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/ucsi/ucsi.h | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index 9e01a9556603..e434b9c9a9eb 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -99,15 +99,15 @@ void ucsi_connector_change(struct ucsi *ucsi, u8 num);
 #define UCSI_ENABLE_NTFY_CMD_COMPLETE		BIT(16)
 #define UCSI_ENABLE_NTFY_EXT_PWR_SRC_CHANGE	BIT(17)
 #define UCSI_ENABLE_NTFY_PWR_OPMODE_CHANGE	BIT(18)
-#define UCSI_ENABLE_NTFY_CAP_CHANGE		BIT(19)
-#define UCSI_ENABLE_NTFY_PWR_LEVEL_CHANGE	BIT(20)
-#define UCSI_ENABLE_NTFY_PD_RESET_COMPLETE	BIT(21)
-#define UCSI_ENABLE_NTFY_CAM_CHANGE		BIT(22)
-#define UCSI_ENABLE_NTFY_BAT_STATUS_CHANGE	BIT(23)
-#define UCSI_ENABLE_NTFY_PARTNER_CHANGE		BIT(24)
-#define UCSI_ENABLE_NTFY_PWR_DIR_CHANGE		BIT(25)
-#define UCSI_ENABLE_NTFY_CONNECTOR_CHANGE	BIT(26)
-#define UCSI_ENABLE_NTFY_ERROR			BIT(27)
+#define UCSI_ENABLE_NTFY_CAP_CHANGE		BIT(21)
+#define UCSI_ENABLE_NTFY_PWR_LEVEL_CHANGE	BIT(22)
+#define UCSI_ENABLE_NTFY_PD_RESET_COMPLETE	BIT(23)
+#define UCSI_ENABLE_NTFY_CAM_CHANGE		BIT(24)
+#define UCSI_ENABLE_NTFY_BAT_STATUS_CHANGE	BIT(25)
+#define UCSI_ENABLE_NTFY_PARTNER_CHANGE		BIT(27)
+#define UCSI_ENABLE_NTFY_PWR_DIR_CHANGE		BIT(28)
+#define UCSI_ENABLE_NTFY_CONNECTOR_CHANGE	BIT(30)
+#define UCSI_ENABLE_NTFY_ERROR			BIT(31)
 #define UCSI_ENABLE_NTFY_ALL			0xdbe70000
 
 /* SET_UOR command bits */
-- 
2.24.1


Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CDA39E1E64
	for <lists+linux-usb@lfdr.de>; Wed, 23 Oct 2019 16:40:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406039AbfJWOkL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 23 Oct 2019 10:40:11 -0400
Received: from mga12.intel.com ([192.55.52.136]:39214 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2405069AbfJWOkL (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 23 Oct 2019 10:40:11 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 23 Oct 2019 07:40:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,221,1569308400"; 
   d="scan'208";a="209934433"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 23 Oct 2019 07:40:09 -0700
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Guenter Roeck <linux@roeck-us.net>, Ajay Gupta <ajayg@nvidia.com>,
        linux-usb@vger.kernel.org
Subject: [PATCH v2 17/18] usb: typec: ucsi: New error codes
Date:   Wed, 23 Oct 2019 17:39:38 +0300
Message-Id: <20191023143939.39668-18-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191023143939.39668-1-heikki.krogerus@linux.intel.com>
References: <20191023143939.39668-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Adding new error codes to the driver that were introduced in
UCSI specification v1.1.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/ucsi/ucsi.c | 25 ++++++++++++++++++++-----
 drivers/usb/typec/ucsi/ucsi.h |  6 ++++++
 2 files changed, 26 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 6c6def96a55b..772f55c92ba3 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -86,18 +86,33 @@ static int ucsi_read_error(struct ucsi *ucsi)
 	case UCSI_ERROR_DEAD_BATTERY:
 		dev_warn(ucsi->dev, "Dead battery condition!\n");
 		return -EPERM;
-	/* The following mean a bug in this driver */
 	case UCSI_ERROR_INVALID_CON_NUM:
 	case UCSI_ERROR_UNREGONIZED_CMD:
 	case UCSI_ERROR_INVALID_CMD_ARGUMENT:
-		dev_err(ucsi->dev, "possible UCSI driver bug (0x%x)\n", error);
+		dev_err(ucsi->dev, "possible UCSI driver bug %u\n", error);
 		return -EINVAL;
+	case UCSI_ERROR_OVERCURRENT:
+		dev_warn(ucsi->dev, "Overcurrent condition\n");
+		break;
+	case UCSI_ERROR_PARTNER_REJECTED_SWAP:
+		dev_warn(ucsi->dev, "Partner rejected swap\n");
+		break;
+	case UCSI_ERROR_HARD_RESET:
+		dev_warn(ucsi->dev, "Hard reset occurred\n");
+		break;
+	case UCSI_ERROR_PPM_POLICY_CONFLICT:
+		dev_warn(ucsi->dev, "PPM Policy conflict\n");
+		break;
+	case UCSI_ERROR_SWAP_REJECTED:
+		dev_warn(ucsi->dev, "Swap rejected\n");
+		break;
+	case UCSI_ERROR_UNDEFINED:
 	default:
-		dev_err(ucsi->dev, "%s: error without status\n", __func__);
-		return -EIO;
+		dev_err(ucsi->dev, "unknown error %u\n", error);
+		break;
 	}
 
-	return 0;
+	return -EIO;
 }
 
 static int ucsi_exec_command(struct ucsi *ucsi, u64 cmd)
diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index bc2254e7a3a3..8569bbd3762f 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -133,6 +133,12 @@ void ucsi_connector_change(struct ucsi *ucsi, u8 num);
 #define UCSI_ERROR_CC_COMMUNICATION_ERR		BIT(4)
 #define UCSI_ERROR_DEAD_BATTERY			BIT(5)
 #define UCSI_ERROR_CONTRACT_NEGOTIATION_FAIL	BIT(6)
+#define UCSI_ERROR_OVERCURRENT			BIT(7)
+#define UCSI_ERROR_UNDEFINED			BIT(8)
+#define UCSI_ERROR_PARTNER_REJECTED_SWAP	BIT(9)
+#define UCSI_ERROR_HARD_RESET			BIT(10)
+#define UCSI_ERROR_PPM_POLICY_CONFLICT		BIT(11)
+#define UCSI_ERROR_SWAP_REJECTED		BIT(12)
 
 /* Data structure filled by PPM in response to GET_CAPABILITY command. */
 struct ucsi_capability {
-- 
2.23.0


Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 47CA4E1E65
	for <lists+linux-usb@lfdr.de>; Wed, 23 Oct 2019 16:40:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406323AbfJWOkN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 23 Oct 2019 10:40:13 -0400
Received: from mga12.intel.com ([192.55.52.136]:39214 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2405069AbfJWOkM (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 23 Oct 2019 10:40:12 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 23 Oct 2019 07:40:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,221,1569308400"; 
   d="scan'208";a="209934435"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 23 Oct 2019 07:40:11 -0700
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Guenter Roeck <linux@roeck-us.net>, Ajay Gupta <ajayg@nvidia.com>,
        linux-usb@vger.kernel.org
Subject: [PATCH v2 18/18] usb: typec: ucsi: Optimise ucsi_unregister()
Date:   Wed, 23 Oct 2019 17:39:39 +0300
Message-Id: <20191023143939.39668-19-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191023143939.39668-1-heikki.krogerus@linux.intel.com>
References: <20191023143939.39668-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

There is no need to reset the PPM when the interface is
unregistered. Quietly silencing the notifications and then
unregistering everything is enough. This speeds up
ucsi_unregister() a lot.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/ucsi/ucsi.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 772f55c92ba3..4459bc68aa33 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -1045,15 +1045,14 @@ EXPORT_SYMBOL_GPL(ucsi_register);
  */
 void ucsi_unregister(struct ucsi *ucsi)
 {
-	u64 command;
+	u64 cmd = UCSI_SET_NOTIFICATION_ENABLE;
 	int i;
 
 	/* Make sure that we are not in the middle of driver initialization */
 	cancel_work_sync(&ucsi->work);
 
-	/* Disable everything except command complete notification */
-	command = UCSI_SET_NOTIFICATION_ENABLE | UCSI_ENABLE_NTFY_CMD_COMPLETE;
-	ucsi_send_command(ucsi, command, NULL, 0);
+	/* Disable notifications */
+	ucsi->ops->async_write(ucsi, UCSI_CONTROL, &cmd, sizeof(cmd));
 
 	for (i = 0; i < ucsi->cap.num_connectors; i++) {
 		cancel_work_sync(&ucsi->connector[i].work);
@@ -1063,8 +1062,6 @@ void ucsi_unregister(struct ucsi *ucsi)
 		typec_unregister_port(ucsi->connector[i].port);
 	}
 
-	ucsi_reset_ppm(ucsi);
-
 	kfree(ucsi->connector);
 }
 EXPORT_SYMBOL_GPL(ucsi_unregister);
-- 
2.23.0


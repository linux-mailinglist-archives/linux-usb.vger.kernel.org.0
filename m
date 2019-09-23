Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 54DF3BB544
	for <lists+linux-usb@lfdr.de>; Mon, 23 Sep 2019 15:31:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407780AbfIWNbE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 23 Sep 2019 09:31:04 -0400
Received: from mga12.intel.com ([192.55.52.136]:41647 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404581AbfIWNbE (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 23 Sep 2019 09:31:04 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 23 Sep 2019 06:31:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,540,1559545200"; 
   d="scan'208";a="203127799"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 23 Sep 2019 06:31:02 -0700
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Ajay Gupta <ajayg@nvidia.com>
Cc:     linux-usb@vger.kernel.org
Subject: [RFC PATCH] usb: typec: ucsi: ccg: Remove run_isr flag
Date:   Mon, 23 Sep 2019 16:31:01 +0300
Message-Id: <20190923133101.30774-1-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

There is no need to try to prevent the extra ucsi_notify()
that runtime resuming the device will cause.

This fixes potential deadlock. Both ccg_read() and
ccg_write() are called with the mutex already taken at least
from ccg_send_command(). In ccg_read() and ccg_write, the
mutex is only acquired so that run_isr flag can be set.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
Hi Ajay,

Before going forward with this I would like to get confirmation from
you that it is OK, and that I'm not missing anything. I did not see
any real purpose for that run_isr flag. The only thing that I can see
it preventing is an extra ucsi_notify() call caused by the waking of
the controller, but that should not be a problem. Is there any other
reason why the flag is there?

If the driver works fine without the flag, then let's just drop it.
The deadlock will need to be fixed in any case.

thanks,

---
 drivers/usb/typec/ucsi/ucsi_ccg.c | 40 ++-----------------------------
 1 file changed, 2 insertions(+), 38 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
index 907e20e1a71e..167cb6367198 100644
--- a/drivers/usb/typec/ucsi/ucsi_ccg.c
+++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
@@ -195,7 +195,6 @@ struct ucsi_ccg {
 
 	/* fw build with vendor information */
 	u16 fw_build;
-	bool run_isr; /* flag to call ISR routine during resume */
 	struct work_struct pm_work;
 };
 
@@ -224,18 +223,6 @@ static int ccg_read(struct ucsi_ccg *uc, u16 rab, u8 *data, u32 len)
 	if (quirks && quirks->max_read_len)
 		max_read_len = quirks->max_read_len;
 
-	if (uc->fw_build == CCG_FW_BUILD_NVIDIA &&
-	    uc->fw_version <= CCG_OLD_FW_VERSION) {
-		mutex_lock(&uc->lock);
-		/*
-		 * Do not schedule pm_work to run ISR in
-		 * ucsi_ccg_runtime_resume() after pm_runtime_get_sync()
-		 * since we are already in ISR path.
-		 */
-		uc->run_isr = false;
-		mutex_unlock(&uc->lock);
-	}
-
 	pm_runtime_get_sync(uc->dev);
 	while (rem_len > 0) {
 		msgs[1].buf = &data[len - rem_len];
@@ -278,18 +265,6 @@ static int ccg_write(struct ucsi_ccg *uc, u16 rab, u8 *data, u32 len)
 	msgs[0].len = len + sizeof(rab);
 	msgs[0].buf = buf;
 
-	if (uc->fw_build == CCG_FW_BUILD_NVIDIA &&
-	    uc->fw_version <= CCG_OLD_FW_VERSION) {
-		mutex_lock(&uc->lock);
-		/*
-		 * Do not schedule pm_work to run ISR in
-		 * ucsi_ccg_runtime_resume() after pm_runtime_get_sync()
-		 * since we are already in ISR path.
-		 */
-		uc->run_isr = false;
-		mutex_unlock(&uc->lock);
-	}
-
 	pm_runtime_get_sync(uc->dev);
 	status = i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
 	if (status < 0) {
@@ -1130,7 +1105,6 @@ static int ucsi_ccg_probe(struct i2c_client *client,
 	uc->ppm.sync = ucsi_ccg_sync;
 	uc->dev = dev;
 	uc->client = client;
-	uc->run_isr = true;
 	mutex_init(&uc->lock);
 	INIT_WORK(&uc->work, ccg_update_firmware);
 	INIT_WORK(&uc->pm_work, ccg_pm_workaround_work);
@@ -1229,7 +1203,6 @@ static int ucsi_ccg_runtime_resume(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct ucsi_ccg *uc = i2c_get_clientdata(client);
-	bool schedule = true;
 
 	/*
 	 * Firmware version 3.1.10 or earlier, built for NVIDIA has known issue
@@ -1237,17 +1210,8 @@ static int ucsi_ccg_runtime_resume(struct device *dev)
 	 * Schedule a work to call ISR as a workaround.
 	 */
 	if (uc->fw_build == CCG_FW_BUILD_NVIDIA &&
-	    uc->fw_version <= CCG_OLD_FW_VERSION) {
-		mutex_lock(&uc->lock);
-		if (!uc->run_isr) {
-			uc->run_isr = true;
-			schedule = false;
-		}
-		mutex_unlock(&uc->lock);
-
-		if (schedule)
-			schedule_work(&uc->pm_work);
-	}
+	    uc->fw_version <= CCG_OLD_FW_VERSION)
+		schedule_work(&uc->pm_work);
 
 	return 0;
 }
-- 
2.23.0


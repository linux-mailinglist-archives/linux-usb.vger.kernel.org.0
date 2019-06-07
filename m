Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6FA2D39247
	for <lists+linux-usb@lfdr.de>; Fri,  7 Jun 2019 18:37:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730934AbfFGQhm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 7 Jun 2019 12:37:42 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:46118 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730923AbfFGQhl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 7 Jun 2019 12:37:41 -0400
Received: by mail-pl1-f193.google.com with SMTP id e5so1018624pls.13;
        Fri, 07 Jun 2019 09:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=8EaCuST2yV57W8sOHU9n8Jlf4i9O08nihXKi/p/Dm/A=;
        b=k/eCIfwbFK2uhUiIKDWwFrOTF+2cq4ByLcQKdvSU4QomVRwmLX4EndtFEUYjSmauq4
         f/hvRG4HRbKKc6Rt2M4NLHcbSyjrZhJk0WhS4P70S7mIc1Smfnr1UtFIqLEdX9oxDNWp
         AKzZuPtyDYPurh4j7y5ZC8y9T3eErOqHHDrjHZI+pBk+DvkhQXvyKPobtqnoucFKItO+
         J96zL6smLC1P+AuWDTfXSM7/8I6IuVvfTNPjwrkvtYcDKQJqBxJXxA+hRH4ZaYQ3A4Dd
         MQq3bT3MFiuUvJtMxfaFWuehhVnf15+MgjSgQRwSiIzqkLn8+r3OMo6h/Sc3crJUPqyH
         74eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=8EaCuST2yV57W8sOHU9n8Jlf4i9O08nihXKi/p/Dm/A=;
        b=ViffwvtHtF4oPPsrtZtkE+X08DdtCBSdl03vreQ2Qpsz3s2XFqC13Xdeqo4gW3L6vh
         hEKJmgq7Xf7WMeuYGcIXNccqgfiFXihZJdW22UF6EYNLM3abMTIOqOM6ZF8R3ITyQl9q
         RD1fHQRBRddEqdCCmyP8Or2tYcGdaMJp8m7Y9YtOTi0nIelvHrHjXXwwkRDwhQOzL4Dr
         0Kk2SOyVfTAqgwRVg8Vy3+KXlSeeM8+Qvo77tQ9d6COyE0G3F43ynNkNOz1YjfaF4+xL
         yJwxCXtqCDe42nf+aLYe5GVzUiGgXJV3IgmCIrxPCxOK9CFRk15IF/vYfJ/WqcLmAjVd
         vVtQ==
X-Gm-Message-State: APjAAAXqzl/r6/2k7W0puZwFZBgSmg9hvtJh7+hhw93u5axJJC3AlVT2
        UNCwXjdSKaA8D5mQnxUaesA=
X-Google-Smtp-Source: APXvYqyFdBEXFfRrw6Aqk9lL12ImToCH+zj3msHW+oTLSXu/d2k21LXvp51pY9xJsq4aoIA50tw9Wg==
X-Received: by 2002:a17:902:b70b:: with SMTP id d11mr57812601pls.84.1559925460737;
        Fri, 07 Jun 2019 09:37:40 -0700 (PDT)
Received: from ajayg.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
        by smtp.gmail.com with ESMTPSA id t2sm1745520pgj.39.2019.06.07.09.37.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Jun 2019 09:37:40 -0700 (PDT)
From:   Ajay Gupta <ajaykuee@gmail.com>
X-Google-Original-From: Ajay Gupta <ajayg@nvidia.com>
To:     heikki.krogerus@linux.intel.com, wsa@the-dreams.de
Cc:     linux-usb@vger.kernel.org, linux-i2c@vger.kernel.org,
        Ajay Gupta <ajayg@nvidia.com>
Subject: [PATCH v5 5/5] usb: typec: ucsi: ccg: add runtime pm workaround
Date:   Fri,  7 Jun 2019 09:34:23 -0700
Message-Id: <20190607163423.31860-6-ajayg@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190607163423.31860-1-ajayg@nvidia.com>
References: <20190607163423.31860-1-ajayg@nvidia.com>
X-NVConfidentiality: public
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Ajay Gupta <ajayg@nvidia.com>

Cypress USB Type-C CCGx controller firmware version 3.1.10
(which is being used in many NVIDIA GPU cards) has known issue of
not triggering interrupt when a USB device is hot plugged to runtime
resume the controller. If any GPU card gets latest kernel with runtime
pm support but does not get latest fixed firmware then also it should
continue to work and therefore a workaround is required to check for
any connector change event.

The workaround is that i2c bus driver will call pm_request_resume()
to runtime resume ucsi_ccg driver. CCG driver will call the ISR
for any connector change event for NVIDIA GPU card and only if it has
old CCG firmware with the known issue.

Signed-off-by: Ajay Gupta <ajayg@nvidia.com>
Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
Changes from v4->v5: None

 drivers/usb/typec/ucsi/ucsi_ccg.c | 80 +++++++++++++++++++++++++++++--
 1 file changed, 76 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
index b15bc6c29c46..a5b81c011148 100644
--- a/drivers/usb/typec/ucsi/ucsi_ccg.c
+++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
@@ -109,12 +109,21 @@ struct version_format {
 	__le16 build;
 	u8 patch;
 	u8 ver;
+#define CCG_VERSION_PATCH(x) ((x) << 16)
+#define CCG_VERSION(x)	((x) << 24)
 #define CCG_VERSION_MIN_SHIFT (0)
 #define CCG_VERSION_MIN_MASK (0xf << CCG_VERSION_MIN_SHIFT)
 #define CCG_VERSION_MAJ_SHIFT (4)
 #define CCG_VERSION_MAJ_MASK (0xf << CCG_VERSION_MAJ_SHIFT)
 } __packed;
 
+/*
+ * Firmware version 3.1.10 or earlier, built for NVIDIA has known issue
+ * of missing interrupt when a device is connected for runtime resume
+ */
+#define CCG_FW_BUILD_NVIDIA	(('n' << 8) | 'v')
+#define CCG_OLD_FW_VERSION	(CCG_VERSION(0x31) | CCG_VERSION_PATCH(10))
+
 struct version_info {
 	struct version_format base;
 	struct version_format app;
@@ -172,6 +181,7 @@ struct ucsi_ccg {
 	struct ccg_dev_info info;
 	/* version info for boot, primary and secondary */
 	struct version_info version[FW2 + 1];
+	u32 fw_version;
 	/* CCG HPI communication flags */
 	unsigned long flags;
 #define RESET_PENDING	0
@@ -185,6 +195,8 @@ struct ucsi_ccg {
 
 	/* fw build with vendor information */
 	u16 fw_build;
+	bool run_isr; /* flag to call ISR routine during resume */
+	struct work_struct pm_work;
 };
 
 static int ccg_read(struct ucsi_ccg *uc, u16 rab, u8 *data, u32 len)
@@ -212,6 +224,18 @@ static int ccg_read(struct ucsi_ccg *uc, u16 rab, u8 *data, u32 len)
 	if (quirks && quirks->max_read_len)
 		max_read_len = quirks->max_read_len;
 
+	if (uc->fw_build == CCG_FW_BUILD_NVIDIA &&
+	    uc->fw_version <= CCG_OLD_FW_VERSION) {
+		mutex_lock(&uc->lock);
+		/*
+		 * Do not schedule pm_work to run ISR in
+		 * ucsi_ccg_runtime_resume() after pm_runtime_get_sync()
+		 * since we are already in ISR path.
+		 */
+		uc->run_isr = false;
+		mutex_unlock(&uc->lock);
+	}
+
 	pm_runtime_get_sync(uc->dev);
 	while (rem_len > 0) {
 		msgs[1].buf = &data[len - rem_len];
@@ -254,6 +278,18 @@ static int ccg_write(struct ucsi_ccg *uc, u16 rab, u8 *data, u32 len)
 	msgs[0].len = len + sizeof(rab);
 	msgs[0].buf = buf;
 
+	if (uc->fw_build == CCG_FW_BUILD_NVIDIA &&
+	    uc->fw_version <= CCG_OLD_FW_VERSION) {
+		mutex_lock(&uc->lock);
+		/*
+		 * Do not schedule pm_work to run ISR in
+		 * ucsi_ccg_runtime_resume() after pm_runtime_get_sync()
+		 * since we are already in ISR path.
+		 */
+		uc->run_isr = false;
+		mutex_unlock(&uc->lock);
+	}
+
 	pm_runtime_get_sync(uc->dev);
 	status = i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
 	if (status < 0) {
@@ -383,6 +419,13 @@ static irqreturn_t ccg_irq_handler(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
+static void ccg_pm_workaround_work(struct work_struct *pm_work)
+{
+	struct ucsi_ccg *uc = container_of(pm_work, struct ucsi_ccg, pm_work);
+
+	ucsi_notify(uc->ucsi);
+}
+
 static int get_fw_info(struct ucsi_ccg *uc)
 {
 	int err;
@@ -392,6 +435,9 @@ static int get_fw_info(struct ucsi_ccg *uc)
 	if (err < 0)
 		return err;
 
+	uc->fw_version = CCG_VERSION(uc->version[FW2].app.ver) |
+			CCG_VERSION_PATCH(uc->version[FW2].app.patch);
+
 	err = ccg_read(uc, CCGX_RAB_DEVICE_MODE, (u8 *)(&uc->info),
 		       sizeof(uc->info));
 	if (err < 0)
@@ -740,11 +786,12 @@ static bool ccg_check_fw_version(struct ucsi_ccg *uc, const char *fw_name,
 	}
 
 	/* compare input version with FWCT version */
-	cur_version = le16_to_cpu(app->build) | app->patch << 16 |
-			app->ver << 24;
+	cur_version = le16_to_cpu(app->build) | CCG_VERSION_PATCH(app->patch) |
+			CCG_VERSION(app->ver);
 
-	new_version = le16_to_cpu(fw_cfg.app.build) | fw_cfg.app.patch << 16 |
-			fw_cfg.app.ver << 24;
+	new_version = le16_to_cpu(fw_cfg.app.build) |
+			CCG_VERSION_PATCH(fw_cfg.app.patch) |
+			CCG_VERSION(fw_cfg.app.ver);
 
 	if (!ccg_check_vendor_version(uc, app, &fw_cfg))
 		goto out_release_firmware;
@@ -1084,8 +1131,10 @@ static int ucsi_ccg_probe(struct i2c_client *client,
 	uc->ppm.sync = ucsi_ccg_sync;
 	uc->dev = dev;
 	uc->client = client;
+	uc->run_isr = true;
 	mutex_init(&uc->lock);
 	INIT_WORK(&uc->work, ccg_update_firmware);
+	INIT_WORK(&uc->pm_work, ccg_pm_workaround_work);
 
 	/* Only fail FW flashing when FW build information is not provided */
 	status = device_property_read_u16(dev, "ccgx,firmware-build",
@@ -1153,6 +1202,7 @@ static int ucsi_ccg_remove(struct i2c_client *client)
 {
 	struct ucsi_ccg *uc = i2c_get_clientdata(client);
 
+	cancel_work_sync(&uc->pm_work);
 	cancel_work_sync(&uc->work);
 	ucsi_unregister_ppm(uc->ucsi);
 	pm_runtime_disable(uc->dev);
@@ -1183,6 +1233,28 @@ static int ucsi_ccg_runtime_suspend(struct device *dev)
 
 static int ucsi_ccg_runtime_resume(struct device *dev)
 {
+	struct i2c_client *client = to_i2c_client(dev);
+	struct ucsi_ccg *uc = i2c_get_clientdata(client);
+	bool schedule = true;
+
+	/*
+	 * Firmware version 3.1.10 or earlier, built for NVIDIA has known issue
+	 * of missing interrupt when a device is connected for runtime resume.
+	 * Schedule a work to call ISR as a workaround.
+	 */
+	if (uc->fw_build == CCG_FW_BUILD_NVIDIA &&
+	    uc->fw_version <= CCG_OLD_FW_VERSION) {
+		mutex_lock(&uc->lock);
+		if (!uc->run_isr) {
+			uc->run_isr = true;
+			schedule = false;
+		}
+		mutex_unlock(&uc->lock);
+
+		if (schedule)
+			schedule_work(&uc->pm_work);
+	}
+
 	return 0;
 }
 
-- 
2.17.1


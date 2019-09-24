Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 16522BC413
	for <lists+linux-usb@lfdr.de>; Tue, 24 Sep 2019 10:24:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436668AbfIXIYv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 24 Sep 2019 04:24:51 -0400
Received: from mga18.intel.com ([134.134.136.126]:13069 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404719AbfIXIYv (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 24 Sep 2019 04:24:51 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 24 Sep 2019 01:24:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,543,1559545200"; 
   d="scan'208,223";a="203330806"
Received: from kuha.fi.intel.com ([10.237.72.53])
  by fmsmga001.fm.intel.com with SMTP; 24 Sep 2019 01:24:47 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 24 Sep 2019 11:24:46 +0300
Date:   Tue, 24 Sep 2019 11:24:46 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Ajay Gupta <ajayg@nvidia.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [RFC PATCH] usb: typec: ucsi: ccg: Remove run_isr flag
Message-ID: <20190924082446.GE16243@kuha.fi.intel.com>
References: <20190923133101.30774-1-heikki.krogerus@linux.intel.com>
 <BYAPR12MB27276DD002AB589162CC7709DC850@BYAPR12MB2727.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="bg08WKrSYDhXBjb5"
Content-Disposition: inline
In-Reply-To: <BYAPR12MB27276DD002AB589162CC7709DC850@BYAPR12MB2727.namprd12.prod.outlook.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--bg08WKrSYDhXBjb5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ajay,

On Mon, Sep 23, 2019 at 06:15:59PM +0000, Ajay Gupta wrote:
> Hi Heikki,
> 
> > -----Original Message-----
> > From: linux-usb-owner@vger.kernel.org <linux-usb-owner@vger.kernel.org>
> > On Behalf Of Heikki Krogerus
> > Sent: Monday, September 23, 2019 6:31 AM
> > To: Ajay Gupta <ajayg@nvidia.com>
> > Cc: linux-usb@vger.kernel.org
> > Subject: [RFC PATCH] usb: typec: ucsi: ccg: Remove run_isr flag
> > 
> > There is no need to try to prevent the extra ucsi_notify() that runtime
> > resuming the device will cause.
> > 
> > This fixes potential deadlock. Both ccg_read() and
> > ccg_write() are called with the mutex already taken at least from
> > ccg_send_command(). In ccg_read() and ccg_write, the mutex is only acquired
> > so that run_isr flag can be set.
> > 
> > Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > ---
> > Hi Ajay,
> > 
> > Before going forward with this I would like to get confirmation from you that it
> > is OK, and that I'm not missing anything. 
> Thanks for this. I mixed up firmware flashing and IO path by using same lock.
> 
> >I did not see any real purpose for that run_isr flag. 
> > The only thing that I can see it preventing is an extra ucsi_notify()
> > call caused by the waking of the controller, but that should not be a problem.
> > Is there any other reason why the flag is there?
> ucsi_ccg_runtime_resume() will get called after pm_runtime_get_sync(uc->dev);
> in ccg_read() and ccg_write(). If we allow extra ucsi_notify() then ccg_read() and
> ccg_write() will get called again from ucsi_notfiy() through ucsi_sync(). This will
> keep on happening in a loop and the controller will remain in D0 always and 
> runtime pm will never be done.

OK, so the problem is actually that we are allowing the controller to
suspend while we are still in the middle of waiting for completion to
a command, right? That should not be allowed to happen.

Instead of hiding the symptom from the problem with that flag, the
driver needs to initially define autosuspend delay that is as long as
UCSI_TIMEOUT_MS (or longer). That should be enough to fix the problem,
though it still leaves a small change of hitting it in some corner
cases. After I'm done with the I/O rewrite, we can guarantee that the
controller stays in D0 for as long as it takes to process the whole
command.

But as the initial fix, let's just use the autosuspend delay.

Can you test the attached patch?

thanks,

-- 
heikki

--bg08WKrSYDhXBjb5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="0001-usb-typec-ucsi-ccg-Remove-run_isr-flag.patch"

From aced6041a9ff34cd1c10f60bbe8eaf0b55df60af Mon Sep 17 00:00:00 2001
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Date: Mon, 23 Sep 2019 15:04:10 +0300
Subject: [PATCH] usb: typec: ucsi: ccg: Remove run_isr flag

The "run_isr" flag is used for preventing the driver from
calling the interrupt service routine in its runtime resume
callback when the driver is expecting completion to a
command, but what that basically does is that it hides the
real problem. The real problem is that the controller is
allowed to suspend in the middle of command execution.

As a more appropriate fix for the problem, using autosuspend
delay time that matches UCSI_TIMOUT_MS. That prevents the
controller from suspending while still in the middle of
executing a command.

This fixes potential deadlock. Both ccg_read() and
ccg_write() are called with the mutex already taken at least
from ccg_send_command(). In ccg_read() and ccg_write, the
mutex is only acquired so that run_isr flag can be set.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/ucsi/ucsi_ccg.c | 42 +++----------------------------
 1 file changed, 4 insertions(+), 38 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
index 907e20e1a71e..d772fce51905 100644
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
@@ -1188,6 +1162,8 @@ static int ucsi_ccg_probe(struct i2c_client *client,
 
 	pm_runtime_set_active(uc->dev);
 	pm_runtime_enable(uc->dev);
+	pm_runtime_use_autosuspend(uc->dev);
+	pm_runtime_set_autosuspend_delay(uc->dev, 5000);
 	pm_runtime_idle(uc->dev);
 
 	return 0;
@@ -1229,7 +1205,6 @@ static int ucsi_ccg_runtime_resume(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct ucsi_ccg *uc = i2c_get_clientdata(client);
-	bool schedule = true;
 
 	/*
 	 * Firmware version 3.1.10 or earlier, built for NVIDIA has known issue
@@ -1237,17 +1212,8 @@ static int ucsi_ccg_runtime_resume(struct device *dev)
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


--bg08WKrSYDhXBjb5--

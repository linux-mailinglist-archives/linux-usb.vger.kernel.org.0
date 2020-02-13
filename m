Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65EB515BE39
	for <lists+linux-usb@lfdr.de>; Thu, 13 Feb 2020 13:06:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729544AbgBMMGT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 Feb 2020 07:06:19 -0500
Received: from mga17.intel.com ([192.55.52.151]:21501 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727059AbgBMMGS (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 13 Feb 2020 07:06:18 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 13 Feb 2020 04:06:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,436,1574150400"; 
   d="diff'?scan'208";a="347718089"
Received: from kuha.fi.intel.com ([10.237.72.53])
  by fmsmga001.fm.intel.com with SMTP; 13 Feb 2020 04:06:16 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Thu, 13 Feb 2020 14:05:55 +0200
Date:   Thu, 13 Feb 2020 14:05:55 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     "Shah, Nehal-bakulchandra" <nbshah@amd.com>
Cc:     ajayg@nvidia.com, linux-usb@vger.kernel.org
Subject: Re: UCSI:CCG: AMD Platform
Message-ID: <20200213120555.GM1498@kuha.fi.intel.com>
References: <0fa0fc36-ce51-046a-32ae-9dbb7452c1c4@amd.com>
 <20200203132808.GA29050@kuha.fi.intel.com>
 <20200203133231.GB29050@kuha.fi.intel.com>
 <aca4968f-06e8-6ac3-09c8-4810947e92b3@amd.com>
 <20200213120011.GL1498@kuha.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="5/uDoXvLw7AC5HRs"
Content-Disposition: inline
In-Reply-To: <20200213120011.GL1498@kuha.fi.intel.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--5/uDoXvLw7AC5HRs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 13, 2020 at 02:00:14PM +0200, Heikki Krogerus wrote:
> > I am using CCG based UCSI driver without any
> > modification.For I2C part i have written custom
> > driver.
> > 
> > I have attached the trace out and dmesg crash log.
> > 
> > Please have a look
> 
> Thanks for the logs. Can you test the attached diff?

Actually, don't try that one. Try this one instead.

-- 
heikki

--5/uDoXvLw7AC5HRs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="displayport_lock.diff"

diff --git a/drivers/usb/typec/ucsi/displayport.c b/drivers/usb/typec/ucsi/displayport.c
index 0f1273ae086c..0f8f5d07e270 100644
--- a/drivers/usb/typec/ucsi/displayport.c
+++ b/drivers/usb/typec/ucsi/displayport.c
@@ -285,6 +285,8 @@ struct typec_altmode *ucsi_register_displayport(struct ucsi_connector *con,
 	struct typec_altmode *alt;
 	struct ucsi_dp *dp;
 
+	mutex_lock(&con->lock);
+
 	/* We can't rely on the firmware with the capabilities. */
 	desc->vdo |= DP_CAP_DP_SIGNALING | DP_CAP_RECEPTACLE;
 
@@ -293,12 +295,15 @@ struct typec_altmode *ucsi_register_displayport(struct ucsi_connector *con,
 	desc->vdo |= all_assignments << 16;
 
 	alt = typec_port_register_altmode(con->port, desc);
-	if (IS_ERR(alt))
+	if (IS_ERR(alt)) {
+		mutex_unlock(&con->lock);
 		return alt;
+	}
 
 	dp = devm_kzalloc(&alt->dev, sizeof(*dp), GFP_KERNEL);
 	if (!dp) {
 		typec_unregister_altmode(alt);
+		mutex_unlock(&con->lock);
 		return ERR_PTR(-ENOMEM);
 	}
 
@@ -311,5 +316,7 @@ struct typec_altmode *ucsi_register_displayport(struct ucsi_connector *con,
 	alt->ops = &ucsi_displayport_ops;
 	typec_altmode_set_drvdata(alt, dp);
 
+	mutex_unlock(&con->lock);
+
 	return alt;
 }

--5/uDoXvLw7AC5HRs--

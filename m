Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AA0A2193B10
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2020 09:35:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727938AbgCZIfL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 Mar 2020 04:35:11 -0400
Received: from mga01.intel.com ([192.55.52.88]:15558 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726289AbgCZIfK (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 26 Mar 2020 04:35:10 -0400
IronPort-SDR: KAju++o4gATkZ1dTFd44keZqDcx4Shaw9B8ZvqYEi4TUiEu+6h/nB/1shLyStmmqEiFsZZdc9J
 bWLMTtVPV2yQ==
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2020 01:35:10 -0700
IronPort-SDR: gmKGGMfiaY8o7pRZU5cWdrNkU1Lvw96s7ZyLNIGXNGvoQ6NI7QgJmAN/sU3EBhcTq+Qdu3sNxB
 SCdgA1XkdtFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,307,1580803200"; 
   d="diff'?scan'208";a="358077858"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 26 Mar 2020 01:35:08 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Thu, 26 Mar 2020 10:35:07 +0200
Date:   Thu, 26 Mar 2020 10:35:07 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     "Shah, Nehal-bakulchandra" <nehal-bakulchandra.shah@amd.com>
Cc:     "Shah, Nehal-bakulchandra" <nbshah@amd.com>, ajayg@nvidia.com,
        linux-usb@vger.kernel.org
Subject: Re: UCSI:CCG: AMD Platform
Message-ID: <20200326083507.GB1281735@kuha.fi.intel.com>
References: <20200203132808.GA29050@kuha.fi.intel.com>
 <20200203133231.GB29050@kuha.fi.intel.com>
 <aca4968f-06e8-6ac3-09c8-4810947e92b3@amd.com>
 <20200213120011.GL1498@kuha.fi.intel.com>
 <20200213120555.GM1498@kuha.fi.intel.com>
 <0efd0175-6668-7411-81b2-d4a487ccc0ec@amd.com>
 <e0ab390b-743a-d583-15c4-83af3a7dca35@amd.com>
 <20200227122308.GC10532@kuha.fi.intel.com>
 <278ab9a6-497b-9cd5-8aa1-440fc78cb3db@amd.com>
 <9fcf4549-e699-1a35-d87a-6bacf85fba29@amd.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="lrZ03NoBR/3+SXJZ"
Content-Disposition: inline
In-Reply-To: <9fcf4549-e699-1a35-d87a-6bacf85fba29@amd.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--lrZ03NoBR/3+SXJZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Sat, Feb 29, 2020 at 08:55:50AM +0530, Shah, Nehal-bakulchandra wrote:
> Hi
> On 2/27/2020 10:29 PM, Shah, Nehal-bakulchandra wrote:
> > Hi
> > On 2/27/2020 5:53 PM, Heikki Krogerus wrote:
> >> On Mon, Feb 24, 2020 at 02:38:12PM +0530, Shah, Nehal-bakulchandra wrote:
> >>> Hi
> >>>
> >>> On 2/14/2020 7:58 PM, Shah, Nehal-bakulchandra wrote:
> >>>> Hi
> >>>>
> >>>> On 2/13/2020 5:35 PM, Heikki Krogerus wrote:
> >>>>> On Thu, Feb 13, 2020 at 02:00:14PM +0200, Heikki Krogerus wrote:
> >>>>>>> I am using CCG based UCSI driver without any
> >>>>>>> modification.For I2C part i have written custom
> >>>>>>> driver.
> >>>>>>>
> >>>>>>> I have attached the trace out and dmesg crash log.
> >>>>>>>
> >>>>>>> Please have a look
> >>>>>> Thanks for the logs. Can you test the attached diff?
> >>>>> Actually, don't try that one. Try this one instead.
> >>>> Sure i will update on this on Monday.
> >>>>
> >>>>
> >>>> thanks
> >>>>
> >>>> Nehal
> >>> Patch is not solving the issue. I have attached both trace and dmesg output.
> >> How about if you try this (the attached patch) together with that
> >> previous diff?
> >>
> >> thanks,
> > Sure, infact i suspected that in first place and tried same logic but it was failed but now i will check with both patch combine and shall update.
> >
> > Thanks
> >
> > Nehal Shah
> 
> This is still crashing .

Sorry about the slow process with this, and the late reply.

Right now I'm out of ideas. I'll need to get my hands on the products
that allow me to reproduce the issue. Staring at the code does not
help anymore.

I'm going to cleanup the code a little bit in any case. I'm attaching
a diff with my changes. I don't think it will fix this issue, but I
would appreciate if you tested it in any case, just to be sure.

thanks,

-- 
heikki

--lrZ03NoBR/3+SXJZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="ucsi.diff"

diff --git a/drivers/usb/typec/ucsi/displayport.c b/drivers/usb/typec/ucsi/displayport.c
index 048381c058a5..1a5c76907827 100644
--- a/drivers/usb/typec/ucsi/displayport.c
+++ b/drivers/usb/typec/ucsi/displayport.c
@@ -263,10 +263,12 @@ static void ucsi_displayport_work(struct work_struct *work)
 	mutex_unlock(&dp->con->lock);
 }
 
-void ucsi_displayport_remove_partner(struct typec_altmode *alt)
+void ucsi_displayport_remove_partner(struct typec_altmode *pdev)
 {
+	const struct typec_altmode *alt;
 	struct ucsi_dp *dp;
 
+	alt = typec_altmode_get_partner(pdev);
 	if (!alt)
 		return;
 
diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index ddf2ad3752de..921499407403 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -432,8 +432,12 @@ static int ucsi_register_altmodes(struct ucsi_connector *con, u8 recipient)
 		command |= UCSI_GET_ALTMODE_CONNECTOR_NUMBER(con->num);
 		command |= UCSI_GET_ALTMODE_OFFSET(i);
 		len = ucsi_run_command(con->ucsi, command, alt, sizeof(alt));
-		if (len <= 0)
+		if (len <= 0) {
+			/* Assuming that all alt modes are now registered */
+			if (recipient == UCSI_RECIPIENT_SOP && i)
+				break;
 			return len;
+		}
 
 		/*
 		 * This code is requesting one alt mode at a time, but some PPMs
@@ -464,9 +468,8 @@ static int ucsi_register_altmodes(struct ucsi_connector *con, u8 recipient)
 
 static void ucsi_unregister_altmodes(struct ucsi_connector *con, u8 recipient)
 {
-	const struct typec_altmode *pdev;
 	struct typec_altmode **adev;
-	int i = 0;
+	int i;
 
 	switch (recipient) {
 	case UCSI_RECIPIENT_CON:
@@ -479,16 +482,15 @@ static void ucsi_unregister_altmodes(struct ucsi_connector *con, u8 recipient)
 		return;
 	}
 
-	while (adev[i]) {
+	for (i = 0; adev[i]; i++) {
 		if (recipient == UCSI_RECIPIENT_SOP &&
 		    (adev[i]->svid == USB_TYPEC_DP_SID ||
-			(adev[i]->svid == USB_TYPEC_NVIDIA_VLINK_SID &&
-			adev[i]->vdo != USB_TYPEC_NVIDIA_VLINK_DBG_VDO))) {
-			pdev = typec_altmode_get_partner(adev[i]);
-			ucsi_displayport_remove_partner((void *)pdev);
-		}
+		     (adev[i]->svid == USB_TYPEC_NVIDIA_VLINK_SID &&
+		      adev[i]->vdo != USB_TYPEC_NVIDIA_VLINK_DBG_VDO)))
+			ucsi_displayport_remove_partner(adev[i]);
+
 		typec_unregister_altmode(adev[i]);
-		adev[i++] = NULL;
+		adev[i] = NULL;
 	}
 }
 
@@ -583,8 +585,8 @@ static void ucsi_partner_change(struct ucsi_connector *con)
 	ret = ucsi_register_altmodes(con, UCSI_RECIPIENT_SOP);
 	if (ret)
 		dev_err(con->ucsi->dev,
-			"con%d: failed to register partner alternate modes\n",
-			con->num);
+			"con%d: failed to register partner alternate modes (%d)\n",
+			con->num, ret);
 	else
 		ucsi_altmode_update_active(con);
 }
diff --git a/include/linux/usb/typec_altmode.h b/include/linux/usb/typec_altmode.h
index d834e236c6df..85267df13bf1 100644
--- a/include/linux/usb/typec_altmode.h
+++ b/include/linux/usb/typec_altmode.h
@@ -40,7 +40,8 @@ static inline void typec_altmode_set_drvdata(struct typec_altmode *altmode,
 	dev_set_drvdata(&altmode->dev, data);
 }
 
-static inline void *typec_altmode_get_drvdata(struct typec_altmode *altmode)
+static inline void *
+typec_altmode_get_drvdata(const struct typec_altmode *altmode)
 {
 	return dev_get_drvdata(&altmode->dev);
 }

--lrZ03NoBR/3+SXJZ--

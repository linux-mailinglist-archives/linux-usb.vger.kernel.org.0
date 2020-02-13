Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C0AE15BE2A
	for <lists+linux-usb@lfdr.de>; Thu, 13 Feb 2020 13:00:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729957AbgBMMAP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 Feb 2020 07:00:15 -0500
Received: from mga05.intel.com ([192.55.52.43]:18751 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729952AbgBMMAP (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 13 Feb 2020 07:00:15 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 13 Feb 2020 04:00:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,436,1574150400"; 
   d="diff'?scan'208";a="347717004"
Received: from kuha.fi.intel.com ([10.237.72.53])
  by fmsmga001.fm.intel.com with SMTP; 13 Feb 2020 04:00:12 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Thu, 13 Feb 2020 14:00:11 +0200
Date:   Thu, 13 Feb 2020 14:00:11 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     "Shah, Nehal-bakulchandra" <nbshah@amd.com>
Cc:     ajayg@nvidia.com, linux-usb@vger.kernel.org
Subject: Re: UCSI:CCG: AMD Platform
Message-ID: <20200213120011.GL1498@kuha.fi.intel.com>
References: <0fa0fc36-ce51-046a-32ae-9dbb7452c1c4@amd.com>
 <20200203132808.GA29050@kuha.fi.intel.com>
 <20200203133231.GB29050@kuha.fi.intel.com>
 <aca4968f-06e8-6ac3-09c8-4810947e92b3@amd.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="k+w/mQv8wyuph6w0"
Content-Disposition: inline
In-Reply-To: <aca4968f-06e8-6ac3-09c8-4810947e92b3@amd.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--k+w/mQv8wyuph6w0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 10, 2020 at 03:39:38PM +0530, Shah, Nehal-bakulchandra wrote:
> Hi
> 
> Sorry for the delayed response. I was on vacation.
> On 2/3/2020 7:02 PM, Heikki Krogerus wrote:
> > On Mon, Feb 03, 2020 at 03:28:11PM +0200, Heikki Krogerus wrote:
> >> Hi,
> >>
> >> On Mon, Feb 03, 2020 at 10:52:52AM +0530, Shah, Nehal-bakulchandra wrote:
> >>> Currently i am working on enabling UCSI support
> >>> for CCGx based controller on AMD GPU Cards.
> >>>
> >>> Now i am observing the issue reported here when
> >>> i unplug the cable.
> >>>
> >>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fbugzilla.redhat.com%2Fshow_bug.cgi%3Fid%3D1762031&amp;data=02%7C01%7CNehal-bakulchandra.Shah%40amd.com%7Ceb1ac5e877db4fa9d75f08d7a8ad87a3%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637163335569266081&amp;sdata=KemJKkVhpqDo%2FSbHhVaMz7jrcploEALJYg%2BRWvhJ7bM%3D&amp;reserved=0
> >>>
> >>> Also would like to know is there any way we can
> >>> get user level notifications for UCSI?
> >>
> >> If you want to see the actual UCSI notification in user space, then
> >> that is not possible, but the driver does produce trace output, and I
> >> would actually like to see what we got there. You need debugfs to be
> >> mounted. Then try the following:
> >>
> >>         # Unload all UCSI modules
> >>         modprobe -r ucsi_acpi
> >>
> >>         # At this point you should plug-in the problematic device
> >>
> >>         # Reload the UCSI core module
> >>         modprobe typec_ucsi
> >>
> >>         # Enable UCSI tracing
> >>         echo 1 > /sys/kernel/debug/tracing/events/ucsi/enable
> >>
> >>         # Now reload the ACPI glue driver
> >>         modprobe ucsi_acpi
> >>
> >>         # Unplug the problematic device so that you see the error
> >>
> >>         # Finally dump the trace output
> >>         cat /sys/kernel/debug/tracing/trace
> >>
> >> So if that works, please send the trace output to me.
> > 
> > Actually, first things first. Please share your dmesg output. Are you
> > using ucsi_acpi or ucsi_ccg glue driver?
> > 
> > thanks,
> > 
> 
> I am using CCG based UCSI driver without any
> modification.For I2C part i have written custom
> driver.
> 
> I have attached the trace out and dmesg crash log.
> 
> Please have a look

Thanks for the logs. Can you test the attached diff?

thanks,

-- 
heikki

--k+w/mQv8wyuph6w0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="port_lock.diff"

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index ddf2ad3752de..37837bf5385b 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -870,12 +870,16 @@ static int ucsi_register_port(struct ucsi *ucsi, int index)
 	con->num = index + 1;
 	con->ucsi = ucsi;
 
+	mutex_lock(&con->lock);
+
 	/* Get connector capability */
 	command = UCSI_GET_CONNECTOR_CAPABILITY;
 	command |= UCSI_CONNECTOR_NUMBER(con->num);
 	ret = ucsi_run_command(ucsi, command, &con->cap, sizeof(con->cap));
-	if (ret < 0)
+	if (ret < 0) {
+		mutex_unlock(&con->lock);
 		return ret;
+	}
 
 	if (con->cap.op_mode & UCSI_CONCAP_OPMODE_DRP)
 		cap->data = TYPEC_PORT_DRD;
@@ -907,8 +911,10 @@ static int ucsi_register_port(struct ucsi *ucsi, int index)
 
 	/* Register the connector */
 	con->port = typec_register_port(ucsi->dev, cap);
-	if (IS_ERR(con->port))
+	if (IS_ERR(con->port)) {
+		mutex_unlock(&con->lock);
 		return PTR_ERR(con->port);
+	}
 
 	/* Alternate modes */
 	ret = ucsi_register_altmodes(con, UCSI_RECIPIENT_CON);
@@ -922,6 +928,7 @@ static int ucsi_register_port(struct ucsi *ucsi, int index)
 			       sizeof(con->status));
 	if (ret < 0) {
 		dev_err(ucsi->dev, "con%d: failed to get status\n", con->num);
+		mutex_unlock(&con->lock);
 		return 0;
 	}
 
@@ -956,6 +963,7 @@ static int ucsi_register_port(struct ucsi *ucsi, int index)
 
 	trace_ucsi_register_port(con->num, &con->status);
 
+	mutex_unlock(&con->lock);
 	return 0;
 }
 

--k+w/mQv8wyuph6w0--

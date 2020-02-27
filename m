Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85B50171705
	for <lists+linux-usb@lfdr.de>; Thu, 27 Feb 2020 13:23:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728946AbgB0MXQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 Feb 2020 07:23:16 -0500
Received: from mga03.intel.com ([134.134.136.65]:28822 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728929AbgB0MXQ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 27 Feb 2020 07:23:16 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 27 Feb 2020 04:23:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,492,1574150400"; 
   d="scan'208,223";a="350665814"
Received: from kuha.fi.intel.com ([10.237.72.53])
  by fmsmga001.fm.intel.com with SMTP; 27 Feb 2020 04:23:13 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Thu, 27 Feb 2020 14:23:08 +0200
Date:   Thu, 27 Feb 2020 14:23:08 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     "Shah, Nehal-bakulchandra" <nehal-bakulchandra.shah@amd.com>
Cc:     "Shah, Nehal-bakulchandra" <nbshah@amd.com>, ajayg@nvidia.com,
        linux-usb@vger.kernel.org
Subject: Re: UCSI:CCG: AMD Platform
Message-ID: <20200227122308.GC10532@kuha.fi.intel.com>
References: <0fa0fc36-ce51-046a-32ae-9dbb7452c1c4@amd.com>
 <20200203132808.GA29050@kuha.fi.intel.com>
 <20200203133231.GB29050@kuha.fi.intel.com>
 <aca4968f-06e8-6ac3-09c8-4810947e92b3@amd.com>
 <20200213120011.GL1498@kuha.fi.intel.com>
 <20200213120555.GM1498@kuha.fi.intel.com>
 <0efd0175-6668-7411-81b2-d4a487ccc0ec@amd.com>
 <e0ab390b-743a-d583-15c4-83af3a7dca35@amd.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="17pEHd4RhPHOinZp"
Content-Disposition: inline
In-Reply-To: <e0ab390b-743a-d583-15c4-83af3a7dca35@amd.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--17pEHd4RhPHOinZp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 24, 2020 at 02:38:12PM +0530, Shah, Nehal-bakulchandra wrote:
> Hi
> 
> On 2/14/2020 7:58 PM, Shah, Nehal-bakulchandra wrote:
> > Hi
> >
> > On 2/13/2020 5:35 PM, Heikki Krogerus wrote:
> >> On Thu, Feb 13, 2020 at 02:00:14PM +0200, Heikki Krogerus wrote:
> >>>> I am using CCG based UCSI driver without any
> >>>> modification.For I2C part i have written custom
> >>>> driver.
> >>>>
> >>>> I have attached the trace out and dmesg crash log.
> >>>>
> >>>> Please have a look
> >>> Thanks for the logs. Can you test the attached diff?
> >> Actually, don't try that one. Try this one instead.
> > Sure i will update on this on Monday.
> >
> >
> > thanks
> >
> > Nehal
> 
> Patch is not solving the issue. I have attached both trace and dmesg output.

How about if you try this (the attached patch) together with that
previous diff?

thanks,

-- 
heikki

--17pEHd4RhPHOinZp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="0001-usb-typec-ucsi-displayport-Fix-potential-NULL-pointe.patch"

From fa1aff5e8e7464851470f29eeae45bde1f089ce1 Mon Sep 17 00:00:00 2001
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Date: Mon, 17 Feb 2020 18:07:17 +0300
Subject: [PATCH] usb: typec: ucsi: displayport: Fix potential NULL pointer
 dereference

In ucsi_displayport_remove_partner(), if the DisplayPort alt
mode was never registered, then there is also no driver data
for it. Adding a check to make sure there really is driver
data for the device before modifying it.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/ucsi/displayport.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/typec/ucsi/displayport.c b/drivers/usb/typec/ucsi/displayport.c
index 0f1273ae086c..261131c9e37c 100644
--- a/drivers/usb/typec/ucsi/displayport.c
+++ b/drivers/usb/typec/ucsi/displayport.c
@@ -271,6 +271,9 @@ void ucsi_displayport_remove_partner(struct typec_altmode *alt)
 		return;
 
 	dp = typec_altmode_get_drvdata(alt);
+	if (!dp)
+		return;
+
 	dp->data.conf = 0;
 	dp->data.status = 0;
 	dp->initialized = false;
-- 
2.25.0


--17pEHd4RhPHOinZp--

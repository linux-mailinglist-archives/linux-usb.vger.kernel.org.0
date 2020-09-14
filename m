Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BB73268C95
	for <lists+linux-usb@lfdr.de>; Mon, 14 Sep 2020 15:53:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726477AbgINNwo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 14 Sep 2020 09:52:44 -0400
Received: from mga17.intel.com ([192.55.52.151]:12627 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726785AbgINNuY (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 14 Sep 2020 09:50:24 -0400
IronPort-SDR: yBuWl6wJFDZx8tehtCay9/noy3FrDjyHwSzNvFBsDJFOFXmHrmAOqjozKMo1ljmlgPTWdyBsep
 MeGaPFW01a4w==
X-IronPort-AV: E=McAfee;i="6000,8403,9743"; a="139091737"
X-IronPort-AV: E=Sophos;i="5.76,426,1592895600"; 
   d="scan'208,223";a="139091737"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2020 06:49:46 -0700
IronPort-SDR: ZQq7//rYLJV9qA19RJXG+Mb0NVj5Wc43PZxXJgdYzeV5z41/eQGR2lq3BWVOm0uyRz2xMAf0p6
 qRue34a/jjBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,426,1592895600"; 
   d="scan'208,223";a="408858786"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 14 Sep 2020 06:49:43 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 14 Sep 2020 16:49:43 +0300
Date:   Mon, 14 Sep 2020 16:49:42 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Zwane Mwaikambo <zwanem@gmail.com>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Zwane Mwaikambo <zwane@yosper.io>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v5 1/2] usb/typec: fix array overruns in ucsi.c
 partner_altmode[]
Message-ID: <20200914134942.GB810499@kuha.fi.intel.com>
References: <alpine.DEB.2.21.2008271058220.37762@montezuma.home>
 <alpine.DEB.2.21.2008271131570.37762@montezuma.home>
 <20200828123328.GF174928@kuha.fi.intel.com>
 <alpine.DEB.2.21.2008300220350.37231@montezuma.home>
 <20200903111047.GH1279097@kuha.fi.intel.com>
 <20200909131059.GB3627076@kuha.fi.intel.com>
 <alpine.DEB.2.21.2009100030340.31932@montezuma.home>
 <20200910125018.GA3946915@kuha.fi.intel.com>
 <alpine.DEB.2.21.2009101912020.31932@montezuma.home>
 <20200911135618.GA4168153@kuha.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="0F1p//8PRICkK4MW"
Content-Disposition: inline
In-Reply-To: <20200911135618.GA4168153@kuha.fi.intel.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--0F1p//8PRICkK4MW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Fri, Sep 11, 2020 at 04:56:22PM +0300, Heikki Krogerus wrote:
> Looks like the firmware does not terminate the list of alternate modes
> at all. It's just returning the two supported modes over and over
> again, regardless of the requested mode offset... I need to think how
> that should be handled.

Since we can't rely on the data that the firmware returns, we also
have to check that the mode index does not exceed MODE_DISCOVER_MAX.
Can you test if the attached patch fixes the issue for you?

thanks,

-- 
heikki

--0F1p//8PRICkK4MW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="0001-usb-typec-ucsi-Prevent-mode-overrun.patch"

From 50506dd61c6a086cb883e429312f4c6f0809e379 Mon Sep 17 00:00:00 2001
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Date: Mon, 14 Sep 2020 16:22:07 +0300
Subject: [PATCH] usb: typec: ucsi: Prevent mode overrun

Sometimes the embedded controller firmware does not
terminate the list of alternate modes that the partner
supports in its response to the GET_ALTERNATE_MODES command.
Instead the firmware returns the supported alternate modes
over and over again until the driver stops requesting them.

If that happens, the number of modes for each alternate mode
will exceed the maximum 6 that is defined in the USB Power
Delivery specification. Making sure that can't happen by
adding a check for it.

Not-Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/ucsi/ucsi.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index e680fcfdee609..758b988ac518a 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -216,14 +216,18 @@ void ucsi_altmode_update_active(struct ucsi_connector *con)
 					    con->partner_altmode[i] == altmode);
 }
 
-static u8 ucsi_altmode_next_mode(struct typec_altmode **alt, u16 svid)
+static int ucsi_altmode_next_mode(struct typec_altmode **alt, u16 svid)
 {
 	u8 mode = 1;
 	int i;
 
-	for (i = 0; alt[i]; i++)
+	for (i = 0; alt[i]; i++) {
+		if (i > MODE_DISCOVERY_MAX)
+			return -ERANGE;
+
 		if (alt[i]->svid == svid)
 			mode++;
+	}
 
 	return mode;
 }
@@ -258,8 +262,11 @@ static int ucsi_register_altmode(struct ucsi_connector *con,
 			goto err;
 		}
 
-		desc->mode = ucsi_altmode_next_mode(con->port_altmode,
-						    desc->svid);
+		ret = ucsi_altmode_next_mode(con->port_altmode, desc->svid);
+		if (ret < 0)
+			return ret;
+
+		desc->mode = ret;
 
 		switch (desc->svid) {
 		case USB_TYPEC_DP_SID:
@@ -292,8 +299,11 @@ static int ucsi_register_altmode(struct ucsi_connector *con,
 			goto err;
 		}
 
-		desc->mode = ucsi_altmode_next_mode(con->partner_altmode,
-						    desc->svid);
+		ret = ucsi_altmode_next_mode(con->partner_altmode, desc->svid);
+		if (ret < 0)
+			return ret;
+
+		desc->mode = ret;
 
 		alt = typec_partner_register_altmode(con->partner, desc);
 		if (IS_ERR(alt)) {
-- 
2.28.0


--0F1p//8PRICkK4MW--

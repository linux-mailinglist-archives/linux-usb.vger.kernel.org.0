Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C95EB11E3A7
	for <lists+linux-usb@lfdr.de>; Fri, 13 Dec 2019 13:37:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726968AbfLMMh5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 13 Dec 2019 07:37:57 -0500
Received: from mga01.intel.com ([192.55.52.88]:29271 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726833AbfLMMh5 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 13 Dec 2019 07:37:57 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 13 Dec 2019 04:37:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,309,1571727600"; 
   d="diff'?scan'208";a="220914319"
Received: from kuha.fi.intel.com ([10.237.72.53])
  by fmsmga001.fm.intel.com with SMTP; 13 Dec 2019 04:37:53 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Fri, 13 Dec 2019 14:37:53 +0200
Date:   Fri, 13 Dec 2019 14:37:53 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Ajay Gupta <ajayg@nvidia.com>
Cc:     Ajay Gupta <ajaykuee@gmail.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v6] usb: typec: ucsi: add support for separate DP altmode
 devices
Message-ID: <20191213123753.GH31345@kuha.fi.intel.com>
References: <20191123004347.5127-1-ajayg@nvidia.com>
 <20191212134412.GF31345@kuha.fi.intel.com>
 <BYAPR12MB27275226F3C815F96257F081DC550@BYAPR12MB2727.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="ZGiS0Q5IWpPtfppv"
Content-Disposition: inline
In-Reply-To: <BYAPR12MB27275226F3C815F96257F081DC550@BYAPR12MB2727.namprd12.prod.outlook.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--ZGiS0Q5IWpPtfppv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 12, 2019 at 05:42:28PM +0000, Ajay Gupta wrote:
> Hi Heikki,
> 
> > -----Original Message-----
> > From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > Sent: Thursday, December 12, 2019 5:44 AM
> > To: Ajay Gupta <ajaykuee@gmail.com>
> > Cc: linux-usb@vger.kernel.org; Ajay Gupta <ajayg@nvidia.com>
> > Subject: Re: [PATCH v6] usb: typec: ucsi: add support for separate DP altmode
> > devices
> > 
> > 
> > Hi Ajay,
> > 
> > On Fri, Nov 22, 2019 at 04:43:47PM -0800, Ajay Gupta wrote:
> > > From: Ajay Gupta <ajayg@nvidia.com>
> > >
> > > CCGx controller used on NVIDIA GPU card has two separate display
> > > altmode for two DP pin assignments. UCSI specification doesn't
> > > prohibits using separate display altmode.
> > >
> > > Current UCSI Type-C framework expects only one display altmode for all
> > > DP pin assignment. This patch squashes two separate display altmode
> > > into single altmode to support controllers with separate display
> > > altmode. We first read all the alternate modes of connector and then
> > > run through it to know if there are separate display altmodes. If so,
> > > it prepares a new port altmode set after squashing two or more
> > > separate altmodes into one.
> > 
> > I didn't see any major issues with this. There were still few extra spaces etc.,
> > but I can clean those. Maybe it would have been good to mention in the
> > commit message that the reason why we need those two separate alt modes,
> > for what is in reality two separate pin configurations, is limitations in UCSI
> > specification, but never mind.
> > 
> > I still don't like the approach, but since I'm unable to explain my idea, or have
> > time to write something for this myself, I don't want block this any longer. It
> > does not add that much code, so once I have time, I can always try to improve
> > it myself, right?
> > 
> > Otherwise it's OK by me. I'll queue it up.
> Thanks for reviewing. Please feel free to improve the patch or commit message.

One thing that I do want to do is I want to isolate the changes done
to ucsi.c. Can you test the attached diff? It applies on top of this
patch.

thanks,

-- 
heikki

--ZGiS0Q5IWpPtfppv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="isolate_the_quirk.diff"

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index f028658d1b1a..2bab97a07031 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -318,29 +318,22 @@ static int ucsi_register_altmode(struct ucsi_connector *con,
 	return ret;
 }
 
-static int ucsi_register_altmodes(struct ucsi_connector *con, u8 recipient)
+static int
+ucsi_register_altmodes_nvidia(struct ucsi_connector *con, u8 recipient)
 {
 	int max_altmodes = UCSI_MAX_ALTMODES;
 	struct typec_altmode_desc desc;
-	struct ucsi_altmode alt[2];
+	struct ucsi_altmode alt;
 	struct ucsi_altmode orig[UCSI_MAX_ALTMODES];
 	struct ucsi_altmode updated[UCSI_MAX_ALTMODES];
 	struct ucsi *ucsi = con->ucsi;
 	bool multi_dp = false;
 	u64 command;
-	int num = 1;
 	int ret;
 	int len;
-	int j;
 	int i;
 	int k = 0;
 
-	if (!(con->ucsi->cap.features & UCSI_CAP_ALT_MODE_DETAILS))
-		return 0;
-
-	if (recipient == UCSI_RECIPIENT_SOP && con->partner_altmode[0])
-		return 0;
-
 	if (recipient == UCSI_RECIPIENT_CON)
 		max_altmodes = con->ucsi->cap.num_alt_modes;
 
@@ -348,13 +341,13 @@ static int ucsi_register_altmodes(struct ucsi_connector *con, u8 recipient)
 	memset(updated, 0, sizeof(updated));
 
 	/* First get all the alternate modes */
-	for (i = 0; i < max_altmodes;) {
-		memset(alt, 0, sizeof(alt));
+	for (i = 0; i < max_altmodes; i++) {
+		memset(&alt, 0, sizeof(alt));
 		command = UCSI_GET_ALTERNATE_MODES;
 		command |= UCSI_GET_ALTMODE_RECIPIENT(recipient);
 		command |= UCSI_GET_ALTMODE_CONNECTOR_NUMBER(con->num);
 		command |= UCSI_GET_ALTMODE_OFFSET(i);
-		len = ucsi_run_command(con->ucsi, command, alt, sizeof(alt));
+		len = ucsi_run_command(con->ucsi, command, &alt, sizeof(alt));
 		/*
 		 * We are collecting all altmodes first and then registering.
 		 * Some type-C device will return zero length data beyond last
@@ -367,27 +360,15 @@ static int ucsi_register_altmodes(struct ucsi_connector *con, u8 recipient)
 		if (!len)
 			break;
 
-		/*
-		 * This code is requesting one alt mode at a time, but some PPMs
-		 * may still return two. If that happens both alt modes need be
-		 * saved and the offset for the next alt mode has to be
-		 * incremented.
-		 */
-		num = len / sizeof(alt[0]);
-		i += num;
-
-		for (j = 0; j < num; j++) {
-
-			if (!alt[j].svid) {
-				/* break out of outer loop and register */
-				i = max_altmodes;
-				break;
-			}
-
-			orig[k].mid = alt[j].mid;
-			orig[k].svid = alt[j].svid;
-			k++;
+		if (!alt.svid) {
+			/* break out of outer loop and register */
+			i = max_altmodes;
+			break;
 		}
+
+		orig[k].mid = alt.mid;
+		orig[k].svid = alt.svid;
+		k++;
 	}
 	/*
 	 * Update the original altmode table as some ppms may report
@@ -419,6 +400,67 @@ static int ucsi_register_altmodes(struct ucsi_connector *con, u8 recipient)
 	return 0;
 }
 
+static int ucsi_register_altmodes(struct ucsi_connector *con, u8 recipient)
+{
+	int max_altmodes = UCSI_MAX_ALTMODES;
+	struct typec_altmode_desc desc;
+	struct ucsi_altmode alt[2];
+	u64 command;
+	int num = 1;
+	int ret;
+	int len;
+	int j;
+	int i;
+
+	if (!(con->ucsi->cap.features & UCSI_CAP_ALT_MODE_DETAILS))
+		return 0;
+
+	if (recipient == UCSI_RECIPIENT_SOP && con->partner_altmode[0])
+		return 0;
+
+	if (recipient == UCSI_RECIPIENT_CON)
+		max_altmodes = con->ucsi->cap.num_alt_modes;
+
+	if (con->ucsi->ops->update_altmodes)
+		return ucsi_register_altmodes_nvidia(con, recipient);
+
+	for (i = 0; i < max_altmodes;) {
+		memset(alt, 0, sizeof(alt));
+		command = UCSI_GET_ALTERNATE_MODES;
+		command |= UCSI_GET_ALTMODE_RECIPIENT(recipient);
+		command |= UCSI_GET_ALTMODE_CONNECTOR_NUMBER(con->num);
+		command |= UCSI_GET_ALTMODE_OFFSET(i);
+		len = ucsi_run_command(con->ucsi, command, alt, sizeof(alt));
+		if (len <= 0)
+			return len;
+
+		/*
+		 * This code is requesting one alt mode at a time, but some PPMs
+		 * may still return two. If that happens both alt modes need be
+		 * registered and the offset for the next alt mode has to be
+		 * incremented.
+		 */
+		num = len / sizeof(alt[0]);
+		i += num;
+
+		for (j = 0; j < num; j++) {
+			if (!alt[j].svid)
+				return 0;
+
+			memset(&desc, 0, sizeof(desc));
+			desc.vdo = alt[j].mid;
+			desc.svid = alt[j].svid;
+			desc.roles = TYPEC_PORT_DRD;
+
+			ret = ucsi_register_altmode(con, &desc, recipient);
+			if (ret)
+				return ret;
+		}
+	}
+
+	return 0;
+}
+
 static void ucsi_unregister_altmodes(struct ucsi_connector *con, u8 recipient)
 {
 	const struct typec_altmode *pdev;

--ZGiS0Q5IWpPtfppv--

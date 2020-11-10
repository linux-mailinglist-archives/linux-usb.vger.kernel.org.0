Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FB852AD150
	for <lists+linux-usb@lfdr.de>; Tue, 10 Nov 2020 09:31:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726721AbgKJIbm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 10 Nov 2020 03:31:42 -0500
Received: from mga18.intel.com ([134.134.136.126]:36258 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726462AbgKJIbl (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 10 Nov 2020 03:31:41 -0500
IronPort-SDR: aftMu93wod27CL7ertC/ezgFBdTs/eFOOIPCEw1bEyNSLMCPBcdAb07Gu+9eS3p1hv7GNm91Ij
 DwXL5MY6uqpw==
X-IronPort-AV: E=McAfee;i="6000,8403,9800"; a="157718933"
X-IronPort-AV: E=Sophos;i="5.77,465,1596524400"; 
   d="scan'208,223";a="157718933"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2020 00:31:37 -0800
IronPort-SDR: btUBPra0wyqCcUep1No2VG5CDm2xRnRu5jNWPWtixy+Jf3iwwarhyEJ0HrPuMOmnAvn9vrg+u8
 uXrxHDJ08Yeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,465,1596524400"; 
   d="scan'208,223";a="428287672"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 10 Nov 2020 00:31:33 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 10 Nov 2020 10:31:32 +0200
Date:   Tue, 10 Nov 2020 10:31:32 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Vladimir Yerilov <openmindead@gmail.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Subject: Re: Fwd: Power supply detection issue caused by ucsi_psy?
Message-ID: <20201110083132.GB1224435@kuha.fi.intel.com>
References: <CAB31r6UbF_Q-APvfmxanvMZOYJZwr0eEPwMQ8EGWw3-VkJtHhQ@mail.gmail.com>
 <20201109112051.GL4062920@kuha.fi.intel.com>
 <dab0302c9156a845923ee7fbefad7dd4305eedb3.camel@redhat.com>
 <CAB31r6XWQqM-kLYm4vb8H=45grhuwsHDYT94y5QJZVtP8w_sXg@mail.gmail.com>
 <CAB31r6XpFRPkMcrU+os6VbkdNiQty+s8a_MWhZXY=cjK3yXvmw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="J/dobhs11T7y2rNN"
Content-Disposition: inline
In-Reply-To: <CAB31r6XpFRPkMcrU+os6VbkdNiQty+s8a_MWhZXY=cjK3yXvmw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--J/dobhs11T7y2rNN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Vladimir,

On Tue, Nov 10, 2020 at 03:02:40AM +1000, Vladimir Yerilov wrote:
> Forwarding to y'all.
> 
> Just some extra info:
> `cat /sys/class/power_supply/ucsi-source-psy-USBC000:001/online` shows
> zero when the cable is unplugged, same for
> `/sys/class/power_supply/ADP0/online` status, but that means nothing
> for upower and all system services considering that there a power
> source available and not setting display brightness and other
> parameters due to that.
> Checked in Ubuntu as well, same situation with their kernel 5.8.

Please try to avoid top-posting.

It seems that the ucsi psy does not report any changes. That is one
obvious bug that I can see.

I'm attaching a patch to fix that. Can you give it a try?

thanks,

-- 
heikki

--J/dobhs11T7y2rNN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="0001-usb-typec-ucsi-Send-power-supply-change-notification.patch"

From 3017dd8d8f9b8bca58d5ac80fff00d7af80e87bd Mon Sep 17 00:00:00 2001
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Date: Tue, 10 Nov 2020 11:25:42 +0300
Subject: [PATCH] usb: typec: ucsi: Send power supply change notifications

When the ucsi power supply goes online/offline, and when the
power levels change, the power supply class needs to be
notified so it can inform the user space.

Fixes: 992a60ed0d5e ("usb: typec: ucsi: register with power_supply class")
Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/ucsi/psy.c  | 9 +++++++++
 drivers/usb/typec/ucsi/ucsi.c | 7 ++++++-
 drivers/usb/typec/ucsi/ucsi.h | 2 ++
 3 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/ucsi/psy.c b/drivers/usb/typec/ucsi/psy.c
index 26ed0b520749a..571a51e162346 100644
--- a/drivers/usb/typec/ucsi/psy.c
+++ b/drivers/usb/typec/ucsi/psy.c
@@ -238,4 +238,13 @@ void ucsi_unregister_port_psy(struct ucsi_connector *con)
 		return;
 
 	power_supply_unregister(con->psy);
+	con->psy = NULL;
+}
+
+void ucsi_port_psy_changed(struct ucsi_connector *con)
+{
+	if (IS_ERR_OR_NULL(con->psy))
+		return;
+
+	power_supply_changed(con->psy);
 }
diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 758b988ac518a..51a570d40a42e 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -643,8 +643,10 @@ static void ucsi_handle_connector_change(struct work_struct *work)
 	role = !!(con->status.flags & UCSI_CONSTAT_PWR_DIR);
 
 	if (con->status.change & UCSI_CONSTAT_POWER_OPMODE_CHANGE ||
-	    con->status.change & UCSI_CONSTAT_POWER_LEVEL_CHANGE)
+	    con->status.change & UCSI_CONSTAT_POWER_LEVEL_CHANGE) {
 		ucsi_pwr_opmode_change(con);
+		ucsi_port_psy_changed(con);
+	}
 
 	if (con->status.change & UCSI_CONSTAT_POWER_DIR_CHANGE) {
 		typec_set_pwr_role(con->port, role);
@@ -674,6 +676,8 @@ static void ucsi_handle_connector_change(struct work_struct *work)
 			ucsi_register_partner(con);
 		else
 			ucsi_unregister_partner(con);
+
+		ucsi_port_psy_changed(con);
 	}
 
 	if (con->status.change & UCSI_CONSTAT_CAM_CHANGE) {
@@ -994,6 +998,7 @@ static int ucsi_register_port(struct ucsi *ucsi, int index)
 				  !!(con->status.flags & UCSI_CONSTAT_PWR_DIR));
 		ucsi_pwr_opmode_change(con);
 		ucsi_register_partner(con);
+		ucsi_port_psy_changed(con);
 	}
 
 	if (con->partner) {
diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index cba6f77bea61b..b7a92f2460507 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -340,9 +340,11 @@ int ucsi_resume(struct ucsi *ucsi);
 #if IS_ENABLED(CONFIG_POWER_SUPPLY)
 int ucsi_register_port_psy(struct ucsi_connector *con);
 void ucsi_unregister_port_psy(struct ucsi_connector *con);
+void ucsi_port_psy_changed(struct ucsi_connector *con);
 #else
 static inline int ucsi_register_port_psy(struct ucsi_connector *con) { return 0; }
 static inline void ucsi_unregister_port_psy(struct ucsi_connector *con) { }
+static inline void ucsi_port_psy_changed(struct ucsi_connector *con) { }
 #endif /* CONFIG_POWER_SUPPLY */
 
 #if IS_ENABLED(CONFIG_TYPEC_DP_ALTMODE)
-- 
2.28.0


--J/dobhs11T7y2rNN--

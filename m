Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EB093F8A23
	for <lists+linux-usb@lfdr.de>; Thu, 26 Aug 2021 16:31:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242829AbhHZOcm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 Aug 2021 10:32:42 -0400
Received: from mga03.intel.com ([134.134.136.65]:40917 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242820AbhHZOcl (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 26 Aug 2021 10:32:41 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10088"; a="217789901"
X-IronPort-AV: E=Sophos;i="5.84,353,1620716400"; 
   d="scan'208";a="217789901"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2021 07:31:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,353,1620716400"; 
   d="scan'208";a="598501023"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 26 Aug 2021 07:31:52 -0700
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Ulrich Huber <ulrich@huberulrich.de>
Cc:     linux-usb@vger.kernel.org
Subject: [RFC PATCH 5/7] usb: typec: ucsi: Check the partner alt modes always if there is PD contract
Date:   Thu, 26 Aug 2021 17:31:44 +0300
Message-Id: <20210826143146.25799-6-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210826143146.25799-1-heikki.krogerus@linux.intel.com>
References: <20210826143146.25799-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

UCSI does not tell the driver explicitly when the firmware
(PPM in UCSI lingo) has actually detected the partner
alternate modes, there is no specific change event for that.
That's why they have to be checked with any notification
that informs that PD contract with that partner has been
achieved.

Previously the alternate modes were checked always when the
firmware (PPM) informed that something with the partner had
changed, but on some platforms the EC firmware does not
generate separate events for generic partner changes at all.
On those platforms the EC firmware notifies the driver only
about connections, or separately about the PD contract if it
was not achieved soon enough after the initial connection
event.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/ucsi/ucsi.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 8af292141fe7b..188181737acf0 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -627,6 +627,7 @@ static void ucsi_pwr_opmode_change(struct ucsi_connector *con)
 		con->rdo = con->status.request_data_obj;
 		typec_set_pwr_opmode(con->port, TYPEC_PWR_MODE_PD);
 		ucsi_get_src_pdos(con, 1);
+		ucsi_partner_task(con, ucsi_check_altmodes, 30, 0);
 		break;
 	case UCSI_CONSTAT_PWR_OPMODE_TYPEC1_5:
 		con->rdo = 0;
@@ -726,8 +727,6 @@ static void ucsi_partner_change(struct ucsi_connector *con)
 	if (ret)
 		dev_err(con->ucsi->dev, "con:%d: failed to set usb role:%d\n",
 			con->num, u_role);
-
-	ucsi_partner_task(con, ucsi_check_altmodes, 30, 0);
 }
 
 static void ucsi_handle_connector_change(struct work_struct *work)
@@ -878,10 +877,15 @@ static void ucsi_handle_connector_change(struct work_struct *work)
 			break;
 		}
 
-		if (con->status.flags & UCSI_CONSTAT_CONNECTED)
+		if (con->status.flags & UCSI_CONSTAT_CONNECTED) {
 			ucsi_register_partner(con);
-		else
+
+			if (UCSI_CONSTAT_PWR_OPMODE(con->status.flags) ==
+			    UCSI_CONSTAT_PWR_OPMODE_PD)
+				ucsi_partner_task(con, ucsi_check_altmodes, 30, 0);
+		} else {
 			ucsi_unregister_partner(con);
+		}
 
 		ucsi_port_psy_changed(con);
 
@@ -1244,7 +1248,7 @@ static int ucsi_register_port(struct ucsi *ucsi, int index)
 		ret = 0;
 	}
 
-	if (con->partner)
+	if (UCSI_CONSTAT_PWR_OPMODE(con->status.flags) == UCSI_CONSTAT_PWR_OPMODE_PD)
 		ucsi_check_altmodes(con);
 
 	trace_ucsi_register_port(con->num, &con->status);
-- 
2.32.0


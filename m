Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EB1530B427
	for <lists+linux-usb@lfdr.de>; Tue,  2 Feb 2021 01:32:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229927AbhBBAbr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 1 Feb 2021 19:31:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229527AbhBBAbq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 1 Feb 2021 19:31:46 -0500
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com [IPv6:2607:f8b0:4864:20::549])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97342C061573
        for <linux-usb@vger.kernel.org>; Mon,  1 Feb 2021 16:31:06 -0800 (PST)
Received: by mail-pg1-x549.google.com with SMTP id f16so12602389pgh.3
        for <linux-usb@vger.kernel.org>; Mon, 01 Feb 2021 16:31:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to:cc;
        bh=hjpuSlb6P3bXjOUeqREpOYD2lH5I31G9zQvLZVeEB98=;
        b=qYrzgC9yxfnuj+YMkIfocI7w52BZSEvBnDaAEOBAfVC5+x/wSyKEU5mU5rw8/wMeC4
         A6xbEr8L8qQuBIyvmZUVzScNftJxLt0iaddPgUIXH75Zlsdxoi6mSgoXrPQsrmcpdZv4
         uSYoQeyKApWiaHtCFHmuGFKmg7RtrodUbqcD7TmrYe1zTLSygjRXWTMJkafSF5AWH/u2
         xY3oC4stDPgxMX6yPukV/PsvzA6VpuIXpPdoMCqct8wlSqkdKFWP4pL9NOH8qt9ceGkG
         qO74br8AOXFaCaDlEpEOpmTt4atdHrnTNvMilPhuOfNLTk38tscX57QmMfvp5gHkqu6O
         N+bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to:cc;
        bh=hjpuSlb6P3bXjOUeqREpOYD2lH5I31G9zQvLZVeEB98=;
        b=qTZfj8le6Hf3gQIqKOyTZodDJXgSyiFiDNwMnckIAiHjVz6GTQPJsgVnc14dTHLuLh
         BhR8DWQrJAQOLLLpwvCFdqCP42aAC+CxEtS2EKRfvwfFOqCo4fwmLZdQzqLziSZBw9+M
         LbsMHnmMEG3ymQl2ELnxWJeJ5sPfxe+dBM10n3onM75cX5GVcUMGx9oa0++h4KUjdS/n
         tr+wFbYWZvyUUcmNO/F4HawXtbS1zg/uPVSdjvTTcv24IlqqjfZ7StA2iW6Hz0RJKGB1
         Sa9PRmOnKTiKIBQsUunGVEhvnmtvelBDsGh/k5EPSGE3JOQyEfUidMAuM3kZ3Rgt7ocd
         wiMQ==
X-Gm-Message-State: AOAM533jFEoJE3CXQ144/V8DLll+qb7Bgl7vrGq7suWRG8MHr79VDfje
        8tRxddLW1FDYCJ9hptnaav/7htviR1c=
X-Google-Smtp-Source: ABdhPJy01DdtX3UOPJ2GfeB4NeGYSbgYQqGCgzTHV5yivS8c3jlPanGVvx3SWW5S2oNw01UfpxdFTpFyBxA=
Sender: "badhri via sendgmr" <badhri@badhri.mtv.corp.google.com>
X-Received: from badhri.mtv.corp.google.com ([2620:15c:211:201:d56c:119f:44fb:5da4])
 (user=badhri job=sendgmr) by 2002:a17:90a:df15:: with SMTP id
 gp21mr1338867pjb.63.1612225866129; Mon, 01 Feb 2021 16:31:06 -0800 (PST)
Date:   Mon,  1 Feb 2021 16:30:59 -0800
Message-Id: <20210202003101.221145-1-badhri@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.30.0.365.g02bc693789-goog
Subject: [PATCH v2 1/3] usb: typec: tcpm: Add Callback to Usb Communication
 capable partner
From:   Badhri Jagan Sridharan <badhri@google.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kyle Tso <kyletso@google.com>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Badhri Jagan Sridharan <badhri@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The USB Communications Capable bit indicates if port
partner is capable of communication over the USB data lines
(e.g. D+/- or SS Tx/Rx). Notify the status of the bit to low
level drivers to perform chip specific operation.
For instance, low level driver enables USB switches on D+/D-
lines to set up data path when the bit is set.

Refactored from patch initially authored by
Kyle Tso <kyletso@google.com>

Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
---
Changes since V1:
- Removed partner_usb_comm_capable flag.
- Fixed capable flag for SNK_NEGOTIATE_CAPABILITIES.
---
 drivers/usb/typec/tcpm/tcpm.c | 13 +++++++++++++
 include/linux/usb/tcpm.h      |  5 +++++
 2 files changed, 18 insertions(+)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 0afd8ef692e8..997a1a56c161 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -3429,6 +3429,14 @@ static void tcpm_unregister_altmodes(struct tcpm_port *port)
 	memset(modep, 0, sizeof(*modep));
 }
 
+static void tcpm_set_partner_usb_comm_capable(struct tcpm_port *port, bool capable)
+{
+	tcpm_log(port, "Setting usb_comm capable %s", capable ? "true" : "false");
+
+	if (port->tcpc->set_partner_usb_comm_capable)
+		port->tcpc->set_partner_usb_comm_capable(port->tcpc, capable);
+}
+
 static void tcpm_reset_port(struct tcpm_port *port)
 {
 	int ret;
@@ -3445,6 +3453,7 @@ static void tcpm_reset_port(struct tcpm_port *port)
 	port->attached = false;
 	port->pd_capable = false;
 	port->pps_data.supported = false;
+	tcpm_set_partner_usb_comm_capable(port, false);
 
 	/*
 	 * First Rx ID should be 0; set this to a sentinel of -1 so that
@@ -3785,6 +3794,8 @@ static void run_state_machine(struct tcpm_port *port)
 			}
 		} else {
 			tcpm_pd_send_control(port, PD_CTRL_ACCEPT);
+			tcpm_set_partner_usb_comm_capable(port,
+							  !!(port->sink_request & RDO_USB_COMM));
 			tcpm_set_state(port, SRC_TRANSITION_SUPPLY,
 				       PD_T_SRC_TRANSITION);
 		}
@@ -4004,6 +4015,8 @@ static void run_state_machine(struct tcpm_port *port)
 		break;
 	case SNK_NEGOTIATE_CAPABILITIES:
 		port->pd_capable = true;
+		tcpm_set_partner_usb_comm_capable(port,
+						  !!(port->source_caps[0] & PDO_FIXED_USB_COMM));
 		port->hard_reset_count = 0;
 		ret = tcpm_pd_send_request(port);
 		if (ret < 0) {
diff --git a/include/linux/usb/tcpm.h b/include/linux/usb/tcpm.h
index 3af99f85e8b9..42fcfbe10590 100644
--- a/include/linux/usb/tcpm.h
+++ b/include/linux/usb/tcpm.h
@@ -108,6 +108,10 @@ enum tcpm_transmit_type {
  *		is supported by TCPC, set this callback for TCPM to query
  *		whether vbus is at VSAFE0V when needed.
  *		Returns true when vbus is at VSAFE0V, false otherwise.
+ * @set_partner_usb_comm_capable:
+ *              Optional; The USB Communications Capable bit indicates if port
+ *              partner is capable of communication over the USB data lines
+ *              (e.g. D+/- or SS Tx/Rx). Called to notify the status of the bit.
  */
 struct tcpc_dev {
 	struct fwnode_handle *fwnode;
@@ -139,6 +143,7 @@ struct tcpc_dev {
 	int (*set_auto_vbus_discharge_threshold)(struct tcpc_dev *dev, enum typec_pwr_opmode mode,
 						 bool pps_active, u32 requested_vbus_voltage);
 	bool (*is_vbus_vsafe0v)(struct tcpc_dev *dev);
+	void (*set_partner_usb_comm_capable)(struct tcpc_dev *dev, bool enable);
 };
 
 struct tcpm_port;
-- 
2.30.0.365.g02bc693789-goog


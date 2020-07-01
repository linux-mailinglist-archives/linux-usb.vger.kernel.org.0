Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A0B9210A99
	for <lists+linux-usb@lfdr.de>; Wed,  1 Jul 2020 13:56:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730459AbgGAL43 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Jul 2020 07:56:29 -0400
Received: from mga07.intel.com ([134.134.136.100]:8600 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730374AbgGAL43 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 1 Jul 2020 07:56:29 -0400
IronPort-SDR: Sr8GntgOj3wRgVx27MNPgqeyblQAh2eto6CVZTKK3AzQOA76DoYnGdMz4Q35tdnjQE2bzWq5t1
 a2nfpt+gukhw==
X-IronPort-AV: E=McAfee;i="6000,8403,9668"; a="211608004"
X-IronPort-AV: E=Sophos;i="5.75,300,1589266800"; 
   d="scan'208";a="211608004"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2020 04:56:28 -0700
IronPort-SDR: za8VEdySbLBdepjdf1Pm6qoB6KF24icFD/cLXa+nDb/cXNm+0gIEn3nyvNEKhdTeYiSX9+JuRr
 YiiYR9KRzgaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,300,1589266800"; 
   d="scan'208";a="386988152"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 01 Jul 2020 04:56:27 -0700
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Prashant Malani <pmalani@chromium.org>,
        Benson Leung <bleung@chromium.org>,
        "Mani, Rajmohan" <rajmohan.mani@intel.com>,
        linux-usb@vger.kernel.org
Subject: [PATCH 4/4] usb: typec: intel_pmc_mux: Add support for USB4
Date:   Wed,  1 Jul 2020 14:56:18 +0300
Message-Id: <20200701115618.22482-5-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200701115618.22482-1-heikki.krogerus@linux.intel.com>
References: <20200701115618.22482-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The PMC mux-agent can be used also to enter USB4 mode. The
mux-agent does not have USB4 specific message, but it can be
put into the TBT3 alternate mode also with USB4. That is OK
because the controller is in any case the same with TBT3 and
USB4.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/mux/intel_pmc_mux.c | 67 +++++++++++++++++++++++----
 1 file changed, 58 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/typec/mux/intel_pmc_mux.c b/drivers/usb/typec/mux/intel_pmc_mux.c
index 31fa62f968fb2..2aba07c7b221a 100644
--- a/drivers/usb/typec/mux/intel_pmc_mux.c
+++ b/drivers/usb/typec/mux/intel_pmc_mux.c
@@ -10,6 +10,7 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
+#include <linux/usb/pd.h>
 #include <linux/usb/role.h>
 #include <linux/usb/typec_mux.h>
 #include <linux/usb/typec_dp.h>
@@ -231,6 +232,43 @@ pmc_usb_mux_tbt(struct pmc_usb_port *port, struct typec_mux_state *state)
 	return pmc_usb_command(port, (void *)&req, sizeof(req));
 }
 
+static int
+pmc_usb_mux_usb4(struct pmc_usb_port *port, struct typec_mux_state *state)
+{
+	struct enter_usb_data *data = state->data;
+	struct altmode_req req = { };
+	u8 cable_speed;
+
+	req.usage = PMC_USB_ALT_MODE;
+	req.usage |= port->usb3_port << PMC_USB_MSG_USB3_PORT_SHIFT;
+	req.mode_type = PMC_USB_MODE_TYPE_TBT << PMC_USB_MODE_TYPE_SHIFT;
+
+	/* USB4 Mode */
+	req.mode_data = PMC_USB_ALTMODE_FORCE_LSR;
+
+	if (data->active_link_training)
+		req.mode_data |= PMC_USB_ALTMODE_ACTIVE_LINK;
+
+	req.mode_data |= (port->orientation - 1) << PMC_USB_ALTMODE_ORI_SHIFT;
+	req.mode_data |= (port->role - 1) << PMC_USB_ALTMODE_UFP_SHIFT;
+
+	switch ((data->eudo & EUDO_CABLE_TYPE_MASK) >> EUDO_CABLE_TYPE_SHIFT) {
+	case EUDO_CABLE_TYPE_PASSIVE:
+		break;
+	case EUDO_CABLE_TYPE_OPTICAL:
+		req.mode_data |= PMC_USB_ALTMODE_CABLE_TYPE;
+		fallthrough;
+	default:
+		req.mode_data |= PMC_USB_ALTMODE_ACTIVE_CABLE;
+		break;
+	}
+
+	cable_speed = (data->eudo & EUDO_CABLE_SPEED_MASK) >> EUDO_CABLE_SPEED_SHIFT;
+	req.mode_data |= PMC_USB_ALTMODE_CABLE_SPD(cable_speed);
+
+	return pmc_usb_command(port, (void *)&req, sizeof(req));
+}
+
 static int pmc_usb_mux_safe_state(struct pmc_usb_port *port)
 {
 	u8 msg;
@@ -272,17 +310,28 @@ pmc_usb_mux_set(struct typec_mux *mux, struct typec_mux_state *state)
 {
 	struct pmc_usb_port *port = typec_mux_get_drvdata(mux);
 
-	if (!state->alt)
-		return 0;
-
 	if (state->mode == TYPEC_STATE_SAFE)
 		return pmc_usb_mux_safe_state(port);
-
-	switch (state->alt->svid) {
-	case USB_TYPEC_TBT_SID:
-		return pmc_usb_mux_tbt(port, state);
-	case USB_TYPEC_DP_SID:
-		return pmc_usb_mux_dp(port, state);
+	if (state->mode == TYPEC_STATE_USB)
+		return pmc_usb_connect(port);
+
+	if (state->alt) {
+		switch (state->alt->svid) {
+		case USB_TYPEC_TBT_SID:
+			return pmc_usb_mux_tbt(port, state);
+		case USB_TYPEC_DP_SID:
+			return pmc_usb_mux_dp(port, state);
+		}
+	} else {
+		switch (state->mode) {
+		case TYPEC_MODE_USB2:
+			/* REVISIT: Try with usb3_port set to 0? */
+			break;
+		case TYPEC_MODE_USB3:
+			return pmc_usb_connect(port);
+		case TYPEC_MODE_USB4:
+			return pmc_usb_mux_usb4(port, state);
+		}
 	}
 
 	return -EOPNOTSUPP;
-- 
2.27.0


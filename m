Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 581AD25FF4E
	for <lists+linux-usb@lfdr.de>; Mon,  7 Sep 2020 18:30:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729803AbgIGO0W (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Sep 2020 10:26:22 -0400
Received: from mga17.intel.com ([192.55.52.151]:19492 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729838AbgIGOYe (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 7 Sep 2020 10:24:34 -0400
IronPort-SDR: eH887xN8jM0cHeOtgpASmo9yUDwclJl8uSMmuIgX6hh79HDxpoZTiq27dXj0VgGBnlFWgZZ6np
 2T5nM1iCNX/g==
X-IronPort-AV: E=McAfee;i="6000,8403,9736"; a="138058731"
X-IronPort-AV: E=Sophos;i="5.76,402,1592895600"; 
   d="scan'208";a="138058731"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2020 07:24:33 -0700
IronPort-SDR: ivpi4LG/6g2NSaQLULYQ0F00GwvQvNX2JNmpG7lKe5Fdsa942t0TYCg3tj5pkR1vugtSbUa+eq
 OM/rJgfTt+fQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,402,1592895600"; 
   d="scan'208";a="406851366"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 07 Sep 2020 07:24:32 -0700
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     "Mani, Rajmohan" <rajmohan.mani@intel.com>,
        Utkarsh Patel <utkarsh.h.patel@intel.com>,
        linux-usb@vger.kernel.org
Subject: [PATCH v3 2/2] usb: typec: intel_pmc_mux: Support for device role (UFP)
Date:   Mon,  7 Sep 2020 17:24:28 +0300
Message-Id: <20200907142428.35838-3-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200907142428.35838-1-heikki.krogerus@linux.intel.com>
References: <20200907142428.35838-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This adds support for device data role, and data role
swapping. The driver no longer relies on the cached role, as
it may not be valid (for example after bootup). Instead, the
role is always checked by readding the port status from IOM.

Note. After this, the orientation is always only cached, so
the driver does not support scenario where the role is set
before orientation. It means the typec drivers must always
set the orientation first before role.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Reviewed-by: Rajmohan Mani <rajmohan.mani@intel.com>
Reviewed-by: Utkarsh Patel <utkarsh.h.patel@intel.com>
Tested-by: Utkarsh Patel <utkarsh.h.patel@intel.com>
---
 drivers/usb/typec/mux/intel_pmc_mux.c | 68 ++++++++++++++-------------
 1 file changed, 35 insertions(+), 33 deletions(-)

diff --git a/drivers/usb/typec/mux/intel_pmc_mux.c b/drivers/usb/typec/mux/intel_pmc_mux.c
index 4ee14423a2e3d..067313af79708 100644
--- a/drivers/usb/typec/mux/intel_pmc_mux.c
+++ b/drivers/usb/typec/mux/intel_pmc_mux.c
@@ -221,9 +221,6 @@ pmc_usb_mux_dp(struct pmc_usb_port *port, struct typec_mux_state *state)
 		return pmc_usb_mux_dp_hpd(port, state->data);
 	}
 
-	if (data->status & DP_STATUS_IRQ_HPD)
-		return pmc_usb_mux_dp_hpd(port, state->data);
-
 	req.usage = PMC_USB_ALT_MODE;
 	req.usage |= port->usb3_port << PMC_USB_MSG_USB3_PORT_SHIFT;
 	req.mode_type = PMC_USB_MODE_TYPE_DP << PMC_USB_MODE_TYPE_SHIFT;
@@ -333,39 +330,52 @@ static int pmc_usb_mux_safe_state(struct pmc_usb_port *port)
 	return pmc_usb_command(port, &msg, sizeof(msg));
 }
 
-static int pmc_usb_connect(struct pmc_usb_port *port)
+static int pmc_usb_disconnect(struct pmc_usb_port *port)
 {
+	struct typec_displayport_data data = { };
 	u8 msg[2];
 
-	if (port->iom_status & IOM_PORT_STATUS_CONNECTED)
+	if (!(port->iom_status & IOM_PORT_STATUS_CONNECTED))
 		return 0;
 
-	msg[0] = PMC_USB_CONNECT;
+	/* Clear DisplayPort HPD if it's still asserted. */
+	if (IOM_PORT_HPD_ASSERTED(port->iom_status))
+		pmc_usb_mux_dp_hpd(port, &data);
+
+	msg[0] = PMC_USB_DISCONNECT;
 	msg[0] |= port->usb3_port << PMC_USB_MSG_USB3_PORT_SHIFT;
 
 	msg[1] = port->usb2_port << PMC_USB_MSG_USB2_PORT_SHIFT;
-	msg[1] |= hsl_orientation(port) << PMC_USB_MSG_ORI_HSL_SHIFT;
-	msg[1] |= sbu_orientation(port) << PMC_USB_MSG_ORI_AUX_SHIFT;
 
 	return pmc_usb_command(port, msg, sizeof(msg));
 }
 
-static int pmc_usb_disconnect(struct pmc_usb_port *port)
+static int pmc_usb_connect(struct pmc_usb_port *port, enum usb_role role)
 {
-	struct typec_displayport_data data = { };
+	u8 ufp = role == USB_ROLE_DEVICE ? 1 : 0;
 	u8 msg[2];
+	int ret;
 
-	if (!(port->iom_status & IOM_PORT_STATUS_CONNECTED))
-		return 0;
+	if (port->orientation == TYPEC_ORIENTATION_NONE)
+		return -EINVAL;
 
-	/* Clear DisplayPort HPD if it's still asserted. */
-	if (IOM_PORT_HPD_ASSERTED(port->iom_status))
-		pmc_usb_mux_dp_hpd(port, &data);
+	if (port->iom_status & IOM_PORT_STATUS_CONNECTED) {
+		if (port->role == role || port->role == USB_ROLE_NONE)
+			return 0;
 
-	msg[0] = PMC_USB_DISCONNECT;
+		/* Role swap */
+		ret = pmc_usb_disconnect(port);
+		if (ret)
+			return ret;
+	}
+
+	msg[0] = PMC_USB_CONNECT;
 	msg[0] |= port->usb3_port << PMC_USB_MSG_USB3_PORT_SHIFT;
 
 	msg[1] = port->usb2_port << PMC_USB_MSG_USB2_PORT_SHIFT;
+	msg[1] |= ufp << PMC_USB_MSG_UFP_SHIFT;
+	msg[1] |= hsl_orientation(port) << PMC_USB_MSG_ORI_HSL_SHIFT;
+	msg[1] |= sbu_orientation(port) << PMC_USB_MSG_ORI_AUX_SHIFT;
 
 	return pmc_usb_command(port, msg, sizeof(msg));
 }
@@ -383,7 +393,7 @@ pmc_usb_mux_set(struct typec_mux *mux, struct typec_mux_state *state)
 	if (state->mode == TYPEC_STATE_SAFE)
 		return pmc_usb_mux_safe_state(port);
 	if (state->mode == TYPEC_STATE_USB)
-		return pmc_usb_connect(port);
+		return pmc_usb_connect(port, port->role);
 
 	if (state->alt) {
 		switch (state->alt->svid) {
@@ -398,7 +408,7 @@ pmc_usb_mux_set(struct typec_mux *mux, struct typec_mux_state *state)
 			/* REVISIT: Try with usb3_port set to 0? */
 			break;
 		case TYPEC_MODE_USB3:
-			return pmc_usb_connect(port);
+			return pmc_usb_connect(port, port->role);
 		case TYPEC_MODE_USB4:
 			return pmc_usb_mux_usb4(port, state);
 		}
@@ -416,32 +426,24 @@ static int pmc_usb_set_orientation(struct typec_switch *sw,
 
 	port->orientation = orientation;
 
-	if (port->role) {
-		if (orientation == TYPEC_ORIENTATION_NONE)
-			return pmc_usb_disconnect(port);
-		else
-			return pmc_usb_connect(port);
-	}
-
 	return 0;
 }
 
 static int pmc_usb_set_role(struct usb_role_switch *sw, enum usb_role role)
 {
 	struct pmc_usb_port *port = usb_role_switch_get_drvdata(sw);
+	int ret;
 
 	update_port_status(port);
 
-	port->role = role;
+	if (role == USB_ROLE_NONE)
+		ret = pmc_usb_disconnect(port);
+	else
+		ret = pmc_usb_connect(port, role);
 
-	if (port->orientation) {
-		if (role == USB_ROLE_NONE)
-			return pmc_usb_disconnect(port);
-		else
-			return pmc_usb_connect(port);
-	}
+	port->role = role;
 
-	return 0;
+	return ret;
 }
 
 static int pmc_usb_register_port(struct pmc_usb *pmc, int index,
-- 
2.28.0


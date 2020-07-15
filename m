Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E29B220E08
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jul 2020 15:23:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731674AbgGONXQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Jul 2020 09:23:16 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:49970 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1731466AbgGONXO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Jul 2020 09:23:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1594819393;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=IZORDFMpyEouFhz1Bt8G1EZjIt5BLlmJaP0huVnVmuo=;
        b=AJAiAoFrkM/LPWZI+3s43eH2knhh2xZMxtoo3pVSl1lUurFpm5dQz/AB+IqNcIcR5y8q2Q
        O1WWDI0Kbm0Om2MtgO2MzGWyS2VgwcLT4VyN8IW4aioRcemUqo3Orq/mJteoOQ+jydbWOT
        0ZKD4yrNSJuhsfX9Msu/AWSKiFPZoCk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-194-TX4fgRd7PJ-CLQrE7A-dRw-1; Wed, 15 Jul 2020 09:23:10 -0400
X-MC-Unique: TX4fgRd7PJ-CLQrE7A-dRw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7DD5480183C;
        Wed, 15 Jul 2020 13:23:09 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-113-224.ams2.redhat.com [10.36.113.224])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 7051560BF4;
        Wed, 15 Jul 2020 13:23:08 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-usb@vger.kernel.org
Subject: [PATCH 4/6] usb: typec: tcpm: Refactor tcpm_handle_vdm_request
Date:   Wed, 15 Jul 2020 15:22:59 +0200
Message-Id: <20200715132301.99816-5-hdegoede@redhat.com>
In-Reply-To: <20200715132301.99816-1-hdegoede@redhat.com>
References: <20200715132301.99816-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Refactor tcpm_handle_vdm_request and its tcpm_pd_svdm helper function so
that reporting the results of the vdm to the altmode-driver is separated
out into a clear separate step inside tcpm_handle_vdm_request, instead
of being scattered over various places inside the tcpm_pd_svdm helper.

This is a preparation patch for fixing an AB BA lock inversion between the
tcpm code and some altmode drivers.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/usb/typec/tcpm/tcpm.c | 80 +++++++++++++++++++++--------------
 1 file changed, 49 insertions(+), 31 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index bf5a0322dbfe..4745b4062000 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -159,6 +159,14 @@ enum pd_msg_request {
 	PD_MSG_DATA_SOURCE_CAP,
 };
 
+enum adev_actions {
+	ADEV_NONE = 0,
+	ADEV_NOTIFY_USB_AND_QUEUE_VDM,
+	ADEV_QUEUE_VDM,
+	ADEV_QUEUE_VDM_SEND_EXIT_MODE_ON_FAIL,
+	ADEV_ATTENTION,
+};
+
 /* Events from low level driver */
 
 #define TCPM_CC_EVENT		BIT(0)
@@ -1079,9 +1087,8 @@ static void tcpm_register_partner_altmodes(struct tcpm_port *port)
 #define supports_modal(port)	PD_IDH_MODAL_SUPP((port)->partner_ident.id_header)
 
 static int tcpm_pd_svdm(struct tcpm_port *port, const u32 *p, int cnt,
-			u32 *response)
+			u32 *response, enum adev_actions *adev_action)
 {
-	struct typec_altmode *adev;
 	struct typec_altmode *pdev;
 	struct pd_mode_data *modep;
 	int rlen = 0;
@@ -1097,9 +1104,6 @@ static int tcpm_pd_svdm(struct tcpm_port *port, const u32 *p, int cnt,
 
 	modep = &port->mode_data;
 
-	adev = typec_match_altmode(port->port_altmode, ALTMODE_DISCOVERY_MAX,
-				   PD_VDO_VID(p[0]), PD_VDO_OPOS(p[0]));
-
 	pdev = typec_match_altmode(port->partner_altmode, ALTMODE_DISCOVERY_MAX,
 				   PD_VDO_VID(p[0]), PD_VDO_OPOS(p[0]));
 
@@ -1125,8 +1129,7 @@ static int tcpm_pd_svdm(struct tcpm_port *port, const u32 *p, int cnt,
 			break;
 		case CMD_ATTENTION:
 			/* Attention command does not have response */
-			if (adev)
-				typec_altmode_attention(adev, p[1]);
+			*adev_action = ADEV_ATTENTION;
 			return 0;
 		default:
 			break;
@@ -1178,27 +1181,18 @@ static int tcpm_pd_svdm(struct tcpm_port *port, const u32 *p, int cnt,
 			}
 			break;
 		case CMD_ENTER_MODE:
-			if (adev && pdev) {
+			if (pdev)
 				typec_altmode_update_active(pdev, true);
 
-				if (typec_altmode_vdm(adev, p[0], &p[1], cnt)) {
-					response[0] = VDO(adev->svid, 1,
-							  CMD_EXIT_MODE);
-					response[0] |= VDO_OPOS(adev->mode);
-					return 1;
-				}
-			}
+			*adev_action = ADEV_QUEUE_VDM_SEND_EXIT_MODE_ON_FAIL;
 			return 0;
 		case CMD_EXIT_MODE:
-			if (adev && pdev) {
+			if (pdev)
 				typec_altmode_update_active(pdev, false);
 
-				/* Back to USB Operation */
-				WARN_ON(typec_altmode_notify(adev,
-							     TYPEC_STATE_USB,
-							     NULL));
-			}
-			break;
+			/* Back to USB Operation */
+			*adev_action = ADEV_NOTIFY_USB_AND_QUEUE_VDM;
+			return 0;
 		default:
 			break;
 		}
@@ -1207,11 +1201,8 @@ static int tcpm_pd_svdm(struct tcpm_port *port, const u32 *p, int cnt,
 		switch (cmd) {
 		case CMD_ENTER_MODE:
 			/* Back to USB Operation */
-			if (adev)
-				WARN_ON(typec_altmode_notify(adev,
-							     TYPEC_STATE_USB,
-							     NULL));
-			break;
+			*adev_action = ADEV_NOTIFY_USB_AND_QUEUE_VDM;
+			return 0;
 		default:
 			break;
 		}
@@ -1221,15 +1212,15 @@ static int tcpm_pd_svdm(struct tcpm_port *port, const u32 *p, int cnt,
 	}
 
 	/* Informing the alternate mode drivers about everything */
-	if (adev)
-		typec_altmode_vdm(adev, p[0], &p[1], cnt);
-
+	*adev_action = ADEV_QUEUE_VDM;
 	return rlen;
 }
 
 static void tcpm_handle_vdm_request(struct tcpm_port *port,
 				    const __le32 *payload, int cnt)
 {
+	enum adev_actions adev_action = ADEV_NONE;
+	struct typec_altmode *adev;
 	u32 p[PD_MAX_PAYLOAD];
 	u32 response[8] = { };
 	int i, rlen = 0;
@@ -1237,6 +1228,9 @@ static void tcpm_handle_vdm_request(struct tcpm_port *port,
 	for (i = 0; i < cnt; i++)
 		p[i] = le32_to_cpu(payload[i]);
 
+	adev = typec_match_altmode(port->port_altmode, ALTMODE_DISCOVERY_MAX,
+				   PD_VDO_VID(p[0]), PD_VDO_OPOS(p[0]));
+
 	if (port->vdm_state == VDM_STATE_BUSY) {
 		/* If UFP responded busy retry after timeout */
 		if (PD_VDO_CMDT(p[0]) == CMDT_RSP_BUSY) {
@@ -1251,7 +1245,31 @@ static void tcpm_handle_vdm_request(struct tcpm_port *port,
 	}
 
 	if (PD_VDO_SVDM(p[0]))
-		rlen = tcpm_pd_svdm(port, p, cnt, response);
+		rlen = tcpm_pd_svdm(port, p, cnt, response, &adev_action);
+
+	if (adev) {
+		switch (adev_action) {
+		case ADEV_NONE:
+			break;
+		case ADEV_NOTIFY_USB_AND_QUEUE_VDM:
+			WARN_ON(typec_altmode_notify(adev, TYPEC_STATE_USB, NULL));
+			typec_altmode_vdm(adev, p[0], &p[1], cnt);
+			break;
+		case ADEV_QUEUE_VDM:
+			typec_altmode_vdm(adev, p[0], &p[1], cnt);
+			break;
+		case ADEV_QUEUE_VDM_SEND_EXIT_MODE_ON_FAIL:
+			if (typec_altmode_vdm(adev, p[0], &p[1], cnt)) {
+				response[0] = VDO(adev->svid, 1, CMD_EXIT_MODE);
+				response[0] |= VDO_OPOS(adev->mode);
+				rlen = 1;
+			}
+			break;
+		case ADEV_ATTENTION:
+			typec_altmode_attention(adev, p[1]);
+			break;
+		}
+	}
 
 	if (rlen > 0)
 		tcpm_queue_vdm_unlocked(port, response[0], &response[1], rlen - 1);
-- 
2.26.2


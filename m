Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53CAA22CC89
	for <lists+linux-usb@lfdr.de>; Fri, 24 Jul 2020 19:47:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726870AbgGXRrW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 Jul 2020 13:47:22 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:50616 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726826AbgGXRrV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 24 Jul 2020 13:47:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1595612840;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=PNttBmtCPFbt7GIbcwI5Z9ofeeDK+5XuWVhH4KjOMlg=;
        b=G6AjCvLQRgXizyZIfTzdlEXNpxv8wVMzeLPIM2Z+R8LAfYNOdWoPIsUNqJ2TC91oewM55f
        i1rCH429b81FGIACNRA+4+eN2T2JkcmzqZrhauOplXJbQftH6H4BAwFu6PPLQtHZk8rQN5
        JO+pUhvk1c/gBHFc4GDkdrxXmXN/Mcw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-409-SkBmXu7cP7Ss0FsxlC_Ldw-1; Fri, 24 Jul 2020 13:47:16 -0400
X-MC-Unique: SkBmXu7cP7Ss0FsxlC_Ldw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CDE66107ACCA;
        Fri, 24 Jul 2020 17:47:14 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-63.ams2.redhat.com [10.36.112.63])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 21AB15D9D3;
        Fri, 24 Jul 2020 17:47:12 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-usb@vger.kernel.org
Subject: [PATCH v2 4/6] usb: typec: tcpm: Refactor tcpm_handle_vdm_request
Date:   Fri, 24 Jul 2020 19:47:00 +0200
Message-Id: <20200724174702.61754-4-hdegoede@redhat.com>
In-Reply-To: <20200724174702.61754-1-hdegoede@redhat.com>
References: <20200724174702.61754-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Changes in v2:
- Keep "if (adev && pdev)" checks as is instead of modifying them
---
 drivers/usb/typec/tcpm/tcpm.c | 76 ++++++++++++++++++++++-------------
 1 file changed, 48 insertions(+), 28 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index ee239b54bcd8..03a0c083ee9a 100644
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
@@ -1078,10 +1086,10 @@ static void tcpm_register_partner_altmodes(struct tcpm_port *port)
 
 #define supports_modal(port)	PD_IDH_MODAL_SUPP((port)->partner_ident.id_header)
 
-static int tcpm_pd_svdm(struct tcpm_port *port, const u32 *p, int cnt,
-			u32 *response)
+static int tcpm_pd_svdm(struct tcpm_port *port, struct typec_altmode *adev,
+			const u32 *p, int cnt, u32 *response,
+			enum adev_actions *adev_action)
 {
-	struct typec_altmode *adev;
 	struct typec_altmode *pdev;
 	struct pd_mode_data *modep;
 	int rlen = 0;
@@ -1097,9 +1105,6 @@ static int tcpm_pd_svdm(struct tcpm_port *port, const u32 *p, int cnt,
 
 	modep = &port->mode_data;
 
-	adev = typec_match_altmode(port->port_altmode, ALTMODE_DISCOVERY_MAX,
-				   PD_VDO_VID(p[0]), PD_VDO_OPOS(p[0]));
-
 	pdev = typec_match_altmode(port->partner_altmode, ALTMODE_DISCOVERY_MAX,
 				   PD_VDO_VID(p[0]), PD_VDO_OPOS(p[0]));
 
@@ -1125,8 +1130,7 @@ static int tcpm_pd_svdm(struct tcpm_port *port, const u32 *p, int cnt,
 			break;
 		case CMD_ATTENTION:
 			/* Attention command does not have response */
-			if (adev)
-				typec_altmode_attention(adev, p[1]);
+			*adev_action = ADEV_ATTENTION;
 			return 0;
 		default:
 			break;
@@ -1180,23 +1184,15 @@ static int tcpm_pd_svdm(struct tcpm_port *port, const u32 *p, int cnt,
 		case CMD_ENTER_MODE:
 			if (adev && pdev) {
 				typec_altmode_update_active(pdev, true);
-
-				if (typec_altmode_vdm(adev, p[0], &p[1], cnt)) {
-					response[0] = VDO(adev->svid, 1,
-							  CMD_EXIT_MODE);
-					response[0] |= VDO_OPOS(adev->mode);
-					return 1;
-				}
+				*adev_action = ADEV_QUEUE_VDM_SEND_EXIT_MODE_ON_FAIL;
 			}
 			return 0;
 		case CMD_EXIT_MODE:
 			if (adev && pdev) {
 				typec_altmode_update_active(pdev, false);
-
 				/* Back to USB Operation */
-				WARN_ON(typec_altmode_notify(adev,
-							     TYPEC_STATE_USB,
-							     NULL));
+				*adev_action = ADEV_NOTIFY_USB_AND_QUEUE_VDM;
+				return 0;
 			}
 			break;
 		default:
@@ -1207,11 +1203,8 @@ static int tcpm_pd_svdm(struct tcpm_port *port, const u32 *p, int cnt,
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
@@ -1221,15 +1214,15 @@ static int tcpm_pd_svdm(struct tcpm_port *port, const u32 *p, int cnt,
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
@@ -1237,6 +1230,9 @@ static void tcpm_handle_vdm_request(struct tcpm_port *port,
 	for (i = 0; i < cnt; i++)
 		p[i] = le32_to_cpu(payload[i]);
 
+	adev = typec_match_altmode(port->port_altmode, ALTMODE_DISCOVERY_MAX,
+				   PD_VDO_VID(p[0]), PD_VDO_OPOS(p[0]));
+
 	if (port->vdm_state == VDM_STATE_BUSY) {
 		/* If UFP responded busy retry after timeout */
 		if (PD_VDO_CMDT(p[0]) == CMDT_RSP_BUSY) {
@@ -1251,7 +1247,31 @@ static void tcpm_handle_vdm_request(struct tcpm_port *port,
 	}
 
 	if (PD_VDO_SVDM(p[0]))
-		rlen = tcpm_pd_svdm(port, p, cnt, response);
+		rlen = tcpm_pd_svdm(port, adev, p, cnt, response, &adev_action);
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
 		tcpm_queue_vdm(port, response[0], &response[1], rlen - 1);
-- 
2.26.2


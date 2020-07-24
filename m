Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8725422CC88
	for <lists+linux-usb@lfdr.de>; Fri, 24 Jul 2020 19:47:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726768AbgGXRrR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 Jul 2020 13:47:17 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:29235 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726651AbgGXRrQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 24 Jul 2020 13:47:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1595612835;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=d+kla6yLNw8XZJ4UkW/EC77dE1bqbYEZBxuyfaadzzM=;
        b=agbN5x5F6YA+jJCUfWC3tEYKuIb/P4gXvhGodp2LDtP3QQyyuAhXlpEqBAqtW5bLVmfkUr
        cxnPJBuP7ZH92KwnhVemeQ25bgPcYSi49HjqT7p9bC/p0BPRADBqLhfdJEccRxuYO3KaPN
        Hg3H+2TcWF5Eoog0VNL7LBu17eGkxWo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-176-iKdg629dMTWM_65fSjvAoA-1; Fri, 24 Jul 2020 13:47:13 -0400
X-MC-Unique: iKdg629dMTWM_65fSjvAoA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CFC2B1B18BC0;
        Fri, 24 Jul 2020 17:47:11 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-63.ams2.redhat.com [10.36.112.63])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 5FCC65D9D3;
        Fri, 24 Jul 2020 17:47:09 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-usb@vger.kernel.org
Subject: [PATCH v2 3/6] usb: typec: tcpm: Refactor tcpm_handle_vdm_request payload handling
Date:   Fri, 24 Jul 2020 19:46:59 +0200
Message-Id: <20200724174702.61754-3-hdegoede@redhat.com>
In-Reply-To: <20200724174702.61754-1-hdegoede@redhat.com>
References: <20200724174702.61754-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Refactor the tcpm_handle_vdm_request payload handling by doing the
endianness conversion only once directly inside tcpm_handle_vdm_request
itself instead of doing it multiple times inside various helper functions
called by tcpm_handle_vdm_request.

This is a preparation patch for some further refactoring to fix an AB BA
lock inversion between the tcpm code and some altmode drivers.

Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/usb/typec/tcpm/tcpm.c | 49 ++++++++++++++++-------------------
 1 file changed, 22 insertions(+), 27 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 862c474b3ebd..ee239b54bcd8 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -981,16 +981,15 @@ static void tcpm_queue_vdm_unlocked(struct tcpm_port *port, const u32 header,
 	mutex_unlock(&port->lock);
 }
 
-static void svdm_consume_identity(struct tcpm_port *port, const __le32 *payload,
-				  int cnt)
+static void svdm_consume_identity(struct tcpm_port *port, const u32 *p, int cnt)
 {
-	u32 vdo = le32_to_cpu(payload[VDO_INDEX_IDH]);
-	u32 product = le32_to_cpu(payload[VDO_INDEX_PRODUCT]);
+	u32 vdo = p[VDO_INDEX_IDH];
+	u32 product = p[VDO_INDEX_PRODUCT];
 
 	memset(&port->mode_data, 0, sizeof(port->mode_data));
 
 	port->partner_ident.id_header = vdo;
-	port->partner_ident.cert_stat = le32_to_cpu(payload[VDO_INDEX_CSTAT]);
+	port->partner_ident.cert_stat = p[VDO_INDEX_CSTAT];
 	port->partner_ident.product = product;
 
 	typec_partner_set_identity(port->partner);
@@ -1000,17 +999,15 @@ static void svdm_consume_identity(struct tcpm_port *port, const __le32 *payload,
 		 PD_PRODUCT_PID(product), product & 0xffff);
 }
 
-static bool svdm_consume_svids(struct tcpm_port *port, const __le32 *payload,
-			       int cnt)
+static bool svdm_consume_svids(struct tcpm_port *port, const u32 *p, int cnt)
 {
 	struct pd_mode_data *pmdata = &port->mode_data;
 	int i;
 
 	for (i = 1; i < cnt; i++) {
-		u32 p = le32_to_cpu(payload[i]);
 		u16 svid;
 
-		svid = (p >> 16) & 0xffff;
+		svid = (p[i] >> 16) & 0xffff;
 		if (!svid)
 			return false;
 
@@ -1020,7 +1017,7 @@ static bool svdm_consume_svids(struct tcpm_port *port, const __le32 *payload,
 		pmdata->svids[pmdata->nsvids++] = svid;
 		tcpm_log(port, "SVID %d: 0x%x", pmdata->nsvids, svid);
 
-		svid = p & 0xffff;
+		svid = p[i] & 0xffff;
 		if (!svid)
 			return false;
 
@@ -1036,8 +1033,7 @@ static bool svdm_consume_svids(struct tcpm_port *port, const __le32 *payload,
 	return false;
 }
 
-static void svdm_consume_modes(struct tcpm_port *port, const __le32 *payload,
-			       int cnt)
+static void svdm_consume_modes(struct tcpm_port *port, const u32 *p, int cnt)
 {
 	struct pd_mode_data *pmdata = &port->mode_data;
 	struct typec_altmode_desc *paltmode;
@@ -1054,7 +1050,7 @@ static void svdm_consume_modes(struct tcpm_port *port, const __le32 *payload,
 
 		paltmode->svid = pmdata->svids[pmdata->svid_index];
 		paltmode->mode = i;
-		paltmode->vdo = le32_to_cpu(payload[i]);
+		paltmode->vdo = p[i];
 
 		tcpm_log(port, " Alternate mode %d: SVID 0x%04x, VDO %d: 0x%08x",
 			 pmdata->altmodes, paltmode->svid,
@@ -1082,21 +1078,17 @@ static void tcpm_register_partner_altmodes(struct tcpm_port *port)
 
 #define supports_modal(port)	PD_IDH_MODAL_SUPP((port)->partner_ident.id_header)
 
-static int tcpm_pd_svdm(struct tcpm_port *port, const __le32 *payload, int cnt,
+static int tcpm_pd_svdm(struct tcpm_port *port, const u32 *p, int cnt,
 			u32 *response)
 {
 	struct typec_altmode *adev;
 	struct typec_altmode *pdev;
 	struct pd_mode_data *modep;
-	u32 p[PD_MAX_PAYLOAD];
 	int rlen = 0;
 	int cmd_type;
 	int cmd;
 	int i;
 
-	for (i = 0; i < cnt; i++)
-		p[i] = le32_to_cpu(payload[i]);
-
 	cmd_type = PD_VDO_CMDT(p[0]);
 	cmd = PD_VDO_CMD(p[0]);
 
@@ -1157,13 +1149,13 @@ static int tcpm_pd_svdm(struct tcpm_port *port, const __le32 *payload, int cnt,
 		switch (cmd) {
 		case CMD_DISCOVER_IDENT:
 			/* 6.4.4.3.1 */
-			svdm_consume_identity(port, payload, cnt);
+			svdm_consume_identity(port, p, cnt);
 			response[0] = VDO(USB_SID_PD, 1, CMD_DISCOVER_SVID);
 			rlen = 1;
 			break;
 		case CMD_DISCOVER_SVID:
 			/* 6.4.4.3.2 */
-			if (svdm_consume_svids(port, payload, cnt)) {
+			if (svdm_consume_svids(port, p, cnt)) {
 				response[0] = VDO(USB_SID_PD, 1,
 						  CMD_DISCOVER_SVID);
 				rlen = 1;
@@ -1175,7 +1167,7 @@ static int tcpm_pd_svdm(struct tcpm_port *port, const __le32 *payload, int cnt,
 			break;
 		case CMD_DISCOVER_MODES:
 			/* 6.4.4.3.3 */
-			svdm_consume_modes(port, payload, cnt);
+			svdm_consume_modes(port, p, cnt);
 			modep->svid_index++;
 			if (modep->svid_index < modep->nsvids) {
 				u16 svid = modep->svids[modep->svid_index];
@@ -1238,15 +1230,18 @@ static int tcpm_pd_svdm(struct tcpm_port *port, const __le32 *payload, int cnt,
 static void tcpm_handle_vdm_request(struct tcpm_port *port,
 				    const __le32 *payload, int cnt)
 {
-	int rlen = 0;
+	u32 p[PD_MAX_PAYLOAD];
 	u32 response[8] = { };
-	u32 p0 = le32_to_cpu(payload[0]);
+	int i, rlen = 0;
+
+	for (i = 0; i < cnt; i++)
+		p[i] = le32_to_cpu(payload[i]);
 
 	if (port->vdm_state == VDM_STATE_BUSY) {
 		/* If UFP responded busy retry after timeout */
-		if (PD_VDO_CMDT(p0) == CMDT_RSP_BUSY) {
+		if (PD_VDO_CMDT(p[0]) == CMDT_RSP_BUSY) {
 			port->vdm_state = VDM_STATE_WAIT_RSP_BUSY;
-			port->vdo_retry = (p0 & ~VDO_CMDT_MASK) |
+			port->vdo_retry = (p[0] & ~VDO_CMDT_MASK) |
 				CMDT_INIT;
 			mod_delayed_work(port->wq, &port->vdm_state_machine,
 					 msecs_to_jiffies(PD_T_VDM_BUSY));
@@ -1255,8 +1250,8 @@ static void tcpm_handle_vdm_request(struct tcpm_port *port,
 		port->vdm_state = VDM_STATE_DONE;
 	}
 
-	if (PD_VDO_SVDM(p0))
-		rlen = tcpm_pd_svdm(port, payload, cnt, response);
+	if (PD_VDO_SVDM(p[0]))
+		rlen = tcpm_pd_svdm(port, p, cnt, response);
 
 	if (rlen > 0)
 		tcpm_queue_vdm(port, response[0], &response[1], rlen - 1);
-- 
2.26.2


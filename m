Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9956C22CC87
	for <lists+linux-usb@lfdr.de>; Fri, 24 Jul 2020 19:47:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726731AbgGXRrQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 Jul 2020 13:47:16 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:59818 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726397AbgGXRrP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 24 Jul 2020 13:47:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1595612833;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=whMkmJ8K1sam35g1ZDXGLIkKo4zO3wQs6tOpL6ggta4=;
        b=E2pT729ODcxX4VxO0kxz6v+zkNpYLZVL3PAgVrExzHa0b52xjo7UXykDSZVL33rWiRKJIF
        04ZBf88BW4nU1p2BsAArA8seGzmAgz1Omfg8vlE7Cd415v1jqWEJ0eV5bdcdCuqpLGeM5A
        pByzdc0PHYobb61B1P9WHf3BdgQ5YD0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-269-sWx-iq7INUG-pfCV4793CQ-1; Fri, 24 Jul 2020 13:47:06 -0400
X-MC-Unique: sWx-iq7INUG-pfCV4793CQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6ED241B18BC2;
        Fri, 24 Jul 2020 17:47:05 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-63.ams2.redhat.com [10.36.112.63])
        by smtp.corp.redhat.com (Postfix) with ESMTP id EB41C5D9D3;
        Fri, 24 Jul 2020 17:47:03 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-usb@vger.kernel.org
Subject: [PATCH v2 1/6] usb: typec: tcpm: Move mod_delayed_work(&port->vdm_state_machine) call into tcpm_queue_vdm()
Date:   Fri, 24 Jul 2020 19:46:57 +0200
Message-Id: <20200724174702.61754-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

All callers of tcpm_queue_vdm() immediately follow the tcpm_queue_vdm()
vdm call with a:

	mod_delayed_work(port->wq, &port->vdm_state_machine, 0);

Call, fold this into tcpm_queue_vdm() itself.

Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/usb/typec/tcpm/tcpm.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index b4a66e6bf68c..fc6455a29c74 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -967,6 +967,8 @@ static void tcpm_queue_vdm(struct tcpm_port *port, const u32 header,
 	/* Set ready, vdm state machine will actually send */
 	port->vdm_retries = 0;
 	port->vdm_state = VDM_STATE_READY;
+
+	mod_delayed_work(port->wq, &port->vdm_state_machine, 0);
 }
 
 static void svdm_consume_identity(struct tcpm_port *port, const __le32 *payload,
@@ -1246,10 +1248,8 @@ static void tcpm_handle_vdm_request(struct tcpm_port *port,
 	if (PD_VDO_SVDM(p0))
 		rlen = tcpm_pd_svdm(port, payload, cnt, response);
 
-	if (rlen > 0) {
+	if (rlen > 0)
 		tcpm_queue_vdm(port, response[0], &response[1], rlen - 1);
-		mod_delayed_work(port->wq, &port->vdm_state_machine, 0);
-	}
 }
 
 static void tcpm_send_vdm(struct tcpm_port *port, u32 vid, int cmd,
@@ -1264,8 +1264,6 @@ static void tcpm_send_vdm(struct tcpm_port *port, u32 vid, int cmd,
 	header = VDO(vid, ((vid & USB_SID_PD) == USB_SID_PD) ?
 			1 : (PD_VDO_CMD(cmd) <= CMD_ATTENTION), cmd);
 	tcpm_queue_vdm(port, header, data, count);
-
-	mod_delayed_work(port->wq, &port->vdm_state_machine, 0);
 }
 
 static unsigned int vdm_ready_timeout(u32 vdm_hdr)
@@ -1513,7 +1511,6 @@ static int tcpm_altmode_enter(struct typec_altmode *altmode, u32 *vdo)
 	header |= VDO_OPOS(altmode->mode);
 
 	tcpm_queue_vdm(port, header, vdo, vdo ? 1 : 0);
-	mod_delayed_work(port->wq, &port->vdm_state_machine, 0);
 	mutex_unlock(&port->lock);
 
 	return 0;
@@ -1529,7 +1526,6 @@ static int tcpm_altmode_exit(struct typec_altmode *altmode)
 	header |= VDO_OPOS(altmode->mode);
 
 	tcpm_queue_vdm(port, header, NULL, 0);
-	mod_delayed_work(port->wq, &port->vdm_state_machine, 0);
 	mutex_unlock(&port->lock);
 
 	return 0;
@@ -1542,7 +1538,6 @@ static int tcpm_altmode_vdm(struct typec_altmode *altmode,
 
 	mutex_lock(&port->lock);
 	tcpm_queue_vdm(port, header, data, count - 1);
-	mod_delayed_work(port->wq, &port->vdm_state_machine, 0);
 	mutex_unlock(&port->lock);
 
 	return 0;
-- 
2.26.2


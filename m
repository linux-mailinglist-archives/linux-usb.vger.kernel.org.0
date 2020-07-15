Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20D41220E07
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jul 2020 15:23:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731730AbgGONXP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Jul 2020 09:23:15 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:59747 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1731635AbgGONXO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Jul 2020 09:23:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1594819392;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=7CNemoFdpI+ZQzM8HgdvQ4GtzyMtmS4KO3dG49C8x+E=;
        b=LolSOQMLqJRVFKtqktaSWAThTjCBGbQ1KVODzha4Hp2d89BIcT1FgEBiy0G02SvOpOCL0Q
        FkphtYkMlo95bMnzQE+kg43FF1eH2QdyNR+XMt73jK28DEp8lrKXYms+Mzo4MKVACoC3yP
        hIrMiX/k2J6uAy9KxhvNnsLpsIGmZhQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-c_pPjoycNjmY1PfJ8ER91Q-1; Wed, 15 Jul 2020 09:23:08 -0400
X-MC-Unique: c_pPjoycNjmY1PfJ8ER91Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C40678014D4;
        Wed, 15 Jul 2020 13:23:06 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-113-224.ams2.redhat.com [10.36.113.224])
        by smtp.corp.redhat.com (Postfix) with ESMTP id B1B6E60BF4;
        Wed, 15 Jul 2020 13:23:05 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-usb@vger.kernel.org
Subject: [PATCH 2/6] usb: typec: tcpm: Move locking into tcpm_queue_vdm()
Date:   Wed, 15 Jul 2020 15:22:57 +0200
Message-Id: <20200715132301.99816-3-hdegoede@redhat.com>
In-Reply-To: <20200715132301.99816-1-hdegoede@redhat.com>
References: <20200715132301.99816-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Various callers (all the typec_altmode_ops) take the port-lock just for
the tcpm_queue_vdm() call.

Rename the raw (unlocked) tcpm_queue_vdm() call to
tcpm_queue_vdm_unlocked() and add a new tcpm_queue_vdm() helper which takes
the lock, so that its callers don't have to do this themselves.

This is a preparation patch for fixing an AB BA lock inversion between the
tcpm code and some altmode drivers.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/usb/typec/tcpm/tcpm.c | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index fc6455a29c74..30e997d6ea1e 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -958,9 +958,11 @@ static void tcpm_queue_message(struct tcpm_port *port,
 /*
  * VDM/VDO handling functions
  */
-static void tcpm_queue_vdm(struct tcpm_port *port, const u32 header,
-			   const u32 *data, int cnt)
+static void tcpm_queue_vdm_unlocked(struct tcpm_port *port, const u32 header,
+				    const u32 *data, int cnt)
 {
+	WARN_ON(!mutex_is_locked(&port->lock));
+
 	port->vdo_count = cnt + 1;
 	port->vdo_data[0] = header;
 	memcpy(&port->vdo_data[1], data, sizeof(u32) * cnt);
@@ -971,6 +973,14 @@ static void tcpm_queue_vdm(struct tcpm_port *port, const u32 header,
 	mod_delayed_work(port->wq, &port->vdm_state_machine, 0);
 }
 
+static void tcpm_queue_vdm(struct tcpm_port *port, const u32 header,
+			   const u32 *data, int cnt)
+{
+	mutex_lock(&port->lock);
+	tcpm_queue_vdm_unlocked(port, header, data, cnt);
+	mutex_unlock(&port->lock);
+}
+
 static void svdm_consume_identity(struct tcpm_port *port, const __le32 *payload,
 				  int cnt)
 {
@@ -1249,7 +1259,7 @@ static void tcpm_handle_vdm_request(struct tcpm_port *port,
 		rlen = tcpm_pd_svdm(port, payload, cnt, response);
 
 	if (rlen > 0)
-		tcpm_queue_vdm(port, response[0], &response[1], rlen - 1);
+		tcpm_queue_vdm_unlocked(port, response[0], &response[1], rlen - 1);
 }
 
 static void tcpm_send_vdm(struct tcpm_port *port, u32 vid, int cmd,
@@ -1263,7 +1273,7 @@ static void tcpm_send_vdm(struct tcpm_port *port, u32 vid, int cmd,
 	/* set VDM header with VID & CMD */
 	header = VDO(vid, ((vid & USB_SID_PD) == USB_SID_PD) ?
 			1 : (PD_VDO_CMD(cmd) <= CMD_ATTENTION), cmd);
-	tcpm_queue_vdm(port, header, data, count);
+	tcpm_queue_vdm_unlocked(port, header, data, count);
 }
 
 static unsigned int vdm_ready_timeout(u32 vdm_hdr)
@@ -1506,13 +1516,10 @@ static int tcpm_altmode_enter(struct typec_altmode *altmode, u32 *vdo)
 	struct tcpm_port *port = typec_altmode_get_drvdata(altmode);
 	u32 header;
 
-	mutex_lock(&port->lock);
 	header = VDO(altmode->svid, vdo ? 2 : 1, CMD_ENTER_MODE);
 	header |= VDO_OPOS(altmode->mode);
 
 	tcpm_queue_vdm(port, header, vdo, vdo ? 1 : 0);
-	mutex_unlock(&port->lock);
-
 	return 0;
 }
 
@@ -1521,13 +1528,10 @@ static int tcpm_altmode_exit(struct typec_altmode *altmode)
 	struct tcpm_port *port = typec_altmode_get_drvdata(altmode);
 	u32 header;
 
-	mutex_lock(&port->lock);
 	header = VDO(altmode->svid, 1, CMD_EXIT_MODE);
 	header |= VDO_OPOS(altmode->mode);
 
 	tcpm_queue_vdm(port, header, NULL, 0);
-	mutex_unlock(&port->lock);
-
 	return 0;
 }
 
@@ -1536,10 +1540,7 @@ static int tcpm_altmode_vdm(struct typec_altmode *altmode,
 {
 	struct tcpm_port *port = typec_altmode_get_drvdata(altmode);
 
-	mutex_lock(&port->lock);
 	tcpm_queue_vdm(port, header, data, count - 1);
-	mutex_unlock(&port->lock);
-
 	return 0;
 }
 
-- 
2.26.2


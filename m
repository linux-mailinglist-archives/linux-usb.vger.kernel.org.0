Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7418220E06
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jul 2020 15:23:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731703AbgGONXN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Jul 2020 09:23:13 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:52454 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1731632AbgGONXM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Jul 2020 09:23:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1594819391;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=eygM6ryWZb9MBz0z7DwJf48GdGrc3KYxU36piBEgFV0=;
        b=GrzOYeOjvDTg4x3X9wrLa8jqxOgTkEPP5jxUwAuAgfbrGZrziKCPKcDNRlwei0CIiDip/l
        kiWU07/U2u1RwAI0RR3Fw2aTBBQx7Vj2uGAIsXXNRXNkvC6ZNXxzfpq80ygNDn9k0BtAwS
        QYc646p/f+FDaYAM00l4rMr35p8ubQ4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-229-9yvRdy7PMKGV6fjV4YaUiA-1; Wed, 15 Jul 2020 09:23:06 -0400
X-MC-Unique: 9yvRdy7PMKGV6fjV4YaUiA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6C3CC1083;
        Wed, 15 Jul 2020 13:23:05 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-113-224.ams2.redhat.com [10.36.113.224])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 5D66860BF4;
        Wed, 15 Jul 2020 13:23:04 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-usb@vger.kernel.org
Subject: [PATCH 1/6] usb: typec: tcpm: Move mod_delayed_work(&port->vdm_state_machine) call into tcpm_queue_vdm()
Date:   Wed, 15 Jul 2020 15:22:56 +0200
Message-Id: <20200715132301.99816-2-hdegoede@redhat.com>
In-Reply-To: <20200715132301.99816-1-hdegoede@redhat.com>
References: <20200715132301.99816-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

All callers of tcpm_queue_vdm() immediately follow the tcpm_queue_vdm()
vdm call with a:

	mod_delayed_work(port->wq, &port->vdm_state_machine, 0);

Call, fold this into tcpm_queue_vdm() itself.

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


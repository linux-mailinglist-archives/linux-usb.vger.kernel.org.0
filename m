Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AE9B22CC86
	for <lists+linux-usb@lfdr.de>; Fri, 24 Jul 2020 19:47:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726658AbgGXRrP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 Jul 2020 13:47:15 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:47622 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726326AbgGXRrO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 24 Jul 2020 13:47:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1595612833;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=L7S43knbnAYk0Om6M73sjswfyqx/S0pq1H3QranG0T0=;
        b=fLBqFT3eb9KDnqURo511t3Wjne35RHJWJ4mlfrOEMApxReNdW4besX2MWciF6OyT5ZjLH+
        yMO5H0dW7ra6XRl1Imi3o4bDBM68MOP/GaLzLDXy5JJ8S7Ino/t8sPCTdq4dOS2Jypokz1
        iCX7zejtzRM7XZuwb2dieIVd92Nrkx0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-112-R9EXdoXGOxeh09mGxr1C0Q-1; Fri, 24 Jul 2020 13:47:11 -0400
X-MC-Unique: R9EXdoXGOxeh09mGxr1C0Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 17C9D801E6A;
        Fri, 24 Jul 2020 17:47:09 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-63.ams2.redhat.com [10.36.112.63])
        by smtp.corp.redhat.com (Postfix) with ESMTP id C3FE45D9D3;
        Fri, 24 Jul 2020 17:47:05 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-usb@vger.kernel.org
Subject: [PATCH v2 2/6] usb: typec: tcpm: Add tcpm_queue_vdm_unlocked() helper
Date:   Fri, 24 Jul 2020 19:46:58 +0200
Message-Id: <20200724174702.61754-2-hdegoede@redhat.com>
In-Reply-To: <20200724174702.61754-1-hdegoede@redhat.com>
References: <20200724174702.61754-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Various callers (all the typec_altmode_ops) take the port-lock just for
the tcpm_queue_vdm() call.

Add a new tcpm_queue_vdm_unlocked() helper which takes the lock, so that
its callers don't have to do this themselves.

This is a preparation patch for fixing an AB BA lock inversion between
the tcpm code and some altmode drivers.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
- Name the new helper tcpm_queue_vdm_unlocked() instead of renaming the
  original function to this
---
 drivers/usb/typec/tcpm/tcpm.c | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index fc6455a29c74..862c474b3ebd 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -961,6 +961,8 @@ static void tcpm_queue_message(struct tcpm_port *port,
 static void tcpm_queue_vdm(struct tcpm_port *port, const u32 header,
 			   const u32 *data, int cnt)
 {
+	WARN_ON(!mutex_is_locked(&port->lock));
+
 	port->vdo_count = cnt + 1;
 	port->vdo_data[0] = header;
 	memcpy(&port->vdo_data[1], data, sizeof(u32) * cnt);
@@ -971,6 +973,14 @@ static void tcpm_queue_vdm(struct tcpm_port *port, const u32 header,
 	mod_delayed_work(port->wq, &port->vdm_state_machine, 0);
 }
 
+static void tcpm_queue_vdm_unlocked(struct tcpm_port *port, const u32 header,
+				    const u32 *data, int cnt)
+{
+	mutex_lock(&port->lock);
+	tcpm_queue_vdm(port, header, data, cnt);
+	mutex_unlock(&port->lock);
+}
+
 static void svdm_consume_identity(struct tcpm_port *port, const __le32 *payload,
 				  int cnt)
 {
@@ -1506,13 +1516,10 @@ static int tcpm_altmode_enter(struct typec_altmode *altmode, u32 *vdo)
 	struct tcpm_port *port = typec_altmode_get_drvdata(altmode);
 	u32 header;
 
-	mutex_lock(&port->lock);
 	header = VDO(altmode->svid, vdo ? 2 : 1, CMD_ENTER_MODE);
 	header |= VDO_OPOS(altmode->mode);
 
-	tcpm_queue_vdm(port, header, vdo, vdo ? 1 : 0);
-	mutex_unlock(&port->lock);
-
+	tcpm_queue_vdm_unlocked(port, header, vdo, vdo ? 1 : 0);
 	return 0;
 }
 
@@ -1521,13 +1528,10 @@ static int tcpm_altmode_exit(struct typec_altmode *altmode)
 	struct tcpm_port *port = typec_altmode_get_drvdata(altmode);
 	u32 header;
 
-	mutex_lock(&port->lock);
 	header = VDO(altmode->svid, 1, CMD_EXIT_MODE);
 	header |= VDO_OPOS(altmode->mode);
 
-	tcpm_queue_vdm(port, header, NULL, 0);
-	mutex_unlock(&port->lock);
-
+	tcpm_queue_vdm_unlocked(port, header, NULL, 0);
 	return 0;
 }
 
@@ -1536,10 +1540,7 @@ static int tcpm_altmode_vdm(struct typec_altmode *altmode,
 {
 	struct tcpm_port *port = typec_altmode_get_drvdata(altmode);
 
-	mutex_lock(&port->lock);
-	tcpm_queue_vdm(port, header, data, count - 1);
-	mutex_unlock(&port->lock);
-
+	tcpm_queue_vdm_unlocked(port, header, data, count - 1);
 	return 0;
 }
 
-- 
2.26.2


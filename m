Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B0E022CC8B
	for <lists+linux-usb@lfdr.de>; Fri, 24 Jul 2020 19:47:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726971AbgGXRrY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 Jul 2020 13:47:24 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:23393 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726826AbgGXRrX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 24 Jul 2020 13:47:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1595612842;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2I112MFdsbDPPwKXfByfiQ4KTw63OFgWun/3tC0b8IQ=;
        b=HbtigDQJT5+OMd4bDU4GCfr/W452/vyus/Jtp6lwv5yqa2XnhQAEHQng9mTNJxqY1j6qBA
        2ERXDaOSIK3cpEapWjFvjkW+zrHi/4o2vfpANAVqYQE2R+AX9rwO4PWb2dx8RFqEjjyPo9
        q0inLfDH+o0CXGRSI9TaS5uF+vGJPFA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-353-Qod0WCnmOv-1lH3mnLAJHw-1; Fri, 24 Jul 2020 13:47:20 -0400
X-MC-Unique: Qod0WCnmOv-1lH3mnLAJHw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4EA76107ACCA;
        Fri, 24 Jul 2020 17:47:19 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-63.ams2.redhat.com [10.36.112.63])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 1FBED5D9D3;
        Fri, 24 Jul 2020 17:47:17 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-usb@vger.kernel.org
Subject: [PATCH v2 6/6] usb: typec: tcpm: Add WARN_ON ensure we are not trying to send 2 VDM packets at the same time
Date:   Fri, 24 Jul 2020 19:47:02 +0200
Message-Id: <20200724174702.61754-6-hdegoede@redhat.com>
In-Reply-To: <20200724174702.61754-1-hdegoede@redhat.com>
References: <20200724174702.61754-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The tcpm.c code for sending VDMs assumes that there will only be one VDM
in flight at the time. The "queue" used by tcpm_queue_vdm is only 1 entry
deep.

This assumes that the higher layers (tcpm state-machine and alt-mode
drivers) ensure that queuing a new VDM before the old one has been
completely send (or it timed out) add a WARN_ON to check for this.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
- Fix typo in commit-msg subject
---
 drivers/usb/typec/tcpm/tcpm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 9b26b57a0172..cc786d558f14 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -971,6 +971,9 @@ static void tcpm_queue_vdm(struct tcpm_port *port, const u32 header,
 {
 	WARN_ON(!mutex_is_locked(&port->lock));
 
+	/* Make sure we are not still processing a previous VDM packet */
+	WARN_ON(port->vdm_state > VDM_STATE_DONE);
+
 	port->vdo_count = cnt + 1;
 	port->vdo_data[0] = header;
 	memcpy(&port->vdo_data[1], data, sizeof(u32) * cnt);
-- 
2.26.2


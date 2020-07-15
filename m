Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7467E220E0A
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jul 2020 15:23:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731721AbgGONXR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Jul 2020 09:23:17 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:31984 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1731746AbgGONXQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Jul 2020 09:23:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1594819394;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=zSpluyUKdUG79URZIXyRyDsj8DWnJBiQ7uAkyeWNNOw=;
        b=LPXq2qPwdwj4MxZMbhsLj4VGg85uZ+4xvf6SVgVUqHfCgdyx/WMFasL3FYg8+O6vSlVe/n
        tIpJTG+BfYDDIgZTJF+uQrZxLqa+SloaPQPTh9sZMOM822m6jqrsHHaRh1yPkT7aZ0k/hI
        ETb3pqLny1tsNxKN/M8DAGwTPTRTiKk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-232--LK6730_NdycayB6rBFl6A-1; Wed, 15 Jul 2020 09:23:13 -0400
X-MC-Unique: -LK6730_NdycayB6rBFl6A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3AB3E1083;
        Wed, 15 Jul 2020 13:23:12 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-113-224.ams2.redhat.com [10.36.113.224])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 2A3F160BF4;
        Wed, 15 Jul 2020 13:23:11 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-usb@vger.kernel.org
Subject: [PATCH 6/6] usb: typec: tcpm: Add WARN_ON ensure we are not tryong to send 2 VDM packets at the same time
Date:   Wed, 15 Jul 2020 15:23:01 +0200
Message-Id: <20200715132301.99816-7-hdegoede@redhat.com>
In-Reply-To: <20200715132301.99816-1-hdegoede@redhat.com>
References: <20200715132301.99816-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
 drivers/usb/typec/tcpm/tcpm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index ea14240423d1..5adc30666566 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -971,6 +971,9 @@ static void tcpm_queue_vdm_unlocked(struct tcpm_port *port, const u32 header,
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


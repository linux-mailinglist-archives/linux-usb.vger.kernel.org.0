Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 075D5220E09
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jul 2020 15:23:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731694AbgGONXQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Jul 2020 09:23:16 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:55216 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1731632AbgGONXP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Jul 2020 09:23:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1594819393;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2GHkjXa5QzjbUQ3/921CfjxB8LSwQlSmMfE01bQxcg4=;
        b=GGfuxse4brJbHi1P+h52YpTS877keLs9CmwyeN55Z3bPXeVyoETl1Z+4tBptZrUfap1juF
        3RjnfaXPzeprYuCyig7a6UoOomVT4ZoWL0O40C0N81w6nV4HurPagfPeA/3/B/NJH7wL2J
        yXPcp77P0PstadiazfHmcQApz3F5jXM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-362-HqqJBpSxOMKLP5nX3WF84A-1; Wed, 15 Jul 2020 09:23:11 -0400
X-MC-Unique: HqqJBpSxOMKLP5nX3WF84A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D8AA3106B246;
        Wed, 15 Jul 2020 13:23:10 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-113-224.ams2.redhat.com [10.36.113.224])
        by smtp.corp.redhat.com (Postfix) with ESMTP id C67B760BF4;
        Wed, 15 Jul 2020 13:23:09 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-usb@vger.kernel.org
Subject: [PATCH 5/6] usb: typec: tcpm: Fix AB BA lock inversion between tcpm code and the alt-mode drivers
Date:   Wed, 15 Jul 2020 15:23:00 +0200
Message-Id: <20200715132301.99816-6-hdegoede@redhat.com>
In-Reply-To: <20200715132301.99816-1-hdegoede@redhat.com>
References: <20200715132301.99816-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

When we receive a PD data packet which ends up being for the alt-mode
driver we have the following lock order:

1. tcpm_pd_rx_handler take the tcpm-port lock
2. We call into the alt-mode driver which takes the alt-mode's lock

And when the alt-mode driver initiates communication we have the following
lock order:

3. alt-mode driver takes the alt-mode's lock
4. alt-mode driver calls tcpm_altmode_enter which takes the tcpm-port lock

This is a classic AB BA lock inversion issue.

With the refactoring of tcpm_handle_vdm_request() done before this patch,
we don't rely on, or need to make changes to the tcpm-port data by the
time we make call 2. from above. All data to be passed to the alt-mode
driver sits on our stack at this point, and thus does not need locking.

So after the refactoring we can simply fix this by releasing the
tcpm-port lock before calling into the alt-mode driver.

This fixes the following lockdep warning:

[  191.454238] ======================================================
[  191.454240] WARNING: possible circular locking dependency detected
[  191.454244] 5.8.0-rc5+ #1 Not tainted
[  191.454246] ------------------------------------------------------
[  191.454248] kworker/u8:5/794 is trying to acquire lock:
[  191.454251] ffff9bac8e30d4a8 (&dp->lock){+.+.}-{3:3}, at: dp_altmode_vdm+0x30/0xf0 [typec_displayport]
[  191.454263]
               but task is already holding lock:
[  191.454264] ffff9bac9dc240a0 (&port->lock#2){+.+.}-{3:3}, at: tcpm_pd_rx_handler+0x43/0x12c0 [tcpm]
[  191.454273]
               which lock already depends on the new lock.

[  191.454275]
               the existing dependency chain (in reverse order) is:
[  191.454277]
               -> #1 (&port->lock#2){+.+.}-{3:3}:
[  191.454286]        __mutex_lock+0x7b/0x820
[  191.454290]        tcpm_altmode_enter+0x23/0x90 [tcpm]
[  191.454293]        dp_altmode_work+0xca/0xe0 [typec_displayport]
[  191.454299]        process_one_work+0x23f/0x570
[  191.454302]        worker_thread+0x55/0x3c0
[  191.454305]        kthread+0x138/0x160
[  191.454309]        ret_from_fork+0x22/0x30
[  191.454311]
               -> #0 (&dp->lock){+.+.}-{3:3}:
[  191.454317]        __lock_acquire+0x1241/0x2090
[  191.454320]        lock_acquire+0xa4/0x3d0
[  191.454323]        __mutex_lock+0x7b/0x820
[  191.454326]        dp_altmode_vdm+0x30/0xf0 [typec_displayport]
[  191.454330]        tcpm_pd_rx_handler+0x11ae/0x12c0 [tcpm]
[  191.454333]        process_one_work+0x23f/0x570
[  191.454336]        worker_thread+0x55/0x3c0
[  191.454338]        kthread+0x138/0x160
[  191.454341]        ret_from_fork+0x22/0x30
[  191.454343]
               other info that might help us debug this:

[  191.454345]  Possible unsafe locking scenario:

[  191.454347]        CPU0                    CPU1
[  191.454348]        ----                    ----
[  191.454350]   lock(&port->lock#2);
[  191.454353]                                lock(&dp->lock);
[  191.454355]                                lock(&port->lock#2);
[  191.454357]   lock(&dp->lock);
[  191.454360]
                *** DEADLOCK ***

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/usb/typec/tcpm/tcpm.c | 31 ++++++++++++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 4745b4062000..ea14240423d1 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -1247,6 +1247,27 @@ static void tcpm_handle_vdm_request(struct tcpm_port *port,
 	if (PD_VDO_SVDM(p[0]))
 		rlen = tcpm_pd_svdm(port, p, cnt, response, &adev_action);
 
+	/*
+	 * We are done with any state stored in the port struct now, except
+	 * for any port struct changes done by the tcpm_queue_vdm() call
+	 * below, which is a separate operation.
+	 *
+	 * So we can safely release the lock here; and we MUST release the
+	 * lock here to avoid an AB BA lock inversion:
+	 *
+	 * If we keep the lock here then the lock ordering in this path is:
+	 * 1. tcpm_pd_rx_handler take the tcpm port lock
+	 * 2. One of the typec_altmode_* calls below takes the alt-mode's lock
+	 *
+	 * And we also have this ordering:
+	 * 1. alt-mode driver takes the alt-mode's lock
+	 * 2. alt-mode driver calls tcpm_altmode_enter which takes the
+	 *    tcpm port lock
+	 *
+	 * Dropping our lock here avoids this.
+	 */
+	mutex_unlock(&port->lock);
+
 	if (adev) {
 		switch (adev_action) {
 		case ADEV_NONE:
@@ -1272,7 +1293,15 @@ static void tcpm_handle_vdm_request(struct tcpm_port *port,
 	}
 
 	if (rlen > 0)
-		tcpm_queue_vdm_unlocked(port, response[0], &response[1], rlen - 1);
+		tcpm_queue_vdm(port, response[0], &response[1], rlen - 1);
+
+	/*
+	 * We must re-take the lock here to balance the unlock in
+	 * tcpm_pd_rx_handler, note that no changes are made while the lock
+	 * is held again. All that is done is unwinding the call stack until
+	 * we return to tcpm_pd_rx_handler and do the unlock there.
+	 */
+	mutex_lock(&port->lock);
 }
 
 static void tcpm_send_vdm(struct tcpm_port *port, u32 vid, int cmd,
-- 
2.26.2


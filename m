Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64B2122CC8A
	for <lists+linux-usb@lfdr.de>; Fri, 24 Jul 2020 19:47:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726901AbgGXRrX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 Jul 2020 13:47:23 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:54274 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726838AbgGXRrX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 24 Jul 2020 13:47:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1595612841;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=T/y68V4c4WcmgXC9p2IQHu3wJNHASeRisIJnWUDnpA0=;
        b=A9fMxxnRDW3yCP6vyr5kQ2sd6hfmE4Gy96Ktpnw4LtPZe/aFsno4Xnu5FId8oa4JdjsNgL
        pjOIdiagSMquSFDIN99/rECW7a7+6I1NCCLE7ZPr10w60JvFSsnJanObiDX27YgUw16qMx
        uEVH55rJHwLWokcXI9aWxqWIgPvD468=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-507-kpkbLZ_5MieHr6_l3eRIAw-1; Fri, 24 Jul 2020 13:47:19 -0400
X-MC-Unique: kpkbLZ_5MieHr6_l3eRIAw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CF204800483;
        Fri, 24 Jul 2020 17:47:17 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-63.ams2.redhat.com [10.36.112.63])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 415C05D9D3;
        Fri, 24 Jul 2020 17:47:15 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-usb@vger.kernel.org
Subject: [PATCH v2 5/6] usb: typec: tcpm: Fix AB BA lock inversion between tcpm code and the alt-mode drivers
Date:   Fri, 24 Jul 2020 19:47:01 +0200
Message-Id: <20200724174702.61754-5-hdegoede@redhat.com>
In-Reply-To: <20200724174702.61754-1-hdegoede@redhat.com>
References: <20200724174702.61754-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Changes in v2:
-Move the mutex_lock call to above the tcpm_queue_vdm() call, so that
 we can use the regular tcpm_queue_vdm() instead of having to call
 tcpm_queue_vdm_unlocked()
---
 drivers/usb/typec/tcpm/tcpm.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 03a0c083ee9a..9b26b57a0172 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -1249,6 +1249,27 @@ static void tcpm_handle_vdm_request(struct tcpm_port *port,
 	if (PD_VDO_SVDM(p[0]))
 		rlen = tcpm_pd_svdm(port, adev, p, cnt, response, &adev_action);
 
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
@@ -1273,6 +1294,15 @@ static void tcpm_handle_vdm_request(struct tcpm_port *port,
 		}
 	}
 
+	/*
+	 * We must re-take the lock here to balance the unlock in
+	 * tcpm_pd_rx_handler, note that no changes, other then the
+	 * tcpm_queue_vdm call, are made while the lock is held again.
+	 * All that is done after the call is unwinding the call stack until
+	 * we return to tcpm_pd_rx_handler and do the unlock there.
+	 */
+	mutex_lock(&port->lock);
+
 	if (rlen > 0)
 		tcpm_queue_vdm(port, response[0], &response[1], rlen - 1);
 }
-- 
2.26.2


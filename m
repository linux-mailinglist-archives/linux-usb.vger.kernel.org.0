Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2514F1AAB93
	for <lists+linux-usb@lfdr.de>; Wed, 15 Apr 2020 17:14:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393308AbgDOPOE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Apr 2020 11:14:04 -0400
Received: from mx2.suse.de ([195.135.220.15]:37978 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2393270AbgDOPOC (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 15 Apr 2020 11:14:02 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id C9C57AB5C;
        Wed, 15 Apr 2020 15:14:00 +0000 (UTC)
From:   Oliver Neukum <oneukum@suse.com>
To:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        jonas.karlsson@actia.se
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: [PATCH 1/2] cdc-acm: close race betrween suspend() and acm_softint
Date:   Wed, 15 Apr 2020 17:13:57 +0200
Message-Id: <20200415151358.32664-1-oneukum@suse.com>
X-Mailer: git-send-email 2.16.4
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Suspend increments a counter, then kills the URBs,
then kills the scheduled work. The scheduled work, however,
may reschedule the URBs. Fix this by having the work
check the counter.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
Tested-by: Jonas Karlsson <jonas.karlsson@actia.se>
---
 drivers/usb/class/cdc-acm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/class/cdc-acm.c b/drivers/usb/class/cdc-acm.c
index 84d6f7df09a4..4ef68e6671aa 100644
--- a/drivers/usb/class/cdc-acm.c
+++ b/drivers/usb/class/cdc-acm.c
@@ -557,14 +557,14 @@ static void acm_softint(struct work_struct *work)
 	struct acm *acm = container_of(work, struct acm, work);
 
 	if (test_bit(EVENT_RX_STALL, &acm->flags)) {
-		if (!(usb_autopm_get_interface(acm->data))) {
+		smp_mb(); /* against acm_suspend() */
+		if (!acm->susp_count) {
 			for (i = 0; i < acm->rx_buflimit; i++)
 				usb_kill_urb(acm->read_urbs[i]);
 			usb_clear_halt(acm->dev, acm->in);
 			acm_submit_read_urbs(acm, GFP_KERNEL);
-			usb_autopm_put_interface(acm->data);
+			clear_bit(EVENT_RX_STALL, &acm->flags);
 		}
-		clear_bit(EVENT_RX_STALL, &acm->flags);
 	}
 
 	if (test_and_clear_bit(EVENT_TTY_WAKEUP, &acm->flags))
-- 
2.16.4


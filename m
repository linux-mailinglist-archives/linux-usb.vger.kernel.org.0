Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D5891AA959
	for <lists+linux-usb@lfdr.de>; Wed, 15 Apr 2020 16:06:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2636394AbgDOODP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Apr 2020 10:03:15 -0400
Received: from mx2.suse.de ([195.135.220.15]:39436 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730833AbgDOODJ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 15 Apr 2020 10:03:09 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id ACD2BAFB2;
        Wed, 15 Apr 2020 14:03:06 +0000 (UTC)
From:   Oliver Neukum <oneukum@suse.com>
To:     johan@kernel.org, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: [PATCH] garmin_gps: add sanity checking for data length
Date:   Wed, 15 Apr 2020 16:03:04 +0200
Message-Id: <20200415140304.471-1-oneukum@suse.com>
X-Mailer: git-send-email 2.16.4
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

We must not process packets shorter than a packet ID

Signed-off-by: Oliver Neukum <oneukum@suse.com>
Reported-and-tested-by: syzbot+d29e9263e13ce0b9f4fd@syzkaller.appspotmail.com
---
 drivers/usb/serial/garmin_gps.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/serial/garmin_gps.c b/drivers/usb/serial/garmin_gps.c
index ffd984142171..a72fbbc65436 100644
--- a/drivers/usb/serial/garmin_gps.c
+++ b/drivers/usb/serial/garmin_gps.c
@@ -1138,8 +1138,8 @@ static void garmin_read_process(struct garmin_data *garmin_data_p,
 		   send it directly to the tty port */
 		if (garmin_data_p->flags & FLAGS_QUEUING) {
 			pkt_add(garmin_data_p, data, data_length);
-		} else if (bulk_data ||
-			   getLayerId(data) == GARMIN_LAYERID_APPL) {
+		} else if (bulk_data || (data_length >= sizeof(u32) &&
+			   getLayerId(data) == GARMIN_LAYERID_APPL)) {
 
 			spin_lock_irqsave(&garmin_data_p->lock, flags);
 			garmin_data_p->flags |= APP_RESP_SEEN;
-- 
2.16.4


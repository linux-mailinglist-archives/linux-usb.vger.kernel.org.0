Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A19026B7D8
	for <lists+linux-usb@lfdr.de>; Wed, 16 Sep 2020 02:31:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726781AbgIPAa5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 15 Sep 2020 20:30:57 -0400
Received: from mx2.suse.de ([195.135.220.15]:49416 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726539AbgIONpk (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 15 Sep 2020 09:45:40 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id C5D21B29F;
        Tue, 15 Sep 2020 13:45:31 +0000 (UTC)
From:   Oliver Neukum <oneukum@suse.com>
To:     gregKH@linuxfoundation.org, linux-usb@vger.kernel.org
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: [PATCH 2/2] UAS: fix disconnect by unplugging a hub
Date:   Tue, 15 Sep 2020 15:45:01 +0200
Message-Id: <20200915134501.13947-3-oneukum@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200915134501.13947-1-oneukum@suse.com>
References: <20200915134501.13947-1-oneukum@suse.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The SCSI layer can go into an ugly loop if you ignore that a device
is gone. You need to report an error in the command rather than
in the return value of the queue method.
We need to specifically check for ENODEV..

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/usb/storage/uas.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/storage/uas.c b/drivers/usb/storage/uas.c
index 842ca5c82091..19e730f9ad19 100644
--- a/drivers/usb/storage/uas.c
+++ b/drivers/usb/storage/uas.c
@@ -662,8 +662,7 @@ static int uas_queuecommand_lck(struct scsi_cmnd *cmnd,
 	if (devinfo->resetting) {
 		set_host_byte(cmnd, DID_ERROR);
 		cmnd->scsi_done(cmnd);
-		spin_unlock_irqrestore(&devinfo->lock, flags);
-		return 0;
+		goto zombie;
 	}
 
 	/* Find a free uas-tag */
@@ -699,6 +698,16 @@ static int uas_queuecommand_lck(struct scsi_cmnd *cmnd,
 		cmdinfo->state &= ~(SUBMIT_DATA_IN_URB | SUBMIT_DATA_OUT_URB);
 
 	err = uas_submit_urbs(cmnd, devinfo);
+	/*
+	 * in case of fatal errors the SCSI layer is peculiar
+	 * a command that has finished is a success for the purpose
+	 * of queueing, no matter how fatal the error
+	 */
+	if (err == -ENODEV) {
+		set_host_byte(cmnd, DID_ERROR);
+		cmnd->scsi_done(cmnd);
+		goto zombie;
+	}
 	if (err) {
 		/* If we did nothing, give up now */
 		if (cmdinfo->state & SUBMIT_STATUS_URB) {
@@ -709,6 +718,7 @@ static int uas_queuecommand_lck(struct scsi_cmnd *cmnd,
 	}
 
 	devinfo->cmnd[idx] = cmnd;
+zombie:
 	spin_unlock_irqrestore(&devinfo->lock, flags);
 	return 0;
 }
-- 
2.16.4


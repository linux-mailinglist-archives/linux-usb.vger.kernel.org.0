Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 969521C5990
	for <lists+linux-usb@lfdr.de>; Tue,  5 May 2020 16:30:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729426AbgEEOaY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 May 2020 10:30:24 -0400
Received: from mx2.suse.de ([195.135.220.15]:55644 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729148AbgEEOaX (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 5 May 2020 10:30:23 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 1A9F0AD03;
        Tue,  5 May 2020 14:30:25 +0000 (UTC)
From:   Hannes Reinecke <hare@suse.de>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Oliver Neukum <oneukum@suse.de>, linux-usb@vger.kernel.org,
        usb-storage@lists.one-eyed-alien.net,
        Hannes Reinecke <hare@suse.de>
Subject: [PATCH] sierra-ms: do not call scsi_get_host_dev()
Date:   Tue,  5 May 2020 16:30:19 +0200
Message-Id: <20200505143019.57418-1-hare@suse.de>
X-Mailer: git-send-email 2.16.4
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

scsi_get_host_dev() will create a virtual device such that either
the target id is ignored from scanning (if 'this_id' is set to
something which can be reached during scanning) or if the driver
needs a scsi device for the HBA to send commands to.
Neither is true for sierra-ms; 'this_id' remains at the default
value '-1' and the created device is never ever used within
the driver.
So kill it.

Signed-off-by: Hannes Reinecke <hare@suse.de>
---
 drivers/usb/storage/sierra_ms.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/usb/storage/sierra_ms.c b/drivers/usb/storage/sierra_ms.c
index e605cbc3d8bf..b9f78ef3edc3 100644
--- a/drivers/usb/storage/sierra_ms.c
+++ b/drivers/usb/storage/sierra_ms.c
@@ -129,15 +129,11 @@ int sierra_ms_init(struct us_data *us)
 	int result, retries;
 	struct swoc_info *swocInfo;
 	struct usb_device *udev;
-	struct Scsi_Host *sh;
 
 	retries = 3;
 	result = 0;
 	udev = us->pusb_dev;
 
-	sh = us_to_host(us);
-	scsi_get_host_dev(sh);
-
 	/* Force Modem mode */
 	if (swi_tru_install == TRU_FORCE_MODEM) {
 		usb_stor_dbg(us, "SWIMS: Forcing Modem Mode\n");
-- 
2.16.4


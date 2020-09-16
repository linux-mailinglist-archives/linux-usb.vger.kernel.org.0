Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4493826C0D9
	for <lists+linux-usb@lfdr.de>; Wed, 16 Sep 2020 11:40:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726699AbgIPJkr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Sep 2020 05:40:47 -0400
Received: from mx2.suse.de ([195.135.220.15]:48306 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726610AbgIPJkk (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 16 Sep 2020 05:40:40 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 35142B211;
        Wed, 16 Sep 2020 09:40:55 +0000 (UTC)
From:   Oliver Neukum <oneukum@suse.com>
To:     gregKH@linuxfoundation.org, linux-usb@vger.kernel.org
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: [PATCH 2/2] UAS: use macro for reporting results
Date:   Wed, 16 Sep 2020 11:40:26 +0200
Message-Id: <20200916094026.30085-3-oneukum@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200916094026.30085-1-oneukum@suse.com>
References: <20200916094026.30085-1-oneukum@suse.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The SCSI layer has introduced a new macro for recording the result
of a command. Use it.

v2: reorder patches

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/usb/storage/uas.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/storage/uas.c b/drivers/usb/storage/uas.c
index 13696f03f800..19e730f9ad19 100644
--- a/drivers/usb/storage/uas.c
+++ b/drivers/usb/storage/uas.c
@@ -279,17 +279,17 @@ static bool uas_evaluate_response_iu(struct response_iu *riu, struct scsi_cmnd *
 
 	switch (response_code) {
 	case RC_INCORRECT_LUN:
-		cmnd->result = DID_BAD_TARGET << 16;
+		set_host_byte(cmnd, DID_BAD_TARGET);
 		break;
 	case RC_TMF_SUCCEEDED:
-		cmnd->result = DID_OK << 16;
+		set_host_byte(cmnd, DID_OK);
 		break;
 	case RC_TMF_NOT_SUPPORTED:
-		cmnd->result = DID_TARGET_FAILURE << 16;
+		set_host_byte(cmnd, DID_TARGET_FAILURE);
 		break;
 	default:
 		uas_log_cmd_state(cmnd, "response iu", response_code);
-		cmnd->result = DID_ERROR << 16;
+		set_host_byte(cmnd, DID_ERROR);
 		break;
 	}
 
@@ -660,7 +660,7 @@ static int uas_queuecommand_lck(struct scsi_cmnd *cmnd,
 	spin_lock_irqsave(&devinfo->lock, flags);
 
 	if (devinfo->resetting) {
-		cmnd->result = DID_ERROR << 16;
+		set_host_byte(cmnd, DID_ERROR);
 		cmnd->scsi_done(cmnd);
 		goto zombie;
 	}
@@ -704,7 +704,7 @@ static int uas_queuecommand_lck(struct scsi_cmnd *cmnd,
 	 * of queueing, no matter how fatal the error
 	 */
 	if (err == -ENODEV) {
-		cmnd->result = DID_ERROR << 16;
+		set_host_byte(cmnd, DID_ERROR);
 		cmnd->scsi_done(cmnd);
 		goto zombie;
 	}
-- 
2.16.4


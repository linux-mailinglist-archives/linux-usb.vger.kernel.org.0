Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 562D126B7DB
	for <lists+linux-usb@lfdr.de>; Wed, 16 Sep 2020 02:31:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726546AbgIPAa7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 15 Sep 2020 20:30:59 -0400
Received: from mx2.suse.de ([195.135.220.15]:49354 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726507AbgIONpk (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 15 Sep 2020 09:45:40 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 75F14AFB8;
        Tue, 15 Sep 2020 13:45:31 +0000 (UTC)
From:   Oliver Neukum <oneukum@suse.com>
To:     gregKH@linuxfoundation.org, linux-usb@vger.kernel.org
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: [PATCH 1/2] UAS: use macro for reporting results
Date:   Tue, 15 Sep 2020 15:45:00 +0200
Message-Id: <20200915134501.13947-2-oneukum@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200915134501.13947-1-oneukum@suse.com>
References: <20200915134501.13947-1-oneukum@suse.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The SCSI layer has introduced a new macro for recording the result
of a command. Use it.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/usb/storage/uas.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/storage/uas.c b/drivers/usb/storage/uas.c
index d592071119ba..842ca5c82091 100644
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
 		spin_unlock_irqrestore(&devinfo->lock, flags);
 		return 0;
-- 
2.16.4


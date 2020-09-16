Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23F4826C167
	for <lists+linux-usb@lfdr.de>; Wed, 16 Sep 2020 12:03:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726473AbgIPKDV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Sep 2020 06:03:21 -0400
Received: from mx2.suse.de ([195.135.220.15]:58608 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726536AbgIPKDQ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 16 Sep 2020 06:03:16 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id D61F3AED9;
        Wed, 16 Sep 2020 10:03:29 +0000 (UTC)
From:   Oliver Neukum <oneukum@suse.com>
To:     gregKH@linuxfoundation.org, linux-usb@vger.kernel.org
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: [PATCH] microtek: use set_host_byte()
Date:   Wed, 16 Sep 2020 12:03:02 +0200
Message-Id: <20200916100302.30855-1-oneukum@suse.com>
X-Mailer: git-send-email 2.16.4
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The SCSI layer is providing a new macro. Let's use it.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/usb/image/microtek.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/image/microtek.c b/drivers/usb/image/microtek.c
index 360416680e82..59b02a539963 100644
--- a/drivers/usb/image/microtek.c
+++ b/drivers/usb/image/microtek.c
@@ -389,7 +389,7 @@ void mts_int_submit_urb (struct urb* transfer,
 	res = usb_submit_urb( transfer, GFP_ATOMIC );
 	if ( unlikely(res) ) {
 		MTS_INT_ERROR( "could not submit URB! Error was %d\n",(int)res );
-		context->srb->result = DID_ERROR << 16;
+		set_host_byte(context->srb, DID_ERROR);
 		mts_transfer_cleanup(transfer);
 	}
 }
@@ -438,7 +438,7 @@ static void mts_data_done( struct urb* transfer )
 		scsi_set_resid(context->srb, context->data_length -
 			       transfer->actual_length);
 	} else if ( unlikely(status) ) {
-		context->srb->result = (status == -ENOENT ? DID_ABORT : DID_ERROR)<<16;
+		set_host_byte(context->srb, (status == -ENOENT ? DID_ABORT : DID_ERROR));
 	}
 
 	mts_get_status(transfer);
@@ -455,12 +455,12 @@ static void mts_command_done( struct urb *transfer )
 	        if (status == -ENOENT) {
 		        /* We are being killed */
 			MTS_DEBUG_GOT_HERE();
-			context->srb->result = DID_ABORT<<16;
+			set_host_byte(context->srb, DID_ABORT);
                 } else {
 		        /* A genuine error has occurred */
 			MTS_DEBUG_GOT_HERE();
 
-		        context->srb->result = DID_ERROR<<16;
+		        set_host_byte(context->srb, DID_ERROR);
                 }
 		mts_transfer_cleanup(transfer);
 
@@ -495,7 +495,7 @@ static void mts_do_sg (struct urb* transfer)
 	                                          scsi_sg_count(context->srb));
 
 	if (unlikely(status)) {
-                context->srb->result = (status == -ENOENT ? DID_ABORT : DID_ERROR)<<16;
+                set_host_byte(context->srb, (status == -ENOENT ? DID_ABORT : DID_ERROR));
 		mts_transfer_cleanup(transfer);
         }
 
@@ -578,7 +578,7 @@ mts_scsi_queuecommand_lck(struct scsi_cmnd *srb, mts_scsi_cmnd_callback callback
 
 		MTS_DEBUG("this device doesn't exist\n");
 
-		srb->result = DID_BAD_TARGET << 16;
+		set_host_byte(srb, DID_BAD_TARGET);
 
 		if(likely(callback != NULL))
 			callback(srb);
@@ -605,7 +605,7 @@ mts_scsi_queuecommand_lck(struct scsi_cmnd *srb, mts_scsi_cmnd_callback callback
 
 	if(unlikely(res)){
 		MTS_ERROR("error %d submitting URB\n",(int)res);
-		srb->result = DID_ERROR << 16;
+		set_host_byte(srb, DID_ERROR);
 
 		if(likely(callback != NULL))
 			callback(srb);
-- 
2.16.4


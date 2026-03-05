Return-Path: <linux-usb+bounces-34061-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kM2bBvJbqWkL6AAAu9opvQ
	(envelope-from <linux-usb+bounces-34061-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 11:33:22 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F5CA20FBD6
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 11:33:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CEAE930630B5
	for <lists+linux-usb@lfdr.de>; Thu,  5 Mar 2026 10:29:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3E4237F739;
	Thu,  5 Mar 2026 10:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="B9rmpGts";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="B9rmpGts"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0202A37E2F5
	for <linux-usb@vger.kernel.org>; Thu,  5 Mar 2026 10:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772706556; cv=none; b=MYm9D2G6ddumdNxHplAPbOf9JG15A6M28ni3RR/oMayd5GjEbbz8SwHL3Ce3SkZx4zJkEQjuw6tHDg78usE9ntnhnA72xOlxNkR/LU9L/2Az0+nsyaRCw4iU5BF9XbRFvIbTnSb9FP/j3ia2KwCOAhSkLCYLSjaQDHhyg4jGpAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772706556; c=relaxed/simple;
	bh=5XiLo6cpiK+JYMPNNZ0dcgvejt8Sl1sHx0KfqnxdUng=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l6tEDuXRpH7/cyu+uaUEFOg5W/ldACEAgJb1QvqUcxtwgoGtBbsR4vXJAFy7L9hURwuYVYvs2xtzRYSqd3SY7IJQs1RwYebfEAXpisEN4Z2M6tfpsewKErvWg+4pJdZ9WORqWB36bsfBrWDzf/bR+re7LvHckcnsYSQOMwKJDCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=B9rmpGts; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=B9rmpGts; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 72E393F80A;
	Thu,  5 Mar 2026 10:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1772706553; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a8z0KRaKaqNugNAuUtpgPIvc3Ie9DAVGsIjKAIZG7ZE=;
	b=B9rmpGtsFQXrut3LFex8L9Jp+qAerN6cK5VOlJt4oTIN1+1dZupI6DksTuvyPQgsbeyIzw
	znOxvNbTqRiEFExHt5Wud8I9tdm1WTuNLdhECt/YRSNifQHukzcSKPye8v3IrWYtXBXD81
	QFL3erpzKdRsVsad48nU7EPIzkEbDR0=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1772706553; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a8z0KRaKaqNugNAuUtpgPIvc3Ie9DAVGsIjKAIZG7ZE=;
	b=B9rmpGtsFQXrut3LFex8L9Jp+qAerN6cK5VOlJt4oTIN1+1dZupI6DksTuvyPQgsbeyIzw
	znOxvNbTqRiEFExHt5Wud8I9tdm1WTuNLdhECt/YRSNifQHukzcSKPye8v3IrWYtXBXD81
	QFL3erpzKdRsVsad48nU7EPIzkEbDR0=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5673C3EA76;
	Thu,  5 Mar 2026 10:29:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id sGHpE/laqWkubwAAD6G6ig
	(envelope-from <oneukum@suse.com>); Thu, 05 Mar 2026 10:29:13 +0000
From: Oliver Neukum <oneukum@suse.com>
To: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org
Cc: Oliver Neukum <oneukum@suse.com>
Subject: [PATCH 2/5] usb: image: microtek: remove function trace macro
Date: Thu,  5 Mar 2026 11:28:32 +0100
Message-ID: <20260305102905.2392512-2-oneukum@suse.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260305102905.2392512-1-oneukum@suse.com>
References: <20260305102905.2392512-1-oneukum@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 6F5CA20FBD6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34061-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[oneukum@suse.com,linux-usb@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[suse.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

This functionality has been obsoleted by ftrace
Remove it

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/usb/image/microtek.c | 20 +-------------------
 1 file changed, 1 insertion(+), 19 deletions(-)

diff --git a/drivers/usb/image/microtek.c b/drivers/usb/image/microtek.c
index 3d58166f9d61..5a5999c7e2cb 100644
--- a/drivers/usb/image/microtek.c
+++ b/drivers/usb/image/microtek.c
@@ -184,11 +184,8 @@ static struct usb_driver mts_usb_driver = {
 #define MTS_DEBUG(x...) \
 	printk( KERN_DEBUG MTS_NAME x )
 
-#define MTS_DEBUG_GOT_HERE() \
-	MTS_DEBUG("got to %s:%d (%s)\n", __FILE__, (int)__LINE__, __func__ )
 #define MTS_DEBUG_INT() \
-	do { MTS_DEBUG_GOT_HERE(); \
-	     MTS_DEBUG("transfer = 0x%x context = 0x%x\n",(int)transfer,(int)context ); \
+	do { MTS_DEBUG("transfer = 0x%x context = 0x%x\n",(int)transfer,(int)context ); \
 	     MTS_DEBUG("status = 0x%x data-length = 0x%x sent = 0x%x\n",transfer->status,(int)context->data_length, (int)transfer->actual_length ); \
              mts_debug_dump(context->instance);\
 	   } while(0)
@@ -197,7 +194,6 @@ static struct usb_driver mts_usb_driver = {
 #define MTS_NUL_STATEMENT do { } while(0)
 
 #define MTS_DEBUG(x...)	MTS_NUL_STATEMENT
-#define MTS_DEBUG_GOT_HERE() MTS_NUL_STATEMENT
 #define MTS_DEBUG_INT() MTS_NUL_STATEMENT
 
 #endif
@@ -316,7 +312,6 @@ static inline void mts_debug_dump(struct mts_desc* dummy)
 #endif
 
 static inline void mts_urb_abort(struct mts_desc* desc) {
-	MTS_DEBUG_GOT_HERE();
 	mts_debug_dump(desc);
 
 	usb_kill_urb( desc->urb );
@@ -332,8 +327,6 @@ static int mts_scsi_abort(struct scsi_cmnd *srb)
 {
 	struct mts_desc* desc = (struct mts_desc*)(srb->device->host->hostdata[0]);
 
-	MTS_DEBUG_GOT_HERE();
-
 	mts_urb_abort(desc);
 
 	return FAILED;
@@ -344,7 +337,6 @@ static int mts_scsi_host_reset(struct scsi_cmnd *srb)
 	struct mts_desc* desc = (struct mts_desc*)(srb->device->host->hostdata[0]);
 	int result;
 
-	MTS_DEBUG_GOT_HERE();
 	mts_debug_dump(desc);
 
 	result = usb_lock_device_for_reset(desc->usb_dev, desc->usb_intf);
@@ -452,12 +444,9 @@ static void mts_command_done( struct urb *transfer )
 	if ( unlikely(status) ) {
 	        if (status == -ENOENT) {
 		        /* We are being killed */
-			MTS_DEBUG_GOT_HERE();
 			set_host_byte(context->srb, DID_ABORT);
                 } else {
 		        /* A genuine error has occurred */
-			MTS_DEBUG_GOT_HERE();
-
 		        set_host_byte(context->srb, DID_ERROR);
                 }
 		mts_transfer_cleanup(transfer);
@@ -523,8 +512,6 @@ mts_build_transfer_context(struct scsi_cmnd *srb, struct mts_desc* desc)
 {
 	int pipe;
 
-	MTS_DEBUG_GOT_HERE();
-
 	desc->context.instance = desc;
 	desc->context.srb = srb;
 
@@ -565,7 +552,6 @@ static enum scsi_qc_status mts_scsi_queuecommand_lck(struct scsi_cmnd *srb)
 	struct mts_desc* desc = (struct mts_desc*)(srb->device->host->hostdata[0]);
 	int res;
 
-	MTS_DEBUG_GOT_HERE();
 	mts_show_command(srb);
 	mts_debug_dump(desc);
 
@@ -666,19 +652,15 @@ static int mts_usb_probe(struct usb_interface *intf,
 	/* the current altsetting on the interface we're probing */
 	struct usb_host_interface *altsetting;
 
-	MTS_DEBUG_GOT_HERE();
 	MTS_DEBUG( "usb-device descriptor at %x\n", (int)dev );
 
 	MTS_DEBUG( "product id = 0x%x, vendor id = 0x%x\n",
 		   le16_to_cpu(dev->descriptor.idProduct),
 		   le16_to_cpu(dev->descriptor.idVendor) );
 
-	MTS_DEBUG_GOT_HERE();
-
 	/* the current altsetting on the interface we're probing */
 	altsetting = intf->cur_altsetting;
 
-
 	/* Check if the config is sane */
 
 	if ( altsetting->desc.bNumEndpoints != MTS_EP_TOTAL ) {
-- 
2.53.0



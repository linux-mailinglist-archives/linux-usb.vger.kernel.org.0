Return-Path: <linux-usb+bounces-34064-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +HlmExNbqWkL6AAAu9opvQ
	(envelope-from <linux-usb+bounces-34064-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 11:29:39 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B58720FB6D
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 11:29:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 922933013717
	for <lists+linux-usb@lfdr.de>; Thu,  5 Mar 2026 10:29:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85EE837F739;
	Thu,  5 Mar 2026 10:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="fGeM0VTH";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="USe7tcVp"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B91EF37C117
	for <linux-usb@vger.kernel.org>; Thu,  5 Mar 2026 10:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772706568; cv=none; b=Pc7c0mEP/jzF4WDgrvMoM8Rjhi6Gp/3ENtX1xZGeSEAPUdtR9fOJqvNkwMDfXKU+6mUddGMSgBqDascGAsYyx6m2vBqpWtukH8ZH4ifksIUu/SFFwSPh3zn/Bb6i0gTqUJ7qhSgWXGw1xtT3OdV5MZCFcIGv8kXL0Yl4ck9C15c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772706568; c=relaxed/simple;
	bh=FDI2T2e8KxAyEYfkXTFQSJmmkHBPNrkHmbT77SJ3PVA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rZZ6y//eIToudc/sz/GOqjTu/ouJNVZiWconWw0/5bG2lArlCzP9FBMPRdw5e0Txwbfr+Vlhv+t8pjsRmpiH7l7O/AchXj3bNAr4stAlKEF2gx5C0ae5NBGMZ5p654+xRh4fp216cCO4YS0FSMdL/pmc5+EBP3t6L8SsFG34+no=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=fGeM0VTH; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=USe7tcVp; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id F1B035BD57;
	Thu,  5 Mar 2026 10:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1772706554; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zyMCpV3tpOVj50sWLyrqjDfNLiBHb0HskVUV/OC+KbU=;
	b=fGeM0VTHEskPCuJhERwECjSWAn/xwfv4R1hGhfjZiAbDkczS8Iq0Y/sHzLN65u+7vIQI2L
	FlVQipglGIertP+RkuPsEhdGMjFMzFkI17ka8Tiyxt2CbVsEbxUlpNnak18deI19H6YyqQ
	YfTOylPjOEO+rm1ddkjukZD55qowCso=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1772706553; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zyMCpV3tpOVj50sWLyrqjDfNLiBHb0HskVUV/OC+KbU=;
	b=USe7tcVptfaF6g6P6a3XNVwGL/9uMY/ZLhDOenvBbGESyoDs6Xg2eA1VKJf3wXtIHzqyq8
	B4yxk/n62jg0N6CR6j/b7mXokmz81v0IyO7GqlkaoorUN+YnvHOxMLlJASUzhm4+1glrWH
	3PYCbHV4sncGPmjk8Ew/TCFBTjK+r2k=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D53B23EA76;
	Thu,  5 Mar 2026 10:29:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qCTnMvlaqWkubwAAD6G6ig
	(envelope-from <oneukum@suse.com>); Thu, 05 Mar 2026 10:29:13 +0000
From: Oliver Neukum <oneukum@suse.com>
To: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org
Cc: Oliver Neukum <oneukum@suse.com>
Subject: [PATCH 5/5] usb: image: microtek: use dev_warn and dev_err
Date: Thu,  5 Mar 2026 11:28:35 +0100
Message-ID: <20260305102905.2392512-5-oneukum@suse.com>
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
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 
X-Rspamd-Queue-Id: 4B58720FB6D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34064-lists,linux-usb=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,suse.com:dkim,suse.com:email,suse.com:mid]
X-Rspamd-Action: no action

Do not use useless private macros

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/usb/image/microtek.c | 30 ++++++++++++------------------
 1 file changed, 12 insertions(+), 18 deletions(-)

diff --git a/drivers/usb/image/microtek.c b/drivers/usb/image/microtek.c
index cd68aa27639e..1f0b3c44d388 100644
--- a/drivers/usb/image/microtek.c
+++ b/drivers/usb/image/microtek.c
@@ -169,13 +169,6 @@ static struct usb_driver mts_usb_driver = {
 #define MTS_VERSION	"0.4.3"
 #define MTS_NAME	"microtek usb (rev " MTS_VERSION "): "
 
-#define MTS_WARNING(x...) \
-	printk( KERN_WARNING MTS_NAME x )
-#define MTS_ERROR(x...) \
-	printk( KERN_ERR MTS_NAME x )
-#define MTS_INT_ERROR(x...) \
-	MTS_ERROR(x)
-
 #if defined MTS_DO_DEBUG
 
 #define MTS_DEBUG(x...) \
@@ -375,7 +368,8 @@ void mts_int_submit_urb (struct urb* transfer,
 
 	res = usb_submit_urb( transfer, GFP_ATOMIC );
 	if ( unlikely(res) ) {
-		MTS_INT_ERROR( "could not submit URB! Error was %d\n",(int)res );
+		dev_err(&context->instance->usb_dev->dev,
+			"could not submit URB! Error was %d\n",(int)res );
 		set_host_byte(context->srb, DID_ERROR);
 		mts_transfer_cleanup(transfer);
 	}
@@ -584,7 +578,7 @@ static enum scsi_qc_status mts_scsi_queuecommand_lck(struct scsi_cmnd *srb)
 	res=usb_submit_urb(desc->urb, GFP_ATOMIC);
 
 	if(unlikely(res)){
-		MTS_ERROR("error %d submitting URB\n",(int)res);
+		dev_err(&desc->usb_dev->dev, "error %d submitting URB\n",(int)res);
 		set_host_byte(srb, DID_ERROR);
 
 		if(likely(callback != NULL))
@@ -661,7 +655,7 @@ static int mts_usb_probe(struct usb_interface *intf,
 	/* Check if the config is sane */
 
 	if ( altsetting->desc.bNumEndpoints != MTS_EP_TOTAL ) {
-		MTS_WARNING( "expecting %d got %d endpoints! Bailing out.\n",
+		dev_warn(&dev->dev, "expecting %d got %d endpoints! Bailing out.\n",
 			     (int)MTS_EP_TOTAL, (int)altsetting->desc.bNumEndpoints );
 		return -ENODEV;
 	}
@@ -673,23 +667,23 @@ static int mts_usb_probe(struct usb_interface *intf,
 			if (ep_out == -1) {
 				ep_out = usb_endpoint_num(&altsetting->endpoint[i].desc);
 			} else {
-				MTS_WARNING( "can only deal with bulk endpoints; endpoint %d is not bulk.\n",
+				dev_warn(&dev->dev, "can only deal with bulk endpoints; endpoint %d is not bulk.\n",
 						usb_endpoint_num(&altsetting->endpoint[i].desc));
 				return -ENODEV;
 			}
 		} else {
-			MTS_WARNING( "can only deal with bulk endpoints; endpoint %d is not bulk.\n",
-					(int)altsetting->endpoint[i].desc.bEndpointAddress );
+			dev_warn(&dev->dev, "can only deal with bulk endpoints; endpoint %d is not bulk.\n",
+					usb_endpoint_num(&altsetting->endpoint[i].desc));
 		}
 	}
 
 	if (ep_in_current != &ep_in_set[2]) {
-		MTS_WARNING("couldn't find two input bulk endpoints. Bailing out.\n");
+		dev_warn(&dev->dev, "couldn't find two input bulk endpoints. Bailing out.\n");
 		return -ENODEV;
 	}
 
 	if ( ep_out == -1 ) {
-		MTS_WARNING( "couldn't find an output bulk endpoint. Bailing out.\n" );
+		dev_warn(&dev->dev, "couldn't find an output bulk endpoint. Bailing out.\n" );
 		return -ENODEV;
 	}
 
@@ -715,15 +709,15 @@ static int mts_usb_probe(struct usb_interface *intf,
 	new_desc->ep_image = ep_in_set[1];
 
 	if ( new_desc->ep_out != MTS_EP_OUT )
-		MTS_WARNING( "will this work? Command EP is not usually %d\n",
+		dev_warn(&dev->dev, "will this work? Command EP is not usually %d\n",
 			     (int)new_desc->ep_out );
 
 	if ( new_desc->ep_response != MTS_EP_RESPONSE )
-		MTS_WARNING( "will this work? Response EP is not usually %d\n",
+		dev_warn(&dev->dev, "will this work? Response EP is not usually %d\n",
 			     (int)new_desc->ep_response );
 
 	if ( new_desc->ep_image != MTS_EP_IMAGE )
-		MTS_WARNING( "will this work? Image data EP is not usually %d\n",
+		dev_warn(&dev->dev, "will this work? Image data EP is not usually %d\n",
 			     (int)new_desc->ep_image );
 
 	new_desc->host = scsi_host_alloc(&mts_scsi_host_template,
-- 
2.53.0



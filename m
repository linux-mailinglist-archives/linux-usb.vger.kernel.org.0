Return-Path: <linux-usb+bounces-34060-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WPQ2LABbqWkL6AAAu9opvQ
	(envelope-from <linux-usb+bounces-34060-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 11:29:20 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C3620FB4B
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 11:29:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B61683015B69
	for <lists+linux-usb@lfdr.de>; Thu,  5 Mar 2026 10:29:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E0F637F737;
	Thu,  5 Mar 2026 10:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="Ls+aD8i8";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="Ls+aD8i8"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0303437EFE6
	for <linux-usb@vger.kernel.org>; Thu,  5 Mar 2026 10:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772706556; cv=none; b=aS3JUNHr7iLt7/VzIWFEP3xmIZQYzkXoV+juRXyXKoZD4GScqeyFptRyTgNQHShvytXwgHRbqvRKWdQNNGrTLF7MUpp+PhsPkvrqBcBYBfvLrnQ6yycn6J1o17EBY+pDanxZIH/FzR2sii62bAPtUIPsCxz8r46DLbOhJprk6JU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772706556; c=relaxed/simple;
	bh=XFQ73FuNjWlt9nwTM7ZlkXW/CtRWPXORxUdpUV90qyU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jfFIuSumqNS1bDGUR6EvSslZwvOtDf7K1QiKYhoEzRObW6/GljmRypcnjqkU4GkXD/OzkhE3lC4xcZF8ss7xzm4av1UoRQaCByBthlNiczGD37WfstSE73Hw0k5iFUC0N1cA4OoVjnhxdXEdoz+kV3SadblLe7QE/bCxZTQhwVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=Ls+aD8i8; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=Ls+aD8i8; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 51BBB5BD04;
	Thu,  5 Mar 2026 10:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1772706553; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=xhSKMIsMHm3xhQHVqynugTSGxPDKCUg1/J4kpZt8e6k=;
	b=Ls+aD8i8X4FFuCyJDFtJluAq0EhyCQ7jS0qsZHY82ABkPURUSNFsAaxG/QEPxJuXqrmerG
	tthMfH3/m4QPmkEgiDZyunbQgYrCULuamfBOACN/MwZvM16E2T8VmiN8WQqPYfPNLDamer
	v1+53xpkAG7zLgMN03MDH5mbjiRw5Q0=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=Ls+aD8i8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1772706553; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=xhSKMIsMHm3xhQHVqynugTSGxPDKCUg1/J4kpZt8e6k=;
	b=Ls+aD8i8X4FFuCyJDFtJluAq0EhyCQ7jS0qsZHY82ABkPURUSNFsAaxG/QEPxJuXqrmerG
	tthMfH3/m4QPmkEgiDZyunbQgYrCULuamfBOACN/MwZvM16E2T8VmiN8WQqPYfPNLDamer
	v1+53xpkAG7zLgMN03MDH5mbjiRw5Q0=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 33C5E3EA68;
	Thu,  5 Mar 2026 10:29:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id FYZzC/laqWkubwAAD6G6ig
	(envelope-from <oneukum@suse.com>); Thu, 05 Mar 2026 10:29:13 +0000
From: Oliver Neukum <oneukum@suse.com>
To: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org
Cc: Oliver Neukum <oneukum@suse.com>
Subject: [PATCH 1/5] usb: image: microtek: cleanup ep handling
Date: Thu,  5 Mar 2026 11:28:31 +0100
Message-ID: <20260305102905.2392512-1-oneukum@suse.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 
X-Rspamd-Queue-Id: 59C3620FB4B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34060-lists,linux-usb=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

We now have macros for endpoint numbers, types and directions.
Use them.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/usb/image/microtek.c | 32 ++++++++++++--------------------
 1 file changed, 12 insertions(+), 20 deletions(-)

diff --git a/drivers/usb/image/microtek.c b/drivers/usb/image/microtek.c
index 45dc209f5fe5..3d58166f9d61 100644
--- a/drivers/usb/image/microtek.c
+++ b/drivers/usb/image/microtek.c
@@ -688,28 +688,20 @@ static int mts_usb_probe(struct usb_interface *intf,
 	}
 
 	for( i = 0; i < altsetting->desc.bNumEndpoints; i++ ) {
-		if ((altsetting->endpoint[i].desc.bmAttributes &
-		     USB_ENDPOINT_XFERTYPE_MASK) != USB_ENDPOINT_XFER_BULK) {
-
-			MTS_WARNING( "can only deal with bulk endpoints; endpoint %d is not bulk.\n",
-			     (int)altsetting->endpoint[i].desc.bEndpointAddress );
-		} else {
-			if (altsetting->endpoint[i].desc.bEndpointAddress &
-			    USB_DIR_IN)
-				*ep_in_current++
-					= altsetting->endpoint[i].desc.bEndpointAddress &
-					USB_ENDPOINT_NUMBER_MASK;
-			else {
-				if ( ep_out != -1 ) {
-					MTS_WARNING( "can only deal with one output endpoints. Bailing out." );
-					return -ENODEV;
-				}
-
-				ep_out = altsetting->endpoint[i].desc.bEndpointAddress &
-					USB_ENDPOINT_NUMBER_MASK;
+		if (usb_endpoint_is_bulk_in(&altsetting->endpoint[i].desc)) {
+			*ep_in_current++ = usb_endpoint_num(&altsetting->endpoint[i].desc);
+		} else if (usb_endpoint_is_bulk_out(&altsetting->endpoint[i].desc)) {
+			if (ep_out == -1) {
+				ep_out = usb_endpoint_num(&altsetting->endpoint[i].desc);
+			} else {
+				MTS_WARNING( "can only deal with bulk endpoints; endpoint %d is not bulk.\n",
+						usb_endpoint_num(&altsetting->endpoint[i].desc));
+				return -ENODEV;
 			}
+		} else {
+			MTS_WARNING( "can only deal with bulk endpoints; endpoint %d is not bulk.\n",
+					(int)altsetting->endpoint[i].desc.bEndpointAddress );
 		}
-
 	}
 
 	if (ep_in_current != &ep_in_set[2]) {
-- 
2.53.0



Return-Path: <linux-usb+bounces-33627-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mLLeK5VinWlFPQQAu9opvQ
	(envelope-from <linux-usb+bounces-33627-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 24 Feb 2026 09:34:29 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D08183D0C
	for <lists+linux-usb@lfdr.de>; Tue, 24 Feb 2026 09:34:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4683930D6390
	for <lists+linux-usb@lfdr.de>; Tue, 24 Feb 2026 08:32:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF41E36683A;
	Tue, 24 Feb 2026 08:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="ga1UQv7F";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="ga1UQv7F"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC8436605D
	for <linux-usb@vger.kernel.org>; Tue, 24 Feb 2026 08:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771921951; cv=none; b=tOejDKS2dOfEEc+vE2vgW9y+xznkDfg3lK/MsOchIjf42VPaiDyuqNjSZo8SHdEfK5bYh4f6V8a3a5p29p3Jr0hzuoLZFrwZy71gzMxTVcfjeiG/19k45syemGvL53voL3cfHFJbMOyEmQx1HPoqdOh/epPzR6M6zq79+pLo+zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771921951; c=relaxed/simple;
	bh=YgFmx+v98zs8g17Xh6aLFsCHK5Rb1tvpJaqlxcX9gBw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gbT1Ojpb4kCu2QnpRsFQDpTKPjQfgTFpMIdDUFZh7D8X1ZcId4bGFs8uAb0S3Zt4v5FBsubrR1L+r3xnh9UOo5jQAc2mr8tGa8VroOVhFX1cQRFm24eNsyqnRU5wOvZAtWpe8XbJNuXCCqOnmezQc4IMojPUdZBplFZt5lc9V0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=ga1UQv7F; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=ga1UQv7F; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 69A943F108;
	Tue, 24 Feb 2026 08:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1771921948; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=YFv0qgYpEEHKoKFpwPmGqyU5qAbeZQaG6tOk9+qgdCQ=;
	b=ga1UQv7FLfUEGq2eDkzjPinRjmmZ6cJGR5fYoh6HBV2AQDNpkd3SO0rPsJ2XnsG6ty1QVF
	plKm3SfRDg8+6osZkMTnjBfM+jqe5qzQe1+SbNNtgELJQv2lKgS4eztNICXQfCuW4HtAuL
	a4NS2B+diD4Bwpal/NXiLmpVLCvninw=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=ga1UQv7F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1771921948; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=YFv0qgYpEEHKoKFpwPmGqyU5qAbeZQaG6tOk9+qgdCQ=;
	b=ga1UQv7FLfUEGq2eDkzjPinRjmmZ6cJGR5fYoh6HBV2AQDNpkd3SO0rPsJ2XnsG6ty1QVF
	plKm3SfRDg8+6osZkMTnjBfM+jqe5qzQe1+SbNNtgELJQv2lKgS4eztNICXQfCuW4HtAuL
	a4NS2B+diD4Bwpal/NXiLmpVLCvninw=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3CD2D3EA68;
	Tue, 24 Feb 2026 08:32:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id rZ+gDRxinWkVRgAAD6G6ig
	(envelope-from <oneukum@suse.com>); Tue, 24 Feb 2026 08:32:28 +0000
From: Oliver Neukum <oneukum@suse.com>
To: gregkh@linuxfoundation.org,
	kees@kernel.org,
	linux-usb@vger.kernel.org
Cc: Oliver Neukum <oneukum@suse.com>
Subject: [PATCH] usb: uss720: unify error handling in probe
Date: Tue, 24 Feb 2026 09:32:20 +0100
Message-ID: <20260224083220.1244727-1-oneukum@suse.com>
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
	TAGGED_FROM(0.00)[bounces-33627-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[oneukum@suse.com,linux-usb@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[suse.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,suse.com:mid,suse.com:dkim,suse.com:email]
X-Rspamd-Queue-Id: 31D08183D0C
X-Rspamd-Action: no action

There is a lot of code duplication.
Unify it.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/usb/misc/uss720.c | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/drivers/usb/misc/uss720.c b/drivers/usb/misc/uss720.c
index ec8bd968c4de..616c92ce5e1a 100644
--- a/drivers/usb/misc/uss720.c
+++ b/drivers/usb/misc/uss720.c
@@ -677,35 +677,32 @@ static int uss720_probe(struct usb_interface *intf,
 	struct parport_uss720_private *priv;
 	struct parport *pp;
 	unsigned char reg;
-	int ret;
+	int ret = -ENODEV;
 
 	dev_dbg(&intf->dev, "probe: vendor id 0x%x, device id 0x%x\n",
 		le16_to_cpu(usbdev->descriptor.idVendor),
 		le16_to_cpu(usbdev->descriptor.idProduct));
 
 	/* our known interfaces have 3 alternate settings */
-	if (intf->num_altsetting != 3) {
-		usb_put_dev(usbdev);
-		return -ENODEV;
-	}
+	if (intf->num_altsetting != 3)
+		goto bail_out_early;
+
 	ret = usb_set_interface(usbdev, intf->altsetting->desc.bInterfaceNumber, 2);
 	dev_dbg(&intf->dev, "set interface result %d\n", ret);
 
 	interface = intf->cur_altsetting;
 
-	if (interface->desc.bNumEndpoints < 2) {
-		usb_put_dev(usbdev);
-		return -ENODEV;
-	}
+	if (interface->desc.bNumEndpoints < 2)
+		goto bail_out_early;
 
 	/*
 	 * Allocate parport interface 
 	 */
+	ret = -ENOMEM;
 	priv = kzalloc_obj(struct parport_uss720_private);
-	if (!priv) {
-		usb_put_dev(usbdev);
-		return -ENOMEM;
-	}
+	if (!priv)
+		goto bail_out_early;
+
 	priv->pp = NULL;
 	priv->usbdev = usbdev;
 	kref_init(&priv->ref_count);
@@ -752,6 +749,10 @@ static int uss720_probe(struct usb_interface *intf,
 	kill_all_async_requests_priv(priv);
 	kref_put(&priv->ref_count, destroy_priv);
 	return -ENODEV;
+
+bail_out_early:
+	usb_put_dev(usbdev);
+	return ret;
 }
 
 static void uss720_disconnect(struct usb_interface *intf)
-- 
2.53.0



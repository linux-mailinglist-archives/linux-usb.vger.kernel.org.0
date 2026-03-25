Return-Path: <linux-usb+bounces-35439-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IB3zBia7w2kKtwQAu9opvQ
	(envelope-from <linux-usb+bounces-35439-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 25 Mar 2026 11:38:30 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C0B3231E6
	for <lists+linux-usb@lfdr.de>; Wed, 25 Mar 2026 11:38:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 82ED33092A82
	for <lists+linux-usb@lfdr.de>; Wed, 25 Mar 2026 10:32:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9516E3B893C;
	Wed, 25 Mar 2026 10:32:26 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DBAD3B777F
	for <linux-usb@vger.kernel.org>; Wed, 25 Mar 2026 10:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774434746; cv=none; b=OEea+8qAwPaZFK5h9smxC8vX1Fv1a3+nUyedb2N0hFxNuHVpbdQ0kJ6FzZVrVFiyDAE+FtAQ27uW5JvPvRESAj0QluMc82Q9GZ9SZ5/m652LbLrNQgZsso6CGcyFLF6wtrlHopwcnxL09VXh+wAcrGYoHtCOwU/HZO26+3f/Jn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774434746; c=relaxed/simple;
	bh=d3qSLmtsLeosQsB6mOHbK/z7/4Q5Wzm2kxK26UVgvz8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BBxRTjUpk9yM+KdMfUnlZfGppSvJ+kMQGaMlrSGPrhcZ7M2Fy8kI9TZuv+91cSXAAvUfAAnkWpPNj0ZiD2nv6ylBySBqkJBnVI+s9h/EUdFLu5p8J9WAi8boneF40oI1thUZxNoJj+PGi1tHDv4bVYDahFXk2vpkN3PAMgb0CT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9D1BF5BCEE;
	Wed, 25 Mar 2026 10:32:17 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 85C454435D;
	Wed, 25 Mar 2026 10:32:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 4PScH7G5w2nVUAAAD6G6ig
	(envelope-from <oneukum@suse.com>); Wed, 25 Mar 2026 10:32:17 +0000
From: Oliver Neukum <oneukum@suse.com>
To: linux-usb@vger.kernel.org
Cc: Oliver Neukum <oneukum@suse.com>
Subject: [RFC 2/2] hid: usbhid: rename reset_work
Date: Wed, 25 Mar 2026 11:31:49 +0100
Message-ID: <20260325103210.198820-2-oneukum@suse.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260325103210.198820-1-oneukum@suse.com>
References: <20260325103210.198820-1-oneukum@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spam-Score: -4.00
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [1.54 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[suse.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35439-lists,linux-usb=lfdr.de];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	FROM_NEQ_ENVFROM(0.00)[oneukum@suse.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E7C0B3231E6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Now that reset is used directly, there is no point
in calling the generic error handling reset_work.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/hid/usbhid/hid-core.c | 14 +++++++-------
 drivers/hid/usbhid/usbhid.h   |  2 +-
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/hid/usbhid/hid-core.c b/drivers/hid/usbhid/hid-core.c
index a70721b3add6..6cfdfc2be68b 100644
--- a/drivers/hid/usbhid/hid-core.c
+++ b/drivers/hid/usbhid/hid-core.c
@@ -114,11 +114,11 @@ static void hid_retry_timeout(struct timer_list *t)
 		hid_io_error(hid);
 }
 
-/* Workqueue routine to reset the device or clear a halt */
-static void hid_reset(struct work_struct *work)
+/* Workqueue routine to clear a halt */
+static void hid_err_work(struct work_struct *work)
 {
 	struct usbhid_device *usbhid =
-		container_of(work, struct usbhid_device, reset_work);
+		container_of(work, struct usbhid_device, error_work);
 	struct hid_device *hid = usbhid->hid;
 	int rc;
 
@@ -297,7 +297,7 @@ static void hid_irq_in(struct urb *urb)
 		usbhid_mark_busy(usbhid);
 		clear_bit(HID_IN_RUNNING, &usbhid->iofl);
 		set_bit(HID_CLEAR_HALT, &usbhid->iofl);
-		schedule_work(&usbhid->reset_work);
+		schedule_work(&usbhid->error_work);
 		return;
 	case -ECONNRESET:	/* unlink */
 	case -ENOENT:
@@ -1438,7 +1438,7 @@ static int usbhid_probe(struct usb_interface *intf, const struct usb_device_id *
 	usbhid->ifnum = interface->desc.bInterfaceNumber;
 
 	init_waitqueue_head(&usbhid->wait);
-	INIT_WORK(&usbhid->reset_work, hid_reset);
+	INIT_WORK(&usbhid->error_work, hid_err_work);
 	timer_setup(&usbhid->io_retry, hid_retry_timeout, 0);
 	spin_lock_init(&usbhid->lock);
 	mutex_init(&usbhid->mutex);
@@ -1477,7 +1477,7 @@ static void usbhid_disconnect(struct usb_interface *intf)
 static void hid_cancel_delayed_stuff(struct usbhid_device *usbhid)
 {
 	timer_delete_sync(&usbhid->io_retry);
-	cancel_work_sync(&usbhid->reset_work);
+	cancel_work_sync(&usbhid->error_work);
 }
 
 static void hid_cease_io(struct usbhid_device *usbhid)
@@ -1498,7 +1498,7 @@ static void hid_restart_io(struct hid_device *hid)
 	usbhid_mark_busy(usbhid);
 
 	if (clear_halt)
-		schedule_work(&usbhid->reset_work);
+		schedule_work(&usbhid->error_work);
 
 	usbhid->retry_delay = 0;
 	spin_unlock_irq(&usbhid->lock);
diff --git a/drivers/hid/usbhid/usbhid.h b/drivers/hid/usbhid/usbhid.h
index 75fe85d3d27a..530dca7e5ef3 100644
--- a/drivers/hid/usbhid/usbhid.h
+++ b/drivers/hid/usbhid/usbhid.h
@@ -86,7 +86,7 @@ struct usbhid_device {
 	struct timer_list io_retry;                                     /* Retry timer */
 	unsigned long stop_retry;                                       /* Time to give up, in jiffies */
 	unsigned int retry_delay;                                       /* Delay length in ms */
-	struct work_struct reset_work;                                  /* Task context for resets */
+	struct work_struct error_work;                                  /* Task context for earing halts*/
 	wait_queue_head_t wait;						/* For sleeping */
 };
 
-- 
2.53.0



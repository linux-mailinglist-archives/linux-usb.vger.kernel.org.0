Return-Path: <linux-usb+bounces-35438-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gGe5Ih+7w2kKtwQAu9opvQ
	(envelope-from <linux-usb+bounces-35438-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 25 Mar 2026 11:38:23 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 293513231D7
	for <lists+linux-usb@lfdr.de>; Wed, 25 Mar 2026 11:38:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 74EBD30915A6
	for <lists+linux-usb@lfdr.de>; Wed, 25 Mar 2026 10:32:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38F053B8920;
	Wed, 25 Mar 2026 10:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="aKbZ11N5";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="aKbZ11N5"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 576723B777D
	for <linux-usb@vger.kernel.org>; Wed, 25 Mar 2026 10:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774434740; cv=none; b=A1qib02PpkvOZkm5YjzPE9m/aBGchAv7INhdq5Qkqhz68LxVW/MeOGPHhBstOvTFd4oz+8MM8cw1ZrMW5mg2TnnNh3cnaMyVZ2eKbNANdthdWlEvPJgxvVKhxm5GWZStUch4lOc+8qZVC2TjYm8f33QWFtidWusdZHvsAKfXBiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774434740; c=relaxed/simple;
	bh=zkEg0QwOx8k9wvd3mIwgtB+aoC9QwKnHw0HfEeqqT/8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i1qpL9SUoGwZ+9ZJpCk19AYhKj+tdM4pCHxtKuzWCnn2kYy7UkJuh+mcUCb1BxuqkANL7etVjZByrbcZ95Bn3sX1Vu9o7p4e4tiQ4GjB77Vrd3DS/bg8guFlWFD0lSir5AWjyvOtXnArHXMn3b6A5k/I/pMGQ3xlOspUXWUiFQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=aKbZ11N5; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=aKbZ11N5; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8067C5BCE8;
	Wed, 25 Mar 2026 10:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1774434737; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=iJcWlrvV1kAWao0L5xVsbewfuCSEeElj31m1StDD3cI=;
	b=aKbZ11N57+yJi1oxJCo6AWmSHZ6vRyT2T/py+/9EDLBAhXDXp5HzFXxnJhvDTghIG/5o7H
	kK/SNUmEESr4plE8Oa9qBVuccM0PbWULZF9HaVV070lIwLNo8cA/gDgcoGQR+Zs9G/IZf8
	jfA7BlCFrtgwqrU1pFRuCaGcLv7jzP4=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1774434737; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=iJcWlrvV1kAWao0L5xVsbewfuCSEeElj31m1StDD3cI=;
	b=aKbZ11N57+yJi1oxJCo6AWmSHZ6vRyT2T/py+/9EDLBAhXDXp5HzFXxnJhvDTghIG/5o7H
	kK/SNUmEESr4plE8Oa9qBVuccM0PbWULZF9HaVV070lIwLNo8cA/gDgcoGQR+Zs9G/IZf8
	jfA7BlCFrtgwqrU1pFRuCaGcLv7jzP4=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6B4A74435B;
	Wed, 25 Mar 2026 10:32:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id JMsgGbG5w2nVUAAAD6G6ig
	(envelope-from <oneukum@suse.com>); Wed, 25 Mar 2026 10:32:17 +0000
From: Oliver Neukum <oneukum@suse.com>
To: linux-usb@vger.kernel.org
Cc: Oliver Neukum <oneukum@suse.com>
Subject: [RFC 1/2] hid: usbhid: call usb_queue_reset_device directly
Date: Wed, 25 Mar 2026 11:31:48 +0100
Message-ID: <20260325103210.198820-1-oneukum@suse.com>
X-Mailer: git-send-email 2.53.0
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
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35438-lists,linux-usb=lfdr.de];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[oneukum@suse.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[suse.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 293513231D7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

There is no point in scheduling a work to schedule another
work. Just schedule it directly.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/hid/usbhid/hid-core.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/hid/usbhid/hid-core.c b/drivers/hid/usbhid/hid-core.c
index fd3e1aedc5cb..a70721b3add6 100644
--- a/drivers/hid/usbhid/hid-core.c
+++ b/drivers/hid/usbhid/hid-core.c
@@ -132,13 +132,9 @@ static void hid_reset(struct work_struct *work)
 			dev_dbg(&usbhid->intf->dev,
 					"clear-halt failed: %d\n", rc);
 			set_bit(HID_RESET_PENDING, &usbhid->iofl);
+			usb_queue_reset_device(usbhid->intf);
 		}
 	}
-
-	if (test_bit(HID_RESET_PENDING, &usbhid->iofl)) {
-		dev_dbg(&usbhid->intf->dev, "resetting device\n");
-		usb_queue_reset_device(usbhid->intf);
-	}
 }
 
 /* Main I/O error handler */
@@ -171,7 +167,7 @@ static void hid_io_error(struct hid_device *hid)
 		if (!test_bit(HID_NO_BANDWIDTH, &usbhid->iofl)
 		     && !test_and_set_bit(HID_RESET_PENDING, &usbhid->iofl)) {
 
-			schedule_work(&usbhid->reset_work);
+			usb_queue_reset_device(usbhid->intf);
 			goto done;
 		}
 	}
@@ -1496,18 +1492,18 @@ static void hid_restart_io(struct hid_device *hid)
 {
 	struct usbhid_device *usbhid = hid->driver_data;
 	int clear_halt = test_bit(HID_CLEAR_HALT, &usbhid->iofl);
-	int reset_pending = test_bit(HID_RESET_PENDING, &usbhid->iofl);
 
 	spin_lock_irq(&usbhid->lock);
 	clear_bit(HID_SUSPENDED, &usbhid->iofl);
 	usbhid_mark_busy(usbhid);
 
-	if (clear_halt || reset_pending)
+	if (clear_halt)
 		schedule_work(&usbhid->reset_work);
+
 	usbhid->retry_delay = 0;
 	spin_unlock_irq(&usbhid->lock);
 
-	if (reset_pending || !test_bit(HID_STARTED, &usbhid->iofl))
+	if (!test_bit(HID_STARTED, &usbhid->iofl))
 		return;
 
 	if (!clear_halt) {
-- 
2.53.0



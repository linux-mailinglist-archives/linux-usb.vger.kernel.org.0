Return-Path: <linux-usb+bounces-30456-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19DCBC52AF3
	for <lists+linux-usb@lfdr.de>; Wed, 12 Nov 2025 15:23:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 13F124265D9
	for <lists+linux-usb@lfdr.de>; Wed, 12 Nov 2025 13:56:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D0293396F4;
	Wed, 12 Nov 2025 13:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="Ed6OQYwe";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="Ed6OQYwe"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944412DC348
	for <linux-usb@vger.kernel.org>; Wed, 12 Nov 2025 13:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762955750; cv=none; b=EoMf03Is5n6YBv/YC6icP/xao3KOFv6xVPxKbUCDNepVYmdU370fhz53vHJQ7a/aE2ExNmXh/8wq+xkJrVURT9Xj7X9KsHjXGJMhYjfJhoYbeeVCXuMHk3/dkn8I68L5IEytvUa7VcabvVF33dU1hBhua3PsjbmR3MMko+cK18c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762955750; c=relaxed/simple;
	bh=0eB7pmOJMe7VGWVFSJPqmDTKcFtmDnkDDuh1yHhgjiU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kZhouGN3lL8yeFI2mkb652gBnNMcbkdipkCPajIR+CNUOKPFx+VbQi3sIBoeD/NRa4bsQ/wQsG6b8xwtwnwsr1f6abauTYNvbCOxF58FOkKM6oJ/TLCzH823Y9BmBnqaDc9us06UT3eeJTRnfPu18XUEjiLi13FIWyTbdG/MTQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=Ed6OQYwe; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=Ed6OQYwe; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 95C231F45B;
	Wed, 12 Nov 2025 13:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1762955746; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=t+/6TSLsLtujwAVeEQqt07wjSAGfmYOlOjMB66gMB8w=;
	b=Ed6OQYwetQi+zmh9/6nAKXexCsJIClltnEGdiu6infMnHwTscGXStDsfBTDbHtPSrkE+2B
	/sIyC+/qohR0JoX2IKtzw9Zsww7n3T2Cke+iI0Hj5nqTGgQHLBus1CEmBrqYs+EIBL7cU+
	Gt6zompcrlLt2KydQgoqpJFqrOhCZRU=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=Ed6OQYwe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1762955746; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=t+/6TSLsLtujwAVeEQqt07wjSAGfmYOlOjMB66gMB8w=;
	b=Ed6OQYwetQi+zmh9/6nAKXexCsJIClltnEGdiu6infMnHwTscGXStDsfBTDbHtPSrkE+2B
	/sIyC+/qohR0JoX2IKtzw9Zsww7n3T2Cke+iI0Hj5nqTGgQHLBus1CEmBrqYs+EIBL7cU+
	Gt6zompcrlLt2KydQgoqpJFqrOhCZRU=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 692B13EA61;
	Wed, 12 Nov 2025 13:55:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id yNGQGOKRFGmmDwAAD6G6ig
	(envelope-from <oneukum@suse.com>); Wed, 12 Nov 2025 13:55:46 +0000
From: Oliver Neukum <oneukum@suse.com>
To: gregkh@linuxfoundation.org,
	stern@rowland.harvard.edu,
	linux-usb@vger.kernel.org
Cc: Oliver Neukum <oneukum@suse.com>
Subject: [PATCHv1 1/1] usb: uas: reduce time under spinlock
Date: Wed, 12 Nov 2025 14:55:05 +0100
Message-ID: <20251112135543.31081-1-oneukum@suse.com>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 95C231F45B
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.com:dkim,suse.com:mid,suse.com:email];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	DKIM_TRACE(0.00)[suse.com:+]
X-Spam-Score: -3.01

Drop the lock before freeing memory.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/usb/storage/uas.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/storage/uas.c b/drivers/usb/storage/uas.c
index 4ed0dc19afe0..b6a345db3293 100644
--- a/drivers/usb/storage/uas.c
+++ b/drivers/usb/storage/uas.c
@@ -309,18 +309,18 @@ static void uas_stat_cmplt(struct urb *urb)
 	int status = urb->status;
 	bool success;
 
-	spin_lock_irqsave(&devinfo->lock, flags);
-
-	if (devinfo->resetting)
-		goto out;
-
 	if (status) {
 		if (status != -ENOENT && status != -ECONNRESET && status != -ESHUTDOWN)
 			dev_err(&urb->dev->dev, "stat urb: status %d\n", status);
-		goto out;
+		goto bail;
 	}
 
 	idx = be16_to_cpup(&iu->tag) - 1;
+
+	spin_lock_irqsave(&devinfo->lock, flags);
+
+	if (devinfo->resetting)
+		goto out;
 	if (idx >= MAX_CMNDS || !devinfo->cmnd[idx]) {
 		dev_err(&urb->dev->dev,
 			"stat urb: no pending cmd for uas-tag %d\n", idx + 1);
@@ -375,9 +375,8 @@ static void uas_stat_cmplt(struct urb *urb)
 	default:
 		uas_log_cmd_state(cmnd, "bogus IU", iu->iu_id);
 	}
-out:
-	usb_free_urb(urb);
 	spin_unlock_irqrestore(&devinfo->lock, flags);
+	usb_free_urb(urb);
 
 	/* Unlinking of data urbs must be done without holding the lock */
 	if (data_in_urb) {
@@ -388,6 +387,12 @@ static void uas_stat_cmplt(struct urb *urb)
 		usb_unlink_urb(data_out_urb);
 		usb_put_urb(data_out_urb);
 	}
+	return;
+
+out:
+	spin_unlock_irqrestore(&devinfo->lock, flags);
+bail:
+	usb_free_urb(urb);
 }
 
 static void uas_data_cmplt(struct urb *urb)
@@ -429,8 +434,8 @@ static void uas_data_cmplt(struct urb *urb)
 	}
 	uas_try_complete(cmnd, __func__);
 out:
-	usb_free_urb(urb);
 	spin_unlock_irqrestore(&devinfo->lock, flags);
+	usb_free_urb(urb);
 }
 
 static void uas_cmd_cmplt(struct urb *urb)
-- 
2.51.1



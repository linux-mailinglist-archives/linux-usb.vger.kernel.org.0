Return-Path: <linux-usb+bounces-7951-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70DC187BC36
	for <lists+linux-usb@lfdr.de>; Thu, 14 Mar 2024 12:51:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A28C41C2119F
	for <lists+linux-usb@lfdr.de>; Thu, 14 Mar 2024 11:51:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E054C6F065;
	Thu, 14 Mar 2024 11:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="RfGGRKHE";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="RfGGRKHE"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D59A433C0
	for <linux-usb@vger.kernel.org>; Thu, 14 Mar 2024 11:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710417099; cv=none; b=hjeDY3zpwdwl9TvMMec6LzbQU7WjXrn2x3vHDxwVEEZ/sZ0l27zXlJCqbORdhEP+ST8BlQGME9cSuSV2/L+WTK6K+mqloaLWh76Jz9bEGyz8qAaF2vXVIHto18lBLx8osTlRxUx1rQBEsGHpegdRn1SznKZtZ3XJXmBnWhHG8o0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710417099; c=relaxed/simple;
	bh=fzLs1ckKFAmQEvCRwpOtnd4jOJvKhnxITqpzCjahGCI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iOyrwfNe7wz36fPes2zOVsKN5dvJf/UOs9SznrdloP2YOYIl5xWolN4L3U+yjlDFYZEYwu5OhZCn32UwPGPvNLf9Z7NU8QOTKyZdT53cGp8ajtQ4cQ1844TKNLZmHyipi/fekKN7NcaHZeFzobYoctUYhy+8kFdHl6gQp4Hp7OM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=RfGGRKHE; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=RfGGRKHE; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 91C1E21D28;
	Thu, 14 Mar 2024 11:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1710417095; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=YhPGmiLjbUVuHGXQf33POHXXtHF70msc6y+qzzxQkYM=;
	b=RfGGRKHEmWem+GbVZfggsnEYTYGE/1sVc3j1HKsnP+ydZaU431LzAiIGXApB+kWyJVADpE
	p0FQGJ7THyUuu04g1KFA+GRnY4m4tm0v6eOAqrwRxk1ei/mFMOIrp2Xog//MzU9aXMY3zW
	2aH2SJLmCsmZJGJh+nnvx4jQmMrbqP8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1710417095; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=YhPGmiLjbUVuHGXQf33POHXXtHF70msc6y+qzzxQkYM=;
	b=RfGGRKHEmWem+GbVZfggsnEYTYGE/1sVc3j1HKsnP+ydZaU431LzAiIGXApB+kWyJVADpE
	p0FQGJ7THyUuu04g1KFA+GRnY4m4tm0v6eOAqrwRxk1ei/mFMOIrp2Xog//MzU9aXMY3zW
	2aH2SJLmCsmZJGJh+nnvx4jQmMrbqP8=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5CC6D139E7;
	Thu, 14 Mar 2024 11:51:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id yM1jFMfk8mW0agAAD6G6ig
	(envelope-from <oneukum@suse.com>); Thu, 14 Mar 2024 11:51:35 +0000
From: Oliver Neukum <oneukum@suse.com>
To: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org
Cc: Oliver Neukum <oneukum@suse.com>
Subject: [PATCH] usb: cdc-wdm: close race between read and workqueue
Date: Thu, 14 Mar 2024 12:50:48 +0100
Message-ID: <20240314115132.3907-1-oneukum@suse.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=RfGGRKHE
X-Spamd-Result: default: False [-1.81 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[3];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 DWL_DNSWL_HI(-3.50)[suse.com:dkim];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 TO_DN_SOME(0.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 DKIM_TRACE(0.00)[suse.com:+];
	 MX_GOOD(-0.01)[];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:dkim];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[99.99%];
	 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]
X-Spam-Score: -1.81
X-Rspamd-Queue-Id: 91C1E21D28
X-Spam-Flag: NO
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org

wdm_read() cannot race with itself. However, in
service_outstanding_interrupt() it can race with the
workqueue, which can be triggered by error handling.

Hence we need to make sure that the WDM_RESPONDING
flag is not just only set but tested.

Fixes: afba937e540c9 ("USB: CDC WDM driver")
Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/usb/class/cdc-wdm.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/class/cdc-wdm.c b/drivers/usb/class/cdc-wdm.c
index c553decb5461..c8262e2f2917 100644
--- a/drivers/usb/class/cdc-wdm.c
+++ b/drivers/usb/class/cdc-wdm.c
@@ -485,6 +485,7 @@ static ssize_t wdm_write
 static int service_outstanding_interrupt(struct wdm_device *desc)
 {
 	int rv = 0;
+	int used;
 
 	/* submit read urb only if the device is waiting for it */
 	if (!desc->resp_count || !--desc->resp_count)
@@ -499,7 +500,10 @@ static int service_outstanding_interrupt(struct wdm_device *desc)
 		goto out;
 	}
 
-	set_bit(WDM_RESPONDING, &desc->flags);
+	used = test_and_set_bit(WDM_RESPONDING, &desc->flags);
+	if (used)
+		goto out;
+
 	spin_unlock_irq(&desc->iuspin);
 	rv = usb_submit_urb(desc->response, GFP_KERNEL);
 	spin_lock_irq(&desc->iuspin);
-- 
2.44.0



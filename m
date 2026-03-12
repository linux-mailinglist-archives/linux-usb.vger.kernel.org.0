Return-Path: <linux-usb+bounces-34665-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6GkRJImLsmneNQAAu9opvQ
	(envelope-from <linux-usb+bounces-34665-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 10:46:49 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C922B26FCA6
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 10:46:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2F862300B13A
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 09:46:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0863A2DAFDA;
	Thu, 12 Mar 2026 09:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="HWoSrmQr";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="DzUSt/G4"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D95F33B961F
	for <linux-usb@vger.kernel.org>; Thu, 12 Mar 2026 09:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773308791; cv=none; b=BR/1AQrLY/nhHfC6TTjZPgd0Kr+20rdUYTm/VezijEp9viiT4bQRvn12qdPKTPtrk/nWLdlCUVS5p/VkjbrVxe5WOUFXnK+Rddu2AlklmqhkvyNuUZRikQj3eUDPu+sxbtdAt5jn0XxIt7u6Cu/t4pDjl0cFDYitpqqkexGFaFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773308791; c=relaxed/simple;
	bh=83Gazb+0wzNdzcm5pVM6U6e6gLcKLuUZjxIKRooODi8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sOaEX1dp2yMAOlI0TxZK9PAbhYoT51iGtS8f27mOzxhWz3HdSz+h3m3dYsbQDH0k3Y6BEGG7Nl+HeApR/VeY9v6bHu6YbnxcUxrslJRiFpRAJoo6WzUT/O/CQv/+iZwyEtSqA9aj+NqDD1+/2SpfA60J8deepMaEp1S3TLJwxwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=HWoSrmQr; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=DzUSt/G4; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id EC22A5BCC9;
	Thu, 12 Mar 2026 09:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1773308787; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=792rT7Lbc7RFSLdwtVSk3QWVuzF9NrA09wb2L5ELPQ8=;
	b=HWoSrmQrLOSHeHgP4SUnRv4hfgQRssUeH5++1MvCIPx8GEoi6Dy+/zPspyqmOf+eoV6WgY
	oBoLUhZOHqSKVVf/3888cdnNhlbJo8Drzm7zIqfAikF9ScGL8GnzogSfVZCqizh9kSvI++
	C7KSWB59UuVHCgp5N72LDAlyymBJ5ks=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1773308786; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=792rT7Lbc7RFSLdwtVSk3QWVuzF9NrA09wb2L5ELPQ8=;
	b=DzUSt/G4ikJiUg7+/6fXal/OAumYKi8u5sJ1rDkeLRZ//D/oI/oh9n0Z18qxbSdYyIqKyF
	31QaNQhYMsCpMZbc7qCbw4cTaxShRqn07140g8OCDO26hIjCN4wNJLy4AvhgjKWirjCPJi
	fXEc6L/fKoX6LieaFkzYNHQ6CVU14/M=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B9FF93FEDE;
	Thu, 12 Mar 2026 09:46:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id uNI5LHKLsmlBPQAAD6G6ig
	(envelope-from <oneukum@suse.com>); Thu, 12 Mar 2026 09:46:26 +0000
From: Oliver Neukum <oneukum@suse.com>
To: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org
Cc: Oliver Neukum <oneukum@suse.com>
Subject: [PATCH 2/2] iowarrior: use interruptible lock in iowarrior_write()
Date: Thu, 12 Mar 2026 10:45:28 +0100
Message-ID: <20260312094619.1590556-2-oneukum@suse.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260312094619.1590556-1-oneukum@suse.com>
References: <20260312094619.1590556-1-oneukum@suse.com>
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
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34665-lists,linux-usb=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C922B26FCA6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The function itself, if it has to wait to perform
IO, use interruptible sleep. Hence the sleep needed
to avoid the write code path racing with itself should also
use interruptible sleep.

Fixes: 946b960d13c15 ("USB: add driver for iowarrior devices.")

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/usb/misc/iowarrior.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/misc/iowarrior.c b/drivers/usb/misc/iowarrior.c
index 5b31e5669d53..0b377204374f 100644
--- a/drivers/usb/misc/iowarrior.c
+++ b/drivers/usb/misc/iowarrior.c
@@ -362,13 +362,16 @@ static ssize_t iowarrior_write(struct file *file,
 			       size_t count, loff_t *ppos)
 {
 	struct iowarrior *dev;
-	int retval = 0;
+	int retval;
 	char *buf = NULL;	/* for IOW24 and IOW56 we need a buffer */
 	struct urb *int_out_urb = NULL;
 
 	dev = file->private_data;
 
-	mutex_lock(&dev->mutex);
+	retval = mutex_lock_interruptible(&dev->mutex);
+	if (retval < 0)
+		return -EINTR;
+
 	/* verify that the device wasn't unplugged */
 	if (!dev->present) {
 		retval = -ENODEV;
-- 
2.53.0



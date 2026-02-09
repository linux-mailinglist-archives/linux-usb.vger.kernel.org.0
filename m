Return-Path: <linux-usb+bounces-33198-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MGRZA1DtiWlpEQAAu9opvQ
	(envelope-from <linux-usb+bounces-33198-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 09 Feb 2026 15:21:04 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 76AB11102B3
	for <lists+linux-usb@lfdr.de>; Mon, 09 Feb 2026 15:21:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 47B9E3019124
	for <lists+linux-usb@lfdr.de>; Mon,  9 Feb 2026 14:21:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4286537A496;
	Mon,  9 Feb 2026 14:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="UViUk/45";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="UViUk/45"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 871B428312F
	for <linux-usb@vger.kernel.org>; Mon,  9 Feb 2026 14:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770646858; cv=none; b=ZaavSMchy6m7STrfMcRs18c6HmlIgj95RKRse6VSxLtUsRv36kGzo6c1fGIZoqF5bpiXQxcbhBsz3pAVLOX9UkqR13X6W/TAwsWl/uC1GwFh5uipEKagp7T93JvYCZmaI14txCo9YYju06KpReEUAT4HfRDnr/PIy7Z6VmX7NvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770646858; c=relaxed/simple;
	bh=x9ahctL5HFMRwpqo6MG4HZ2TmNeFb+G81MOKlayABQo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lqIWgEcKqSoWElF48GcOxtIfc/NNNjpMTfsCfHF9LEz6FXSuWZpPLAo6fIAQ+ns1y4E4K23OvF2l/XF/1fFgTblkhDG/zBDK5H9l1TAiNYGOzbuvKB787yrA21MoZ26gfTInpSZ1TUKcyIZGc+eEpYMU8LHt+0n28McnmIK02AE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=UViUk/45; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=UViUk/45; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9DE555BD2B;
	Mon,  9 Feb 2026 14:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1770646856; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=e1roNXxhNy0LKO87TqA4vk6LCGOTIJNnrPMz2nNT0rI=;
	b=UViUk/4552JUBhXZm6n+yc+wl933UWALNJjN4onCop7AxyGl6dRfOy2OUuGJUXTTt93Fry
	TUTWiC1QkNoBvxZpMIu9jEJUAA0KS/lAmKqZepCoLhl74U6pvridhqYpgxY33tzhEB0203
	KMiqBP8GYKUZWTVpy1038RXqWs1eqWs=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b="UViUk/45"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1770646856; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=e1roNXxhNy0LKO87TqA4vk6LCGOTIJNnrPMz2nNT0rI=;
	b=UViUk/4552JUBhXZm6n+yc+wl933UWALNJjN4onCop7AxyGl6dRfOy2OUuGJUXTTt93Fry
	TUTWiC1QkNoBvxZpMIu9jEJUAA0KS/lAmKqZepCoLhl74U6pvridhqYpgxY33tzhEB0203
	KMiqBP8GYKUZWTVpy1038RXqWs1eqWs=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6612C3EA63;
	Mon,  9 Feb 2026 14:20:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 0N2mF0jtiWkcKgAAD6G6ig
	(envelope-from <oneukum@suse.com>); Mon, 09 Feb 2026 14:20:56 +0000
From: Oliver Neukum <oneukum@suse.com>
To: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org
Cc: Oliver Neukum <oneukum@suse.com>
Subject: [PATCH] usb: mdc800: handle signal and read racing
Date: Mon,  9 Feb 2026 15:20:48 +0100
Message-ID: <20260209142048.1503791-1-oneukum@suse.com>
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33198-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oneukum@suse.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCVD_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,suse.com:mid,suse.com:dkim,suse.com:email]
X-Rspamd-Queue-Id: 76AB11102B3
X-Rspamd-Action: no action

If a signal arrives after a read has partially completed,
we need to return the number of bytes read. -EINTR is correct
only if that number is zero.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/usb/image/mdc800.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/image/mdc800.c b/drivers/usb/image/mdc800.c
index 7b7e1554ea20..9132cc3a575b 100644
--- a/drivers/usb/image/mdc800.c
+++ b/drivers/usb/image/mdc800.c
@@ -707,7 +707,7 @@ static ssize_t mdc800_device_read (struct file *file, char __user *buf, size_t l
 		if (signal_pending (current)) 
 		{
 			mutex_unlock(&mdc800->io_lock);
-			return -EINTR;
+			return len == left ? -EINTR : len-left;
 		}
 
 		sts=left > (mdc800->out_count-mdc800->out_ptr)?mdc800->out_count-mdc800->out_ptr:left;
-- 
2.53.0



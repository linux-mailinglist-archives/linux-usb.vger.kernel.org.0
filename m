Return-Path: <linux-usb+bounces-9258-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 061508A1506
	for <lists+linux-usb@lfdr.de>; Thu, 11 Apr 2024 14:49:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9BAC81F2199B
	for <lists+linux-usb@lfdr.de>; Thu, 11 Apr 2024 12:49:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDE7E14D443;
	Thu, 11 Apr 2024 12:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="k3R/q/rZ";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="k3R/q/rZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59BA0145FE6
	for <linux-usb@vger.kernel.org>; Thu, 11 Apr 2024 12:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712839650; cv=none; b=ClrIUSc9BLGqSin5G0DAbj3WYvdT/Ki3WnOkSW5OzqXfdI8G15+i9azjQwVCknI2AQh3FEzslxmBdFfVnYrtPRPz/lG+TpVsmHy/U/Jdp5IA1TngmOZtFxFbf7dlome2faA61JU2LlYXtatKMZbL+9MFo2S/1QmvPfsjpYHzGkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712839650; c=relaxed/simple;
	bh=nfYDCQZTBswamJ4EEmrHq7URaY7nSfhEMZ+Rcg//E/A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CPzyEcN5muVYpbpZF60dqQmT4nReePF4KAzm8Sxwpqoo8VRb/IMvcGfr5N2JNCGJOO9hVyQKHbz/yIkDAHbXK+QgopVl6ycLKXDaL18c8xFEVv4vtuzkA0qbNHjEC/c1XU70BZTNiDK/4h0JZSxnPJyETjbPmlAe4lqkZUFcdH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=k3R/q/rZ; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=k3R/q/rZ; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A8FCE5C6DA;
	Thu, 11 Apr 2024 12:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1712839646; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hbI1S2oSXk3aYsiAEv2KZUE1zXbtjU8K5JsiwlTZMHs=;
	b=k3R/q/rZO9tzB8lwk6ZaZ3RKcSbThi2QtA7PNmqvq/FsYwVFOEulsWH071EldHHWP+YC1u
	NaafRElSHsSwZq6gehEOxJMWlcMlUjK/G2jUIe0XqxIfBbji0+XXdd3ziCVNtkrmisEViW
	r4DBmbPaQ/sdGLW0WpsRrxiMTN+8Esg=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b="k3R/q/rZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1712839646; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hbI1S2oSXk3aYsiAEv2KZUE1zXbtjU8K5JsiwlTZMHs=;
	b=k3R/q/rZO9tzB8lwk6ZaZ3RKcSbThi2QtA7PNmqvq/FsYwVFOEulsWH071EldHHWP+YC1u
	NaafRElSHsSwZq6gehEOxJMWlcMlUjK/G2jUIe0XqxIfBbji0+XXdd3ziCVNtkrmisEViW
	r4DBmbPaQ/sdGLW0WpsRrxiMTN+8Esg=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 81C1A13A22;
	Thu, 11 Apr 2024 12:47:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id kG6JHd7bF2brIQAAD6G6ig
	(envelope-from <oneukum@suse.com>); Thu, 11 Apr 2024 12:47:26 +0000
From: Oliver Neukum <oneukum@suse.com>
To: linux-usb@vger.kernel.org
Cc: Oliver Neukum <oneukum@suse.com>
Subject: [RFC 6/6] usb: config: find_next_descriptor can overflow buffer
Date: Thu, 11 Apr 2024 14:43:04 +0200
Message-ID: <20240411124722.17343-7-oneukum@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240411124722.17343-1-oneukum@suse.com>
References: <20240411124722.17343-1-oneukum@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-0.01 / 50.00];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	BAYES_HAM(-0.00)[32.26%];
	ARC_NA(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.com:dkim,suse.com:email];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+]
X-Spam-Flag: NO
X-Spam-Score: -0.01
X-Spamd-Bar: /
X-Rspamd-Queue-Id: A8FCE5C6DA
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action

If you parse a data structure you cannot
just test whether the remainder of your buffer holds
data. It needs to hold a full data structure.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/usb/core/config.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/core/config.c b/drivers/usb/core/config.c
index 50acc9021247..43c5ed256e6e 100644
--- a/drivers/usb/core/config.c
+++ b/drivers/usb/core/config.c
@@ -32,7 +32,7 @@ static int find_next_descriptor(unsigned char *buffer, int size,
 	unsigned char *buffer0 = buffer;
 
 	/* Find the next descriptor of type dt1 or dt2 */
-	while (size > 0) {
+	while (size >= sizeof(struct usb_descriptor_header)) {
 		h = (struct usb_descriptor_header *) buffer;
 		if (h->bDescriptorType == dt1 || h->bDescriptorType == dt2)
 			break;
-- 
2.44.0



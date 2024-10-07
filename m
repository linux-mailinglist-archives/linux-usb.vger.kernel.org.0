Return-Path: <linux-usb+bounces-15800-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AE72B99284A
	for <lists+linux-usb@lfdr.de>; Mon,  7 Oct 2024 11:40:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E05961C2280E
	for <lists+linux-usb@lfdr.de>; Mon,  7 Oct 2024 09:40:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71308199948;
	Mon,  7 Oct 2024 09:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="hF7njYMC";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="hF7njYMC"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4908718F2F2
	for <linux-usb@vger.kernel.org>; Mon,  7 Oct 2024 09:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728294010; cv=none; b=GZ2NT211ay5JYdqXyvSMhC1iX3owJbMfb68wsvq40QfvtDb+4CQc6mx1ZmUoz4cgWh1W0OLLOQeajuO9S1Lt36COkG4UveeExRjmAFaJezAmrCACwTOLnGtFnETuVewfHeN9dNe+cHRqmokzrbke4i6F4n57CPvmGi7W8Eo7KbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728294010; c=relaxed/simple;
	bh=gEfjT9H38Rr+dw6Ij8VeTWpkA1l9FFkTyu5IS3/jp0s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qx1tOKCyFLmOIrKDU8BzeGSnmR/Zj0yn/Fj53raOXV8My+D0CWd7lcqPmEIBgdgDRS2VtnrUCTQZUuJj7T6pMbgFtJvDzZY86hkd2RGb0UHV2qHwWCWQ1UF8gzYL3pW+MYLEV8uHaoomojYvr9XEohzBNRvvfNrj8+wPhdApHyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=hF7njYMC; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=hF7njYMC; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8E20D1F86A;
	Mon,  7 Oct 2024 09:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1728294006; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vDxbjobpGfZCYyZ64HjOHiywlASQ2w8L1QwAR5hYkM8=;
	b=hF7njYMC4u0irSgRd9ZAFMqssjaaeKJ/UwjEs8LhLKYk1sjqUWE0xzY1nujMglnZnEftk5
	rHKfwT91ICuC4uZzdDU20VdzcGz1lMLYZkLYvV3F8x/vqmm+1AUOrQxAdBCNWsX6CUnrx/
	i1zHncu72wxw6F7w/kHvqKwdoebxh7M=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=hF7njYMC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1728294006; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vDxbjobpGfZCYyZ64HjOHiywlASQ2w8L1QwAR5hYkM8=;
	b=hF7njYMC4u0irSgRd9ZAFMqssjaaeKJ/UwjEs8LhLKYk1sjqUWE0xzY1nujMglnZnEftk5
	rHKfwT91ICuC4uZzdDU20VdzcGz1lMLYZkLYvV3F8x/vqmm+1AUOrQxAdBCNWsX6CUnrx/
	i1zHncu72wxw6F7w/kHvqKwdoebxh7M=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 50A2313A55;
	Mon,  7 Oct 2024 09:40:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id GLZvEnasA2c8GAAAD6G6ig
	(envelope-from <oneukum@suse.com>); Mon, 07 Oct 2024 09:40:06 +0000
From: Oliver Neukum <oneukum@suse.com>
To: gregkh@linuxfoundation.org,
	lee@kernel.org,
	linux-usb@vger.kernel.org
Cc: Oliver Neukum <oneukum@suse.com>
Subject: [PATCH 2/2] USB: yurex: kill needless initialization in yurex_read
Date: Mon,  7 Oct 2024 11:39:48 +0200
Message-ID: <20241007094004.242122-2-oneukum@suse.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241007094004.242122-1-oneukum@suse.com>
References: <20241007094004.242122-1-oneukum@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 8E20D1F86A
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.com:email,suse.com:dkim,suse.com:mid];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	DKIM_TRACE(0.00)[suse.com:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO

This prevented the compiler from catching the patch
that broke the driver.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/usb/misc/yurex.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/misc/yurex.c b/drivers/usb/misc/yurex.c
index bd94bf078de3..70dff0db5354 100644
--- a/drivers/usb/misc/yurex.c
+++ b/drivers/usb/misc/yurex.c
@@ -400,7 +400,7 @@ static ssize_t yurex_read(struct file *file, char __user *buffer, size_t count,
 			  loff_t *ppos)
 {
 	struct usb_yurex *dev;
-	int len = 0;
+	int len;
 	char in_buffer[20];
 	unsigned long flags;
 
-- 
2.46.1



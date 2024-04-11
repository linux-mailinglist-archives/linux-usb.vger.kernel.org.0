Return-Path: <linux-usb+bounces-9261-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C01DA8A1508
	for <lists+linux-usb@lfdr.de>; Thu, 11 Apr 2024 14:49:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 799B028570A
	for <lists+linux-usb@lfdr.de>; Thu, 11 Apr 2024 12:49:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4913150991;
	Thu, 11 Apr 2024 12:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="YQhoNpyp";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="YQhoNpyp"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E7213D638
	for <linux-usb@vger.kernel.org>; Thu, 11 Apr 2024 12:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712839651; cv=none; b=jRebAYxTaB3SNnhev4vAPz2ZA5ZVtj79Bqe+2MlQVib3eKv08sBPSAtza92ggPstF57WJWurgCXrNBrNCo9TaKcVmaTc8+rq7xRlv4L0yEFHF+jIYBlBWW2+3YfCiFKecHaSz0x0uipCH2cGdWadOrgBqdhZC+RmtOz5LX/QjBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712839651; c=relaxed/simple;
	bh=3ja3DorwfleiSMmr6110yObOb8WN3kDd93hsVqD5904=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iPhvPeJpmskYPcTCvZrmJV2tWE4yLpfP3wadRKSUFkoGwNe9knB+3fg9CUvyUo2KwjskB8yHDmAeG1fqLcp1P5Dul/FxtYaqSskrkVvNsFLzbih7X1QpLwU83JO743RfoV5A9GSpZJ24ff5bAnQwq1woKaedl9IZJNNZOlfdE0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=YQhoNpyp; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=YQhoNpyp; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0F4C921A62;
	Thu, 11 Apr 2024 12:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1712839646; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zDQa4pXZRpgvnsG48uOE9kx2pZ4qBnQm5yGe74WcH3Y=;
	b=YQhoNpypDHXboNVAVXClfwvFFjVm8AZORLD/b+gxug5gKuBd1IdkEBtKfQoqJjN5P1ZZuE
	wDZfgHcOifW+hwR5fmhFIzlw4Sy9bNI9d5DLSsINXn4BNrTP32zy24HK5jZwjVR0TAR6Di
	xKPb6CeD8T/QsCcInPMVZJuPAkQy0MI=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1712839646; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zDQa4pXZRpgvnsG48uOE9kx2pZ4qBnQm5yGe74WcH3Y=;
	b=YQhoNpypDHXboNVAVXClfwvFFjVm8AZORLD/b+gxug5gKuBd1IdkEBtKfQoqJjN5P1ZZuE
	wDZfgHcOifW+hwR5fmhFIzlw4Sy9bNI9d5DLSsINXn4BNrTP32zy24HK5jZwjVR0TAR6Di
	xKPb6CeD8T/QsCcInPMVZJuPAkQy0MI=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D75EC13A1D;
	Thu, 11 Apr 2024 12:47:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id uNl8Mt3bF2brIQAAD6G6ig
	(envelope-from <oneukum@suse.com>); Thu, 11 Apr 2024 12:47:25 +0000
From: Oliver Neukum <oneukum@suse.com>
To: linux-usb@vger.kernel.org
Cc: Oliver Neukum <oneukum@suse.com>
Subject: [RFC 3/6] usb: usb_parse_endpoint needs to guard against short descriptors
Date: Thu, 11 Apr 2024 14:43:01 +0200
Message-ID: <20240411124722.17343-4-oneukum@suse.com>
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
X-Spam-Flag: NO
X-Spam-Score: 0.20
X-Spam-Level: 
X-Spamd-Result: default: False [0.20 / 50.00];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	BAYES_HAM(-0.00)[40.92%];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCVD_TLS_ALL(0.00)[]

If a malicious device gives us a descriptor of zero length
we'll go into an infinite loop. We have to check and do
a hard bailout.
If we get a descriptor of length < 2 we'll parse the next
descriptor as part of the current descriptor. We need to check.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/usb/core/config.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/core/config.c b/drivers/usb/core/config.c
index 5891652b6202..050cd5066ccf 100644
--- a/drivers/usb/core/config.c
+++ b/drivers/usb/core/config.c
@@ -265,6 +265,9 @@ static int usb_parse_endpoint(struct device *ddev, int cfgno,
 	const unsigned short *maxpacket_maxes;
 
 	d = (struct usb_endpoint_descriptor *) buffer;
+	if (d->bLength < sizeof(struct usb_descriptor_header)) /* this amounts to sabotage */
+		return -EINVAL;
+
 	buffer += d->bLength;
 	size -= d->bLength;
 
-- 
2.44.0



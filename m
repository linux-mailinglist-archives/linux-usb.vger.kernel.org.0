Return-Path: <linux-usb+bounces-9256-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EE94E8A1504
	for <lists+linux-usb@lfdr.de>; Thu, 11 Apr 2024 14:49:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8F3A91F211C0
	for <lists+linux-usb@lfdr.de>; Thu, 11 Apr 2024 12:49:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADFC114D43B;
	Thu, 11 Apr 2024 12:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="kMpNvG3u";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="QWnEOICn"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36DD0EECC
	for <linux-usb@vger.kernel.org>; Thu, 11 Apr 2024 12:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712839650; cv=none; b=nXgeHQFq1iMEZEMlmCOXAB8M3lQm1+63XDCTxCykhJFFpM0+sZzg5MLDPeup/1aQpmnc6FDPBhfrWRilWdpERqMz94/SJ7xoLMJa8ZuRWX5peJ87egrjCTLc/t/z2/K575qAw8BeUPUAmUtCNMzD+esZIblX0kCylNtlZIgIx5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712839650; c=relaxed/simple;
	bh=u/TGSKh4U4JXr69+3nznJBHTVEOZwnRRriGPX1aiYp4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kXuej0TT8EY/MmEDu4Frot6UgA0fTK7KWdflfQMPmFxHO/zeFU18AcZSdS5DRJuPhbvyqD/O546gmAdRErlER6ZwcwG9D9wgcQU9UVG7xatMt5DQkGySY8NCL5dijg+YMR24p8hN3c7izIgYHHaQFK8yWSJ57GH7AeZF4zyMj10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=kMpNvG3u; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=QWnEOICn; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id CDB7921A5C;
	Thu, 11 Apr 2024 12:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1712839646; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zTFtpcm3AXKV9K6xx1m8dHoUrT6y91CZsjlxlVEfkLY=;
	b=kMpNvG3uiFmrjXEGxBC+XCCl0Vbo8jH9AQw6p2gkyoAxkELloHLelT/iKCtn8Jq1/DInAA
	A5j+7XSasZxLRB7g1jd8qw1PE/82T0RDj0aCyjJvoT2kLNKYJr9r/SjEy+Ci1iStoN0uXN
	0gtHnluWMFuEz6MBYeetIBLeSVU1MAo=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=QWnEOICn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1712839645; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zTFtpcm3AXKV9K6xx1m8dHoUrT6y91CZsjlxlVEfkLY=;
	b=QWnEOICntRRK2z0+bADpz97x9cFPtPpfdR5U7XKAfHO0tl5zQQlIQAT33rDe3KljT16rdu
	3K3xRqkYXc0x3DCOGGtsicP1Q4Peee+kVGoCAA517eeUdJE7EcmgVrGTsv/kj4TqaZBdhJ
	AUw+WZClX6aEbA+428EyqPzmE/LuYtM=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A25B213A17;
	Thu, 11 Apr 2024 12:47:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id MNuIJd3bF2brIQAAD6G6ig
	(envelope-from <oneukum@suse.com>); Thu, 11 Apr 2024 12:47:25 +0000
From: Oliver Neukum <oneukum@suse.com>
To: linux-usb@vger.kernel.org
Cc: Oliver Neukum <oneukum@suse.com>
Subject: [RFC 2/6] usb: avoid overrunning a buffer in usb_parse_interface
Date: Thu, 11 Apr 2024 14:43:00 +0200
Message-ID: <20240411124722.17343-3-oneukum@suse.com>
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
	BAYES_HAM(-0.00)[32.01%];
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
X-Rspamd-Queue-Id: CDB7921A5C
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action

We must not touch bDescriptorType if it is not within our buffer.
To guarantee that we have to be sure the first two bytes of the
descriptor are within the buffer.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/usb/core/config.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/core/config.c b/drivers/usb/core/config.c
index c7056b123d46..5891652b6202 100644
--- a/drivers/usb/core/config.c
+++ b/drivers/usb/core/config.c
@@ -575,7 +575,7 @@ static int usb_parse_interface(struct device *ddev, int cfgno,
 
 	/* Parse all the endpoint descriptors */
 	n = 0;
-	while (size > 0) {
+	while (size >= sizeof(struct usb_descriptor_header)) { /* minimum length to get bDescriptorType */
 		if (((struct usb_descriptor_header *) buffer)->bDescriptorType
 		     == USB_DT_INTERFACE)
 			break;
-- 
2.44.0



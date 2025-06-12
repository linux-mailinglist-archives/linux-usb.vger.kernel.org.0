Return-Path: <linux-usb+bounces-24702-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B1898AD7031
	for <lists+linux-usb@lfdr.de>; Thu, 12 Jun 2025 14:23:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BB3761BC6DA9
	for <lists+linux-usb@lfdr.de>; Thu, 12 Jun 2025 12:22:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FF9B1CF7AF;
	Thu, 12 Jun 2025 12:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="RDFMLGmR";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="RDFMLGmR"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31D611D79A5
	for <linux-usb@vger.kernel.org>; Thu, 12 Jun 2025 12:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749730915; cv=none; b=hrgSsgLhS9gJFrLGYdA3AOAl+BceSouPPBUeFmtg9YjfsX9NswCRdK6lB6zYw1Cz4BBKTqpN3v3/dnfJwBPZ3rM03CzeLpad2mQdxyUKoI0n2bd/WBV4nRJ5gLZaNKaA6AZgQc2pWOuPblqkdBUpG6iAM/Eok6Okrzo1b+e13s4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749730915; c=relaxed/simple;
	bh=iCo1ij3F0IafXu6Kt2u5gwYqUkT5CM/nWX07fJhIRZw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=g7c2YfuYPNI6mqZo/2Z8sE95Pza67Rp0WMQgpXE5QCA6rDZcniR6pj07cphJmdPOwjI8XQWfb0LvdG0SLvA7gzXxEsBw2UNbi+kMMPxOqDEHzB73sitjTcSpkGPDOovFQu2ihWLqi8NENZLge7t2FIxqgnDabw2DDLlGzQlr3h0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=RDFMLGmR; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=RDFMLGmR; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5239021186;
	Thu, 12 Jun 2025 12:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1749730911; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=UdLIeQeG52VMUfSdtD/cIVAQiLZ4K94C3aE0udWNhPg=;
	b=RDFMLGmRWZopynhz1usl/djTikCeslIlZmvMQMfl8y3nRK6uNE67lgqd18pSAUueNmKeu8
	IFZAzzUBEOoX/KoOYabMHcgwvDji0gRZSCWJTNMISHaWdyjxs4ly4YNaWmCMgOZc6aGU/c
	835Hb06jNVjlNnYRUjto65rMQ3T74j4=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=RDFMLGmR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1749730911; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=UdLIeQeG52VMUfSdtD/cIVAQiLZ4K94C3aE0udWNhPg=;
	b=RDFMLGmRWZopynhz1usl/djTikCeslIlZmvMQMfl8y3nRK6uNE67lgqd18pSAUueNmKeu8
	IFZAzzUBEOoX/KoOYabMHcgwvDji0gRZSCWJTNMISHaWdyjxs4ly4YNaWmCMgOZc6aGU/c
	835Hb06jNVjlNnYRUjto65rMQ3T74j4=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 32263132D8;
	Thu, 12 Jun 2025 12:21:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id jrAaC1/GSmiqdAAAD6G6ig
	(envelope-from <oneukum@suse.com>); Thu, 12 Jun 2025 12:21:51 +0000
From: Oliver Neukum <oneukum@suse.com>
To: stern@rowland.harvard.edu,
	gregKH@linuxfoundation.org,
	linux-usb@vger.kernel.org
Cc: Oliver Neukum <oneukum@suse.com>
Subject: [PATCH v2] usb: core: usb_submit_urb: downgrade type check
Date: Thu, 12 Jun 2025 14:20:25 +0200
Message-ID: <20250612122149.2559724-1-oneukum@suse.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 5239021186
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.com:mid,suse.com:dkim,suse.com:email]
X-Spam-Score: -3.01
X-Spam-Level: 

Checking for the endpoint type is no reason for a WARN,
as that can cause a reboot. A driver not checking the
endpoint type must not cause a reboot, as there is just
no point in this.
We cannot prevent a device from doing something incorrect
as a reaction to a transfer. Hence warning for a mere
assumption being wrong is not sensible.

Signed-off-by: Oliver Neukum <oneukum@suse.com>

V2: using dev_warn_once()
---
 drivers/usb/core/urb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/core/urb.c b/drivers/usb/core/urb.c
index 5e52a35486af..120de3c499d2 100644
--- a/drivers/usb/core/urb.c
+++ b/drivers/usb/core/urb.c
@@ -500,7 +500,7 @@ int usb_submit_urb(struct urb *urb, gfp_t mem_flags)
 
 	/* Check that the pipe's type matches the endpoint's type */
 	if (usb_pipe_type_check(urb->dev, urb->pipe))
-		dev_WARN(&dev->dev, "BOGUS urb xfer, pipe %x != type %x\n",
+		dev_warn_once(&dev->dev, "BOGUS urb xfer, pipe %x != type %x\n",
 			usb_pipetype(urb->pipe), pipetypes[xfertype]);
 
 	/* Check against a simple/standard policy */
-- 
2.49.0



Return-Path: <linux-usb+bounces-11471-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E02291007E
	for <lists+linux-usb@lfdr.de>; Thu, 20 Jun 2024 11:38:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2F7251F2200A
	for <lists+linux-usb@lfdr.de>; Thu, 20 Jun 2024 09:38:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EC491A4F09;
	Thu, 20 Jun 2024 09:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="unT0AcuM";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="Eo4lUm5H"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E38A519E836
	for <linux-usb@vger.kernel.org>; Thu, 20 Jun 2024 09:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718876287; cv=none; b=j4+luETv4WhXx+n9rinkdUjArhhRQElBwvnlU+6zSWXrGdmyzm+2vzYXZpw47d/f7lsPq9NQwOFOnZhiCVN/YGlzY59JAqJOdtkVpuNI+y+4Zvmr9t9qqnrsBj1CDlO3DogAbQrE3HfNehnYfn07mizcKmTPHdBi8MX/p9RRmyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718876287; c=relaxed/simple;
	bh=JKnd1T41WaHx3QtvbV5ZbBcBK+pi1uqTigIOR2pIG10=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ou6wwolPuW29wBXDeVnmxL1/DLCg1tB5v4M5XJRTJlumk3UZlexiYQXEXfkRoQ+vLgsW4Jnhk2ipN4FheajqBNpsOyO1oSIZAHqCWiYY7fOdbr9/3cjuO6p3lw3Cc+1HqDUNYEUhCP2y0y4qlCfi05ojmqN1GNynvNAfOXLvbsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=unT0AcuM; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=Eo4lUm5H; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id DBCFB2198A;
	Thu, 20 Jun 2024 09:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1718876284; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=50fHZCU3yjqbBtR+Y6itCezrzlgrMivNF0P64rBtuqA=;
	b=unT0AcuM0HgURb+BNRVRfqMa0VmvCjJPr33F8lZKOTaIcqGaIucjGb6GUnZraDE95619Y0
	lRxUwt2iIfdkyy2V+pCmDtxNrwJvM7N/7QQOnif4d4DmlEzVlk1bziKLsAVvuYGhWIUN14
	0xjftMQdnsaAdHC4xxGLo+mw/xpV8LQ=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=Eo4lUm5H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1718876283; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=50fHZCU3yjqbBtR+Y6itCezrzlgrMivNF0P64rBtuqA=;
	b=Eo4lUm5HFQ705qdAeF1Vr4cbEEPR79c0YC3IPuOBqLc4RO8AKEdTsb13H5nBKybbOSAcqJ
	Ptr0K5ohH8iZesA6rHVmrng8ATdDEAdBABR+LB6vfpZgdKSQ9tJc8/T5wL+2/PR6fOrX/k
	8eBkV5JUEaWJm3IlNSebGdS2k9gjefQ=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8E15513AC1;
	Thu, 20 Jun 2024 09:38:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ZGWFIHv4c2agegAAD6G6ig
	(envelope-from <oneukum@suse.com>); Thu, 20 Jun 2024 09:38:03 +0000
From: Oliver Neukum <oneukum@suse.com>
To: ivan.orlov0322@gmail.com,
	christophe.jaillet@wanadoo.fr,
	linux-usb@vger.kernel.org,
	gregkh@linuxfoundation.org
Cc: Oliver Neukum <oneukum@suse.com>
Subject: [PATCH] usb: gadget: printer: SS+ support
Date: Thu, 20 Jun 2024 11:37:39 +0200
Message-ID: <20240620093800.28901-1-oneukum@suse.com>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com,wanadoo.fr,vger.kernel.org,linuxfoundation.org];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.com:email,suse.com:dkim];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DWL_DNSWL_BLOCKED(0.00)[suse.com:dkim];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	TAGGED_RCPT(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,wanadoo.fr]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: DBCFB2198A
X-Spam-Flag: NO
X-Spam-Score: -1.51
X-Spam-Level: 

We need to treat super speed plus as super speed, not the default,
which is full speed.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/usb/gadget/function/f_printer.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/gadget/function/f_printer.c b/drivers/usb/gadget/function/f_printer.c
index ba7d180cc9e6..4c0b7c2970f1 100644
--- a/drivers/usb/gadget/function/f_printer.c
+++ b/drivers/usb/gadget/function/f_printer.c
@@ -213,6 +213,7 @@ static inline struct usb_endpoint_descriptor *ep_desc(struct usb_gadget *gadget,
 					struct usb_endpoint_descriptor *ss)
 {
 	switch (gadget->speed) {
+	case USB_SPEED_SUPER_PLUS:
 	case USB_SPEED_SUPER:
 		return ss;
 	case USB_SPEED_HIGH:
-- 
2.45.1



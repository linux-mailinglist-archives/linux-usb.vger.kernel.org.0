Return-Path: <linux-usb+bounces-9447-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 62EF08A981E
	for <lists+linux-usb@lfdr.de>; Thu, 18 Apr 2024 13:03:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 025DF1F22107
	for <lists+linux-usb@lfdr.de>; Thu, 18 Apr 2024 11:03:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7954015E20C;
	Thu, 18 Apr 2024 11:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="pmO9FeRR";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="pmO9FeRR"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF59F15E1FF
	for <linux-usb@vger.kernel.org>; Thu, 18 Apr 2024 11:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713438185; cv=none; b=Hg4POLL/e7AwDtjNRR9o+QaRzfL+qzWigJ7WaPDwyK2APh+dxLeJh9csRGEw7PvjRfwrmHL2CNpxgjTUSZN5mmZ2EH49+mlyNVQBZWLgmI5/RbtA78VUv2MmLmZUrINZocRCaA3JrpLAFsXrFVaOMe80jnumqfJ/iGF3T+c1VWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713438185; c=relaxed/simple;
	bh=KsKyiKceeVCHad4I/n0z5e7Vm8R9O6XguM9ENKcBlys=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dUFQDAgR34mKb8MSm7rvgfqAB/ZFAYcAqbDB1KGNif8iyv52sW0C6KysU+B+JVUCGNq/A1st07FGQ+tWEhk9tXL8AxdQV64shPQlCxuSqhXmENCfI7fq6Erqk8DmEcgZ0qhWUJyeHFDOFEgCvmw0qpZneUS9NQ5uUdPz/68HRHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=pmO9FeRR; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=pmO9FeRR; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4780A5C8FC;
	Thu, 18 Apr 2024 11:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1713438172; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=2wZ3F3T5UlHtZSQ46AvN1BIxCjRaGGVX7hmOKnTpUWA=;
	b=pmO9FeRRd9mI2+I6K+U9OGp/lpZt04H8qgipx/GSPQGu5m133XBNFpZxWa8fsV0neCwnCB
	8JRct43Hz9NVQWg7fFxOhr4ewckzPM2CJufwDr0QHoiMfoWW/+uzidweIyIw04mJ3lp972
	RaiGYMGXaxq6ZrgWJVLL7yAVQYab9ag=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1713438172; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=2wZ3F3T5UlHtZSQ46AvN1BIxCjRaGGVX7hmOKnTpUWA=;
	b=pmO9FeRRd9mI2+I6K+U9OGp/lpZt04H8qgipx/GSPQGu5m133XBNFpZxWa8fsV0neCwnCB
	8JRct43Hz9NVQWg7fFxOhr4ewckzPM2CJufwDr0QHoiMfoWW/+uzidweIyIw04mJ3lp972
	RaiGYMGXaxq6ZrgWJVLL7yAVQYab9ag=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0FCDE1384C;
	Thu, 18 Apr 2024 11:02:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 9UnSAdz9IGapWgAAD6G6ig
	(envelope-from <oneukum@suse.com>); Thu, 18 Apr 2024 11:02:52 +0000
From: Oliver Neukum <oneukum@suse.com>
To: gregkh@lnuxfoundation.org,
	stern@rowland.harvard.edu,
	linux-usb@vger.kernel.org
Cc: Oliver Neukum <oneukum@suse.com>
Subject: [PATCHv2] usb: usb_parse_endpoint ignore reserved bits
Date: Thu, 18 Apr 2024 13:02:21 +0200
Message-ID: <20240418110249.10643-1-oneukum@suse.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.com:email];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -2.80
X-Spam-Flag: NO

Reading bEndpointAddress the spec tells is
that

b7 is direction, which must be ignored
b6:4 are reserved which are to be set to zero
b3:0 are the endpoint address

In order to be backwards compatible with possible
future versions of USB we have to be ready with
devices using those bits. That means that we
also have to ignore them like we do with the direction
bit.
In consequence the only illegal address you can
encoding in four bits is endpoint zero, for which
no descriptor must exist. Hence the check for exceeding
the upper limit on endpoint addresses is removed.

Signed-off-by: Oliver Neukum <oneukum@suse.com>

V2: Improved commit log
---
 drivers/usb/core/config.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/core/config.c b/drivers/usb/core/config.c
index 8fd4208d17db..43c5ed256e6e 100644
--- a/drivers/usb/core/config.c
+++ b/drivers/usb/core/config.c
@@ -285,11 +285,11 @@ static int usb_parse_endpoint(struct device *ddev, int cfgno,
 		goto skip_to_next_endpoint_or_interface_descriptor;
 	}
 
-	i = d->bEndpointAddress & ~USB_ENDPOINT_DIR_MASK;
-	if (i >= 16 || i == 0) {
+	i = d->bEndpointAddress & 0x0f;
+	if (i == 0) {
 		dev_notice(ddev, "config %d interface %d altsetting %d has an "
-		    "invalid endpoint with address 0x%X, skipping\n",
-		    cfgno, inum, asnum, d->bEndpointAddress);
+		    "invalid descriptor for the common control endpoint, skipping\n",
+		    cfgno, inum, asnum);
 		goto skip_to_next_endpoint_or_interface_descriptor;
 	}
 
-- 
2.44.0



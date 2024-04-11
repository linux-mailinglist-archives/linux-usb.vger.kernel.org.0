Return-Path: <linux-usb+bounces-9262-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 867708A1509
	for <lists+linux-usb@lfdr.de>; Thu, 11 Apr 2024 14:49:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B85051C20EEF
	for <lists+linux-usb@lfdr.de>; Thu, 11 Apr 2024 12:49:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBE23145330;
	Thu, 11 Apr 2024 12:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="XqfUH3ng";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="Y6uWnMXQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD0013E88B
	for <linux-usb@vger.kernel.org>; Thu, 11 Apr 2024 12:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712839651; cv=none; b=ptxXr6N53nx5Udto39jf10405a33v8Vji5o2dUCsUq48R1SLjpY82xU9ObB1xs2Pk5oLXCZnd3h/Gv+P0nUZwPOtfQK4v1Oh7lHqFA+wUI+3RKmFcCXAcx3257Ug3yRhTfYr9vRaHwKzj2k5NGeHYOL0uE7ULC6w+okkzbRcIss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712839651; c=relaxed/simple;
	bh=Fn8OtNhZ8WCWH0zzyi2PApZIAVDfRsFGEHVMvqMcYTg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M+83L359fyZJwv2YqkszmYv2joAUEQyEN+xV1T+Ti2rrm+kaQGvs5yMAf63YErRGqQ+4awiFBFhLXcSqxPXFZhloe2Ik5+ZiqgO5IKnoVidVB5fC42Rl589u0BEgA92fbO1nEJ6IrVq8ZQajtbUVWQlqtq/mr7VNjpiFZRE60CQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=XqfUH3ng; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=Y6uWnMXQ; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9A4625C6D0;
	Thu, 11 Apr 2024 12:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1712839646; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hasFfz2pcPB7nP7rzG7sl792Sg2ffR5b4jZpzagtiZQ=;
	b=XqfUH3ng+c7fTy3LrlG7iHgy1LhM6W/UjW5yyYAqfEmkjr/2hnK7osBwUamfvXzs5iL5w4
	/vsEdkrJpi1mNZtdELUUOgE41wPXLdJjYGxYbGAULU5zZnyN/8gkOI/ljddXqYtSMWGw3V
	EV3nbE9wae0EKLzUC1C/sh3rpoZkDwo=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1712839645; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hasFfz2pcPB7nP7rzG7sl792Sg2ffR5b4jZpzagtiZQ=;
	b=Y6uWnMXQ5XDGTN05f80/iXg+QeBEW+d5mN5NovcqnWA0AzaNOkflu2Dlgk4HQfISnqAfJH
	qMXznrTqwiChBlogFTLA0goKiWPpWJET+qEkCqzk+7WmQVgdZyWKecWcAzDZho5INaETz2
	wyKzXoJZtJPw9f2N3V6nRbMQksEz/nA=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6CB92139E2;
	Thu, 11 Apr 2024 12:47:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ELV8GN3bF2brIQAAD6G6ig
	(envelope-from <oneukum@suse.com>); Thu, 11 Apr 2024 12:47:25 +0000
From: Oliver Neukum <oneukum@suse.com>
To: linux-usb@vger.kernel.org
Cc: Oliver Neukum <oneukum@suse.com>
Subject: [RFC 1/6] usb: usb_parse_endpoint ignore reserved bits
Date: Thu, 11 Apr 2024 14:42:59 +0200
Message-ID: <20240411124722.17343-2-oneukum@suse.com>
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
X-Spam-Score: 0.16
X-Spam-Level: 
X-Spamd-Result: default: False [0.16 / 50.00];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	BAYES_HAM(-0.04)[59.07%];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]

We have to ignore the higher bits in bEndpointAddress

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/usb/core/config.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/core/config.c b/drivers/usb/core/config.c
index 7f8d33f92ddb..c7056b123d46 100644
--- a/drivers/usb/core/config.c
+++ b/drivers/usb/core/config.c
@@ -279,11 +279,11 @@ static int usb_parse_endpoint(struct device *ddev, int cfgno,
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



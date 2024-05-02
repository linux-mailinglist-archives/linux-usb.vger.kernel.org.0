Return-Path: <linux-usb+bounces-9975-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 190608B9A47
	for <lists+linux-usb@lfdr.de>; Thu,  2 May 2024 13:53:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C9BDC2827AC
	for <lists+linux-usb@lfdr.de>; Thu,  2 May 2024 11:53:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 880F96E617;
	Thu,  2 May 2024 11:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="iZ4rC5m5";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="Fqgfj2kf"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 577905FDC8
	for <linux-usb@vger.kernel.org>; Thu,  2 May 2024 11:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714650793; cv=none; b=hcc2lsmkKaipMwKEFqiaeAKFkr84xelFlljzh2YhRmvU3kmvnbNtKyv4U9TAeHtzNchMzURD4qROA/rNXJs4hn6AuEtrmjb+kazo/cHa2NTFutlFMgOib3jFh7dc8ZLTwhgoY9i1Y0P/PsecHn0ba0N4PWAIj5dfcXnNCMbka9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714650793; c=relaxed/simple;
	bh=Tc8YXFHpSeOb6SHUs89BxzVOIscHLO2lg0XKSC9rb54=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ks1fPxsrTZm3ybVydfK7D3YEp1f2pP5PZDk2kYtownOKWEbGbmPu1RdXpi5t8ibpKyb5R9sxC7FIShnbZLu2Z10/uHuoYOf6qv1Rl4mJG7sQSwZ3RYjmVJ+7IvuOgBtz7qQZsNc+9TJH6eMqlApdSM9ldTJZhJKoLIYDkrMoCCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=iZ4rC5m5; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=Fqgfj2kf; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6FCDD1FB79;
	Thu,  2 May 2024 11:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1714650789; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=JvgZZncsU1s2B+lONX62eyVnRpLq6hN+Lwk5t32ZFe0=;
	b=iZ4rC5m5ztmnNdT5Qov+MmBYpgjtTtb1mbZIAYAujM1GE3IKenqNSW5JpypDmuFTmLYFfr
	eOuB/P3WblTMlZUeg7iUA7Vj167bxfYPz5VbtkxXi87OrCVsC22SFCbLzIrFD25TmqT38G
	hs9xZ1HciRmbckr/GjO9ir3UjnECj8M=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=Fqgfj2kf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1714650787; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=JvgZZncsU1s2B+lONX62eyVnRpLq6hN+Lwk5t32ZFe0=;
	b=Fqgfj2kfmT2bl21ezrb9N6NcsoOFr3fvT8wBhGmAiLQiLE4/wYphhhpOVOou74tGRXbNUS
	bmob0/jl1NsX0pjB9NXkkFgl9oW2b72Hsw6v/9KdqlCNY9anYvy9TdbNacIWXPcqk8vqrM
	Axra1mjpirDE1o1eMRHyXI3xAz+I+G4=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1651013957;
	Thu,  2 May 2024 11:53:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id KPmgAKN+M2bBLQAAD6G6ig
	(envelope-from <oneukum@suse.com>); Thu, 02 May 2024 11:53:07 +0000
From: Oliver Neukum <oneukum@suse.com>
To: linux-usb@vger.kernel.org,
	gregKH@linuxfoundation.org,
	stern@rowland.harvard.edu
Cc: Oliver Neukum <oneukum@suse.com>
Subject: [PATCHv3] usb: usb_parse_endpoint ignore reserved bits
Date: Thu,  2 May 2024 13:51:40 +0200
Message-ID: <20240502115259.31076-1-oneukum@suse.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 6FCDD1FB79
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DWL_DNSWL_BLOCKED(0.00)[suse.com:dkim];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]

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
---
v2: Improved commit log
v3: Symbolic mask and improved error message
 drivers/usb/core/config.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/core/config.c b/drivers/usb/core/config.c
index 7f8d33f92ddb..3362af165ef5 100644
--- a/drivers/usb/core/config.c
+++ b/drivers/usb/core/config.c
@@ -279,11 +279,11 @@ static int usb_parse_endpoint(struct device *ddev, int cfgno,
 		goto skip_to_next_endpoint_or_interface_descriptor;
 	}
 
-	i = d->bEndpointAddress & ~USB_ENDPOINT_DIR_MASK;
-	if (i >= 16 || i == 0) {
+	i = d->bEndpointAddress & USB_ENDPOINT_NUMBER_MASK;
+	if (i == 0) {
 		dev_notice(ddev, "config %d interface %d altsetting %d has an "
-		    "invalid endpoint with address 0x%X, skipping\n",
-		    cfgno, inum, asnum, d->bEndpointAddress);
+		    "invalid descriptor for endpoint zero, skipping\n",
+		    cfgno, inum, asnum);
 		goto skip_to_next_endpoint_or_interface_descriptor;
 	}
 
-- 
2.44.0



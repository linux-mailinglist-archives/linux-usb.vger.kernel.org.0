Return-Path: <linux-usb+bounces-24694-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E7FAD5793
	for <lists+linux-usb@lfdr.de>; Wed, 11 Jun 2025 15:52:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 873C83A5BF7
	for <lists+linux-usb@lfdr.de>; Wed, 11 Jun 2025 13:52:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B72F2289E19;
	Wed, 11 Jun 2025 13:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="n7o1VGnx";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="n7o1VGnx"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E31EB27BF95
	for <linux-usb@vger.kernel.org>; Wed, 11 Jun 2025 13:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749649959; cv=none; b=uQCLy5oTEBckcCeomysEC4ztZ21XwvKFRHyLxDS72iG7KQ4qnk9G7LIKa4zOWpLwtZlcjx5nm9FKJY5j/8XcX8pYMpD4UsTRJ6U3awOGiBvt0FvoBy1k7zYd/99uqVKKupVOjK0HRp6S//rd192u92QVzqM182qAXAvdBdI9SlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749649959; c=relaxed/simple;
	bh=QFWYW5kaiGDetj1OfsAqHY/vd4zHU6YIDGCQ6JCtW8Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ptAwzptlsL3qnZyLKzSy8QgOPbbWy+xE2LGvqBahHkOcg/KtSDuSPU70bQamEKL4JTd+Hg+scNoMYX0mRNI5qq4YCU7Tg+ct9VWkpNYe3+7m2n9NNHPRs56StVn/0XNhfxl5vjUCsn8QLzNpQ/45B04QqblCNlM59iMpbzIeAwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=n7o1VGnx; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=n7o1VGnx; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B4E471F7CE;
	Wed, 11 Jun 2025 13:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1749649954; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=B0LSww1OyUykeUdWBVJJiHmlCWoXXu/ch1OC67pWnck=;
	b=n7o1VGnxuTW2Z41mLdi53/X6Jr/Xhno5yoofE16AQPbhn2NnFro2nIPpdP8zlnNc1o5Jba
	ru5sWg0zfK8kcx8p29SN0efA0RTeHCVAGHLmmpy3eCX2SkETu9i08R8gWMRWDae5jU42eY
	jAMwdUOXk/gAYes+2iEF8jNWmkam8l4=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=n7o1VGnx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1749649954; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=B0LSww1OyUykeUdWBVJJiHmlCWoXXu/ch1OC67pWnck=;
	b=n7o1VGnxuTW2Z41mLdi53/X6Jr/Xhno5yoofE16AQPbhn2NnFro2nIPpdP8zlnNc1o5Jba
	ru5sWg0zfK8kcx8p29SN0efA0RTeHCVAGHLmmpy3eCX2SkETu9i08R8gWMRWDae5jU42eY
	jAMwdUOXk/gAYes+2iEF8jNWmkam8l4=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8BA9E139CE;
	Wed, 11 Jun 2025 13:52:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id AgnaICKKSWhnVwAAD6G6ig
	(envelope-from <oneukum@suse.com>); Wed, 11 Jun 2025 13:52:34 +0000
From: Oliver Neukum <oneukum@suse.com>
To: gregKH@linuxfoundation.org,
	linux-usb@vger.kernel.org
Cc: Oliver Neukum <oneukum@suse.com>
Subject: [PATCH] usb: core: usb_submit_urb: downgrade type check
Date: Wed, 11 Jun 2025 15:52:25 +0200
Message-ID: <20250611135231.2380902-1-oneukum@suse.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: B4E471F7CE
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.com:mid,suse.com:dkim,suse.com:email];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[suse.com:+]
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
---
 drivers/usb/core/urb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/core/urb.c b/drivers/usb/core/urb.c
index 5e52a35486af..acf74ad36326 100644
--- a/drivers/usb/core/urb.c
+++ b/drivers/usb/core/urb.c
@@ -500,7 +500,7 @@ int usb_submit_urb(struct urb *urb, gfp_t mem_flags)
 
 	/* Check that the pipe's type matches the endpoint's type */
 	if (usb_pipe_type_check(urb->dev, urb->pipe))
-		dev_WARN(&dev->dev, "BOGUS urb xfer, pipe %x != type %x\n",
+		dev_dbg(&dev->dev, "BOGUS urb xfer, pipe %x != type %x\n",
 			usb_pipetype(urb->pipe), pipetypes[xfertype]);
 
 	/* Check against a simple/standard policy */
-- 
2.49.0



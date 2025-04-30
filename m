Return-Path: <linux-usb+bounces-23582-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A49B9AA4DD1
	for <lists+linux-usb@lfdr.de>; Wed, 30 Apr 2025 15:48:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1483A4C6D3D
	for <lists+linux-usb@lfdr.de>; Wed, 30 Apr 2025 13:48:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4C1F25CC64;
	Wed, 30 Apr 2025 13:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="cX6GXXez";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="cX6GXXez"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F293625D8E7
	for <linux-usb@vger.kernel.org>; Wed, 30 Apr 2025 13:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746020897; cv=none; b=Iww+aE5BTDcCJMps2Y8Q4P665INYbBFfHsJAcp80MWx6EqGZZB+76oJcTaTF4Iptmt/EXjAHU21p8xqtVKKRMyMc1lek0N3OZX1covxMFEOS81bGiPJ7Ct9PKeKaqilbHusChvJn1bXQ8lkxBovWL1bS0yzjvUY+UNRSDEBljZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746020897; c=relaxed/simple;
	bh=qD/ag6Qx0h6Nk44QxbbfUuIgoOFhIZ9K1iH5k9GDYac=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YathOPiNIC+vuwDACugn0efedAPot1xTfXyzOClhdlxNB5mxqSmGEdgHdMH5K0Re/f443XbusMAa/Itx+mRMcdKwwHdiQXzhWWBDHgnjpEnHMHBe8n4QKI9uxqeH5l29OKFPY9YC5HK2g/ftktO4NoOelBMQ8D1crwzIFZwjjkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=cX6GXXez; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=cX6GXXez; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 13DA321170;
	Wed, 30 Apr 2025 13:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1746020893; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=EzdKI19OR8gJ3Vy5R9+8/WlroasGq9kMvycjjCcnmhk=;
	b=cX6GXXezgGbCzs3juqWSEG5tB6mLy09VMvnjfNbLjGiXxb3USqt7PvRC+8a9rSvCIsigO+
	W0Hr73nDhb3byCRRP0NXmTDehDmtsI9HgjAMN53qGUHnac0HlGim3qypnq6YqlFyHpgPmW
	t8RuxgVIxWg7sFwAYMWCt1S8wvTpDos=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1746020893; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=EzdKI19OR8gJ3Vy5R9+8/WlroasGq9kMvycjjCcnmhk=;
	b=cX6GXXezgGbCzs3juqWSEG5tB6mLy09VMvnjfNbLjGiXxb3USqt7PvRC+8a9rSvCIsigO+
	W0Hr73nDhb3byCRRP0NXmTDehDmtsI9HgjAMN53qGUHnac0HlGim3qypnq6YqlFyHpgPmW
	t8RuxgVIxWg7sFwAYMWCt1S8wvTpDos=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E8B53139E7;
	Wed, 30 Apr 2025 13:48:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id M5MjNxwqEmgcewAAD6G6ig
	(envelope-from <oneukum@suse.com>); Wed, 30 Apr 2025 13:48:12 +0000
From: Oliver Neukum <oneukum@suse.com>
To: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org
Cc: Oliver Neukum <oneukum@suse.com>
Subject: [PATCH] USB: usbtmc: use interruptible sleep in usbtmc_read
Date: Wed, 30 Apr 2025 15:48:10 +0200
Message-ID: <20250430134810.226015-1-oneukum@suse.com>
X-Mailer: git-send-email 2.49.0
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
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
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
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:mid,imap1.dmz-prg2.suse.org:helo];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -2.80
X-Spam-Flag: NO

usbtmc_read() calls usbtmc_generic_read()
which uses interruptible sleep, but usbtmc_read()
itself uses uninterruptble sleep for mutual exclusion
between threads. That makes no sense.
Both should use interruptible sleep.

Fixes: 5b775f672cc99 ("USB: add USB test and measurement class driver")
Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/usb/class/usbtmc.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/class/usbtmc.c b/drivers/usb/class/usbtmc.c
index 34e46ef308ab..634c3bcbb413 100644
--- a/drivers/usb/class/usbtmc.c
+++ b/drivers/usb/class/usbtmc.c
@@ -1380,7 +1380,10 @@ static ssize_t usbtmc_read(struct file *filp, char __user *buf,
 	if (!buffer)
 		return -ENOMEM;
 
-	mutex_lock(&data->io_mutex);
+	retval = mutex_lock_interruptible(&data->io_mutex);
+	if (retval < 0)
+		goto exit_nolock;
+
 	if (data->zombie) {
 		retval = -ENODEV;
 		goto exit;
@@ -1503,6 +1506,7 @@ static ssize_t usbtmc_read(struct file *filp, char __user *buf,
 
 exit:
 	mutex_unlock(&data->io_mutex);
+exit_nolock:
 	kfree(buffer);
 	return retval;
 }
-- 
2.49.0



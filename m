Return-Path: <linux-usb+bounces-15008-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D420976BCC
	for <lists+linux-usb@lfdr.de>; Thu, 12 Sep 2024 16:19:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CE07EB21627
	for <lists+linux-usb@lfdr.de>; Thu, 12 Sep 2024 14:19:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF7D219C554;
	Thu, 12 Sep 2024 14:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="j6oyyT0r";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="j6oyyT0r"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 851C22209B
	for <linux-usb@vger.kernel.org>; Thu, 12 Sep 2024 14:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726150764; cv=none; b=lmHD70XCcAjqBpyIqOtXPFTh9M3bhZUdpdMWTppCeOzzfB05mmPlu7bCQN4GI7UZL+hC0hRM6MQGEhf+TKcJrS78DzAo37K+vz509xbPej1blbGhMgPonqUQBCWkmZibrSI/A253+cscuL+Om7T7b8rsBxc3+XsB5J0mq6sV3GU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726150764; c=relaxed/simple;
	bh=E30N8XAuG14BE7RthlFoo+RlpFDcmf+/oXmeiDrHzLU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dWP63v/0qAVwsh6JB/PBAAic2uVfdptOxYfas5gwaRITVP6YkYKBX7myvQcsyYaA7M0/Gp4DW3oqKLkZlL6aNCP6wCLaslvwfMe4w0jotl+4/eMq97ZRpWuHXwoeHW037bfsFVwWM1AlRzJnvOcLuh44g3P8wcoRalXW1xCaeuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=j6oyyT0r; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=j6oyyT0r; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 914331FB7C;
	Thu, 12 Sep 2024 14:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1726150758; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=8b5EVn85IGQz62CFF/P37B2Ccxts7Skxn2LA9b6buQE=;
	b=j6oyyT0r+IYvVpziPxktzsriGGanQPgkKwC7azuqL6AcBJvc5EH/5i9DEOfpzzowZWd0Mq
	PTdSkmIEoXpFLlYkN+mltcnkjs03SZwocnDk+gkcnSEXq4GDICze9DSLLmZZaxUHwVx064
	j3RADctOpbiH76LG9TKPlKkIKC3TyuM=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1726150758; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=8b5EVn85IGQz62CFF/P37B2Ccxts7Skxn2LA9b6buQE=;
	b=j6oyyT0r+IYvVpziPxktzsriGGanQPgkKwC7azuqL6AcBJvc5EH/5i9DEOfpzzowZWd0Mq
	PTdSkmIEoXpFLlYkN+mltcnkjs03SZwocnDk+gkcnSEXq4GDICze9DSLLmZZaxUHwVx064
	j3RADctOpbiH76LG9TKPlKkIKC3TyuM=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 747D313AD8;
	Thu, 12 Sep 2024 14:19:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id jXdLG2b44mbRAQAAD6G6ig
	(envelope-from <oneukum@suse.com>); Thu, 12 Sep 2024 14:19:18 +0000
From: Oliver Neukum <oneukum@suse.com>
To: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org
Cc: Oliver Neukum <oneukum@suse.com>
Subject: [PATCH] USB: class: CDC-ACM: fix race between get_serial and set_serial
Date: Thu, 12 Sep 2024 16:19:06 +0200
Message-ID: <20240912141916.1044393-1-oneukum@suse.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 

TIOCGSERIAL is an ioctl. Thus it must be atomic. It returns
two values. Racing with set_serial it can return an inconsistent
result. The mutex must be taken.

In terms of logic the bug is as old as the driver. In terms of
code it goes back to the conversion to the get_serial and
set_serial methods.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
Fixes: 99f75a1fcd865 ("cdc-acm: switch to ->[sg]et_serial()")
---
 drivers/usb/class/cdc-acm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/class/cdc-acm.c b/drivers/usb/class/cdc-acm.c
index 0c1b69d944ca..605fea461102 100644
--- a/drivers/usb/class/cdc-acm.c
+++ b/drivers/usb/class/cdc-acm.c
@@ -962,10 +962,12 @@ static int get_serial_info(struct tty_struct *tty, struct serial_struct *ss)
 	struct acm *acm = tty->driver_data;
 
 	ss->line = acm->minor;
+	mutex_lock(&acm->port.mutex);
 	ss->close_delay	= jiffies_to_msecs(acm->port.close_delay) / 10;
 	ss->closing_wait = acm->port.closing_wait == ASYNC_CLOSING_WAIT_NONE ?
 				ASYNC_CLOSING_WAIT_NONE :
 				jiffies_to_msecs(acm->port.closing_wait) / 10;
+	mutex_unlock(&acm->port.mutex);
 	return 0;
 }
 
-- 
2.45.2



Return-Path: <linux-usb+bounces-17893-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 212599DA31C
	for <lists+linux-usb@lfdr.de>; Wed, 27 Nov 2024 08:32:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6C795B21588
	for <lists+linux-usb@lfdr.de>; Wed, 27 Nov 2024 07:32:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C24314D71A;
	Wed, 27 Nov 2024 07:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="h5zfYkAS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5r7d+FaV";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="aYmwkjW0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zVqs0U02"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AEA0BE46
	for <linux-usb@vger.kernel.org>; Wed, 27 Nov 2024 07:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732692745; cv=none; b=bCORfHSyN9oi44qh2n4eL6O1r2/3waUwUWLQYofkx9Rv9Iw7gjFQYjj36GWdMllXs1Su4mgn3uCvVcVeERPCk+tN6e9OIsQkaKmkvF74zuYe96RgfpitRg67sD5Qm2numJvTB4hFsm390UU9+aWRvBHDqOxgV0SV8p3KkxFsE1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732692745; c=relaxed/simple;
	bh=6OsicBpMQicqWJEPHS89c5bIEAjaYfjfZ/2eCyMqjuo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ww6GuQXD6BY04zF+HsfAXprOo8QjE1Oq1j7+58LqgpnhuaJfLuxdKtOmICXVAnQqtmfmM3sZhfQ39daTEbvW3AFsc3DotvNZz4KMzV2L5o55hEGvhCILbvBzfJZpMpwyX4XetpQYkpvJgwWuo2g/lE3VO2l+Bix++xmGu4mdtTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=h5zfYkAS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=5r7d+FaV; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=aYmwkjW0; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=zVqs0U02; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 037C821170;
	Wed, 27 Nov 2024 07:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1732692742; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=v+wO94JPHcFDWvFu2m0oXKom0eddgsNX4k5sLvBVbcQ=;
	b=h5zfYkASb1ZEvT+6dBq73XI7fUtr5BfWAQynU19bQU1vG6rB40S/FNMSWcNIiE9Yv7ShbF
	Y4pO1vqXDETt25KATD3bDqFBDXmuWKZycZ/q9fyJ6ZTd5Uv1vZ+RrDfrpnYZyA9230iyIx
	t4CyaOPV7tM5yNr+DKypx3jNLyRdkeM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1732692742;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=v+wO94JPHcFDWvFu2m0oXKom0eddgsNX4k5sLvBVbcQ=;
	b=5r7d+FaVX6izYBi5PHTvuH7W0TkUNqkg/hgytVEfXmKEMOwwSLAoDkqkFcN/x0x8cLVEOK
	brl5PyL6CHdJtvAg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1732692741; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=v+wO94JPHcFDWvFu2m0oXKom0eddgsNX4k5sLvBVbcQ=;
	b=aYmwkjW07jVP+BrYjdoNs7/kSWRjRpvDwm3ts2xC1Px/SzzZBZKrYse15dlAMJA4GQVBU4
	H/bgPfsZMB3uL8GO1WKuSwMlN6XCuq0ySTLki+KxicKTBcWI28NzFecIFUJphBjEu/xV54
	3QXndWXuwLgi4jXAbmPLcDpPZifgtYQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1732692741;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=v+wO94JPHcFDWvFu2m0oXKom0eddgsNX4k5sLvBVbcQ=;
	b=zVqs0U02yEjzz5jQbtr2QZgoaa+mmqeZWjOKwnS06Yz22YMA2sXNrqJG/979dn3+1cr6GU
	ED993pw3BfgdJbDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8F82D139AA;
	Wed, 27 Nov 2024 07:32:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id MK4KEgPLRmeKGQAAD6G6ig
	(envelope-from <ddiss@suse.de>); Wed, 27 Nov 2024 07:32:19 +0000
From: David Disseldorp <ddiss@suse.de>
To: stern@rowland.harvard.edu
Cc: linux-usb@vger.kernel.org,
	David Disseldorp <ddiss@suse.de>
Subject: [PATCH] usb: collapse USB_STORAGE Kconfig comment
Date: Wed, 27 Nov 2024 18:26:45 +1100
Message-ID: <20241127072644.3591-2-ddiss@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
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
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -2.80
X-Spam-Flag: NO

The two Kconfig "comment" calls render in /proc/config.gz as split
sections:
---
 #
 # NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may
 #

 #
 # also be needed; see USB_STORAGE Help for more info
 #
---

"make menuconfig" renders the comments as:
---
 *** NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may ***
 *** also be needed; see USB_STORAGE Help for more info ***
---

Kconfig doesn't support splitting a comment cleanly over two lines, so
just collapse it into a single oversize comment.

Given the content of the comment, it might make more sense to change it
to a '#' Kconfig source file comment, or drop it altogether.

Signed-off-by: David Disseldorp <ddiss@suse.de>
---
 drivers/usb/storage/Kconfig | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/usb/storage/Kconfig b/drivers/usb/storage/Kconfig
index d17b60a644efb..4be1d617d63db 100644
--- a/drivers/usb/storage/Kconfig
+++ b/drivers/usb/storage/Kconfig
@@ -3,8 +3,7 @@
 # USB Storage driver configuration
 #
 
-comment "NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may"
-comment "also be needed; see USB_STORAGE Help for more info"
+comment "NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may also be needed; see USB_STORAGE Help for more info"
 
 config USB_STORAGE
 	tristate "USB Mass Storage support"
-- 
2.43.0



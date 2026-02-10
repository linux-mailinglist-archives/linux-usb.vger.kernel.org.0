Return-Path: <linux-usb+bounces-33252-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yKpVLQAji2lyQQAAu9opvQ
	(envelope-from <linux-usb+bounces-33252-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 10 Feb 2026 13:22:24 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E79711AB5B
	for <lists+linux-usb@lfdr.de>; Tue, 10 Feb 2026 13:22:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F4148303BA49
	for <lists+linux-usb@lfdr.de>; Tue, 10 Feb 2026 12:22:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98B7C322DB7;
	Tue, 10 Feb 2026 12:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="NBqmQtr0";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="NBqmQtr0"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5084328B45
	for <linux-usb@vger.kernel.org>; Tue, 10 Feb 2026 12:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770726139; cv=none; b=nG6Nf7KMgxhXD0WtMxhB7x2jXVhjeN6TkhN6P+KI3PLEl5Kw1DWGSzZqtGKV1fKnD3ZQRyyZyeaK8DWpUYPVLD7aICK3eXKG0wuwvM3AzPHCm3dppDNrTF7h1WbQJvxNcYMCpQ/4yTbiCcqTMfMZCX4EBoF/YFBNikzxj067IQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770726139; c=relaxed/simple;
	bh=Z5dgTTrdDN5YTnSCVX5Z9v8b1qP3UUZZUvZix+Jk7oc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=McT2j+0QLCg4jtLqymEFSejpvLJPPxS73YqY7W4yvWtPpV5a2aY4DDsmwyMXtyhIAlB0j+Af73lH+dE/oQfXXU7Pvr7Nkma3u7QkywNg3RkST048O6RYZWyptiGeLxMTTp9et/zteW0FwcPxoi4JYgvsC9isGxQUAPTTM81TQMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=NBqmQtr0; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=NBqmQtr0; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0C4935BD51;
	Tue, 10 Feb 2026 12:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1770726136; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=PtaGvaD7ExNneudKvjFjP+emE5B2H67yn3ee1XHTCI0=;
	b=NBqmQtr0p/nUk/I/1pekC676YMaBfZ9EpZ1V/F8iBmw8/RzpHjgypuizBe+bKTXLJYmlyT
	QOViyon17obaqpZukF4T5xSrmgdCX9jCTYuYheylPVR27U6KHJfYAQwyjPA21KCdlM5yCY
	mIXEz4ttY4pa1ON9D4FCx59kDStKnak=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1770726136; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=PtaGvaD7ExNneudKvjFjP+emE5B2H67yn3ee1XHTCI0=;
	b=NBqmQtr0p/nUk/I/1pekC676YMaBfZ9EpZ1V/F8iBmw8/RzpHjgypuizBe+bKTXLJYmlyT
	QOViyon17obaqpZukF4T5xSrmgdCX9jCTYuYheylPVR27U6KHJfYAQwyjPA21KCdlM5yCY
	mIXEz4ttY4pa1ON9D4FCx59kDStKnak=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CE6CE3EA62;
	Tue, 10 Feb 2026 12:22:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id HoM5Mfcii2nqBQAAD6G6ig
	(envelope-from <oneukum@suse.com>); Tue, 10 Feb 2026 12:22:15 +0000
From: Oliver Neukum <oneukum@suse.com>
To: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org
Cc: Oliver Neukum <oneukum@suse.com>
Subject: [PATCH] net: cdc-ncm: cleanup device descriptor
Date: Tue, 10 Feb 2026 13:22:08 +0100
Message-ID: <20260210122208.29244-1-oneukum@suse.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33252-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oneukum@suse.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCVD_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2E79711AB5B
X-Rspamd-Action: no action

Flags are boolean values, hence they should be typed
as bool, not as u8.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 include/linux/usb/cdc_ncm.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/usb/cdc_ncm.h b/include/linux/usb/cdc_ncm.h
index 4ac082a63173..97ef37a1ff4a 100644
--- a/include/linux/usb/cdc_ncm.h
+++ b/include/linux/usb/cdc_ncm.h
@@ -118,8 +118,8 @@ struct cdc_ncm_ctx {
 
 	u32 timer_interval;
 	u32 max_ndp_size;
-	u8 is_ndp16;
-	u8 filtering_supported;
+	bool is_ndp16;
+	bool filtering_supported;
 	union {
 		struct usb_cdc_ncm_ndp16 *delayed_ndp16;
 		struct usb_cdc_ncm_ndp32 *delayed_ndp32;
-- 
2.53.0



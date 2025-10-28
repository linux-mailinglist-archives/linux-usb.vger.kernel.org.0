Return-Path: <linux-usb+bounces-29772-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B3194C14A62
	for <lists+linux-usb@lfdr.de>; Tue, 28 Oct 2025 13:36:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 98A961A2211D
	for <lists+linux-usb@lfdr.de>; Tue, 28 Oct 2025 12:33:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 148BE3090E1;
	Tue, 28 Oct 2025 12:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="qX1mK6mS";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="qX1mK6mS"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E699306B0C
	for <linux-usb@vger.kernel.org>; Tue, 28 Oct 2025 12:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761654780; cv=none; b=t/nwyh6K/zw6GSFTf0SFC3YgK990j3gBun9IxHLuMzQnlpmyG0QTvmCoCH/YO7E+mUPIEGYmNf1BY/5RXUDwcUbTGXsL41z0/zVZgjmYtkF71GGCpvdOuaGqNAWgOnO6bFVlGSojJTpOhUHoj+icEtIivmvB/7tkJLD4Cu2Fcpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761654780; c=relaxed/simple;
	bh=AwCeq0uanUmFrb0A+gPhjaPh0HViIFE1FCnJaspPOrI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U8VDfbkHhtJE7AImgIiPyy0Zl8+1k7MNJp2nol4NrUdc3q+FO/W0ZYsyfweGuC6+inwmBJElMUZcqUm0EWWGAlyWptGvd6uNGcYur6c9IPxFoFV7D/7wHovss407Dnf8glPGhFHi8y1ubH0i1D4qUsLUtg3gZ+PEkHXGwB8MkGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=qX1mK6mS; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=qX1mK6mS; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 846891F45F;
	Tue, 28 Oct 2025 12:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1761654776; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=UZ0nlo1p/+GOMJm7L5mCLVOZ98o+5iIegTd6ikleGvk=;
	b=qX1mK6mSNh4vL58M9Y+ndspLEPkGVwZjGXb4SBIUGDXoCpSQ2MYKBjvsXVYaIhxziUF0Ud
	3cNrbQHs7r1FPTiRx70emtuLg4s+Jpc+YuCJsshHgjJPjfJamqao5PjBXJBUmn5FLrJibg
	35tZgSv6uq/IbHKQkmZvPWaytwr+p9Q=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=qX1mK6mS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1761654776; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=UZ0nlo1p/+GOMJm7L5mCLVOZ98o+5iIegTd6ikleGvk=;
	b=qX1mK6mSNh4vL58M9Y+ndspLEPkGVwZjGXb4SBIUGDXoCpSQ2MYKBjvsXVYaIhxziUF0Ud
	3cNrbQHs7r1FPTiRx70emtuLg4s+Jpc+YuCJsshHgjJPjfJamqao5PjBXJBUmn5FLrJibg
	35tZgSv6uq/IbHKQkmZvPWaytwr+p9Q=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 74AD913693;
	Tue, 28 Oct 2025 12:32:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id bfgGHPi3AGm+LAAAD6G6ig
	(envelope-from <oneukum@suse.com>); Tue, 28 Oct 2025 12:32:56 +0000
From: Oliver Neukum <oneukum@suse.com>
To: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org
Cc: Oliver Neukum <oneukum@suse.com>
Subject: [PATCH 1/1] uapi: cdc.h: cleanly provide for more interfaces and countries
Date: Tue, 28 Oct 2025 13:32:22 +0100
Message-ID: <20251028123254.1888303-1-oneukum@suse.com>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 846891F45F
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,suse.com:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	DKIM_TRACE(0.00)[suse.com:+]
X-Spam-Score: -3.01

The spec requires at least one interface respectively country.
It allows multiple ones. This needs to be clearly said in the UAPI.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 include/uapi/linux/usb/cdc.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/uapi/linux/usb/cdc.h b/include/uapi/linux/usb/cdc.h
index 1924cf665448..5fcbce0be133 100644
--- a/include/uapi/linux/usb/cdc.h
+++ b/include/uapi/linux/usb/cdc.h
@@ -105,7 +105,7 @@ struct usb_cdc_union_desc {
 
 	__u8	bMasterInterface0;
 	__u8	bSlaveInterface0;
-	/* ... and there could be other slave interfaces */
+	__u8	bSlaveInterfaces[];
 } __attribute__ ((packed));
 
 /* "Country Selection Functional Descriptor" from CDC spec 5.2.3.9 */
@@ -116,7 +116,7 @@ struct usb_cdc_country_functional_desc {
 
 	__u8	iCountryCodeRelDate;
 	__le16	wCountyCode0;
-	/* ... and there can be a lot of country codes */
+	__le16	wCountyCodes[];
 } __attribute__ ((packed));
 
 /* "Network Channel Terminal Functional Descriptor" from CDC spec 5.2.3.11 */
-- 
2.51.1



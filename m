Return-Path: <linux-usb+bounces-30423-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93DD2C4E204
	for <lists+linux-usb@lfdr.de>; Tue, 11 Nov 2025 14:34:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5025A3AB3C8
	for <lists+linux-usb@lfdr.de>; Tue, 11 Nov 2025 13:32:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1092133123A;
	Tue, 11 Nov 2025 13:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="XNacFKeR";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="IhEEeklY"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F61B32BF20
	for <linux-usb@vger.kernel.org>; Tue, 11 Nov 2025 13:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762867957; cv=none; b=fPBmLTQEJ5gBMALy4YwpFCTKz1jh3qUCOM6l2gFtRz9AwtrB/WzcDA/PX19dp92nB/rn97EcPrQBE1BEL59UJLbsrgATlKPxDqrw4rmwWBIqk2IaqgCoxcHC7FQimOdZoN2Bomv8rrdSonSLEi+RwypDSdGjMgWEbosSYWD6B4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762867957; c=relaxed/simple;
	bh=6nZfsjMq4UXQkkd7CmYVYYuJGxZMjP2q/YDswt80+zQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ks/nuzsBy0CIU3/do+7BlNL1bNteovwhZ9oKvByRjYgyK/nNoibLyqIiA2qLZCawUP48Bcu8GcxjI02xWn7SLAx3Ii9kq/pQpepmgfUr269D6Aqz2BtK40u8pZgudJP9p4ob9BiBmUtt+1kDr9c8in11IrgUuuIml6A6RTruME4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=XNacFKeR; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=IhEEeklY; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 781191F796;
	Tue, 11 Nov 2025 13:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1762867953; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=lFfvZKW2IbdG4KizAn5wHECBNNfmubDJ+7IQ7r/H7Po=;
	b=XNacFKeR4pUYK9drztY2Zg72MiEQLk5BN905wBySM1J+Xwm720XiZE7Fwa3ekTTucZFX9z
	wy0Xy0keBxINEI6tUDvDnkB/oQboCOYZ73qiOyqRWEIALm4ibEPrCaO4aty/FNMwmiWrCx
	SDAfPcbuEeOXP7vbZQctebY+anZuY6Y=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=IhEEeklY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1762867951; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=lFfvZKW2IbdG4KizAn5wHECBNNfmubDJ+7IQ7r/H7Po=;
	b=IhEEeklYLlEer+1GEOpuUaLPOH00qNJVvnYyqG05YV0jnD7s1TzNp7iNTn7gLNSABGU+DM
	XhVtAE+WQrc+u6lh3/2B1hpQddEGzaQ5wGlQdhv8OQlGlxX8wnr9uQN+Jt8bo39KyXq21u
	H8wPIqruQk421Dbg2hR9mP/b1WSN3ho=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 352951499F;
	Tue, 11 Nov 2025 13:32:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id FhrZCu86E2kTZAAAD6G6ig
	(envelope-from <oneukum@suse.com>); Tue, 11 Nov 2025 13:32:31 +0000
From: Oliver Neukum <oneukum@suse.com>
To: gregkh@linuxfoundation.org,
	gustavo@embeddedor.com,
	linux-usb@vger.kernel.org
Cc: Oliver Neukum <oneukum@suse.com>
Subject: [PATCHv3 1/1] uapi: cdc.h: cleanly provide for more interfaces and countries
Date: Tue, 11 Nov 2025 14:31:36 +0100
Message-ID: <20251111133228.4114536-1-oneukum@suse.com>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 781191F796
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
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.com:email,suse.com:mid,suse.com:dkim]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 

The spec requires at least one interface respectively country.
It allows multiple ones. This needs to be clearly said in the UAPI.
This is subject to sanity checking in cdc_parse_cdc_header(), thus
we can trust the length.

V2: following Gustavo's suggestion to use an union
V3: following Gustavo's suggestion on safe copying
Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/usb/class/cdc-acm.c  |  2 +-
 include/uapi/linux/usb/cdc.h | 12 ++++++++----
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/class/cdc-acm.c b/drivers/usb/class/cdc-acm.c
index 73f9476774ae..54be4aa1dcb2 100644
--- a/drivers/usb/class/cdc-acm.c
+++ b/drivers/usb/class/cdc-acm.c
@@ -1475,7 +1475,7 @@ static int acm_probe(struct usb_interface *intf,
 		if (!acm->country_codes)
 			goto skip_countries;
 		acm->country_code_size = cfd->bLength - 4;
-		memcpy(acm->country_codes, (u8 *)&cfd->wCountyCode0,
+		memcpy(acm->country_codes, cfd->wCountryCodes,
 							cfd->bLength - 4);
 		acm->country_rel_date = cfd->iCountryCodeRelDate;
 
diff --git a/include/uapi/linux/usb/cdc.h b/include/uapi/linux/usb/cdc.h
index 1924cf665448..0208b2f76bf1 100644
--- a/include/uapi/linux/usb/cdc.h
+++ b/include/uapi/linux/usb/cdc.h
@@ -104,8 +104,10 @@ struct usb_cdc_union_desc {
 	__u8	bDescriptorSubType;
 
 	__u8	bMasterInterface0;
-	__u8	bSlaveInterface0;
-	/* ... and there could be other slave interfaces */
+	union {
+		__u8	bSlaveInterface0;
+		DECLARE_FLEX_ARRAY(__u8, bSlaveInterfaces);
+	};
 } __attribute__ ((packed));
 
 /* "Country Selection Functional Descriptor" from CDC spec 5.2.3.9 */
@@ -115,8 +117,10 @@ struct usb_cdc_country_functional_desc {
 	__u8	bDescriptorSubType;
 
 	__u8	iCountryCodeRelDate;
-	__le16	wCountyCode0;
-	/* ... and there can be a lot of country codes */
+	union {
+		__le16	wCountryCode0;
+		DECLARE_FLEX_ARRAY(__le16, wCountryCodes);
+	};
 } __attribute__ ((packed));
 
 /* "Network Channel Terminal Functional Descriptor" from CDC spec 5.2.3.11 */
-- 
2.51.1



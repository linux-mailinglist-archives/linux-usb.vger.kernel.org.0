Return-Path: <linux-usb+bounces-30425-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6E3C4E39A
	for <lists+linux-usb@lfdr.de>; Tue, 11 Nov 2025 14:46:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B257C34B1C6
	for <lists+linux-usb@lfdr.de>; Tue, 11 Nov 2025 13:46:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F8E71EB5CE;
	Tue, 11 Nov 2025 13:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="fT62qpnd";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="fT62qpnd"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C68CC17B50A
	for <linux-usb@vger.kernel.org>; Tue, 11 Nov 2025 13:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762868807; cv=none; b=bzv07j2E/x0F7jU3V77PEJV5028ka1UmGU8cW2qIDOj+JH5Cu0yKw1/ykeqAyuU1pcgQnseDA4hcnp4jOSoZHuLr+cYjWs3zzPeAK4VIzA1ogc3ErFHalgn8gixCFpnMjXy/QqmAg6oWAC1rSb+B66zoU/luzFQkYZseMjvfslM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762868807; c=relaxed/simple;
	bh=ZkCLykW6NtW7beqh15uItRw4P9VkrTNaZzL7IYNeS64=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DIxQN8MNr1vS0q0IHdsN3xBtwpVgk9dSXyTb34TI+KEehnDUmWORQIqoaR7LUrQJCTViAR8HbfOOzbaDomMXkgTI8Ed+oSERenspnb44uYUfSy96otLQT/WS/spGhSrjO+EkioEJeu1z3PIOPd/AQgoABJwqWO1NCew6kL0SBb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=fT62qpnd; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=fT62qpnd; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E29A31F7E9;
	Tue, 11 Nov 2025 13:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1762868803; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=9JCoetx+5XKdJupUW7sjWUgfhNkLwiBMdMYRdqO9nXs=;
	b=fT62qpnd3L5Lposm7M0PmQDeQh/CLMxJh2Qb4/0/2qZUf9FYdlczk9jAAMAIPwSRnWk2nZ
	HedfOmD/4/Co+u6Su1EpEiOBGacPpl1lcOzPCvgxusOHKn7GuFTA/dh4E0LCJvGHYagEa7
	SeEb5vrp1VQf0xnsAClbY3hQbiV3Hp8=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1762868803; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=9JCoetx+5XKdJupUW7sjWUgfhNkLwiBMdMYRdqO9nXs=;
	b=fT62qpnd3L5Lposm7M0PmQDeQh/CLMxJh2Qb4/0/2qZUf9FYdlczk9jAAMAIPwSRnWk2nZ
	HedfOmD/4/Co+u6Su1EpEiOBGacPpl1lcOzPCvgxusOHKn7GuFTA/dh4E0LCJvGHYagEa7
	SeEb5vrp1VQf0xnsAClbY3hQbiV3Hp8=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 95000149AE;
	Tue, 11 Nov 2025 13:46:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id VA0jIkM+E2nscgAAD6G6ig
	(envelope-from <oneukum@suse.com>); Tue, 11 Nov 2025 13:46:43 +0000
From: Oliver Neukum <oneukum@suse.com>
To: gregkh@linuxfoundation.org,
	gustavo@embeddedor.com,
	linux-usb@vger.kernel.org
Cc: Oliver Neukum <oneukum@suse.com>
Subject: [PATCHv4 1/1] uapi: cdc.h: cleanly provide for more interfaces and countries
Date: Tue, 11 Nov 2025 14:46:10 +0100
Message-ID: <20251111134641.4118827-1-oneukum@suse.com>
X-Mailer: git-send-email 2.51.1
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
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.com:email,suse.com:mid];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80

The spec requires at least one interface respectively country.
It allows multiple ones. This needs to be clearly said in the UAPI.
This is subject to sanity checking in cdc_parse_cdc_header(), thus
we can trust the length.

V2: following Gustavo's suggestion to use an union
V3: following Gustavo's suggestion on safe copying 
V4: use __DEFINE_FLEX_ARRAY
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
index 1924cf665448..7bd5d12d8b26 100644
--- a/include/uapi/linux/usb/cdc.h
+++ b/include/uapi/linux/usb/cdc.h
@@ -104,8 +104,10 @@ struct usb_cdc_union_desc {
 	__u8	bDescriptorSubType;
 
 	__u8	bMasterInterface0;
-	__u8	bSlaveInterface0;
-	/* ... and there could be other slave interfaces */
+	union {
+		__u8	bSlaveInterface0;
+		__DECLARE_FLEX_ARRAY(__u8, bSlaveInterfaces);
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
+		__DECLARE_FLEX_ARRAY(__le16, wCountryCodes);
+	};
 } __attribute__ ((packed));
 
 /* "Network Channel Terminal Functional Descriptor" from CDC spec 5.2.3.11 */
-- 
2.51.1



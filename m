Return-Path: <linux-usb+bounces-34062-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6PZDNwtbqWkL6AAAu9opvQ
	(envelope-from <linux-usb+bounces-34062-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 11:29:31 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E224420FB63
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 11:29:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5B2C0300C56F
	for <lists+linux-usb@lfdr.de>; Thu,  5 Mar 2026 10:29:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAADB37E2F5;
	Thu,  5 Mar 2026 10:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="rXbfDyaF";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="rXbfDyaF"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4931E34D91C
	for <linux-usb@vger.kernel.org>; Thu,  5 Mar 2026 10:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772706562; cv=none; b=nycG9ahZXX8cbdY8hoaf0gSIljUmO7lmcITBtLpAZ73bFyi51myL5uASJ+pTuDm/XXWmlzdGlC9TRmVD5yJF66TLC9/d3WpwIWWq9n0UMX3t4A66Q3vac5W+kHH26guUT7w51yhP7Rc0eSiVSvActc4P3jh0XfgLuFp3RBDVPEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772706562; c=relaxed/simple;
	bh=w/YhZJ7LQdEcttgzVj9SBchdznwvn3+Vm4xjfNwhqFE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m/30I6KSepyTuXmFF4AHYpbu/Pa1MfCnqgXys2ni9jZs+fbYxmcM16cBTbgZiVL5SQSEewxL3EO2pluK8/M+rZQx6IITXkIXbEx03fbf9vorBFTddwB3m2BD0HrQ7/W91FSBxLd51X1pA5+dhaqx/v1m12WSLc3eZbWx8ohfh5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=rXbfDyaF; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=rXbfDyaF; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id CFAD25BD18;
	Thu,  5 Mar 2026 10:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1772706553; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Mlk/bMYx+koUq5SCQnFWKYuV4O3bBBfQVGTyjRbTyjY=;
	b=rXbfDyaFslJIotfbY2OglxavChkRNAo49vAjSODZTuFxV4xhbFcZ8Y8p/g3jbnQ/TmFywA
	PgYR4g/xL6LOY+gMU+5exDiMNZXa0poZvxb00e1XWWhs/67BD4t/TMNZvnV2kdgSuU1nyj
	Kmt3M48bDN8hU0bUDD6l8Cta2gPXNQs=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=rXbfDyaF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1772706553; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Mlk/bMYx+koUq5SCQnFWKYuV4O3bBBfQVGTyjRbTyjY=;
	b=rXbfDyaFslJIotfbY2OglxavChkRNAo49vAjSODZTuFxV4xhbFcZ8Y8p/g3jbnQ/TmFywA
	PgYR4g/xL6LOY+gMU+5exDiMNZXa0poZvxb00e1XWWhs/67BD4t/TMNZvnV2kdgSuU1nyj
	Kmt3M48bDN8hU0bUDD6l8Cta2gPXNQs=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A77A63EA68;
	Thu,  5 Mar 2026 10:29:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qNa4J/laqWkubwAAD6G6ig
	(envelope-from <oneukum@suse.com>); Thu, 05 Mar 2026 10:29:13 +0000
From: Oliver Neukum <oneukum@suse.com>
To: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org
Cc: Oliver Neukum <oneukum@suse.com>
Subject: [PATCH 4/5] usb: image: microtek: remove unused macro
Date: Thu,  5 Mar 2026 11:28:34 +0100
Message-ID: <20260305102905.2392512-4-oneukum@suse.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260305102905.2392512-1-oneukum@suse.com>
References: <20260305102905.2392512-1-oneukum@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 
X-Rspamd-Queue-Id: E224420FB63
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34062-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[oneukum@suse.com,linux-usb@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[suse.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,suse.com:dkim,suse.com:email,suse.com:mid]
X-Rspamd-Action: no action

No users left. Remove it.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/usb/image/microtek.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/usb/image/microtek.c b/drivers/usb/image/microtek.c
index 4de1de31681a..cd68aa27639e 100644
--- a/drivers/usb/image/microtek.c
+++ b/drivers/usb/image/microtek.c
@@ -175,8 +175,6 @@ static struct usb_driver mts_usb_driver = {
 	printk( KERN_ERR MTS_NAME x )
 #define MTS_INT_ERROR(x...) \
 	MTS_ERROR(x)
-#define MTS_MESSAGE(x...) \
-	printk( KERN_INFO MTS_NAME x )
 
 #if defined MTS_DO_DEBUG
 
-- 
2.53.0



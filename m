Return-Path: <linux-usb+bounces-34063-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mOm7F/NbqWkL6AAAu9opvQ
	(envelope-from <linux-usb+bounces-34063-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 11:33:23 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A5520FBDD
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 11:33:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6FF55306B4C0
	for <lists+linux-usb@lfdr.de>; Thu,  5 Mar 2026 10:29:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBC5A37F741;
	Thu,  5 Mar 2026 10:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="RqGCGDAi";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="RqGCGDAi"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 596F737F00F
	for <linux-usb@vger.kernel.org>; Thu,  5 Mar 2026 10:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772706562; cv=none; b=hlH6/z5rC0H05B1K+3VIiC/lLND1ReQrYjCMuMVTo53pfwq8zQHZ/HxT+X0JSbWlqVzXsp5aVVg5Lgfg8aZAYP1XVSKFt8o4hmmzygCYfiGwDbSkGOsGGRX8IxSsD9fAaxA7lOLKes6a6RyKjsU9L8v1QiG48/VBsSxysAnP1cQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772706562; c=relaxed/simple;
	bh=DRoIFJx8+wyox+DiksafH7DXZgxdMBcujM7/1dqSrZA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aaI421+rlAp8OOxPR3KgNVGEF5fxnFY0PQkjk+PTBi7chj8Tz72X9du/uRHz9AADBreb1X8dph5XqRAORLXEjlcVb8jqncwo4xX/lnGIe0ejvaPOGAR3Tac42oFPyFu6OgxSOto1ZtJp8/JrPjMLyBCmXYBrDoYf1WTZS2nKwCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=RqGCGDAi; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=RqGCGDAi; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A24F73F839;
	Thu,  5 Mar 2026 10:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1772706553; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TyIg2bz9bJqppQoXfWnZCQHQ/XZctE3DCiMUIGl2h7s=;
	b=RqGCGDAioMNKA3h385Mznq2rM6fv86Oy5JC5Mne8E3P+2OOIxIia5+dxres+/h9bqKbJrZ
	C5b7Ttrn/ORD5OHeF820mTzvGLQHNubFdww8u2byYbGg4FS/2b2stoA/BP74zEJh6pDnDw
	mO7FhzJQLuo6tSq3exWpk8PeZmUVNK4=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1772706553; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TyIg2bz9bJqppQoXfWnZCQHQ/XZctE3DCiMUIGl2h7s=;
	b=RqGCGDAioMNKA3h385Mznq2rM6fv86Oy5JC5Mne8E3P+2OOIxIia5+dxres+/h9bqKbJrZ
	C5b7Ttrn/ORD5OHeF820mTzvGLQHNubFdww8u2byYbGg4FS/2b2stoA/BP74zEJh6pDnDw
	mO7FhzJQLuo6tSq3exWpk8PeZmUVNK4=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7A4D43EA77;
	Thu,  5 Mar 2026 10:29:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 2LSrHPlaqWkubwAAD6G6ig
	(envelope-from <oneukum@suse.com>); Thu, 05 Mar 2026 10:29:13 +0000
From: Oliver Neukum <oneukum@suse.com>
To: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org
Cc: Oliver Neukum <oneukum@suse.com>
Subject: [PATCH 3/5] usb: image: microtek: remove outdated comment
Date: Thu,  5 Mar 2026 11:28:33 +0100
Message-ID: <20260305102905.2392512-3-oneukum@suse.com>
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
X-Spam-Score: -2.80
X-Spam-Level: 
X-Rspamd-Queue-Id: 06A5520FBDD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34063-lists,linux-usb=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

The comment is no longer true

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/usb/image/microtek.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/usb/image/microtek.c b/drivers/usb/image/microtek.c
index 5a5999c7e2cb..4de1de31681a 100644
--- a/drivers/usb/image/microtek.c
+++ b/drivers/usb/image/microtek.c
@@ -55,7 +55,6 @@
  * Status:
  *
  *	Untested with multiple scanners.
- *	Untested on SMP.
  *	Untested on a bigendian machine.
  *
  * History:
-- 
2.53.0



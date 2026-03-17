Return-Path: <linux-usb+bounces-34919-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6K5cIPEguWkrrwEAu9opvQ
	(envelope-from <linux-usb+bounces-34919-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 10:37:53 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A2A2A6F40
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 10:37:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D61F63057736
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 09:25:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 387303A3E78;
	Tue, 17 Mar 2026 09:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="V5MfGzxb";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="V5MfGzxb"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC2A38E5F5
	for <linux-usb@vger.kernel.org>; Tue, 17 Mar 2026 09:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773739375; cv=none; b=f3ZN6wK6jxg6puBr9BO6gJkZVB9JXO1MR7YI8x3xgF66hQPZSXVLwWCUCcxYcZLP3SwIdUG1wlo8h14C6bqhy6Y9xIrb4GTfj7Mn16youpV++7a/6sjBVRlzoLfCUT5dz3IxIHf0/EJjW9zI36/L79Pb6cgLbCFO7IMkTks7ji8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773739375; c=relaxed/simple;
	bh=Q2dQhE0zqgHlfv7SAJ9HzFWd5OC4R9QIpDH6TGwCEO0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g30hA8Z4zGBtAjLYCn1n7WTyg+0x0AaZ2Rq1acHGXMD4Soa9MgKkIUSon/nxMugEYm/KzBUBz4vIPK7hQpHSFSWsNC9plSdtm8qT7IA8afqtpe3fG/cXH3yWr2WTqNvcwXr5D6h4HfcZHgPd3kCLk6z0O/1CezfVwcf0gc1xcjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=V5MfGzxb; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=V5MfGzxb; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7698C4D2CD;
	Tue, 17 Mar 2026 09:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1773739367; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fY3VK2U2u8+auPr0b+GpgMCflHW1U9x+xc2SqaZ918w=;
	b=V5MfGzxb15hyTpJs8cPsxRwr81/5GR1je3/u07cKjOtmCP9DvcSheOfOfctv0L2tdLxUK9
	5NjEqO9GjdozR6LZMrgYS5BkMQ3xZGQ+Nby+niySoQpTwyySeBkACVK4e7Fff4TXWHNYnJ
	/P7Rh6p1qNVrX9dYO77XhnUEby+HHQI=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1773739367; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fY3VK2U2u8+auPr0b+GpgMCflHW1U9x+xc2SqaZ918w=;
	b=V5MfGzxb15hyTpJs8cPsxRwr81/5GR1je3/u07cKjOtmCP9DvcSheOfOfctv0L2tdLxUK9
	5NjEqO9GjdozR6LZMrgYS5BkMQ3xZGQ+Nby+niySoQpTwyySeBkACVK4e7Fff4TXWHNYnJ
	/P7Rh6p1qNVrX9dYO77XhnUEby+HHQI=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 30B7F4273C;
	Tue, 17 Mar 2026 09:22:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ePuCCWcduWneIgAAD6G6ig
	(envelope-from <oneukum@suse.com>); Tue, 17 Mar 2026 09:22:47 +0000
From: Oliver Neukum <oneukum@suse.com>
To: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org
Cc: Oliver Neukum <oneukum@suse.com>
Subject: [PATCH 2/2] USB: uapi: add BULK_MAX_PACKET_UPDATE
Date: Tue, 17 Mar 2026 10:22:29 +0100
Message-ID: <20260317092244.1464921-2-oneukum@suse.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260317092244.1464921-1-oneukum@suse.com>
References: <20260317092244.1464921-1-oneukum@suse.com>
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
	TAGGED_FROM(0.00)[bounces-34919-lists,linux-usb=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,suse.com:dkim,suse.com:email,suse.com:mid]
X-Rspamd-Queue-Id: 69A2A2A6F40
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The spec for Embedded USB2 Version 2.0 adds a new feature
request. This needs to be added to uapi for monitoring.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 include/uapi/linux/usb/ch9.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/uapi/linux/usb/ch9.h b/include/uapi/linux/usb/ch9.h
index 6f02dc39430a..bf1bae138844 100644
--- a/include/uapi/linux/usb/ch9.h
+++ b/include/uapi/linux/usb/ch9.h
@@ -133,6 +133,8 @@
 #define USB_DEVICE_A_ALT_HNP_SUPPORT	5	/* (otg) other RH port does */
 #define USB_DEVICE_DEBUG_MODE		6	/* (special devices only) */
 
+#define BULK_MAX_PACKET_UPDATE		8	/* (eUSB2v2) bump maxpacket to 1024 */
+
 /*
  * Test Mode Selectors
  * See USB 2.0 spec Table 9-7
-- 
2.53.0



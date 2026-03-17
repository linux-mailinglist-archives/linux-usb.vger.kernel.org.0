Return-Path: <linux-usb+bounces-34918-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gPFcBJwfuWmergEAu9opvQ
	(envelope-from <linux-usb+bounces-34918-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 10:32:12 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9C62A6CC2
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 10:32:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 35BE43083501
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 09:24:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B48D03A380D;
	Tue, 17 Mar 2026 09:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="Ni7g2FKJ";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="Ni7g2FKJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05BAF36EA93
	for <linux-usb@vger.kernel.org>; Tue, 17 Mar 2026 09:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773739370; cv=none; b=lWX+RIdFwX3YtMNa0J5axyiT6E+YtCYMkPXhq+hftZulx7t67Lcmsj3ZUf5d3Q/5u0jeOH4GGk+m1IKiMxEDtsIZaW+2c/VjIfLR2HKRHnh/X6235/eXt+OiwuNu5PVvoB7Brr9ppIphGerIj51eY5CKEG76kHObLIV5OdpTJHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773739370; c=relaxed/simple;
	bh=1goMlPhM0clsORA2Zy7VGzE2RN9USmeYjeO6pQYjAPY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I+rCpDnS6kK+LkhCgrjtxy/TSpQ9SOhfS4XMkysvMZ1yuPevDOjUWGQprKamNKEY2ReTaGaYve70YnJ9pfh5hMibKn23LnMZXtIUKpXpzC0qLWhmvwytvBiATSnRtmf6wgDrLgbHY8uITanjYU58ECqiddi2+2qhETvtfdJTbaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=Ni7g2FKJ; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=Ni7g2FKJ; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 26C534D2FB;
	Tue, 17 Mar 2026 09:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1773739367; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=n1FonZRItXiqFcU3eKVB2x3Au/aoZ2gK3v2qEvSmB1Q=;
	b=Ni7g2FKJNqMokyJ+43yP3bRBupREr8hyRQUAVqEdMEUHdwR6xK9UuO3SVMNLgojb/W01gv
	BkhPRLS7vovVjNXmTto4vrBNcOsZqAqOrdpM5XyA6E/KcmC9YrZbi0rMq287n0ycHU8nbb
	iT0dP0iKonPSDwZ04seL5GuXQNWasWQ=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=Ni7g2FKJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1773739367; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=n1FonZRItXiqFcU3eKVB2x3Au/aoZ2gK3v2qEvSmB1Q=;
	b=Ni7g2FKJNqMokyJ+43yP3bRBupREr8hyRQUAVqEdMEUHdwR6xK9UuO3SVMNLgojb/W01gv
	BkhPRLS7vovVjNXmTto4vrBNcOsZqAqOrdpM5XyA6E/KcmC9YrZbi0rMq287n0ycHU8nbb
	iT0dP0iKonPSDwZ04seL5GuXQNWasWQ=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D0F534273B;
	Tue, 17 Mar 2026 09:22:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id TaVIMGYduWneIgAAD6G6ig
	(envelope-from <oneukum@suse.com>); Tue, 17 Mar 2026 09:22:46 +0000
From: Oliver Neukum <oneukum@suse.com>
To: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org
Cc: Oliver Neukum <oneukum@suse.com>
Subject: [PATCH 1/2] usb: uapi: add usb 3.0 authentication declarations
Date: Tue, 17 Mar 2026 10:22:28 +0100
Message-ID: <20260317092244.1464921-1-oneukum@suse.com>
X-Mailer: git-send-email 2.53.0
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
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34918-lists,linux-usb=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9E9C62A6CC2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This adds the USB authentication extensions to the
uapi chapter 9 declarations, so that user space tools
correctly operate on the descriptor and commands.
This is necessary for sniffing and debugging in gadget
mode to correctly work, even though the kernel
does not use these requests in host mode.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 include/uapi/linux/usb/ch9.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/include/uapi/linux/usb/ch9.h b/include/uapi/linux/usb/ch9.h
index 8003243a4937..6f02dc39430a 100644
--- a/include/uapi/linux/usb/ch9.h
+++ b/include/uapi/linux/usb/ch9.h
@@ -102,6 +102,8 @@
 #define USB_REQ_LOOPBACK_DATA_WRITE	0x15
 #define USB_REQ_LOOPBACK_DATA_READ	0x16
 #define USB_REQ_SET_INTERFACE_DS	0x17
+#define USB_REQ_AUTH_IN			0x18
+#define REQ_REQ_AUTH_OUT		0x19
 
 /* specific requests for USB Power Delivery */
 #define USB_REQ_GET_PARTNER_PDO		20
@@ -1147,6 +1149,17 @@ struct usb_ptm_cap_descriptor {
 
 /*-------------------------------------------------------------------------*/
 
+struct usb_authentication_capability_descriptor {
+	__u8  bLength;
+	__u8  bDescriptorType; /* set to USB_DT_DEVICE_CAPABILITY */
+	__u8  bmAttributes;
+
+	__u8  bcdProtocolVersion;
+	__u8  bcdCapability;
+} __attribute__((packed));
+
+/*-------------------------------------------------------------------------*/
+
 /* USB_DT_WIRELESS_ENDPOINT_COMP:  companion descriptor associated with
  * each endpoint descriptor for a wireless device
  */
-- 
2.53.0



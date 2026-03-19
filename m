Return-Path: <linux-usb+bounces-35159-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yJJrKhUNvGkArgIAu9opvQ
	(envelope-from <linux-usb+bounces-35159-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 15:49:57 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 167DF2CD277
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 15:49:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C9C4B31EDA81
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 14:47:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4BBD3D6488;
	Thu, 19 Mar 2026 14:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="KUNlb2iT";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="KUNlb2iT"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE4B93CE4B6
	for <linux-usb@vger.kernel.org>; Thu, 19 Mar 2026 14:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773931647; cv=none; b=F7TgdZ9NuOHGKpd1qm9fTjiMIl/w9H3GxAIWgaw8kzXiJomOjSbZJ+yQTsih+FBW7u/ootH86V/EF9hPH7jX8NC/hn21zqgtKteQhT/6Np6E/7FnX0t5BkTb8jVOJ3QuNzgEwPQOSnpOW5AD5Pile4FAH/CrYWWRg8G2DGnwDWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773931647; c=relaxed/simple;
	bh=Qel9pBsx/FYFPsT0Fg/3wJOcSDxRh0hJmTl2EHNub4E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CTYBdzYw2W5np4SPnccZXtdnSc5mgciRj8jlFrXn7Aj9bzyUMJAGy9soC8N4pbJJgWCoKDDhYgybfPoDJ82qJsncH1EU2kPGhniZahRH6pUGCSzRGBxZGL0hLw5VjF6IW4InGAH2xgdONUe+TRbM6HQWR7L5y5exLHz8SQMQTl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=KUNlb2iT; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=KUNlb2iT; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D0EC15BD4B;
	Thu, 19 Mar 2026 14:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1773931642; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=DzKJOWKD9YG3MXL7o2kCEBqFBAKdXPMbSFGMSqSrW44=;
	b=KUNlb2iTexrWqJZo2Wy7GglWEhdzPZJhYxlFpHI9GKe5UiuZAAW29TKvbleP9A+SZDMm70
	EQT0HCPSQMe/0d1t+T1A9IAyRIzOmuJ9MnvJaK9v1KKmn+590pgrvB1Jd+vAYceTuWuyps
	vdeYGlUZ584AuoEjcpf29r+2hkZBNdg=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1773931642; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=DzKJOWKD9YG3MXL7o2kCEBqFBAKdXPMbSFGMSqSrW44=;
	b=KUNlb2iTexrWqJZo2Wy7GglWEhdzPZJhYxlFpHI9GKe5UiuZAAW29TKvbleP9A+SZDMm70
	EQT0HCPSQMe/0d1t+T1A9IAyRIzOmuJ9MnvJaK9v1KKmn+590pgrvB1Jd+vAYceTuWuyps
	vdeYGlUZ584AuoEjcpf29r+2hkZBNdg=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B1E524273B;
	Thu, 19 Mar 2026 14:47:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id C+RCKnoMvGmPCwAAD6G6ig
	(envelope-from <oneukum@suse.com>); Thu, 19 Mar 2026 14:47:22 +0000
From: Oliver Neukum <oneukum@suse.com>
To: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org
Cc: Oliver Neukum <oneukum@suse.com>
Subject: [PATCHv2 1/2] usb: uapi: add usb 3.0 authentication declarations
Date: Thu, 19 Mar 2026 15:46:23 +0100
Message-ID: <20260319144715.2957358-1-oneukum@suse.com>
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
	TAGGED_FROM(0.00)[bounces-35159-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[oneukum@suse.com,linux-usb@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-0.998];
	DKIM_TRACE(0.00)[suse.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,suse.com:dkim,suse.com:email,suse.com:mid]
X-Rspamd-Queue-Id: 167DF2CD277
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

V2: corrected typo

 include/uapi/linux/usb/ch9.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/include/uapi/linux/usb/ch9.h b/include/uapi/linux/usb/ch9.h
index 8003243a4937..62771e38a83d 100644
--- a/include/uapi/linux/usb/ch9.h
+++ b/include/uapi/linux/usb/ch9.h
@@ -102,6 +102,8 @@
 #define USB_REQ_LOOPBACK_DATA_WRITE	0x15
 #define USB_REQ_LOOPBACK_DATA_READ	0x16
 #define USB_REQ_SET_INTERFACE_DS	0x17
+#define USB_REQ_AUTH_IN			0x18
+#define USB_REQ_AUTH_OUT		0x19
 
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



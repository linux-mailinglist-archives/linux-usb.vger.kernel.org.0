Return-Path: <linux-usb+bounces-35464-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sIQsNc8axGnlwQQAu9opvQ
	(envelope-from <linux-usb+bounces-35464-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 25 Mar 2026 18:26:39 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AED1329C48
	for <lists+linux-usb@lfdr.de>; Wed, 25 Mar 2026 18:26:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 440FD303D883
	for <lists+linux-usb@lfdr.de>; Wed, 25 Mar 2026 17:13:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CA743FBECF;
	Wed, 25 Mar 2026 17:13:22 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F6993CEB98
	for <linux-usb@vger.kernel.org>; Wed, 25 Mar 2026 17:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774458801; cv=none; b=l96uHcOFeo9SgLLtRq0xT47fIfjjy0mjw1/XiH9uHLK6JBR7zJbQbgpfx3Zx7JN7gxaO1cIT8Zd2WiGlA0EpPCs5nNHHXFvmvsr3OtKS09/H7u/FJrFPDDIv7auaEO65PJ1TFnj6VWcVXY33g6HjlN2nvmawJAomM2+U7o5tiWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774458801; c=relaxed/simple;
	bh=9pnpGkqyLI8BS7yQmR99B1szf1SEmnE/poTxv5G3fok=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Nk2zZtmJ17W+pwoJmmDv5QOzBWJ3O6YwrDDUYjSL0oJkcgC7XSUOw8eyJNM3eYViSrIuzGv4XrtaIvHArgyEKggmFAFvprbipE0U+vKrKdYhsKsmgla2HxEk3OKGMsz/AJGtsCpkUwKvZ3w4TvNXMivllh2qpkzBQtDkJ1bp+nE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id CBD555BFF5;
	Wed, 25 Mar 2026 17:13:18 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B14FD444EE;
	Wed, 25 Mar 2026 17:13:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id oDw1Kq4XxGn6cwAAD6G6ig
	(envelope-from <oneukum@suse.com>); Wed, 25 Mar 2026 17:13:18 +0000
From: Oliver Neukum <oneukum@suse.com>
To: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org
Cc: Oliver Neukum <oneukum@suse.com>
Subject: [PATCH 2/2] usb: misc: iowarrior: use HID includes
Date: Wed, 25 Mar 2026 18:12:57 +0100
Message-ID: <20260325171311.384010-2-oneukum@suse.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260325171311.384010-1-oneukum@suse.com>
References: <20260325171311.384010-1-oneukum@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Spam-Level: 
X-Spamd-Result: default: False [1.54 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[suse.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	TAGGED_FROM(0.00)[bounces-35464-lists,linux-usb=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	FROM_NEQ_ENVFROM(0.00)[oneukum@suse.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,suse.com:email,suse.com:mid,codemercs.com:email]
X-Rspamd-Queue-Id: 4AED1329C48
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The driver uses its own definitions for HID requests.
This leads to duplication and obfuscation. Use HID's
definitions.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/usb/misc/iowarrior.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/misc/iowarrior.c b/drivers/usb/misc/iowarrior.c
index 54f1bb0f7123..22504c0a2841 100644
--- a/drivers/usb/misc/iowarrior.c
+++ b/drivers/usb/misc/iowarrior.c
@@ -21,6 +21,7 @@
 #include <linux/sched.h>
 #include <linux/mutex.h>
 #include <linux/poll.h>
+#include <linux/hid.h>
 #include <linux/usb/iowarrior.h>
 
 #define DRIVER_AUTHOR "Christian Lucht <lucht@codemercs.com>"
@@ -98,14 +99,13 @@ struct iowarrior {
 /*    globals   */
 /*--------------*/
 
-#define USB_REQ_GET_REPORT  0x01
 //#if 0
 static int usb_get_report(struct usb_device *dev,
 			  struct usb_host_interface *inter, unsigned char type,
 			  unsigned char id, void *buf, int size)
 {
 	return usb_control_msg(dev, usb_rcvctrlpipe(dev, 0),
-			       USB_REQ_GET_REPORT,
+			       HID_REQ_GET_REPORT,
 			       USB_DIR_IN | USB_TYPE_CLASS |
 			       USB_RECIP_INTERFACE, (type << 8) + id,
 			       inter->desc.bInterfaceNumber, buf, size,
@@ -113,14 +113,12 @@ static int usb_get_report(struct usb_device *dev,
 }
 //#endif
 
-#define USB_REQ_SET_REPORT 0x09
-
 static int usb_set_report(struct usb_interface *intf, unsigned char type,
 			  unsigned char id, void *buf, int size)
 {
 	return usb_control_msg(interface_to_usbdev(intf),
 			       usb_sndctrlpipe(interface_to_usbdev(intf), 0),
-			       USB_REQ_SET_REPORT,
+			       HID_REQ_SET_REPORT,
 			       USB_TYPE_CLASS | USB_RECIP_INTERFACE,
 			       (type << 8) + id,
 			       intf->cur_altsetting->desc.bInterfaceNumber, buf,
-- 
2.53.0



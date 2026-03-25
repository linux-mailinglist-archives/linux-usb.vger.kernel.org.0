Return-Path: <linux-usb+bounces-35465-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SBg/M9caxGnlwQQAu9opvQ
	(envelope-from <linux-usb+bounces-35465-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 25 Mar 2026 18:26:47 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8434B329C4F
	for <lists+linux-usb@lfdr.de>; Wed, 25 Mar 2026 18:26:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 137BD3042614
	for <lists+linux-usb@lfdr.de>; Wed, 25 Mar 2026 17:13:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AB903FE348;
	Wed, 25 Mar 2026 17:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="SweADKNH";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="SweADKNH"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7714C351C06
	for <linux-usb@vger.kernel.org>; Wed, 25 Mar 2026 17:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774458801; cv=none; b=uxomABejZJDBOwZsADcmOXoNePj4LoepiTE6d7aFCrSkBAh9clHXSR+WaKmrsIjDTlXE/sZFI3tK3nHeFaOg/XrEDR6u5pjkaQfPXKozwi97aOxlbI86Nl9seOvs/OyIgsgMb9TUP0ydrsDmnUz5cjwGGu7bKhkPrPy8NGx5oT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774458801; c=relaxed/simple;
	bh=T0Cutb5XzvfMWHMtdmzLwJ5k5RTrHxUPXirUcDQMXMQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tbrVMev0gBCsf/aDyaUiTtPWq6g7OjIZgusEBjp73mM0m0GVgtk++aPAbQpAX1d4NCMRvB9bQpNg24A8UYzoAkk++RFcQuch6xH7egICquJTLC3EpGKY9k4lzQ1ZoK3ak7K7/52ZmTYnfwT/F09CLWyLywr+FVsHAAbcAiTponM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=SweADKNH; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=SweADKNH; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id AD60A4D41D;
	Wed, 25 Mar 2026 17:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1774458798; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=LXH3veoCF3+GBtD59dXeyld1awRLwoMKIjQ5zGza2vY=;
	b=SweADKNHfKce6O5KbR7FTLYYBI8LeWnMwvB30Nl4WlxsoXd1l6RYa7xxnX/VNRx4ZDYIyE
	g9hJ76+ZV5wF6KGRRQk4IvRarDzQFRiV6FCjr/EfY6XhbDqCSCIb3MHn2b1ifMnqZvlwKU
	3yGpuG01/FS1qYL+fmaey47uVrrrAxM=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1774458798; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=LXH3veoCF3+GBtD59dXeyld1awRLwoMKIjQ5zGza2vY=;
	b=SweADKNHfKce6O5KbR7FTLYYBI8LeWnMwvB30Nl4WlxsoXd1l6RYa7xxnX/VNRx4ZDYIyE
	g9hJ76+ZV5wF6KGRRQk4IvRarDzQFRiV6FCjr/EfY6XhbDqCSCIb3MHn2b1ifMnqZvlwKU
	3yGpuG01/FS1qYL+fmaey47uVrrrAxM=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 907F1444EC;
	Wed, 25 Mar 2026 17:13:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id QCQtIq4XxGn6cwAAD6G6ig
	(envelope-from <oneukum@suse.com>); Wed, 25 Mar 2026 17:13:18 +0000
From: Oliver Neukum <oneukum@suse.com>
To: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org
Cc: Oliver Neukum <oneukum@suse.com>
Subject: [PATCH 1/2] usb: misc: appledisplay: use HID includes
Date: Wed, 25 Mar 2026 18:12:56 +0100
Message-ID: <20260325171311.384010-1-oneukum@suse.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35465-lists,linux-usb=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8434B329C4F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The driver uses its own definitions for HID requests.
This leads to duplication and obfuscation. Use HID's
definitions.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/usb/misc/appledisplay.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/misc/appledisplay.c b/drivers/usb/misc/appledisplay.c
index 4beebde59842..16883592f7fc 100644
--- a/drivers/usb/misc/appledisplay.c
+++ b/drivers/usb/misc/appledisplay.c
@@ -12,6 +12,7 @@
 #include <linux/init.h>
 #include <linux/module.h>
 #include <linux/slab.h>
+#include <linux/hid.h>
 #include <linux/usb.h>
 #include <linux/backlight.h>
 #include <linux/timer.h>
@@ -20,9 +21,6 @@
 
 #define APPLE_VENDOR_ID		0x05AC
 
-#define USB_REQ_GET_REPORT	0x01
-#define USB_REQ_SET_REPORT	0x09
-
 #define ACD_USB_TIMEOUT		250
 
 #define ACD_USB_EDID		0x0302
@@ -140,7 +138,7 @@ static int appledisplay_bl_update_status(struct backlight_device *bd)
 	retval = usb_control_msg(
 		pdata->udev,
 		usb_sndctrlpipe(pdata->udev, 0),
-		USB_REQ_SET_REPORT,
+		HID_REQ_SET_REPORT,
 		USB_DIR_OUT | USB_TYPE_CLASS | USB_RECIP_INTERFACE,
 		ACD_USB_BRIGHTNESS,
 		0,
@@ -163,7 +161,7 @@ static int appledisplay_bl_get_brightness(struct backlight_device *bd)
 	retval = usb_control_msg(
 		pdata->udev,
 		usb_rcvctrlpipe(pdata->udev, 0),
-		USB_REQ_GET_REPORT,
+		HID_REQ_GET_REPORT,
 		USB_DIR_IN | USB_TYPE_CLASS | USB_RECIP_INTERFACE,
 		ACD_USB_BRIGHTNESS,
 		0,
-- 
2.53.0



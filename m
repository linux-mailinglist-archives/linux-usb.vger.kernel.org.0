Return-Path: <linux-usb+bounces-12072-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D023792B874
	for <lists+linux-usb@lfdr.de>; Tue,  9 Jul 2024 13:39:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 544A01F2166D
	for <lists+linux-usb@lfdr.de>; Tue,  9 Jul 2024 11:39:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89BCD14E2F4;
	Tue,  9 Jul 2024 11:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="BJj3TeUK";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="BJj3TeUK"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C0AF149C79
	for <linux-usb@vger.kernel.org>; Tue,  9 Jul 2024 11:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720525151; cv=none; b=Hni/uhAHEQhZezj4FM0vqazEvhzOlaxJcgwgkWFncZJacob0gz9sdupO9XJNhkzsrv/r/CgjRgqdS0+xbKyLghsFDYAnwBil8m9sNJ+Ch3Oa/K73QIrdomR5ammUC8Ol2UU8IeQXEV8iilJLT1IF2eMOaTT9Vuz9OUI1U8u9OS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720525151; c=relaxed/simple;
	bh=zjfS5WL1PZrFpaISqlSz+KBsmJDxIIkMrILdpA+4gRw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SujjVDJQei9gBoBKM7LxbiK1ctcK0qN6BdJ3eh4QgBfhqIdxZNt51CdBUf4nvCh3Qx7caud1qNFIH5Rk5/hiQkbyg6s7AZNVosm9V3ydKlpYuRUndszlYHvdBjqXmKsCbQh7D1WcMll/UunhU/FBhTBVVt+yPD+gg4wqvC8mRYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=BJj3TeUK; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=BJj3TeUK; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5B857219FD;
	Tue,  9 Jul 2024 11:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1720525147; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=3ii/qUpERqHVWo0zkNKRDOcsBh+dUQqVpi9UM5kWbVk=;
	b=BJj3TeUKOg1q/q/7fRS8FL5fd7znBSytBCGrvOavS7V8Q4LbvKUTDS76nHhFk2Q5uelc3a
	ugA7akG7uBeXhavOK8B7Jaoq4giw/UA7n9p/aFbfvATlJ0Z9ec9Onpa3KiWHC95a1Vda/T
	gcGhTCtIu7W7+XbY/KKmE3Y2Vt4VIIU=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=BJj3TeUK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1720525147; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=3ii/qUpERqHVWo0zkNKRDOcsBh+dUQqVpi9UM5kWbVk=;
	b=BJj3TeUKOg1q/q/7fRS8FL5fd7znBSytBCGrvOavS7V8Q4LbvKUTDS76nHhFk2Q5uelc3a
	ugA7akG7uBeXhavOK8B7Jaoq4giw/UA7n9p/aFbfvATlJ0Z9ec9Onpa3KiWHC95a1Vda/T
	gcGhTCtIu7W7+XbY/KKmE3Y2Vt4VIIU=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 03CB61396E;
	Tue,  9 Jul 2024 11:39:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id q3uKOVkhjWZkZQAAD6G6ig
	(envelope-from <oneukum@suse.com>); Tue, 09 Jul 2024 11:39:05 +0000
From: Oliver Neukum <oneukum@suse.com>
To: valentina.manea.m@gmail.com,
	shuah@kernel.org,
	i@zenithal.me,
	gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org
Cc: Oliver Neukum <oneukum@suse.com>
Subject: [PATCH] usb: vhci-hcd: Do not drop references before new references are gained
Date: Tue,  9 Jul 2024 13:38:41 +0200
Message-ID: <20240709113851.14691-1-oneukum@suse.com>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.61 / 50.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	BAYES_HAM(-0.88)[85.75%];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,zenithal.me,linuxfoundation.org,vger.kernel.org];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[suse.com:+];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spamd-Bar: /
X-Rspamd-Queue-Id: 5B857219FD
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: 0.61
X-Spam-Level: 

At a few places the driver carries stale pointers
to references that can still be used. Make sure that does not happen.
This strictly speaking closes ZDI-CAN-22273, though there may be
similar races in the driver.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/usb/usbip/vhci_hcd.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/usbip/vhci_hcd.c b/drivers/usb/usbip/vhci_hcd.c
index 82650c11e451..302a89aeb258 100644
--- a/drivers/usb/usbip/vhci_hcd.c
+++ b/drivers/usb/usbip/vhci_hcd.c
@@ -745,6 +745,7 @@ static int vhci_urb_enqueue(struct usb_hcd *hcd, struct urb *urb, gfp_t mem_flag
 	 *
 	 */
 	if (usb_pipedevice(urb->pipe) == 0) {
+		struct usb_device *old;
 		__u8 type = usb_pipetype(urb->pipe);
 		struct usb_ctrlrequest *ctrlreq =
 			(struct usb_ctrlrequest *) urb->setup_packet;
@@ -755,14 +756,15 @@ static int vhci_urb_enqueue(struct usb_hcd *hcd, struct urb *urb, gfp_t mem_flag
 			goto no_need_xmit;
 		}
 
+		old = vdev->udev;
 		switch (ctrlreq->bRequest) {
 		case USB_REQ_SET_ADDRESS:
 			/* set_address may come when a device is reset */
 			dev_info(dev, "SetAddress Request (%d) to port %d\n",
 				 ctrlreq->wValue, vdev->rhport);
 
-			usb_put_dev(vdev->udev);
 			vdev->udev = usb_get_dev(urb->dev);
+			usb_put_dev(old);
 
 			spin_lock(&vdev->ud.lock);
 			vdev->ud.status = VDEV_ST_USED;
@@ -781,8 +783,8 @@ static int vhci_urb_enqueue(struct usb_hcd *hcd, struct urb *urb, gfp_t mem_flag
 				usbip_dbg_vhci_hc(
 					"Not yet?:Get_Descriptor to device 0 (get max pipe size)\n");
 
-			usb_put_dev(vdev->udev);
 			vdev->udev = usb_get_dev(urb->dev);
+			usb_put_dev(old);
 			goto out;
 
 		default:
@@ -1067,6 +1069,7 @@ static void vhci_shutdown_connection(struct usbip_device *ud)
 static void vhci_device_reset(struct usbip_device *ud)
 {
 	struct vhci_device *vdev = container_of(ud, struct vhci_device, ud);
+	struct usb_device *old = vdev->udev;
 	unsigned long flags;
 
 	spin_lock_irqsave(&ud->lock, flags);
@@ -1074,8 +1077,8 @@ static void vhci_device_reset(struct usbip_device *ud)
 	vdev->speed  = 0;
 	vdev->devid  = 0;
 
-	usb_put_dev(vdev->udev);
 	vdev->udev = NULL;
+	usb_put_dev(old);
 
 	if (ud->tcp_socket) {
 		sockfd_put(ud->tcp_socket);
-- 
2.45.1



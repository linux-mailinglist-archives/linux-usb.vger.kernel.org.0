Return-Path: <linux-usb+bounces-33331-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MGubHkVJjmngBQEAu9opvQ
	(envelope-from <linux-usb+bounces-33331-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 12 Feb 2026 22:42:29 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE8113159F
	for <lists+linux-usb@lfdr.de>; Thu, 12 Feb 2026 22:42:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B0EB330FBDA8
	for <lists+linux-usb@lfdr.de>; Thu, 12 Feb 2026 21:42:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBCCA32A3CA;
	Thu, 12 Feb 2026 21:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=u-northwestern-edu.20230601.gappssmtp.com header.i=@u-northwestern-edu.20230601.gappssmtp.com header.b="NJp9S3ZA"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF9128BAB9
	for <linux-usb@vger.kernel.org>; Thu, 12 Feb 2026 21:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770932520; cv=none; b=cczWAZ3hRRN1hEqrgxODP9juTFCta3w3LMZpwC6ogGkYBP9e6d/mLshhBKn3B5vDrq2pTIfPoaLI8J6n64/E+zYwCNTQq/mTjN8ZqaqnxWrHpjd+Q/8lrxXJ+IyM79NAoEqIM3JR5c3tAeX728C4EJ8mgwewPFqxIJI75ECARJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770932520; c=relaxed/simple;
	bh=0IYVgRHd6TZ2pI2ZFTsmGN2BGGlg3CLyrtR2RDlfs9o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jLsvGCZSFcxC0U1vbo62FvycBvqsQhpv9cVhUzVEuIf6ZrLWwXkIH7rWcsABj/JdYTQmNk/mMpzXDmb2fEns6lEr0+kQ+jDnErXRQbWXl/f9nt/pjRZMe/ypveaToK8Eg493FVKqM9wKUCdnmKImG7z66Ti1OaanecRVfqCPuII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=u.northwestern.edu; spf=pass smtp.mailfrom=u.northwestern.edu; dkim=pass (2048-bit key) header.d=u-northwestern-edu.20230601.gappssmtp.com header.i=@u-northwestern-edu.20230601.gappssmtp.com header.b=NJp9S3ZA; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=u.northwestern.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=u.northwestern.edu
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-8cb40030be5so26042285a.3
        for <linux-usb@vger.kernel.org>; Thu, 12 Feb 2026 13:41:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=u-northwestern-edu.20230601.gappssmtp.com; s=20230601; t=1770932517; x=1771537317; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fBNWNtgJkDT4c7Jvgggf4qsijVRD2mBYjYmT91hYIoQ=;
        b=NJp9S3ZA0X2ffNGovgYwZMO5u+0VjJUF5iNZrDcTcuhzI8QXINswxPynJMKEIOSD3r
         1Cy/PfSUCs2AbN6al3CYOTZ7P9pb0ShAWGaVR1jC9EtpwWh+fpidumbMSvX3IMWgm5gO
         VjLqeOV4Wuue+ZW9d/Nf8X1oydxUEACtfbAcnOhxZwSa+KliiM7o6eMcGn1ncFX38I96
         iwITs28bZ+kb1abfOK/FgqVcT5kYYNTgyr/c8iknKe25HDfkhOvgog9v8On1aSR9uBpz
         +1/wp2/Tw+K9c5V+12+yOfaIK7KOU2ocAnl77hM3aJdb5X/+loj8oFArHfDmZsfgX/1+
         61Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770932517; x=1771537317;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fBNWNtgJkDT4c7Jvgggf4qsijVRD2mBYjYmT91hYIoQ=;
        b=to4NubTQZz7h/8vVzGDsnj7VHEO3S4SF9jO2DkD41U277BlefY+GKX9osSEuNn2NVh
         G1J3i3ML8/S73nj6/SEiLu0LS4n0goYAbT4MORokDHSpPdeyHoAH54w2Zj3N2/7iNN+s
         ebZl3v1Njx2464djf6CgF0GZ1ZeIaHanHk3YxzucruGk2dPp+23KM52FY9FdawJBxHtZ
         yuoyBlwvwhCE3esh0l1mpsaguuxAwXm2zsMBjG2XQULJMh3Jiez3mWcsdio3t2sktEtA
         MF4Dt2rJksUdR2u/g438wD2rpYgQY7++PJCZQzxZeQ3hlssr0PMZw1olknQnBBqLpEpx
         srLw==
X-Gm-Message-State: AOJu0YzWl1cPFub5XOkq5mGiX79t6TOIf8jeiOWXMwDR5QBtNyqa2IKl
	bL1cMPklpU0IZSfTji3nWHmjqewv1lns8uTguwoXYcXMFCKTEOcxGHhstHceGrggUwU=
X-Gm-Gg: AZuq6aLG+NQqNDXmld6ByulQH3aeclz/NeKbYza54/fp374lkCDKFdwUe8aMI7B+/V0
	WbW9LFkci53Yna3b9Qobal+NHTauF1GI8MqIXZUaSAPtwMTE7eJPUJs7sHR5sZC5l1Ga1csfbwN
	M3hOLmuNAiors1hOV4fG7erpkewLJuNeSZPNmaZplisB63a0HuN9kYw7ipS60mtnSVW/3EDQyDV
	L8XOMOprZ7vwceaT7xsmbePc+U9E8KBd5d0R8oLX/kSIjd+vlKWgu2u++JisZJWwBnReS6R6x4L
	DpRWsQEytw2x117UnclRrXa1X2Rr5d98vr+CCKfXxhES6wvQyZt7v5rtsqelmT3uregRyd0jnAL
	qBh2xYZ5K0q6pAgKi9L59vP4vFdAGQVGUaOd3O6gRKL7FWp9nOn4DL9bodNuYlD5ilx7eFSYKUp
	G5bScQ73+bX8VAOV7li5EW89cgI3uNjZQh5qTVafZ0GV7xWDZMCXjPDZDupEthzupbuwczfwKov
	47ZBp3VJcNFa4Gg77C+n3LIEVg/Tif4yztOa9GdYeU=
X-Received: by 2002:a05:620a:44c3:b0:8b2:7558:406d with SMTP id af79cd13be357-8cb408f24f8mr52997085a.61.1770932516736;
        Thu, 12 Feb 2026 13:41:56 -0800 (PST)
Received: from security.cs.northwestern.edu (security.cs.northwestern.edu. [165.124.184.136])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8971cc823a4sm45245976d6.8.2026.02.12.13.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 13:41:56 -0800 (PST)
From: Ziyi Guo <n7l8m4@u.northwestern.edu>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>
Cc: linux-usb@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ziyi Guo <n7l8m4@u.northwestern.edu>
Subject: [PATCH net v2] net: usb: catc: enable basic endpoint checking
Date: Thu, 12 Feb 2026 21:41:54 +0000
Message-Id: <20260212214154.3609844-1-n7l8m4@u.northwestern.edu>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[u-northwestern-edu.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[northwestern.edu : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33331-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[n7l8m4@u.northwestern.edu,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,netdev];
	RCPT_COUNT_SEVEN(0.00)[10];
	DKIM_TRACE(0.00)[u-northwestern-edu.20230601.gappssmtp.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[northwestern.edu:email,u.northwestern.edu:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1CE8113159F
X-Rspamd-Action: no action

catc_probe() fills three URBs with hardcoded endpoint pipes without
verifying the endpoint descriptors:

  - usb_sndbulkpipe(usbdev, 1) and usb_rcvbulkpipe(usbdev, 1) for TX/RX
  - usb_rcvintpipe(usbdev, 2) for interrupt status

A malformed USB device can present these endpoints with transfer types
that differ from what the driver assumes.

Add a catc_usb_ep enum for endpoint numbers, replacing magic constants
throughout. Add usb_check_bulk_endpoints() and usb_check_int_endpoints()
calls after usb_set_interface() to verify endpoint types before use,
rejecting devices with mismatched descriptors at probe time.

Similar to
- commit 90b7f2961798 ("net: usb: rtl8150: enable basic endpoint checking")
which fixed the issue in rtl8150.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Suggested-by: Simon Horman <horms@kernel.org>
Signed-off-by: Ziyi Guo <n7l8m4@u.northwestern.edu>
---
v2:
 - Use an enum instead of the magic numbers

 drivers/net/usb/catc.c | 37 +++++++++++++++++++++++++++++++------
 1 file changed, 31 insertions(+), 6 deletions(-)

diff --git a/drivers/net/usb/catc.c b/drivers/net/usb/catc.c
index 6759388692f8..632e27ee9101 100644
--- a/drivers/net/usb/catc.c
+++ b/drivers/net/usb/catc.c
@@ -64,6 +64,16 @@ static const char driver_name[] = "catc";
 #define CTRL_QUEUE		16	/* Max control requests in flight (power of two) */
 #define RX_PKT_SZ		1600	/* Max size of receive packet for F5U011 */
 
+/*
+ * USB endpoints.
+ */
+
+enum catc_usb_ep {
+	CATC_USB_EP_CONTROL	= 0,
+	CATC_USB_EP_BULK	= 1,
+	CATC_USB_EP_INT_IN	= 2,
+};
+
 /*
  * Control requests.
  */
@@ -772,6 +782,13 @@ static int catc_probe(struct usb_interface *intf, const struct usb_device_id *id
 	u8 broadcast[ETH_ALEN];
 	u8 *macbuf;
 	int pktsz, ret = -ENOMEM;
+	static const u8 bulk_ep_addr[] = {
+		CATC_USB_EP_BULK | USB_DIR_OUT,
+		CATC_USB_EP_BULK | USB_DIR_IN,
+		0};
+	static const u8 int_ep_addr[] = {
+		CATC_USB_EP_INT_IN | USB_DIR_IN,
+		0};
 
 	macbuf = kmalloc(ETH_ALEN, GFP_KERNEL);
 	if (!macbuf)
@@ -784,6 +801,14 @@ static int catc_probe(struct usb_interface *intf, const struct usb_device_id *id
 		goto fail_mem;
 	}
 
+	/* Verify that all required endpoints are present */
+	if (!usb_check_bulk_endpoints(intf, bulk_ep_addr) ||
+	    !usb_check_int_endpoints(intf, int_ep_addr)) {
+		dev_err(dev, "Missing or invalid endpoints\n");
+		ret = -ENODEV;
+		goto fail_mem;
+	}
+
 	netdev = alloc_etherdev(sizeof(struct catc));
 	if (!netdev)
 		goto fail_mem;
@@ -828,14 +853,14 @@ static int catc_probe(struct usb_interface *intf, const struct usb_device_id *id
 	usb_fill_control_urb(catc->ctrl_urb, usbdev, usb_sndctrlpipe(usbdev, 0),
 		NULL, NULL, 0, catc_ctrl_done, catc);
 
-	usb_fill_bulk_urb(catc->tx_urb, usbdev, usb_sndbulkpipe(usbdev, 1),
-		NULL, 0, catc_tx_done, catc);
+	usb_fill_bulk_urb(catc->tx_urb, usbdev, usb_sndbulkpipe(usbdev, CATC_USB_EP_BULK),
+			  NULL, 0, catc_tx_done, catc);
 
-	usb_fill_bulk_urb(catc->rx_urb, usbdev, usb_rcvbulkpipe(usbdev, 1),
-		catc->rx_buf, pktsz, catc_rx_done, catc);
+	usb_fill_bulk_urb(catc->rx_urb, usbdev, usb_rcvbulkpipe(usbdev, CATC_USB_EP_BULK),
+			  catc->rx_buf, pktsz, catc_rx_done, catc);
 
-	usb_fill_int_urb(catc->irq_urb, usbdev, usb_rcvintpipe(usbdev, 2),
-                catc->irq_buf, 2, catc_irq_done, catc, 1);
+	usb_fill_int_urb(catc->irq_urb, usbdev, usb_rcvintpipe(usbdev, CATC_USB_EP_INT_IN),
+			 catc->irq_buf, 2, catc_irq_done, catc, 1);
 
 	if (!catc->is_f5u011) {
 		u32 *buf;
-- 
2.34.1



Return-Path: <linux-usb+bounces-37982-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id dXE+CFG3Emqh3AYAu9opvQ
	(envelope-from <linux-usb+bounces-37982-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 24 May 2026 10:31:13 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C575C1B0A
	for <lists+linux-usb@lfdr.de>; Sun, 24 May 2026 10:31:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7BEE4300E245
	for <lists+linux-usb@lfdr.de>; Sun, 24 May 2026 08:31:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCC1F38F658;
	Sun, 24 May 2026 08:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SBIR3Xj1"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D391938E8CB
	for <linux-usb@vger.kernel.org>; Sun, 24 May 2026 08:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779611462; cv=none; b=Tj7nwi4s3WsNgiLqBvTnI54alSRoerkYwtgb3wGnPeFAELrLxAx/GvTsEmMe/ucxwtcdKTMA80icEpeLMDJXvgaCFaNDHz0z38Ma2yssseQtJnMUPWMFaGwdu4kXtrvuyPUi33ya9yhEGplZEijX+tcgck/HGcYti1wbt1r/P3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779611462; c=relaxed/simple;
	bh=VttMbDlvLgw2G/I4Aw7HZ4R11PoG8jiUwczUsi1qoUc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F9dEOyUlgK/yafNNmcPn5SGTqnQD6Oy96afGDHycEbxpNjBt8C0HAbCNWjai8LfF05Q4Y7E3v4N+nsRdV1vHhSPcXSUWzPmE0cOm6b8JUN9RtCzyuyKEJlJbreEBhnUdzMp/VkHOSs8JtzD6hqRP7w8Htc8EZen+96cKFkeNFwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SBIR3Xj1; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5aa0cf8bca3so8023622e87.0
        for <linux-usb@vger.kernel.org>; Sun, 24 May 2026 01:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779611458; x=1780216258; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OSdJZOa5hy/Nodbj4dZkXLtOENV90ph6gNx9+T8TlxY=;
        b=SBIR3Xj1TJiW91zL1XpkOIjQWV5LGBodXakpxFRZJsCjb0IcX2D3cDgonv44QQNmyP
         qTKatpJc2vkjcDYD9uhojHXW+m9m0rlyLnc9845biFJJoJCOTWwoDrl+vGl/pJsM5ng3
         NdDJ6tnv3CJDsuY6WOGt+VM02y7dxp17Ui9Tl3AAsr9WdTOkCVhyS8P+UeQLIOp+Mab8
         8rFqc3MNPgQcsb/JK33kJqldAoPPEIDY7bvUHH8+C4vNKdZDD3OchVdEr6/K8PHn9VAU
         8ev7PSic7VNvPhMJw4CyqnhaOCno6w4wA9YV6U8nkEgTnuflybwhtQ61s4gveZz/iTD+
         ag2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779611458; x=1780216258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OSdJZOa5hy/Nodbj4dZkXLtOENV90ph6gNx9+T8TlxY=;
        b=mssodYDBpWxZ/Inb+3h1neY7EAPugJTJw5GrKA3aZywiibpmoIfbAOQmN3JPpz7ODa
         rhqoTEG437bY1mMANA/eUXsN1QNEH2XkXmq7yaoKKQWAqNpsLzc8mpbdwM8j2LZidFyt
         6xzyvMrYYpLeQxlBK8aPJUrDIJfl5eLNAAPZcRMvC/TCRUQQrKRIlqG7KsD0dmdp/BSO
         opi9JUmjSsmucawPczQ4cdLeoAmFYYHAeFzSWaQzLFrWG/tXC0kGIllPo4enWXuplur8
         GWWCvRh/QF9Ji24crEWIOroYqi9jcs536pDu6NPXgii4tzvAfZsMXSLbYv/0h+lIq6cV
         29Dg==
X-Forwarded-Encrypted: i=1; AFNElJ8TqHL+acbc22dJXpoTRRqbOHvgzrHfRBWVZzhW4r/WfiDMwjKrriMLVIPjOgPoZk4PZCMvdHPBcE8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOKc14svs0d3dl9QikI2bHw1Fms9tZ8QMN7AytnTNvNyaNSTTX
	8kAPy0wOUR0wUFsbWLzR4/CXMUdqwgF/3HbsWXrg6Dsvvq/gJlw63dTd
X-Gm-Gg: Acq92OHcOSc98V5qa+fuoNHH37G5KZijahmxEXIzSwfqLZKHS9J4ic1wz4F5LTBUmCP
	Kyq7ZJV3DDLUpe5KagslsObhbxA1DR1EoWmrBvW1ii4pcl57RtZ07aPQMa5t/3aUeM58vX3d/bj
	r0se5Afz2VrQDWshqi7Y03bPOt2hNd66oWniZzjCjOQn38uaL9SH5LXYpntX3lW1s75HeOkvaiV
	aUS7uAr9I8i6w1JJtNlPYRu+hJnVv5uMw4AxEDpvqpOvUIQFBtbmD1Y3BFxtkiy4/Z8jtj8Dd5S
	LaG7o1sP+7zvvwVLIZTptLOy+pGFCxA/7yV5gzSpNq3o1bnfZ7gYQild2fAhBNp3SKG0aYly6ae
	pyXPmENHbOn0qTJEOXkfrRaBF0sasfdNaz96y2R9COI6iA5IG5TMp8OU57J+TV8MXZcWnwiQKAn
	n4GhUAH5y8QNSgrylskvfAESuXZgV39zwS
X-Received: by 2002:a05:6512:685:b0:5a9:95be:7f7f with SMTP id 2adb3069b0e04-5aa3238b732mr3379175e87.14.1779611457470;
        Sun, 24 May 2026 01:30:57 -0700 (PDT)
Received: from foxbook (bfk48.neoplus.adsl.tpnet.pl. [83.28.48.48])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa32cf4f1csm1731116e87.70.2026.05.24.01.30.56
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sun, 24 May 2026 01:30:57 -0700 (PDT)
Date: Sun, 24 May 2026 10:30:53 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Joseph Bursey <jbursey@uci.edu>
Cc: syzbot <syzbot+ad2aac2febc3bedf0962@syzkaller.appspotmail.com>,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [usb?] KASAN: slab-use-after-free Write in
 iowarrior_write_callback (2)
Message-ID: <20260524103053.308501de.michal.pecio@gmail.com>
In-Reply-To: <32c79569-8001-48d2-9675-b38b1670f285@uci.edu>
References: <6a0ce39b.170a0220.39a13.0007.GAE@google.com>
	<32c79569-8001-48d2-9675-b38b1670f285@uci.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37982-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,ad2aac2febc3bedf0962];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Queue-Id: 96C575C1B0A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 22 May 2026 13:38:40 -0700, Joseph Bursey wrote:
> Hello, I believe I have a reproducer for this bug using a combination
> of syz-execprog and eBPF programs.

Hi, could you check if this patch (compile tested only) fixes it?

I admit I'm not an expert on USB core, but I see nothing _reliably_
preventing URB submissions after usb_disable_interface(), which may
be the root cause of this bug (besides the driver sloppiness for
which separate patches have been posted by Johan Hovold).

My patch tries to fix it by updating ep->enabled under a spinlock
which will be held while checking this flag on submission attempts.

Such bug is trouble not only for sloppy drivers, but also for HCDs
which assume that no URBs exist while endpoints are being "dropped".
Syzbot and you apparently found ways to break this assumption:

static int usb_unbind_interface(struct device *dev)
{
	[...]
        /*
         * Terminate all URBs for this interface unless the driver
         * supports "soft" unbinding and the device is still present.
         */
        if (!driver->soft_unbind || udev->state == USB_STATE_NOTATTACHED)
                usb_disable_interface(udev, intf, false);
	// no URBs should be pending on these endpoints now

        driver->disconnect(intf);
	// but one is observed completing concurrently now

I also suspect that more UAF in sloppy drivers is possible due to
usb_hcd_flush_endpoint() failing to wait for pending BH givebacks.
It seems that dummy-hcd doesn't use HCD_BH, so this shouldn't be
a factor here, but it could become an issue on real hardware.

As long as resubmission is prevented reliably, this won't affect
HCDs, but it may cause UAF in buggy class drivers.

---

diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
index b181b43a35dc..4fee30101e96 100644
--- a/drivers/usb/core/hcd.c
+++ b/drivers/usb/core/hcd.c
@@ -1958,6 +1958,15 @@ int usb_hcd_alloc_bandwidth(struct usb_device *udev,
 	return ret;
 }
 
+void usb_hcd_set_endpoint_enabled(struct usb_host_endpoint *ep, int enabled)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&hcd_urb_list_lock, flags);
+	ep->enabled = enabled;
+	spin_unlock_irqrestore(&hcd_urb_list_lock, flags);
+}
+
 /* Disables the endpoint: synchronizes with the hcd to make sure all
  * endpoint state is gone from hardware.  usb_hcd_flush_endpoint() must
  * have been called previously.  Use for set_configuration, set_interface,
diff --git a/drivers/usb/core/message.c b/drivers/usb/core/message.c
index 75e2bfd744a9..8d656d7e8f69 100644
--- a/drivers/usb/core/message.c
+++ b/drivers/usb/core/message.c
@@ -1358,7 +1358,7 @@ void usb_disable_endpoint(struct usb_device *dev, unsigned int epaddr,
 			dev->ep_in[epnum] = NULL;
 	}
 	if (ep) {
-		ep->enabled = 0;
+		usb_hcd_set_endpoint_enabled(ep, 0);
 		usb_hcd_flush_endpoint(dev, ep);
 		if (reset_hardware)
 			usb_hcd_disable_endpoint(dev, ep);
@@ -1523,7 +1523,7 @@ void usb_enable_endpoint(struct usb_device *dev, struct usb_host_endpoint *ep,
 		dev->ep_out[epnum] = ep;
 	if (!is_out || is_control)
 		dev->ep_in[epnum] = ep;
-	ep->enabled = 1;
+	usb_hcd_set_endpoint_enabled(ep, 1);
 }
 
 /**
diff --git a/include/linux/usb/hcd.h b/include/linux/usb/hcd.h
index 181db044c4d2..de97827a579b 100644
--- a/include/linux/usb/hcd.h
+++ b/include/linux/usb/hcd.h
@@ -437,6 +437,7 @@ extern void usb_hcd_unmap_urb_setup_for_dma(struct usb_hcd *, struct urb *);
 extern void usb_hcd_unmap_urb_for_dma(struct usb_hcd *, struct urb *);
 extern void usb_hcd_flush_endpoint(struct usb_device *udev,
 		struct usb_host_endpoint *ep);
+extern void usb_hcd_set_endpoint_enabled(struct usb_host_endpoint *ep, int enabled);
 extern void usb_hcd_disable_endpoint(struct usb_device *udev,
 		struct usb_host_endpoint *ep);
 extern void usb_hcd_reset_endpoint(struct usb_device *udev,


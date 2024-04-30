Return-Path: <linux-usb+bounces-9939-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9F68B7A32
	for <lists+linux-usb@lfdr.de>; Tue, 30 Apr 2024 16:42:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 118BB1F235A7
	for <lists+linux-usb@lfdr.de>; Tue, 30 Apr 2024 14:42:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4A47172BD9;
	Tue, 30 Apr 2024 14:33:58 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id CB09577114
	for <linux-usb@vger.kernel.org>; Tue, 30 Apr 2024 14:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714487638; cv=none; b=ePiuDTDiBGjGhcMWLRO7Gmy/ijDTpnfaycrLHuD4j2yG8lvCc656Ds16Adw9Q5oJUj+fkIkO/G2d+Skf6qPYfbHBKO+lYPkojrXbjS3LIYkM2R4TTHOpZQwamGd62YCLg2Q9LaKs3uc7Q2cK9cGNT8fBqha29h5MWxqe2KmTvnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714487638; c=relaxed/simple;
	bh=UXht4ncPOWlDvKG+707g4AkrxDDI2YAVt9O0DhoBxfA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a5rcWkosi2pw28R4+FmPlKpgMJxthIhOXUUVYmCj8z1u8Rm7YDbMH0oBct7Qea/yBAEc6dwzK97Yzu0mRBrPZd3mkpKrLbN6O/lb7aVmtNN/vLIeKzJvU2+Nf6Qyo5/TGAUwdU65AVrqBWvsw6OC3VDlOrM56vsVBlvnalCRYN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 657721 invoked by uid 1000); 30 Apr 2024 10:33:48 -0400
Date: Tue, 30 Apr 2024 10:33:48 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Takashi Iwai <tiwai@suse.de>, Roger Whittaker <roger.whittaker@suse.com>,
  Oliver Neukum <oneukum@suse.com>, USB list <linux-usb@vger.kernel.org>
Subject: [PATCH] usb: Fix regression caused by invalid ep0 maxpacket in
 virtual SuperSpeed device
Message-ID: <4058ac05-237c-4db4-9ecc-5af42bdb4501@rowland.harvard.edu>
References: <9efbd569-7059-4575-983f-0ea30df41871@suse.com>
 <78eaec78-663a-428b-b80e-68c398a8f5f7@rowland.harvard.edu>
 <8a4a7f9e-a191-4301-93f8-9694aa14e42f@leemhuis.info>
 <673939a1-b07a-457e-9fa6-cf6166fdff03@rowland.harvard.edu>
 <8734rdjj4n.wl-tiwai@suse.de>
 <ea0b171b-7ee7-4141-b334-28f637fc6b03@rowland.harvard.edu>
 <87bk5zdtqs.wl-tiwai@suse.de>
 <8734r53ond.wl-tiwai@suse.de>
 <c6989828-975e-430c-9334-06b895d646b7@rowland.harvard.edu>
 <878r0vnur2.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <878r0vnur2.wl-tiwai@suse.de>

A virtual SuperSpeed device in the FreeBSD BVCP package
(https://bhyve.npulse.net/) presents an invalid ep0 maxpacket size of 256.
It stopped working with Linux following a recent commit because now we
check these sizes more carefully than before.

Fix this regression by using the bMaxpacketSize0 value in the device
descriptor for SuperSpeed or faster devices, even if it is invalid.  This
is a very simple-minded change; we might want to check more carefully for
values that actually make some sense (for instance, no smaller than 64).

Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
Reported-and-tested-by: Roger Whittaker <roger.whittaker@suse.com>
Closes: https://bugzilla.suse.com/show_bug.cgi?id=1220569
Link: https://lore.kernel.org/linux-usb/9efbd569-7059-4575-983f-0ea30df41871@suse.com/
Fixes: 59cf44575456 ("USB: core: Fix oversight in SuperSpeed initialization")
Cc: stable@vger.kernel.org

---

 drivers/usb/core/hub.c |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

Index: usb-devel/drivers/usb/core/hub.c
===================================================================
--- usb-devel.orig/drivers/usb/core/hub.c
+++ usb-devel/drivers/usb/core/hub.c
@@ -5110,9 +5110,10 @@ hub_port_init(struct usb_hub *hub, struc
 	}
 	if (usb_endpoint_maxp(&udev->ep0.desc) == i) {
 		;	/* Initial ep0 maxpacket guess is right */
-	} else if ((udev->speed == USB_SPEED_FULL ||
+	} else if (((udev->speed == USB_SPEED_FULL ||
 				udev->speed == USB_SPEED_HIGH) &&
-			(i == 8 || i == 16 || i == 32 || i == 64)) {
+			(i == 8 || i == 16 || i == 32 || i == 64)) ||
+			(udev->speed >= USB_SPEED_SUPER && i > 0)) {
 		/* Initial guess is wrong; use the descriptor's value */
 		if (udev->speed == USB_SPEED_FULL)
 			dev_dbg(&udev->dev, "ep0 maxpacket = %d\n", i);


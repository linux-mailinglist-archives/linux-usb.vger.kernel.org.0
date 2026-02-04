Return-Path: <linux-usb+bounces-33106-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ELuSKVJag2mJlQMAu9opvQ
	(envelope-from <linux-usb+bounces-33106-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 04 Feb 2026 15:40:18 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 34FE6E73AA
	for <lists+linux-usb@lfdr.de>; Wed, 04 Feb 2026 15:40:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E5D83303C812
	for <lists+linux-usb@lfdr.de>; Wed,  4 Feb 2026 14:37:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5120041325F;
	Wed,  4 Feb 2026 14:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="x+tRgzN4"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE7D413244;
	Wed,  4 Feb 2026 14:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770215821; cv=none; b=hTzgLJ71mrxGE9oZLklygF5lCyC6QCWsKxs35kGxQmvGfIGZyJtO5OHdR6GY8wQNPrGZUKvKa5CbY4gYd86BLtuiR1M5uLl1wbEdGFkN/0Bag6OXRqarOs7r5TzlBoViERXc7lFvqJGI3Cdgz7zONMoNhIovzEmzfuIHcHYgCsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770215821; c=relaxed/simple;
	bh=Ob3m81TGCAs6jbJMt2T7ftGtSIXbClUCuVvjHnqSPcM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E8noCp3u1vuRXK+QZ3o7IyHsap5E3TU36wWW8NTp9Lxp7V/a40AIybgtSoR4Zy1czoP+CQ0fWnH8Hyn8cM1CVZAi3ksjuaCOPS6r5hpWv8S/JTalqE1YGrZiXvurSuMtfwNB8nlw9FD2lhaD7b4+PUutNX0hcuIVqqrdnLb5AHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=x+tRgzN4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 052C4C4CEF7;
	Wed,  4 Feb 2026 14:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770215821;
	bh=Ob3m81TGCAs6jbJMt2T7ftGtSIXbClUCuVvjHnqSPcM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=x+tRgzN4hTN3ESTBdIM7y4rCmVALW9KZP1udmYuuHpCz3ItHByaUv0Kqu4wHokmfI
	 vHay3czhCXGjQny1wSa4++/FKMytAef3zcXHx1FIfEz+AIVLVcYLp07zkC7COwkOEB
	 U15ktBqPQicU/8F0piCOExVjxLf6me4q6RMa93Ko=
Date: Wed, 4 Feb 2026 15:36:58 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: A1RM4X <A1RM4X@a1rm4x.com>
Cc: A1RM4X <dev@a1rm4x.com>, linux-usb@vger.kernel.org, limiao@kylinos.cn,
	oneukum@suse.com, huanglei@kylinos.cn, lijiayi@kylinos.cn,
	johannes.bruederl@gmail.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: add QUIRK_NO_BOS for several devices
Message-ID: <2026020421-rhyme-aspire-0a5c@gregkh>
References: <20260204032938.61553-1-dev@a1rm4x.com>
 <2026020457-distrust-vision-e5de@gregkh>
 <CACy+XB-Z26Bx2Zb4omoRq00L4tTAQxe4QWSQ1f=eFMryqb8Ksw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACy+XB-Z26Bx2Zb4omoRq00L4tTAQxe4QWSQ1f=eFMryqb8Ksw@mail.gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33106-lists,linux-usb=lfdr.de];
	FREEMAIL_CC(0.00)[a1rm4x.com,vger.kernel.org,kylinos.cn,suse.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linuxfoundation.org:dkim]
X-Rspamd-Queue-Id: 34FE6E73AA
X-Rspamd-Action: no action

On Wed, Feb 04, 2026 at 09:25:18AM -0500, A1RM4X wrote:
> Hi,
> 
> Please find attached the new patch which fixes the structure of the commit.

Attached patches do not work :(

> Why? If the option is not being used, the speed limit will be limited
> to 5000M, which limits the capture capabilities of the device (4K30fps
> at 5000M versus the expected 4K60fps at 10000M).

Why does the device slow down like this?  Is it a bug in it?

> What happens in userspace?
> - without patch
> [ 5036.674972] usb 2-2: new SuperSpeed Plus Gen 2x1 USB device number
> 2 using xhci_hcd
> [ 5041.770595] usb 2-2: unable to get BOS descriptor or descriptor too short
> [ 5041.770605] usb 2-2: unable to read config index 0 descriptor/start: -19
> [ 5041.955592] usb 2-2: Device not responding to setup address.
> [ 5042.162588] usb 2-2: Device not responding to setup address.
> [ 5042.370246] usb 2-2: device not accepting address 3, error -71
> [ 5042.373859] usb usb2-port2: attempt power cycle
> [ 5043.691464] usb 2-2: new SuperSpeed USB device number 5 using xhci_hcd
> [ 5043.887185] usb 2-2: LPM exit latency is zeroed, disabling LPM.
> [ 5043.980556] usb 2-2: New USB device found, idVendor=2b89,
> idProduct=5871, bcdDevice= 0.00
> [ 5043.980561] usb 2-2: New USB device strings: Mfr=6, Product=7, SerialNumber=3
> [ 5043.980563] usb 2-2: Product: UGREEN 35871
> [ 5043.980564] usb 2-2: Manufacturer: UGREEN 35871
> [ 5043.980564] usb 2-2: SerialNumber: PRODUCT
> [ 5044.166844] hid-generic 0003:2B89:5871.0007: hiddev99,hidraw6: USB
> HID v1.11 Device [UGREEN 35871 UGREEN 35871] on
> usb-0000:0b:00.0-2/input4
> [ 5044.188946] videodev: Linux video capture interface: v2.00
> [ 5044.207601] uvcvideo 2-2:1.1: Unknown video format
> 30313050-0000-0010-8000-00aa00389b71
> [ 5044.207606] uvcvideo 2-2:1.0: Found UVC 1.00 device UGREEN 35871 (2b89:5871)
> [ 5044.242584] usbcore: registered new interface driver uvcvideo
> 
> /:  Bus 002.Port 001: Dev 001, Class=root_hub, Driver=xhci_hcd/5p, 20000M/x2
>     |__ Port 002: Dev 005, If 0, Class=Video, Driver=uvcvideo, 5000M
>     |__ Port 002: Dev 005, If 1, Class=Video, Driver=uvcvideo, 5000M
>     |__ Port 002: Dev 005, If 2, Class=Audio, Driver=snd-usb-audio, 5000M
>     |__ Port 002: Dev 005, If 3, Class=Audio, Driver=snd-usb-audio, 5000M
>     |__ Port 002: Dev 005, If 4, Class=Human Interface Device,
> Driver=usbhid, 5000M
> 
> 
> - with patch
> [   51.913978] usb 6-1: new SuperSpeed Plus Gen 2x1 USB device number
> 3 using xhci_hcd
> [   52.181717] usb 6-1: New USB device found, idVendor=2b89,
> idProduct=5871, bcdDevice= 0.00
> [   52.181721] usb 6-1: New USB device strings: Mfr=6, Product=7, SerialNumber=3
> [   52.181724] usb 6-1: Product: UGREEN 35871
> [   52.181726] usb 6-1: Manufacturer: UGREEN 35871
> [   52.181728] usb 6-1: SerialNumber: PRODUCT
> [   52.284659] uvcvideo 6-1:1.1: Unknown video format
> 30313050-0000-0010-8000-00aa00389b71
> [   52.284666] uvcvideo 6-1:1.0: Found UVC 1.00 device UGREEN 35871 (2b89:5871)
> [   52.475086] hid-generic 0003:2B89:5871.000A: hiddev100,hidraw6: USB
> HID v1.11 Device [UGREEN 35871 UGREEN 35871] on
> usb-0000:0e:00.3-1/input4
> 
> /:  Bus 006.Port 001: Dev 001, Class=root_hub, Driver=xhci_hcd/4p, 10000M
>     |__ Port 001: Dev 003, If 0, Class=Video, Driver=uvcvideo, 10000M
>     |__ Port 001: Dev 003, If 1, Class=Video, Driver=uvcvideo, 10000M
>     |__ Port 001: Dev 003, If 2, Class=Audio, Driver=snd-usb-audio, 10000M
>     |__ Port 001: Dev 003, If 3, Class=Audio, Driver=snd-usb-audio, 10000M
>     |__ Port 001: Dev 003, If 4, Class=Human Interface Device,
> Driver=usbhid, 10000M
> 
> 
> If more debug tests are required, please let me know how to proceed.

If you run `lsusb -v` you will read the BOS values, and then look at the
kernel to see if it has issues after that.

> --------------------------------
> 
> Regarding the Signed‑off‑by line, I would like to use my public
> content‑creator alias rather than my personal identity. Could you
> advise how to do this while remaining compliant with the DCO?

Sorry, I can't do that as I do not know who this is.

greg k-h


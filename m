Return-Path: <linux-usb+bounces-33112-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yM1SMAs+hGk71wMAu9opvQ
	(envelope-from <linux-usb+bounces-33112-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 05 Feb 2026 07:51:55 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 39ECBEF1DC
	for <lists+linux-usb@lfdr.de>; Thu, 05 Feb 2026 07:51:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C8277301DC08
	for <lists+linux-usb@lfdr.de>; Thu,  5 Feb 2026 06:51:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3827B34F47D;
	Thu,  5 Feb 2026 06:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="MW4gdc+8"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBC11254841;
	Thu,  5 Feb 2026 06:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770274280; cv=none; b=TgiHAauMLw/Q1xgTB/txrDX+AWVuRethpKLp8eGNzYsgBcQdA4vYWTjOkKo6RX8Pt1hCSiv0IOUFqSp/wc+EZeIm26tPNRjQpnjyYp6Xz0XpQBOjJpEs2jw9ZpcALnpT8HlyxlH6OOpHnl1XXUC1LWCcXqQjP7DcwvDVLjpaRrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770274280; c=relaxed/simple;
	bh=z7W04XDtT+1SmPTv3hBQSA3mdG3rPMZtcGhUABEJSoQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jJ5F2wC3UcFMGSHA8UqqZl1RF6nT8u7Q12cIXcnecY6kUh3JJelk0hHrAPIH/s8M6+UfudWaiK19K06ikNaecNOle0N6UYcKunbLVLGsWa2bI6SZwjjenmxyEINha7q5/c/paO8PbQk7VDhb6/FsChcjEmo6d3n5pXdR1hEMXys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=MW4gdc+8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8708C4CEF7;
	Thu,  5 Feb 2026 06:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770274280;
	bh=z7W04XDtT+1SmPTv3hBQSA3mdG3rPMZtcGhUABEJSoQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MW4gdc+8l7j95xx2nSRGKyaMBSaM2TJaHYE1pALOz/AusowF5AH+S5h28czQgXf3r
	 ZvoAeBkCCrd6FkH5NNP8egfOvCAuEbIX/SwcF9Blmt6Dz7oVeKC/s7VJ/ObR7LtrfO
	 dCMfxRwW6GX0g0kP688CKUswtJFxv+KU3dUI+zo4=
Date: Thu, 5 Feb 2026 07:51:17 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: A1RM4X <dev@a1rm4x.com>
Cc: linux-usb@vger.kernel.org, limiao@kylinos.cn, oneukum@suse.com,
	huanglei@kylinos.cn, lijiayi@kylinos.cn,
	johannes.bruederl@gmail.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: add QUIRK_NO_BOS for several devices
Message-ID: <2026020527-ivy-gathering-93a7@gregkh>
References: <20260204032938.61553-1-dev@a1rm4x.com>
 <2026020457-distrust-vision-e5de@gregkh>
 <CACy+XB-Z26Bx2Zb4omoRq00L4tTAQxe4QWSQ1f=eFMryqb8Ksw@mail.gmail.com>
 <2026020419-drilling-area-0c1f@gregkh>
 <CACy+XB-f-51xGpNQFCSm5pE_momTQLu=BaZggHYU1DiDmFX=ug@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACy+XB-f-51xGpNQFCSm5pE_momTQLu=BaZggHYU1DiDmFX=ug@mail.gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-33112-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kylinos.cn,suse.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linuxfoundation.org:dkim]
X-Rspamd-Queue-Id: 39ECBEF1DC
X-Rspamd-Action: no action

On Wed, Feb 04, 2026 at 02:51:35PM -0500, A1RM4X wrote:
> I added a clean patch to this email.

Thanks, but again, we can not take attached patches :(

> I own the devices mentioned in the patch. For all 3 devices, the USB
> port speed (10Gbps) is reached on Windows, they just negotiate 5Gbps
> speed on Linux. After applying the patch, as mentioned earlier, they
> reach the correct speed. I just did a 3 hours record on the Avermedia
> on Linux and it works as expected with a patched kernel.

Ok, it looks like there is a very broken USB controller chip out there
in all of these devices.

> Here is an updated dmesg output after following your instructions on
> the current kernel master:
> 
> [  701.425991] usb 2-2: new SuperSpeed Plus Gen 2x1 USB device number
> 2 using xhci_hcd
> [  706.735379] usb 2-2: unable to get BOS descriptor or descriptor too short
> [  706.735390] usb 2-2: unable to read config index 0 descriptor/start: -19
> [  706.920395] usb 2-2: Device not responding to setup address.
> [  707.127380] usb 2-2: Device not responding to setup address.
> [  707.335050] usb 2-2: device not accepting address 3, error -71
> [  707.338647] usb usb2-port2: attempt power cycle
> [  708.656278] usb 2-2: new SuperSpeed USB device number 5 using xhci_hcd
> [  708.859889] usb 2-2: LPM exit latency is zeroed, disabling LPM.
> [  708.955893] usb 2-2: New USB device found, idVendor=2b89,
> idProduct=5871, bcdDevice= 0.00
> [  708.955895] usb 2-2: New USB device strings: Mfr=6, Product=7, SerialNumber=3
> [  708.955896] usb 2-2: Product: UGREEN 35871
> [  708.955897] usb 2-2: Manufacturer: UGREEN 35871
> [  708.955897] usb 2-2: SerialNumber: PRODUCT
> [  709.142354] hid-generic 0003:2B89:5871.0007: hiddev99,hidraw6: USB
> HID v1.11 Device [UGREEN 35871 UGREEN 35871] on
> usb-0000:0b:00.0-2/input4
> [  709.165518] videodev: Linux video capture interface: v2.00
> [  709.187290] uvcvideo 2-2:1.1: Unknown video format
> 30313050-0000-0010-8000-00aa00389b71
> [  709.187297] uvcvideo 2-2:1.0: Found UVC 1.00 device UGREEN 35871 (2b89:5871)
> [  709.224374] usbcore: registered new interface driver uvcvideo

Sorry, I wasn't specific.  What happens with your patch applied, and
THEN you run 'lsusb -v' on the system?  Does the devices reset then?

> Regarding the Signed‑off‑by line, if I can't sign it with my content
> creator name, please sign it yourself. Whether I put my name on this
> patch is not important, what is important is the kernel to function
> properly with those devices.

For obvious reasons, we can't sign off on other people's patches.  But
we can rewrite them, I'll go do that later today, and give you
reported-by credit.

Note, for the future, if you wish to contribute kernel patches, please
read the documentation section about how to write changelog text, as
what you provided we couldn't take as-is.

thanks,

greg k-h


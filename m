Return-Path: <linux-usb+bounces-37173-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id W55dMSqz/mnLvAAAu9opvQ
	(envelope-from <linux-usb+bounces-37173-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 09 May 2026 06:08:10 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id AAADA4FDFEE
	for <lists+linux-usb@lfdr.de>; Sat, 09 May 2026 06:08:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 94828300B8FA
	for <lists+linux-usb@lfdr.de>; Sat,  9 May 2026 04:08:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1840037AA9C;
	Sat,  9 May 2026 04:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="NVyHQRer"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D1E1231A23
	for <linux-usb@vger.kernel.org>; Sat,  9 May 2026 04:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778299682; cv=none; b=CYTXJFBiE2TSek46bHWArZUpRZUjEZk4cvKFKy9FtiaQBfyMknBgOwgHswcZf8uhaljAgm2F4Ang5iTPKHqZpmQnjX3zR/kf9QonYYhfJHP1gch6GJkUhdWfUybNmLeijeFMBpTiiggv/TJuThbYdrJ4oXmRE4K86aS7quk6Xag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778299682; c=relaxed/simple;
	bh=eeqYs9vQXAlik6EXrIhMJR6dxwpBfUGq83wk67HiQGA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gHhI9UTJ7TTPSQSbx/2CKqMRiCCsi0A/9qoRQZ+Q32rQXNOf6n4clsUpfGnR3cadFextQp/tG1bfagTYbuhUGA/xtKmu9+m6V2t3IW4MZdaa/2njwiWxaf2BwrtwkUIgxBp1x40oZtj4+660bLTa833r6emC0b47YvLmzRltF4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=NVyHQRer; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BECABC2BCB2;
	Sat,  9 May 2026 04:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778299682;
	bh=eeqYs9vQXAlik6EXrIhMJR6dxwpBfUGq83wk67HiQGA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NVyHQRer/9zPScvQPuRfUSRTon1UOs1BCpM7nHRy55yUprJghOtlas6PMGpQCHL7C
	 baRpG5ZgmQyTzyk8Tj3M1gRry5XxGPKCbSD8jDRwcARxonhhamHZix/Nm/3E+xg/k1
	 adw7YMujPts6Ic5MIuRe+AwEJdA3gWr32a57a8N0=
Date: Sat, 9 May 2026 06:07:19 +0200
From: Gregkh <gregkh@linuxfoundation.org>
To: c2mismo <c2mismo@tuta.io>
Cc: Linux Usb <linux-usb@vger.kernel.org>
Subject: Re: USB: Lexar E300 21c4:b083 =?utf-8?Q?fa?=
 =?utf-8?Q?ils_SuperSpeedPlus_negotiation_due_to_missing_BOS_descriptor_?=
 =?utf-8?B?4oCU?= request for NO_BOS quirk
Message-ID: <2026050910-shopping-perceive-b23a@gregkh>
References: <Os7vNaR--F-9@tuta.io>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Os7vNaR--F-9@tuta.io>
X-Rspamd-Queue-Id: AAADA4FDFEE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-37173-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Fri, May 08, 2026 at 09:18:22PM +0200, c2mismo wrote:
> 
> Dear USB subsystem maintainers,
> 
> I have a Lexar E300 M.2 SSD enclosure (idVendor=0x21c4, idProduct=0xb083)
> that supports USB 3.2 Gen 2 (10 Gbps). Under Linux it always negotiates
> down to 5 Gbps, while on Windows the same hardware (cable, port) works
> correctly at 10 Gbps (CrystalDiskMark ~1087 MB/s vs ~450 MB/s on Linux).
> 
> The kernel log shows that the device initially attempts SuperSpeed Plus
> (Gen 2x1) but fails to provide a valid BOS descriptor, causing an error
> -71 and a forced fallback to SuperSpeed (5 Gbps):
> 
> [  179.146227] usb 2-1: new SuperSpeed Plus Gen 2x1 USB device number 4 using xhci_hcd
> [  182.237405] usb 2-1: USB disconnect, device number 4
> [  182.420843] sd 12:0:0:0: [sda] Synchronize Cache(10) failed: Result: hostbyte=DID_ERROR driverbyte=DRIVER_OK
> [  182.552343] usb usb2-port1: config error
> [  183.131966] usb 2-1: new SuperSpeed USB device number 5 using xhci_hcd
> 
> "lsusb -t" always reports the device at 5000M, even when connected to a
> 20 Gbps port.
> 
> I have reliable reports that other users on Ubuntu experience the
> identical issue with the same enclosure.
> 
> The likely cause is that the enclosure's firmware does not handle the
> BOS descriptor request correctly. The fix is to mark it with the
> USB_QUIRK_NO_BOS flag, already existsting in previous kernels
> (since commit 7b2f6c5b1b1c, "USB: core: Add quirk for devices that
> can't handle BOS"). That quirk would prevent the kernel from trying to
> read the BOS descriptor and thus avoid the downgrade.
> 
> i did try to add the following entry to drivers/usb/core/quirks.c
> in the usb_quirk_list[]:
> 
> { USB_DEVICE(0x21c4, 0xb083), .driver_info = USB_QUIRK_NO_BOS },
> 
> I am running Arch Linux with kernel 7.0.3 (in the recent version does not contain
> the NO_BOS definition in its source),

7.0.3 has that quirk flag, so this should work.

> so I have been unable to test the
> patch myself. However, I am fully available to test any patch or
> directly apply and verify a fix if a developer can provide one. I can
> also provide additional debug output if needed.

Can you make the patch so you get full credit for it?

thanks,

greg k-h


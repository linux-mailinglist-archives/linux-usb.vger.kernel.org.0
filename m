Return-Path: <linux-usb+bounces-34819-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yQvUOGOOtmlkDQEAu9opvQ
	(envelope-from <linux-usb+bounces-34819-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 15 Mar 2026 11:48:03 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC012906FD
	for <lists+linux-usb@lfdr.de>; Sun, 15 Mar 2026 11:48:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0FF7B301DE38
	for <lists+linux-usb@lfdr.de>; Sun, 15 Mar 2026 10:47:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64ECA25B2FA;
	Sun, 15 Mar 2026 10:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="epshFetv"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D63A743ABC;
	Sun, 15 Mar 2026 10:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773571676; cv=none; b=PfBJkLfz+kWPfgdQOVuPvD7Vsp/kSCHJA14OZZdR7qvhuO0X/Sh574eBJhY4lpMlhnoBkwxyRvUWKpUwd+fRTlR7k1Vwp+lPbi+NflJe1g2BWw0JUmJZkYgAsE7YHtrMRY3k3PZtaHGPXwrtbr+kf40c4x5GVxIWrE9aabhfgcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773571676; c=relaxed/simple;
	bh=6OB8hw1iCjXbkPEXXrNGzAsUyk9N2zHKtX2vlsZ/FCg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M1JFl3KP1mXdprxFIq88HYckITSIguhVeUTg83lUa03/9uTRr/xWfO0dGJrX2bbO1yhMK6yzTNrRgOt81b9qjESAq1zRHujPVFeHpE+Odsj/+AnkIBpfvAbfXQoYVMtEr7yPOjBrMRvu8DkrEA+XCuhsKnW78HaiPBZVpItgam0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=epshFetv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7EBFC4CEF7;
	Sun, 15 Mar 2026 10:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773571675;
	bh=6OB8hw1iCjXbkPEXXrNGzAsUyk9N2zHKtX2vlsZ/FCg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=epshFetvEZHekRB3PlaCnGlhdFpK909kXOoHjLsiBN+C7pRxZwZrtWokwUtuPantf
	 S0hW5uMdxdY8BquQ2sVfHL3dFDv5lntZ+3id1wgYwuab+N/qAfEcdC1TviJ32hX6wy
	 Q0rH3auTun1YEvIEzJ0nO/xhnGUR2jLxuyH5jDt4=
Date: Sun, 15 Mar 2026 11:47:36 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Bence =?iso-8859-1?B?Q3Pza+Fz?= <bence98@sch.bme.hu>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB: core: Use `krealloc()` in `usb_cache_string()`
Message-ID: <2026031547-carve-resale-68dc@gregkh>
References: <20260312-usb-krealloc-v1-1-f76b92b92402@sch.bme.hu>
 <2026031209-shawl-unshackle-f4eb@gregkh>
 <d3da22c8-bef2-49cf-b4fe-0936ef8e42db@sch.bme.hu>
 <2026031500-speak-lying-2626@gregkh>
 <7785fe26-ecdc-4392-a04d-551c75276abf@sch.bme.hu>
 <45afec49-3fe7-43c7-b92b-e6c3e4aca3d3@sch.bme.hu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <45afec49-3fe7-43c7-b92b-e6c3e4aca3d3@sch.bme.hu>
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34819-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3EC012906FD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Mar 15, 2026 at 11:34:52AM +0100, Bence Csókás wrote:
> 
> 
> On 3/15/26 10:59, Bence Csókás wrote:
> > Hi,
> > 
> > On 3/15/26 10:47, Greg Kroah-Hartman wrote:
> > > On Sun, Mar 15, 2026 at 10:40:48AM +0100, Bence Csókás wrote:
> > > > > Also, how was this tested?
> > > > 
> > > > I just compiled and booted it on my Arch box (with the original vendor
> > > > config), an AthlonII X2 PC. I'm now typing this mail on a USB
> > > > keyboard and
> > > > mouse under Plasma, running this kernel :) I also plugged in a pendrive,
> > > > mounted it, `ls`'d the mount, unmounted, unplugged, and did this 2 more
> > > > times.
> > > > 
> > > > I realize I should probably put this info under the dashes. I'll
> > > > prepare a
> > > > v2.
> > > 
> > > Try looking at the USB strings in the device, as that's the path here
> > > that is exercised.  Just using the device doesn't actually grab them
> > > from the descriptor table.
> > 
> > Sure.
> > 
> >    $ sudo lsusb -vvv | grep iProduct
> >    can't get debug descriptor: Resource temporarily unavailable
> >      iProduct                2 OHCI PCI host controller
> >      iProduct                2 HP USB Smart Card Keyboard
> >    can't get device qualifier: Resource temporarily unavailable
> >    can't get debug descriptor: Resource temporarily unavailable
> >      iProduct                2 USB OPTICAL MOUSE
> >    can't get debug descriptor: Resource temporarily unavailable
> >    can't get device qualifier: Resource temporarily unavailable
> >    can't get debug descriptor: Resource temporarily unavailable
> >      iProduct                2 EHCI Host Controller
> >      iProduct                2 EHCI Host Controller
> >    can't get device qualifier: Resource temporarily unavailable
> >    can't get debug descriptor: Resource temporarily unavailable
> >    can't get debug descriptor: Resource temporarily unavailable
> >      iProduct                2 Disk 2.0
> >      iProduct                2 EHCI Host Controller
> >    can't get device qualifier: Resource temporarily unavailable
> >    can't get debug descriptor: Resource temporarily unavailable
> >    can't get debug descriptor: Resource temporarily unavailable
> >      iProduct                2 OHCI PCI host controller
> >      iProduct                2 OHCI PCI host controller
> >    can't get debug descriptor: Resource temporarily unavailable
> >    can't get debug descriptor: Resource temporarily unavailable
> >      iProduct                2 OHCI PCI host controller
> > 
> > Are these -EAGAINs cause for concern?
> 
> It happens with the vendor kernel (6.19.8-arch1-1) too, so it's probably
> just some weirdness in my HW...

You can't get the debug descriptor when a driver is bound to the device.
Also look at the iManufacturer string, that should be coming from the
device (except for the root hub, that descriptor comes from the kernel.)

thanks,

greg k-h


Return-Path: <linux-usb+bounces-31667-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 51AACCD4D92
	for <lists+linux-usb@lfdr.de>; Mon, 22 Dec 2025 08:13:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 46BED3007198
	for <lists+linux-usb@lfdr.de>; Mon, 22 Dec 2025 07:13:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A557C3081B0;
	Mon, 22 Dec 2025 07:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="CE2SwVJU"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2288A3043C8;
	Mon, 22 Dec 2025 07:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766387605; cv=none; b=im/J918ab+KMmL8x14KudZQ7wssYx2CTwNflNGuWxGWzfTcS2OvxLm+mpRrDadBexIKDEgz0Tlp250izu/Dx6hJOIcVr1nAgKm9UcBJ+4sgLsVv0L649eMUg9tbS2A09pRfQeGcYdgZljYuE7JBcQdSAcaIVlgFB/OIJ3xgBKyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766387605; c=relaxed/simple;
	bh=pg6rY5Y7D/4OA30jcmhKNr9+sB0NAscY/FSBSvCT/zI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bt8LOfHORtTPeBskStOCMfyKKkgu4m4vX5vF+Jua1UcTR0NQx7cOEDArREvrLEk3nKs5Ym0zjIOawCAdWEDtEJ90uph2wWGSHIZNWlEcPrft9yEOlp11pCldRqRyARJSE5neQRLjAHrfXLphtI6FWHHdiD3C4jMYerEFgZjY5L4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=CE2SwVJU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21DD8C4CEF1;
	Mon, 22 Dec 2025 07:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1766387604;
	bh=pg6rY5Y7D/4OA30jcmhKNr9+sB0NAscY/FSBSvCT/zI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CE2SwVJUDzuX4QEJ64gmB6AdSDVg66tCjgbY7dQpLAxPZXi4GLF2emVnLaVFF6o0k
	 SaD4xAt9xRw9Y2E7DT3qS/8TtTL4GqsDVBo6a0fyWNpeLH558HAs7n/uUPNnn89PjN
	 leuosDL79024FQ7IH+HAH6lkBBtGz+QTCQ3m4YIg=
Date: Mon, 22 Dec 2025 08:13:21 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Lee Jones <lee@kernel.org>
Cc: Michal Pecio <michal.pecio@gmail.com>,
	=?utf-8?B?6IOh6L+e5Yuk?= <hulianqin@vivo.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>,
	Mathias Nyman <mathias.nyman@intel.com>,
	Sarah Sharp <sarah.a.sharp@linux.intel.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] usb: xhci: check Null pointer in segment alloc
Message-ID: <2025122253-stopper-tweed-6e68@gregkh>
References: <TYUPR06MB6217F5AA7DA1E43A567CBA04D2A9A@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <4935bdf5-4d36-45c3-9bcd-9d14606dd54e@linux.intel.com>
 <TYUPR06MB6217AC2CE5431DC9B3956FE7D2A9A@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <20251220141510.1bc1ef19.michal.pecio@gmail.com>
 <20251222064252.GA1196800@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251222064252.GA1196800@google.com>

On Mon, Dec 22, 2025 at 06:42:52AM +0000, Lee Jones wrote:
> On Sat, 20 Dec 2025, Michal Pecio wrote:
> 
> > Hi,
> > 
> > On Fri, 19 Dec 2025 15:53:08 +0000, 胡连勤 wrote:
> > > [ 4021.987665][  T332] Call trace:
> > > [ 4021.987668][  T332]  dma_pool_alloc+0x3c/0x248
> > > [ 4021.987676][  T332]  xhci_segment_alloc+0x9c/0x184
> > > [ 4021.987682][  T332]  xhci_alloc_segments_for_ring+0xcc/0x1cc
> > > [ 4021.987688][  T332]  xhci_ring_alloc+0xc4/0x1a8
> > > [ 4021.987693][  T332]  xhci_endpoint_init+0x36c/0x4ac
> > > [ 4021.987698][  T332]  xhci_add_endpoint+0x18c/0x2a4
> > > [ 4021.987702][  T332]  usb_hcd_alloc_bandwidth+0x384/0x3e4
> > > [ 4021.987711][  T332]  usb_set_interface+0x144/0x510
> > > [ 4021.987716][  T332]  usb_reset_and_verify_device+0x248/0x5fc
> > > [ 4021.987723][  T332]  usb_port_resume+0x580/0x700
> > > [ 4021.987730][  T332]  usb_generic_driver_resume+0x24/0x5c
> > > [ 4021.987735][  T332]  usb_resume_both+0x104/0x32c
> > > [ 4021.987740][  T332]  usb_runtime_resume+0x18/0x28
> > > [ 4021.987746][  T332]  __rpm_callback+0x94/0x3d4
> > > [ 4021.987754][  T332]  rpm_resume+0x3f8/0x5fc
> > > [ 4021.987762][  T332]  rpm_resume+0x1fc/0x5fc
> > > [ 4021.987769][  T332]  __pm_runtime_resume+0x4c/0x90
> > > [ 4021.987777][  T332]  usb_autopm_get_interface+0x20/0x4c
> > > [ 4021.987783][  T332]  snd_usb_autoresume+0x68/0x124
> > > [ 4021.987792][  T332]  suspend_resume_store+0x2a0/0x2b4 [dwc3_msm a4b7997a2e35cfe1a4a429762003b34dd4e85076]
> > 
> > This looks like some out of tree driver tries to resume a sound device,
> > and apparently it's doing it while xhci_hcd isn't ready, perhaps during
> > the power_lost branch in xhci_resume() after full system suspend.
> > 
> > I suppose dynamic debug could show better what's going on:
> > echo 'module usbcore +p' >/proc/dynamic_debug/control
> > echo 'module xhci_hcd +p' >/proc/dynamic_debug/control
> > 
> > If my guess is right then USB core is failing to prevent device resume
> > during HC resume, but IDK whether it's supposed to prevent that or if
> > the out of tree driver simply shouldn't be trying such things.
> 
> Lower-level functionality shouldn't be able to attack / fuzz core-code
> in this way.  Shouldn't the core be resistant to any possible mistakes
> or a lack of education exhibited by it's consumers?

Not always, we rely on drivers "doing the right thing" in almost all of
our in-kernel apis because we have access to the source of those drivers
to fix them to do the right thing.

> An API that insists on its users exercising care, knowledge and
> cognisance sounds fragile and vulnerable.

Fragile yes, vulnerable no.  Let's fix the fragility then, but as has
been pointed out in this thread, we don't know the root cause, and I
don't even think this "fix" would do the right thing anyway.

thanks,

greg k-h


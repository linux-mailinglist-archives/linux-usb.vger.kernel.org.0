Return-Path: <linux-usb+bounces-31666-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 52805CD4D10
	for <lists+linux-usb@lfdr.de>; Mon, 22 Dec 2025 07:43:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ECECF3005281
	for <lists+linux-usb@lfdr.de>; Mon, 22 Dec 2025 06:43:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3354E327C1F;
	Mon, 22 Dec 2025 06:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kdKl1nBG"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A92961A9F87;
	Mon, 22 Dec 2025 06:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766385780; cv=none; b=Ca0s/xvciGrGDOWvRhfduFPB8WRkMIF+ccCc9T5V1CVc8YtJlYnpoZD0eZl9kEbt/ud0EUnAVZ4xBKnf3QBZQVkqLQBIzymT8blGEBot28Xi5UB8pUK7yiT97jNY/D4ou96TthCXlN7KIbY7WidWolKOqSKJpguaY1QC7/FllM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766385780; c=relaxed/simple;
	bh=JLEGQdVYOKssTCU+pTswTVxi5+MXygtSvz56nlBSlGk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o5cv+Y3rXqrRrCAcG93oljt3t1q37dH5lnDzjDiLz52utHRe63X+dlZX0hB+s71TZnHIpte5gaoeNJDxwxnqjpCmvRuoKEe3B3myry8wcC0MovwiubApG9D0niMcYHVc20pDQQ1kfEkdSMT2hg8LX4eUZHp6R2jNMsbf6j/4eaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kdKl1nBG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47068C4CEF1;
	Mon, 22 Dec 2025 06:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766385778;
	bh=JLEGQdVYOKssTCU+pTswTVxi5+MXygtSvz56nlBSlGk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kdKl1nBGhiJiiC3fU2hViaTxEEk8FWqCI8Q8LzMxLukgB4qa+nsIm8pmXPvH8LULr
	 b2/0CVWYw7EcFnElRtMFUHQbrKCEkA6k8cd07dz+1OjSLuUHQIEtxo32Ekil2YMMrY
	 XHDj8vYGqij46Nb5do6aJaLKKn7v4CbJaJAVC/YZkaHyUNm/XLcdWnaV0roznM3Dg0
	 wdk60JKg6/KP0fzLdpdfu23YOMzi/3QUpz+lNfIk9mwkuApCkbFEIsVYAsAYZlkivF
	 royaZ64oSKF4wpR/mC/xp7MEll5JIv7nhQQe7atePszZU6FpfQECQKDAPMhRTxJPNu
	 L+kI/AWliqNfg==
Date: Mon, 22 Dec 2025 06:42:52 +0000
From: Lee Jones <lee@kernel.org>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: =?utf-8?B?6IOh6L+e5Yuk?= <hulianqin@vivo.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>,
	Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sarah Sharp <sarah.a.sharp@linux.intel.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] usb: xhci: check Null pointer in segment alloc
Message-ID: <20251222064252.GA1196800@google.com>
References: <TYUPR06MB6217F5AA7DA1E43A567CBA04D2A9A@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <4935bdf5-4d36-45c3-9bcd-9d14606dd54e@linux.intel.com>
 <TYUPR06MB6217AC2CE5431DC9B3956FE7D2A9A@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <20251220141510.1bc1ef19.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251220141510.1bc1ef19.michal.pecio@gmail.com>

On Sat, 20 Dec 2025, Michal Pecio wrote:

> Hi,
> 
> On Fri, 19 Dec 2025 15:53:08 +0000, 胡连勤 wrote:
> > [ 4021.987665][  T332] Call trace:
> > [ 4021.987668][  T332]  dma_pool_alloc+0x3c/0x248
> > [ 4021.987676][  T332]  xhci_segment_alloc+0x9c/0x184
> > [ 4021.987682][  T332]  xhci_alloc_segments_for_ring+0xcc/0x1cc
> > [ 4021.987688][  T332]  xhci_ring_alloc+0xc4/0x1a8
> > [ 4021.987693][  T332]  xhci_endpoint_init+0x36c/0x4ac
> > [ 4021.987698][  T332]  xhci_add_endpoint+0x18c/0x2a4
> > [ 4021.987702][  T332]  usb_hcd_alloc_bandwidth+0x384/0x3e4
> > [ 4021.987711][  T332]  usb_set_interface+0x144/0x510
> > [ 4021.987716][  T332]  usb_reset_and_verify_device+0x248/0x5fc
> > [ 4021.987723][  T332]  usb_port_resume+0x580/0x700
> > [ 4021.987730][  T332]  usb_generic_driver_resume+0x24/0x5c
> > [ 4021.987735][  T332]  usb_resume_both+0x104/0x32c
> > [ 4021.987740][  T332]  usb_runtime_resume+0x18/0x28
> > [ 4021.987746][  T332]  __rpm_callback+0x94/0x3d4
> > [ 4021.987754][  T332]  rpm_resume+0x3f8/0x5fc
> > [ 4021.987762][  T332]  rpm_resume+0x1fc/0x5fc
> > [ 4021.987769][  T332]  __pm_runtime_resume+0x4c/0x90
> > [ 4021.987777][  T332]  usb_autopm_get_interface+0x20/0x4c
> > [ 4021.987783][  T332]  snd_usb_autoresume+0x68/0x124
> > [ 4021.987792][  T332]  suspend_resume_store+0x2a0/0x2b4 [dwc3_msm a4b7997a2e35cfe1a4a429762003b34dd4e85076]
> 
> This looks like some out of tree driver tries to resume a sound device,
> and apparently it's doing it while xhci_hcd isn't ready, perhaps during
> the power_lost branch in xhci_resume() after full system suspend.
> 
> I suppose dynamic debug could show better what's going on:
> echo 'module usbcore +p' >/proc/dynamic_debug/control
> echo 'module xhci_hcd +p' >/proc/dynamic_debug/control
> 
> If my guess is right then USB core is failing to prevent device resume
> during HC resume, but IDK whether it's supposed to prevent that or if
> the out of tree driver simply shouldn't be trying such things.

Lower-level functionality shouldn't be able to attack / fuzz core-code
in this way.  Shouldn't the core be resistant to any possible mistakes
or a lack of education exhibited by it's consumers?  An API that insists
on its users exercising care, knowledge and cognisance sounds fragile
and vulnerable.

-- 
Lee Jones [李琼斯]


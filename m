Return-Path: <linux-usb+bounces-21272-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB88A4C16C
	for <lists+linux-usb@lfdr.de>; Mon,  3 Mar 2025 14:14:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3F4211882AEB
	for <lists+linux-usb@lfdr.de>; Mon,  3 Mar 2025 13:14:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77A9221147F;
	Mon,  3 Mar 2025 13:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f5mK2oKK"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF061CAA71
	for <linux-usb@vger.kernel.org>; Mon,  3 Mar 2025 13:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741007644; cv=none; b=Cpx1VOTJITxHV9nWBii6qyFFprM3Vgh9gThBk/gr4bey79ZBGANFv8Oe4LcvUP0x3vp1PqUHc8fGAXpse8HMazSOpfy9D6fO8mokeNSxJhprdtKTns9+w5MAzByamAvDnNDsrmPgyhx0R2YIa6Kk08S4t8none/czYiHmIXODvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741007644; c=relaxed/simple;
	bh=ipNfcPYc4m0ieY9GTUOHlv2Xx3Va368LXvhsxzRsPmY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gq8g6HodhWEBfHyk/yRej/nH85QGKIclunD6mO6mGioA+3YFmTdwo8eN/6CM75khypmpCyiX3V7IZKRDNL0x7GPO/v/1Ebr6Qg4b2KaMMDCC1/aaibdM6JnS4UK+eOJvArM6wMUhBNFWNqH8N5Wo9VQ3nCd9MMggW5ua4ayEzJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f5mK2oKK; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741007643; x=1772543643;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ipNfcPYc4m0ieY9GTUOHlv2Xx3Va368LXvhsxzRsPmY=;
  b=f5mK2oKKFLGZgJCECo0SlIEBYK8v6nFUBc+xSqCQ2r6k2zPUj4b9uWve
   9ca27Zr/RQSyxaatt10wVEQIx+hITsrr71OaLtf0FzGKJa9V/V8z2N7AD
   8AQrQu6vcCKufGKlaMFDB2zVzZvnodgkrWxrrJ8vV72TV7/YjZCfO4xjg
   fptg2FqbDnUQuMU27H6NH/LqpDS2T8oOFEK9nPcbvfvgYTzX7HQFK91sZ
   j3hV8vjFfaTFHev6nLT21z6DzOTl8xk0X5Ach1YCZCklytK7/hrZe+4+h
   BeHT/nB8Y79VIzvBbHUf3Y1f2dYZQsE8+yqW/8uqmwqE8Pq+1uko8H42N
   w==;
X-CSE-ConnectionGUID: xjq7ULyFTnWcoBYe2foEUQ==
X-CSE-MsgGUID: ddwcUsVDTaepVp90G+t0DA==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="41793695"
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; 
   d="scan'208";a="41793695"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 05:14:02 -0800
X-CSE-ConnectionGUID: /YQW8FSZR56xzbuePoQEyA==
X-CSE-MsgGUID: cFynID4kSAKjIL5YHhx6nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; 
   d="scan'208";a="118699706"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa009.fm.intel.com with ESMTP; 03 Mar 2025 05:14:00 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 7847F125; Mon, 03 Mar 2025 15:13:59 +0200 (EET)
Date: Mon, 3 Mar 2025 15:13:59 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Kenneth Crudup <kenny@panix.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: So, I had to revert d6d458d42e1 ("Handle DisplayPort tunnel
 activation asynchronously") too, to stop my resume crashes
Message-ID: <20250303131359.GV3713119@black.fi.intel.com>
References: <8e175721-806f-45d6-892a-bd3356af80c9@panix.com>
 <bd731ba2-5509-44e6-a419-814ef5329bbd@panix.com>
 <992dba2a-4919-4f76-ac48-986792d5843c@panix.com>
 <2b55ab09-8389-4916-8acc-abc73f234d21@panix.com>
 <20250303104618.GP3713119@black.fi.intel.com>
 <f31309e4-6ce5-48cf-910e-cd74f818aac8@panix.com>
 <20250303112149.GS3713119@black.fi.intel.com>
 <d56fcd99-433e-4670-8388-7035812a78d9@panix.com>
 <20250303115329.GT3713119@black.fi.intel.com>
 <68cec31a-0132-43bd-8a61-29e0ac23b326@panix.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <68cec31a-0132-43bd-8a61-29e0ac23b326@panix.com>

On Mon, Mar 03, 2025 at 04:33:08AM -0800, Kenneth Crudup wrote:
> 
> OK, I may not be explaining the history properly, so more background:
> 
> (I tend to run Linus' master that I pull every few days, partially 'cause I
> like to see all the new fixes and features, and partially 'cause over the
> years I'll stumble over bugs and help the subsystems' Maintainer(s) fix the
> problems.)
> 
> Anyway, late last year I'd notice lately (it wasn't happening before) that
> once I'd get to the office, my laptop would be hard-hung on resume, which I
> eventually traced back to having my NVMe adaptor connected to my TB Dock
> when I suspended/hibernated. I'd started to try to bisect it, but couldn't
> find a good starting point (or one too far back) and would have to give up
> 'cause I'd run out of time. However, I'd mention the issue in the mailing
> lists, hoping for a solution- and that's when you'd discovered 9d573d19.
> 
> But between your NVMe discovery (and by this time I was mostly :( careful
> about disconnecting the NVMe adaptor before suspend) and sometime around the
> beginning of the year I was also getting occasional hard-hangs on resume
> even if I hadn't had the NVMe adaptor connected on suspend. I'd seen where
> the pstore dumps were pointing to the display driver, so I'd switched back
> to the i915 from the xe driver, but that hadn't fixed it either. In the
> meantime, having seen one of the OOPses be in __tb_path_deactivate_hop(),
> I'd dropped some printks (actually "tb_port_info()", I think) at various
> points printing the line# so I could try and tell approximately where the
> crash occurred (yeah, I know I need to get my ksymoops up and running :) ).
> I hadn't made the correlation yet between having an external monitor
> connected or not, and having seen a number of xe/i915/dp/Thunderbolt changes
> come thru, was both hoping for the fix to be reported and corrected, or try
> and find time and find out why it was happening via my tracing.
> 
> So in late February we'd had two failure modes for me in Linus' master:
> - 9d573d19 (NVMe adaptor connected on suspend causing an OOPS on resume)
> - d6d458d4 (OOPS if external USB-C DP monitor connected on resume)
> 
> I couldn't/didn't recognize the 2nd issue fully until you'd discovered the
> cause of the first one.
> 
> At home I have a Samsung Odyssey monitor connected to a USB-C-to-DP 2.1
> cable, to a TB port on a CalDigit TB4 dock.
> 
> My travel bag has a generic Chinese USB-C DP tunneling portable monitor
> which is usually connected to a Plugable TB hub.
> 
> In any case, the resume failures happen with either one.

Okay thanks for elaborating that.

> On 3/3/25 03:53, Mika Westerberg wrote:
> 
> > I thought the system resumes fine after you reverted the other commit
> > (9d573d19), no? Just you don't get display tunneled so for example if you
> > login over ethernet (ssh) you should still be able to get full dmesg.
> 
> Nah, it usually hard hangs if a monitor is connected when I resume; has to
> be power-cycled at that point.
> 
> > We can actually take PCIe out of the equation so that you ask "boltctl" to
> > forget the device temporarily (or from the GNOME settings "privacy and
> > security" -> "Thunderbolt" then "forget device" for each).  This means your
> > docks do not work fully but display should and then we hopefully can get
> > the dmesg.
> 
> Well my topology is almost always Laptop -> Dock -> Monitor .

Okay.

> This workflow came about ironically enough 'cause my client has given me a
> MS Surface (Windows) machine with only one TB/USB-C port, and since I will
> physically switch to using my own machine, to minimize setup changes I just
> use the "one cable for all" approach (i.e., never connecting the external
> monitor to the other TB port on my XPS-9320).
> 
> Oh and the failure mode for d6d458d4 is ALWAYS this, and always(?) from line
> 436/7 of ".../drivers/thunderbolt/path.c", a call to tb_port_write() :

That's also weird because we don't do anything for DP tunnels on resume so
what this code is doing is to clean up for the tunnels left by the boot
kernel (since this is hibernate). The code added by d6d458d4 is not run
yet, only later on when we get hotplugs from the connected device DP OUT
adapter. I will see if I can reproduce this on my setup, next.


Return-Path: <linux-usb+bounces-29990-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4BFC2A1ED
	for <lists+linux-usb@lfdr.de>; Mon, 03 Nov 2025 06:59:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8FB7B3A94E3
	for <lists+linux-usb@lfdr.de>; Mon,  3 Nov 2025 05:57:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D102A28D82F;
	Mon,  3 Nov 2025 05:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SQaTP2Lb"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59ACF285CAE
	for <linux-usb@vger.kernel.org>; Mon,  3 Nov 2025 05:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762149427; cv=none; b=a7KdhqBnUdnIYhaQt8oRNzF51p5/7yFKx2F4mz4n/ioImrSZ+B8sdBJX7pU0iZvhLJDQjr6Q8zYZPpYdOr1THT4P3NWn4C3EkUI1X/kP6bEp/70u+a+qwFSU0C/YNSbV8m+/1qw/q7En5M3g82q86ZQUmzBUvnqWL+n4kiNHOuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762149427; c=relaxed/simple;
	bh=UHvoMxUQQdeGMB3jds8SF3y1G8JNPGDK2gesbW/1Z4E=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mIYZMaRmX7hD7L9eWth1zjkQCsE2rwMiMakz2h4ZY7rEReTpk+gVwO2jOM2gIz68LPh9qkhDlfqkPX9rSYUMfpDuMdB4SarOhHN5wpfyz2gikDUuaQOuR+esWJUpA9xcDxjb0dIGMaR8qkNoQxGg5U9t63IgI97uV1Uk4VbTCJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SQaTP2Lb; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762149423; x=1793685423;
  h=date:from:to:subject:message-id:references:mime-version:
   in-reply-to;
  bh=UHvoMxUQQdeGMB3jds8SF3y1G8JNPGDK2gesbW/1Z4E=;
  b=SQaTP2LbOTnD2nGNbPulrvny5Vnop3p+XCgGF/0ZLCOXeU1D2k6PEJIj
   a6EFY4Cg/n3sl9lqIdRYs599D2is49UZw1bYFHu3MkVdnLL/kUTn9mucY
   IpW63Y/gmki2NzgXPXU2TNeWFm6mQ3MCrTeaLOfuYM4RSZNugOBHHhrub
   2jZVxsOXr7O3FfzZ1nYLkj9Pmw9bBkHmxZ3lBsWIsGSKHc7LJhv/yW4D/
   8+Z0DqskfReUmwQLRDY9H/NAB0R27atQGAVBFM6J+oCVX7llA0jMFKCMS
   MI0iC/jPuM1y6Nr4zIFbtRuAZa7e0zycmK+LwX0IxODK5wG1Y0iOwyE6U
   w==;
X-CSE-ConnectionGUID: 48HtBtWERHCDje0bccO+yg==
X-CSE-MsgGUID: X6dCUNEcQEyIRyOxYXN4Lw==
X-IronPort-AV: E=McAfee;i="6800,10657,11601"; a="75570691"
X-IronPort-AV: E=Sophos;i="6.19,275,1754982000"; 
   d="scan'208";a="75570691"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2025 21:57:03 -0800
X-CSE-ConnectionGUID: aqRKa5XPSMim3iWQqxv77A==
X-CSE-MsgGUID: CY6JIjGsSeW3b8zTrEuEEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,275,1754982000"; 
   d="scan'208";a="186459836"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa007.fm.intel.com with ESMTP; 02 Nov 2025 21:57:00 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 6B70395; Mon, 03 Nov 2025 06:56:59 +0100 (CET)
Date: Mon, 3 Nov 2025 06:56:59 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org, Andreas Noever <andreas.noever@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Imre Deak <imre.deak@intel.com>
Subject: Re: TB 5 Dock DP-Out non-functional
Message-ID: <20251103055659.GD2912318@black.igk.intel.com>
References: <q7k73t5utfjrpuf45ynig72eojpixepjqccvsfaqt6rg4wptst@se6ekc2eg3sv>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <q7k73t5utfjrpuf45ynig72eojpixepjqccvsfaqt6rg4wptst@se6ekc2eg3sv>

+Imre

Hi,

On Sun, Nov 02, 2025 at 04:39:07PM +0100, Frederik Schwan wrote:
> Hello linux-usb,
> Dear Thunderbolt driver maintainers,
> 
> I just tried to swap my TB 4 setup with TB 5 hardware.
> USB devices and power supply works as expected. Displayport does not.
> 
> Setup:
> TB 5 Host (Lenovo P1 Gen8)
>   -> TB 4 Dock (0108:2031 reports as "ThinkPad Thunderbolt 4 Dock")
>     -> USB Devices, two 3840x2160, LAN attached
>   -> TB 5 Dock (0108:234d reports as "ThinkPad Thunderbolt 5 Smart Dock 7500 - 40BA")
>     -> nothing but power supply
> 
> Now I just move one of the dp cables from the TB 4 dock to the TB 5 dock and best thing I can get is a quick flicker
> with a good signal but from then the monitor is black turning on and off continuously (seems to get a signal that collapses instantly).
> 
> I attached the dmesg debug log for this scenario.
> 
> This also happens if I use the TB 5 dock alone (with all USB stuff attached) but the behavior is way more inconsistent, with some monitors not coming up
> at all or loosing signal after a few seconds.

You are saying that you have two docks connected like this:

  Host -> TB 4 -> 2 Monitors
    |
    v
   TB5 (nothing but power)
    
And with this the TB4 dock monitors don't work? But without the TB5 dock
they work fine?

It would be good to have simplest possible case where this reproduces then
provide exact steps of that, like

  1. Boot the system up, nothing connected.
  2. Once up, connect TB4 dock to the host.
  3. Plug in 2 monitors to TB4 dock.
  4. Verify they both work (e.g display the screen).
  5. Verify that the peripherals on the TB4 dock work (keyboard, mouse).
  6. Connect TB5 dock to the host.

Expectation: Monitors and peripherals in TB4 dock keep working. TB5 dock is
             visible too.

Actual result: The monitors blink and the picture vanishes.

Then provide full dmesg with "thunderbolt.dyndbg=+p" and "drm.debug=0x10e"
in the kernel command line.

In addition to this, once you reproduced the issue (if possible) please run
this command:

  https://github.com/intel/tbtools/wiki/Useful-Commands#dump-status-of-displayport-tunnels

and provide output as well.


> I have no clue if this is the right list to report, I'm happy to report this to the drm subsystem if I'm wrong here :)
> 
> Best regards,
> Frederik

> [Nov 2 16:09] thunderbolt 0000:8a:00.0: acking hot unplug event on 3:14
> [  +0,000111] thunderbolt 0000:8a:00.0: 3:14: DP OUT resource unavailable: adapter unplug
> [  +0,000006] thunderbolt 0000:8a:00.0: 0:13 <-> 3:14 (DP): deactivating
> [  +0,000779] thunderbolt 0000:8a:00.0: deactivating Video path from 0:13 to 3:14
> [  +0,000755] thunderbolt 0000:8a:00.0: 3:1: adding -18 NFC credits to 18
> [  +0,000111] thunderbolt 0000:8a:00.0: deactivating AUX TX path from 0:13 to 3:14
> [  +0,000784] thunderbolt 0000:8a:00.0: deactivating AUX RX path from 3:14 to 0:13
> [  +0,001048] thunderbolt 0000:8a:00.0: 0:13: detached from bandwidth group 1
> [  +0,002719] thunderbolt 0000:8a:00.0: 0: released DP resource for port 13
> [  +0,000003] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): reclaiming unused bandwidth
> [  +0,000378] thunderbolt 0000:8a:00.0: 0:3: link maximum bandwidth 36000/36000 Mb/s
> [  +0,000301] thunderbolt 0000:8a:00.0: 3:1: link maximum bandwidth 36000/36000 Mb/s
> [  +0,000158] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): available bandwidth 36000/36000 Mb/s
> [  +0,000243] thunderbolt 0000:8a:00.0: bandwidth consumption changed, re-calculating estimated bandwidth
> [  +0,000002] thunderbolt 0000:8a:00.0: bandwidth re-calculation done
> [  +0,000001] thunderbolt 0000:8a:00.0: looking for DP IN <-> DP OUT pairs:
> [  +0,000047] thunderbolt 0000:8a:00.0: 0:13: DP IN available
> [  +0,000001] thunderbolt 0000:8a:00.0: 0:13: no suitable DP OUT adapter available, not tunneling
> [  +0,000145] thunderbolt 0000:8a:00.0: 0:14: DP IN available
> [  +0,000000] thunderbolt 0000:8a:00.0: 0:14: no suitable DP OUT adapter available, not tunneling
> [  +1,730897] thunderbolt 0000:8a:00.0: acking hot plug event on 3:13
> [  +0,000280] thunderbolt 0000:8a:00.0: 3:13: DP OUT resource available after hotplug
> [  +0,000008] thunderbolt 0000:8a:00.0: looking for DP IN <-> DP OUT pairs:
> [  +0,000142] thunderbolt 0000:8a:00.0: 0:13: DP IN available
> [  +0,000185] thunderbolt 0000:8a:00.0: 3:13: DP OUT available
> [  +0,017354] thunderbolt 0000:8a:00.0: 0: allocated DP resource for port 13
> [  +0,000007] thunderbolt 0000:8a:00.0: 0:13: attached to bandwidth group 1
> [  +0,000741] thunderbolt 0000:8a:00.0: 0:22: scaled bandwidth 220/220, scale 0
> [  +0,000639] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): decreased bandwidth allocation to 900/900 Mb/s
> [  +0,000384] thunderbolt 0000:8a:00.0: 0:3: link maximum bandwidth 36000/36000 Mb/s
> [  +0,000128] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): consumed bandwidth 1350/1350 Mb/s
> [  +0,000256] thunderbolt 0000:8a:00.0: 3:1: link maximum bandwidth 36000/36000 Mb/s
> [  +0,000128] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): consumed bandwidth 1350/1350 Mb/s
> [  +0,000129] thunderbolt 0000:8a:00.0: available bandwidth for new DP tunnel 34650/34650 Mb/s
> [  +0,000007] thunderbolt 0000:8a:00.0: 0:13 <-> 3:13 (DP): activating
> [  +0,000820] thunderbolt 0000:8a:00.0: 0:13 <-> 3:13 (DP): DP IN maximum supported bandwidth 8100 Mb/s x4 = 25920 Mb/s
> [  +0,000003] thunderbolt 0000:8a:00.0: 0:13 <-> 3:13 (DP): DP OUT maximum supported bandwidth 8100 Mb/s x4 = 25920 Mb/s
> [  +0,000250] thunderbolt 0000:8a:00.0: 0:13 <-> 3:13 (DP): bandwidth allocation mode supported
> [  +0,000966] thunderbolt 0000:8a:00.0: 0:13 <-> 3:13 (DP): non-reduced bandwidth 8100 Mb/s x4 = 25920 Mb/s
> [  +0,000256] thunderbolt 0000:8a:00.0: 0:13 <-> 3:13 (DP): maximum bandwidth through allocation mode 8100 Mb/s x4 = 25920 Mb/s
> [  +0,000001] thunderbolt 0000:8a:00.0: 0:13 <-> 3:13 (DP): granularity 250 Mb/s
> [  +0,000255] thunderbolt 0000:8a:00.0: 0:13 <-> 3:13 (DP): estimated bandwidth 34650 Mb/s
> [  +0,001663] thunderbolt 0000:8a:00.0: 0:13 <-> 3:13 (DP): bandwidth allocation mode enabled
> [  +0,000001] thunderbolt 0000:8a:00.0: activating Video path from 0:13 to 3:13
> [  +0,000002] thunderbolt 0000:8a:00.0: 3:1: adding 18 NFC credits to 0
> [  +0,000253] thunderbolt 0000:8a:00.0: 3:1: Writing hop 1
> [  +0,000001] thunderbolt 0000:8a:00.0: 3:1:  In HopID: 10 => Out port: 13 Out HopID: 9
> [  +0,000001] thunderbolt 0000:8a:00.0: 3:1:   Weight: 1 Priority: 1 Credits: 0 Drop: 0 PM: 0
> [  +0,000001] thunderbolt 0000:8a:00.0: 3:1:    Counter enabled: 0 Counter index: 2047
> [  +0,000001] thunderbolt 0000:8a:00.0: 3:1:   Flow Control (In/Eg): 0/0 Shared Buffer (In/Eg): 0/0
> [  +0,000000] thunderbolt 0000:8a:00.0: 3:1:   Unknown1: 0x0 Unknown2: 0x0 Unknown3: 0x0
> [  +0,000252] thunderbolt 0000:8a:00.0: 0:13: Writing hop 0
> [  +0,000001] thunderbolt 0000:8a:00.0: 0:13:  In HopID: 9 => Out port: 3 Out HopID: 10
> [  +0,000001] thunderbolt 0000:8a:00.0: 0:13:   Weight: 1 Priority: 1 Credits: 0 Drop: 0 PM: 0
> [  +0,000000] thunderbolt 0000:8a:00.0: 0:13:    Counter enabled: 0 Counter index: 2047
> [  +0,000001] thunderbolt 0000:8a:00.0: 0:13:   Flow Control (In/Eg): 0/0 Shared Buffer (In/Eg): 0/0
> [  +0,000001] thunderbolt 0000:8a:00.0: 0:13:   Unknown1: 0x0 Unknown2: 0x0 Unknown3: 0x0
> [  +0,000125] thunderbolt 0000:8a:00.0: Video path activation complete
> [  +0,000000] thunderbolt 0000:8a:00.0: activating AUX TX path from 0:13 to 3:13
> [  +0,000127] thunderbolt 0000:8a:00.0: 3:1: Writing hop 1
> [  +0,000001] thunderbolt 0000:8a:00.0: 3:1:  In HopID: 11 => Out port: 13 Out HopID: 8
> [  +0,000001] thunderbolt 0000:8a:00.0: 3:1:   Weight: 1 Priority: 2 Credits: 1 Drop: 0 PM: 0
> [  +0,000000] thunderbolt 0000:8a:00.0: 3:1:    Counter enabled: 0 Counter index: 2047
> [  +0,000001] thunderbolt 0000:8a:00.0: 3:1:   Flow Control (In/Eg): 1/0 Shared Buffer (In/Eg): 0/0
> [  +0,000001] thunderbolt 0000:8a:00.0: 3:1:   Unknown1: 0x0 Unknown2: 0x0 Unknown3: 0x0
> [  +0,000253] thunderbolt 0000:8a:00.0: 0:13: Writing hop 0
> [  +0,000000] thunderbolt 0000:8a:00.0: 0:13:  In HopID: 8 => Out port: 3 Out HopID: 11
> [  +0,000001] thunderbolt 0000:8a:00.0: 0:13:   Weight: 1 Priority: 2 Credits: 1 Drop: 0 PM: 0
> [  +0,000001] thunderbolt 0000:8a:00.0: 0:13:    Counter enabled: 0 Counter index: 2047
> [  +0,000000] thunderbolt 0000:8a:00.0: 0:13:   Flow Control (In/Eg): 1/1 Shared Buffer (In/Eg): 0/0
> [  +0,000001] thunderbolt 0000:8a:00.0: 0:13:   Unknown1: 0x0 Unknown2: 0x0 Unknown3: 0x0
> [  +0,000125] thunderbolt 0000:8a:00.0: AUX TX path activation complete
> [  +0,000000] thunderbolt 0000:8a:00.0: activating AUX RX path from 3:13 to 0:13
> [  +0,000127] thunderbolt 0000:8a:00.0: 0:3: Writing hop 1
> [  +0,000001] thunderbolt 0000:8a:00.0: 0:3:  In HopID: 10 => Out port: 13 Out HopID: 8
> [  +0,000001] thunderbolt 0000:8a:00.0: 0:3:   Weight: 1 Priority: 2 Credits: 1 Drop: 0 PM: 0
> [  +0,000000] thunderbolt 0000:8a:00.0: 0:3:    Counter enabled: 0 Counter index: 2047
> [  +0,000001] thunderbolt 0000:8a:00.0: 0:3:   Flow Control (In/Eg): 1/0 Shared Buffer (In/Eg): 0/0
> [  +0,000000] thunderbolt 0000:8a:00.0: 0:3:   Unknown1: 0x0 Unknown2: 0x0 Unknown3: 0x0
> [  +0,000254] thunderbolt 0000:8a:00.0: 3:13: Writing hop 0
> [  +0,000000] thunderbolt 0000:8a:00.0: 3:13:  In HopID: 8 => Out port: 1 Out HopID: 10
> [  +0,000001] thunderbolt 0000:8a:00.0: 3:13:   Weight: 1 Priority: 2 Credits: 1 Drop: 0 PM: 0
> [  +0,000001] thunderbolt 0000:8a:00.0: 3:13:    Counter enabled: 0 Counter index: 2047
> [  +0,000000] thunderbolt 0000:8a:00.0: 3:13:   Flow Control (In/Eg): 1/1 Shared Buffer (In/Eg): 0/0
> [  +0,000001] thunderbolt 0000:8a:00.0: 3:13:   Unknown1: 0x0 Unknown2: 0x0 Unknown3: 0x0
> [  +0,000126] thunderbolt 0000:8a:00.0: AUX RX path activation complete
> [  +0,000644] thunderbolt 0000:8a:00.0: 0:14: DP IN available
> [  +0,000123] thunderbolt 0000:8a:00.0: 3:13: DP OUT in use
> [  +0,000000] thunderbolt 0000:8a:00.0: 0:14: no suitable DP OUT adapter available, not tunneling
> [  +0,005509] thunderbolt 0000:8a:00.0: 0:13 <-> 3:13 (DP): DPRX capabilities read completed
> [  +0,000315] thunderbolt 0000:8a:00.0: 0:13 <-> 3:13 (DP): consumed bandwidth 0/17280 Mb/s
> [  +0,000013] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): reclaiming unused bandwidth
> [  +0,000368] thunderbolt 0000:8a:00.0: 0:3: link maximum bandwidth 36000/36000 Mb/s
> [  +0,000512] thunderbolt 0000:8a:00.0: 0:13 <-> 3:13 (DP): consumed bandwidth 0/17280 Mb/s
> [  +0,000145] thunderbolt 0000:8a:00.0: 3:1: link maximum bandwidth 36000/36000 Mb/s
> [  +0,000494] thunderbolt 0000:8a:00.0: 0:13 <-> 3:13 (DP): consumed bandwidth 0/17280 Mb/s
> [  +0,000006] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): available bandwidth 36000/18720 Mb/s
> [  +0,001017] thunderbolt 0000:8a:00.0: 0:22: scaled bandwidth 2198/2198, scale 0
> [  +0,000658] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): increased bandwidth allocation to 9000/9000 Mb/s
> [  +0,000006] thunderbolt 0000:8a:00.0: bandwidth consumption changed, re-calculating estimated bandwidth
> [  +0,000002] thunderbolt 0000:8a:00.0: re-calculating bandwidth estimation for group 1
> [  +0,000101] thunderbolt 0000:8a:00.0: bandwidth estimation for group 1 done
> [  +0,000004] thunderbolt 0000:8a:00.0: bandwidth re-calculation done
> [  +3,085528] i915 0000:00:02.0: [drm] *ERROR* Failed to get ACT after 3000 ms, last status: 00
> [  +0,268467] thunderbolt 0000:8a:00.0: acking DP_BW (0x20) notification on 0
> [  +0,000041] thunderbolt 0000:8a:00.0: 0:13: handling bandwidth allocation request, retry 0
> [  +0,000311] thunderbolt 0000:8a:00.0: 0:13: DPTX enabled bandwidth allocation mode, updating estimated bandwidth
> [  +0,000012] thunderbolt 0000:8a:00.0: bandwidth consumption changed, re-calculating estimated bandwidth
> [  +0,000006] thunderbolt 0000:8a:00.0: re-calculating bandwidth estimation for group 1
> [  +0,000876] thunderbolt 0000:8a:00.0: 0:22: scaled bandwidth 220/220, scale 0
> [  +0,000639] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): decreased bandwidth allocation to 900/900 Mb/s
> [  +0,000385] thunderbolt 0000:8a:00.0: 0:3: link maximum bandwidth 36000/36000 Mb/s
> [  +0,000126] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): consumed bandwidth 1350/1350 Mb/s
> [  +0,000255] thunderbolt 0000:8a:00.0: 3:1: link maximum bandwidth 36000/36000 Mb/s
> [  +0,000128] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): consumed bandwidth 1350/1350 Mb/s
> [  +0,000131] thunderbolt 0000:8a:00.0: 0:13 <-> 3:13 (DP): re-calculated estimated bandwidth 34650 (+ 0 reserved) = 34650 Mb/s
> [  +0,000406] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): reclaiming unused bandwidth
> [  +0,000361] thunderbolt 0000:8a:00.0: 0:3: link maximum bandwidth 36000/36000 Mb/s
> [  +0,000514] thunderbolt 0000:8a:00.0: 0:13 <-> 3:13 (DP): consumed bandwidth 0/17280 Mb/s
> [  +0,000125] thunderbolt 0000:8a:00.0: 3:1: link maximum bandwidth 36000/36000 Mb/s
> [  +0,000517] thunderbolt 0000:8a:00.0: 0:13 <-> 3:13 (DP): consumed bandwidth 0/17280 Mb/s
> [  +0,000007] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): available bandwidth 36000/18720 Mb/s
> [  +0,001006] thunderbolt 0000:8a:00.0: acking DP_BW (0x20) notification on 0
> [  +0,000014] thunderbolt 0000:8a:00.0: 0:22: scaled bandwidth 2198/2198, scale 0
> [  +0,000632] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): increased bandwidth allocation to 9000/9000 Mb/s
> [  +0,000009] thunderbolt 0000:8a:00.0: bandwidth estimation for group 1 done
> [  +0,000006] thunderbolt 0000:8a:00.0: bandwidth re-calculation done
> [  +0,000011] thunderbolt 0000:8a:00.0: 0:13: handling bandwidth allocation request, retry 0
> [  +0,000360] thunderbolt 0000:8a:00.0: 0:13: requested bandwidth 8500 Mb/s
> [  +0,000513] thunderbolt 0000:8a:00.0: 0:13 <-> 3:13 (DP): bandwidth allocated currently 0/17280 Mb/s
> [  +0,000382] thunderbolt 0000:8a:00.0: 0:13 <-> 3:13 (DP): corrected bandwidth request 0/8500 Mb/s
> [  +0,001797] thunderbolt 0000:8a:00.0: 0:13 <-> 3:13 (DP): bandwidth allocation changed to 0/8500 Mb/s
> [  +0,000007] thunderbolt 0000:8a:00.0: bandwidth consumption changed, re-calculating estimated bandwidth
> [  +0,000002] thunderbolt 0000:8a:00.0: re-calculating bandwidth estimation for group 1
> [  +0,000821] thunderbolt 0000:8a:00.0: 0:22: scaled bandwidth 220/220, scale 0
> [  +0,000725] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): decreased bandwidth allocation to 900/900 Mb/s
> [  +0,000309] thunderbolt 0000:8a:00.0: 0:3: link maximum bandwidth 36000/36000 Mb/s
> [  +0,000109] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): consumed bandwidth 1350/1350 Mb/s
> [  +0,000273] thunderbolt 0000:8a:00.0: 3:1: link maximum bandwidth 36000/36000 Mb/s
> [  +0,000128] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): consumed bandwidth 1350/1350 Mb/s
> [  +0,000129] thunderbolt 0000:8a:00.0: 0:13 <-> 3:13 (DP): re-calculated estimated bandwidth 34650 (+ 0 reserved) = 34650 Mb/s
> [  +0,000383] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): reclaiming unused bandwidth
> [  +0,000384] thunderbolt 0000:8a:00.0: 0:3: link maximum bandwidth 36000/36000 Mb/s
> [  +0,000896] thunderbolt 0000:8a:00.0: 0:13 <-> 3:13 (DP): consumed bandwidth 0/8500 Mb/s
> [  +0,000128] thunderbolt 0000:8a:00.0: 3:1: link maximum bandwidth 36000/36000 Mb/s
> [  +0,000896] thunderbolt 0000:8a:00.0: 0:13 <-> 3:13 (DP): consumed bandwidth 0/8500 Mb/s
> [  +0,000002] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): available bandwidth 36000/27500 Mb/s
> [  +0,001024] thunderbolt 0000:8a:00.0: 0:22: scaled bandwidth 2198/2198, scale 0
> [  +0,000673] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): increased bandwidth allocation to 9000/9000 Mb/s
> [  +0,000006] thunderbolt 0000:8a:00.0: bandwidth estimation for group 1 done
> [  +0,000002] thunderbolt 0000:8a:00.0: bandwidth re-calculation done
> [  +3,217408] i915 0000:00:02.0: [drm] *ERROR* Failed to get ACT after 3000 ms, last status: 04
> [  +0,828792] thunderbolt 0000:8a:00.0: acking hot plug event on 1:12
> [  +0,000123] thunderbolt 0000:8a:00.0: 1:12: DP OUT resource available after hotplug
> [  +0,000005] thunderbolt 0000:8a:00.0: looking for DP IN <-> DP OUT pairs:
> [  +0,000119] thunderbolt 0000:8a:00.0: 0:13: DP IN in use
> [  +0,000146] thunderbolt 0000:8a:00.0: 0:14: DP IN available
> [  +0,000127] thunderbolt 0000:8a:00.0: 3:13: DP OUT in use
> [  +0,000128] thunderbolt 0000:8a:00.0: 1:12: DP OUT available
> [  +0,000641] thunderbolt 0000:8a:00.0: 0: allocated DP resource for port 14
> [  +0,000002] thunderbolt 0000:8a:00.0: 0:14: attached to bandwidth group 2
> [  +0,000765] thunderbolt 0000:8a:00.0: 0:21: scaled bandwidth 220/220, scale 0
> [  +0,000643] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): decreased bandwidth allocation to 900/900 Mb/s
> [  +0,000638] thunderbolt 0000:8a:00.0: 0:1: link maximum bandwidth 36000/108000 Mb/s
> [  +0,000129] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): consumed bandwidth 3000/3000 Mb/s
> [  +0,000127] thunderbolt 0000:8a:00.0: 0:1: reserving 1500/1500 Mb/s for PCIe
> [  +0,000384] thunderbolt 0000:8a:00.0: 1:1: link maximum bandwidth 36000/108000 Mb/s
> [  +0,000127] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): consumed bandwidth 3000/3000 Mb/s
> [  +0,000128] thunderbolt 0000:8a:00.0: 1:1: reserving 1500/1500 Mb/s for PCIe
> [  +0,000001] thunderbolt 0000:8a:00.0: available bandwidth for new DP tunnel 31500/103500 Mb/s
> [  +0,000005] thunderbolt 0000:8a:00.0: 0:14 <-> 1:12 (DP): activating
> [  +0,000745] thunderbolt 0000:8a:00.0: 0:14 <-> 1:12 (DP): DP IN maximum supported bandwidth 8100 Mb/s x4 = 25920 Mb/s
> [  +0,000001] thunderbolt 0000:8a:00.0: 0:14 <-> 1:12 (DP): DP OUT maximum supported bandwidth 8100 Mb/s x4 = 25920 Mb/s
> [  +0,000256] thunderbolt 0000:8a:00.0: 0:14 <-> 1:12 (DP): bandwidth allocation mode supported
> [  +0,001023] thunderbolt 0000:8a:00.0: 0:14 <-> 1:12 (DP): non-reduced bandwidth 8100 Mb/s x4 = 25920 Mb/s
> [  +0,000258] thunderbolt 0000:8a:00.0: 0:14 <-> 1:12 (DP): maximum bandwidth through allocation mode 20000 Mb/s x4 = 77575 Mb/s
> [  +0,000001] thunderbolt 0000:8a:00.0: 0:14 <-> 1:12 (DP): granularity 500 Mb/s
> [  +0,000253] thunderbolt 0000:8a:00.0: 0:14 <-> 1:12 (DP): estimated bandwidth 103500 Mb/s
> [  +0,001665] thunderbolt 0000:8a:00.0: 0:14 <-> 1:12 (DP): bandwidth allocation mode enabled
> [  +0,000007] thunderbolt 0000:8a:00.0: activating Video path from 0:14 to 1:12
> [  +0,000003] thunderbolt 0000:8a:00.0: 1:1: adding 6 NFC credits to 0
> [  +0,000246] thunderbolt 0000:8a:00.0: 1:1: Writing hop 1
> [  +0,000001] thunderbolt 0000:8a:00.0: 1:1:  In HopID: 10 => Out port: 12 Out HopID: 9
> [  +0,000001] thunderbolt 0000:8a:00.0: 1:1:   Weight: 1 Priority: 1 Credits: 0 Drop: 0 PM: 0
> [  +0,000001] thunderbolt 0000:8a:00.0: 1:1:    Counter enabled: 0 Counter index: 2047
> [  +0,000001] thunderbolt 0000:8a:00.0: 1:1:   Flow Control (In/Eg): 0/0 Shared Buffer (In/Eg): 0/0
> [  +0,000001] thunderbolt 0000:8a:00.0: 1:1:   Unknown1: 0x0 Unknown2: 0x0 Unknown3: 0x0
> [  +0,000251] thunderbolt 0000:8a:00.0: 0:14: Writing hop 0
> [  +0,000000] thunderbolt 0000:8a:00.0: 0:14:  In HopID: 9 => Out port: 1 Out HopID: 10
> [  +0,000001] thunderbolt 0000:8a:00.0: 0:14:   Weight: 1 Priority: 1 Credits: 0 Drop: 0 PM: 0
> [  +0,000001] thunderbolt 0000:8a:00.0: 0:14:    Counter enabled: 0 Counter index: 2047
> [  +0,000000] thunderbolt 0000:8a:00.0: 0:14:   Flow Control (In/Eg): 0/0 Shared Buffer (In/Eg): 0/0
> [  +0,000001] thunderbolt 0000:8a:00.0: 0:14:   Unknown1: 0x0 Unknown2: 0x0 Unknown3: 0x0
> [  +0,000125] thunderbolt 0000:8a:00.0: Video path activation complete
> [  +0,000001] thunderbolt 0000:8a:00.0: activating AUX TX path from 0:14 to 1:12
> [  +0,000126] thunderbolt 0000:8a:00.0: 1:1: Writing hop 1
> [  +0,000001] thunderbolt 0000:8a:00.0: 1:1:  In HopID: 11 => Out port: 12 Out HopID: 8
> [  +0,000000] thunderbolt 0000:8a:00.0: 1:1:   Weight: 1 Priority: 2 Credits: 1 Drop: 0 PM: 0
> [  +0,000001] thunderbolt 0000:8a:00.0: 1:1:    Counter enabled: 0 Counter index: 2047
> [  +0,000001] thunderbolt 0000:8a:00.0: 1:1:   Flow Control (In/Eg): 1/0 Shared Buffer (In/Eg): 0/0
> [  +0,000000] thunderbolt 0000:8a:00.0: 1:1:   Unknown1: 0x0 Unknown2: 0x0 Unknown3: 0x0
> [  +0,000254] thunderbolt 0000:8a:00.0: 0:14: Writing hop 0
> [  +0,000001] thunderbolt 0000:8a:00.0: 0:14:  In HopID: 8 => Out port: 1 Out HopID: 11
> [  +0,000001] thunderbolt 0000:8a:00.0: 0:14:   Weight: 1 Priority: 2 Credits: 1 Drop: 0 PM: 0
> [  +0,000000] thunderbolt 0000:8a:00.0: 0:14:    Counter enabled: 0 Counter index: 2047
> [  +0,000001] thunderbolt 0000:8a:00.0: 0:14:   Flow Control (In/Eg): 1/1 Shared Buffer (In/Eg): 0/0
> [  +0,000001] thunderbolt 0000:8a:00.0: 0:14:   Unknown1: 0x0 Unknown2: 0x0 Unknown3: 0x0
> [  +0,000156] thunderbolt 0000:8a:00.0: AUX TX path activation complete
> [  +0,000020] thunderbolt 0000:8a:00.0: activating AUX RX path from 1:12 to 0:14
> [  +0,000826] thunderbolt 0000:8a:00.0: 0:1: Writing hop 1
> [  +0,000004] thunderbolt 0000:8a:00.0: 0:1:  In HopID: 10 => Out port: 14 Out HopID: 8
> [  +0,000001] thunderbolt 0000:8a:00.0: 0:1:   Weight: 1 Priority: 2 Credits: 1 Drop: 0 PM: 0
> [  +0,000002] thunderbolt 0000:8a:00.0: 0:1:    Counter enabled: 0 Counter index: 2047
> [  +0,000001] thunderbolt 0000:8a:00.0: 0:1:   Flow Control (In/Eg): 1/0 Shared Buffer (In/Eg): 0/0
> [  +0,000001] thunderbolt 0000:8a:00.0: 0:1:   Unknown1: 0x0 Unknown2: 0x0 Unknown3: 0x0
> [  +0,000310] thunderbolt 0000:8a:00.0: 1:12: Writing hop 0
> [  +0,000006] thunderbolt 0000:8a:00.0: 1:12:  In HopID: 8 => Out port: 1 Out HopID: 10
> [  +0,000002] thunderbolt 0000:8a:00.0: 1:12:   Weight: 1 Priority: 2 Credits: 1 Drop: 0 PM: 0
> [  +0,000002] thunderbolt 0000:8a:00.0: 1:12:    Counter enabled: 0 Counter index: 2047
> [  +0,000002] thunderbolt 0000:8a:00.0: 1:12:   Flow Control (In/Eg): 1/1 Shared Buffer (In/Eg): 0/0
> [  +0,000003] thunderbolt 0000:8a:00.0: 1:12:   Unknown1: 0x0 Unknown2: 0x0 Unknown3: 0x0
> [  +0,000035] thunderbolt 0000:8a:00.0: AUX RX path activation complete
> [  +0,004199] thunderbolt 0000:8a:00.0: 0:14 <-> 1:12 (DP): DPRX capabilities read completed
> [  +0,000302] thunderbolt 0000:8a:00.0: 0:14 <-> 1:12 (DP): consumed bandwidth 0/25920 Mb/s
> [  +0,000012] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): reclaiming unused bandwidth
> [  +0,000628] thunderbolt 0000:8a:00.0: 0:1: link maximum bandwidth 72000/72000 Mb/s
> [  +0,000354] thunderbolt 0000:8a:00.0: 0:1: reserving 1500/1500 Mb/s for PCIe
> [  +0,000292] thunderbolt 0000:8a:00.0: 0:14 <-> 1:12 (DP): consumed bandwidth 0/25920 Mb/s
> [  +0,000367] thunderbolt 0000:8a:00.0: 1:1: link maximum bandwidth 72000/72000 Mb/s
> [  +0,000125] thunderbolt 0000:8a:00.0: 1:1: reserving 1500/1500 Mb/s for PCIe
> [  +0,000402] thunderbolt 0000:8a:00.0: 0:14 <-> 1:12 (DP): consumed bandwidth 0/25920 Mb/s
> [  +0,000002] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): available bandwidth 70500/44580 Mb/s
> [  +0,001023] thunderbolt 0000:8a:00.0: 0:21: scaled bandwidth 3599/3599, scale 0
> [  +0,000639] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): increased bandwidth allocation to 14738/14738 Mb/s
> [  +0,000004] thunderbolt 0000:8a:00.0: bandwidth consumption changed, re-calculating estimated bandwidth
> [  +0,000001] thunderbolt 0000:8a:00.0: re-calculating bandwidth estimation for group 1
> [  +0,000891] thunderbolt 0000:8a:00.0: 0:22: scaled bandwidth 220/220, scale 0
> [  +0,000651] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): decreased bandwidth allocation to 900/900 Mb/s
> [  +0,000365] thunderbolt 0000:8a:00.0: 0:3: link maximum bandwidth 36000/36000 Mb/s
> [  +0,000125] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): consumed bandwidth 1350/1350 Mb/s
> [  +0,000263] thunderbolt 0000:8a:00.0: 3:1: link maximum bandwidth 36000/36000 Mb/s
> [  +0,000124] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): consumed bandwidth 1350/1350 Mb/s
> [  +0,000147] thunderbolt 0000:8a:00.0: 0:13 <-> 3:13 (DP): re-calculated estimated bandwidth 34650 (+ 0 reserved) = 34650 Mb/s
> [  +0,000365] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): reclaiming unused bandwidth
> [  +0,000398] thunderbolt 0000:8a:00.0: 0:3: link maximum bandwidth 36000/36000 Mb/s
> [  +0,000899] thunderbolt 0000:8a:00.0: 0:13 <-> 3:13 (DP): consumed bandwidth 0/8500 Mb/s
> [  +0,000111] thunderbolt 0000:8a:00.0: 3:1: link maximum bandwidth 36000/36000 Mb/s
> [  +0,000909] thunderbolt 0000:8a:00.0: 0:13 <-> 3:13 (DP): consumed bandwidth 0/8500 Mb/s
> [  +0,000021] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): available bandwidth 36000/27500 Mb/s
> [  +0,001012] thunderbolt 0000:8a:00.0: 0:22: scaled bandwidth 2198/2198, scale 0
> [  +0,000615] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): increased bandwidth allocation to 9000/9000 Mb/s
> [  +0,000006] thunderbolt 0000:8a:00.0: bandwidth estimation for group 1 done
> [  +0,000004] thunderbolt 0000:8a:00.0: re-calculating bandwidth estimation for group 2
> [  +0,000137] thunderbolt 0000:8a:00.0: bandwidth estimation for group 2 done
> [  +0,000005] thunderbolt 0000:8a:00.0: bandwidth re-calculation done
> [  +2,246846] i915 0000:00:02.0: [drm] *ERROR* Failed to get ACT after 3000 ms, last status: 04
> [  +0,003041] thunderbolt 0000:8a:00.0: acking DP_BW (0x20) notification on 0
> [  +0,000031] thunderbolt 0000:8a:00.0: 0:13: handling bandwidth allocation request, retry 0
> [  +0,000330] thunderbolt 0000:8a:00.0: 0:13: requested bandwidth 0 Mb/s
> [  +0,000639] thunderbolt 0000:8a:00.0: 0:13 <-> 3:13 (DP): bandwidth allocated currently 0/8500 Mb/s
> [  +0,000384] thunderbolt 0000:8a:00.0: 0:13 <-> 3:13 (DP): corrected bandwidth request 0/0 Mb/s
> [  +0,000010] thunderbolt 0000:8a:00.0: group 1 reserved 8500 total 8500 Mb/s
> [  +0,001816] thunderbolt 0000:8a:00.0: 0:13 <-> 3:13 (DP): bandwidth allocation changed to 0/0 Mb/s
> [  +0,000008] thunderbolt 0000:8a:00.0: bandwidth consumption changed, re-calculating estimated bandwidth
> [  +0,000004] thunderbolt 0000:8a:00.0: re-calculating bandwidth estimation for group 1
> [  +0,000808] thunderbolt 0000:8a:00.0: 0:22: scaled bandwidth 220/220, scale 0
> [  +0,000662] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): decreased bandwidth allocation to 900/900 Mb/s
> [  +0,000362] thunderbolt 0000:8a:00.0: 0:3: link maximum bandwidth 36000/36000 Mb/s
> [  +0,000147] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): consumed bandwidth 1350/1350 Mb/s
> [  +0,000257] thunderbolt 0000:8a:00.0: 3:1: link maximum bandwidth 36000/36000 Mb/s
> [  +0,000109] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): consumed bandwidth 1350/1350 Mb/s
> [  +0,000149] thunderbolt 0000:8a:00.0: 0:13 <-> 3:13 (DP): re-calculated estimated bandwidth 26150 (+ 8500 reserved) = 34650 Mb/s
> [  +0,000382] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): reclaiming unused bandwidth
> [  +0,000477] thunderbolt 0000:8a:00.0: 0:3: link maximum bandwidth 36000/36000 Mb/s
> [  +0,001078] thunderbolt 0000:8a:00.0: 0:13 <-> 3:13 (DP): consumed bandwidth 0/0 Mb/s
> [  +0,000050] thunderbolt 0000:8a:00.0: 3:1: link maximum bandwidth 36000/36000 Mb/s
> [  +0,000910] thunderbolt 0000:8a:00.0: 0:13 <-> 3:13 (DP): consumed bandwidth 0/0 Mb/s
> [  +0,000008] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): available bandwidth 36000/27500 Mb/s
> [  +0,001011] thunderbolt 0000:8a:00.0: 0:22: scaled bandwidth 2198/2198, scale 0
> [  +0,000962] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): increased bandwidth allocation to 9000/9000 Mb/s
> [  +0,000004] thunderbolt 0000:8a:00.0: bandwidth estimation for group 1 done
> [  +0,000002] thunderbolt 0000:8a:00.0: re-calculating bandwidth estimation for group 2
> [  +0,000157] thunderbolt 0000:8a:00.0: bandwidth estimation for group 2 done
> [  +0,000001] thunderbolt 0000:8a:00.0: bandwidth re-calculation done
> [  +0,019318] thunderbolt 0000:8a:00.0: acking DP_BW (0x20) notification on 0
> [  +0,000022] thunderbolt 0000:8a:00.0: 0:14: handling bandwidth allocation request, retry 0
> [  +0,000332] thunderbolt 0000:8a:00.0: 0:14: DPTX enabled bandwidth allocation mode, updating estimated bandwidth
> [  +0,000002] thunderbolt 0000:8a:00.0: bandwidth consumption changed, re-calculating estimated bandwidth
> [  +0,000001] thunderbolt 0000:8a:00.0: re-calculating bandwidth estimation for group 1
> [  +0,000903] thunderbolt 0000:8a:00.0: 0:22: scaled bandwidth 220/220, scale 0
> [  +0,000632] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): decreased bandwidth allocation to 900/900 Mb/s
> [  +0,000382] thunderbolt 0000:8a:00.0: 0:3: link maximum bandwidth 36000/36000 Mb/s
> [  +0,000128] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): consumed bandwidth 1350/1350 Mb/s
> [  +0,000255] thunderbolt 0000:8a:00.0: 3:1: link maximum bandwidth 36000/36000 Mb/s
> [  +0,000128] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): consumed bandwidth 1350/1350 Mb/s
> [  +0,000129] thunderbolt 0000:8a:00.0: 0:13 <-> 3:13 (DP): re-calculated estimated bandwidth 26150 (+ 8500 reserved) = 34650 Mb/s
> [  +0,000409] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): reclaiming unused bandwidth
> [  +0,000367] thunderbolt 0000:8a:00.0: 0:3: link maximum bandwidth 36000/36000 Mb/s
> [  +0,000894] thunderbolt 0000:8a:00.0: 0:13 <-> 3:13 (DP): consumed bandwidth 0/0 Mb/s
> [  +0,000128] thunderbolt 0000:8a:00.0: 3:1: link maximum bandwidth 36000/36000 Mb/s
> [  +0,000891] thunderbolt 0000:8a:00.0: acking DP_BW (0x20) notification on 0
> [  +0,000010] thunderbolt 0000:8a:00.0: 0:13 <-> 3:13 (DP): consumed bandwidth 0/0 Mb/s
> [  +0,000007] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): available bandwidth 36000/27500 Mb/s
> [  +0,001012] thunderbolt 0000:8a:00.0: 0:22: scaled bandwidth 2198/2198, scale 0
> [  +0,000648] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): increased bandwidth allocation to 9000/9000 Mb/s
> [  +0,000009] thunderbolt 0000:8a:00.0: bandwidth estimation for group 1 done
> [  +0,000002] thunderbolt 0000:8a:00.0: re-calculating bandwidth estimation for group 2
> [  +0,000878] thunderbolt 0000:8a:00.0: 0:21: scaled bandwidth 220/220, scale 0
> [  +0,000640] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): decreased bandwidth allocation to 900/900 Mb/s
> [  +0,000641] thunderbolt 0000:8a:00.0: 0:1: link maximum bandwidth 36000/108000 Mb/s
> [  +0,000127] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): consumed bandwidth 3000/3000 Mb/s
> [  +0,000128] thunderbolt 0000:8a:00.0: 0:1: reserving 1500/1500 Mb/s for PCIe
> [  +0,000384] thunderbolt 0000:8a:00.0: 1:1: link maximum bandwidth 36000/108000 Mb/s
> [  +0,000130] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): consumed bandwidth 3000/3000 Mb/s
> [  +0,000128] thunderbolt 0000:8a:00.0: 1:1: reserving 1500/1500 Mb/s for PCIe
> [  +0,000009] thunderbolt 0000:8a:00.0: 0:14 <-> 1:12 (DP): re-calculated estimated bandwidth 103500 (+ 0 reserved) = 103500 Mb/s
> [  +0,000373] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): reclaiming unused bandwidth
> [  +0,000637] thunderbolt 0000:8a:00.0: 0:1: link maximum bandwidth 72000/72000 Mb/s
> [  +0,000127] thunderbolt 0000:8a:00.0: 0:1: reserving 1500/1500 Mb/s for PCIe
> [  +0,000383] thunderbolt 0000:8a:00.0: 0:14 <-> 1:12 (DP): consumed bandwidth 0/25920 Mb/s
> [  +0,000393] thunderbolt 0000:8a:00.0: 1:1: link maximum bandwidth 72000/72000 Mb/s
> [  +0,000121] thunderbolt 0000:8a:00.0: 1:1: reserving 1500/1500 Mb/s for PCIe
> [  +0,000384] thunderbolt 0000:8a:00.0: 0:14 <-> 1:12 (DP): consumed bandwidth 0/25920 Mb/s
> [  +0,000005] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): available bandwidth 70500/44580 Mb/s
> [  +0,001019] thunderbolt 0000:8a:00.0: 0:21: scaled bandwidth 3599/3599, scale 0
> [  +0,000640] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): increased bandwidth allocation to 14738/14738 Mb/s
> [  +0,000005] thunderbolt 0000:8a:00.0: bandwidth estimation for group 2 done
> [  +0,000002] thunderbolt 0000:8a:00.0: bandwidth re-calculation done
> [  +0,000008] thunderbolt 0000:8a:00.0: 0:14: handling bandwidth allocation request, retry 0
> [  +0,000368] thunderbolt 0000:8a:00.0: 0:14: requested bandwidth 0 Mb/s
> [  +0,000776] thunderbolt 0000:8a:00.0: 0:14 <-> 1:12 (DP): bandwidth allocated currently 0/25920 Mb/s
> [  +0,000340] thunderbolt 0000:8a:00.0: 0:14 <-> 1:12 (DP): corrected bandwidth request 0/0 Mb/s
> [  +0,001967] thunderbolt 0000:8a:00.0: 0:14 <-> 1:12 (DP): bandwidth allocation changed to 0/0 Mb/s
> [  +0,000007] thunderbolt 0000:8a:00.0: bandwidth consumption changed, re-calculating estimated bandwidth
> [  +0,000002] thunderbolt 0000:8a:00.0: re-calculating bandwidth estimation for group 1
> [  +0,000819] thunderbolt 0000:8a:00.0: 0:22: scaled bandwidth 220/220, scale 0
> [  +0,000640] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): decreased bandwidth allocation to 900/900 Mb/s
> [  +0,000384] thunderbolt 0000:8a:00.0: 0:3: link maximum bandwidth 36000/36000 Mb/s
> [  +0,000108] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): consumed bandwidth 1350/1350 Mb/s
> [  +0,000259] thunderbolt 0000:8a:00.0: 3:1: link maximum bandwidth 36000/36000 Mb/s
> [  +0,000147] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): consumed bandwidth 1350/1350 Mb/s
> [  +0,000110] thunderbolt 0000:8a:00.0: 0:13 <-> 3:13 (DP): re-calculated estimated bandwidth 26150 (+ 8500 reserved) = 34650 Mb/s
> [  +0,000399] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): reclaiming unused bandwidth
> [  +0,000384] thunderbolt 0000:8a:00.0: 0:3: link maximum bandwidth 36000/36000 Mb/s
> [  +0,000894] thunderbolt 0000:8a:00.0: 0:13 <-> 3:13 (DP): consumed bandwidth 0/0 Mb/s
> [  +0,000129] thunderbolt 0000:8a:00.0: 3:1: link maximum bandwidth 36000/36000 Mb/s
> [  +0,001386] thunderbolt 0000:8a:00.0: 0:13 <-> 3:13 (DP): consumed bandwidth 0/0 Mb/s
> [  +0,000007] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): available bandwidth 36000/27500 Mb/s
> [  +0,001000] thunderbolt 0000:8a:00.0: 0:22: scaled bandwidth 2198/2198, scale 0
> [  +0,000660] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): increased bandwidth allocation to 9000/9000 Mb/s
> [  +0,000004] thunderbolt 0000:8a:00.0: bandwidth estimation for group 1 done
> [  +0,000002] thunderbolt 0000:8a:00.0: re-calculating bandwidth estimation for group 2
> [  +0,000886] thunderbolt 0000:8a:00.0: 0:21: scaled bandwidth 220/220, scale 0
> [  +0,000640] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): decreased bandwidth allocation to 900/900 Mb/s
> [  +0,000639] thunderbolt 0000:8a:00.0: 0:1: link maximum bandwidth 36000/108000 Mb/s
> [  +0,000109] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): consumed bandwidth 3000/3000 Mb/s
> [  +0,000161] thunderbolt 0000:8a:00.0: 0:1: reserving 1500/1500 Mb/s for PCIe
> [  +0,000369] thunderbolt 0000:8a:00.0: 1:1: link maximum bandwidth 36000/108000 Mb/s
> [  +0,000110] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): consumed bandwidth 3000/3000 Mb/s
> [  +0,000166] thunderbolt 0000:8a:00.0: 1:1: reserving 1500/1500 Mb/s for PCIe
> [  +0,000003] thunderbolt 0000:8a:00.0: 0:14 <-> 1:12 (DP): re-calculated estimated bandwidth 103500 (+ 0 reserved) = 103500 Mb/s
> [  +0,000362] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): reclaiming unused bandwidth
> [  +0,000640] thunderbolt 0000:8a:00.0: 0:1: link maximum bandwidth 72000/72000 Mb/s
> [  +0,000129] thunderbolt 0000:8a:00.0: 0:1: reserving 1500/1500 Mb/s for PCIe
> [  +0,000778] thunderbolt 0000:8a:00.0: 0:14 <-> 1:12 (DP): consumed bandwidth 0/0 Mb/s
> [  +0,000382] thunderbolt 0000:8a:00.0: 1:1: link maximum bandwidth 72000/72000 Mb/s
> [  +0,000128] thunderbolt 0000:8a:00.0: 1:1: reserving 1500/1500 Mb/s for PCIe
> [  +0,000767] thunderbolt 0000:8a:00.0: 0:14 <-> 1:12 (DP): consumed bandwidth 0/0 Mb/s
> [  +0,000003] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): available bandwidth 70500/70500 Mb/s
> [  +0,001023] thunderbolt 0000:8a:00.0: 0:21: scaled bandwidth 3599/3599, scale 0
> [  +0,000702] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): increased bandwidth allocation to 14738/14738 Mb/s
> [  +0,000023] thunderbolt 0000:8a:00.0: bandwidth estimation for group 2 done
> [  +0,509004] thunderbolt 0000:8a:00.0: acking DP_BW (0x20) notification on 0
> [  +0,000022] thunderbolt 0000:8a:00.0: 0:13: handling bandwidth allocation request, retry 0
> [  +0,000362] thunderbolt 0000:8a:00.0: 0:13: requested bandwidth 12500 Mb/s
> [  +0,000555] thunderbolt 0000:8a:00.0: 0:13 <-> 3:13 (DP): bandwidth allocated currently 0/0 Mb/s
> [  +0,000385] thunderbolt 0000:8a:00.0: 0:13 <-> 3:13 (DP): corrected bandwidth request 0/12500 Mb/s
> [  +0,000768] thunderbolt 0000:8a:00.0: 0:22: scaled bandwidth 220/220, scale 0
> [  +0,000640] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): decreased bandwidth allocation to 900/900 Mb/s
> [  +0,000383] thunderbolt 0000:8a:00.0: 0:3: link maximum bandwidth 36000/36000 Mb/s
> [  +0,000129] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): consumed bandwidth 1350/1350 Mb/s
> [  +0,000253] thunderbolt 0000:8a:00.0: 3:1: link maximum bandwidth 36000/36000 Mb/s
> [  +0,000130] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): consumed bandwidth 1350/1350 Mb/s
> [  +0,000128] thunderbolt 0000:8a:00.0: 0:13 <-> 3:13 (DP): bandwidth available for allocation 34650/26150 (+ 8500 reserved) Mb/s
> [  +0,001688] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): reclaiming unused bandwidth
> [  +0,000361] thunderbolt 0000:8a:00.0: 0:3: link maximum bandwidth 36000/36000 Mb/s
> [  +0,002212] thunderbolt 0000:8a:00.0: 0:13 <-> 3:13 (DP): consumed bandwidth 0/12500 Mb/s
> [  +0,000146] thunderbolt 0000:8a:00.0: 3:1: link maximum bandwidth 36000/36000 Mb/s
> [  +0,000963] thunderbolt 0000:8a:00.0: 0:13 <-> 3:13 (DP): consumed bandwidth 0/12500 Mb/s
> [  +0,000004] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): available bandwidth 36000/15000 Mb/s
> [  +0,001021] thunderbolt 0000:8a:00.0: 0:22: scaled bandwidth 2198/2198, scale 0
> [  +0,000580] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): increased bandwidth allocation to 9000/9000 Mb/s
> [  +0,000003] thunderbolt 0000:8a:00.0: 0:13 <-> 3:13 (DP): bandwidth allocation changed to 0/12500 Mb/s
> [  +0,000002] thunderbolt 0000:8a:00.0: bandwidth consumption changed, re-calculating estimated bandwidth
> [  +0,000001] thunderbolt 0000:8a:00.0: re-calculating bandwidth estimation for group 1
> [  +0,001966] thunderbolt 0000:8a:00.0: 0:22: scaled bandwidth 220/220, scale 0
> [  +0,000656] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): decreased bandwidth allocation to 900/900 Mb/s
> [  +0,000384] thunderbolt 0000:8a:00.0: 0:3: link maximum bandwidth 36000/36000 Mb/s
> [  +0,000109] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): consumed bandwidth 1350/1350 Mb/s
> [  +0,000256] thunderbolt 0000:8a:00.0: 3:1: link maximum bandwidth 36000/36000 Mb/s
> [  +0,000146] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): consumed bandwidth 1350/1350 Mb/s
> [  +0,000129] thunderbolt 0000:8a:00.0: 0:13 <-> 3:13 (DP): re-calculated estimated bandwidth 26150 (+ 8500 reserved) = 34650 Mb/s
> [  +0,000383] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): reclaiming unused bandwidth
> [  +0,000385] thunderbolt 0000:8a:00.0: 0:3: link maximum bandwidth 36000/36000 Mb/s
> [  +0,000895] thunderbolt 0000:8a:00.0: 0:13 <-> 3:13 (DP): consumed bandwidth 0/12500 Mb/s
> [  +0,000128] thunderbolt 0000:8a:00.0: 3:1: link maximum bandwidth 36000/36000 Mb/s
> [  +0,000897] thunderbolt 0000:8a:00.0: 0:13 <-> 3:13 (DP): consumed bandwidth 0/12500 Mb/s
> [  +0,000002] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): available bandwidth 36000/15000 Mb/s
> [  +0,001021] thunderbolt 0000:8a:00.0: 0:22: scaled bandwidth 2198/2198, scale 0
> [  +0,000640] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): increased bandwidth allocation to 9000/9000 Mb/s
> [  +0,000001] thunderbolt 0000:8a:00.0: bandwidth estimation for group 1 done
> [  +0,000001] thunderbolt 0000:8a:00.0: re-calculating bandwidth estimation for group 2
> [  +0,000894] thunderbolt 0000:8a:00.0: 0:21: scaled bandwidth 220/220, scale 0
> [  +0,000640] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): decreased bandwidth allocation to 900/900 Mb/s
> [  +0,000640] thunderbolt 0000:8a:00.0: 0:1: link maximum bandwidth 36000/108000 Mb/s
> [  +0,000129] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): consumed bandwidth 3000/3000 Mb/s
> [  +0,000127] thunderbolt 0000:8a:00.0: 0:1: reserving 1500/1500 Mb/s for PCIe
> [  +0,000383] thunderbolt 0000:8a:00.0: 1:1: link maximum bandwidth 36000/108000 Mb/s
> [  +0,000128] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): consumed bandwidth 3000/3000 Mb/s
> [  +0,000130] thunderbolt 0000:8a:00.0: 1:1: reserving 1500/1500 Mb/s for PCIe
> [  +0,000001] thunderbolt 0000:8a:00.0: 0:14 <-> 1:12 (DP): re-calculated estimated bandwidth 103500 (+ 0 reserved) = 103500 Mb/s
> [  +0,000384] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): reclaiming unused bandwidth
> [  +0,000638] thunderbolt 0000:8a:00.0: 0:1: link maximum bandwidth 72000/72000 Mb/s
> [  +0,000128] thunderbolt 0000:8a:00.0: 0:1: reserving 1500/1500 Mb/s for PCIe
> [  +0,000768] thunderbolt 0000:8a:00.0: 0:14 <-> 1:12 (DP): consumed bandwidth 0/0 Mb/s
> [  +0,000385] thunderbolt 0000:8a:00.0: 1:1: link maximum bandwidth 72000/72000 Mb/s
> [  +0,000127] thunderbolt 0000:8a:00.0: 1:1: reserving 1500/1500 Mb/s for PCIe
> [  +0,000769] thunderbolt 0000:8a:00.0: 0:14 <-> 1:12 (DP): consumed bandwidth 0/0 Mb/s
> [  +0,000001] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): available bandwidth 70500/70500 Mb/s
> [  +0,001026] thunderbolt 0000:8a:00.0: 0:21: scaled bandwidth 3599/3599, scale 0
> [  +0,000637] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): increased bandwidth allocation to 14738/14738 Mb/s
> [  +0,000002] thunderbolt 0000:8a:00.0: bandwidth estimation for group 2 done
> [  +0,000001] thunderbolt 0000:8a:00.0: bandwidth re-calculation done                                                                                                                                                                          [  +0,761329] thunderbolt 0000:8a:00.0: acking DP_BW (0x20) notification on 0
> [  +0,000012] thunderbolt 0000:8a:00.0: 0:14: handling bandwidth allocation request, retry 0
> [  +0,000341] thunderbolt 0000:8a:00.0: 0:14: requested bandwidth 12500 Mb/s
> [  +0,000688] thunderbolt 0000:8a:00.0: 0:14 <-> 1:12 (DP): bandwidth allocated currently 0/0 Mb/s
> [  +0,000337] thunderbolt 0000:8a:00.0: 0:14 <-> 1:12 (DP): corrected bandwidth request 0/12500 Mb/s
> [  +0,000768] thunderbolt 0000:8a:00.0: 0:21: scaled bandwidth 220/220, scale 0
> [  +0,000640] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): decreased bandwidth allocation to 900/900 Mb/s
> [  +0,000640] thunderbolt 0000:8a:00.0: 0:1: link maximum bandwidth 36000/108000 Mb/s
> [  +0,000127] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): consumed bandwidth 3000/3000 Mb/s
> [  +0,000128] thunderbolt 0000:8a:00.0: 0:1: reserving 1500/1500 Mb/s for PCIe
> [  +0,000385] thunderbolt 0000:8a:00.0: 1:1: link maximum bandwidth 36000/108000 Mb/s
> [  +0,000127] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): consumed bandwidth 3000/3000 Mb/s
> [  +0,000128] thunderbolt 0000:8a:00.0: 1:1: reserving 1500/1500 Mb/s for PCIe
> [  +0,000002] thunderbolt 0000:8a:00.0: 0:14 <-> 1:12 (DP): bandwidth available for allocation 31500/103500 (+ 0 reserved) Mb/s
> [  +0,001699] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): reclaiming unused bandwidth
> [  +0,000604] thunderbolt 0000:8a:00.0: 0:1: link maximum bandwidth 72000/72000 Mb/s
> [  +0,000127] thunderbolt 0000:8a:00.0: 0:1: reserving 1500/1500 Mb/s for PCIe
> [  +0,000768] thunderbolt 0000:8a:00.0: 0:14 <-> 1:12 (DP): consumed bandwidth 0/12500 Mb/s
> [  +0,000430] thunderbolt 0000:8a:00.0: 1:1: link maximum bandwidth 72000/72000 Mb/s
> [  +0,000141] thunderbolt 0000:8a:00.0: 1:1: reserving 1500/1500 Mb/s for PCIe
> [  +0,000770] thunderbolt 0000:8a:00.0: 0:14 <-> 1:12 (DP): consumed bandwidth 0/12500 Mb/s
> [  +0,000002] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): available bandwidth 70500/58000 Mb/s
> [  +0,001026] thunderbolt 0000:8a:00.0: 0:21: scaled bandwidth 3599/3599, scale 0
> [  +0,000637] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): increased bandwidth allocation to 14738/14738 Mb/s
> [  +0,000006] thunderbolt 0000:8a:00.0: 0:14 <-> 1:12 (DP): bandwidth allocation changed to 0/12500 Mb/s
> [  +0,000003] thunderbolt 0000:8a:00.0: bandwidth consumption changed, re-calculating estimated bandwidth
> [  +0,000002] thunderbolt 0000:8a:00.0: re-calculating bandwidth estimation for group 1
> [  +0,000885] thunderbolt 0000:8a:00.0: 0:22: scaled bandwidth 220/220, scale 0
> [  +0,000640] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): decreased bandwidth allocation to 900/900 Mb/s
> [  +0,000385] thunderbolt 0000:8a:00.0: 0:3: link maximum bandwidth 36000/36000 Mb/s
> [  +0,000113] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): consumed bandwidth 1350/1350 Mb/s
> [  +0,000256] thunderbolt 0000:8a:00.0: 3:1: link maximum bandwidth 36000/36000 Mb/s
> [  +0,000144] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): consumed bandwidth 1350/1350 Mb/s
> [  +0,000112] thunderbolt 0000:8a:00.0: 0:13 <-> 3:13 (DP): re-calculated estimated bandwidth 26150 (+ 8500 reserved) = 34650 Mb/s
> [  +0,000400] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): reclaiming unused bandwidth
> [  +0,000383] thunderbolt 0000:8a:00.0: 0:3: link maximum bandwidth 36000/36000 Mb/s
> [  +0,000895] thunderbolt 0000:8a:00.0: 0:13 <-> 3:13 (DP): consumed bandwidth 0/12500 Mb/s
> [  +0,000112] thunderbolt 0000:8a:00.0: 3:1: link maximum bandwidth 36000/36000 Mb/s
> [  +0,000912] thunderbolt 0000:8a:00.0: 0:13 <-> 3:13 (DP): consumed bandwidth 0/12500 Mb/s
> [  +0,000003] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): available bandwidth 36000/15000 Mb/s
> [  +0,001022] thunderbolt 0000:8a:00.0: 0:22: scaled bandwidth 2198/2198, scale 0
> [  +0,000639] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): increased bandwidth allocation to 9000/9000 Mb/s
> [  +0,000003] thunderbolt 0000:8a:00.0: bandwidth estimation for group 1 done
> [  +0,000001] thunderbolt 0000:8a:00.0: re-calculating bandwidth estimation for group 2
> [  +0,000892] thunderbolt 0000:8a:00.0: 0:21: scaled bandwidth 220/220, scale 0
> [  +0,000626] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): decreased bandwidth allocation to 900/900 Mb/s
> [  +0,000654] thunderbolt 0000:8a:00.0: 0:1: link maximum bandwidth 36000/108000 Mb/s
> [  +0,000112] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): consumed bandwidth 3000/3000 Mb/s
> [  +0,000143] thunderbolt 0000:8a:00.0: 0:1: reserving 1500/1500 Mb/s for PCIe
> [  +0,000390] thunderbolt 0000:8a:00.0: 1:1: link maximum bandwidth 36000/108000 Mb/s
> [  +0,000111] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): consumed bandwidth 3000/3000 Mb/s
> [  +0,000142] thunderbolt 0000:8a:00.0: 1:1: reserving 1500/1500 Mb/s for PCIe
> [  +0,000007] thunderbolt 0000:8a:00.0: 0:14 <-> 1:12 (DP): re-calculated estimated bandwidth 103500 (+ 0 reserved) = 103500 Mb/s
> [  +0,000376] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): reclaiming unused bandwidth
> [  +0,000640] thunderbolt 0000:8a:00.0: 0:1: link maximum bandwidth 72000/72000 Mb/s
> [  +0,000114] thunderbolt 0000:8a:00.0: 0:1: reserving 1500/1500 Mb/s for PCIe
> [  +0,000783] thunderbolt 0000:8a:00.0: 0:14 <-> 1:12 (DP): consumed bandwidth 0/12500 Mb/s
> [  +0,000383] thunderbolt 0000:8a:00.0: 1:1: link maximum bandwidth 72000/72000 Mb/s
> [  +0,000113] thunderbolt 0000:8a:00.0: 1:1: reserving 1500/1500 Mb/s for PCIe
> [  +0,000782] thunderbolt 0000:8a:00.0: 0:14 <-> 1:12 (DP): consumed bandwidth 0/12500 Mb/s
> [  +0,000003] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): available bandwidth 70500/58000 Mb/s
> [  +0,001020] thunderbolt 0000:8a:00.0: 0:21: scaled bandwidth 3599/3599, scale 0
> [  +0,000641] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): increased bandwidth allocation to 14738/14738 Mb/s
> [  +0,000003] thunderbolt 0000:8a:00.0: bandwidth estimation for group 2 done
> [  +0,000002] thunderbolt 0000:8a:00.0: bandwidth re-calculation done
> [  +9,075811] thunderbolt 0000:8a:00.0: group 1 released total 8500 Mb/s
> [  +0,000005] thunderbolt 0000:8a:00.0: bandwidth consumption changed, re-calculating estimated bandwidth
> [  +0,000001] thunderbolt 0000:8a:00.0: re-calculating bandwidth estimation for group 1
> [Nov 2 16:10] thunderbolt 0000:8a:00.0: 0:22: scaled bandwidth 220/220, scale 0
> [  +0,000577] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): decreased bandwidth allocation to 900/900 Mb/s
> [  +0,000464] thunderbolt 0000:8a:00.0: 0:3: link maximum bandwidth 36000/36000 Mb/s
> [  +0,000096] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): consumed bandwidth 1350/1350 Mb/s
> [  +0,000282] thunderbolt 0000:8a:00.0: 3:1: link maximum bandwidth 36000/36000 Mb/s
> [  +0,000127] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): consumed bandwidth 1350/1350 Mb/s
> [  +0,000037] thunderbolt 0000:8a:00.0: 0:13 <-> 3:13 (DP): re-calculated estimated bandwidth 34650 (+ 0 reserved) = 34650 Mb/s
> [  +0,000403] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): reclaiming unused bandwidth
> [  +0,000382] thunderbolt 0000:8a:00.0: 0:3: link maximum bandwidth 36000/36000 Mb/s
> [  +0,000896] thunderbolt 0000:8a:00.0: 0:13 <-> 3:13 (DP): consumed bandwidth 0/12500 Mb/s
> [  +0,000128] thunderbolt 0000:8a:00.0: 3:1: link maximum bandwidth 36000/36000 Mb/s
> [  +0,000896] thunderbolt 0000:8a:00.0: 0:13 <-> 3:13 (DP): consumed bandwidth 0/12500 Mb/s
> [  +0,000001] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): available bandwidth 36000/23500 Mb/s
> [  +0,001028] thunderbolt 0000:8a:00.0: 0:22: scaled bandwidth 2198/2198, scale 0
> [  +0,000636] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): increased bandwidth allocation to 9000/9000 Mb/s
> [  +0,000001] thunderbolt 0000:8a:00.0: bandwidth estimation for group 1 done
> [  +0,000001] thunderbolt 0000:8a:00.0: re-calculating bandwidth estimation for group 2
> [  +0,000893] thunderbolt 0000:8a:00.0: 0:21: scaled bandwidth 220/220, scale 0
> [  +0,000640] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): decreased bandwidth allocation to 900/900 Mb/s
> [  +0,000640] thunderbolt 0000:8a:00.0: 0:1: link maximum bandwidth 36000/108000 Mb/s
> [  +0,000128] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): consumed bandwidth 3000/3000 Mb/s
> [  +0,000129] thunderbolt 0000:8a:00.0: 0:1: reserving 1500/1500 Mb/s for PCIe
> [  +0,000383] thunderbolt 0000:8a:00.0: 1:1: link maximum bandwidth 36000/108000 Mb/s
> [  +0,000137] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): consumed bandwidth 3000/3000 Mb/s
> [  +0,000104] thunderbolt 0000:8a:00.0: 1:1: reserving 1500/1500 Mb/s for PCIe
> [  +0,000001] thunderbolt 0000:8a:00.0: 0:14 <-> 1:12 (DP): re-calculated estimated bandwidth 103500 (+ 0 reserved) = 103500 Mb/s
> [  +0,000406] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): reclaiming unused bandwidth
> [  +0,000633] thunderbolt 0000:8a:00.0: 0:1: link maximum bandwidth 72000/72000 Mb/s
> [  +0,000128] thunderbolt 0000:8a:00.0: 0:1: reserving 1500/1500 Mb/s for PCIe
> [  +0,000768] thunderbolt 0000:8a:00.0: 0:14 <-> 1:12 (DP): consumed bandwidth 0/12500 Mb/s
> [  +0,000383] thunderbolt 0000:8a:00.0: 1:1: link maximum bandwidth 72000/72000 Mb/s
> [  +0,000138] thunderbolt 0000:8a:00.0: 1:1: reserving 1500/1500 Mb/s for PCIe
> [  +0,000863] thunderbolt 0000:8a:00.0: 0:14 <-> 1:12 (DP): consumed bandwidth 0/12500 Mb/s
> [  +0,000002] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): available bandwidth 70500/58000 Mb/s
> [  +0,001059] thunderbolt 0000:8a:00.0: 0:21: scaled bandwidth 3599/3599, scale 0
> [  +0,000583] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): increased bandwidth allocation to 14738/14738 Mb/s
> [  +0,000002] thunderbolt 0000:8a:00.0: bandwidth estimation for group 2 done
> [  +0,000001] thunderbolt 0000:8a:00.0: bandwidth re-calculation done



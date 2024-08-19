Return-Path: <linux-usb+bounces-13652-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D36E956C3F
	for <lists+linux-usb@lfdr.de>; Mon, 19 Aug 2024 15:36:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BFA211F224C9
	for <lists+linux-usb@lfdr.de>; Mon, 19 Aug 2024 13:36:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E26F116C6AC;
	Mon, 19 Aug 2024 13:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j8NUuVRi"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3391166F33
	for <linux-usb@vger.kernel.org>; Mon, 19 Aug 2024 13:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724074561; cv=none; b=FSPliQgl9QB16fhbeywK4aWrzHAHKCi1AqA+Zj01+ido6x+8H8Se1xSZCoeDy9zGJmgPB0tWTGdm/4aduYS/QfsAjwVBL7vlB07R/wNG+rDhbppn9jNg25gqqpuxFsNsU/tajXs650coaG62G/6ySY/7B7I0PJyLdCxFvX/lN9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724074561; c=relaxed/simple;
	bh=sguVAaZInA44R9ttCgog0xokgKby+VQWhi8wNcdALZU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=LQEHGgMYpaHmFd2tYcT71/6AO5OK4ZNGGoUkxJ9fKdYm9TWw+t+dxt8XfxZ8HnbDQQlfIoyey1EC0RSb+D7gp0+LSWfh6wJfRsstWs7QtZITlzCA7Ur+Ye4dIJOgOjXfauMO3InDE0ZUOIRb9pfLMDuam84/jI3/kuoiAXlqkcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j8NUuVRi; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724074560; x=1755610560;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=sguVAaZInA44R9ttCgog0xokgKby+VQWhi8wNcdALZU=;
  b=j8NUuVRiHFnCnFEu5KWVRQJ0HzVwkRp0l5rEED0qtH4Z89OylHqao3nU
   4harY5zAraudAtL5W64W3Z17tgnuZqZRMBVIDEDjo48C3TQmn3pnaWBxI
   kg3215gQoleXw8QSHZn9L98EXzFaKBpaQ5GnPn0JbZ+ExuG7x++xtiNuU
   bEIkhTVI8iFXuawGemdYWZ+IW7FtbqzuzcrELRw4Jdx+Q7GhT9cU8QTxU
   jb8GpqqNN6M/PL2TVwcxL6FYQ0C8bLMsvmawUd8LuHYhDcchsgDLnwOzK
   YuCk5vjpOv17fOkPwY8EK8pLYYLLXYv5SuCTfm5CczJPgqc/HJynPZ7ah
   A==;
X-CSE-ConnectionGUID: TjCdyTSnSVuW3l+UZWcBmg==
X-CSE-MsgGUID: BSjBiBd8QtG93TJaeB23wg==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="32987425"
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; 
   d="scan'208";a="32987425"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2024 06:35:58 -0700
X-CSE-ConnectionGUID: worCYbeQRY2p3qDMs5bM3A==
X-CSE-MsgGUID: zdYEjgKCSh2kY9LhgEDaow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; 
   d="scan'208";a="60046836"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by fmviesa006.fm.intel.com with ESMTP; 19 Aug 2024 06:35:57 -0700
Message-ID: <2a92b0fb-226c-4bc3-a648-9602d869a757@linux.intel.com>
Date: Mon, 19 Aug 2024 16:38:01 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Misbehaving Alder Lake-N PCH USB 3.2 xHCI Host Controller
To: FPS <mista.tapas@gmx.net>, linux-usb@vger.kernel.org
References: <76e1a191-020d-4a76-97f6-237f9bd0ede0@gmx.net>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <76e1a191-020d-4a76-97f6-237f9bd0ede0@gmx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 18.8.2024 23.56, FPS wrote:
> Hi!
> 
> I hope this mail is not off-topic for this list :)
> 
> I have recently acquired a mini PC equipped with an N97 CPU for use in
> my electric guitar setup (I have good experiences with my previous Intel
> Celeron J4125-based mini PC), but sadly I can't get it to work reliably
> with ALSA/Jack using a USB audio class 2.0 sound card.
> 
> The system is running a decently setup rt-kernel:
> 
> Linux ogfx97 6.6.44-rt39 #1-NixOS SMP PREEMPT_RT Sat Aug  3 06:54:42 UTC
> 2024 x86_64 GNU/Linux
> 
> Cyclictest gives sufficiently nice results that give me hope that it
> should be possible to use this system for realtime-audio. This is just a
> short example run but it's quite representative:
> 
> [fps@ogfx97:~]$ sudo cyclictest -m -p 90 -S
> # /dev/cpu_dma_latency set to 0us
> policy: fifo: loadavg: 2.07 1.36 0.74 2/644 9634
> 
> T: 0 ( 9615) P:90 I:1000 C:   8715 Min:      1 Act:    1 Avg:    2 Max:
>      14
> T: 1 ( 9616) P:90 I:1500 C:   5808 Min:      1 Act:    5 Avg:    2 Max:
>      28
> T: 2 ( 9617) P:90 I:2000 C:   4355 Min:      1 Act:    1 Avg:    2 Max:
>      15
> T: 3 ( 9618) P:90 I:2500 C:   3483 Min:      1 Act:    1 Avg:    3 Max:
>      24
> 
> As usual I have elevated the xhci and ahci IRQ kernel threads to
> SCHED_FIFO priority 90 and done some other shenanigans like idle=poll,
> disabling C-states in the UEFI firmware, etc..
> 
> The xhci in this system is:
> 
> 00:14.0 USB controller: Intel Corporation Alder Lake-N PCH USB 3.2 xHCI
> Host Controller (prog-if 30 [XHCI])
>          DeviceName: Onboard - Other
>          Subsystem: Intel Corporation Device 7270
>          Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop-
> ParErr- Stepping- SERR- FastB2B- DisINTx+
>          Status: Cap+ 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium
>  >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
>          Latency: 0
>          Interrupt: pin A routed to IRQ 124
>          Region 0: Memory at 6001100000 (64-bit, non-prefetchable)
> [size=64K]
>          Capabilities: <access denied>
>          Kernel driver in use: xhci_hcd
>          Kernel modules: xhci_pci
> 
> Sadly there's some built-in junk on the USB besides my keyboard, mouse
> and audio interface:
> 
> [fps@ogfx97:~]$ lsusb -tv
> /:  Bus 001.Port 001: Dev 001, Class=root_hub, Driver=xhci_hcd/12p, 480M
>      ID 1d6b:0002 Linux Foundation 2.0 root hub
>      |__ Port 001: Dev 004, If 0, Class=Human Interface Device,
> Driver=usbhid, 1.5M
>          ID 046d:c31c Logitech, Inc. Keyboard K120
>      |__ Port 001: Dev 004, If 1, Class=Human Interface Device,
> Driver=usbhid, 1.5M
>          ID 046d:c31c Logitech, Inc. Keyboard K120
>      |__ Port 002: Dev 005, If 0, Class=Human Interface Device,
> Driver=usbhid, 12M
>          ID 046d:c07d Logitech, Inc. G502 Mouse
>      |__ Port 002: Dev 005, If 1, Class=Human Interface Device,
> Driver=usbhid, 12M
>          ID 046d:c07d Logitech, Inc. G502 Mouse
>      |__ Port 004: Dev 014, If 0, Class=Audio, Driver=snd-usb-audio, 480M
>          ID 1235:8202 Focusrite-Novation Focusrite Scarlett 2i2 2nd Gen
>      |__ Port 004: Dev 014, If 1, Class=Audio, Driver=snd-usb-audio, 480M
>          ID 1235:8202 Focusrite-Novation Focusrite Scarlett 2i2 2nd Gen
>      |__ Port 004: Dev 014, If 2, Class=Audio, Driver=snd-usb-audio, 480M
>          ID 1235:8202 Focusrite-Novation Focusrite Scarlett 2i2 2nd Gen
>      |__ Port 004: Dev 014, If 3, Class=Vendor Specific Class,
> Driver=[none], 480M
>          ID 1235:8202 Focusrite-Novation Focusrite Scarlett 2i2 2nd Gen
>      |__ Port 005: Dev 002, If 0, Class=Wireless, Driver=[none], 12M
>          ID 0bda:c821 Realtek Semiconductor Corp.
>      |__ Port 005: Dev 002, If 1, Class=Wireless, Driver=[none], 12M
>          ID 0bda:c821 Realtek Semiconductor Corp.
>      |__ Port 006: Dev 003, If 0, Class=Audio, Driver=snd-usb-audio, 12M
>          ID 0573:1573 Zoran Co. Personal Media Division (Nogatech)
>      |__ Port 006: Dev 003, If 1, Class=Audio, Driver=snd-usb-audio, 12M
>          ID 0573:1573 Zoran Co. Personal Media Division (Nogatech)
>      |__ Port 006: Dev 003, If 2, Class=Audio, Driver=snd-usb-audio, 12M
>          ID 0573:1573 Zoran Co. Personal Media Division (Nogatech)
>      |__ Port 006: Dev 003, If 3, Class=Human Interface Device,
> Driver=[none], 12M
>          ID 0573:1573 Zoran Co. Personal Media Division (Nogatech)
> /:  Bus 002.Port 001: Dev 001, Class=root_hub, Driver=xhci_hcd/4p, 10000M
>      ID 1d6b:0003 Linux Foundation 3.0 root hub
> 
> OK, with that out of the way, what's the problem? Well, with an USB
> audio class 2.0 device I would expect a maximum jitter of a microframe
> (125 us) regardless of the buffer size and I have used this audio
> interface successfully on different xHCI HCDs with buffer sizes as low
> as 24 samples at 48000 Hz sampling rate (0.5 ms period duration).
> 
> But in this mini PC I cannot run such low period durations/buffer sizes
> at all. Sporadically I see delays of up to 3 or 4 ms - which makes it
> absolutely unusable for real-time audio stuff. It can't really be NMIs
> from what I can tell - they would show up in the cyclictest results. So
> I suspect the xHCI is doing something funky.
> 
> Here's another observation: When I run the audio interface with 2
> periods of 48 frames at 48000 Hz sampling rate I get constant Xruns from
> jack of about 0.004-0.008 ms. It seems that the xHCI is not willing to
> deliver all microframes in a timely manner but somehow wants a minimum
> time interval of 1 ms between them (I read the term interrupt moderation
> somewhere on the web - but I don't know if the linux xhci driver does
> something like that at all.)

The default interrupt moderation is 1ms for xHC hardware, but the xhci
PCI driver should set it to 40 microseconds.

Interupt moderation value can be checked from debugfs:
# mount -t debugfs none /sys/kernel/debug/
# cat /sys/kernel/debug/usb/xhci/0000:00:14.0/reg-runtime
MFINDEX = 0x00002570
IR0_IMAN = 0x00000002
IR0_IMOD = 0x000000a0
IR0_ERSTSZ = 0x00000002
IR0_ERSTBA_LOW = 0x05069000
IR0_ERSTBA_HIGH = 0x00000001
IR0_ERDP_LOW = 0x05067b80
IR0_ERDP_HIGH = 0x00000001

IR0_IMOD shows the interrupt moderation value in 250 nanosecond steps.
i.e. 0xa0 is 160 * 250ns =>  40000ns

> 
> How could I debug this further? All help appreciated :)

Was looking at a similar issue which turned out to be wifi driver debug
blocking softirqs for a long time. This caused the the URBs that were given
back to audio class driver in a tasklet (softirq) context to be delayed.

This changed recently a bit. USB core now uses workqueues instead of tasklets,
but issue could be similar.

I'm not familiar with cyclictest. I was debugging using ftrace myslelf.
maybe ftrace preemptoff could show if something is blocking for a long time?

echo preemptoff > /sys/kernel/debug/tracing/current_tracer

xhci dynamic debug could show if xHC controller has any issues processing
TRBs on ring buffer in time. This debug should be limited to handle_tx_event()
as dynamic debug causes some delays itself.

If there are any issues on xHC side it should print underrun/overrun, or miss
service interval errors.

Thanks
Mathias



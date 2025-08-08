Return-Path: <linux-usb+bounces-26609-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A03B1E268
	for <lists+linux-usb@lfdr.de>; Fri,  8 Aug 2025 08:43:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 140F018C26CD
	for <lists+linux-usb@lfdr.de>; Fri,  8 Aug 2025 06:43:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57770221294;
	Fri,  8 Aug 2025 06:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gWi3SVcp"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E391BFE00
	for <linux-usb@vger.kernel.org>; Fri,  8 Aug 2025 06:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754635398; cv=none; b=RRJIhBKGjbhpSiv6BpmfL1hrb6scWKbwsQOoGTY4czqGJufH0xDQCcJlzKlvOt8HZhjm/oYBCNtMVIEK+Fg9pAcQwJdQ5mLkR8St0furqorzgRMh7a4PPq2KpmjuE3SkY5rGVIRgwMh5/PKrFDWYxfEjCAfZdCERsGfezCko3So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754635398; c=relaxed/simple;
	bh=z8tLQjAUN3oGEDNfENoL+HUVuAWNPtTwyYCEL2vbr/c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gFzCECuE37zp6miz9cd847yRSMyTuH8Tj8NdswJH0+c52KbbeezJPN4Mys1spaisbuK8Ldq5eLudvqzdYwCG3yA5Ufjpdx0n4RZELqGJ3NNGC8SNvCMuZ3pk5ST6EBYOZjTyY0ifeKBtdNhI36GWaLYikUvkC0JyAYkh67KjVNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gWi3SVcp; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754635398; x=1786171398;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=z8tLQjAUN3oGEDNfENoL+HUVuAWNPtTwyYCEL2vbr/c=;
  b=gWi3SVcptX5JswZ2dnjIb6xQJ6KjWCvMZEaMWBizcZqRPc1R9OOQ+ubu
   II5h9GpUj95StTqUpBZj2FnhM9pHwhZ18OW/QD2IEVFWjNO3u7adDnMEV
   OXYbMBiteMpIDYRjGf2PdhbXDaqTjCpvo2db/ddiue7xHzwhn7xtwCw+r
   M/7KL+aS2duViMG+tccC7mIgbm8//N3mco0VVY59/xdATTIQrWD9/tm63
   yD6uL7L9qzOpqBEwZXdsI5EDWwmx9pRzoHpoVeqAKRuTGlp6tjsr4Dr67
   AeXJyarHDYu4GlWQt8HD30XVVeGhS0Ht1/G05315zFBcTPqTD5b/QxY82
   Q==;
X-CSE-ConnectionGUID: V8iL8ltkSgy5apq8LJOexQ==
X-CSE-MsgGUID: 8+CTEXIsR/e4BOXIvPonDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="74434539"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="74434539"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 23:43:17 -0700
X-CSE-ConnectionGUID: 7Eya5xWhS3y05bCUMVT/Sw==
X-CSE-MsgGUID: Y60oZlgaRmGcSgGeKJnanw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="166048283"
Received: from unknown (HELO black.igk.intel.com) ([10.91.253.5])
  by fmviesa010.fm.intel.com with ESMTP; 07 Aug 2025 23:43:15 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id E75B593; Fri, 08 Aug 2025 08:43:13 +0200 (CEST)
Date: Fri, 8 Aug 2025 08:43:13 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: En-Wei WU <en-wei.wu@canonical.com>
Cc: westeri@kernel.org, michael.jamet@intel.com, andreas.noever@gmail.com,
	YehezkelShB@gmail.com, linux-usb@vger.kernel.org,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
Subject: Re: Thunderbolt call trace occurs on hot-plug
Message-ID: <20250808064313.GM476609@black.igk.intel.com>
References: <CAMqyJG2QceTyAONn_5m956zF_rpHLpognYYWnivm7J+w6Cw=RQ@mail.gmail.com>
 <20250728063329.GR2824380@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250728063329.GR2824380@black.fi.intel.com>

Hi,

On Mon, Jul 28, 2025 at 09:33:29AM +0300, Mika Westerberg wrote:
> Hi,
> 
> On Fri, Jul 11, 2025 at 11:54:46AM +0800, En-Wei WU wrote:
> > Hi,
> > 
> > I'm seeing an issue on a Dell Pro Max 16 with Intel Arrow Lake CPU --
> > Hot-plugging a thunderbolt 4 cable into a thunderbolt 4 port (backed
> > by Intel iGPU) and connecting it to a Dell U2725QE monitor triggers
> > the following call trace. The issue reproduces approximately 60% of
> > the time.
> 
> Could you share the whole dmesg (that is not line wrapped)? With
> "thunderbolt.dyndbg=+p" in the kernel command line.
> 
> And can you confirm I understand the steps?
> 
> 1. Boot the system up, nothing connected.
> 2. Once booted up, connect Thunderbolt cable to Dell U2725QE monitor.
> 3. Verify that the monitor works (+ run lspci/lsusb)
> 
> Expected output: The monitor and the integrated peripherals (PCIe, USB)
> work fine.
> 
> Actual output: There is error in the log and PCIe peripherals on the
> monitor do not show up in lspci output.

For some reason I never got the reply from you although I can see it on
lore.kernel.org. Thanks to Alan (Cc'd) who notified me about your reply :)

Anyways, I looked your first full dmesg and what stands out there is that:

[  113.907760] ======= Hotplug Thunderbolt Cable =======
[  116.091653] [504] thunderbolt:tb_cfg_ack_plug:842: thunderbolt 0000:00:0d.2: acking hot plug event on 0:1
...
[  116.134083] thunderbolt 0-1: new device found, vendor=0xd4 device=0xc050
[  116.134092] thunderbolt 0-1: DELL U2725QE
...
[  116.862460] [185] thunderbolt:tb_dump_hop:20: thunderbolt 0000:00:0d.2: 1:1:  In HopID: 8 => Out port: 16 Out HopID: 8
[  116.862463] [185] thunderbolt:tb_dump_hop:22: thunderbolt 0000:00:0d.2: 1:1:   Weight: 2 Priority: 3 Credits: 14 Drop: 0 PM: 0
[  116.862466] [185] thunderbolt:tb_dump_hop:25: thunderbolt 0000:00:0d.2: 1:1:    Counter enabled: 0 Counter index: 2047
[  116.862469] [185] thunderbolt:tb_dump_hop:27: thunderbolt 0000:00:0d.2: 1:1:   Flow Control (In/Eg): 1/0 Shared Buffer (In/Eg): 0/0
[  116.862472] [185] thunderbolt:tb_dump_hop:30: thunderbolt 0000:00:0d.2: 1:1:   Unknown1: 0x0 Unknown2: 0x0 Unknown3: 0x0
[  116.865613] [504] thunderbolt:tb_cfg_ack_plug:842: thunderbolt 0000:00:0d.2: acking hot unplug event on 0:1

This last one is unplug to the host router downstream port while we are
just setting up a PCIe tunnel, so it is expected that we cannot configure
the router (Dell device) from that point forward. That WARN() should be
changed to dev_warn() or so as this is really expected if the user unplugs
the device while we are configuring it (this is nature of USB4 as user can
unplug devices at any time).

In other words that calltrace is fine.

However, why the link goes down is another thing. If you did not
deliberately unplug the cable it suggest some sort of cable/PD issue to me.
Sometimes I have seen the plug gets bit loose and that makes the cable to
unplug itself quite easily. The other thing might be the cable itself may
be bad (I wonder if you have another Thunderbolt 4 cable that you could
try?).


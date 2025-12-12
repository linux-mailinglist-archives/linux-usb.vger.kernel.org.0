Return-Path: <linux-usb+bounces-31403-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 01093CB8D08
	for <lists+linux-usb@lfdr.de>; Fri, 12 Dec 2025 13:39:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 67F2A301E22B
	for <lists+linux-usb@lfdr.de>; Fri, 12 Dec 2025 12:39:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BBFD3203B5;
	Fri, 12 Dec 2025 12:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X+NzNw2p"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6601A322C9D;
	Fri, 12 Dec 2025 12:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765543187; cv=none; b=B6LtlTg1uHf0sirYkc1cAMwmyWeOmGPr2UKOk5uW0ZMXPobrX9GDA/FhzPOVzWAY3wRfPMjicxun+c2Lkwba1KIrgsghQVBXq+1VoVoBhN1S0zutbWNIzNOckhNChlB1SPCRvElj1yZW52cpVjTta0586+neCuurXR/ryWj5A/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765543187; c=relaxed/simple;
	bh=d5J8QD69kBZ5IkTrq6Bv6jVfgnR3v3lNf9x5UqsSZdM=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XmXK16fh8ZC8fYMc/6uuSovPCITGi87udv8+EiQiVLOjMHvT3Mdvh6W7a59VBARgCphw0QWTzC7jdSyBn8IBFqYD5fWxGjhu5lAf773gT3AuB2YH93WL1NTkYMmDDfVtUARVbTgsiFDQc5zrBu4OuRDstv5EsweJyya8C/W81kQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X+NzNw2p; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765543185; x=1797079185;
  h=date:from:to:subject:message-id:references:mime-version:
   content-transfer-encoding:in-reply-to;
  bh=d5J8QD69kBZ5IkTrq6Bv6jVfgnR3v3lNf9x5UqsSZdM=;
  b=X+NzNw2p0Ft0kWQ2Py9zqKVhGlDSuP6PKvIvIVRFwhOPOfNXdhjCOhpu
   mFY0djz+nLKQjvBvyRKhAEmDHfpyN3WcYkFqxjye8SI8cFinxkCgW+/BT
   2eih2QPoUPB8pz9uiD9hJytfJoCRHGbgarPmWlseYuCmnDcm1XjqQekpy
   086dM4zjJOnE0uPKJV0t0Q7dWlIpZlPSVvC5j5sVDFK4hrxxfVHPW6MHR
   AtIxBGFfSrsWl/59Er+GuSZqieWtoj5pKGFUvrFSGdMYWeRdTokS8Ideg
   GTB/IXPRocaSQ9LXksNuEZxIoZMoEAgpz3ttHvKSZJJ2bQIQiRVIq31rH
   A==;
X-CSE-ConnectionGUID: 8QP8l3SlQ1q6thCmMSjxSg==
X-CSE-MsgGUID: 8t33jZqjR/6HI1CuFwvalg==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="67587874"
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="67587874"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 04:39:45 -0800
X-CSE-ConnectionGUID: ywa8bhkvRK2tbA34PNJCTw==
X-CSE-MsgGUID: olYrOOiAScuEtiCdJcy7Xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="220457672"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa002.fm.intel.com with ESMTP; 12 Dec 2025 04:39:43 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id D651293; Fri, 12 Dec 2025 13:39:41 +0100 (CET)
Date: Fri, 12 Dec 2025 13:39:41 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, Sanath.S@amd.com,
	"Lin, Wayne" <Wayne.Lin@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [PATCH] [RFC] thunderbolt: Add delay for Dell U2725QE link width
Message-ID: <20251212123941.GK2275908@black.igk.intel.com>
References: <20251209054141.1975982-1-acelan.kao@canonical.com>
 <20251209070633.GA2275908@black.igk.intel.com>
 <pjn5d7oz433z4jph6whdalhowf652xknnk2fh5q7elffgb5ogo@7dtpvywxc6nw>
 <20251210074133.GE2275908@black.igk.intel.com>
 <4634177b-8ed1-4d65-9f3c-754d8c1eb828@amd.com>
 <coxrm5gishdztghznuvzafg2pbdk4qk3ttbkbq7t5whsfv2lk5@3gqepcs6h4uc>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <coxrm5gishdztghznuvzafg2pbdk4qk3ttbkbq7t5whsfv2lk5@3gqepcs6h4uc>

Hi,

On Fri, Dec 12, 2025 at 12:10:24PM +0800, Chia-Lin Kao (AceLan) wrote:
> Hi Mika,
> 
> On Wed, Dec 10, 2025 at 03:42:21PM -0600, Mario Limonciello wrote:
> > +Wayne
> > 
> > Here is the full thread since you're being added in late.
> > 
> > https://lore.kernel.org/linux-usb/20251209054141.1975982-1-acelan.kao@canonical.com/
> > 
> > On 12/10/25 1:41 AM, Mika Westerberg wrote:
> > > Hi,
> > > 
> > > On Wed, Dec 10, 2025 at 11:15:25AM +0800, Chia-Lin Kao (AceLan) wrote:
> > > > > We should understand the issue better. This is Intel Goshen Ridge based
> > > > > monitor which I'm pretty sure does not require additional quirks, at least
> > > > > I have not heard any issues like this. I suspect this is combination of the
> > > > > AMD and Intel hardware that is causing the issue.
> > > > Actually, we encountered the same issue on Intel machine, too.
> > > > Here is the log captured by my ex-colleague, and at that time he used
> > > > 6.16-rc4 drmtip kernel and should have reported this issue somewhere.
> > > > https://paste.ubuntu.com/p/bJkBTdYMp6/
> > > > 
> > > > The log combines with drm debug log, and becomes too large to be
> > > > pasted on the pastebin, so I removed some unrelated lines between 44s
> > > > ~ 335s.
> > > 
> > > Okay I see similar unplug there:
> > > 
> > > [  337.429646] [374] thunderbolt:tb_handle_dp_bandwidth_request:2752: thunderbolt 0000:00:0d.2: 0:5: handling bandwidth allocation request, retry 0
> > > ...
> > > [  337.430291] [165] thunderbolt:tb_cfg_ack_plug:842: thunderbolt 0000:00:0d.2: acking hot unplug event on 0:1
> > > 
> > > We had an issue with MST monitors but that resulted unplug of the DP OUT
> > > not link going down. That was fixed with:
> > > 
> > >    9cb15478916e ("drm/i915/dp_mst: Work around Thunderbolt sink disconnect after SINK_COUNT_ESI read")
> > > 
> > > If you have Intel hardware still there it would be good if you could try
> > > and provide trace from that as well.
> I tried the latest mainline kernel, d358e5254674, which should include the commit you
> mentioned, but no luck.
> 
> I put all the logs here for better reference
> https://people.canonical.com/~acelan/bugs/tbt_call_trace/
> 
> Here is how I get the log
> ```
> $ cat debug
> #!/bin/sh
> 
> . ~/.cargo/env
> sudo ~/.cargo/bin/tbtrace enable
> sleep 10 # plug in the monitor
> sudo ~/.cargo/bin/tbtrace disable
> sudo ~/.cargo/bin/tbtrace dump -vv > trace.out
> sudo dmesg > dmesg.out
> ./tbtools/scripts/merge-logs.py dmesg.out trace.out > merged.out
> ```
> 
> And here is the log
> https://people.canonical.com/~acelan/bugs/tbt_call_trace/intel/merged_6.18.0-d358e5254674+.out

Thanks!

It shows that right before the unplug the driver is still enumerating
retimers:

[   39.812733] tb_tx Read Request Domain 0 Route 3 Adapter 1 / Lane
               0x00/---- 0x00000000 0b00000000 00000000 00000000 00000000 .... Route String High
               0x01/---- 0x00000003 0b00000000 00000000 00000000 00000011 .... Route String Low
               0x02/---- 0x02082091 0b00000010 00001000 00100000 10010001 ....
                 [00:12]       0x91 Address
                 [13:18]        0x1 Read Size
                 [19:24]        0x1 Adapter Num
                 [25:26]        0x1 Configuration Space (CS) → Adapter Configuration Space
                 [27:28]        0x0 Sequence Number (SN)
[   39.813005] tb_rx Read Response Domain 0 Route 3 Adapter 1 / Lane
               0x00/---- 0x80000000 0b10000000 00000000 00000000 00000000 .... Route String High
               0x01/---- 0x00000003 0b00000000 00000000 00000000 00000011 .... Route String Low
               0x02/---- 0x02082091 0b00000010 00001000 00100000 10010001 ....
                 [00:12]       0x91 Address
                 [13:18]        0x1 Read Size
                 [19:24]        0x1 Adapter Num
                 [25:26]        0x1 Configuration Space (CS) → Adapter Configuration Space
                 [27:28]        0x0 Sequence Number (SN)
               0x03/0091 0x81620408 0b10000001 01100010 00000100 00001000 .b.. PORT_CS_1
                 [00:07]        0x8 Address
                 [08:15]        0x4 Length
                 [16:18]        0x2 Target
                 [20:23]        0x6 Re-timer Index
                 [24:24]        0x1 WnR
                 [25:25]        0x0 No Response (NR)
                 [26:26]        0x0 Result Code (RC)
                 [31:31]        0x1 Pending (PND)
[   39.814180] tb_tx Read Request Domain 0 Route 3 Adapter 1 / Lane
               0x00/---- 0x00000000 0b00000000 00000000 00000000 00000000 .... Route String High
               0x01/---- 0x00000003 0b00000000 00000000 00000000 00000011 .... Route String Low
               0x02/---- 0x02082091 0b00000010 00001000 00100000 10010001 ....
                 [00:12]       0x91 Address
                 [13:18]        0x1 Read Size
                 [19:24]        0x1 Adapter Num
                 [25:26]        0x1 Configuration Space (CS) → Adapter Configuration Space
                 [27:28]        0x0 Sequence Number (SN)
[   39.815193] tb_event Hot Plug Event Packet Domain 0 Route 0 Adapter 3 / Lane
               0x00/---- 0x80000000 0b10000000 00000000 00000000 00000000 .... Route String High
               0x01/---- 0x00000000 0b00000000 00000000 00000000 00000000 .... Route String Low
               0x02/---- 0x80000003 0b10000000 00000000 00000000 00000011 ....
                 [00:05]        0x3 Adapter Num
                 [31:31]        0x1 UPG
[   39.815196] [2821] thunderbolt 0000:00:0d.2: acking hot unplug event on 0:3

By default it does not access retimers beyond the Type-C connector. I
wonder if you have CONFIG_USB4_DEBUGFS_MARGINING set in your kernel
.config? And if yes can you disable that and try again.


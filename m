Return-Path: <linux-usb+bounces-31314-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D8CBDCAF168
	for <lists+linux-usb@lfdr.de>; Tue, 09 Dec 2025 08:06:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D95C53006732
	for <lists+linux-usb@lfdr.de>; Tue,  9 Dec 2025 07:06:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B4C825A321;
	Tue,  9 Dec 2025 07:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IwXbvoqK"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 601473B8D48;
	Tue,  9 Dec 2025 07:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765264000; cv=none; b=YJl9hyoln3ztghvgvhCGDsdqa6b4lc4wRj1kmU44KmCA83+VrhXWRx0fOTgx22rrujSGchTLuATONf+2JrrMfl/fOutZPA38kVwVEnMgqRZSzZUtcN7h4qBbpt9mFuOwt+97Zc4xy7/yrN/8AR8K/rvRAdIQVl0UsoGiK7H42K0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765264000; c=relaxed/simple;
	bh=JFh7HPhuLym8mK3+eGVTboKZ9PMTTWUWJgHnmAYPvwY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZL0q7r4dFPYs3cfwcxx+9NIIBLOqfsePLReVvViTlYnu8fFeQinXZMNQdyWhICfaIAcTRYcqFrsVmdd02KAimedNSMwjuK9WTDhsmmmEXBeb9FqyVJH/gdqO30+1UclEkbe7Q68hFULu3RaKgD6+JFgSw8r9zWrAcPkgT9Tlbx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IwXbvoqK; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765263997; x=1796799997;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=JFh7HPhuLym8mK3+eGVTboKZ9PMTTWUWJgHnmAYPvwY=;
  b=IwXbvoqKPYw6b5xy3snFSz4BuyeHq7CmeIiYMUxPUnW4Wjb3IImheZdV
   orvBfclUd1pEYbvFFkXa0NahZKbT9pxTeUGWWrUJpWym5pzlNmbMzgdQ6
   D+laDOew4iqljRYq0QxN94gTTOOgOhDBzIPaavBWIBSnyzy/ErPhSg0ha
   RofYxJC20FImes2QpPKtcu8jdShk00CQ/EMk6bGN2V9tkAejNJisKWSin
   V4lvycZhfDuxW0baa6xWnM9B3wXMS+XaHrw0oYx8t38o0cCd+HXKQ1BHr
   JPQHcPRJb3epjO2wS2gCnP9hp9nNIAwS2/Fp1zm4feigjMQwev1NVSZi1
   w==;
X-CSE-ConnectionGUID: MEx2yjV0SZS1tXkH4l3kSQ==
X-CSE-MsgGUID: mrn1GXq+TYenQT+BCcaB0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="78331196"
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; 
   d="scan'208";a="78331196"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 23:06:36 -0800
X-CSE-ConnectionGUID: eKdG8O0kTfCg0rERUo46yA==
X-CSE-MsgGUID: A6LJDm5zRe284CcAtE/gjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; 
   d="scan'208";a="195924161"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa009.jf.intel.com with ESMTP; 08 Dec 2025 23:06:35 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 8AD9F93; Tue, 09 Dec 2025 08:06:33 +0100 (CET)
Date: Tue, 9 Dec 2025 08:06:33 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>
Cc: Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [PATCH] [RFC] thunderbolt: Add delay for Dell U2725QE link width
Message-ID: <20251209070633.GA2275908@black.igk.intel.com>
References: <20251209054141.1975982-1-acelan.kao@canonical.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251209054141.1975982-1-acelan.kao@canonical.com>

+Mario since this is AMD related.

[Also keeping all the context].

On Tue, Dec 09, 2025 at 01:41:41PM +0800, Chia-Lin Kao (AceLan) wrote:
> When plugging in a Dell U2725QE Thunderbolt monitor, the kernel produces
> a call trace during initial enumeration. The device automatically
> disconnects and reconnects ~3 seconds later, and works correctly on the
> second attempt.
> 
> Issue Description:
> ==================
> The Dell U2725QE (USB4 device 8087:b26) requires additional time during
> link width negotiation from single lane to dual lane. On first plug, the
> following sequence occurs:
> 
> 1. Port state reaches TB_PORT_UP (link established, single lane)
> 2. Path activation begins immediately
> 3. tb_path_activate() - > tb_port_write() returns -ENOTCONN (error -107)
> 4. Call trace is generated at tb_path_activate()
> 5. Device disconnects/reconnects automatically after ~3 seconds
> 6. Second attempt succeeds with full dual-lane bandwidth
> 
> First attempt dmesg (failure):
> -------------------------------
> [   36.030347] thunderbolt 0000:c7:00.6: 2:16: available bandwidth for new USB3 tunnel 9000/9000 Mb/s
> [   36.030613] thunderbolt 0000:c7:00.6: 2: USB3 tunnel creation failed
> [   36.031530] thunderbolt 0000:c7:00.6: PCIe Down path activation failed
> [   36.031531] WARNING: drivers/thunderbolt/path.c:589 at 0x0, CPU#12: pool-/usr/libex/3145
> 
> Second attempt dmesg (success):
> --------------------------------
> [   40.440012] thunderbolt 0000:c7:00.6: 2:16: available bandwidth for new USB3 tunnel 36000/36000 Mb/s
> [   40.440261] thunderbolt 0000:c7:00.6: 2:16: maximum required bandwidth for USB3 tunnel 9000 Mb/s
> [   40.440269] thunderbolt 0000:c7:00.6: 0:4 <-> 2:16 (USB3): activating
> [   40.440271] thunderbolt 0000:c7:00.6: 0:4 <-> 2:16 (USB3): allocating initial bandwidth 9000/9000 Mb/s
> 
> The bandwidth difference (9000 vs 36000 Mb/s) indicates the first attempt
> occurs while the link is still in single-lane mode.
> 
> Root Cause Analysis:
> ====================
> The error originates from the Thunderbolt/USB4 device hardware itself:
> 
> 1. Port config space read/write returns TB_CFG_ERROR_PORT_NOT_CONNECTED
> 2. This gets translated to -ENOTCONN in tb_cfg_get_error()
> 3. The port's control channel is temporarily unavailable during state
>    transition from single lane to dual lane (lane bonding)
> 
> The comment in drivers/thunderbolt/ctl.c explains this is expected:
>   "Port is not connected. This can happen during surprise removal.
>    Do not warn."
> 
> Attempted Solutions:
> ====================
> 1. Retry logic on -ENOTCONN in tb_path_activate():
>    Result: Caused host port (0:0) lockup with hundreds of "downstream
>    port is locked" errors. Rejected by user.
> 
> 2. Increased tb_port_wait_for_link_width() timeout from 100ms to 3000ms:
>    Result: Did not resolve the issue. The timeout increase alone is
>    insufficient because the port state hasn't reached TB_PORT_UP when
>    lane bonding is attempted.
> 
> 3. Added msleep(2000) at various points in enumeration flow:
>    Locations tested:
>    - Before tb_switch_configure(): Works ✓
>    - Before tb_switch_add(): Works ✓
>    - Before usb4_port_hotplug_enable(): Works ✓
>    - After tb_switch_add(): Doesn't work ✗
>    - In tb_configure_link(): Doesn't work ✗
>    - In tb_switch_lane_bonding_enable(): Doesn't work ✗
>    - In tb_port_wait_for_link_width(): Doesn't work ✗
> 
>    The pattern shows the delay must occur BEFORE hotplug enable, which
>    happens early in tb_switch_port_hotplug_enable() -> usb4_port_hotplug_enable().
> 
> Current Workaround:
> ===================
> Add a 2-second delay in tb_wait_for_port() when the port state reaches
> TB_PORT_UP. This is the earliest point where we know:
> - The link is physically established
> - The device is responsive
> - But lane width negotiation may still be in progress
> 
> This location is chosen because:
> 1. It's called during port enumeration before any tunnel creation
> 2. The port has just transitioned to TB_PORT_UP state
> 3. Allows sufficient time for lane bonding to complete
> 4. Avoids affecting other code paths
> 
> Testing Results:
> ================
> With this patch:
> - No call trace on first plug
> - Device enumerates correctly on first attempt
> - Full bandwidth (36000 Mb/s) available immediately
> - No disconnect/reconnect cycle
> - USB and PCIe tunnels create successfully
> 
> Without this patch:
> - Call trace on every first plug
> - Only 9000 Mb/s bandwidth (single lane) on first attempt
> - Automatic disconnect/reconnect after ~3 seconds
> - Second attempt works with 36000 Mb/s
> 
> Discussion Points for RFC:
> ===========================
> 1. Is a fixed 2-second delay acceptable, or should we poll for a
>    specific hardware state?
> 
> 2. Should we check PORT_CS_18_TIP (Transition In Progress) bit instead
>    of using a fixed delay?
> 
> 3. Is there a better location for this delay in the enumeration flow?
> 
> 4. Should this be device-specific (based on vendor/device ID) or apply
>    to all USB4 devices?
> 
> 5. The 100ms timeout in tb_switch_lane_bonding_enable() may be too
>    short for other devices as well. Should we increase it universally?

We should understand the issue better. This is Intel Goshen Ridge based
monitor which I'm pretty sure does not require additional quirks, at least
I have not heard any issues like this. I suspect this is combination of the
AMD and Intel hardware that is causing the issue.

Looking at your dmesg, even before your issue there is suspicious log
entry:

[    5.852476] localhost kernel: [31] thunderbolt 0000:c7:00.5: acking hot unplug event on 0:6
[    5.852492] localhost kernel: [12] thunderbolt 0000:c7:00.5: 0:6: DP IN resource unavailable: adapter unplug

This causes tearing down the DP tunnel. It is unexpected for the host
router to send this unless you plugged monitor directly to some of the
Type-C ports at this time?

I wonder if you could take trace logs too from the issue? Instructions:

https://github.com/intel/tbtools?tab=readme-ov-file#tracing
https://github.com/intel/tbtools/wiki/Useful-Commands#tracing

Please provide both full dmesg and the trace.out or the merged one. That
would allow us to look what is going on (hopefully).

> Hardware Details:
> =================
> Device: Dell U2725QE Thunderbolt Monitor
> USB4 Router: 8087:b26 (Intel USB4 controller)
> Host: AMD Thunderbolt 4 controller (0000:c7:00.6)
> 
> Signed-off-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>
> ---
> Full dmesg log available at: https://paste.ubuntu.com/p/CXs2T4XzZ3/
> ---
>  drivers/thunderbolt/switch.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
> index b3948aad0b955..e0c65e5fb0dca 100644
> --- a/drivers/thunderbolt/switch.c
> +++ b/drivers/thunderbolt/switch.c
> @@ -530,6 +530,8 @@ int tb_wait_for_port(struct tb_port *port, bool wait_if_unplugged)
>  			return 0;
>  
>  		case TB_PORT_UP:
> +			msleep(2000);
> +			fallthrough;
>  		case TB_PORT_TX_CL0S:
>  		case TB_PORT_RX_CL0S:
>  		case TB_PORT_CL1:
> -- 
> 2.43.0


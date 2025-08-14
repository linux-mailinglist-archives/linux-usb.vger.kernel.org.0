Return-Path: <linux-usb+bounces-26858-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4221B2682C
	for <lists+linux-usb@lfdr.de>; Thu, 14 Aug 2025 15:54:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2846F9E2E0A
	for <lists+linux-usb@lfdr.de>; Thu, 14 Aug 2025 13:49:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA5EA3002BE;
	Thu, 14 Aug 2025 13:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lAU3xcL1"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A58292D46B6
	for <linux-usb@vger.kernel.org>; Thu, 14 Aug 2025 13:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755179363; cv=none; b=ZI7vHOOQHDFkwSTUPsERdXn9zzeFsM+n6lPezZDUpnznnmEhyjU3PcmGr0qJUf3FC818grE5eFd3AjUayBsP6BB7hzdnOhoXR/0LchG7uSc+9qLIipz4KY89bvD6j45z3gVvdExX/YLIQeJRRenL70wd1+0MmIuQRnkMBiJBI9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755179363; c=relaxed/simple;
	bh=IxhChK+OUkVfxJguMTScA9lW4OG2DFF+3HcVvxHm7ps=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g00JGo+y1YM+8+ju+VRlKn9dAoLnhmo7U7MagZSw+CDXqENB3Qd+djxq6o42nF/YXWV97rXLeSrCom9KJ9C/nwiE/XL/BV6ZTgc2lg9SJYgMVGHV6ayfoOxX+oxg/NFGw7E2v8+GKEe8wk9oJzv1ajFiGEDBUg8qHfxwdl0D8Nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lAU3xcL1; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755179361; x=1786715361;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=IxhChK+OUkVfxJguMTScA9lW4OG2DFF+3HcVvxHm7ps=;
  b=lAU3xcL1GL7HHrc8Ko+pUc9Txe682ECg5D2wq7hhS504t7ssrnQMKIPn
   YqEC+/NtR1cX4NrYqUYWHslZxxP4VAswJgSKjzfFuZWjovQSqfCDvttd+
   5Bt54MrhovAnpYcruElRjj/Ax2Z0w5lpMCSMV+zTbfvHzQjSspk/qAw0E
   ux/Dwr3y8O+hnRHdRPWXSABYJPl50dHVU7M46Z9Ri9Uhh3rhYvntNohmO
   pgOZVD5aQBcar6T632Fsv6BR3Qm3C8Kl4SeNm8MYLWHLUtYecwRGA4rKG
   ow9/VdQ9tlv5muGVjkuDKfeITJoxr9UcFl0/hqkL/qLApP/TBLvuVl29U
   Q==;
X-CSE-ConnectionGUID: RSa2ojzmQOiRskhnXHlHNA==
X-CSE-MsgGUID: 7puRCH33RaCxnO5RiEbFRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="68574941"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="68574941"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 06:49:20 -0700
X-CSE-ConnectionGUID: aDNxWSmEQD+5cKSLKa6vZA==
X-CSE-MsgGUID: vIEcXti0QgC25kYRvJ1iGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="167123273"
Received: from mnyman-desk.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by fmviesa009.fm.intel.com with ESMTP; 14 Aug 2025 06:49:18 -0700
Message-ID: <97d9420f-1a7f-433c-bdd7-b7bab6c45f00@linux.intel.com>
Date: Thu, 14 Aug 2025 16:49:17 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Plugging USB-C adapter into one port results in `Failed to set U2
 timeout to 0x3f,error code -110`
To: Paul Menzel <pmenzel@molgen.mpg.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org,
 Kai-Heng Feng <kaihengf@nvidia.com>
References: <e6fa9169-fff7-4e44-90a4-e0efe4e176fd@molgen.mpg.de>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <e6fa9169-fff7-4e44-90a4-e0efe4e176fd@molgen.mpg.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 13.8.2025 10.47, Paul Menzel wrote:
> Dear Linux folks,
> 
> 
> On an Intel Kaby Lake-R Dell XPS 13 9370, plugging in an 8-port LMP USB-C mini Dock into the port on the left side closer to the panel, Linux 6.16 logs:
> 
>      [    0.000000] Linux version 6.16-amd64 (debian-kernel@lists.debian.org) (x86_64-linux-gnu-gcc-14 (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44) #1 SMP PREEMPT_DYNAMIC Debian 6.16-1~exp1 (2025-07-31)
>      […]
>      [    0.000000] DMI: Dell Inc. XPS 13 9370/0RMYH9, BIOS 1.21.0 07/06/2022
>      […]
>      [   99.566522] xhci_hcd 0000:39:00.0: WARN Set TR Deq Ptr cmd failed due to incorrect slot or ep state.
>      [   99.566565] usb 4-2.1: Failed to set U2 timeout to 0x3f,error code -110
>      [   99.566787] hub 4-2.1:1.0: USB hub found
>      [   99.587655] hub 4-2.1:1.0: config failed, can't read hub descriptor (err -22)
>      [   99.594669] usb 4-2.1: Failed to suspend device, error -19
>      […]
> 

Looks like the left side port is connected to a PCI hotpluggable Alpine Ridge xHCI controller.
This whole xHCI host will only appear on the PCI bus once a device is connected to the USB-C port

The right side port is handled by the other xHC that is always visible and already properly running.

The logs point towards Link Power Management or, runtime suspend race
issues with the two chained external USB 3 hubs.

Could you try running with the following kernel parameters set:
"usbcore.quirks=2109:0817:k"
to prevent Link Power Management (LPM) for the external hubs

"usbcore.autosuspend=-1"
to prevent runtime suspend of all usb devices

Does adding either one, or both help?

Could you also take logs and traces with dynamic debug and tracing enabled:

mount -t debugfs none /sys/kernel/debug
echo 'module xhci_hcd =p' >/sys/kernel/debug/dynamic_debug/control
echo 'module usbcore =p' >/sys/kernel/debug/dynamic_debug/control
echo 81920 > /sys/kernel/debug/tracing/buffer_size_kb
echo 1 > /sys/kernel/debug/tracing/events/xhci-hcd/enable
echo 1 > /sys/kernel/debug/tracing/tracing_on
< Reproduce issue >
Send output of dmesg
Send content of /sys/kernel/debug/tracing/trace

Thanks
Mathias


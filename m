Return-Path: <linux-usb+bounces-31170-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 69742CA446D
	for <lists+linux-usb@lfdr.de>; Thu, 04 Dec 2025 16:35:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5910C30173BA
	for <lists+linux-usb@lfdr.de>; Thu,  4 Dec 2025 15:35:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 783FC2DCF47;
	Thu,  4 Dec 2025 15:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YUx2PVTb"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F42261B8C;
	Thu,  4 Dec 2025 15:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764862521; cv=none; b=mL916bWQ7XdQ6Bqtfk2gLnZnSSANYzix/i9bPSpfD1zMsZdErLCf6ONeV28RVmVTcFvC09YiNEA6ZQUXSzRA2bzznUnYujUejZ82dk+scwXtSgH/sP7suLoKqnZvUnWV6XvkwfsLIGTVM3zTfJu69Bq88Kr4UlEDW/0vRKjeh/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764862521; c=relaxed/simple;
	bh=IRzE+VxGPdHrQSm6vXoVlYaMuGLXTbq14E90QgmDpHQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qTO2Jg1l0VFjAewUIxoZWW53H/7z2lgfMfMeFRAwgtO+V2jES1I98FDQbo9pAshrIx+3YxqQL9+2lWnDBzTDRr9phTrs7I+7Clv/MQNFotAremGzNG57T5suK9aMVcT88s00DAxdABGqgygs88DHFi/vELQlnOnOwLYwcJz+8yA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YUx2PVTb; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764862519; x=1796398519;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=IRzE+VxGPdHrQSm6vXoVlYaMuGLXTbq14E90QgmDpHQ=;
  b=YUx2PVTbuJAW+7uje/J2c/nlAYsx5r+8+mvWfSYULk0f72xLsWSkPewd
   8qj0r0EOGNIVu4Y/P10l2mJJ0hKGJnYKPv37pA0aQDTFdFAA+kzGWUaHm
   RiCFHIprO42vmzJ/NanelcwJsqGO8eK9Br/5C6kwXLeA4wpMMDPESseJ7
   MHwHSs34vZZCjYiihAYQEfhGd0HypJNZtmGnGDhh9S48Lw+5E3xn87W0x
   G/hMKg3QMgFU+Bs73aFHxOBmWhBqhnke84+IWqaoK759aSaW3IO+qWVEe
   kFS/ZU/EeSoZXdX2unXPenqaPyIRLfxvgz+nWU6htaaoZod+GsxRe2iZ/
   w==;
X-CSE-ConnectionGUID: oXdW3MAHQHKwthzMARd0Kg==
X-CSE-MsgGUID: XGvCvaTcQtGsiA9PIE431g==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="92363325"
X-IronPort-AV: E=Sophos;i="6.20,249,1758610800"; 
   d="scan'208";a="92363325"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 07:35:18 -0800
X-CSE-ConnectionGUID: FKdmGNUBTq+92D7+t4UaZg==
X-CSE-MsgGUID: sNVJuMm/RZK7+Rgg5r+p7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,249,1758610800"; 
   d="scan'208";a="194673887"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO [10.245.245.220]) ([10.245.245.220])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 07:35:17 -0800
Message-ID: <958c8848-945e-4fe0-9ebf-481155e11d73@linux.intel.com>
Date: Thu, 4 Dec 2025 17:35:14 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: usb: Error while assigning device slot ID
To: Alexander Wilhelm <alexander.wilhelm@westermo.com>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <aTFr17xKxnWGG3vU@FUE-ALEWI-WINX>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <aTFr17xKxnWGG3vU@FUE-ALEWI-WINX>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi

On 12/4/25 13:09, Alexander Wilhelm wrote:
> Hello USB developers,
> 
> I’m using an NXP LS1046A SoC with the integrated DWC3 USB controller in
> host mode. On Linux v5.5.167 my USB flash drive was detected and mountable.
> After upgrading to Linux v6.6.110 the USB flash drive is no longer
> recognized. If it is already plugged in during boot phase I get the
> following errors:
> 
>      xhci-hcd xhci-hcd.2.auto: Error while assigning device slot ID: Command Aborted
>      xhci-hcd xhci-hcd.2.auto: Max number of devices this xHCI host supports is 127
> 
> And here is the kernel debug output:
> 
>      user@host:~# cat /sys/kernel/debug/usb/xhci/xhci-hcd.3.auto/ports/port01/portsc
>      Powered Connected Disabled Link:Polling PortSpeed:1 Change: Wake: WDE WOE
> 
> I’ve also found that the function `xhci_alloc_dev` shows the error message.
> I printed the `command` member variables and see that the `status` is
> `COMP_COMMAND_ABORTED` and `slot_id` remains `0`. I have already seen
> similar error patterns in some forums, but the suggested solutions didn’t
> help me. Between these releases Kconfig has changed significantly; I may be
> missing a config option, but I haven’t found one. Does anyone else see this
> error pattern? Or maybe someone has a hint for me on how to proceed?

Looks like "enable slot" commands times out,
This is a simple internal xHCI command which shouldn't timeout

Could you enable xhci and usb core dynamic debug and share full dmesg after issue is seen.

mount -t debugfs none /sys/kernel/debug
echo 'module xhci_hcd =p' >/sys/kernel/debug/dynamic_debug/control
echo 'module usbcore =p' >/sys/kernel/debug/dynamic_debug/control
< Reproduce issue >
Send output of dmesg

Reasons for command not completing could be xHC being stopped, not processing commands due
to being suspended, or something preventing xchi interrupt, and driver misses the
command completion event

Is runtime PM enabled fo xHCI in your DWC3 setup?
It was enabled by default in 6.1 kernels for PCI based xhci 1.2 controllers.

Does your flash drive enumerate if you first force roothubs on, disabling runtime pm?
echo on > /sys/bus/usb/devices/usb*/power/control

Thanks
Mathias




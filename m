Return-Path: <linux-usb+bounces-31333-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FED8CB055C
	for <lists+linux-usb@lfdr.de>; Tue, 09 Dec 2025 15:53:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E82A23054CB4
	for <lists+linux-usb@lfdr.de>; Tue,  9 Dec 2025 14:53:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 281B82FE595;
	Tue,  9 Dec 2025 14:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZUJOwqvw"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F23C222A4E1;
	Tue,  9 Dec 2025 14:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765292017; cv=none; b=WBOxjO8feFQQ90yboo0VQZhhUIez+KSRXESuGu7tVMQBATUm8EGjtV3otpv3EqzLi6hCgldumb24N3ZhBzEIzvSIGtpjpBjk6GBZk42t/yyhFJpPYo/gKT+Lm8bBcYbWy0rJffe+kBs7sI2H0DpVrUMYxQInqxn93lWBfkWoHz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765292017; c=relaxed/simple;
	bh=MMJrbEo2vHs4cfie4stuyLcUNBtzkJr2CdHk8J1msJc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oARFynmp9Z0SVP6fJIpyRy6P3QhA8leQfjnRRM/omc9v12k89vzXrd2vwqNVcIYbkXTaXUomJ9Ep6vciMskSNSOWiG8JOg7TgU73AxtjE0kmCVw7FrTNbvawzullb+5dPR6OHoi5/XQTJ/n2Sfcv9JpBPAGmCuVSDrrt3ojR/t8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZUJOwqvw; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765292016; x=1796828016;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=MMJrbEo2vHs4cfie4stuyLcUNBtzkJr2CdHk8J1msJc=;
  b=ZUJOwqvwl+xjeHFHeAnCMzdI6PugRLBhn44NRjntA0W7NXbPa2SYLwks
   svUyXxkYrxfmSFjRnhvOLbdSPCgm6bbs962U2ncTynb5Qhqdd7jcQWTgf
   6atR8VtYHALmRANOi+8a5WWGeA27wxn4lUTgNBnnYQ3UwliHSRDXIgjYj
   ZqW5gT6J6gdmj4dFAPdOiSBgFTDGWpnuCXv3PLbfyB1vOlIHIk4lIBum/
   tzwp4yYE6vGcNbubvculnIK4FNrW26Yih7KvDutUsEP0PKNP/AhHXVM8k
   WbX0pCmtTLxNPe1uaJ1yk8jYxrD6z/48F4cKXMsqbWtD5+M6ns/mxFiMm
   g==;
X-CSE-ConnectionGUID: ox9IICPUS1CJlxX1oYbmIw==
X-CSE-MsgGUID: X7/TuouYTBys84KQNeesdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="78609925"
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; 
   d="scan'208";a="78609925"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 06:53:35 -0800
X-CSE-ConnectionGUID: vUVwGsI5RpiUECoIXrMddA==
X-CSE-MsgGUID: iTPUg6dIRcmtEUHLirNB/w==
X-ExtLoop1: 1
Received: from fpallare-mobl4.ger.corp.intel.com (HELO [10.245.245.189]) ([10.245.245.189])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 06:53:33 -0800
Message-ID: <b8947ce6-8e34-45fa-aaa9-262ac1232bcf@linux.intel.com>
Date: Tue, 9 Dec 2025 16:53:31 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: usb: Error while assigning device slot ID
To: Alexander Wilhelm <alexander.wilhelm@westermo.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <aTFr17xKxnWGG3vU@FUE-ALEWI-WINX>
 <958c8848-945e-4fe0-9ebf-481155e11d73@linux.intel.com>
 <aTKWWjfWihg0a9WP@FUE-ALEWI-WINX>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <aTKWWjfWihg0a9WP@FUE-ALEWI-WINX>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi

Flash driver appears as a Full-Speed device. Is this correct?

Does it work if you boot without the drive and then connect it later?

On 12/5/25 10:22, Alexander Wilhelm wrote:

> Hi Mathias,
> 
> Sure, here are the commands input and dmesg output:
> 
>      user@host:~# mount -t debugfs none /sys/kernel/debug
>      user@host:~# echo 'module xhci_hcd =p' >/sys/kernel/debug/dynamic_debug/control
>      user@host:~# echo 'module usbcore =p' >/sys/kernel/debug/dynamic_debug/control
>      user@host:~# modprobe xhci_plat_hcd
> 
>      xhci-hcd xhci-hcd.3.auto: // Turn on HC, cmd = 0x5.
>      hub 5-0:1.0: USB hub found
>      hub 5-0:1.0: 1 port detected
>      xhci-hcd xhci-hcd.3.auto: set port power 5-1 ON, portsc: 0x206e1

Device is detected early during hub init on xhci-hcd.3.auto USB5 bus port 1.

>      xhci-hcd xhci-hcd.3.auto: Get port status 5-1 read: 0x206e1, return 0x10101
>      usb usb5-port1: status 0101 change 0001>      xhci-hcd xhci-hcd.3.auto: Get port status 5-1 read: 0x6e1, return 0x101
>      usb usb5-port1: status 0101, change 0000, 12 Mb/s

hub driver reacts to the FS device

>      xhci-hcd xhci-hcd.3.auto: // Ding dong!

hub driver queued xhci enable slot command during usb_alloc_dev(), and rings doorbell.
At least xhci driver assumes command ring and xHC are in proper running states.

>      xhci-hcd xhci-hcd.3.auto: Command timeout, USBSTS: 0x00000000

Command times out, xHC is running, no pending interrupts

>      xhci-hcd xhci-hcd.3.auto: Command timeout
>      xhci-hcd xhci-hcd.3.auto: Abort command ring
>      xhci-hcd xhci-hcd.3.auto: No stop event for abort, ring start fail?

No event for aborting the ring ether.
Maybe interrupts from this xHC aren't coming through.
Or then something in xHC isn't set up properly when command is queued.

Could you add xhci tracing, and dump the command and event rings after timeout?

Debug and tracing:

mount -t debugfs none /sys/kernel/debug
echo 'module xhci_hcd =p' >/sys/kernel/debug/dynamic_debug/control
echo 'module usbcore =p' >/sys/kernel/debug/dynamic_debug/control
echo 81920 > /sys/kernel/debug/tracing/buffer_size_kb
echo 1 > /sys/kernel/debug/tracing/events/xhci-hcd/enable
echo 1 > /sys/kernel/debug/tracing/tracing_on
< Reproduce issue >
Send output of dmesg
Send content of /sys/kernel/debug/tracing/trace

Dumping command and event rings after command timeout:

cat /sys/kernel/debug/usb/xhci/<hci-hcd.3.auto address> /event-ring/trbs
cat /sys/kernel/debug/usb/xhci/<hci-hcd.3.auto address>/command-ring/trbs

Thanks
Mathias










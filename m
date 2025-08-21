Return-Path: <linux-usb+bounces-27086-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D896B2F003
	for <lists+linux-usb@lfdr.de>; Thu, 21 Aug 2025 09:46:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1760E3B6D2E
	for <lists+linux-usb@lfdr.de>; Thu, 21 Aug 2025 07:44:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E89642D3218;
	Thu, 21 Aug 2025 07:44:42 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B1B18DB35
	for <linux-usb@vger.kernel.org>; Thu, 21 Aug 2025 07:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.14.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755762282; cv=none; b=bQpesRQiP7eR2fGbUfEGkp0WcU3MCqPbNLOqMQi7W3DYWOUJNVAbwZ0BLEiVLhq/Sb8eY3OcegjALdokgH6mw06tIwNfAvSVHG0h8UcEshKf6MOR+JqqF/d6rg3YFL1H7dka74pPDXBz7s5cGoB6TwpQMJyFJTK2YgGyOzyAfLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755762282; c=relaxed/simple;
	bh=RPsoTO4rlnpyFuuaZg47NqGYR5lO798UEh7vSN56zY8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=C63vXZ3lgP0siBXty4V+zxnTibGUDuUbX5xDefjjsoPLpSaSMZbCWvt0NYRN48oFu2UdBkwRb658YALkx+3/oS1wD/E7CjtPHNBu8LYAMWFZUG1f9zE7aCtYKKbOb4Naxm5cm79qlByHnrJk0sNIyfPs59jLXsNRxSWXPjq8n/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de; spf=pass smtp.mailfrom=molgen.mpg.de; arc=none smtp.client-ip=141.14.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Received: from [192.168.0.192] (ip5f5af188.dynamic.kabel-deutschland.de [95.90.241.136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 286FD6028827A;
	Thu, 21 Aug 2025 09:44:12 +0200 (CEST)
Message-ID: <ff53c471-eeee-44e3-b50c-49212227927a@molgen.mpg.de>
Date: Thu, 21 Aug 2025 09:44:11 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Paul Menzel <pmenzel@molgen.mpg.de>
Subject: Re: Plugging USB-C adapter into one port results in `Failed to set U2
 timeout to 0x3f,error code -110`
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org,
 Kai-Heng Feng <kaihengf@nvidia.com>
References: <e6fa9169-fff7-4e44-90a4-e0efe4e176fd@molgen.mpg.de>
 <97d9420f-1a7f-433c-bdd7-b7bab6c45f00@linux.intel.com>
Content-Language: en-US
In-Reply-To: <97d9420f-1a7f-433c-bdd7-b7bab6c45f00@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear Mathias,


Thank you for your reply.


Am 14.08.25 um 15:49 schrieb Mathias Nyman:
> On 13.8.2025 10.47, Paul Menzel wrote:

>> On an Intel Kaby Lake-R Dell XPS 13 9370, plugging in an 8-port LMP 
>> USB-C mini Dock into the port on the left side closer to the panel, 
>> Linux 6.16 logs:
>>
>>      [    0.000000] Linux version 6.16-amd64 (debian-kernel@lists.debian.org) (x86_64-linux-gnu-gcc-14 (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44) #1 SMP PREEMPT_DYNAMIC Debian 6.16-1~exp1 (2025-07-31)
>>      […]
>>      [    0.000000] DMI: Dell Inc. XPS 13 9370/0RMYH9, BIOS 1.21.0 07/06/2022
>>      […]
>>      [   99.566522] xhci_hcd 0000:39:00.0: WARN Set TR Deq Ptr cmd failed due to incorrect slot or ep state.
>>      [   99.566565] usb 4-2.1: Failed to set U2 timeout to 0x3f,error code -110
>>      [   99.566787] hub 4-2.1:1.0: USB hub found
>>      [   99.587655] hub 4-2.1:1.0: config failed, can't read hub descriptor (err -22)
>>      [   99.594669] usb 4-2.1: Failed to suspend device, error -19
>>      […]
> 
> Looks like the left side port is connected to a PCI hotpluggable Alpine 
> Ridge xHCI controller.
> This whole xHCI host will only appear on the PCI bus once a device is 
> connected to the USB-C port
> 
> The right side port is handled by the other xHC that is always visible 
> and already properly running.
> 
> The logs point towards Link Power Management or, runtime suspend race
> issues with the two chained external USB 3 hubs.
> 
> Could you try running with the following kernel parameters set:
> "usbcore.quirks=2109:0817:k"
> to prevent Link Power Management (LPM) for the external hubs

With this set, I am unable to reproduce this.

> "usbcore.autosuspend=-1"
> to prevent runtime suspend of all usb devices
> 
> Does adding either one, or both help?

I only tried the first one. Is that enough?

> Could you also take logs and traces with dynamic debug and tracing enabled:
> 
> mount -t debugfs none /sys/kernel/debug
> echo 'module xhci_hcd =p' >/sys/kernel/debug/dynamic_debug/control
> echo 'module usbcore =p' >/sys/kernel/debug/dynamic_debug/control
> echo 81920 > /sys/kernel/debug/tracing/buffer_size_kb
> echo 1 > /sys/kernel/debug/tracing/events/xhci-hcd/enable
> echo 1 > /sys/kernel/debug/tracing/tracing_on
> < Reproduce issue >
> Send output of dmesg
> Send content of /sys/kernel/debug/tracing/trace

I uploaded everything to the Linux Kernel Bugzilla [1].


Kind regards,

Paul


PS: I was not able to reproduce the issue at work with the same adapter 
model. At home there is a Vodafone router, and at work a Zyxel switch. 
No idea, if other things like running on battery play a role. Anyway, at 
home, I was able to reproduce it.


[1]: https://bugzilla.kernel.org/show_bug.cgi?id=220460


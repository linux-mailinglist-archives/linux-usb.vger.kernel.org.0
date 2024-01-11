Return-Path: <linux-usb+bounces-4941-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D55882B28C
	for <lists+linux-usb@lfdr.de>; Thu, 11 Jan 2024 17:13:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D64F81F251D1
	for <lists+linux-usb@lfdr.de>; Thu, 11 Jan 2024 16:13:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E718D4F61D;
	Thu, 11 Jan 2024 16:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="it02bfF6"
X-Original-To: linux-usb@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8A750252
	for <linux-usb@vger.kernel.org>; Thu, 11 Jan 2024 16:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=1SObebIyACm5jNfggE55WNcE1OLcbTp+MGaaz8I7U5w=; b=it02bfF6vvVOOvZ5NXCchfoNNk
	3h7rXty8DrtHXzvgn6PoNOFTMFTNPh5d1gFCqoZyj5s/ZgAkhjl2CTW4IfK8QNe0l60PfmFOlHsRE
	ua32gbWAsP9o8auFySgabjXmj2kUeH0BSZJEndo2Jcer+KVUdC0ixRtxceZZd3S9z5MY3GXpkS4Iy
	zcIr5uDP4+R4rduYUaiaxTg0ZuDzZB1MmFE+G0aj7d+94utys2EdQfB56uP5lPxXDN+hCBc2lrjDz
	N9GU4RnVqwID2l0/tz0cVaIYknSoEGOCFIPu+K9MBH/wpVtpGhwDsQOnswMlggo3Fm4z/u9/RNeqc
	gZ0a0exQ==;
Received: from [179.232.147.2] (helo=[192.168.0.5])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1rNxgS-005S7h-0W; Thu, 11 Jan 2024 17:13:32 +0100
Message-ID: <849d11d9-9302-4d76-01b6-b5046f474fda@igalia.com>
Date: Thu, 11 Jan 2024 13:13:24 -0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] usb: dwc3: Fix spurious wakeup when port is on device
 mode
Content-Language: en-US
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "balbi@kernel.org" <balbi@kernel.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "johan@kernel.org" <johan@kernel.org>,
 "quic_wcheng@quicinc.com" <quic_wcheng@quicinc.com>,
 "kernel@gpiccoli.net" <kernel@gpiccoli.net>,
 "kernel-dev@igalia.com" <kernel-dev@igalia.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Vivek Dasmohapatra <vivek@collabora.com>,
 "piyush.mehta@amd.com" <piyush.mehta@amd.com>,
 "ray.huang@amd.com" <ray.huang@amd.com>
References: <20231122165931.443845-1-gpiccoli@igalia.com>
 <2dfbf5c9-dd38-c919-c604-618ad08ce456@igalia.com>
 <20231205012336.mn7b7f4zypwcyv6w@synopsys.com>
 <9efaed91-d246-cf3c-efc0-e866f88a943d@igalia.com>
 <d85a5507-4d4a-9e60-fbd1-68b42afb2143@igalia.com>
 <20240111020119.5u3k3csn3bi2zhtw@synopsys.com>
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
In-Reply-To: <20240111020119.5u3k3csn3bi2zhtw@synopsys.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Thinh, thanks for your response! My comments are inline below:


On 10/01/2024 23:01, Thinh Nguyen wrote:
> [...]
> 
> I assume there was a role switch negotiation to switch to device mode
> successfully here before the next step?

Yes, exactly. We have an out-of-tree driver that reads the port state
through some ACPI message to switch modes, but to be 100% clear:

**This OOT driver was factored out for our tests** - in other words: all
tests made were done by manually changing the port mode (via debugfs)
and waiting some seconds for that to settle. This OOT driver is not even
compiled for recent kernels (it runs in a downstream 6.1 kernel).


>>> 3b) if PCIe PME is not using MSIs, Deck suspends and right after (less
>>> than a second), wakes up properly.
>>>
> 
> Your platform is DRD right? If that's the case, then it should be using
> level interrupt. It should not support MSI unless it's host mode only.
>

Yes, DRD indeed - but it's the **PCI PME interrupt**  that uses MSI, not
the USB PCI device. Here is an output of lspci:

$ lspci -vknns 04:00.3
04:00.3 USB controller [0c03]: Advanced Micro Devices, Inc. [AMD]
VanGogh USB0 [1022:163a] (prog-if fe [USB Device])
        Subsystem: Valve Software VanGogh USB0 [1e44:1776]
        Flags: bus master, fast devsel, latency 0, IRQ 26
        Memory at 80000000 (64-bit, non-prefetchable) [size=1M]
        Capabilities: [48] Vendor Specific Information: Len=08 <?>
        Capabilities: [50] Power Management version 3
        Capabilities: [64] Express Endpoint, MSI 00
        Capabilities: [a0] MSI: Enable- Count=1/8 Maskable- 64bit+
        Capabilities: [c0] MSI-X: Enable- Count=8 Masked-
        Capabilities: [100] Vendor Specific Information: ID=0001 Rev=1
Len=010 <?>
        Kernel driver in use: dwc3-pci
        Kernel modules: dwc3_pci

Now, I **guess** this is expected, but there is a difference in
/proc/interrupt between device and host mode:

$ grep 26: /proc/interrupts | tr -s \  # device mode
[empty]

$ grep 26: /proc/interrupts | tr -s \  # host mode
 26: 0 0 0 0 0 0 0 0 IO-APIC 25-fasteoi xhci-hcd:usb3


>>> [...] An example: a keyboard or a disk
>>> connected when the USB port is on device mode doesn't reproduce. Also, I
>>> think I didn't test "in USB3 speed" - could you detail more, not sure if
>>> I understood that properly.
> 
> I mean to ask whether this test was done while operating in SuperSpeed
> or SuperSpeed Plus.

Well, I'm not sure if I know how to answer that heh
Checking "lsusb --tree" in host mode gives me:

/:  Bus 04.Port 1: Dev 1, Class=root_hub, Driver=xhci-hcd/1p, 10000M
/:  Bus 03.Port 1: Dev 1, Class=root_hub, Driver=xhci-hcd/1p, 480M

When I switch to device mode, there is no output (and I think this is
expected, right?). Or...the question was about the USB port in my
laptop, the one I'm connecting on the Deck?

Apologies for my hard time understanding this one...


>>>> [...] 
>>> "Did you check if the driver handled wakeup from PME and properly
>>> restore the controller?" <- I think I didn't - how do you suggest me to
>>> check that?
> 
> If it's in device mode, and you mentioned PME, that means that the
> device was in hibernation. I assume that you're not using the mainline
> dwc3 driver if Steam Deck supports hibernation and was in hibernation
> before the connection. Otherwise, PME should not be generated. If it
> does, something is broken and requires a workaround (as the one you
> have).

There was no hibernation (S4 state) involved, just to clarify - it's a
mem_sleep /suspend to RAM operation, usually called deep sleep / S3. And
indeed, the PME seems to be generated and prevents the mem_sleep (or it
does sleep but instantly wakes-up, which is the case with level interrupts).

I'll check both Steam Deck models (LCD and OLED) to see if both can be
quirked in the same way and provide then a simple patch doing that for
review, makes sense?


> [...] 
> Sorry for the delay response. Just got back from break.

No need for apologies at all, thanks a bunch for your comprehensive
response!

Cheers,


Guilherme


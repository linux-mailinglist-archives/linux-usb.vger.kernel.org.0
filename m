Return-Path: <linux-usb+bounces-5121-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0469B82F229
	for <lists+linux-usb@lfdr.de>; Tue, 16 Jan 2024 17:12:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1CA2B1C235D3
	for <lists+linux-usb@lfdr.de>; Tue, 16 Jan 2024 16:12:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B9571C698;
	Tue, 16 Jan 2024 16:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="JI523hlB"
X-Original-To: linux-usb@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A861C290
	for <linux-usb@vger.kernel.org>; Tue, 16 Jan 2024 16:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Content-Type:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=eCp7ydXu8Hwfdf2W7LMtP0Iw+1MDC8Sac8kt82ub2Ek=; b=JI523hlBW+N+veyTMDbhMnUnb5
	F2WLHulJWuMnE8myZTomWwd0Nig9W1sPALN5Hn/fNy1wySaIDz5K59IaSIbXIkwJ8R1Ivcx0ebMbG
	fK6Z9MsX/l6QIQuiJQFukvHSjsmjAL8825s/hzYoYd5P7HkDH8V1Ja0Id7rHSWeypyNohpVQl53A/
	sGKe+b/3rcM42tUbzSleHCK6uw8KreR8yzBaHnKPAA+SU8EMdlZgbCcmY+dlf3wgEOyX/U20+cjKD
	L+KlZokB+wJVsAwhuNTAQeLIER3NWzF5cvGZ62zC9qNmln9gDwkEUhb+EkOvq5kTEy60M1i3tumQa
	J20SxjBQ==;
Received: from [191.193.161.120] (helo=[192.168.1.60])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1rPm2S-00714T-Vb; Tue, 16 Jan 2024 17:11:45 +0100
Content-Type: multipart/mixed; boundary="------------foh0sdQvFkKQr9Q7prDy1v4g"
Message-ID: <54a9b6b6-ef41-f76a-43e0-a395adddb455@igalia.com>
Date: Tue, 16 Jan 2024 13:11:36 -0300
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
 <849d11d9-9302-4d76-01b6-b5046f474fda@igalia.com>
 <20240113013320.mrqqrdajrnw62kis@synopsys.com>
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
In-Reply-To: <20240113013320.mrqqrdajrnw62kis@synopsys.com>

This is a multi-part message in MIME format.
--------------foh0sdQvFkKQr9Q7prDy1v4g
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/01/2024 22:33, Thinh Nguyen wrote:
> [...]
>> Yes, DRD indeed - but it's the **PCI PME interrupt**  that uses MSI, not
>> the USB PCI device. Here is an output of lspci:
>>
>> $ lspci -vknns 04:00.3
>> 04:00.3 USB controller [0c03]: Advanced Micro Devices, Inc. [AMD]
>> VanGogh USB0 [1022:163a] (prog-if fe [USB Device])
>>         Subsystem: Valve Software VanGogh USB0 [1e44:1776]
>>         Flags: bus master, fast devsel, latency 0, IRQ 26
>>         Memory at 80000000 (64-bit, non-prefetchable) [size=1M]
>>         Capabilities: [48] Vendor Specific Information: Len=08 <?>
>>         Capabilities: [50] Power Management version 3
>>         Capabilities: [64] Express Endpoint, MSI 00
>>         Capabilities: [a0] MSI: Enable- Count=1/8 Maskable- 64bit+
>>         Capabilities: [c0] MSI-X: Enable- Count=8 Masked-
> 
> Are you showing MSI enabled? That looks like MSI is disabled.
> 
>>         Capabilities: [100] Vendor Specific Information: ID=0001 Rev=1
>> Len=010 <?>
>>         Kernel driver in use: dwc3-pci
>>         Kernel modules: dwc3_pci
>>
>> Now, I **guess** this is expected, but there is a difference in
>> /proc/interrupt between device and host mode:
>>
>> $ grep 26: /proc/interrupts | tr -s \  # device mode
>> [empty]
>>
>> $ grep 26: /proc/interrupts | tr -s \  # host mode
>>  26: 0 0 0 0 0 0 0 0 IO-APIC 25-fasteoi xhci-hcd:usb3
> 
> Looks like it's level interrupt here. I don't see "edge" or MSI
> interrupt. Is the pcie_pme share the same interrupt line as the usb
> controller?
> 

Hi Thinh, thanks again for your observations.

So, the USB device interrupt is *level* triggered, no MSI involved
indeed, you pointed in the above lspci output.

However, the *PME PCIe interrupt is MSI* by default. And we can shift
that to level through a kernel parameter ("pcie_pme=nomsi"), the net
effect is the same, i.e., issue is still present. I'll paste here the
lspci of the PCI bridge device that triggers the wakeup:

$ cat /sys/power/pm_wakeup_irq
28


$ cat /proc/interrupts |grep -w 28: | tr -s \
28: 0 0 1 0 0 0 0 0 PCI-MSI-0000:00:08.1 0-edge PCIe PME [0]


$ lspci -knnvs 0000:00:08.1
00:08.1 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] VanGogh
Internal PCIe GPP Bridge to Bus [1022:1648] (prog-if 00 [Normal decode])
        Subsystem: Advanced Micro Devices, Inc. [AMD] VanGogh Internal
PCIe GPP Bridge to Bus [1022:1648]
        Flags: bus master, fast devsel, latency 0, IRQ 28
        Bus: primary=00, secondary=04, subordinate=04, sec-latency=0
        I/O behind bridge: 1000-1fff [size=4K] [16-bit]
        Memory behind bridge: 80000000-803fffff [size=4M] [32-bit]
        Prefetchable memory behind bridge: f8e0000000-f8f01fffff
[size=258M] [32-bit]
        Capabilities: [50] Power Management version 3
        Capabilities: [58] Express Root Port (Slot-), MSI 00
        Capabilities: [a0] MSI: Enable+ Count=1/1 Maskable- 64bit+
        Capabilities: [c0] Subsystem: Advanced Micro Devices, Inc. [AMD]
VanGogh Internal PCIe GPP Bridge to Bus [1022:1648]
        Capabilities: [100] Vendor Specific Information: ID=0001 Rev=1
Len=010 <?>
        Capabilities: [270] Secondary PCI Express
        Capabilities: [400] Data Link Feature <?>
        Capabilities: [410] Physical Layer 16.0 GT/s <?>
        Capabilities: [440] Lane Margining at the Receiver <?>
        Kernel driver in use: pcieport


[0] The /proc/interrupts increases by 1 at every wakeup attempt when in
MSI mode. No increase happens if in level mode.


Another output that could be helpful to understand the PCI topology is
the lspci -t, I have a pastebin for that (also attached here):
https://termbin.com/dccj


> I'm not sure how the STEAM DECK is designed. Does the OOT driver manages
> the power state request outside of the PCI PM for device mode and not
> just reading the port state? If that's the case, the issue could be in
> the OOT driver?

If you want to take a look in how the OOT driver switches the dwc3 mode
between device/host, here is the code:
https://lore.kernel.org/lkml/20220206022023.376142-1-andrew.smirnov@gmail.com/

In fact, this was split in a single small extcon driver in the Valve
tree, but the code is the same as above, take a look specially in the
functions steamdeck_notify() and steamdeck_usb_role_work().

Notice *all* my tests are with mainline (6.7-rc6+) and *without* this
OOT driver, so I'm not sure how could it be related...the OOT just
relies on ACPI messages to switch automatically between host/device
mode, and in my tests, I'm doing this manually.


> [...]
>> There was no hibernation (S4 state) involved, just to clarify - it's a
>> mem_sleep /suspend to RAM operation, usually called deep sleep / S3. And
>> indeed, the PME seems to be generated and prevents the mem_sleep (or it
>> does sleep but instantly wakes-up, which is the case with level interrupts).
> 
> I was referring to the controller hibernation and not system
> hibernation. S3 will cause the xhci driver to put the host controller to
> go into hibernation and send a power state change request through PCI
> PM. Usually the power state change would put the core in D3 and passes
> the control to the PMU, and PME generation can happen then. Similar
> behavior applies to device mode, but the power state change may be tied
> to a different interface than PCI PM?
> 
> Perhaps you're missing the logic/flow to update the power state change
> when in device mode. And perhaps putting the controller in host mode
> passes the control to xhci allowing the driver to properly manage the
> power state preventing PME from generated? It's a little difficult to
> debug without more info.
>> Did you seek help from the vendor?

Thanks for the clarification about the hibernation concept!

"perhaps putting the controller in host mode passes the control to xhci"
<- this is true if we *manually* set the device to host mode in debugfs
- xhci_hcd takes control, and all works fine.

But it is *not the case* with the quirk - we just write to that register
in the last step of dwc3 suspend. For example, I just tried here with no
xhci module available, with dwc3 in device mode - and suspend works fine
_with the quirk_.

Would be very interesting to have the datasheet of this device in hands
to determine what this write does in the controller exactly, but I have
no access to it. That would likely explain a lot about why the quirk works.

Regarding HW vendor support, as Vivek said, they're looped it seems, but
my goal with the quirk (that I've now restricted to this specific device
and will resubmit) is to unblock the usage of DRD in the Steam Deck for
the users in the short-term.


> [...]
> I assume you ruled out problems from bad cable or faulty laptop/device?


Yeah, sure - there are many ways to reproduce, multiple users ...seems
really not related with faulty cables heh

Cheers!
--------------foh0sdQvFkKQr9Q7prDy1v4g
Content-Type: text/plain; charset=UTF-8; name="lspci-tv.out"
Content-Disposition: attachment; filename="lspci-tv.out"
Content-Transfer-Encoding: base64

LVswMDAwOjAwXS0rLTAwLjAgIEFkdmFuY2VkIE1pY3JvIERldmljZXMsIEluYy4gW0FNRF0g
VmFuR29naCBSb290IENvbXBsZXgKICAgICAgICAgICArLTAxLjAgIEFkdmFuY2VkIE1pY3Jv
IERldmljZXMsIEluYy4gW0FNRF0gUmVub2lyIFBDSWUgRHVtbXkgSG9zdCBCcmlkZ2UKICAg
ICAgICAgICArLTAxLjItWzAxXS0tLS0wMC4wICBTYW1zdW5nIEVsZWN0cm9uaWNzIENvIEx0
ZCBOVk1lIFNTRCBDb250cm9sbGVyIDk4MAogICAgICAgICAgICstMDEuMy1bMDJdLS0tLTAw
LjAgIE8yIE1pY3JvLCBJbmMuIFNEL01NQyBDYXJkIFJlYWRlciBDb250cm9sbGVyCiAgICAg
ICAgICAgKy0wMS40LVswM10tLS0tMDAuMCAgUmVhbHRlayBTZW1pY29uZHVjdG9yIENvLiwg
THRkLiBSVEw4ODIyQ0UgODAyLjExYWMgUENJZSBXaXJlbGVzcyBOZXR3b3JrIEFkYXB0ZXIK
ICAgICAgICAgICArLTA4LjAgIEFkdmFuY2VkIE1pY3JvIERldmljZXMsIEluYy4gW0FNRF0g
UmVub2lyIFBDSWUgRHVtbXkgSG9zdCBCcmlkZ2UKICAgICAgICAgICArLTA4LjEtWzA0XS0t
Ky0wMC4wICBBZHZhbmNlZCBNaWNybyBEZXZpY2VzLCBJbmMuIFtBTUQvQVRJXSBWYW5Hb2do
IFtBTUQgQ3VzdG9tIEdQVSAwNDA1XQogICAgICAgICAgIHwgICAgICAgICAgICArLTAwLjEg
IEFkdmFuY2VkIE1pY3JvIERldmljZXMsIEluYy4gW0FNRC9BVEldIFJlbWJyYW5kdCBSYWRl
b24gSGlnaCBEZWZpbml0aW9uIEF1ZGlvIENvbnRyb2xsZXIKICAgICAgICAgICB8ICAgICAg
ICAgICAgKy0wMC4yICBBZHZhbmNlZCBNaWNybyBEZXZpY2VzLCBJbmMuIFtBTURdIFZhbkdv
Z2ggUFNQL0NDUAogICAgICAgICAgIHwgICAgICAgICAgICArLTAwLjMgIEFkdmFuY2VkIE1p
Y3JvIERldmljZXMsIEluYy4gW0FNRF0gVmFuR29naCBVU0IwCiAgICAgICAgICAgfCAgICAg
ICAgICAgICstMDAuNCAgQWR2YW5jZWQgTWljcm8gRGV2aWNlcywgSW5jLiBbQU1EXSBWYW5H
b2doIFVTQjEKICAgICAgICAgICB8ICAgICAgICAgICAgXC0wMC41ICBBZHZhbmNlZCBNaWNy
byBEZXZpY2VzLCBJbmMuIFtBTURdIEFDUC9BQ1AzWC9BQ1A2eCBBdWRpbyBDb3Byb2Nlc3Nv
cgogICAgICAgICAgICstMDguMi1bMDVdLS0tLTAwLjAgIEFkdmFuY2VkIE1pY3JvIERldmlj
ZXMsIEluYy4gW0FNRF0gWmVwcGVsaW4vUmF2ZW4vUmF2ZW4yIFBDSWUgRHVtbXkgRnVuY3Rp
b24KICAgICAgICAgICArLTA4LjMtWzA2XS0tLS0wMC4wICBBZHZhbmNlZCBNaWNybyBEZXZp
Y2VzLCBJbmMuIFtBTURdIFplcHBlbGluL1JhdmVuL1JhdmVuMiBQQ0llIER1bW15IEZ1bmN0
aW9uCiAgICAgICAgICAgKy0xNC4wICBBZHZhbmNlZCBNaWNybyBEZXZpY2VzLCBJbmMuIFtB
TURdIEZDSCBTTUJ1cyBDb250cm9sbGVyCiAgICAgICAgICAgKy0xNC4zICBBZHZhbmNlZCBN
aWNybyBEZXZpY2VzLCBJbmMuIFtBTURdIEZDSCBMUEMgQnJpZGdlCiAgICAgICAgICAgKy0x
OC4wICBBZHZhbmNlZCBNaWNybyBEZXZpY2VzLCBJbmMuIFtBTURdIFZhbkdvZ2ggRGF0YSBG
YWJyaWM7IEZ1bmN0aW9uIDAKICAgICAgICAgICArLTE4LjEgIEFkdmFuY2VkIE1pY3JvIERl
dmljZXMsIEluYy4gW0FNRF0gVmFuR29naCBEYXRhIEZhYnJpYzsgRnVuY3Rpb24gMQogICAg
ICAgICAgICstMTguMiAgQWR2YW5jZWQgTWljcm8gRGV2aWNlcywgSW5jLiBbQU1EXSBWYW5H
b2doIERhdGEgRmFicmljOyBGdW5jdGlvbiAyCiAgICAgICAgICAgKy0xOC4zICBBZHZhbmNl
ZCBNaWNybyBEZXZpY2VzLCBJbmMuIFtBTURdIFZhbkdvZ2ggRGF0YSBGYWJyaWM7IEZ1bmN0
aW9uIDMKICAgICAgICAgICArLTE4LjQgIEFkdmFuY2VkIE1pY3JvIERldmljZXMsIEluYy4g
W0FNRF0gVmFuR29naCBEYXRhIEZhYnJpYzsgRnVuY3Rpb24gNAogICAgICAgICAgICstMTgu
NSAgQWR2YW5jZWQgTWljcm8gRGV2aWNlcywgSW5jLiBbQU1EXSBWYW5Hb2doIERhdGEgRmFi
cmljOyBGdW5jdGlvbiA1CiAgICAgICAgICAgKy0xOC42ICBBZHZhbmNlZCBNaWNybyBEZXZp
Y2VzLCBJbmMuIFtBTURdIFZhbkdvZ2ggRGF0YSBGYWJyaWM7IEZ1bmN0aW9uIDYKICAgICAg
ICAgICBcLTE4LjcgIEFkdmFuY2VkIE1pY3JvIERldmljZXMsIEluYy4gW0FNRF0gVmFuR29n
aCBEYXRhIEZhYnJpYzsgRnVuY3Rpb24gNwoKCg==

--------------foh0sdQvFkKQr9Q7prDy1v4g--


Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 76F8A606DC
	for <lists+linux-usb@lfdr.de>; Fri,  5 Jul 2019 15:51:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728133AbfGENvq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 5 Jul 2019 09:51:46 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:33472 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727498AbfGENvq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 5 Jul 2019 09:51:46 -0400
Received: from mail-pf1-f200.google.com ([209.85.210.200])
        by youngberry.canonical.com with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
        (Exim 4.76)
        (envelope-from <kai.heng.feng@canonical.com>)
        id 1hjOcq-0002P0-6b
        for linux-usb@vger.kernel.org; Fri, 05 Jul 2019 13:51:44 +0000
Received: by mail-pf1-f200.google.com with SMTP id x18so5621130pfj.4
        for <linux-usb@vger.kernel.org>; Fri, 05 Jul 2019 06:51:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=YNguRT3VdYqQwZjKNQS52cI6hAGLZ3x6rPPYR/rKEKA=;
        b=oN3eGHDcBuaMSZW2ns2u5zxf15BRkKAODyiHpOhlvyGM9d068CO3XmYwfH5+JRznbB
         ayBIgFPN0X9zQ/8T7aIjiqLUIr20BoOxPCjv52bKGsw/x1i/sAxJw29PJv6mNXAspyMB
         ZiBnH9A9OkCOwKcE9gxU1BsNuybeuYXKhcq9BBs9o8WbkOjBVgzOkLYpL0WBPtqPmtt7
         rtSbG8sKSzLxu5t44Xb+L3jUW3nQ00cSqjQ4YItrdX+6JqI7uktT+wXYY5yfVNCPhk7V
         pQgGRipLyWxGPwBKpCEPculHRgcE7xCjAyeX06Xu+KavSmaqg/qXPG7GOJUxFqNU5rpX
         Dhzg==
X-Gm-Message-State: APjAAAX79WUKZplPODN/Sddb/bQqgesGWVQKif4IkRjh8b1owYp/qoCz
        R5MjA+4hlTuMdPx0Kudaj3ykWQ19d23LLk19cbCG4N4KkWRVcwNE07YrCh6+d+spQP0jN635Zex
        jM9PXtGytI2c8zIUyvtm+Y5CuJjWpBFakh8z8EQ==
X-Received: by 2002:a63:6b07:: with SMTP id g7mr5899669pgc.325.1562334702787;
        Fri, 05 Jul 2019 06:51:42 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz1NYy+OXhkmgOsgIAs7QkwNkkbjEIdrxYNXrmiO+nSeuTs0BUjocoDARsdAgBemJLpGveq5g==
X-Received: by 2002:a63:6b07:: with SMTP id g7mr5899635pgc.325.1562334702413;
        Fri, 05 Jul 2019 06:51:42 -0700 (PDT)
Received: from 2001-b011-380f-3511-154d-4126-51e3-28cb.dynamic-ip6.hinet.net (2001-b011-380f-3511-154d-4126-51e3-28cb.dynamic-ip6.hinet.net. [2001:b011:380f:3511:154d:4126:51e3:28cb])
        by smtp.gmail.com with ESMTPSA id a25sm8766164pfn.1.2019.07.05.06.51.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 05 Jul 2019 06:51:41 -0700 (PDT)
Content-Type: text/plain;
        charset=utf-8;
        delsp=yes;
        format=flowed
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: [PATCH] PCI / PM: Don't runtime suspend when device only supports
 wakeup from D0
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <2067449.jKPth8Qelp@kreacher>
Date:   Fri, 5 Jul 2019 21:51:39 +0800
Cc:     Bjorn Helgaas <helgaas@kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Rafael Wysocki <rafael.j.wysocki@intel.com>,
        linux-pci@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        linux-usb@vger.kernel.org
Content-Transfer-Encoding: 8bit
Message-Id: <3EF5C3B9-F7D0-49C3-9CC0-88DDDDAF4616@canonical.com>
References: <20190522181157.GC79339@google.com>
 <20190605115724.GE84290@google.com>
 <7E5CD0E5-2C23-4339-9660-74994FC5C111@canonical.com>
 <2067449.jKPth8Qelp@kreacher>
To:     "Rafael J. Wysocki" <rjw@rjwysocki.net>
X-Mailer: Apple Mail (2.3445.104.11)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

at 17:39, Rafael J. Wysocki <rjw@rjwysocki.net> wrote:

> On Friday, July 5, 2019 9:02:01 AM CEST Kai-Heng Feng wrote:
>> at 19:57, Bjorn Helgaas <helgaas@kernel.org> wrote:
>>
>>> On Mon, May 27, 2019 at 11:57:47AM -0500, Bjorn Helgaas wrote:
>>>> On Thu, May 23, 2019 at 12:39:23PM +0800, Kai-Heng Feng wrote:
>>>>> at 04:52, Bjorn Helgaas <helgaas@kernel.org> wrote:
>>>>>> On Wed, May 22, 2019 at 02:39:56PM -0400, Alan Stern wrote:
>>>>>>> On Wed, 22 May 2019, Bjorn Helgaas wrote:
>>>>>>>> On Wed, May 22, 2019 at 11:46:25PM +0800, Kai Heng Feng wrote:
>>>>>>>>>> On May 22, 2019, at 9:48 PM, Bjorn Helgaas <helgaas@kernel.org>
>>>>>>>>>> wrote:
>>>>>>>>>> On Wed, May 22, 2019 at 11:42:14AM +0800, Kai Heng Feng wrote:
>>>>>>>>>>> at 6:23 AM, Bjorn Helgaas <helgaas@kernel.org> wrote:
>>>>>>>>>>>> On Wed, May 22, 2019 at 12:31:04AM +0800, Kai-Heng Feng wrote:
>>>>>>>>>>>>> There's an xHC device that doesn't wake when
>>>>>>>>>>>>> a USB device gets plugged
>>>>>>>>>>>>> to its USB port. The driver's own runtime
>>>>>>>>>>>>> suspend callback was called,
>>>>>>>>>>>>> PME signaling was enabled, but it stays at PCI D0.
>>>>>>>>
>>>>>>>>>> ...
>>>>>>>>>> And I guess this patch basically means we wouldn't call
>>>>>>>>>> the driver's suspend callback if we're merely going to
>>>>>>>>>> stay at D0, so the driver would have no idea anything
>>>>>>>>>> happened.  That might match Documentation/power/pci.txt
>>>>>>>>>> better, because it suggests that the suspend callback is
>>>>>>>>>> related to putting a device in a low-power state, and D0
>>>>>>>>>> is not a low-power state.
>>>>>>>>>
>>>>>>>>> Yes, the patch is to let the device stay at D0 and don’t run
>>>>>>>>> driver’s own runtime suspend routine.
>>>>>>>>>
>>>>>>>>> I guess I’ll just proceed to send a V2 with updated commit message?
>>>>>>>>
>>>>>>>> Now that I understand what "runtime suspended to D0" means, help me
>>>>>>>> understand what's actually wrong.
>>>>>>>
>>>>>>> Kai's point is that the xhci-hcd driver thinks the device is now
>>>>>>> in runtime suspend, because the runtime_suspend method has been
>>>>>>> executed.  But in fact the device is still in D0, and as a
>>>>>>> result, PME signalling may not work correctly.
>>>>>>
>>>>>> The device claims to be able to signal PME from D0 (this is from the
>>>>>> lspci
>>>>>> in https://bugzilla.kernel.org/show_bug.cgi?id=203673):
>>>>>>
>>>>>>   00:10.0 USB controller: Advanced Micro Devices, Inc. [AMD] FCH USB XHCI Controller (rev 20) (prog-if 30 [XHCI])
>>>>>>     Capabilities: [50] Power Management version 3
>>>>>>       Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
>>>>>>
>>>>>> From the xHCI spec r1.0, sec 4.15.2.3, it looks like a connect
>>>>>> detected while in D0 should assert PME# if enabled (and WCE is
>>>>>> set).
>>>>>
>>>>> I think section 4.15.2.3 is about S3 wake up, no S0 we are
>>>>> discussing here.
>>>>
>>>> S0 and S3 are system-level ideas and have no meaning to an individual
>>>> PCI device.  The xHC is a PCI device and can't tell whether the system
>>>> as a whole is in S0 or S3.  If a PCI device claims to be able to
>>>> generate PME while in D0, that applies regardless of the system state.
>>>>
>>>> xHCI r1.0, sec A.1 says "The host controller should be capable of
>>>> asserting PME# when in any supported device state."  In sec 4.19.2,
>>>> Figure 42 says PME# should be asserted whenever PMCSR.PME_En=1 and
>>>> WCE=1 and a connection is detected.
>>>>
>>>> Figure 42 also shows that CSC (Connect Status Change) and related bits
>>>> feed into Port Status Change Event Generation.  So I assume the xhci
>>>> driver normally detects connect/disconnect via CSC, but the runtime
>>>> suspend method makes it use PME# instead?
>>>>
>>>> And the way your patch works is by avoiding that xhci runtime suspend
>>>> method, so it *always* uses CSC and never uses PME#?  If that's the
>>>> case, we're just papering over a problem without really understanding
>>>> it.
>>>>
>>>> I'm wondering if this platform has a firmware defect.  Here's my
>>>> thinking.  The xHC is a Root Complex Integrated Endpoint, so its PME
>>>> signaling is a little unusual.
>>>>
>>>> The typical scenario is that a PCIe device is below a Root Port.  In
>>>> that case, it would send a PME Message upstream to the Root Port.  Per
>>>> PCIe r4.0, sec 6.1.6, when configured for native PME support (for ACPI
>>>> systems, I assume this means "when firmware has granted PME control to
>>>> the OS via _OSC"), the Root Port would generate a normal PCI INTx or
>>>> MSI interrupt:
>>>>
>>>>   PCI Express-aware software can enable a mode where the Root Complex
>>>>   signals PME via an interrupt. When configured for native PME
>>>>   support, a Root Port receives the PME Message and sets the PME
>>>>   Status bit in its Root Status register. If software has set the PME
>>>>   Interrupt Enable bit in the Root Control register to 1b, the Root
>>>>   Port then generates an interrupt.
>>>>
>>>> But on this platform the xHC is a Root Complex Integrated Endpoint, so
>>>> there is no Root Port upstream from it, and that mechanism can't be
>>>> used.  Per PCIe r4.0, sec 1.3.2.3, RCiEPs signal PME via "the same
>>>> mechanism as PCI systems" or via Root Complex Event Collectors:
>>>>
>>>>   An RCiEP must signal PME and error conditions through the same
>>>>   mechanisms used on PCI systems. If a Root Complex Event Collector is
>>>>   implemented, an RCiEP may optionally signal PME and error conditions
>>>>   through a Root Complex Event Collector.
>>>>
>>>> This platform has no Root Complex Event Collectors, so the xHC should
>>>> signal PME via the same mechanism as PCI systems, i.e., asserting a
>>>> PME# signal.  I think this means the OS cannot use native PCIe PME
>>>> control because it doesn't know what interrupt PME# is connected to.
>>>> The PCI Firmware Spec r3.2, sec 4.5.1 (also quoted in ACPI v6.2, sec
>>>> 6.2.11.3), says:
>>>>
>>>>   PCI Express Native Power Management Events control
>>>>
>>>>   The firmware sets this bit to 1 to grant control over PCI Express
>>>>   native power management event interrupts (PMEs). If firmware
>>>>   allows the operating system control of this feature, then in the
>>>>   context of the _OSC method, it must ensure that all PMEs are
>>>>   routed to root port interrupts as described in the PCI Express
>>>>   Base Specification.
>>>>
>>>> This platform cannot route all PMEs to Root Port interrupts because
>>>> the xHC RCiEP cannot report PME via a Root Port, so I think its _OSC
>>>> method should not grant control of PCIe Native Power Management Events
>>>> to the OS, and I think that would mean we have to use the ACPI
>>>> mechanism for PME on this platform.
>>>>
>>>> Can you confirm or deny any of this line of reasoning?  I'm wondering
>>>> if there's something wrong with the platform's _OSC, so Linux thinks
>>>> it can use native PME, but that doesn't work for this device.
>>>>
>>>>> It’s a platform in development so the name can’t be disclosed.
>>>>
>>>> Please attach a complete dmesg log to the bugzilla.  You can remove
>>>> identifying details like the platform name, but I want to see the
>>>> results of the _OSC negotiation.
>>>
>>> Thanks for the dmesg log
>>> (https://bugzilla.kernel.org/attachment.cgi?id=283109).  It shows:
>>>
>>>   acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM ClockPM Segments MSI HPX-Type3]
>>>   acpi PNP0A08:00: _OSC: platform does not support [SHPCHotplug LTR]
>>>   acpi PNP0A08:00: _OSC: OS now controls [PCIeHotplug PME AER PCIeCapability]
>>>
>>> I think it is incorrect for the platform to give the OS native control
>>> over PME because the OS has no way to know how the RCiEP PMEs are
>>> routed.  But it would be interesting to know how BIOSes on other
>>> platforms with RCiEPs handle this, and I did post a question to the
>>> PCI-SIG to see if there's any guidance there.
>>
>> Is there any update from PCI-SIG?
>>
>> I really think we don’t need wakeup capability in D0 because D0 is a
>> working state.
>
> Well, in theory, devices may stay in D0 over suspend-to-idle and they may  
> need to
> signal wakeup then.  Using PME for that would be kind of handy (if it  
> worked) as it
> would allow special handling of in-band IRQs to be avoided in that case.

That makes sense but doesn’t apply to this case.
This patch only avoids D0 runtime suspend, suspend-to-idle will call  
system-wide suspend routine which still enables D0 PME.

It’ll be great if you can review my v3 patch here:
https://patchwork.kernel.org/patch/10960271/

Kai-Heng


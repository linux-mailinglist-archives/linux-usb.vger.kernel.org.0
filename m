Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88A6B437401
	for <lists+linux-usb@lfdr.de>; Fri, 22 Oct 2021 10:53:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232233AbhJVIzs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 22 Oct 2021 04:55:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:52892 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231984AbhJVIzr (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 22 Oct 2021 04:55:47 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7DF1260EB8;
        Fri, 22 Oct 2021 08:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634892810;
        bh=MTY+lVDKxuTLi1M/IfHpLduYSJ0e+UAL6yo+CJfhEIU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=umkQJ08qwfTxqjsM0LWk8P3XDQWBSDloYaWR/BydntnsdemGrlu5lv04IkRw0iNnD
         oAq4Gub156NaMAzTg6jdoxtC1G9fGbdjWnyyjIdUnwA/6ZJ5HHFZzZ9AXZqoFtKOY8
         sbhew11zgKEHCv89zS4Ge0Asj7C6n0kNHbOi59FYBM4fVgHsXv+A3M0bIEHv11tH+F
         YlCjK0QaPjmQ4K5yiK6u4FfQi7CceL/rTkgvk5+8Yeq6MNU4NWw69ly5v8H2GeopOd
         IwZ1blON60OKa3QbGHK93CHdn855z3oxGTUxqXGfzX9djriGn5sm5fCcy5CjdkYh69
         4FSMOQZrpSSbg==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1mdqIe-0002PV-9D; Fri, 22 Oct 2021 10:53:16 +0200
Date:   Fri, 22 Oct 2021 10:53:16 +0200
From:   Johan Hovold <johan@kernel.org>
To:     bugzilla-daemon@bugzilla.kernel.org,
        Scott Arnold <scott.c.arnold@nasa.gov>
Cc:     linux-usb@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [Bug 214789] ehci-hcd.c ISR
Message-ID: <YXJ7/P9xErW591VC@hovoldconsulting.com>
References: <bug-214789-208809@https.bugzilla.kernel.org/>
 <bug-214789-208809-pZY0CUx8KD@https.bugzilla.kernel.org/>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bug-214789-208809-pZY0CUx8KD@https.bugzilla.kernel.org/>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Oct 21, 2021 at 08:04:06PM +0000, bugzilla-daemon@bugzilla.kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=214789
> 
> --- Comment #9 from Scott Arnold (scott.c.arnold@nasa.gov) ---
> Hello,
> The timing card driver receives no interrupts according to debug.
> IRQ16:  IO-APIC   16-fasteoi   ehci_hcd:usb1, hpilo, rt_pcclk

So the IRQ is also shared with some (mainline) HP management-processor
driver (hpilo).

> Ehci_hcd entries in /sys/kernel/debug/usb/devices:
> 
> T:  Bus=01 Lev=00 Prnt=00 Port=00 Cnt=00 Dev#=  1 Spd=480  MxCh= 2
> B:  Alloc=  0/800 us ( 0%), #Int=  4, #Iso=  0
> D:  Ver= 2.00 Cls=09(hub  ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
> P:  Vendor=1d6b ProdID=0002 Rev= 5.11
> S:  Manufacturer=Linux 5.11.17_OBCS_1 ehci_hcd
> S:  Product=EHCI Host Controller
> S:  SerialNumber=0000:00:1a.0
> C:* #Ifs= 1 Cfg#= 1 Atr=e0 MxPwr=  0mA
> I:* If#= 0 Alt= 0 #EPs= 1 Cls=09(hub  ) Sub=00 Prot=00 Driver=hub
> E:  Ad=81(I) Atr=03(Int.) MxPS=   4 Ivl=256ms

Just to be clear: Are there any USB devices physically connected to this
bus?

What does "lsusb -s1:" say?

> I have not tried enabling debug in ehci_hcd yet.

Try adding

	WARN_ON_ONCE(!irqs_disabled());

at the start of ehci_irq() before grabbing the lock.

That should give us a stack dump in case there's someone calling the
interrupt handler with interrupts enabled (which seems to be the case).

Johan

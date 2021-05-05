Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA08B3739C7
	for <lists+linux-usb@lfdr.de>; Wed,  5 May 2021 14:01:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232397AbhEEMCR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 5 May 2021 08:02:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:35804 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231678AbhEEMCR (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 5 May 2021 08:02:17 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 610BA61157;
        Wed,  5 May 2021 12:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620216080;
        bh=1dR9eX5jna5HSMsDD8hZgYdZL6Yw/8ttoYzEbl7Rp5o=;
        h=Date:From:To:Subject:From;
        b=Q1N/W+tFS5hIVnZ0tDonRV7Zvpa4jRFbzc2TwKGIvRPLJL4HPAy8SyDmt1QSc6XC5
         Mq1Pi6N02F7hSnxV7P3akNV7UyRginU0rGRbpFF12ikfTkQzZcDeQlPjFdIv3wD/C9
         SvjjLFcCyRNMRUCx2DefWOYQN5k+jJnLpCMMxyZr6lnvSSLAO4YWDm1IpSdOJjhmXB
         cE6LVygJeSaEtSb5ksQ4ZMOjjiJOVOwvWCXLmF0504YwSGwZLVAlm7KgdoD5EMqvcb
         LDDGlV2ojGr+RWpwrd0Ntpvd7McNCg0WHrXvTDwuh5oj4qeD5KPhuuoFJ5Jow/AMzy
         NNm/b4vvDDxzA==
Received: by pali.im (Postfix)
        id BA8A579D; Wed,  5 May 2021 14:01:17 +0200 (CEST)
Date:   Wed, 5 May 2021 14:01:17 +0200
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To:     linux-usb@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>
Subject: xhci_pci & PCIe hotplug crash
Message-ID: <20210505120117.4wpmo6fhvzznf3wv@pali>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: NeoMutt/20180716
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello!

During debugging of pci-aardvark.c driver I got following synchronous
external abort 96000210 which I can reproduce with VIA XHCI controller
when PCIe hot plug support is enabled in kernel and PCIe Root Bridge
triggers link down event via PCIe hot plug interrupt.

[   71.773033] pcieport 0000:00:00.0: pciehp: Slot(0): Link Down
[   71.779120] xhci_hcd 0000:01:00.0: remove, state 4
[   71.784113] usb usb5: USB disconnect, device number 1
[   71.790398] xhci_hcd 0000:01:00.0: USB bus 5 deregistered
[   72.511899] Internal error: synchronous external abort: 96000210 [#1] SMP
[   72.518918] Modules linked in:
[   72.522074] CPU: 1 PID: 988 Comm: irq/53-pciehp Not tainted 5.12.0-dirty #949
[   72.536983] pstate: 60000085 (nZCv daIf -PAN -UAO -TCO BTYPE=--)
[   72.543182] pc : xhci_irq+0x70/0x17b8
[   72.546972] lr : xhci_irq+0x28/0x17b8
[   72.550752] sp : ffffffc012b8bab0
[   72.554167] x29: ffffffc012b8bab0 x28: 00000000000000a0 
[   72.559652] x27: 0000000000000060 x26: ffffff8000af2250 
[   72.565135] x25: ffffffc0100b0d48 x24: ffffffc0100b0be0 
[   72.570620] x23: ffffff80003be028 x22: ffffff8000af229c 
[   72.576104] x21: 0000000000000080 x20: ffffff8000af2000 
[   72.581587] x19: ffffff8000af2000 x18: 0000000000000004 
[   72.587071] x17: 0000000000000000 x16: 0000000000000000 
[   72.592553] x15: ffffffc01154cc70 x14: ffffff8001751df8 
[   72.598037] x13: 0000000000000000 x12: 0000000000000000 
[   72.603519] x11: ffffff8001751da8 x10: ffffffc01154cc78 
[   72.609001] x9 : ffffffc01087c238 x8 : 0000000000000000 
[   72.614485] x7 : ffffffc01162c4e0 x6 : 0000000000000000 
[   72.619967] x5 : fffffffe00085000 x4 : fffffffe00085000 
[   72.625451] x3 : 0000000000000000 x2 : 0000000000000001 
[   72.630933] x1 : ffffffc0118bd024 x0 : 0000000000000000 
[   72.636415] Call trace:
[   72.638936]  xhci_irq+0x70/0x17b8
[   72.642360]  usb_hcd_irq+0x34/0x50
[   72.645876]  usb_hcd_pci_remove+0x78/0x138
[   72.650106]  xhci_pci_remove+0x6c/0xa8
[   72.653978]  pci_device_remove+0x44/0x108
[   72.658122]  device_release_driver_internal+0x110/0x1e0
[   72.663521]  device_release_driver+0x1c/0x28
[   72.667931]  pci_stop_bus_device+0x84/0xc0
[   72.672162]  pci_stop_and_remove_bus_device+0x1c/0x30
[   72.677373]  pciehp_unconfigure_device+0x98/0xf8
[   72.682138]  pciehp_disable_slot+0x60/0x118
[   72.686457]  pciehp_handle_presence_or_link_change+0xec/0x3b0
[   72.692386]  pciehp_ist+0x170/0x1a0
[   72.695984]  irq_thread_fn+0x30/0x90
[   72.699674]  irq_thread+0x13c/0x200
[   72.703271]  kthread+0x12c/0x130
[   72.706603]  ret_from_fork+0x10/0x1c
[   72.710299] Code: 35ffff83 35002741 f9400f41 91001021 (b9400021) 
[   72.716586] ---[ end trace 20ce3e30ff292c93 ]---
[   72.721453] genirq: exiting task "irq/53-pciehp" (988) is an active IRQ thread (irq 53)
[   72.730068] sched: RT throttling activated

And after that kernel is in some semi-broken state. Some functionality
works, but some other (like reboot) does not.

I can reproduce it also when I manually inject/fake this link down PCIe
hot plug interrupt with setting corresponding bits in PCIe Root Status
registers, so pciehp driver thinks that link down even occurred.

I suspect that issue is in usb_hcd_pci_remove() function which calls
local_irq_disable()+usb_hcd_irq()+local_irq_enable() functions but do
not take into care that whole usb_hcd_pci_remove() function may be
called from interrupt context.

Can you look at this issue if it is really safe to call usb_hcd_irq()
from interrupt context? Or rather if it is safe to call functions like
pciehp_disable_slot() or device_release_driver() from interrupt context
like it can be seen in call trace?

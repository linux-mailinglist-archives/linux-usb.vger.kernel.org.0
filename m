Return-Path: <linux-usb+bounces-21398-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB2FA503C7
	for <lists+linux-usb@lfdr.de>; Wed,  5 Mar 2025 16:48:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F15B318913B2
	for <lists+linux-usb@lfdr.de>; Wed,  5 Mar 2025 15:48:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBA3A24BC1D;
	Wed,  5 Mar 2025 15:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JnVEGTDH"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 948732063DB
	for <linux-usb@vger.kernel.org>; Wed,  5 Mar 2025 15:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741189707; cv=none; b=fLD7pTM+z5OegJpIIBg5/oPI1OhqnsD4qPbCBD4ef7Od2t1uUy6MT1WFKvjw0lKFgxoTkZW2As6+kQDbDMEULFyQA+0NMw4a5Z+Em8mAbc3U91xGhyIr4YY4iEmr3FT8gJvxHd9rh6LqfLWJ4kJduA5JF7fopVK02LJaaOAxOOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741189707; c=relaxed/simple;
	bh=cJo5gvJVJKTLFt4f8+S+t3ffg2rOlD50JLe6Y5f9wW8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lv8fbJJjEfYivcc9FduiZvDkMktGjbjDnlHAt3mlz6E8KBkAqMSDfRhF8DTEkIfu1wy/IaZJ4GTjbavVgVA4S1cvaLJPU12Ta8995/Hnns/YLFjMnAQOktELQwnEkG2PU+4CbSGsM6pwmrXgxFN6h02viuabLaLI2Ol7aoY43Rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JnVEGTDH; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741189705; x=1772725705;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=cJo5gvJVJKTLFt4f8+S+t3ffg2rOlD50JLe6Y5f9wW8=;
  b=JnVEGTDHIeF/yFTQjguzBh0++SLIJc2qB1VnqszqboFR881jvmi3lOI/
   ImFCZ5imBzJEXmt5UeChR2U7WGR1WVN5D53kf8L4EAwVhpbSnsNRg10fm
   JFL8OpVOnzwTctXQkyufRYj6x1MD2fA15ViME7VxV2cBUTHvXTTo7PDv0
   smoIG5UVMXlXvfjLyT9zuM3nzqiOyQtDGMZguW7Gn3r+ADXWHuHNqH7Zk
   ay/PWcIdY3qOcFigcPnHtHJkbzWZzvEiOVawT65ddJPdGRLI74mGqDzwD
   SNw/94s6Y2BB9lg9gJ0isHizo5sFuLlj8KpaFjXBdFs4YZFojjAblJdUD
   w==;
X-CSE-ConnectionGUID: OuY1fiP2RFaO6NmkKeeLNQ==
X-CSE-MsgGUID: WgTuo8iSTruHPVw+zxsL2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="41869193"
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; 
   d="scan'208";a="41869193"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 07:48:25 -0800
X-CSE-ConnectionGUID: dvgk9wz3S4iCNhJzOIRswA==
X-CSE-MsgGUID: G8gSOIcYTQKeGjJ4IoW1RQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; 
   d="scan'208";a="118540685"
Received: from unknown (HELO [10.237.72.199]) ([10.237.72.199])
  by fmviesa006.fm.intel.com with ESMTP; 05 Mar 2025 07:48:20 -0800
Message-ID: <6af01c37-9111-41f4-9968-5bbf266aa51d@linux.intel.com>
Date: Wed, 5 Mar 2025 17:49:23 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PROBLEM] usb: xhci_bus_resume cause irq lost issue
To: liudingyuan <liudingyuan@huawei.com>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "greg@kroah.com" <greg@kroah.com>,
 "patchwork-bot@kernel.org" <patchwork-bot@kernel.org>,
 "mricon@kernel.org" <mricon@kernel.org>
Cc: "Fangjian (Jay)" <f.fangjian@huawei.com>,
 Kangfenglong <kangfenglong@huawei.com>, yangxingui <yangxingui@huawei.com>,
 "fengsheng (A)" <fengsheng5@huawei.com>,
 lingmingqiang <lingmingqiang@huawei.com>,
 liulongfang <liulongfang@huawei.com>,
 zhonghaoquan <zhonghaoquan@hisilicon.com>,
 "yanzhili (A)" <yanzhili7@huawei.com>, "huyihua (A)" <huyihua4@huawei.com>,
 "Zengtao (B)" <prime.zeng@hisilicon.com>,
 "shenjian (K)" <shenjian15@huawei.com>, liuyonglong
 <liuyonglong@huawei.com>, Jonathan Cameron <jonathan.cameron@huawei.com>
References: <ea84165273814a41ae7187a008c4144b@huawei.com>
 <b1a9e2d51b4d4ff7a304f77c5be8164e@huawei.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <b1a9e2d51b4d4ff7a304f77c5be8164e@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi

On 5.3.2025 12.07, liudingyuan wrote:
> 
> 
> Hi
> 
> I'm running into an issue where the enumeration of a USB2.0 device failed due to lost interrupts.
> 
> This issue appears to occur randomly and we can only reproduce it on xHCI controllers that provide both USB3.0 and USB2.0 root hubs. Additionally, it is necessary to ensure that the first-level device under this controller is a SB2.0 device.
> The above scenario can be referred to in the following figure.
>     ----------------------------------------------------------------------------
>    |         +---------------------------------+               |
>    |         |    xHCI Controller    |               |
>    |         +---------------------------------+               |
>    |                /       \                      |
>    |               /         \                     |
>    |              /           \                    |
>    |  +-------------------------+      +---------------------------+   |
>    |  | USB 3.0 Root Hub |      | USB 2.0 Root Hub  |   |
>    |  +------------------------+      +----------------------------+   |
>    --------------|-------------------------------------|-------------------------
>            |                       |
>            | [NO device]             | [Device A]
>            |                       |
>                               
>                                 
> 
> The USB topology displayed in the OS looks like this:
> /:  Bus 03.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/ , 480M
>      ID 1d6b:0002 Linux Foundation 2.0 root hub
>      |__ Port 1: Dev 2, If 0, Class=Hub, Driver=hub/4p, 480M
> 
> /:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/ , 5000M
>      ID 1d6b:0003 Linux Foundation 3.0 root hub

Odd that the USB3 roothub is registered before USB2 roothub,
I thought xhci driver always registers USB2 hcd first .

> 
> This issue only occurs when the system reboot or when we insmod the xhci driver or ingister the xhci controller.
> When the issue occurs, we can observe that the CPU receives fewer interrupts than what would normally be generated during the enumeration process, and there are error logs indicating command timeouts.
> 	[ 2040.039438]xhci_hcd 0000:8a:00.7: Command timeout, USBSTS: 0x00000018 EINT PCD
> 	[ 2040.039444] xhci_hcd 0000:8a:00.7: Command timeout
> 	[ 2040.039446] xhci_hcd 0000:8a:00.7: Abort command ring
> 	[ 2042.055435] xhci_hcd 0000:8a:00.7: No stop event for abort, ring start fail?
> 	[ 2042.055469] xhci_hcd 0000:8a:00.7: Timeout while waiting for setup device command
> 	[ 2042.064048] usb 15-1: hub failed to enable device, error -62
> 	[ 2054.343446] xhci_hcd 0000:8a:00.7: Unsuccessful disable slot 1 command, status 25
>   	[ 2066.631449] xhci_hcd 0000:8a:00.7: Error while assigning device slot ID: Command Aborted
> 	[ 2066.640633] xhci_hcd 0000:8a:00.7: Max number of devices this xHCI host supports is 64.
> 	[ 2066.649713] usb usb15-port1: couldn't allocate usb_device
> 
> After verification, we can confirm that the reason for the interrupt loss is that during the enumeration of U2 device,
> U3 port is in a suspend procedure and performs an operation to disable interrupts in this function:
> 
> 	drivers/usb/host/xhci-hub.c
> 		xhci_bus_resume()
> 			/* delay the irqs */
> 			temp = readl(&xhci->op_regs->command);
> 			temp &= ~CMD_EIE;
> 			writel(temp, &xhci->op_regs->command);
> 
> we can temporarily avoid this issue by modifying parameters.
> echo -1 > /sys/module/usbcore/parameters/autosuspend
> 
> I am wondering whether there is a chance of interrupt loss occurring, regardless of whether or not it belongs to the scenario mentioned above? As long as an interrupt from a controller is triggered at exactly the same time as the process of disabling the controller's interrupts?
> 
> I read the xHCI protocol version 1.2 and haven't found detailed descriptions for such special cases. So I was wondering what is the main reason for disabling interrupts in xHCI driver during the resume process?
> 

This is from a time before I started maintaining the xhci driver. I guess
it was done to allow bus suspended usb2 ports to resume fully to U0 before
xhci_bus_resume() returns.

Resuming a usb2 port from  U3 suspend to U0 is a two stage process.
In 'host initiated resume' the xhci driver will first transition the port from
'U3' to 'Resume' state, then wait in Resume state for 20ms, and finally move
it to U0 state.

I assume driver disabled xHC from triggering interrupts to prevent event handler
from messing with this usb2 port resume process.

spin_lock_irqsave(xhci->lock) would normally be used to prevent interrupt
handler from interfering, but keeping the spin lock over msleep(20) was not
possible.

The device initiated usb2 resume is much better, it utilizes the event handler,
hub thread, timestamps and completions. The same should be done here, but
implementation isn't trivial.

I don't however think there is a reason to turn off interrupts while resuming
the USB3 bus. It doesn't sleep so just keeping spin_lock_irqsave() should be
enough. This should be an easy fix. Something like this:
(untested, copy-pasted diff)


diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
index 9693464c0520..7cf7ee84fc96 100644
--- a/drivers/usb/host/xhci-hub.c
+++ b/drivers/usb/host/xhci-hub.c
@@ -1873,6 +1873,7 @@ int xhci_bus_resume(struct usb_hcd *hcd)
         u32 temp, portsc;
         struct xhci_hub *rhub;
         struct xhci_port **ports;
+       bool disabled_irq = false;
  
         rhub = xhci_get_rhub(hcd);
         ports = rhub->ports;
@@ -1888,17 +1889,19 @@ int xhci_bus_resume(struct usb_hcd *hcd)
                 return -ESHUTDOWN;
         }
  
-       /* delay the irqs */
-       temp = readl(&xhci->op_regs->command);
-       temp &= ~CMD_EIE;
-       writel(temp, &xhci->op_regs->command);
-
         /* bus specific resume for ports we suspended at bus_suspend */
-       if (hcd->speed >= HCD_USB3)
+       if (hcd->speed >= HCD_USB3) {
                 next_state = XDEV_U0;
-       else
+       } else {
                 next_state = XDEV_RESUME;
-
+               if (bus_state->bus_suspended) {
+                       /* delay the irqs if we need to resume usb2 ports */
+                       temp = readl(&xhci->op_regs->command);
+                       temp &= ~CMD_EIE;
+                       writel(temp, &xhci->op_regs->command);
+                       disabled_irq = true;
+               }
+       }
         port_index = max_ports;
         while (port_index--) {
                 portsc = readl(ports[port_index]->addr);
@@ -1967,10 +1970,12 @@ int xhci_bus_resume(struct usb_hcd *hcd)
  
         bus_state->next_statechange = jiffies + msecs_to_jiffies(5);
         /* re-enable irqs */
-       temp = readl(&xhci->op_regs->command);
-       temp |= CMD_EIE;
-       writel(temp, &xhci->op_regs->command);
-       temp = readl(&xhci->op_regs->command);
+       if (disabled_irq) {
+               temp = readl(&xhci->op_regs->command);
+               temp |= CMD_EIE;
+               writel(temp, &xhci->op_regs->command);
+               temp = readl(&xhci->op_regs->command);
+       }
  
         spin_unlock_irqrestore(&xhci->lock, flags);
         return 0;

Thanks
Mathias


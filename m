Return-Path: <linux-usb+bounces-1601-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB917C8C2F
	for <lists+linux-usb@lfdr.de>; Fri, 13 Oct 2023 19:18:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7ED2B1C20F2E
	for <lists+linux-usb@lfdr.de>; Fri, 13 Oct 2023 17:18:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7041721A19;
	Fri, 13 Oct 2023 17:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10781BDED
	for <linux-usb@vger.kernel.org>; Fri, 13 Oct 2023 17:17:55 +0000 (UTC)
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by lindbergh.monkeyblade.net (Postfix) with SMTP id 4DA44BF
	for <linux-usb@vger.kernel.org>; Fri, 13 Oct 2023 10:17:53 -0700 (PDT)
Received: (qmail 46995 invoked by uid 1000); 13 Oct 2023 13:17:52 -0400
Date: Fri, 13 Oct 2023 13:17:52 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: "Li, Meng" <Meng.Li@windriver.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>,
  USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: USB: add check to detect host controller hardware removal
Message-ID: <9a1074e2-c1ae-485b-b5e7-a34442c98c0b@rowland.harvard.edu>
References: <PH0PR11MB5191464B2F01511D2ADECB3BF1D2A@PH0PR11MB5191.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PH0PR11MB5191464B2F01511D2ADECB3BF1D2A@PH0PR11MB5191.namprd11.prod.outlook.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Messages like this should always be sent to the mailing list as well as 
to me.  And in this case, since it involves an RT kernel, it should be 
CC-ed to some of the people involved in developing the RT patches.

On Fri, Oct 13, 2023 at 04:25:43AM +0000, Li, Meng wrote:
> Hi Alan Stern,
> 
> Sorry for disrupting you very abruptly. I encounter a calltrace when trying to remove a PCIe-to-USB card device with below command. Only occurred in rt kernel.
> 
> # echo 1 > /sys/bus/pci/devices/0001:01:00.0/remove
> 
> Call trace:
> dump_backtrace.part.0+0xc8/0xd4
> show_stack+0x20/0x30
> dump_stack_lvl+0x6c/0x88
> dump_stack+0x18/0x34
> __might_resched+0x160/0x1c0
> rt_spin_lock+0x38/0xb0
> xhci_irq+0x44/0x16d0
> usb_hcd_irq+0x38/0x5c
> usb_hcd_pci_remove+0x84/0x14c
> xhci_pci_remove+0x78/0xc0
> pci_device_remove+0x44/0xcc
> device_remove+0x54/0x8c
> device_release_driver_internal+0x1ec/0x260
> device_release_driver+0x20/0x30
> pci_stop_bus_device+0x8c/0xcc
> pci_stop_and_remove_bus_device_locked+0x28/0x44
> remove_store+0xa0/0xb0
> dev_attr_store+0x20/0x34
> sysfs_kf_write+0x4c/0x5c
> kernfs_fop_write_iter+0x128/0x1f0
> vfs_write+0x1c0/0x2f0
> ksys_write+0x78/0x110
> __arm64_sys_write+0x24/0x30
> invoke_syscall+0x5c/0x130
> el0_svc_common.constprop.0+0x4c/0xf4
> do_el0_svc+0x34/0xc0
> el0_svc+0x2c/0x84
> el0t_64_sync_handler+0xf4/0x120
> el0t_64_sync+0x18c/0x190
> 
> this trace is caused by below patch that is used to fix a usb hang issue.
> 
> commit c548795abe0d3520b74e18f23ca0a0d72deddab9
> Author: Alan Stern stern@rowland.harvard.edu<mailto:stern@rowland.harvard.edu>
> Date:   Wed Jun 9 17:34:27 2010 -0400
> 
> USB: add check to detect host controller hardware removal
> 
> 
> I know it is too too long ago, but could you please try to recall how to reproduce the issue that you fixed, how can I produce the usb hang issue.

I think the issue could be reproduced just by hot-removing a USB host 
controller.  Maybe the controller was on a PCMCIA card; I don't 
remember.  And I don't remember what kind of USB host controller it was.  

You might be able to find the original bug report in the linux-usb or 
linux-usb-devel mailing list archives for 2010.

> I want to try whether I can get another method to fix the USB hang issue without disable irq, so that avoid the calltrace.

For new people, the contents of that commit are:

    This patch (as1391) fixes a problem that can occur when USB host
    controller hardware is hot-unplugged.  If no interrupts are generated
    by the unplug then the HCD may not realize that the controller is
    gone, and the subsequent unbind may hang waiting for interrupts that
    never arrive.
    
    The solution (for PCI-based controllers) is to call the HCD's
    interrupt handler at the start of usb_hcd_pci_remove().  If the
    hardware is gone, the handler will realize this when it tries to read
    the controller's status register.
    
    Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
    Signed-off-by: Greg Kroah-Hartman <gregkh@suse.de>

diff --git a/drivers/usb/core/hcd-pci.c b/drivers/usb/core/hcd-pci.c
index 1cf2d1e79a5c..7e2d5271b0c9 100644
--- a/drivers/usb/core/hcd-pci.c
+++ b/drivers/usb/core/hcd-pci.c
@@ -292,6 +292,14 @@ void usb_hcd_pci_remove(struct pci_dev *dev)
        if (!hcd)
                return;
 
+       /* Fake an interrupt request in order to give the driver a chance
+        * to test whether the controller hardware has been removed (e.g.,
+        * cardbus physical eject).
+        */
+       local_irq_disable();
+       usb_hcd_irq(0, hcd);
+       local_irq_enable();
+
        usb_remove_hcd(hcd);
        if (hcd->driver->flags & HCD_MEMORY) {
                iounmap(hcd->regs);

The local_irq_disable() is there so that the irq handler will be invoked 
in the state that it expects (i.e., with interrupts disabled).  
Apparently Meng's RT kernel doesn't like it when the handler then 
calls spin_lock(); I don't know why.

Alan Stern


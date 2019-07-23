Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 89E7E71B8A
	for <lists+linux-usb@lfdr.de>; Tue, 23 Jul 2019 17:25:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729840AbfGWPZF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 23 Jul 2019 11:25:05 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:56248 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726283AbfGWPZF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 23 Jul 2019 11:25:05 -0400
Received: (qmail 4110 invoked by uid 2102); 23 Jul 2019 11:25:04 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 23 Jul 2019 11:25:04 -0400
Date:   Tue, 23 Jul 2019 11:25:04 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Frank Bergmann <frank.bergmann@project-open.com>,
        Mathias Nyman <mathias.nyman@intel.com>
cc:     Greg KH <gregkh@linuxfoundation.org>,
        USB list <linux-usb@vger.kernel.org>
Subject: Re: High-Impact: xhci_hid - "Not enough bandwidth for new device
 state"
In-Reply-To: <85fa403c-4e46-c0eb-d594-6d859f9cb5af@project-open.com>
Message-ID: <Pine.LNX.4.44L0.1907231106220.1521-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 23 Jul 2019, Frank Bergmann wrote:

> Hi!
> 
> 
> I just want to make the case that this is quite an important issue. I 
> was very surprised to hear from the CIO of one of our customers that 
> they had the same issue. This kept them from offering Ubuntu and an 
> option for their Dell laptops. Like myself, these guys need to run 
> GoToMeeting/WebEx together with a Windows VM for business.
> 
> 
> I understand this is probably a difficult bug and that it is difficult 
> to reproduce. However, this combination of WebCam + VM is required by 
> everybody except for a very few privileged "Linux only" developers.
> 
> 
> 
>  > It all depends on what that devices are asking for
> 
> 
> The Logitech C922 has a H.264 compression on the chip. The "bandwidth 
> calculator" (https://www.google.es/search?q=H.264+bandwidth) says it 
> needs 1024kBps for 1080p @ 30fps.
> 
> Not sure if this is true, and I'm not sure what the devices actually 
> does, though...
> 
> 
>  > Linux solved
> 
> 
> Ok, so you have a clear idea what part of the driver causes the error, 
> that's a step forward.

The situation is not as simple as you think.

You're probably not aware of this, but with xHCI USB-3 controllers,
bandwidth decisions are made by the hardware/firmware, not by the
software.  In particular, these decisions are not made by the kernel
driver; they are made by the xHCI controller itself.

Therefore changes to the kernel driver most likely cannot fix the
problem.  You would need to augment or replace your computer's xHCI
USB-3 controller hardware.

> But I can't imagine it's "real" bandwidth. USB 3.1 can handle two 
> full-HD screens plus a Gigabit Ethernet on the same 5GBit lanes... A few 
> megabit for compressed vido plus a few _kilo_ bits/s for audio...
> 
> => Is there a way to debug these bandwidth requests for me? Maybe you 
> want to include bandwidth requests in the kernel logs in the future if 
> these issues are so wide spread?

Here are some things you can do to provide more detailed debugging 
information.  Unplug the webcam's USB cable, and then (as root) do:

dmesg -C
mount -t debugfs none /sys/kernel/debug
echo 'module xhci_hcd =p' >/sys/kernel/debug/dynamic_debug/control
echo 'module usbcore =p' >/sys/kernel/debug/dynamic_debug/control
echo 81920 > /sys/kernel/debug/tracing/buffer_size_kb
echo 1 > /sys/kernel/debug/tracing/events/xhci-hcd/enable

Plug in and try (and fail!) to use the webcam.

Send output of dmesg
Send contents of /sys/kernel/debug/usb/devices
Send contents of /sys/kernel/debug/tracing/trace

I won't be able to interpret all the results for you, but Mathias (the 
xhci-hcd maintainer) should be able to.

However, you ought to realize in advance that the results are likely to 
show only that the hardware refused to allocate the necessary bandwidth 
and did not provide any explanation for its refusal.

> => Maybe you can recommend me a WebCam with tripod option that is known 
> to work well with Linux?

The issue may depend more on the type of xHCI controller than on the 
type of webcam.

Alan Stern

> => From what I understand I should now test with VirtualBox and KVM/QEMU 
> and check if the same issue appears. I will do this and let you know 
> about the results.
> 
> 
>  > configuration of your devices and root hubs
> 
> 
> I've got a brand new Dell XPX 15 9370 Laptop. No other USB hubs, 
> devices, no change to any configuration. I chose the model because it is 
> supposed to be the same that Linus Torvalds uses (well, XPS 13...)
> 
> 
> 
> I can offer OpenVPN access to my laptop for reproducing the issues. I 
> also offer to buy a Logitech C922 WebCam if somebody wants to get 
> seriously down to this issue.
> 
> 
> Best Regards,
> Frank
> 
> ---
> Frank Bergmann
> Dipl.-Ing., MBA
> Founder ]project-open[
> Tel: +34 932 202 088 (Spain)
> Cell: +34 609 953 751
> Fax: +34 932 890 729
> 
> mailto:frank.bergmann@project-open.com
> http://www.project-open.com
> http://www.twitter.com/projop
> http://www.facebook.com/projectopen.org
> http://www.linkedin.com/in/fraber
> http://www.xing.com/profile/Frank_Bergmann23




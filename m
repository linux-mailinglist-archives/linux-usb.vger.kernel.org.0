Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 119FF4469CE
	for <lists+linux-usb@lfdr.de>; Fri,  5 Nov 2021 21:39:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233473AbhKEUmP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 5 Nov 2021 16:42:15 -0400
Received: from mga04.intel.com ([192.55.52.120]:47810 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233440AbhKEUmO (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 5 Nov 2021 16:42:14 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10159"; a="230702230"
X-IronPort-AV: E=Sophos;i="5.87,212,1631602800"; 
   d="scan'208";a="230702230"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2021 13:39:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,212,1631602800"; 
   d="scan'208";a="639921566"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by fmsmga001.fm.intel.com with ESMTP; 05 Nov 2021 13:39:30 -0700
To:     Mark Hills <mark@xwax.org>, linux-usb@vger.kernel.org
References: <2111051005210.3125@stax.localdomain>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: XHCI unplug of USB-C device is not detected
Message-ID: <2a5d79d8-e12e-4e72-38f7-ab743b3a1efd@linux.intel.com>
Date:   Fri, 5 Nov 2021 22:40:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <2111051005210.3125@stax.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi

On 5.11.2021 12.58, Mark Hills wrote:
> My only USB-C device is a Logitech StreamCam, which seems to cause some 
> kind of lock on resources when unplugged.
> 
> The symptom is it works when first plugged in to a PC. But after 
> unplugging it can't be made to work again.
> 
> I don't have prior experience of these components. I enabled debug 
> messages:
> 
>   echo -n "module xhci_hcd =p" > /sys/kernel/debug/dynamic_debug/control
> 
> Plugging in the webcam produces the dmesg below.
> 
> But unplugging simply results in no activity -- zero output in dmesg. Same 
> when plugging in again.
> 
> After unplugging the device is still listed:
> 
>   $ lsusb
>   Bus 004 Device 002: ID 046d:0893  Logitech StreamCam
>   Bus 004 Device 001: ID 1d6b:0003 Linux 5.14.2-mh xhci-hcd xHCI Host Controller
>   Bus 003 Device 001: ID 1d6b:0002 Linux 5.14.2-mh xhci-hcd xHCI Host Controller
>   Bus 002 Device 001: ID 1d6b:0003 Linux 5.14.2-mh xhci-hcd xHCI Host Controller
>   Bus 001 Device 007: ID 046d:c52f Logitech USB Receiver
>   Bus 001 Device 006: ID 056a:037b Wacom Co.,Ltd. CTL-672
>   Bus 001 Device 005: ID 1a40:0101  USB 2.0 Hub
>   Bus 001 Device 004: ID 04d9:0340  USB-HID Keyboard
>   Bus 001 Device 003: ID 04d9:0339  USB-HID Keyboard
>   Bus 001 Device 002: ID 1a40:0101  USB 2.0 Hub
>   Bus 001 Device 001: ID 1d6b:0002 Linux 5.14.2-mh xhci-hcd xHCI Host Controller

how about "lsusb -v"?
It should try to read something from the device.

> 
> and the associated uvcvideo module is free and can be removed with rmmod:
> 
>   $ lsmod | grep uvcvideo
>   uvcvideo              110592  0
>   videobuf2_vmalloc      20480  1 uvcvideo
>   videobuf2_v4l2         28672  1 uvcvideo
>   videobuf2_common       45056  4 videobuf2_vmalloc,videobuf2_v4l2,uvcvideo,videobuf2_memops
>   videodev              200704  3 videobuf2_v4l2,uvcvideo,videobuf2_common
>   mc                     53248  5 videodev,snd_usb_audio,videobuf2_v4l2,uvcvideo,videobuf2_common
> 
> The USB subsystem isn't entirely locked up. A USB keyboard on a different 
> type A port is picked up as expected.
> 
> I have access to a Thinkpad X230 laptop (Alpine Linux; kernel 
> 5.10.61-0-lts), and everything works as expected.
> 
> So it seems to be specific to the PC hardware (Gigabyte H170-D3HP 
> motherboard -- a single USB-C port and several regular ones). Or perhaps 
> even the kernel config.
> 
> What debugging can I do next?

Normally xHC generates an interrupt at connect change, and the interrupt
handler reads the port status, and prints a debugging message.

We could manually read all the port registers before and after disconnecting.
Check link state, and that the wake flags look ok in case device is suspended

Example:
# cat /sys/kernel/debug/usb/xhci/0000\:00\:14.0/ports/port*/portsc
Powered Not-connected Disabled Link:RxDetect PortSpeed:0 Change: Wake: 
Powered Not-connected Disabled Link:RxDetect PortSpeed:0 Change: Wake: 
Powered Not-connected Disabled Link:RxDetect PortSpeed:0 Change: Wake: 
Powered Connected Enabled Link:U0 PortSpeed:3 Change: Wake: 
Powered Not-connected Disabled Link:RxDetect PortSpeed:0 Change: Wake: 
...

Also see if disabling runtime suspend for both roothubs helps:
# echo on > /sys/bus/usb/devices/usb1/power/control
# echo on > /sys/bus/usb/devices/usb2/power/control

(if you have more roothubs than usb1 and usb2 do echo "on" to those as well

Thanks
-Mathias




> 
> Thanks
> 


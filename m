Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05860446DE7
	for <lists+linux-usb@lfdr.de>; Sat,  6 Nov 2021 13:23:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232084AbhKFMZp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 6 Nov 2021 08:25:45 -0400
Received: from jazz.pogo.org.uk ([213.138.114.167]:35206 "EHLO
        jazz.pogo.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229669AbhKFMZo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 6 Nov 2021 08:25:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pogo.org.uk
        ; s=swing; h=Content-Type:MIME-Version:References:Message-ID:In-Reply-To:
        Subject:cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=EsEgegeOAqIx++OwB4UWd2FPtNwRrM0SAyssZlq88hU=; b=iMBp5MYqUg45HfwYIbrI6cLZbr
        AWJumfSF8xtkAZaADKCn9x/a1dZ+X1Z+yTXr55lJWx9L3zvXHLwgq/78d4JNWjeHy31DscosdAJvs
        YxkTJsUF4VZfKp5oGt9OCNBP5lbLq6e/oaQm91zyFjMwKD20aR93i4AVBW+R1GXy3P74=;
Received: from [2001:470:1d21:0:428d:5cff:fe1b:f3e5] (helo=stax)
        by jazz.pogo.org.uk with esmtps  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.94.2 (FreeBSD))
        (envelope-from <mark@xwax.org>)
        id 1mjKir-000GXG-BL; Sat, 06 Nov 2021 12:23:01 +0000
Received: from localhost (stax.localdomain [local])
        by stax.localdomain (OpenSMTPD) with ESMTPA id f319fde0;
        Sat, 6 Nov 2021 12:23:00 +0000 (UTC)
Date:   Sat, 6 Nov 2021 12:23:00 +0000 (GMT)
From:   Mark Hills <mark@xwax.org>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
cc:     linux-usb@vger.kernel.org
Subject: Re: XHCI unplug of USB-C device is not detected
In-Reply-To: <2a5d79d8-e12e-4e72-38f7-ab743b3a1efd@linux.intel.com>
Message-ID: <2111061157310.2377@stax.localdomain>
References: <2111051005210.3125@stax.localdomain> <2a5d79d8-e12e-4e72-38f7-ab743b3a1efd@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 5 Nov 2021, Mathias Nyman wrote:

> Hi

Hi, thanks for your help.

[...] 
> > Plugging in the webcam produces the dmesg below.
> > 
> > But unplugging simply results in no activity -- zero output in dmesg. Same 
> > when plugging in again.
> > 
> > After unplugging the device is still listed:
> > 
> >   $ lsusb
> >   Bus 004 Device 002: ID 046d:0893  Logitech StreamCam
> >   Bus 004 Device 001: ID 1d6b:0003 Linux 5.14.2-mh xhci-hcd xHCI Host Controller
> >   Bus 003 Device 001: ID 1d6b:0002 Linux 5.14.2-mh xhci-hcd xHCI Host Controller
> >   Bus 002 Device 001: ID 1d6b:0003 Linux 5.14.2-mh xhci-hcd xHCI Host Controller
> >   Bus 001 Device 007: ID 046d:c52f Logitech USB Receiver
> >   Bus 001 Device 006: ID 056a:037b Wacom Co.,Ltd. CTL-672
> >   Bus 001 Device 005: ID 1a40:0101  USB 2.0 Hub
> >   Bus 001 Device 004: ID 04d9:0340  USB-HID Keyboard
> >   Bus 001 Device 003: ID 04d9:0339  USB-HID Keyboard
> >   Bus 001 Device 002: ID 1a40:0101  USB 2.0 Hub
> >   Bus 001 Device 001: ID 1d6b:0002 Linux 5.14.2-mh xhci-hcd xHCI Host Controller
> 
> how about "lsusb -v"?
> It should try to read something from the device.

It seems to be populated with information from the webcam:

  # lsusb -v
  Couldn't open device, some information will be missing

  Bus 004 Device 002: ID 046d:0893  Logitech StreamCam
  Device Descriptor:
    bLength                18
    bDescriptorType         1
    bcdUSB               3.20
    bDeviceClass          239
  [...]

but then on a second run, the webcam is removed from lsusb output.
Plugging it in again still has no effect.

[...]
> Normally xHC generates an interrupt at connect change, and the interrupt
> handler reads the port status, and prints a debugging message.
> 
> We could manually read all the port registers before and after disconnecting.
> Check link state, and that the wake flags look ok in case device is suspended
> 
> Example:
> # cat /sys/kernel/debug/usb/xhci/0000\:00\:14.0/ports/port*/portsc
> Powered Not-connected Disabled Link:RxDetect PortSpeed:0 Change: Wake: 
> Powered Not-connected Disabled Link:RxDetect PortSpeed:0 Change: Wake: 
> Powered Not-connected Disabled Link:RxDetect PortSpeed:0 Change: Wake: 
> Powered Connected Enabled Link:U0 PortSpeed:3 Change: Wake: 
> Powered Not-connected Disabled Link:RxDetect PortSpeed:0 Change: Wake: 
> ...

There's no difference in the output before or after disconnecting the 
camera:

  stax# cat /sys/kernel/debug/usb/xhci/*/ports/port*/portsc
  Powered Not-connected Disabled Link:RxDetect PortSpeed:0 Change: Wake:
  Powered Not-connected Disabled Link:RxDetect PortSpeed:0 Change: Wake:
  Powered Not-connected Disabled Link:RxDetect PortSpeed:0 Change: Wake:
  Powered Not-connected Disabled Link:RxDetect PortSpeed:0 Change: Wake:
  Powered Not-connected Disabled Link:RxDetect PortSpeed:0 Change: Wake:
  Powered Connected Enabled Link:U0 PortSpeed:3 Change: Wake:
  Powered Not-connected Disabled Link:RxDetect PortSpeed:0 Change: Wake:
  Powered Not-connected Disabled Link:RxDetect PortSpeed:0 Change: Wake:
  Powered Not-connected Disabled Link:RxDetect PortSpeed:0 Change: Wake:
  Powered Not-connected Disabled Link:RxDetect PortSpeed:0 Change: Wake:
  Powered Not-connected Disabled Link:RxDetect PortSpeed:0 Change: Wake:
  Powered Not-connected Disabled Link:RxDetect PortSpeed:0 Change: Wake:
  Powered Not-connected Disabled Link:RxDetect PortSpeed:0 Change: Wake:
  Powered Not-connected Disabled Link:RxDetect PortSpeed:0 Change: Wake:
  Powered Not-connected Disabled Link:RxDetect PortSpeed:0 Change: Wake:
  Powered Not-connected Disabled Link:RxDetect PortSpeed:0 Change: Wake:
  Powered Not-connected Disabled Link:RxDetect PortSpeed:0 Change: Wake: WCE WOE
  Powered Not-connected Disabled Link:RxDetect PortSpeed:0 Change: Wake: WCE WOE
  Powered Not-connected Disabled Link:RxDetect PortSpeed:0 Change: Wake: WCE WOE
  Powered Not-connected Disabled Link:RxDetect PortSpeed:0 Change: Wake: WCE WOE
  Powered Not-connected Disabled Link:RxDetect PortSpeed:0 Change: Wake: WCE WOE
  Powered Not-connected Disabled Link:RxDetect PortSpeed:0 Change: Wake: WCE WOE
  Powered Not-connected Disabled Link:RxDetect PortSpeed:0 Change: Wake: WCE WOE
  Powered Not-connected Disabled Link:RxDetect PortSpeed:0 Change: Wake: WCE WOE
  Powered Connected Enabled Link:Resume PortSpeed:15 OverCurrent In-Reset Change: CSC PEC WRC OCC PRC PLC CEC CAS Wake: WCE WDE WOE
  Powered Connected Enabled Link:Resume PortSpeed:15 OverCurrent In-Reset Change: CSC PEC WRC OCC PRC PLC CEC CAS Wake: WCE WDE WOE
  Powered Connected Enabled Link:Resume PortSpeed:15 OverCurrent In-Reset Change: CSC PEC WRC OCC PRC PLC CEC CAS Wake: WCE WDE WOE
  Powered Connected Enabled Link:Resume PortSpeed:15 OverCurrent In-Reset Change: CSC PEC WRC OCC PRC PLC CEC CAS Wake: WCE WDE WOE

> Also see if disabling runtime suspend for both roothubs helps:
> # echo on > /sys/bus/usb/devices/usb1/power/control
> # echo on > /sys/bus/usb/devices/usb2/power/control

Yes, it helps. I pinpointed it on usb3. The webcam can now be plugged and 
re-plugged. It also survives a suspend/resume of the machine now and I can 
see the change in portsc:

  -Powered Connected Enabled Link:U3 PortSpeed:4 Change: Wake:
  +Powered Not-connected Disabled Link:RxDetect PortSpeed:0 Change: Wake:

So it seems this is a workaround -- thank you.

Is it worth getting to the root of this problem (and can I capture any 
data to help?) or is it just that some devices are buggy?

Many thanks,

-- 
Mark

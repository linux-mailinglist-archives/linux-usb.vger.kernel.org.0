Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 529FBBC3A8
	for <lists+linux-usb@lfdr.de>; Tue, 24 Sep 2019 10:01:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438875AbfIXIBb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 24 Sep 2019 04:01:31 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:35800 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2438866AbfIXIBb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 24 Sep 2019 04:01:31 -0400
Received: by mail-wm1-f66.google.com with SMTP id y21so932363wmi.0
        for <linux-usb@vger.kernel.org>; Tue, 24 Sep 2019 01:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=12Pi+Iy7ZTwcUVl30XVV3Ts15fohiZlZCMVswl0pxh0=;
        b=qiDDmS6u5UUblczfGMoWuqdya49wyYFWqFC9nZEHyaAF12UPX0anPy8ywAp66hdR4L
         RZwC4f/4FulFnW4NeTOoJBAV7SVsfZ8MQ2/l5NDtdE+/x2HLpaFR/B4k2S1F2UR7SBoV
         bsfPQXSCekb4PoHiJssBB/LgX07XgLS/jxjra8nZzchAxFg9vrf9n9EVGGZydedMvGAO
         Z1BYZPsN+yrIY/sB/1yYP97062HH+HcY6bzVV2oSCcZFZN6pJsIDQLhdl0bk3tdgCZdk
         Eup51au0bUbgoES8rESwyl4pIuvuiayaD9thKL/81tzwwh8aTeSiHKHYBe+j+XHMvXkT
         wy5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=12Pi+Iy7ZTwcUVl30XVV3Ts15fohiZlZCMVswl0pxh0=;
        b=jZrir4gZMfSHHisWN2lzhlUbOk3XkFia1f1P1WyudWQrky89NB/xWwWJrfIrbNSR7C
         A5tw4McJTAWBb9fOI2TaAN0cJpSNiWPcYUeo89ZHsA1aIrAqjHnXPJJv7BTuKWPUbSoM
         6Txq8kqGK1suRHksDnb4x7gwi3QC+8K9/3FZwkAWlg0Uw9Rs2mv+chuizlZ07L21C1e5
         r7X8LV5la0Xg8MKJpxqWBgMLLqOZ5uKUpHjcJloj8IOYK6bBUXcq1k6eRQReGrpacg9h
         ZDNXsR+QVARWitUDPNwZbGGcfltFuDN5S4uVyZtUbyc0A5Sx02yLq/sh4SnQYX5REbDy
         Mmpw==
X-Gm-Message-State: APjAAAVGgXgAKOOJF3u6Q7a5E5nsFWpd5SSGAtLFVL+0avt1mwI7atEu
        ZGOYqImg45FpD99RL7HAr7nqrSqj
X-Google-Smtp-Source: APXvYqzwOGtzyO6WXO+0u3tY6DIWBQNzHn8xePt/AAA6Lnu+4NdlVV3IZlVBtU85Z2SflSisbWpkOA==
X-Received: by 2002:a1c:c915:: with SMTP id f21mr1529941wmb.65.1569312087033;
        Tue, 24 Sep 2019 01:01:27 -0700 (PDT)
Received: from dhe-pc ([84.148.28.164])
        by smtp.gmail.com with ESMTPSA id h17sm2135031wme.6.2019.09.24.01.01.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2019 01:01:25 -0700 (PDT)
From:   David Heinzelmann <heinzelmann.david@gmail.com>
X-Google-Original-From: David Heinzelmann <dhe@dhe-pc>
Date:   Tue, 24 Sep 2019 12:01:19 +0200
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     David Heinzelmann <heinzelmann.david@gmail.com>,
        Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH] Check for changed device descriptors when a
 connection-change occurs before validating the connection.
Message-ID: <20190924100119.GA7353@dhe-pc>
References: <20190920153357.GB5913@dhe-pc>
 <Pine.LNX.4.44L0.1909231046380.24712-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44L0.1909231046380.24712-100000@netrider.rowland.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Sep 23, 2019 at 10:49:59AM -0400, Alan Stern wrote:
> On Fri, 20 Sep 2019, David Heinzelmann wrote:
> 
> > On Fri, Sep 20, 2019 at 02:15:38PM +0200, Greg KH wrote:
> > > On Fri, Sep 20, 2019 at 03:17:26PM +0200, David Heinzelmann wrote:
> > > > Hi,
> > > > 
> > > > sorry for the wrong patch format.
> > > 
> > > No problem, that's normal.  But please do not top-post on linux mailing
> > > lists.
> > > 
> > > > I am trying to detect a change. At the moment I think the change could be ignored if a
> > > > port connection-change occurs and the port status has again the 'PORT_CONNECTION' bit set. 
> > > > 
> > > > I have a fx3 device which does a re-enumeration after a firmware download. This is working
> > > > as expected and I am seeing a 'remove event' and a 'add event' monitoring via udevadm. But
> > > > if I connect multiple devices at the same time via an usb hub I am sometimes not receiving
> > > > a 'remove event' and 'add event' for a single device.
> > > 
> > > Sounds like a broken hub :)
> > > 
> > 
> > I tried different hubs but I forgot to mention that it is also possible to trigger the issue
> > without a hub if I reboot the devices via software at the same time. 
> > 
> > > > I think the problem could be that when a device disconnects and the port connection-change
> > > > occurs and before the 'PORT_CONNECTION' bit is checked the device could already be
> > > > reconnected and the 'PORT_CONNECTION' bit is set. Therefore I think it is not correct to
> > > > resuscitate the exisiting device.
> > > 
> > > Does your patch actually fix the issue?  When a fx3 device downloads
> > > firmware and re-enumerates, it should come back as a totally different
> > > device, which will fail this check, right?  So I don't see how this
> > > fixes the issues with your devices.
> > > 
> > 
> > With the patch I do not have the issue anymore. After re-enumerate the device comes back with the same
> > VID/PID but with a different device descriptor. Therefore the check will fail and hub_port_connect is
> > called which initiates a device disconnect and connect. Without this 'reconnect' lsusb still shows me 
> > the old device descriptor and I am not able to communicate with the device. 
> > 
> > > Unless all of the devices reset themselves at the same time and the hub
> > > doesn't like that and can't notice that it happened?
> > > 
> > > If you use a different hub, does that work properly?
> > > 
> > 
> > There is no difference if an other hub is used. It also happens without a hub when the devices are
> > rebooted via software. My thoughts on this is that when the device re-enumerates and the device
> > descriptor has changed a device disconnect and connect should be initiated instead of doing nothing?
> > 
> > If I understand it correctly the resuscitation is used for handling port enable-changes occured by EMI.
> > But when the device is doing a re-enumeration there should be no resuscitation.
> 
> I really don't understand this.
> 
> Your patch involves the case where there was a connect-change event but 
> the port is still enabled.  Now maybe I've forgotten about one of the 
> pathways, but it seems like that combination should never occur.
> 
> Certainly it shouldn't occur in your case.  The device disconnects and 
> then reconnects with a new set of descriptors.  The disconnect should 
> cause the port to be disabled, and the port should remain disabled 
> after the reconnect occurs.  So how can your new code run in the first 
> place?
> 
> Alan Stern
> 

Hi,

I have a log with two devices which are connected to a hub and the hub is plugged in. 

The device which is not working in this log:

Sep 24 08:32:21 kernel: usb 2-6-port1: status 0203 change 0011
Sep 24 08:32:21 kernel: usb 2-6.1: new SuperSpeed Gen 1 USB device number 65 using xhci_hcd
Sep 24 08:32:21 kernel: usb 2-6.1: udev 65, busnum 2, minor = 192
Sep 24 08:32:21 kernel: usb 2-6.1: New USB device found, idVendor=1409, idProduct=3240, bcdDevice= 0.00
Sep 24 08:32:21 kernel: usb 2-6.1: New USB device strings: Mfr=1, Product=2, SerialNumber=0
Sep 24 08:32:21 kernel: usb 2-6.1: Product: USB 3.0 Camera
Sep 24 08:32:21 kernel: usb 2-6.1: Manufacturer: Camera Manufacturer

Now the firmware download happens and the device is re-enumerating and a disconnect/connect should occur.
But the only change which is seen is the following output:

Sep 24 08:32:23 kernel: usb 2-6-port1: link state change
Sep 24 08:32:23 kernel: usb 2-6-port1: status 0203, change 0041, 5.0 Gb/s

Now the resuscitation is happening but from my understanding this is not correct as in the reality there was a
reconnect from the device. So I tried to initiate a device reconnect if the device descriptor changed.

It also seems to me that the enumeration from the second device (usb 2-6-port1) is blocking 
the port change event and so the actual disconnect is missed.

Here is the complete log:

Sep 24 08:32:20 kernel: hub 1-0:1.0: state 7 ports 16 chg 0000 evt 0008
Sep 24 08:32:20 kernel: usb usb1-port3: status 0101, change 0001, 12 Mb/s
Sep 24 08:32:20 kernel: usb usb2: usb wakeup-resume
Sep 24 08:32:20 kernel: hub 2-0:1.0: hub_resume
Sep 24 08:32:20 kernel: usb usb2-port6: status 0203 change 0001
Sep 24 08:32:20 kernel: usb usb1-port3: debounce total 100ms stable 100ms status 0x101
Sep 24 08:32:20 kernel: hub 2-0:1.0: state 7 ports 10 chg 0040 evt 0000
Sep 24 08:32:20 kernel: usb usb2-port6: status 0203, change 0000, 5.0 Gb/s
Sep 24 08:32:20 kernel: usb 1-3: new high-speed USB device number 17 using xhci_hcd
Sep 24 08:32:20 kernel: usb 1-3: udev 17, busnum 1, minor = 16
Sep 24 08:32:20 kernel: usb 1-3: New USB device found, idVendor=2109, idProduct=2811, bcdDevice=91.00
Sep 24 08:32:20 kernel: usb 1-3: New USB device strings: Mfr=1, Product=2, SerialNumber=0
Sep 24 08:32:20 kernel: usb 1-3: Product: USB2.0 Hub             
Sep 24 08:32:21 kernel: usb 1-3: Manufacturer: VIA Labs, Inc.         
Sep 24 08:32:21 kernel: hub 1-3:1.0: USB hub found
Sep 24 08:32:21 kernel: hub 1-3:1.0: 4 ports detected
Sep 24 08:32:21 kernel: hub 1-3:1.0: standalone hub
Sep 24 08:32:21 kernel: hub 1-3:1.0: individual port power switching
Sep 24 08:32:21 kernel: hub 1-3:1.0: individual port over-current protection
Sep 24 08:32:21 kernel: hub 1-3:1.0: Single TT
Sep 24 08:32:21 kernel: hub 1-3:1.0: TT requires at most 32 FS bit times (2664 ns)
Sep 24 08:32:21 kernel: hub 1-3:1.0: Port indicators are supported
Sep 24 08:32:21 kernel: hub 1-3:1.0: power on to power good time: 100ms
Sep 24 08:32:21 kernel: hub 1-3:1.0: local power source is good
Sep 24 08:32:21 kernel: hub 1-3:1.0: enabling power on all ports
Sep 24 08:32:21 kernel: hub 1-0:1.0: state 7 ports 16 chg 0000 evt 0008
Sep 24 08:32:21 kernel: usb usb1-port3: resume, status 0
Sep 24 08:32:21 kernel: hub 1-3:1.0: state 7 ports 4 chg 0000 evt 0000
Sep 24 08:32:21 kernel: hub 1-3:1.0: hub_suspend
Sep 24 08:32:21 kernel: usb 2-6: new SuperSpeed Gen 1 USB device number 64 using xhci_hcd
Sep 24 08:32:21 kernel: usb 1-3: usb auto-suspend, wakeup 1
Sep 24 08:32:21 kernel: usb 2-6: udev 64, busnum 2, minor = 191
Sep 24 08:32:21 kernel: usb 2-6: New USB device found, idVendor=2109, idProduct=8110, bcdDevice=91.05
Sep 24 08:32:21 kernel: usb 2-6: New USB device strings: Mfr=1, Product=2, SerialNumber=0
Sep 24 08:32:21 kernel: usb 2-6: Product: USB3.0 Hub             
Sep 24 08:32:21 kernel: usb 2-6: Manufacturer: VIA Labs, Inc.         
Sep 24 08:32:21 kernel: hub 2-6:1.0: USB hub found
Sep 24 08:32:21 kernel: hub 2-6:1.0: 4 ports detected
Sep 24 08:32:21 kernel: hub 2-6:1.0: standalone hub
Sep 24 08:32:21 kernel: hub 2-6:1.0: individual port power switching
Sep 24 08:32:21 kernel: hub 2-6:1.0: individual port over-current protection
Sep 24 08:32:21 kernel: hub 2-6:1.0: TT requires at most 8 FS bit times (666 ns)
Sep 24 08:32:21 kernel: hub 2-6:1.0: power on to power good time: 200ms
Sep 24 08:32:21 kernel: hub 2-6:1.0: local power source is good
Sep 24 08:32:21 kernel: hub 2-6:1.0: enabling power on all ports
Sep 24 08:32:21 kernel: usb 2-6-port1: status 0203 change 0011
Sep 24 08:32:21 kernel: usb 2-6-port2: status 0203 change 0011
Sep 24 08:32:21 kernel: hub 2-6:1.0: state 7 ports 4 chg 0006 evt 0000
Sep 24 08:32:21 kernel: usb 2-6-port1: status 0203, change 0000, 5.0 Gb/s
Sep 24 08:32:21 kernel: usb 2-6.1: new SuperSpeed Gen 1 USB device number 65 using xhci_hcd
Sep 24 08:32:21 kernel: usb 2-6.1: udev 65, busnum 2, minor = 192
Sep 24 08:32:21 kernel: usb 2-6.1: New USB device found, idVendor=1409, idProduct=3240, bcdDevice= 0.00
Sep 24 08:32:21 kernel: usb 2-6.1: New USB device strings: Mfr=1, Product=2, SerialNumber=0
Sep 24 08:32:21 kernel: usb 2-6.1: Product: USB 3.0 Camera
Sep 24 08:32:21 kernel: usb 2-6.1: Manufacturer: Camera Manufacturer
Sep 24 08:32:21 kernel: usb 2-6-port2: status 0203, change 0000, 5.0 Gb/s
Sep 24 08:32:21 kernel: usb 2-6.2: new SuperSpeed Gen 1 USB device number 66 using xhci_hcd
Sep 24 08:32:21 kernel: usb 2-6.2: udev 66, busnum 2, minor = 193
Sep 24 08:32:21 kernel: usb 2-6.2: New USB device found, idVendor=1409, idProduct=3590, bcdDevice= 0.00
Sep 24 08:32:21 kernel: usb 2-6.2: New USB device strings: Mfr=1, Product=2, SerialNumber=0
Sep 24 08:32:21 kernel: usb 2-6.2: Product: USB 3.0 Camera
Sep 24 08:32:21 kernel: usb 2-6.2: Manufacturer: Camera Manufacturer
Sep 24 08:32:21 kernel: hub 2-6:1.0: state 7 ports 4 chg 0000 evt 0002
Sep 24 08:32:23 kernel: hub 2-6:1.0: state 7 ports 4 chg 0000 evt 0004
Sep 24 08:32:23 kernel: usb 2-6-port2: link state change
Sep 24 08:32:23 kernel: usb 2-6-port2: do warm reset
Sep 24 08:32:23 kernel: usb 2-6.2: Disable of device-initiated U1 failed.
Sep 24 08:32:23 kernel: usb 2-6.2: Disable of device-initiated U2 failed.
Sep 24 08:32:23 kernel: usb 2-6-port2: not reset yet, waiting 10ms
Sep 24 08:32:23 kernel: usb 2-6-port2: not reset yet, waiting 10ms
Sep 24 08:32:23 kernel: usb 2-6-port2: not reset yet, waiting 200ms
Sep 24 08:32:23 kernel: usb 2-6.2: reset SuperSpeed Gen 1 USB device number 66 using xhci_hcd
Sep 24 08:32:23 kernel: usb 2-6.2: config index 0, error 18
Sep 24 08:32:23 kernel: usb 2-6.2: device firmware changed
Sep 24 08:32:23 kernel: usb 2-6-port2: logical disconnect
Sep 24 08:32:23 kernel: hub 2-6:1.0: state 7 ports 4 chg 0004 evt 0004
Sep 24 08:32:23 kernel: usb 2-6-port2: status 0263, change 0000, 5.0 Gb/s
Sep 24 08:32:23 kernel: usb 2-6.2: USB disconnect, device number 66
Sep 24 08:32:23 kernel: usb 2-6.2: unregistering device
Sep 24 08:32:23 kernel: usb 2-6.2: new SuperSpeed Gen 1 USB device number 67 using xhci_hcd
Sep 24 08:32:23 kernel: usb 2-6.2: udev 67, busnum 2, minor = 194
Sep 24 08:32:23 kernel: usb 2-6.2: New USB device found, idVendor=1409, idProduct=3590, bcdDevice= 0.00
Sep 24 08:32:23 kernel: usb 2-6.2: New USB device strings: Mfr=1, Product=2, SerialNumber=0
Sep 24 08:32:23 kernel: usb 2-6.2: Product: USB 3.0 Camera
Sep 24 08:32:23 kernel: usb 2-6.2: Manufacturer: Camera Manufacturer
Sep 24 08:32:23 kernel: hub 2-6:1.0: state 7 ports 4 chg 0000 evt 0002
Sep 24 08:32:23 kernel: usb 2-6-port1: link state change
Sep 24 08:32:23 kernel: usb 2-6-port1: status 0203, change 0041, 5.0 Gb/s
Sep 24 08:32:24 kernel: hub 2-6:1.0: state 7 ports 4 chg 0000 evt 0004
Sep 24 08:32:24 kernel: usb 2-6-port2: link state change
Sep 24 08:32:24 kernel: usb 2-6-port2: status 02a0, change 0041, 5.0 Gb/s
Sep 24 08:32:24 kernel: usb 2-6.2: USB disconnect, device number 67
Sep 24 08:32:24 kernel: usb 2-6.2: unregistering device
Sep 24 08:32:24 kernel: usb 2-6-port2: debounce total 200ms stable 100ms status 0x203
Sep 24 08:32:24 kernel: usb 2-6.2: new SuperSpeed Gen 1 USB device number 68 using xhci_hcd
Sep 24 08:32:24 kernel: usb 2-6.2: udev 68, busnum 2, minor = 195
Sep 24 08:32:24 kernel: usb 2-6.2: New USB device found, idVendor=1409, idProduct=3590, bcdDevice= 0.00
Sep 24 08:32:24 kernel: usb 2-6.2: New USB device strings: Mfr=1, Product=2, SerialNumber=0
Sep 24 08:32:24 kernel: usb 2-6.2: Product: USB 3.0 Camera
Sep 24 08:32:24 kernel: usb 2-6.2: Manufacturer: Camera Manufacturer


David

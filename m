Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A77F84360
	for <lists+linux-usb@lfdr.de>; Wed,  7 Aug 2019 06:25:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725794AbfHGEZG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 7 Aug 2019 00:25:06 -0400
Received: from mail-pl1-f175.google.com ([209.85.214.175]:44681 "EHLO
        mail-pl1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725780AbfHGEZG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 7 Aug 2019 00:25:06 -0400
Received: by mail-pl1-f175.google.com with SMTP id t14so38727077plr.11
        for <linux-usb@vger.kernel.org>; Tue, 06 Aug 2019 21:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gnarbox-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=LW7tPMMcaIbsgwOFCwE8eDGf4FFobUhhiUiKKOsL0lA=;
        b=QqVED7mmhjJ+k53YrXZJrpwdF6nmcmR5P+wpRkX4nMpPcyR6AKVpCPTYpB2UP3QiQB
         206VRwXISZRq4zzvaA3IiA1oPHvmZ8eSsQHt/2DQ0zRoHBWLHHTCwS3U3syi0RgXTcTv
         oPl5rxI2dqUpjCvxKYmBfAxyGy+81VPvFDss5zYb9KnDDUT5Dav4lmyrynls1vqWW4Kb
         8gJASt8tHLDa6EaqBgugqERP8FulAjzGtq7UxBwVrBfTGoBz9GFt/Jb9yMiADo/R1ofK
         8DLXrjtRiypyqAdq+pp//z5n9OrPrhyok8SBKPyh8ZeKENfZP5jEgSY3HGlOHvR5MbRt
         oDMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=LW7tPMMcaIbsgwOFCwE8eDGf4FFobUhhiUiKKOsL0lA=;
        b=NEz/XyiTTjE/taVheGnCjmDmke+H2+Vo8I+lxva0Dc9z++qZZCO/+SmEuQalBwcVnQ
         C4qudq/DV3DgL6OVmtsFk6b6QMKeYLslx/wmdtsNZoXy0PaOqJ3I0NL9x5MnxZ9DxosT
         VuXTCqFqvmzvXIG73ZGQdBieCgSVi1wPYcU1A3BLGubTbViwlV1+XddM1Xtw8zBPBZ67
         jQaQutoaorGydeYCmOXBk0vA0PKjQTZixS3i+ABL062K65w5X/8wIOK6lcZcCg1FZ18x
         SZQuncyHwQVn0MwkA5t291/APRaEGBnm0HzS0pHmd0694nMHWrWl2noIEN48nZDxImTW
         28xg==
X-Gm-Message-State: APjAAAXhIF8x1mPiA/MP+O/zut8QvsXo4PB0z9zVl48QIOKrgwNv9ToE
        2qihtQ/jnnQ/7J3mYszuxflFoA==
X-Google-Smtp-Source: APXvYqyfcdjJukNzCsdvz82PXe3dDTY+RqZ4/HBHKMB75hJfiblymsVVQzt256m3GLqQiRBYrmWdZw==
X-Received: by 2002:a17:902:76c6:: with SMTP id j6mr6385990plt.102.1565151903683;
        Tue, 06 Aug 2019 21:25:03 -0700 (PDT)
Received: from coops (cpe-104-173-199-40.socal.res.rr.com. [104.173.199.40])
        by smtp.gmail.com with ESMTPSA id j6sm86381048pfa.141.2019.08.06.21.25.01
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Aug 2019 21:25:02 -0700 (PDT)
Date:   Tue, 6 Aug 2019 21:25:00 -0700
From:   Rob Weber <rob@gnarbox.com>
To:     Peter Chen <hzpeterchen@gmail.com>, mathias.nyman@linux.intel.com
Cc:     Evan Gates <evan@gnarbox.com>, linux-usb@vger.kernel.org
Subject: Re: EHSET USB testing
Message-ID: <20190807042500.GA10249@coops>
References: <20190802200325.22897-1-evan@gnarbox.com>
 <CAL411-q1Hxkh+i3WRcAPM7QZ_yC-96jBfAx-t4PRJH7Cs1fvjA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="Qxx1br4bt0+wmkIi"
Content-Disposition: inline
In-Reply-To: <CAL411-q1Hxkh+i3WRcAPM7QZ_yC-96jBfAx-t4PRJH7Cs1fvjA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--Qxx1br4bt0+wmkIi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Everyone,

(Pinging Mathias regarding xHCI support of the USB 2.0 test modes)

On Mon, Aug 05, 2019 at 02:07:23PM +0800, Peter Chen wrote:
> On Sun, Aug 4, 2019 at 10:45 AM Evan Gates <evan@gnarbox.com> wrote:
> >
> > I'm trying to get my device to pass the EHSET tests.  I found the thread
> > "Using EHSET module" from March.  I'm having similar issues.
> >
> > I don't have access to the PID VID board that the lab uses.  Instead I'm
> > using another computer setup as a mass storage gadget but set the VID:PID
> > to 1a0a:0102 (TEST_J).  If that sounds like a problem or there is another,
> > better way to do this please let me know.
> >
> > > The usb-storage driver bound to your device first.  Try building a
> > > kernel without that driver and then it shoudl bind to the other driver.
> > >
> > > Or manually bind the ehset driver to your device through sysfs.  Read up
> > > on the documentation for the "new_id" and "bind" and "unbind" sysfs
> > > files for how to do that.
> >
> > I did this.  I was able to unbind from usb-storage but binding to
> > usb_ehset_test failed with error -32 (AFAICT EPIPE).  I tried both the
> > usb_ehset_test/bind and usb_ehset_test/new_id methods.  In both cases
> > I got the same error.
> >
> > I did another build without usb-storage.  Now I don't have to go through
> > the unbind step but I still get the same error while probing.
> >
> >         [  296.089877] usb 1-1: new high-speed USB device number 2 using xhci_hcd
> >         [  296.271081] usb_ehset_test: probe of 1-1:1.0 failed with error -32
> >
> > I notice that it says "using xhci_hcd."  Is that a problem?  Does it
> > need to be ehci?  I tried a build without xhci but that caused other
> > problems for me.
> >
> > 1) Can I use a computer in device mode to present a VID:PID to get into
> > EHSET mode?  If so how should I do that?
> >
> 
> Afaik, you can't. No Host computer will act as USB device. You may try
> to configure your box as USB device mode, for gadget driver, you could
> using legacy g_zero module, or source_sink function using configfs.
> 
> > 2) What else do I need to do in order to get my box into EHSET mode?
> Only thing is your box need to be at host mode. For testing USB2 for xHCI,
> the mainline code should not support TEST_SINGLE_STEP_SET_FEATURE
> at my last access.

Today I was able to get access to a PID/VID test fixture that is used in
USB 2.0 EHSET testing. Some of the major findings include:

1. The only test mode that works properly is
   TEST_HS_HOST_PORT_SUSPEND_RESUME. All other probes of the ehset module
   fail with errno -32 as shown above. This test mode is likely the only
   one to work because it does not set the PORT_FEAT_TEST feature for the
   appropriate port, but rather sets and clears the PORT_FEAT_SUSPEND feature.

2. The same issue was observed on not only our custom hardware, but also
   a Dell XPS 13 running Ubuntu 18.04 with kernel version 4.15. I've
   attached the dmesg logs with xhci_hcd dynamic debug enabled for both
   hosts. The logs were captured while testing the TEST_PACKET test
   mode, but the logs looked similar for every other rest mode besides
   HS_HOST_PORT_SUSPEND_RESUME.


Mathias, I would appreciate your feedback on the attached dmesg logs
with xhci_hcd dynamic debug enabled. If you have a moment, could you
please take a look at the logs and let me know if there are any clues as
to why the test mode is not working with xhci_hcd? I've also attached
the lsusb output for this particular EHSET test fixture made by Allion.

I've been digging into the xHCI specification to see what details it
might contain about the USB 2.0 test modes we are trying to use.
Section 4.19.6 describes the proper sequence for enabling the USB 2.0
port test modes. This requires setting the appropriate bits in the USB
2.0 PORTPMSC register, which is described in full detail in section
5.4.9.2. It's clear that xHCI should support the EHSET test modes,
but we're not able to set the appropriate port features for some reason.

My next thought is to double-check the logic of the ehset driver as it
relates to xhci_hcd. I would like to make sure that we are enabling the
USB 2.0 test modes according to the xHCI spec. I'm concerned that we
might be experiencing an error because we aren't setting the test mode
acording to section 4.19.6 of the xHCI specification.

Thanks in advance for reviewing the logs, Mathias! I appreciate any time
and feedback you may be able to provide. Let me know if you have any
further questions or need more information from me. I look forward to
hearing from you soon!

Cheers,
Rob Weber

--Qxx1br4bt0+wmkIi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="dell-xps13_linux-4.15.0_ehset-test-packet-failure.dmesg.txt"

[110706.181186] xhci_hcd 0000:00:14.0: // Ding dong!
[110706.181229] xhci_hcd 0000:00:14.0: Slot 27 output ctx = 0x182032000 (dma)
[110706.181234] xhci_hcd 0000:00:14.0: Slot 27 input ctx = 0x106a32000 (dma)
[110706.181254] xhci_hcd 0000:00:14.0: Set slot id 27 dcbaa entry 00000000a827a8c9 to 0x182032000
[110706.261110] usb 1-1.1: new high-speed USB device number 27 using xhci_hcd
[110706.261122] xhci_hcd 0000:00:14.0: Set root hub portnum to 1
[110706.261125] xhci_hcd 0000:00:14.0: Set fake root hub portnum to 1
[110706.261129] xhci_hcd 0000:00:14.0: udev->tt =           (null)
[110706.261132] xhci_hcd 0000:00:14.0: udev->ttport = 0x0
[110706.261139] xhci_hcd 0000:00:14.0: // Ding dong!
[110706.261175] xhci_hcd 0000:00:14.0: Successful setup context command
[110706.261182] xhci_hcd 0000:00:14.0: Op regs DCBAA ptr = 0x000002696d2000
[110706.261187] xhci_hcd 0000:00:14.0: Slot ID 27 dcbaa entry @00000000a827a8c9 = 0x00000182032000
[110706.261191] xhci_hcd 0000:00:14.0: Output Context DMA address = 0x182032000
[110706.261195] xhci_hcd 0000:00:14.0: Internal device address = 0
[110706.261359] xhci_hcd 0000:00:14.0: Waiting for status stage event
[110706.340982] xhci_hcd 0000:00:14.0: Resetting device with slot ID 27
[110706.340993] xhci_hcd 0000:00:14.0: // Ding dong!
[110706.341008] xhci_hcd 0000:00:14.0: Completed reset device command.
[110706.341018] xhci_hcd 0000:00:14.0: Can't reset device (slot ID 27) in default state
[110706.341021] xhci_hcd 0000:00:14.0: Not freeing device rings.
[110706.341031] xhci_hcd 0000:00:14.0: // Ding dong!
[110706.341058] xhci_hcd 0000:00:14.0: Successful setup address command
[110706.341064] xhci_hcd 0000:00:14.0: Op regs DCBAA ptr = 0x000002696d2000
[110706.341070] xhci_hcd 0000:00:14.0: Slot ID 27 dcbaa entry @00000000a827a8c9 = 0x00000182032000
[110706.341074] xhci_hcd 0000:00:14.0: Output Context DMA address = 0x182032000
[110706.341078] xhci_hcd 0000:00:14.0: Internal device address = 0
[110706.341084] xhci_hcd 0000:00:14.0: Endpoint 0x0 ep reset callback called
[110706.361631] xhci_hcd 0000:00:14.0: Waiting for status stage event
[110706.361899] xhci_hcd 0000:00:14.0: Waiting for status stage event
[110706.362074] xhci_hcd 0000:00:14.0: Waiting for status stage event
[110706.362110] usb 1-1.1: New USB device found, idVendor=1a0a, idProduct=0104
[110706.362115] usb 1-1.1: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[110706.362119] usb 1-1.1: Product: USB-VPID
[110706.362122] usb 1-1.1: Manufacturer: Allion
[110706.362444] xhci_hcd 0000:00:14.0: add ep 0x2, slot id 27, new drop flags = 0x0, new add flags = 0x10
[110706.362470] xhci_hcd 0000:00:14.0: add ep 0x4, slot id 27, new drop flags = 0x0, new add flags = 0x110
[110706.362496] xhci_hcd 0000:00:14.0: add ep 0x86, slot id 27, new drop flags = 0x0, new add flags = 0x2110
[110706.362520] xhci_hcd 0000:00:14.0: add ep 0x88, slot id 27, new drop flags = 0x0, new add flags = 0x22110
[110706.362527] xhci_hcd 0000:00:14.0: xhci_check_bandwidth called for udev 000000004e043f14
[110706.362541] xhci_hcd 0000:00:14.0: // Ding dong!
[110706.362876] xhci_hcd 0000:00:14.0: Successful Endpoint Configure command
[110706.362886] xhci_hcd 0000:00:14.0: Endpoint 0x2 ep reset callback called
[110706.362890] xhci_hcd 0000:00:14.0: Endpoint 0x4 ep reset callback called
[110706.362894] xhci_hcd 0000:00:14.0: Endpoint 0x86 ep reset callback called
[110706.362899] xhci_hcd 0000:00:14.0: Endpoint 0x88 ep reset callback called
[110706.363205] xhci_hcd 0000:00:14.0: Stalled endpoint for slot 2 ep 0
[110706.363214] xhci_hcd 0000:00:14.0: Cleaning up stalled endpoint ring
[110706.363219] xhci_hcd 0000:00:14.0: Finding endpoint context
[110706.363225] xhci_hcd 0000:00:14.0: Cycle state = 0x0
[110706.363230] xhci_hcd 0000:00:14.0: New dequeue segment = 0000000015585d63 (virtual)
[110706.363236] xhci_hcd 0000:00:14.0: New dequeue pointer = 0x268c83930 (DMA)
[110706.363241] xhci_hcd 0000:00:14.0: Queueing new dequeue state
[110706.363249] xhci_hcd 0000:00:14.0: Set TR Deq Ptr cmd, new deq seg = 0000000015585d63 (0x268c83000 dma), new deq ptr = 00000000b65b101b (0x268c83930 dma), new cycle = 0
[110706.363255] xhci_hcd 0000:00:14.0: // Ding dong!
[110706.363264] xhci_hcd 0000:00:14.0: Giveback URB 00000000c9facae3, len = 0, expected = 0, status = -32
[110706.363274] xhci_hcd 0000:00:14.0: Ignoring reset ep completion code of 1
[110706.363282] xhci_hcd 0000:00:14.0: Successful Set TR Deq Ptr cmd, deq = @268c83930
[110706.363306] usb_ehset_test: probe of 1-1.1:1.0 failed with error -32

--Qxx1br4bt0+wmkIi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="gnarbox_linux-4.9.115-ehset-test-packet-failure.dmesg.txt"

root@gnarbox-2:~# dmesg -w
[ 2371.042941] xhci_hcd 0000:00:14.0: Port Status Change Event for port 2
[ 2371.042964] xhci_hcd 0000:00:14.0: handle_port_status: starting port polling.
[ 2371.043588] xhci_hcd 0000:00:14.0: get port status, actual port 1 status  = 0x206e1
[ 2371.043598] xhci_hcd 0000:00:14.0: Get port status returned 0x10101
[ 2371.043672] xhci_hcd 0000:00:14.0: clear port connect change, actual port 1 status  = 0x6e1
[ 2371.043726] xhci_hcd 0000:00:14.0: get port status, actual port 1 status  = 0x6e1
[ 2371.043735] xhci_hcd 0000:00:14.0: Get port status returned 0x101
[ 2371.043922] xhci_hcd 0000:00:14.0: Port Status Change Event for port 2
[ 2371.043934] xhci_hcd 0000:00:14.0: handle_port_status: starting port polling.
[ 2371.070469] xhci_hcd 0000:00:14.0: get port status, actual port 1 status  = 0x202a0
[ 2371.070481] xhci_hcd 0000:00:14.0: Get port status returned 0x10100
[ 2371.070566] xhci_hcd 0000:00:14.0: clear port connect change, actual port 1 status  = 0x2a0
[ 2371.076511] xhci_hcd 0000:00:14.0: Port Status Change Event for port 2
[ 2371.076532] xhci_hcd 0000:00:14.0: handle_port_status: starting port polling.
[ 2371.097488] xhci_hcd 0000:00:14.0: get port status, actual port 1 status  = 0x202a0
[ 2371.097502] xhci_hcd 0000:00:14.0: Get port status returned 0x10100
[ 2371.097649] xhci_hcd 0000:00:14.0: clear port connect change, actual port 1 status  = 0x2a0
[ 2371.098404] xhci_hcd 0000:00:14.0: Port Status Change Event for port 2
[ 2371.098421] xhci_hcd 0000:00:14.0: handle_port_status: starting port polling.
[ 2371.124215] xhci_hcd 0000:00:14.0: get port status, actual port 1 status  = 0x206e1
[ 2371.124229] xhci_hcd 0000:00:14.0: Get port status returned 0x10101
[ 2371.124326] xhci_hcd 0000:00:14.0: clear port connect change, actual port 1 status  = 0x6e1
[ 2371.151213] xhci_hcd 0000:00:14.0: get port status, actual port 1 status  = 0x6e1
[ 2371.151228] xhci_hcd 0000:00:14.0: Get port status returned 0x101
[ 2371.178304] xhci_hcd 0000:00:14.0: get port status, actual port 1 status  = 0x6e1
[ 2371.178319] xhci_hcd 0000:00:14.0: Get port status returned 0x101
[ 2371.205294] xhci_hcd 0000:00:14.0: get port status, actual port 1 status  = 0x6e1
[ 2371.205308] xhci_hcd 0000:00:14.0: Get port status returned 0x101
[ 2371.232831] xhci_hcd 0000:00:14.0: get port status, actual port 1 status  = 0x6e1
[ 2371.232845] xhci_hcd 0000:00:14.0: Get port status returned 0x101
[ 2371.232969] xhci_hcd 0000:00:14.0: // Ding dong!
[ 2371.233125] xhci_hcd 0000:00:14.0: Slot 14 output ctx = 0x177e2c000 (dma)
[ 2371.233155] xhci_hcd 0000:00:14.0: Slot 14 input ctx = 0x166fc3000 (dma)
[ 2371.233183] xhci_hcd 0000:00:14.0: Set slot id 14 dcbaa entry ffff880178ded070 to 0x177e2c000
[ 2371.233230] xhci_hcd 0000:00:14.0: set port reset, actual port 1 status  = 0x791
[ 2371.244240] xhci_hcd 0000:00:14.0: xhci_hub_status_data: stopping port polling.
[ 2371.285206] xhci_hcd 0000:00:14.0: get port status, actual port 1 status  = 0xf91
[ 2371.285220] xhci_hcd 0000:00:14.0: Get port status returned 0x511
[ 2371.288352] xhci_hcd 0000:00:14.0: Port Status Change Event for port 2
[ 2371.288373] xhci_hcd 0000:00:14.0: handle_port_status: starting port polling.
[ 2371.337308] xhci_hcd 0000:00:14.0: get port status, actual port 1 status  = 0x200e03
[ 2371.337323] xhci_hcd 0000:00:14.0: Get port status returned 0x100503
[ 2371.337427] xhci_hcd 0000:00:14.0: clear port reset change, actual port 1 status  = 0xe03
[ 2371.389299] usb 1-2: new high-speed USB device number 15 using xhci_hcd
[ 2371.389328] xhci_hcd 0000:00:14.0: Set root hub portnum to 2
[ 2371.389339] xhci_hcd 0000:00:14.0: Set fake root hub portnum to 2
[ 2371.389351] xhci_hcd 0000:00:14.0: udev->tt =           (null)
[ 2371.389361] xhci_hcd 0000:00:14.0: udev->ttport = 0x0
[ 2371.389375] xhci_hcd 0000:00:14.0: Slot ID 14 Input Context:
[ 2371.389395] xhci_hcd 0000:00:14.0: @ffff880166fc3000 (virt) @166fc3000 (dma) 0x000000 - drop flags
[ 2371.389407] xhci_hcd 0000:00:14.0: @ffff880166fc3004 (virt) @166fc3004 (dma) 0x000003 - add flags
[ 2371.389421] xhci_hcd 0000:00:14.0: @ffff880166fc3008 (virt) @166fc3008 (dma) 0x000000 - rsvd2[0]
[ 2371.389434] xhci_hcd 0000:00:14.0: @ffff880166fc300c (virt) @166fc300c (dma) 0x000000 - rsvd2[1]
[ 2371.389446] xhci_hcd 0000:00:14.0: @ffff880166fc3010 (virt) @166fc3010 (dma) 0x000000 - rsvd2[2]
[ 2371.389458] xhci_hcd 0000:00:14.0: @ffff880166fc3014 (virt) @166fc3014 (dma) 0x000000 - rsvd2[3]
[ 2371.389470] xhci_hcd 0000:00:14.0: @ffff880166fc3018 (virt) @166fc3018 (dma) 0x000000 - rsvd2[4]
[ 2371.389482] xhci_hcd 0000:00:14.0: @ffff880166fc301c (virt) @166fc301c (dma) 0x000000 - rsvd2[5]
[ 2371.389493] xhci_hcd 0000:00:14.0: Slot Context:
[ 2371.389505] xhci_hcd 0000:00:14.0: @ffff880166fc3020 (virt) @166fc3020 (dma) 0x8300000 - dev_info
[ 2371.389517] xhci_hcd 0000:00:14.0: @ffff880166fc3024 (virt) @166fc3024 (dma) 0x020000 - dev_info2
[ 2371.389529] xhci_hcd 0000:00:14.0: @ffff880166fc3028 (virt) @166fc3028 (dma) 0x000000 - tt_info
[ 2371.389542] xhci_hcd 0000:00:14.0: @ffff880166fc302c (virt) @166fc302c (dma) 0x000000 - dev_state
[ 2371.389555] xhci_hcd 0000:00:14.0: @ffff880166fc3030 (virt) @166fc3030 (dma) 0x000000 - rsvd[0]
[ 2371.389568] xhci_hcd 0000:00:14.0: @ffff880166fc3034 (virt) @166fc3034 (dma) 0x000000 - rsvd[1]
[ 2371.389580] xhci_hcd 0000:00:14.0: @ffff880166fc3038 (virt) @166fc3038 (dma) 0x000000 - rsvd[2]
[ 2371.389592] xhci_hcd 0000:00:14.0: @ffff880166fc303c (virt) @166fc303c (dma) 0x000000 - rsvd[3]
[ 2371.389605] xhci_hcd 0000:00:14.0: IN Endpoint 00 Context (ep_index 00):
[ 2371.389618] xhci_hcd 0000:00:14.0: @ffff880166fc3040 (virt) @166fc3040 (dma) 0x000000 - ep_info
[ 2371.389630] xhci_hcd 0000:00:14.0: @ffff880166fc3044 (virt) @166fc3044 (dma) 0x400026 - ep_info2
[ 2371.389643] xhci_hcd 0000:00:14.0: @ffff880166fc3048 (virt) @166fc3048 (dma) 0x1650e9001 - deq
[ 2371.389654] xhci_hcd 0000:00:14.0: @ffff880166fc3050 (virt) @166fc3050 (dma) 0x000000 - tx_info
[ 2371.389667] xhci_hcd 0000:00:14.0: @ffff880166fc3054 (virt) @166fc3054 (dma) 0x000000 - rsvd[0]
[ 2371.389679] xhci_hcd 0000:00:14.0: @ffff880166fc3058 (virt) @166fc3058 (dma) 0x000000 - rsvd[1]
[ 2371.389690] xhci_hcd 0000:00:14.0: @ffff880166fc305c (virt) @166fc305c (dma) 0x000000 - rsvd[2]
[ 2371.389701] xhci_hcd 0000:00:14.0: OUT Endpoint 01 Context (ep_index 01):
[ 2371.389713] xhci_hcd 0000:00:14.0: @ffff880166fc3060 (virt) @166fc3060 (dma) 0x000000 - ep_info
[ 2371.389724] xhci_hcd 0000:00:14.0: @ffff880166fc3064 (virt) @166fc3064 (dma) 0x000000 - ep_info2
[ 2371.389735] xhci_hcd 0000:00:14.0: @ffff880166fc3068 (virt) @166fc3068 (dma) 0x000000 - deq
[ 2371.389746] xhci_hcd 0000:00:14.0: @ffff880166fc3070 (virt) @166fc3070 (dma) 0x000000 - tx_info
[ 2371.389758] xhci_hcd 0000:00:14.0: @ffff880166fc3074 (virt) @166fc3074 (dma) 0x000000 - rsvd[0]
[ 2371.389770] xhci_hcd 0000:00:14.0: @ffff880166fc3078 (virt) @166fc3078 (dma) 0x000000 - rsvd[1]
[ 2371.389782] xhci_hcd 0000:00:14.0: @ffff880166fc307c (virt) @166fc307c (dma) 0x000000 - rsvd[2]
[ 2371.389793] xhci_hcd 0000:00:14.0: IN Endpoint 01 Context (ep_index 02):
[ 2371.389804] xhci_hcd 0000:00:14.0: @ffff880166fc3080 (virt) @166fc3080 (dma) 0x000000 - ep_info
[ 2371.389815] xhci_hcd 0000:00:14.0: @ffff880166fc3084 (virt) @166fc3084 (dma) 0x000000 - ep_info2
[ 2371.389826] xhci_hcd 0000:00:14.0: @ffff880166fc3088 (virt) @166fc3088 (dma) 0x000000 - deq
[ 2371.389838] xhci_hcd 0000:00:14.0: @ffff880166fc3090 (virt) @166fc3090 (dma) 0x000000 - tx_info
[ 2371.389849] xhci_hcd 0000:00:14.0: @ffff880166fc3094 (virt) @166fc3094 (dma) 0x000000 - rsvd[0]
[ 2371.389861] xhci_hcd 0000:00:14.0: @ffff880166fc3098 (virt) @166fc3098 (dma) 0x000000 - rsvd[1]
[ 2371.389873] xhci_hcd 0000:00:14.0: @ffff880166fc309c (virt) @166fc309c (dma) 0x000000 - rsvd[2]
[ 2371.389932] xhci_hcd 0000:00:14.0: // Ding dong!
[ 2371.390008] xhci_hcd 0000:00:14.0: Successful setup context command
[ 2371.390028] xhci_hcd 0000:00:14.0: Op regs DCBAA ptr = 0x00000178ded000
[ 2371.390138] xhci_hcd 0000:00:14.0: Slot ID 14 dcbaa entry @ffff880178ded070 = 0x00000177e2c000
[ 2371.390152] xhci_hcd 0000:00:14.0: Output Context DMA address = 0x177e2c000
[ 2371.390163] xhci_hcd 0000:00:14.0: Slot ID 14 Input Context:
[ 2371.390176] xhci_hcd 0000:00:14.0: @ffff880166fc3000 (virt) @166fc3000 (dma) 0x000000 - drop flags
[ 2371.390188] xhci_hcd 0000:00:14.0: @ffff880166fc3004 (virt) @166fc3004 (dma) 0x000003 - add flags
[ 2371.390200] xhci_hcd 0000:00:14.0: @ffff880166fc3008 (virt) @166fc3008 (dma) 0x000000 - rsvd2[0]
[ 2371.390212] xhci_hcd 0000:00:14.0: @ffff880166fc300c (virt) @166fc300c (dma) 0x000000 - rsvd2[1]
[ 2371.390224] xhci_hcd 0000:00:14.0: @ffff880166fc3010 (virt) @166fc3010 (dma) 0x000000 - rsvd2[2]
[ 2371.390237] xhci_hcd 0000:00:14.0: @ffff880166fc3014 (virt) @166fc3014 (dma) 0x000000 - rsvd2[3]
[ 2371.390249] xhci_hcd 0000:00:14.0: @ffff880166fc3018 (virt) @166fc3018 (dma) 0x000000 - rsvd2[4]
[ 2371.390261] xhci_hcd 0000:00:14.0: @ffff880166fc301c (virt) @166fc301c (dma) 0x000000 - rsvd2[5]
[ 2371.390269] xhci_hcd 0000:00:14.0: Slot Context:
[ 2371.390280] xhci_hcd 0000:00:14.0: @ffff880166fc3020 (virt) @166fc3020 (dma) 0x8300000 - dev_info
[ 2371.390293] xhci_hcd 0000:00:14.0: @ffff880166fc3024 (virt) @166fc3024 (dma) 0x020000 - dev_info2
[ 2371.390326] xhci_hcd 0000:00:14.0: @ffff880166fc3028 (virt) @166fc3028 (dma) 0x000000 - tt_info
[ 2371.390378] xhci_hcd 0000:00:14.0: @ffff880166fc302c (virt) @166fc302c (dma) 0x000000 - dev_state
[ 2371.390409] xhci_hcd 0000:00:14.0: @ffff880166fc3030 (virt) @166fc3030 (dma) 0x000000 - rsvd[0]
[ 2371.390440] xhci_hcd 0000:00:14.0: @ffff880166fc3034 (virt) @166fc3034 (dma) 0x000000 - rsvd[1]
[ 2371.390452] xhci_hcd 0000:00:14.0: @ffff880166fc3038 (virt) @166fc3038 (dma) 0x000000 - rsvd[2]
[ 2371.390464] xhci_hcd 0000:00:14.0: @ffff880166fc303c (virt) @166fc303c (dma) 0x000000 - rsvd[3]
[ 2371.390475] xhci_hcd 0000:00:14.0: IN Endpoint 00 Context (ep_index 00):
[ 2371.390487] xhci_hcd 0000:00:14.0: @ffff880166fc3040 (virt) @166fc3040 (dma) 0x000000 - ep_info
[ 2371.390498] xhci_hcd 0000:00:14.0: @ffff880166fc3044 (virt) @166fc3044 (dma) 0x400026 - ep_info2
[ 2371.390510] xhci_hcd 0000:00:14.0: @ffff880166fc3048 (virt) @166fc3048 (dma) 0x1650e9001 - deq
[ 2371.390531] xhci_hcd 0000:00:14.0: @ffff880166fc3050 (virt) @166fc3050 (dma) 0x000000 - tx_info
[ 2371.390544] xhci_hcd 0000:00:14.0: @ffff880166fc3054 (virt) @166fc3054 (dma) 0x000000 - rsvd[0]
[ 2371.390556] xhci_hcd 0000:00:14.0: @ffff880166fc3058 (virt) @166fc3058 (dma) 0x000000 - rsvd[1]
[ 2371.390567] xhci_hcd 0000:00:14.0: @ffff880166fc305c (virt) @166fc305c (dma) 0x000000 - rsvd[2]
[ 2371.390578] xhci_hcd 0000:00:14.0: OUT Endpoint 01 Context (ep_index 01):
[ 2371.390589] xhci_hcd 0000:00:14.0: @ffff880166fc3060 (virt) @166fc3060 (dma) 0x000000 - ep_info
[ 2371.390601] xhci_hcd 0000:00:14.0: @ffff880166fc3064 (virt) @166fc3064 (dma) 0x000000 - ep_info2
[ 2371.390612] xhci_hcd 0000:00:14.0: @ffff880166fc3068 (virt) @166fc3068 (dma) 0x000000 - deq
[ 2371.390633] xhci_hcd 0000:00:14.0: @ffff880166fc3070 (virt) @166fc3070 (dma) 0x000000 - tx_info
[ 2371.390645] xhci_hcd 0000:00:14.0: @ffff880166fc3074 (virt) @166fc3074 (dma) 0x000000 - rsvd[0]
[ 2371.390657] xhci_hcd 0000:00:14.0: @ffff880166fc3078 (virt) @166fc3078 (dma) 0x000000 - rsvd[1]
[ 2371.390670] xhci_hcd 0000:00:14.0: @ffff880166fc307c (virt) @166fc307c (dma) 0x000000 - rsvd[2]
[ 2371.390680] xhci_hcd 0000:00:14.0: IN Endpoint 01 Context (ep_index 02):
[ 2371.390691] xhci_hcd 0000:00:14.0: @ffff880166fc3080 (virt) @166fc3080 (dma) 0x000000 - ep_info
[ 2371.390704] xhci_hcd 0000:00:14.0: @ffff880166fc3084 (virt) @166fc3084 (dma) 0x000000 - ep_info2
[ 2371.390715] xhci_hcd 0000:00:14.0: @ffff880166fc3088 (virt) @166fc3088 (dma) 0x000000 - deq
[ 2371.390735] xhci_hcd 0000:00:14.0: @ffff880166fc3090 (virt) @166fc3090 (dma) 0x000000 - tx_info
[ 2371.390747] xhci_hcd 0000:00:14.0: @ffff880166fc3094 (virt) @166fc3094 (dma) 0x000000 - rsvd[0]
[ 2371.390759] xhci_hcd 0000:00:14.0: @ffff880166fc3098 (virt) @166fc3098 (dma) 0x000000 - rsvd[1]
[ 2371.390771] xhci_hcd 0000:00:14.0: @ffff880166fc309c (virt) @166fc309c (dma) 0x000000 - rsvd[2]
[ 2371.390781] xhci_hcd 0000:00:14.0: Slot ID 14 Output Context:
[ 2371.390789] xhci_hcd 0000:00:14.0: Slot Context:
[ 2371.390803] xhci_hcd 0000:00:14.0: @ffff880177e2c000 (virt) @177e2c000 (dma) 0x8300000 - dev_info
[ 2371.390825] xhci_hcd 0000:00:14.0: @ffff880177e2c004 (virt) @177e2c004 (dma) 0x020000 - dev_info2
[ 2371.390836] xhci_hcd 0000:00:14.0: @ffff880177e2c008 (virt) @177e2c008 (dma) 0x000000 - tt_info
[ 2371.390847] xhci_hcd 0000:00:14.0: @ffff880177e2c00c (virt) @177e2c00c (dma) 0x8000000 - dev_state
[ 2371.390859] xhci_hcd 0000:00:14.0: @ffff880177e2c010 (virt) @177e2c010 (dma) 0x000000 - rsvd[0]
[ 2371.390872] xhci_hcd 0000:00:14.0: @ffff880177e2c014 (virt) @177e2c014 (dma) 0x000000 - rsvd[1]
[ 2371.390884] xhci_hcd 0000:00:14.0: @ffff880177e2c018 (virt) @177e2c018 (dma) 0x000000 - rsvd[2]
[ 2371.390896] xhci_hcd 0000:00:14.0: @ffff880177e2c01c (virt) @177e2c01c (dma) 0x000000 - rsvd[3]
[ 2371.390913] xhci_hcd 0000:00:14.0: IN Endpoint 00 Context (ep_index 00):
[ 2371.390925] xhci_hcd 0000:00:14.0: @ffff880177e2c020 (virt) @177e2c020 (dma) 0x000001 - ep_info
[ 2371.390936] xhci_hcd 0000:00:14.0: @ffff880177e2c024 (virt) @177e2c024 (dma) 0x400026 - ep_info2
[ 2371.390948] xhci_hcd 0000:00:14.0: @ffff880177e2c028 (virt) @177e2c028 (dma) 0x1650e9001 - deq
[ 2371.390960] xhci_hcd 0000:00:14.0: @ffff880177e2c030 (virt) @177e2c030 (dma) 0x000000 - tx_info
[ 2371.390973] xhci_hcd 0000:00:14.0: @ffff880177e2c034 (virt) @177e2c034 (dma) 0x000000 - rsvd[0]
[ 2371.390985] xhci_hcd 0000:00:14.0: @ffff880177e2c038 (virt) @177e2c038 (dma) 0x000000 - rsvd[1]
[ 2371.391028] xhci_hcd 0000:00:14.0: @ffff880177e2c03c (virt) @177e2c03c (dma) 0x000000 - rsvd[2]
[ 2371.391083] xhci_hcd 0000:00:14.0: OUT Endpoint 01 Context (ep_index 01):
[ 2371.391096] xhci_hcd 0000:00:14.0: @ffff880177e2c040 (virt) @177e2c040 (dma) 0x000000 - ep_info
[ 2371.391108] xhci_hcd 0000:00:14.0: @ffff880177e2c044 (virt) @177e2c044 (dma) 0x000000 - ep_info2
[ 2371.391119] xhci_hcd 0000:00:14.0: @ffff880177e2c048 (virt) @177e2c048 (dma) 0x000000 - deq
[ 2371.391149] xhci_hcd 0000:00:14.0: @ffff880177e2c050 (virt) @177e2c050 (dma) 0x000000 - tx_info
[ 2371.391179] xhci_hcd 0000:00:14.0: @ffff880177e2c054 (virt) @177e2c054 (dma) 0x000000 - rsvd[0]
[ 2371.391197] xhci_hcd 0000:00:14.0: @ffff880177e2c058 (virt) @177e2c058 (dma) 0x000000 - rsvd[1]
[ 2371.391219] xhci_hcd 0000:00:14.0: @ffff880177e2c05c (virt) @177e2c05c (dma) 0x000000 - rsvd[2]
[ 2371.391230] xhci_hcd 0000:00:14.0: IN Endpoint 01 Context (ep_index 02):
[ 2371.391241] xhci_hcd 0000:00:14.0: @ffff880177e2c060 (virt) @177e2c060 (dma) 0x000000 - ep_info
[ 2371.391252] xhci_hcd 0000:00:14.0: @ffff880177e2c064 (virt) @177e2c064 (dma) 0x000000 - ep_info2
[ 2371.391265] xhci_hcd 0000:00:14.0: @ffff880177e2c068 (virt) @177e2c068 (dma) 0x000000 - deq
[ 2371.391278] xhci_hcd 0000:00:14.0: @ffff880177e2c070 (virt) @177e2c070 (dma) 0x000000 - tx_info
[ 2371.391290] xhci_hcd 0000:00:14.0: @ffff880177e2c074 (virt) @177e2c074 (dma) 0x000000 - rsvd[0]
[ 2371.391302] xhci_hcd 0000:00:14.0: @ffff880177e2c078 (virt) @177e2c078 (dma) 0x000000 - rsvd[1]
[ 2371.391314] xhci_hcd 0000:00:14.0: @ffff880177e2c07c (virt) @177e2c07c (dma) 0x000000 - rsvd[2]
[ 2371.391324] xhci_hcd 0000:00:14.0: Internal device address = 0
[ 2371.391507] xhci_hcd 0000:00:14.0: Waiting for status stage event
[ 2371.391589] xhci_hcd 0000:00:14.0: set port reset, actual port 1 status  = 0xf91
[ 2371.443063] xhci_hcd 0000:00:14.0: get port status, actual port 1 status  = 0xf91
[ 2371.443067] xhci_hcd 0000:00:14.0: Get port status returned 0x511
[ 2371.446599] xhci_hcd 0000:00:14.0: Port Status Change Event for port 2
[ 2371.446605] xhci_hcd 0000:00:14.0: handle_port_status: starting port polling.
[ 2371.495173] xhci_hcd 0000:00:14.0: get port status, actual port 1 status  = 0x200e03
[ 2371.495179] xhci_hcd 0000:00:14.0: Get port status returned 0x100503
[ 2371.495227] xhci_hcd 0000:00:14.0: clear port reset change, actual port 1 status  = 0xe03
[ 2371.547167] xhci_hcd 0000:00:14.0: Resetting device with slot ID 14
[ 2371.547181] xhci_hcd 0000:00:14.0: // Ding dong!
[ 2371.547200] xhci_hcd 0000:00:14.0: Completed reset device command.
[ 2371.547216] xhci_hcd 0000:00:14.0: Can't reset device (slot ID 14) in default state
[ 2371.547221] xhci_hcd 0000:00:14.0: Not freeing device rings.
[ 2371.547237] xhci_hcd 0000:00:14.0: Slot ID 14 Input Context:
[ 2371.547242] xhci_hcd 0000:00:14.0: @ffff880166fc3000 (virt) @166fc3000 (dma) 0x000000 - drop flags
[ 2371.547246] xhci_hcd 0000:00:14.0: @ffff880166fc3004 (virt) @166fc3004 (dma) 0x000003 - add flags
[ 2371.547249] xhci_hcd 0000:00:14.0: @ffff880166fc3008 (virt) @166fc3008 (dma) 0x000000 - rsvd2[0]
[ 2371.547261] xhci_hcd 0000:00:14.0: @ffff880166fc300c (virt) @166fc300c (dma) 0x000000 - rsvd2[1]
[ 2371.547273] xhci_hcd 0000:00:14.0: @ffff880166fc3010 (virt) @166fc3010 (dma) 0x000000 - rsvd2[2]
[ 2371.547285] xhci_hcd 0000:00:14.0: @ffff880166fc3014 (virt) @166fc3014 (dma) 0x000000 - rsvd2[3]
[ 2371.547297] xhci_hcd 0000:00:14.0: @ffff880166fc3018 (virt) @166fc3018 (dma) 0x000000 - rsvd2[4]
[ 2371.547309] xhci_hcd 0000:00:14.0: @ffff880166fc301c (virt) @166fc301c (dma) 0x000000 - rsvd2[5]
[ 2371.547319] xhci_hcd 0000:00:14.0: Slot Context:
[ 2371.547330] xhci_hcd 0000:00:14.0: @ffff880166fc3020 (virt) @166fc3020 (dma) 0x8300000 - dev_info
[ 2371.547342] xhci_hcd 0000:00:14.0: @ffff880166fc3024 (virt) @166fc3024 (dma) 0x020000 - dev_info2
[ 2371.547354] xhci_hcd 0000:00:14.0: @ffff880166fc3028 (virt) @166fc3028 (dma) 0x000000 - tt_info
[ 2371.547365] xhci_hcd 0000:00:14.0: @ffff880166fc302c (virt) @166fc302c (dma) 0x000000 - dev_state
[ 2371.547379] xhci_hcd 0000:00:14.0: @ffff880166fc3030 (virt) @166fc3030 (dma) 0x000000 - rsvd[0]
[ 2371.547391] xhci_hcd 0000:00:14.0: @ffff880166fc3034 (virt) @166fc3034 (dma) 0x000000 - rsvd[1]
[ 2371.547403] xhci_hcd 0000:00:14.0: @ffff880166fc3038 (virt) @166fc3038 (dma) 0x000000 - rsvd[2]
[ 2371.547415] xhci_hcd 0000:00:14.0: @ffff880166fc303c (virt) @166fc303c (dma) 0x000000 - rsvd[3]
[ 2371.547427] xhci_hcd 0000:00:14.0: IN Endpoint 00 Context (ep_index 00):
[ 2371.547440] xhci_hcd 0000:00:14.0: @ffff880166fc3040 (virt) @166fc3040 (dma) 0x000000 - ep_info
[ 2371.547453] xhci_hcd 0000:00:14.0: @ffff880166fc3044 (virt) @166fc3044 (dma) 0x400026 - ep_info2
[ 2371.547468] xhci_hcd 0000:00:14.0: @ffff880166fc3048 (virt) @166fc3048 (dma) 0x1650e9031 - deq
[ 2371.547480] xhci_hcd 0000:00:14.0: @ffff880166fc3050 (virt) @166fc3050 (dma) 0x000000 - tx_info
[ 2371.547492] xhci_hcd 0000:00:14.0: @ffff880166fc3054 (virt) @166fc3054 (dma) 0x000000 - rsvd[0]
[ 2371.547504] xhci_hcd 0000:00:14.0: @ffff880166fc3058 (virt) @166fc3058 (dma) 0x000000 - rsvd[1]
[ 2371.547515] xhci_hcd 0000:00:14.0: @ffff880166fc305c (virt) @166fc305c (dma) 0x000000 - rsvd[2]
[ 2371.547526] xhci_hcd 0000:00:14.0: OUT Endpoint 01 Context (ep_index 01):
[ 2371.547539] xhci_hcd 0000:00:14.0: @ffff880166fc3060 (virt) @166fc3060 (dma) 0x000000 - ep_info
[ 2371.547550] xhci_hcd 0000:00:14.0: @ffff880166fc3064 (virt) @166fc3064 (dma) 0x000000 - ep_info2
[ 2371.547562] xhci_hcd 0000:00:14.0: @ffff880166fc3068 (virt) @166fc3068 (dma) 0x000000 - deq
[ 2371.547573] xhci_hcd 0000:00:14.0: @ffff880166fc3070 (virt) @166fc3070 (dma) 0x000000 - tx_info
[ 2371.547585] xhci_hcd 0000:00:14.0: @ffff880166fc3074 (virt) @166fc3074 (dma) 0x000000 - rsvd[0]
[ 2371.547597] xhci_hcd 0000:00:14.0: @ffff880166fc3078 (virt) @166fc3078 (dma) 0x000000 - rsvd[1]
[ 2371.547609] xhci_hcd 0000:00:14.0: @ffff880166fc307c (virt) @166fc307c (dma) 0x000000 - rsvd[2]
[ 2371.547619] xhci_hcd 0000:00:14.0: IN Endpoint 01 Context (ep_index 02):
[ 2371.547631] xhci_hcd 0000:00:14.0: @ffff880166fc3080 (virt) @166fc3080 (dma) 0x000000 - ep_info
[ 2371.547642] xhci_hcd 0000:00:14.0: @ffff880166fc3084 (virt) @166fc3084 (dma) 0x000000 - ep_info2
[ 2371.547653] xhci_hcd 0000:00:14.0: @ffff880166fc3088 (virt) @166fc3088 (dma) 0x000000 - deq
[ 2371.547664] xhci_hcd 0000:00:14.0: @ffff880166fc3090 (virt) @166fc3090 (dma) 0x000000 - tx_info
[ 2371.547676] xhci_hcd 0000:00:14.0: @ffff880166fc3094 (virt) @166fc3094 (dma) 0x000000 - rsvd[0]
[ 2371.547688] xhci_hcd 0000:00:14.0: @ffff880166fc3098 (virt) @166fc3098 (dma) 0x000000 - rsvd[1]
[ 2371.547700] xhci_hcd 0000:00:14.0: @ffff880166fc309c (virt) @166fc309c (dma) 0x000000 - rsvd[2]
[ 2371.547713] xhci_hcd 0000:00:14.0: // Ding dong!
[ 2371.547811] xhci_hcd 0000:00:14.0: Successful setup address command
[ 2371.547830] xhci_hcd 0000:00:14.0: Op regs DCBAA ptr = 0x00000178ded000
[ 2371.547846] xhci_hcd 0000:00:14.0: Slot ID 14 dcbaa entry @ffff880178ded070 = 0x00000177e2c000
[ 2371.547856] xhci_hcd 0000:00:14.0: Output Context DMA address = 0x177e2c000
[ 2371.547867] xhci_hcd 0000:00:14.0: Slot ID 14 Input Context:
[ 2371.547880] xhci_hcd 0000:00:14.0: @ffff880166fc3000 (virt) @166fc3000 (dma) 0x000000 - drop flags
[ 2371.547892] xhci_hcd 0000:00:14.0: @ffff880166fc3004 (virt) @166fc3004 (dma) 0x000003 - add flags
[ 2371.547904] xhci_hcd 0000:00:14.0: @ffff880166fc3008 (virt) @166fc3008 (dma) 0x000000 - rsvd2[0]
[ 2371.547916] xhci_hcd 0000:00:14.0: @ffff880166fc300c (virt) @166fc300c (dma) 0x000000 - rsvd2[1]
[ 2371.547930] xhci_hcd 0000:00:14.0: @ffff880166fc3010 (virt) @166fc3010 (dma) 0x000000 - rsvd2[2]
[ 2371.547942] xhci_hcd 0000:00:14.0: @ffff880166fc3014 (virt) @166fc3014 (dma) 0x000000 - rsvd2[3]
[ 2371.547954] xhci_hcd 0000:00:14.0: @ffff880166fc3018 (virt) @166fc3018 (dma) 0x000000 - rsvd2[4]
[ 2371.547966] xhci_hcd 0000:00:14.0: @ffff880166fc301c (virt) @166fc301c (dma) 0x000000 - rsvd2[5]
[ 2371.547974] xhci_hcd 0000:00:14.0: Slot Context:
[ 2371.547985] xhci_hcd 0000:00:14.0: @ffff880166fc3020 (virt) @166fc3020 (dma) 0x8300000 - dev_info
[ 2371.547997] xhci_hcd 0000:00:14.0: @ffff880166fc3024 (virt) @166fc3024 (dma) 0x020000 - dev_info2
[ 2371.548008] xhci_hcd 0000:00:14.0: @ffff880166fc3028 (virt) @166fc3028 (dma) 0x000000 - tt_info
[ 2371.548020] xhci_hcd 0000:00:14.0: @ffff880166fc302c (virt) @166fc302c (dma) 0x000000 - dev_state
[ 2371.548032] xhci_hcd 0000:00:14.0: @ffff880166fc3030 (virt) @166fc3030 (dma) 0x000000 - rsvd[0]
[ 2371.548133] xhci_hcd 0000:00:14.0: @ffff880166fc3034 (virt) @166fc3034 (dma) 0x000000 - rsvd[1]
[ 2371.548165] xhci_hcd 0000:00:14.0: @ffff880166fc3038 (virt) @166fc3038 (dma) 0x000000 - rsvd[2]
[ 2371.548202] xhci_hcd 0000:00:14.0: @ffff880166fc303c (virt) @166fc303c (dma) 0x000000 - rsvd[3]
[ 2371.548230] xhci_hcd 0000:00:14.0: IN Endpoint 00 Context (ep_index 00):
[ 2371.548248] xhci_hcd 0000:00:14.0: @ffff880166fc3040 (virt) @166fc3040 (dma) 0x000000 - ep_info
[ 2371.548260] xhci_hcd 0000:00:14.0: @ffff880166fc3044 (virt) @166fc3044 (dma) 0x400026 - ep_info2
[ 2371.548272] xhci_hcd 0000:00:14.0: @ffff880166fc3048 (virt) @166fc3048 (dma) 0x1650e9031 - deq
[ 2371.548283] xhci_hcd 0000:00:14.0: @ffff880166fc3050 (virt) @166fc3050 (dma) 0x000000 - tx_info
[ 2371.548296] xhci_hcd 0000:00:14.0: @ffff880166fc3054 (virt) @166fc3054 (dma) 0x000000 - rsvd[0]
[ 2371.548308] xhci_hcd 0000:00:14.0: @ffff880166fc3058 (virt) @166fc3058 (dma) 0x000000 - rsvd[1]
[ 2371.548320] xhci_hcd 0000:00:14.0: @ffff880166fc305c (virt) @166fc305c (dma) 0x000000 - rsvd[2]
[ 2371.548330] xhci_hcd 0000:00:14.0: OUT Endpoint 01 Context (ep_index 01):
[ 2371.548342] xhci_hcd 0000:00:14.0: @ffff880166fc3060 (virt) @166fc3060 (dma) 0x000000 - ep_info
[ 2371.548366] xhci_hcd 0000:00:14.0: @ffff880166fc3064 (virt) @166fc3064 (dma) 0x000000 - ep_info2
[ 2371.548378] xhci_hcd 0000:00:14.0: @ffff880166fc3068 (virt) @166fc3068 (dma) 0x000000 - deq
[ 2371.548389] xhci_hcd 0000:00:14.0: @ffff880166fc3070 (virt) @166fc3070 (dma) 0x000000 - tx_info
[ 2371.548401] xhci_hcd 0000:00:14.0: @ffff880166fc3074 (virt) @166fc3074 (dma) 0x000000 - rsvd[0]
[ 2371.548413] xhci_hcd 0000:00:14.0: @ffff880166fc3078 (virt) @166fc3078 (dma) 0x000000 - rsvd[1]
[ 2371.548425] xhci_hcd 0000:00:14.0: @ffff880166fc307c (virt) @166fc307c (dma) 0x000000 - rsvd[2]
[ 2371.548436] xhci_hcd 0000:00:14.0: IN Endpoint 01 Context (ep_index 02):
[ 2371.548447] xhci_hcd 0000:00:14.0: @ffff880166fc3080 (virt) @166fc3080 (dma) 0x000000 - ep_info
[ 2371.548458] xhci_hcd 0000:00:14.0: @ffff880166fc3084 (virt) @166fc3084 (dma) 0x000000 - ep_info2
[ 2371.548470] xhci_hcd 0000:00:14.0: @ffff880166fc3088 (virt) @166fc3088 (dma) 0x000000 - deq
[ 2371.548481] xhci_hcd 0000:00:14.0: @ffff880166fc3090 (virt) @166fc3090 (dma) 0x000000 - tx_info
[ 2371.548493] xhci_hcd 0000:00:14.0: @ffff880166fc3094 (virt) @166fc3094 (dma) 0x000000 - rsvd[0]
[ 2371.548505] xhci_hcd 0000:00:14.0: @ffff880166fc3098 (virt) @166fc3098 (dma) 0x000000 - rsvd[1]
[ 2371.548517] xhci_hcd 0000:00:14.0: @ffff880166fc309c (virt) @166fc309c (dma) 0x000000 - rsvd[2]
[ 2371.548527] xhci_hcd 0000:00:14.0: Slot ID 14 Output Context:
[ 2371.548535] xhci_hcd 0000:00:14.0: Slot Context:
[ 2371.548547] xhci_hcd 0000:00:14.0: @ffff880177e2c000 (virt) @177e2c000 (dma) 0x8300000 - dev_info
[ 2371.548559] xhci_hcd 0000:00:14.0: @ffff880177e2c004 (virt) @177e2c004 (dma) 0x020000 - dev_info2
[ 2371.548570] xhci_hcd 0000:00:14.0: @ffff880177e2c008 (virt) @177e2c008 (dma) 0x000000 - tt_info
[ 2371.548583] xhci_hcd 0000:00:14.0: @ffff880177e2c00c (virt) @177e2c00c (dma) 0x1000000e - dev_state
[ 2371.548595] xhci_hcd 0000:00:14.0: @ffff880177e2c010 (virt) @177e2c010 (dma) 0x000000 - rsvd[0]
[ 2371.548607] xhci_hcd 0000:00:14.0: @ffff880177e2c014 (virt) @177e2c014 (dma) 0x000000 - rsvd[1]
[ 2371.548619] xhci_hcd 0000:00:14.0: @ffff880177e2c018 (virt) @177e2c018 (dma) 0x000000 - rsvd[2]
[ 2371.548631] xhci_hcd 0000:00:14.0: @ffff880177e2c01c (virt) @177e2c01c (dma) 0x000000 - rsvd[3]
[ 2371.548641] xhci_hcd 0000:00:14.0: IN Endpoint 00 Context (ep_index 00):
[ 2371.548653] xhci_hcd 0000:00:14.0: @ffff880177e2c020 (virt) @177e2c020 (dma) 0x000001 - ep_info
[ 2371.548666] xhci_hcd 0000:00:14.0: @ffff880177e2c024 (virt) @177e2c024 (dma) 0x400026 - ep_info2
[ 2371.548678] xhci_hcd 0000:00:14.0: @ffff880177e2c028 (virt) @177e2c028 (dma) 0x1650e9031 - deq
[ 2371.548689] xhci_hcd 0000:00:14.0: @ffff880177e2c030 (virt) @177e2c030 (dma) 0x000000 - tx_info
[ 2371.548701] xhci_hcd 0000:00:14.0: @ffff880177e2c034 (virt) @177e2c034 (dma) 0x000000 - rsvd[0]
[ 2371.548713] xhci_hcd 0000:00:14.0: @ffff880177e2c038 (virt) @177e2c038 (dma) 0x000000 - rsvd[1]
[ 2371.548725] xhci_hcd 0000:00:14.0: @ffff880177e2c03c (virt) @177e2c03c (dma) 0x000000 - rsvd[2]
[ 2371.548736] xhci_hcd 0000:00:14.0: OUT Endpoint 01 Context (ep_index 01):
[ 2371.548747] xhci_hcd 0000:00:14.0: @ffff880177e2c040 (virt) @177e2c040 (dma) 0x000000 - ep_info
[ 2371.548759] xhci_hcd 0000:00:14.0: @ffff880177e2c044 (virt) @177e2c044 (dma) 0x000000 - ep_info2
[ 2371.548770] xhci_hcd 0000:00:14.0: @ffff880177e2c048 (virt) @177e2c048 (dma) 0x000000 - deq
[ 2371.548804] xhci_hcd 0000:00:14.0: @ffff880177e2c050 (virt) @177e2c050 (dma) 0x000000 - tx_info
[ 2371.548840] xhci_hcd 0000:00:14.0: @ffff880177e2c054 (virt) @177e2c054 (dma) 0x000000 - rsvd[0]
[ 2371.548870] xhci_hcd 0000:00:14.0: @ffff880177e2c058 (virt) @177e2c058 (dma) 0x000000 - rsvd[1]
[ 2371.548890] xhci_hcd 0000:00:14.0: @ffff880177e2c05c (virt) @177e2c05c (dma) 0x000000 - rsvd[2]
[ 2371.548901] xhci_hcd 0000:00:14.0: IN Endpoint 01 Context (ep_index 02):
[ 2371.548912] xhci_hcd 0000:00:14.0: @ffff880177e2c060 (virt) @177e2c060 (dma) 0x000000 - ep_info
[ 2371.548923] xhci_hcd 0000:00:14.0: @ffff880177e2c064 (virt) @177e2c064 (dma) 0x000000 - ep_info2
[ 2371.548935] xhci_hcd 0000:00:14.0: @ffff880177e2c068 (virt) @177e2c068 (dma) 0x000000 - deq
[ 2371.548946] xhci_hcd 0000:00:14.0: @ffff880177e2c070 (virt) @177e2c070 (dma) 0x000000 - tx_info
[ 2371.548958] xhci_hcd 0000:00:14.0: @ffff880177e2c074 (virt) @177e2c074 (dma) 0x000000 - rsvd[0]
[ 2371.548970] xhci_hcd 0000:00:14.0: @ffff880177e2c078 (virt) @177e2c078 (dma) 0x000000 - rsvd[1]
[ 2371.548982] xhci_hcd 0000:00:14.0: @ffff880177e2c07c (virt) @177e2c07c (dma) 0x000000 - rsvd[2]
[ 2371.548992] xhci_hcd 0000:00:14.0: Internal device address = 14
[ 2371.549011] xhci_hcd 0000:00:14.0: Endpoint 0x0 ep reset callback called
[ 2371.560696] xhci_hcd 0000:00:14.0: Waiting for status stage event
[ 2371.560857] xhci_hcd 0000:00:14.0: Waiting for status stage event
[ 2371.560992] xhci_hcd 0000:00:14.0: Waiting for status stage event
[ 2371.561197] xhci_hcd 0000:00:14.0: add ep 0x2, slot id 14, new drop flags = 0x0, new add flags = 0x10
[ 2371.561204] xhci_hcd 0000:00:14.0: add ep 0x4, slot id 14, new drop flags = 0x0, new add flags = 0x110
[ 2371.561211] xhci_hcd 0000:00:14.0: add ep 0x86, slot id 14, new drop flags = 0x0, new add flags = 0x2110
[ 2371.561217] xhci_hcd 0000:00:14.0: add ep 0x88, slot id 14, new drop flags = 0x0, new add flags = 0x22110
[ 2371.561220] xhci_hcd 0000:00:14.0: xhci_check_bandwidth called for udev ffff880166f0f800
[ 2371.561223] xhci_hcd 0000:00:14.0: New Input Control Context:
[ 2371.561226] xhci_hcd 0000:00:14.0: @ffff880166fc3000 (virt) @166fc3000 (dma) 0x000000 - drop flags
[ 2371.561229] xhci_hcd 0000:00:14.0: @ffff880166fc3004 (virt) @166fc3004 (dma) 0x022111 - add flags
[ 2371.561231] xhci_hcd 0000:00:14.0: @ffff880166fc3008 (virt) @166fc3008 (dma) 0x000000 - rsvd2[0]
[ 2371.561234] xhci_hcd 0000:00:14.0: @ffff880166fc300c (virt) @166fc300c (dma) 0x000000 - rsvd2[1]
[ 2371.561236] xhci_hcd 0000:00:14.0: @ffff880166fc3010 (virt) @166fc3010 (dma) 0x000000 - rsvd2[2]
[ 2371.561239] xhci_hcd 0000:00:14.0: @ffff880166fc3014 (virt) @166fc3014 (dma) 0x000000 - rsvd2[3]
[ 2371.561241] xhci_hcd 0000:00:14.0: @ffff880166fc3018 (virt) @166fc3018 (dma) 0x000000 - rsvd2[4]
[ 2371.561243] xhci_hcd 0000:00:14.0: @ffff880166fc301c (virt) @166fc301c (dma) 0x000000 - rsvd2[5]
[ 2371.561246] xhci_hcd 0000:00:14.0: Slot Context:
[ 2371.561249] xhci_hcd 0000:00:14.0: @ffff880166fc3020 (virt) @166fc3020 (dma) 0x88300000 - dev_info
[ 2371.561260] xhci_hcd 0000:00:14.0: @ffff880166fc3024 (virt) @166fc3024 (dma) 0x020000 - dev_info2
[ 2371.561269] xhci_hcd 0000:00:14.0: @ffff880166fc3028 (virt) @166fc3028 (dma) 0x000000 - tt_info
[ 2371.561279] xhci_hcd 0000:00:14.0: @ffff880166fc302c (virt) @166fc302c (dma) 0x000000 - dev_state
[ 2371.561286] xhci_hcd 0000:00:14.0: @ffff880166fc3030 (virt) @166fc3030 (dma) 0x000000 - rsvd[0]
[ 2371.561288] xhci_hcd 0000:00:14.0: @ffff880166fc3034 (virt) @166fc3034 (dma) 0x000000 - rsvd[1]
[ 2371.561291] xhci_hcd 0000:00:14.0: @ffff880166fc3038 (virt) @166fc3038 (dma) 0x000000 - rsvd[2]
[ 2371.561293] xhci_hcd 0000:00:14.0: @ffff880166fc303c (virt) @166fc303c (dma) 0x000000 - rsvd[3]
[ 2371.561295] xhci_hcd 0000:00:14.0: IN Endpoint 00 Context (ep_index 00):
[ 2371.561298] xhci_hcd 0000:00:14.0: @ffff880166fc3040 (virt) @166fc3040 (dma) 0x000000 - ep_info
[ 2371.561300] xhci_hcd 0000:00:14.0: @ffff880166fc3044 (virt) @166fc3044 (dma) 0x400026 - ep_info2
[ 2371.561303] xhci_hcd 0000:00:14.0: @ffff880166fc3048 (virt) @166fc3048 (dma) 0x1650e9031 - deq
[ 2371.561305] xhci_hcd 0000:00:14.0: @ffff880166fc3050 (virt) @166fc3050 (dma) 0x000000 - tx_info
[ 2371.561307] xhci_hcd 0000:00:14.0: @ffff880166fc3054 (virt) @166fc3054 (dma) 0x000000 - rsvd[0]
[ 2371.561310] xhci_hcd 0000:00:14.0: @ffff880166fc3058 (virt) @166fc3058 (dma) 0x000000 - rsvd[1]
[ 2371.561312] xhci_hcd 0000:00:14.0: @ffff880166fc305c (virt) @166fc305c (dma) 0x000000 - rsvd[2]
[ 2371.561315] xhci_hcd 0000:00:14.0: OUT Endpoint 01 Context (ep_index 01):
[ 2371.561317] xhci_hcd 0000:00:14.0: @ffff880166fc3060 (virt) @166fc3060 (dma) 0x000000 - ep_info
[ 2371.561319] xhci_hcd 0000:00:14.0: @ffff880166fc3064 (virt) @166fc3064 (dma) 0x000000 - ep_info2
[ 2371.561321] xhci_hcd 0000:00:14.0: @ffff880166fc3068 (virt) @166fc3068 (dma) 0x000000 - deq
[ 2371.561324] xhci_hcd 0000:00:14.0: @ffff880166fc3070 (virt) @166fc3070 (dma) 0x000000 - tx_info
[ 2371.561326] xhci_hcd 0000:00:14.0: @ffff880166fc3074 (virt) @166fc3074 (dma) 0x000000 - rsvd[0]
[ 2371.561328] xhci_hcd 0000:00:14.0: @ffff880166fc3078 (virt) @166fc3078 (dma) 0x000000 - rsvd[1]
[ 2371.561331] xhci_hcd 0000:00:14.0: @ffff880166fc307c (virt) @166fc307c (dma) 0x000000 - rsvd[2]
[ 2371.561333] xhci_hcd 0000:00:14.0: IN Endpoint 01 Context (ep_index 02):
[ 2371.561336] xhci_hcd 0000:00:14.0: @ffff880166fc3080 (virt) @166fc3080 (dma) 0x000000 - ep_info
[ 2371.561338] xhci_hcd 0000:00:14.0: @ffff880166fc3084 (virt) @166fc3084 (dma) 0x000000 - ep_info2
[ 2371.561340] xhci_hcd 0000:00:14.0: @ffff880166fc3088 (virt) @166fc3088 (dma) 0x000000 - deq
[ 2371.561342] xhci_hcd 0000:00:14.0: @ffff880166fc3090 (virt) @166fc3090 (dma) 0x000000 - tx_info
[ 2371.561345] xhci_hcd 0000:00:14.0: @ffff880166fc3094 (virt) @166fc3094 (dma) 0x000000 - rsvd[0]
[ 2371.561347] xhci_hcd 0000:00:14.0: @ffff880166fc3098 (virt) @166fc3098 (dma) 0x000000 - rsvd[1]
[ 2371.561350] xhci_hcd 0000:00:14.0: @ffff880166fc309c (virt) @166fc309c (dma) 0x000000 - rsvd[2]
[ 2371.561352] xhci_hcd 0000:00:14.0: OUT Endpoint 02 Context (ep_index 03):
[ 2371.561354] xhci_hcd 0000:00:14.0: @ffff880166fc30a0 (virt) @166fc30a0 (dma) 0x000000 - ep_info
[ 2371.561356] xhci_hcd 0000:00:14.0: @ffff880166fc30a4 (virt) @166fc30a4 (dma) 0x2000016 - ep_info2
[ 2371.561359] xhci_hcd 0000:00:14.0: @ffff880166fc30a8 (virt) @166fc30a8 (dma) 0x166fde001 - deq
[ 2371.561361] xhci_hcd 0000:00:14.0: @ffff880166fc30b0 (virt) @166fc30b0 (dma) 0x000000 - tx_info
[ 2371.561363] xhci_hcd 0000:00:14.0: @ffff880166fc30b4 (virt) @166fc30b4 (dma) 0x000000 - rsvd[0]
[ 2371.561366] xhci_hcd 0000:00:14.0: @ffff880166fc30b8 (virt) @166fc30b8 (dma) 0x000000 - rsvd[1]
[ 2371.561368] xhci_hcd 0000:00:14.0: @ffff880166fc30bc (virt) @166fc30bc (dma) 0x000000 - rsvd[2]
[ 2371.561370] xhci_hcd 0000:00:14.0: IN Endpoint 02 Context (ep_index 04):
[ 2371.561373] xhci_hcd 0000:00:14.0: @ffff880166fc30c0 (virt) @166fc30c0 (dma) 0x000000 - ep_info
[ 2371.561375] xhci_hcd 0000:00:14.0: @ffff880166fc30c4 (virt) @166fc30c4 (dma) 0x000000 - ep_info2
[ 2371.561378] xhci_hcd 0000:00:14.0: @ffff880166fc30c8 (virt) @166fc30c8 (dma) 0x000000 - deq
[ 2371.561380] xhci_hcd 0000:00:14.0: @ffff880166fc30d0 (virt) @166fc30d0 (dma) 0x000000 - tx_info
[ 2371.561385] xhci_hcd 0000:00:14.0: @ffff880166fc30d4 (virt) @166fc30d4 (dma) 0x000000 - rsvd[0]
[ 2371.561387] xhci_hcd 0000:00:14.0: @ffff880166fc30d8 (virt) @166fc30d8 (dma) 0x000000 - rsvd[1]
[ 2371.561390] xhci_hcd 0000:00:14.0: @ffff880166fc30dc (virt) @166fc30dc (dma) 0x000000 - rsvd[2]
[ 2371.561392] xhci_hcd 0000:00:14.0: OUT Endpoint 03 Context (ep_index 05):
[ 2371.561394] xhci_hcd 0000:00:14.0: @ffff880166fc30e0 (virt) @166fc30e0 (dma) 0x000000 - ep_info
[ 2371.561396] xhci_hcd 0000:00:14.0: @ffff880166fc30e4 (virt) @166fc30e4 (dma) 0x000000 - ep_info2
[ 2371.561399] xhci_hcd 0000:00:14.0: @ffff880166fc30e8 (virt) @166fc30e8 (dma) 0x000000 - deq
[ 2371.561401] xhci_hcd 0000:00:14.0: @ffff880166fc30f0 (virt) @166fc30f0 (dma) 0x000000 - tx_info
[ 2371.561403] xhci_hcd 0000:00:14.0: @ffff880166fc30f4 (virt) @166fc30f4 (dma) 0x000000 - rsvd[0]
[ 2371.561406] xhci_hcd 0000:00:14.0: @ffff880166fc30f8 (virt) @166fc30f8 (dma) 0x000000 - rsvd[1]
[ 2371.561408] xhci_hcd 0000:00:14.0: @ffff880166fc30fc (virt) @166fc30fc (dma) 0x000000 - rsvd[2]
[ 2371.561410] xhci_hcd 0000:00:14.0: IN Endpoint 03 Context (ep_index 06):
[ 2371.561413] xhci_hcd 0000:00:14.0: @ffff880166fc3100 (virt) @166fc3100 (dma) 0x000000 - ep_info
[ 2371.561426] xhci_hcd 0000:00:14.0: @ffff880166fc3104 (virt) @166fc3104 (dma) 0x000000 - ep_info2
[ 2371.561435] xhci_hcd 0000:00:14.0: @ffff880166fc3108 (virt) @166fc3108 (dma) 0x000000 - deq
[ 2371.561444] xhci_hcd 0000:00:14.0: @ffff880166fc3110 (virt) @166fc3110 (dma) 0x000000 - tx_info
[ 2371.561449] xhci_hcd 0000:00:14.0: @ffff880166fc3114 (virt) @166fc3114 (dma) 0x000000 - rsvd[0]
[ 2371.561452] xhci_hcd 0000:00:14.0: @ffff880166fc3118 (virt) @166fc3118 (dma) 0x000000 - rsvd[1]
[ 2371.561454] xhci_hcd 0000:00:14.0: @ffff880166fc311c (virt) @166fc311c (dma) 0x000000 - rsvd[2]
[ 2371.561456] xhci_hcd 0000:00:14.0: OUT Endpoint 04 Context (ep_index 07):
[ 2371.561458] xhci_hcd 0000:00:14.0: @ffff880166fc3120 (virt) @166fc3120 (dma) 0x000000 - ep_info
[ 2371.561461] xhci_hcd 0000:00:14.0: @ffff880166fc3124 (virt) @166fc3124 (dma) 0x2000016 - ep_info2
[ 2371.561463] xhci_hcd 0000:00:14.0: @ffff880166fc3128 (virt) @166fc3128 (dma) 0x166ea9001 - deq
[ 2371.561465] xhci_hcd 0000:00:14.0: @ffff880166fc3130 (virt) @166fc3130 (dma) 0x000000 - tx_info
[ 2371.561468] xhci_hcd 0000:00:14.0: @ffff880166fc3134 (virt) @166fc3134 (dma) 0x000000 - rsvd[0]
[ 2371.561470] xhci_hcd 0000:00:14.0: @ffff880166fc3138 (virt) @166fc3138 (dma) 0x000000 - rsvd[1]
[ 2371.561473] xhci_hcd 0000:00:14.0: @ffff880166fc313c (virt) @166fc313c (dma) 0x000000 - rsvd[2]
[ 2371.561475] xhci_hcd 0000:00:14.0: IN Endpoint 04 Context (ep_index 08):
[ 2371.561477] xhci_hcd 0000:00:14.0: @ffff880166fc3140 (virt) @166fc3140 (dma) 0x000000 - ep_info
[ 2371.561479] xhci_hcd 0000:00:14.0: @ffff880166fc3144 (virt) @166fc3144 (dma) 0x000000 - ep_info2
[ 2371.561482] xhci_hcd 0000:00:14.0: @ffff880166fc3148 (virt) @166fc3148 (dma) 0x000000 - deq
[ 2371.561484] xhci_hcd 0000:00:14.0: @ffff880166fc3150 (virt) @166fc3150 (dma) 0x000000 - tx_info
[ 2371.561486] xhci_hcd 0000:00:14.0: @ffff880166fc3154 (virt) @166fc3154 (dma) 0x000000 - rsvd[0]
[ 2371.561489] xhci_hcd 0000:00:14.0: @ffff880166fc3158 (virt) @166fc3158 (dma) 0x000000 - rsvd[1]
[ 2371.561491] xhci_hcd 0000:00:14.0: @ffff880166fc315c (virt) @166fc315c (dma) 0x000000 - rsvd[2]
[ 2371.561493] xhci_hcd 0000:00:14.0: OUT Endpoint 05 Context (ep_index 09):
[ 2371.561495] xhci_hcd 0000:00:14.0: @ffff880166fc3160 (virt) @166fc3160 (dma) 0x000000 - ep_info
[ 2371.561498] xhci_hcd 0000:00:14.0: @ffff880166fc3164 (virt) @166fc3164 (dma) 0x000000 - ep_info2
[ 2371.561500] xhci_hcd 0000:00:14.0: @ffff880166fc3168 (virt) @166fc3168 (dma) 0x000000 - deq
[ 2371.561502] xhci_hcd 0000:00:14.0: @ffff880166fc3170 (virt) @166fc3170 (dma) 0x000000 - tx_info
[ 2371.561505] xhci_hcd 0000:00:14.0: @ffff880166fc3174 (virt) @166fc3174 (dma) 0x000000 - rsvd[0]
[ 2371.561507] xhci_hcd 0000:00:14.0: @ffff880166fc3178 (virt) @166fc3178 (dma) 0x000000 - rsvd[1]
[ 2371.561509] xhci_hcd 0000:00:14.0: @ffff880166fc317c (virt) @166fc317c (dma) 0x000000 - rsvd[2]
[ 2371.561512] xhci_hcd 0000:00:14.0: IN Endpoint 05 Context (ep_index 10):
[ 2371.561514] xhci_hcd 0000:00:14.0: @ffff880166fc3180 (virt) @166fc3180 (dma) 0x000000 - ep_info
[ 2371.561516] xhci_hcd 0000:00:14.0: @ffff880166fc3184 (virt) @166fc3184 (dma) 0x000000 - ep_info2
[ 2371.561518] xhci_hcd 0000:00:14.0: @ffff880166fc3188 (virt) @166fc3188 (dma) 0x000000 - deq
[ 2371.561521] xhci_hcd 0000:00:14.0: @ffff880166fc3190 (virt) @166fc3190 (dma) 0x000000 - tx_info
[ 2371.561523] xhci_hcd 0000:00:14.0: @ffff880166fc3194 (virt) @166fc3194 (dma) 0x000000 - rsvd[0]
[ 2371.561525] xhci_hcd 0000:00:14.0: @ffff880166fc3198 (virt) @166fc3198 (dma) 0x000000 - rsvd[1]
[ 2371.561528] xhci_hcd 0000:00:14.0: @ffff880166fc319c (virt) @166fc319c (dma) 0x000000 - rsvd[2]
[ 2371.561530] xhci_hcd 0000:00:14.0: OUT Endpoint 06 Context (ep_index 11):
[ 2371.561532] xhci_hcd 0000:00:14.0: @ffff880166fc31a0 (virt) @166fc31a0 (dma) 0x000000 - ep_info
[ 2371.561535] xhci_hcd 0000:00:14.0: @ffff880166fc31a4 (virt) @166fc31a4 (dma) 0x000000 - ep_info2
[ 2371.561537] xhci_hcd 0000:00:14.0: @ffff880166fc31a8 (virt) @166fc31a8 (dma) 0x000000 - deq
[ 2371.561539] xhci_hcd 0000:00:14.0: @ffff880166fc31b0 (virt) @166fc31b0 (dma) 0x000000 - tx_info
[ 2371.561542] xhci_hcd 0000:00:14.0: @ffff880166fc31b4 (virt) @166fc31b4 (dma) 0x000000 - rsvd[0]
[ 2371.561544] xhci_hcd 0000:00:14.0: @ffff880166fc31b8 (virt) @166fc31b8 (dma) 0x000000 - rsvd[1]
[ 2371.561546] xhci_hcd 0000:00:14.0: @ffff880166fc31bc (virt) @166fc31bc (dma) 0x000000 - rsvd[2]
[ 2371.561549] xhci_hcd 0000:00:14.0: IN Endpoint 06 Context (ep_index 12):
[ 2371.561551] xhci_hcd 0000:00:14.0: @ffff880166fc31c0 (virt) @166fc31c0 (dma) 0x000000 - ep_info
[ 2371.561553] xhci_hcd 0000:00:14.0: @ffff880166fc31c4 (virt) @166fc31c4 (dma) 0x2000036 - ep_info2
[ 2371.561555] xhci_hcd 0000:00:14.0: @ffff880166fc31c8 (virt) @166fc31c8 (dma) 0x166e07001 - deq
[ 2371.561558] xhci_hcd 0000:00:14.0: @ffff880166fc31d0 (virt) @166fc31d0 (dma) 0x000000 - tx_info
[ 2371.561560] xhci_hcd 0000:00:14.0: @ffff880166fc31d4 (virt) @166fc31d4 (dma) 0x000000 - rsvd[0]
[ 2371.561562] xhci_hcd 0000:00:14.0: @ffff880166fc31d8 (virt) @166fc31d8 (dma) 0x000000 - rsvd[1]
[ 2371.561565] xhci_hcd 0000:00:14.0: @ffff880166fc31dc (virt) @166fc31dc (dma) 0x000000 - rsvd[2]
[ 2371.561567] xhci_hcd 0000:00:14.0: OUT Endpoint 07 Context (ep_index 13):
[ 2371.561569] xhci_hcd 0000:00:14.0: @ffff880166fc31e0 (virt) @166fc31e0 (dma) 0x000000 - ep_info
[ 2371.561572] xhci_hcd 0000:00:14.0: @ffff880166fc31e4 (virt) @166fc31e4 (dma) 0x000000 - ep_info2
[ 2371.561574] xhci_hcd 0000:00:14.0: @ffff880166fc31e8 (virt) @166fc31e8 (dma) 0x000000 - deq
[ 2371.561576] xhci_hcd 0000:00:14.0: @ffff880166fc31f0 (virt) @166fc31f0 (dma) 0x000000 - tx_info
[ 2371.561578] xhci_hcd 0000:00:14.0: @ffff880166fc31f4 (virt) @166fc31f4 (dma) 0x000000 - rsvd[0]
[ 2371.561581] xhci_hcd 0000:00:14.0: @ffff880166fc31f8 (virt) @166fc31f8 (dma) 0x000000 - rsvd[1]
[ 2371.561584] xhci_hcd 0000:00:14.0: @ffff880166fc31fc (virt) @166fc31fc (dma) 0x000000 - rsvd[2]
[ 2371.561597] xhci_hcd 0000:00:14.0: IN Endpoint 07 Context (ep_index 14):
[ 2371.561608] xhci_hcd 0000:00:14.0: @ffff880166fc3200 (virt) @166fc3200 (dma) 0x000000 - ep_info
[ 2371.561618] xhci_hcd 0000:00:14.0: @ffff880166fc3204 (virt) @166fc3204 (dma) 0x000000 - ep_info2
[ 2371.561620] xhci_hcd 0000:00:14.0: @ffff880166fc3208 (virt) @166fc3208 (dma) 0x000000 - deq
[ 2371.561622] xhci_hcd 0000:00:14.0: @ffff880166fc3210 (virt) @166fc3210 (dma) 0x000000 - tx_info
[ 2371.561625] xhci_hcd 0000:00:14.0: @ffff880166fc3214 (virt) @166fc3214 (dma) 0x000000 - rsvd[0]
[ 2371.561627] xhci_hcd 0000:00:14.0: @ffff880166fc3218 (virt) @166fc3218 (dma) 0x000000 - rsvd[1]
[ 2371.561630] xhci_hcd 0000:00:14.0: @ffff880166fc321c (virt) @166fc321c (dma) 0x000000 - rsvd[2]
[ 2371.561632] xhci_hcd 0000:00:14.0: OUT Endpoint 08 Context (ep_index 15):
[ 2371.561634] xhci_hcd 0000:00:14.0: @ffff880166fc3220 (virt) @166fc3220 (dma) 0x000000 - ep_info
[ 2371.561636] xhci_hcd 0000:00:14.0: @ffff880166fc3224 (virt) @166fc3224 (dma) 0x000000 - ep_info2
[ 2371.561639] xhci_hcd 0000:00:14.0: @ffff880166fc3228 (virt) @166fc3228 (dma) 0x000000 - deq
[ 2371.561641] xhci_hcd 0000:00:14.0: @ffff880166fc3230 (virt) @166fc3230 (dma) 0x000000 - tx_info
[ 2371.561643] xhci_hcd 0000:00:14.0: @ffff880166fc3234 (virt) @166fc3234 (dma) 0x000000 - rsvd[0]
[ 2371.561646] xhci_hcd 0000:00:14.0: @ffff880166fc3238 (virt) @166fc3238 (dma) 0x000000 - rsvd[1]
[ 2371.561648] xhci_hcd 0000:00:14.0: @ffff880166fc323c (virt) @166fc323c (dma) 0x000000 - rsvd[2]
[ 2371.561650] xhci_hcd 0000:00:14.0: IN Endpoint 08 Context (ep_index 16):
[ 2371.561653] xhci_hcd 0000:00:14.0: @ffff880166fc3240 (virt) @166fc3240 (dma) 0x000000 - ep_info
[ 2371.561655] xhci_hcd 0000:00:14.0: @ffff880166fc3244 (virt) @166fc3244 (dma) 0x2000036 - ep_info2
[ 2371.561657] xhci_hcd 0000:00:14.0: @ffff880166fc3248 (virt) @166fc3248 (dma) 0x16ee77001 - deq
[ 2371.561659] xhci_hcd 0000:00:14.0: @ffff880166fc3250 (virt) @166fc3250 (dma) 0x000000 - tx_info
[ 2371.561662] xhci_hcd 0000:00:14.0: @ffff880166fc3254 (virt) @166fc3254 (dma) 0x000000 - rsvd[0]
[ 2371.561664] xhci_hcd 0000:00:14.0: @ffff880166fc3258 (virt) @166fc3258 (dma) 0x000000 - rsvd[1]
[ 2371.561667] xhci_hcd 0000:00:14.0: @ffff880166fc325c (virt) @166fc325c (dma) 0x000000 - rsvd[2]
[ 2371.561671] xhci_hcd 0000:00:14.0: // Ding dong!
[ 2371.561846] xhci_hcd 0000:00:14.0: Successful Endpoint Configure command
[ 2371.561849] xhci_hcd 0000:00:14.0: Output context after successful config ep cmd:
[ 2371.561851] xhci_hcd 0000:00:14.0: Slot Context:
[ 2371.561853] xhci_hcd 0000:00:14.0: @ffff880177e2c000 (virt) @177e2c000 (dma) 0x88300000 - dev_info
[ 2371.561856] xhci_hcd 0000:00:14.0: @ffff880177e2c004 (virt) @177e2c004 (dma) 0x020000 - dev_info2
[ 2371.561858] xhci_hcd 0000:00:14.0: @ffff880177e2c008 (virt) @177e2c008 (dma) 0x000000 - tt_info
[ 2371.561861] xhci_hcd 0000:00:14.0: @ffff880177e2c00c (virt) @177e2c00c (dma) 0x1800000e - dev_state
[ 2371.561863] xhci_hcd 0000:00:14.0: @ffff880177e2c010 (virt) @177e2c010 (dma) 0x000000 - rsvd[0]
[ 2371.561866] xhci_hcd 0000:00:14.0: @ffff880177e2c014 (virt) @177e2c014 (dma) 0x000000 - rsvd[1]
[ 2371.561868] xhci_hcd 0000:00:14.0: @ffff880177e2c018 (virt) @177e2c018 (dma) 0x000000 - rsvd[2]
[ 2371.561871] xhci_hcd 0000:00:14.0: @ffff880177e2c01c (virt) @177e2c01c (dma) 0x000000 - rsvd[3]
[ 2371.561873] xhci_hcd 0000:00:14.0: IN Endpoint 00 Context (ep_index 00):
[ 2371.561875] xhci_hcd 0000:00:14.0: @ffff880177e2c020 (virt) @177e2c020 (dma) 0x000001 - ep_info
[ 2371.561878] xhci_hcd 0000:00:14.0: @ffff880177e2c024 (virt) @177e2c024 (dma) 0x400026 - ep_info2
[ 2371.561880] xhci_hcd 0000:00:14.0: @ffff880177e2c028 (virt) @177e2c028 (dma) 0x1650e9031 - deq
[ 2371.561882] xhci_hcd 0000:00:14.0: @ffff880177e2c030 (virt) @177e2c030 (dma) 0x000000 - tx_info
[ 2371.561885] xhci_hcd 0000:00:14.0: @ffff880177e2c034 (virt) @177e2c034 (dma) 0x000000 - rsvd[0]
[ 2371.561887] xhci_hcd 0000:00:14.0: @ffff880177e2c038 (virt) @177e2c038 (dma) 0x000000 - rsvd[1]
[ 2371.561890] xhci_hcd 0000:00:14.0: @ffff880177e2c03c (virt) @177e2c03c (dma) 0x000000 - rsvd[2]
[ 2371.561892] xhci_hcd 0000:00:14.0: OUT Endpoint 01 Context (ep_index 01):
[ 2371.561894] xhci_hcd 0000:00:14.0: @ffff880177e2c040 (virt) @177e2c040 (dma) 0x000000 - ep_info
[ 2371.561922] xhci_hcd 0000:00:14.0: @ffff880177e2c044 (virt) @177e2c044 (dma) 0x000000 - ep_info2
[ 2371.561924] xhci_hcd 0000:00:14.0: @ffff880177e2c048 (virt) @177e2c048 (dma) 0x000000 - deq
[ 2371.561926] xhci_hcd 0000:00:14.0: @ffff880177e2c050 (virt) @177e2c050 (dma) 0x000000 - tx_info
[ 2371.561929] xhci_hcd 0000:00:14.0: @ffff880177e2c054 (virt) @177e2c054 (dma) 0x000000 - rsvd[0]
[ 2371.561931] xhci_hcd 0000:00:14.0: @ffff880177e2c058 (virt) @177e2c058 (dma) 0x000000 - rsvd[1]
[ 2371.561934] xhci_hcd 0000:00:14.0: @ffff880177e2c05c (virt) @177e2c05c (dma) 0x000000 - rsvd[2]
[ 2371.561936] xhci_hcd 0000:00:14.0: IN Endpoint 01 Context (ep_index 02):
[ 2371.561938] xhci_hcd 0000:00:14.0: @ffff880177e2c060 (virt) @177e2c060 (dma) 0x000000 - ep_info
[ 2371.561940] xhci_hcd 0000:00:14.0: @ffff880177e2c064 (virt) @177e2c064 (dma) 0x000000 - ep_info2
[ 2371.561943] xhci_hcd 0000:00:14.0: @ffff880177e2c068 (virt) @177e2c068 (dma) 0x000000 - deq
[ 2371.561945] xhci_hcd 0000:00:14.0: @ffff880177e2c070 (virt) @177e2c070 (dma) 0x000000 - tx_info
[ 2371.561947] xhci_hcd 0000:00:14.0: @ffff880177e2c074 (virt) @177e2c074 (dma) 0x000000 - rsvd[0]
[ 2371.561950] xhci_hcd 0000:00:14.0: @ffff880177e2c078 (virt) @177e2c078 (dma) 0x000000 - rsvd[1]
[ 2371.561952] xhci_hcd 0000:00:14.0: @ffff880177e2c07c (virt) @177e2c07c (dma) 0x000000 - rsvd[2]
[ 2371.561954] xhci_hcd 0000:00:14.0: OUT Endpoint 02 Context (ep_index 03):
[ 2371.561956] xhci_hcd 0000:00:14.0: @ffff880177e2c080 (virt) @177e2c080 (dma) 0x000001 - ep_info
[ 2371.561959] xhci_hcd 0000:00:14.0: @ffff880177e2c084 (virt) @177e2c084 (dma) 0x2000016 - ep_info2
[ 2371.561961] xhci_hcd 0000:00:14.0: @ffff880177e2c088 (virt) @177e2c088 (dma) 0x166fde001 - deq
[ 2371.561963] xhci_hcd 0000:00:14.0: @ffff880177e2c090 (virt) @177e2c090 (dma) 0x000000 - tx_info
[ 2371.561966] xhci_hcd 0000:00:14.0: @ffff880177e2c094 (virt) @177e2c094 (dma) 0x000000 - rsvd[0]
[ 2371.561968] xhci_hcd 0000:00:14.0: @ffff880177e2c098 (virt) @177e2c098 (dma) 0x000000 - rsvd[1]
[ 2371.561970] xhci_hcd 0000:00:14.0: @ffff880177e2c09c (virt) @177e2c09c (dma) 0x000000 - rsvd[2]
[ 2371.561973] xhci_hcd 0000:00:14.0: IN Endpoint 02 Context (ep_index 04):
[ 2371.561975] xhci_hcd 0000:00:14.0: @ffff880177e2c0a0 (virt) @177e2c0a0 (dma) 0x000000 - ep_info
[ 2371.561980] xhci_hcd 0000:00:14.0: @ffff880177e2c0a4 (virt) @177e2c0a4 (dma) 0x000000 - ep_info2
[ 2371.561983] xhci_hcd 0000:00:14.0: @ffff880177e2c0a8 (virt) @177e2c0a8 (dma) 0x000000 - deq
[ 2371.561985] xhci_hcd 0000:00:14.0: @ffff880177e2c0b0 (virt) @177e2c0b0 (dma) 0x000000 - tx_info
[ 2371.561987] xhci_hcd 0000:00:14.0: @ffff880177e2c0b4 (virt) @177e2c0b4 (dma) 0x000000 - rsvd[0]
[ 2371.561990] xhci_hcd 0000:00:14.0: @ffff880177e2c0b8 (virt) @177e2c0b8 (dma) 0x000000 - rsvd[1]
[ 2371.561992] xhci_hcd 0000:00:14.0: @ffff880177e2c0bc (virt) @177e2c0bc (dma) 0x000000 - rsvd[2]
[ 2371.561994] xhci_hcd 0000:00:14.0: OUT Endpoint 03 Context (ep_index 05):
[ 2371.561996] xhci_hcd 0000:00:14.0: @ffff880177e2c0c0 (virt) @177e2c0c0 (dma) 0x000000 - ep_info
[ 2371.561999] xhci_hcd 0000:00:14.0: @ffff880177e2c0c4 (virt) @177e2c0c4 (dma) 0x000000 - ep_info2
[ 2371.562001] xhci_hcd 0000:00:14.0: @ffff880177e2c0c8 (virt) @177e2c0c8 (dma) 0x000000 - deq
[ 2371.562003] xhci_hcd 0000:00:14.0: @ffff880177e2c0d0 (virt) @177e2c0d0 (dma) 0x000000 - tx_info
[ 2371.562006] xhci_hcd 0000:00:14.0: @ffff880177e2c0d4 (virt) @177e2c0d4 (dma) 0x000000 - rsvd[0]
[ 2371.562008] xhci_hcd 0000:00:14.0: @ffff880177e2c0d8 (virt) @177e2c0d8 (dma) 0x000000 - rsvd[1]
[ 2371.562010] xhci_hcd 0000:00:14.0: @ffff880177e2c0dc (virt) @177e2c0dc (dma) 0x000000 - rsvd[2]
[ 2371.562012] xhci_hcd 0000:00:14.0: IN Endpoint 03 Context (ep_index 06):
[ 2371.562015] xhci_hcd 0000:00:14.0: @ffff880177e2c0e0 (virt) @177e2c0e0 (dma) 0x000000 - ep_info
[ 2371.562017] xhci_hcd 0000:00:14.0: @ffff880177e2c0e4 (virt) @177e2c0e4 (dma) 0x000000 - ep_info2
[ 2371.562019] xhci_hcd 0000:00:14.0: @ffff880177e2c0e8 (virt) @177e2c0e8 (dma) 0x000000 - deq
[ 2371.562022] xhci_hcd 0000:00:14.0: @ffff880177e2c0f0 (virt) @177e2c0f0 (dma) 0x000000 - tx_info
[ 2371.562024] xhci_hcd 0000:00:14.0: @ffff880177e2c0f4 (virt) @177e2c0f4 (dma) 0x000000 - rsvd[0]
[ 2371.562026] xhci_hcd 0000:00:14.0: @ffff880177e2c0f8 (virt) @177e2c0f8 (dma) 0x000000 - rsvd[1]
[ 2371.562048] xhci_hcd 0000:00:14.0: @ffff880177e2c0fc (virt) @177e2c0fc (dma) 0x000000 - rsvd[2]
[ 2371.562051] xhci_hcd 0000:00:14.0: OUT Endpoint 04 Context (ep_index 07):
[ 2371.562053] xhci_hcd 0000:00:14.0: @ffff880177e2c100 (virt) @177e2c100 (dma) 0x000001 - ep_info
[ 2371.562055] xhci_hcd 0000:00:14.0: @ffff880177e2c104 (virt) @177e2c104 (dma) 0x2000016 - ep_info2
[ 2371.562058] xhci_hcd 0000:00:14.0: @ffff880177e2c108 (virt) @177e2c108 (dma) 0x166ea9001 - deq
[ 2371.562060] xhci_hcd 0000:00:14.0: @ffff880177e2c110 (virt) @177e2c110 (dma) 0x000000 - tx_info
[ 2371.562062] xhci_hcd 0000:00:14.0: @ffff880177e2c114 (virt) @177e2c114 (dma) 0x000000 - rsvd[0]
[ 2371.562065] xhci_hcd 0000:00:14.0: @ffff880177e2c118 (virt) @177e2c118 (dma) 0x000000 - rsvd[1]
[ 2371.562067] xhci_hcd 0000:00:14.0: @ffff880177e2c11c (virt) @177e2c11c (dma) 0x000000 - rsvd[2]
[ 2371.562069] xhci_hcd 0000:00:14.0: IN Endpoint 04 Context (ep_index 08):
[ 2371.562072] xhci_hcd 0000:00:14.0: @ffff880177e2c120 (virt) @177e2c120 (dma) 0x000000 - ep_info
[ 2371.562074] xhci_hcd 0000:00:14.0: @ffff880177e2c124 (virt) @177e2c124 (dma) 0x000000 - ep_info2
[ 2371.562076] xhci_hcd 0000:00:14.0: @ffff880177e2c128 (virt) @177e2c128 (dma) 0x000000 - deq
[ 2371.562078] xhci_hcd 0000:00:14.0: @ffff880177e2c130 (virt) @177e2c130 (dma) 0x000000 - tx_info
[ 2371.562081] xhci_hcd 0000:00:14.0: @ffff880177e2c134 (virt) @177e2c134 (dma) 0x000000 - rsvd[0]
[ 2371.562083] xhci_hcd 0000:00:14.0: @ffff880177e2c138 (virt) @177e2c138 (dma) 0x000000 - rsvd[1]
[ 2371.562086] xhci_hcd 0000:00:14.0: @ffff880177e2c13c (virt) @177e2c13c (dma) 0x000000 - rsvd[2]
[ 2371.562088] xhci_hcd 0000:00:14.0: OUT Endpoint 05 Context (ep_index 09):
[ 2371.562090] xhci_hcd 0000:00:14.0: @ffff880177e2c140 (virt) @177e2c140 (dma) 0x000000 - ep_info
[ 2371.562092] xhci_hcd 0000:00:14.0: @ffff880177e2c144 (virt) @177e2c144 (dma) 0x000000 - ep_info2
[ 2371.562095] xhci_hcd 0000:00:14.0: @ffff880177e2c148 (virt) @177e2c148 (dma) 0x000000 - deq
[ 2371.562097] xhci_hcd 0000:00:14.0: @ffff880177e2c150 (virt) @177e2c150 (dma) 0x000000 - tx_info
[ 2371.562099] xhci_hcd 0000:00:14.0: @ffff880177e2c154 (virt) @177e2c154 (dma) 0x000000 - rsvd[0]
[ 2371.562111] xhci_hcd 0000:00:14.0: @ffff880177e2c158 (virt) @177e2c158 (dma) 0x000000 - rsvd[1]
[ 2371.562122] xhci_hcd 0000:00:14.0: @ffff880177e2c15c (virt) @177e2c15c (dma) 0x000000 - rsvd[2]
[ 2371.562134] xhci_hcd 0000:00:14.0: IN Endpoint 05 Context (ep_index 10):
[ 2371.562136] xhci_hcd 0000:00:14.0: @ffff880177e2c160 (virt) @177e2c160 (dma) 0x000000 - ep_info
[ 2371.562139] xhci_hcd 0000:00:14.0: @ffff880177e2c164 (virt) @177e2c164 (dma) 0x000000 - ep_info2
[ 2371.562141] xhci_hcd 0000:00:14.0: @ffff880177e2c168 (virt) @177e2c168 (dma) 0x000000 - deq
[ 2371.562143] xhci_hcd 0000:00:14.0: @ffff880177e2c170 (virt) @177e2c170 (dma) 0x000000 - tx_info
[ 2371.562146] xhci_hcd 0000:00:14.0: @ffff880177e2c174 (virt) @177e2c174 (dma) 0x000000 - rsvd[0]
[ 2371.562148] xhci_hcd 0000:00:14.0: @ffff880177e2c178 (virt) @177e2c178 (dma) 0x000000 - rsvd[1]
[ 2371.562150] xhci_hcd 0000:00:14.0: @ffff880177e2c17c (virt) @177e2c17c (dma) 0x000000 - rsvd[2]
[ 2371.562153] xhci_hcd 0000:00:14.0: OUT Endpoint 06 Context (ep_index 11):
[ 2371.562155] xhci_hcd 0000:00:14.0: @ffff880177e2c180 (virt) @177e2c180 (dma) 0x000000 - ep_info
[ 2371.562157] xhci_hcd 0000:00:14.0: @ffff880177e2c184 (virt) @177e2c184 (dma) 0x000000 - ep_info2
[ 2371.562159] xhci_hcd 0000:00:14.0: @ffff880177e2c188 (virt) @177e2c188 (dma) 0x000000 - deq
[ 2371.562162] xhci_hcd 0000:00:14.0: @ffff880177e2c190 (virt) @177e2c190 (dma) 0x000000 - tx_info
[ 2371.562164] xhci_hcd 0000:00:14.0: @ffff880177e2c194 (virt) @177e2c194 (dma) 0x000000 - rsvd[0]
[ 2371.562166] xhci_hcd 0000:00:14.0: @ffff880177e2c198 (virt) @177e2c198 (dma) 0x000000 - rsvd[1]
[ 2371.562169] xhci_hcd 0000:00:14.0: @ffff880177e2c19c (virt) @177e2c19c (dma) 0x000000 - rsvd[2]
[ 2371.562171] xhci_hcd 0000:00:14.0: IN Endpoint 06 Context (ep_index 12):
[ 2371.562173] xhci_hcd 0000:00:14.0: @ffff880177e2c1a0 (virt) @177e2c1a0 (dma) 0x000001 - ep_info
[ 2371.562176] xhci_hcd 0000:00:14.0: @ffff880177e2c1a4 (virt) @177e2c1a4 (dma) 0x2000036 - ep_info2
[ 2371.562178] xhci_hcd 0000:00:14.0: @ffff880177e2c1a8 (virt) @177e2c1a8 (dma) 0x166e07001 - deq
[ 2371.562180] xhci_hcd 0000:00:14.0: @ffff880177e2c1b0 (virt) @177e2c1b0 (dma) 0x000000 - tx_info
[ 2371.562183] xhci_hcd 0000:00:14.0: @ffff880177e2c1b4 (virt) @177e2c1b4 (dma) 0x000000 - rsvd[0]
[ 2371.562185] xhci_hcd 0000:00:14.0: @ffff880177e2c1b8 (virt) @177e2c1b8 (dma) 0x000000 - rsvd[1]
[ 2371.562187] xhci_hcd 0000:00:14.0: @ffff880177e2c1bc (virt) @177e2c1bc (dma) 0x000000 - rsvd[2]
[ 2371.562189] xhci_hcd 0000:00:14.0: OUT Endpoint 07 Context (ep_index 13):
[ 2371.562192] xhci_hcd 0000:00:14.0: @ffff880177e2c1c0 (virt) @177e2c1c0 (dma) 0x000000 - ep_info
[ 2371.562194] xhci_hcd 0000:00:14.0: @ffff880177e2c1c4 (virt) @177e2c1c4 (dma) 0x000000 - ep_info2
[ 2371.562196] xhci_hcd 0000:00:14.0: @ffff880177e2c1c8 (virt) @177e2c1c8 (dma) 0x000000 - deq
[ 2371.562199] xhci_hcd 0000:00:14.0: @ffff880177e2c1d0 (virt) @177e2c1d0 (dma) 0x000000 - tx_info
[ 2371.562201] xhci_hcd 0000:00:14.0: @ffff880177e2c1d4 (virt) @177e2c1d4 (dma) 0x000000 - rsvd[0]
[ 2371.562203] xhci_hcd 0000:00:14.0: @ffff880177e2c1d8 (virt) @177e2c1d8 (dma) 0x000000 - rsvd[1]
[ 2371.562206] xhci_hcd 0000:00:14.0: @ffff880177e2c1dc (virt) @177e2c1dc (dma) 0x000000 - rsvd[2]
[ 2371.562208] xhci_hcd 0000:00:14.0: IN Endpoint 07 Context (ep_index 14):
[ 2371.562210] xhci_hcd 0000:00:14.0: @ffff880177e2c1e0 (virt) @177e2c1e0 (dma) 0x000000 - ep_info
[ 2371.562212] xhci_hcd 0000:00:14.0: @ffff880177e2c1e4 (virt) @177e2c1e4 (dma) 0x000000 - ep_info2
[ 2371.562215] xhci_hcd 0000:00:14.0: @ffff880177e2c1e8 (virt) @177e2c1e8 (dma) 0x000000 - deq
[ 2371.562217] xhci_hcd 0000:00:14.0: @ffff880177e2c1f0 (virt) @177e2c1f0 (dma) 0x000000 - tx_info
[ 2371.562219] xhci_hcd 0000:00:14.0: @ffff880177e2c1f4 (virt) @177e2c1f4 (dma) 0x000000 - rsvd[0]
[ 2371.562222] xhci_hcd 0000:00:14.0: @ffff880177e2c1f8 (virt) @177e2c1f8 (dma) 0x000000 - rsvd[1]
[ 2371.562224] xhci_hcd 0000:00:14.0: @ffff880177e2c1fc (virt) @177e2c1fc (dma) 0x000000 - rsvd[2]
[ 2371.562226] xhci_hcd 0000:00:14.0: OUT Endpoint 08 Context (ep_index 15):
[ 2371.562228] xhci_hcd 0000:00:14.0: @ffff880177e2c200 (virt) @177e2c200 (dma) 0x000000 - ep_info
[ 2371.562231] xhci_hcd 0000:00:14.0: @ffff880177e2c204 (virt) @177e2c204 (dma) 0x000000 - ep_info2
[ 2371.562233] xhci_hcd 0000:00:14.0: @ffff880177e2c208 (virt) @177e2c208 (dma) 0x000000 - deq
[ 2371.562235] xhci_hcd 0000:00:14.0: @ffff880177e2c210 (virt) @177e2c210 (dma) 0x000000 - tx_info
[ 2371.562238] xhci_hcd 0000:00:14.0: @ffff880177e2c214 (virt) @177e2c214 (dma) 0x000000 - rsvd[0]
[ 2371.562240] xhci_hcd 0000:00:14.0: @ffff880177e2c218 (virt) @177e2c218 (dma) 0x000000 - rsvd[1]
[ 2371.562242] xhci_hcd 0000:00:14.0: @ffff880177e2c21c (virt) @177e2c21c (dma) 0x000000 - rsvd[2]
[ 2371.562244] xhci_hcd 0000:00:14.0: IN Endpoint 08 Context (ep_index 16):
[ 2371.562247] xhci_hcd 0000:00:14.0: @ffff880177e2c220 (virt) @177e2c220 (dma) 0x000001 - ep_info
[ 2371.562249] xhci_hcd 0000:00:14.0: @ffff880177e2c224 (virt) @177e2c224 (dma) 0x2000036 - ep_info2
[ 2371.562251] xhci_hcd 0000:00:14.0: @ffff880177e2c228 (virt) @177e2c228 (dma) 0x16ee77001 - deq
[ 2371.562254] xhci_hcd 0000:00:14.0: @ffff880177e2c230 (virt) @177e2c230 (dma) 0x000000 - tx_info
[ 2371.562256] xhci_hcd 0000:00:14.0: @ffff880177e2c234 (virt) @177e2c234 (dma) 0x000000 - rsvd[0]
[ 2371.562258] xhci_hcd 0000:00:14.0: @ffff880177e2c238 (virt) @177e2c238 (dma) 0x000000 - rsvd[1]
[ 2371.562261] xhci_hcd 0000:00:14.0: @ffff880177e2c23c (virt) @177e2c23c (dma) 0x000000 - rsvd[2]
[ 2371.562267] xhci_hcd 0000:00:14.0: Endpoint 0x2 ep reset callback called
[ 2371.562269] xhci_hcd 0000:00:14.0: Endpoint 0x4 ep reset callback called
[ 2371.562280] xhci_hcd 0000:00:14.0: Endpoint 0x86 ep reset callback called
[ 2371.562292] xhci_hcd 0000:00:14.0: Endpoint 0x88 ep reset callback called
[ 2371.562598] usb_ehset_test: probe of 1-2:1.0 failed with error -32
[ 2371.562759] xhci_hcd 0000:00:14.0: get port status, actual port 1 status  = 0xe03
[ 2371.562768] xhci_hcd 0000:00:14.0: Get port status returned 0x503
[ 2371.748491] xhci_hcd 0000:00:14.0: xhci_hub_status_data: stopping port polling.

--Qxx1br4bt0+wmkIi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="lsusb-allion-0104.txt"


Bus 001 Device 029: ID 1a0a:0104 USB-IF non-workshop 
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.00
  bDeviceClass            0 (Defined at Interface level)
  bDeviceSubClass         0 
  bDeviceProtocol         0 
  bMaxPacketSize0        64
  idVendor           0x1a0a USB-IF non-workshop
  idProduct          0x0104 
  bcdDevice            0.00
  iManufacturer           1 Allion
  iProduct                2 USB-VPID
  iSerial                 0 
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength           46
    bNumInterfaces          1
    bConfigurationValue     1
    iConfiguration          0 
    bmAttributes         0x80
      (Bus Powered)
    MaxPower              100mA
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           4
      bInterfaceClass       255 Vendor Specific Class
      bInterfaceSubClass      0 
      bInterfaceProtocol      0 
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x02  EP 2 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0200  1x 512 bytes
        bInterval               0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x04  EP 4 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0200  1x 512 bytes
        bInterval               0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x86  EP 6 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0200  1x 512 bytes
        bInterval               0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x88  EP 8 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0200  1x 512 bytes
        bInterval               0
Device Qualifier (for other device speed):
  bLength                10
  bDescriptorType         6
  bcdUSB               2.00
  bDeviceClass            0 (Defined at Interface level)
  bDeviceSubClass         0 
  bDeviceProtocol         0 
  bMaxPacketSize0        64
  bNumConfigurations      1
Device Status:     0x0000
  (Bus Powered)

--Qxx1br4bt0+wmkIi--

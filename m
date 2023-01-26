Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0103A67CD28
	for <lists+linux-usb@lfdr.de>; Thu, 26 Jan 2023 15:00:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231716AbjAZOAM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 Jan 2023 09:00:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229607AbjAZOAH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 26 Jan 2023 09:00:07 -0500
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 497023EFED
        for <linux-usb@vger.kernel.org>; Thu, 26 Jan 2023 05:59:50 -0800 (PST)
Received: by mail-pl1-x629.google.com with SMTP id jl3so1864512plb.8
        for <linux-usb@vger.kernel.org>; Thu, 26 Jan 2023 05:59:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=connectedcars.dk; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NBAyCPSvMVSiOlgGtlD0Vk119vRxsbfLlykWVT1Xq+s=;
        b=T+oDlGTvfpoc9MHpmArwV/Rum4jiOFf+HRaba2dOWZYvcXWuwv2GFbOzZbjD6HjQ4P
         /kWRI0uv2vkhDwoBZZ3J6IoPNOE46sjzSig3KqytZFN3XG6C3yaunxZqAkvGe8oGkFjT
         tWOBLwPv34ZrTl7Ktn5Q3yBdRxlDQOvo7OTxM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NBAyCPSvMVSiOlgGtlD0Vk119vRxsbfLlykWVT1Xq+s=;
        b=NXN369UuWxR+OpojxCavUoPvoTef9yhvupA1zj/7WQmfW1leUBbOn1haLAjyM7xqW8
         1pAwj9chP7ArOcX7FsF3jm1oThVYJl1bTv8/ZTA4uFqjnEEuffW8p438jqnDj+nx7zym
         wBHDb7EQY5m4P9et2bp1cmqNOkgUV7+zUEdnP2PwcQ+KYpHlnRVDN4l2ralMRDrQfH+r
         pvhwkHwqJbt/t2GcgcI+7ZiT1z5eNyu8pHaAhfP7Ej3xxGx2nTUn9N+F174NsGkarlEC
         1elCLjVzAKCbZhzhD7Xdcw3Lx1p5Ie9+J+KPvEHZxvphsuGhy5ugXM7PEHuP+GIL3LL/
         gx/w==
X-Gm-Message-State: AO0yUKUxKE0qfbHNmuwiOYS3F9awd6R+7kGaHnE/KfWcodpiaHMABx8k
        9Ebkm2d0yuuEzp7pkKghEWCQQqyW6xZAtwt2WZAbmvJYzxAWKAaD9Ew=
X-Google-Smtp-Source: AK7set/tOgcy7oqCY28rzsIGkdeCGJyr+oUDrONNKrkdzt/9Vos7LBqcX1YN9O357cIOF205QiRnRAflUV3lpvah8BY=
X-Received: by 2002:a17:902:7d8a:b0:196:3232:f49b with SMTP id
 a10-20020a1709027d8a00b001963232f49bmr747430plm.4.1674741586522; Thu, 26 Jan
 2023 05:59:46 -0800 (PST)
MIME-Version: 1.0
References: <CAHHqYPMHBuPZqG9Rd9i+hN9Mq89pRn6M_0PLsyWkcK_hZr3xAA@mail.gmail.com>
 <Y9Jwv1ColWNwH4+0@kroah.com> <CAHHqYPONhyKrqMWiw29TRETtiBatNaej8+62Z40fvuj3LX4RWQ@mail.gmail.com>
 <Y9J8VncWSJdVURgB@kroah.com>
In-Reply-To: <Y9J8VncWSJdVURgB@kroah.com>
From:   Troels Liebe Bentsen <troels@connectedcars.dk>
Date:   Thu, 26 Jan 2023 14:59:35 +0100
Message-ID: <CAHHqYPO_A=7V_8Z-qrGy0-eOkPEpyv+vU_8Jpz-ABGg60t244w@mail.gmail.com>
Subject: Re: All USB tools hang when one descriptor read fails and needs to timeout
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, 26 Jan 2023 at 14:12, Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Thu, Jan 26, 2023 at 02:06:39PM +0100, Troels Liebe Bentsen wrote:
> > Hi Greg,
> >
> > On Thu, 26 Jan 2023 at 13:23, Greg KH <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Thu, Jan 26, 2023 at 12:49:32PM +0100, Troels Liebe Bentsen wrote:
> > > > Hi,
> > > >
> > > > We have a hardware projekt where something is off with power ON
> > > > timing. It sometimes gets started in a broken state where the device
> > > > is seen by the USB system but does not respond to descriptor reads.
> > >
> > > Ah, a broken USB device, not much the kernel can do about that :(
> >
> > Would be nice if it could, but I settle for papering over the worst parts  :)
> >
> > >
> > > > When this happens this causes lsusb and libusb based tools to hang
> > > > until the descriptor read in the USB subsystem timeout out after 30
> > > > seconds or so. It looks like the tools are trying to read
> > > > /sys/bus/usb/devices/.../descriptors and it blocks until the timeout
> > > > happens.
> > > >
> > > > We should fix our hardware and have done so in the next revision but
> > > > why should one device be able to block the descriptors file that most
> > > > user land USB code seem to use.
> > >
> > > If the device does not respond, what is the kernel or userspace supposed
> > > to do?
> >
> > Might not have been clear that the issue is when I "plug in"/connect the
> > device that it happens. I think the kernel is doing the right thing here and
> > just timing out the device and at least in the kernel it does not seem to block
> > other devices from doing their thing. The problem is that part of the userspace
> > interface used for listing all devices on a hub block until the timeout
> > happens.
>
> What userspace code exactly is doing this?  Perhaps just work on making
> that tool handle timeouts better?

We are using libusb to drive an automated flashing setup to test our hardware
but libusb_get_device_list blocks as it reads
/sys/bus/usb/devices/usbX/descriptors
for the hub the broken hardware is attached to. The hang happens when we
put the device into flash mode(by setting some flashing pins) where the MCU
has some low level USB function where we can load u-boot over a
proprietary protocol but for some reason does not enter fully into this state.

So we have workaround code to see if the hardware has blocked the descriptors
file of the hub and then power cycle the device until it starts
behaving and set a
global mutex that everything else attached to that hub has to wait as we can't
scan the hub.

But the problem is general so if we try to run lsusb or tools using
libusb they will
block until the kernel times out the device.

>
> > One nice options would be if the timeout was configurable based on
> > port/devpath, I can understand 30-60 seconds timeout for a spindel USB
> > disk, but for other devices 5 seconds would be more than enough to
> > conclude they are dead, but that's nice to have.
>
> The timeouts the kernel has now have had to be increased over time due
> to bad devices.  And we don't know what type of device this is until we
> read from it, so you can't pick the timeout based on the type of device
> if you can't read the type of device :)
>

It might be a special use case, for our automated hardware testing station
we know what goes into what port/hub so it would be nice to have an option
to lower the timeout in general or per hub or per port.

> > >
> > > > Would there be any reasoning against just serving the descriptors file
> > > > as it looked before inserting the broken USB device instead of
> > > > blocking the read?
> > >
> > > So a different device's descriptor file is being blocked by a broken
> > > device?  Are you sure?  They should all be independent.
> >
> > Not the descriptor file, but the descriptor*s* under the hub folder in sysfs:
> >
> > >From https://www.kernel.org/doc/Documentation/ABI/testing/sysfs-bus-usb :
> >
> > What: /sys/bus/usb/devices/usbX/descriptors
> > Description:
> > Contains the interface descriptors, in binary.
> >
> > As I understand it, this is a file that contains all the information for devices
> > under a hub.
>
> No, just the single device's descriptor.

Ahh, sorry I misunderstood but then it makes even less sense that the hub's
descriptors file blocks when the device hangs or am I missing something.

The other files in /sys/bus/usb/devices/3-3/ such as idProduct, idVendor, etc.
do not block.

This is what I get when the hardware is in broken state:

strace lsusb
...
openat(AT_FDCWD, "/sys/bus/usb/devices/3-3/descriptors", O_RDONLY|O_CLOEXEC) = 8
read(8,
...

dmesg -wH
[  +2.528009] usb 3-3.6: new high-speed USB device number 20 using xhci_hcd
[  +5.300072] usb 3-3.6: device descriptor read/64, error -110
[ +15.615955] usb 3-3.6: device descriptor read/64, error -110
[  +0.187975] usb 3-3.6: new high-speed USB device number 21 using xhci_hcd
[  +5.188069] usb 3-3.6: device descriptor read/64, error -110
[ +15.615973] usb 3-3.6: device descriptor read/64, error -110
[  +0.112158] usb 3-3-port6: attempt power cycle
[  +0.603789] usb 3-3.6: new high-speed USB device number 22 using xhci_hcd
[Jan26 13:33] xhci_hcd 0000:00:14.0: Timeout while waiting for setup
device command
[  +5.375996] xhci_hcd 0000:00:14.0: Timeout while waiting for setup
device command
[  +0.207876] usb 3-3.6: device not accepting address 22, error -62
[  +0.080030] usb 3-3.6: new high-speed USB device number 23 using xhci_hcd
[  +5.088086] xhci_hcd 0000:00:14.0: Timeout while waiting for setup
device command
[  +5.376001] xhci_hcd 0000:00:14.0: Timeout while waiting for setup
device command
[  +0.207889] usb 3-3.6: device not accepting address 23, error -62
[  +0.002418] usb 3-3-port6: unable to enumerate USB device

I tried the other devices attached to the hub and their descriptors do
not block on
read, only the hubs.

> > Most likely an optimization made for lsusb and libusb so they
> > don't have to traverse all the individual folders to get the same information.
>
> Nope, libusb walks the whole bus if you ask it to.
>
> > The problem is that /sys/bus/usb/devices/usbX/descriptors block while the
> > kernel is trying to do the descriptor read on that one broken device even if
> > all the other devices on the hub is well behaving the read is blocked until
> > it times out.
>
> So if you read one descriptor, it will time out for others if you do so
> at the same time?  Do they all share a single kernel lock perhaps?
>
> > If lsusb and libusb had traversed the folder structure they would not have
> > blocked as the broken devices never showed in the folder structure:
> >
> > fx.
> >
> > tlb@tlb-nuc:/sys/bus/usb/devices/usb3$ ls -1
> > 3-0:1.0 # Device shows up when USB initialization is done
> > 3-10 # Device shows up when USB initialization is done
> > 3-3 # Device shows up when USB initialization is done
> > ...
> > descriptors # Blocks on read until kernel times out waiting for descriptor read.
> > ...
> >
> > > > And if we wanted to create a pull request for a change like that would
> > > > it be accepted or would it be considered breaking the API?
> > >
> > > It depends on what the kernel change looks like.  Have you tried
> > > anything that worked for you that you wish to propose?
> > >
> >
> > I would like to change /sys/bus/usb/devices/usbX/descriptors so it never blocks.
>
> Patches gladly reviewed to do so :)

We will have a look and get back to you.

>
> thanks,
>
> greg k-h

Regards Troels

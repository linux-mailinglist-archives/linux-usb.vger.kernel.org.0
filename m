Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB6A867E7D9
	for <lists+linux-usb@lfdr.de>; Fri, 27 Jan 2023 15:12:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229898AbjA0OMh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 27 Jan 2023 09:12:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234181AbjA0OMZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 27 Jan 2023 09:12:25 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63AD134C05
        for <linux-usb@vger.kernel.org>; Fri, 27 Jan 2023 06:12:23 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id lp10so4739670pjb.4
        for <linux-usb@vger.kernel.org>; Fri, 27 Jan 2023 06:12:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=connectedcars.dk; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GXjuVkjLHXbH8eUELYIKSwtMNKUKV8qeR4YdzkGUN+g=;
        b=c+J0por/++WJ2i+qIGvovKu2t/GmuWcQyQu23DZ49REg9tbhnN08BskjsKlc/jVAKe
         kcEKe9USZhUDJgj/DDrhWk/IG4sZMDddfFF+Yo+uzs5sJG61+sU8UecZY7VaSG9mBFbv
         2qWUeMGcOkpSab5FuNiq++yW3Ms066m/gUlRQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GXjuVkjLHXbH8eUELYIKSwtMNKUKV8qeR4YdzkGUN+g=;
        b=YQRzF6QAuU/gWc279jtGru7J7nPB/j0vgbBgOMDpHPEZtLceRk6tsn5X0SUOovzTrZ
         LHg3WG3UY19twJ8rTQdGE5w6ZSdQR7AsbsE9eIMXMPLYCl9AnfbjHLczs2At9YwazR3z
         ok55YQDg3ZXRf2Sq0/LJRv/DTdoKkqla0bVvnrpep07fvgI4uD/OOxw5h43HVlz50X4b
         fwy8hErubdLa6sSuTcO+rVrAV/x1PLaI2jbdYElXV8PgnFMsAP2UHsTwhzW5p8tAQp02
         7HPaxgG/tpqlq97R+VKFgvynMmk3Rim5NlBSkMWYdXM/APcFYSuY4i4HTVXpif9u+hjk
         Enog==
X-Gm-Message-State: AO0yUKUs9mWZyzNEvWYjL8y+5mqvq2izgfLIfKUsV1Q3vYnwzm/PbZFg
        hil2XpXC2RNS3XquqCBNgSrFWoOpD6brNBbh0EN+Eg==
X-Google-Smtp-Source: AK7set/aVk2VE07LtVUC2Syo837q1uPLRmoSgdmjijZar887RfFA/GVWGY+WYfohbOF80vHnKq9+tQ8bYm1em3MaCZQ=
X-Received: by 2002:a17:90a:35b:b0:22b:f9df:7f8b with SMTP id
 27-20020a17090a035b00b0022bf9df7f8bmr2042223pjf.190.1674828742665; Fri, 27
 Jan 2023 06:12:22 -0800 (PST)
MIME-Version: 1.0
References: <CAHHqYPMHBuPZqG9Rd9i+hN9Mq89pRn6M_0PLsyWkcK_hZr3xAA@mail.gmail.com>
 <Y9Jwv1ColWNwH4+0@kroah.com> <CAHHqYPONhyKrqMWiw29TRETtiBatNaej8+62Z40fvuj3LX4RWQ@mail.gmail.com>
 <Y9J8VncWSJdVURgB@kroah.com> <CAHHqYPO_A=7V_8Z-qrGy0-eOkPEpyv+vU_8Jpz-ABGg60t244w@mail.gmail.com>
 <Y9KnnH+5O6MtO6kz@rowland.harvard.edu>
In-Reply-To: <Y9KnnH+5O6MtO6kz@rowland.harvard.edu>
From:   Troels Liebe Bentsen <troels@connectedcars.dk>
Date:   Fri, 27 Jan 2023 15:12:11 +0100
Message-ID: <CAHHqYPNtVkHoiX1LrxUDa32BgVsgymcPtKVODcVGxEh2f=tYRw@mail.gmail.com>
Subject: Re: All USB tools hang when one descriptor read fails and needs to timeout
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, 26 Jan 2023 at 17:17, Alan Stern <stern@rowland.harvard.edu> wrote:
>
> On Thu, Jan 26, 2023 at 02:59:35PM +0100, Troels Liebe Bentsen wrote:
> > On Thu, 26 Jan 2023 at 14:12, Greg KH <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Thu, Jan 26, 2023 at 02:06:39PM +0100, Troels Liebe Bentsen wrote:
> > > > Hi Greg,
> > > >
> > > > On Thu, 26 Jan 2023 at 13:23, Greg KH <gregkh@linuxfoundation.org> wrote:
> > > > >
> > > > > On Thu, Jan 26, 2023 at 12:49:32PM +0100, Troels Liebe Bentsen wrote:
> > > > > > Hi,
> > > > > >
> > > > > > We have a hardware projekt where something is off with power ON
> > > > > > timing. It sometimes gets started in a broken state where the device
> > > > > > is seen by the USB system but does not respond to descriptor reads.
> > > > >
> > > > > Ah, a broken USB device, not much the kernel can do about that :(
> > > >
> > > > Would be nice if it could, but I settle for papering over the worst parts  :)
> > > >
> > > > >
> > > > > > When this happens this causes lsusb and libusb based tools to hang
> > > > > > until the descriptor read in the USB subsystem timeout out after 30
> > > > > > seconds or so. It looks like the tools are trying to read
> > > > > > /sys/bus/usb/devices/.../descriptors and it blocks until the timeout
> > > > > > happens.
> > > > > >
> > > > > > We should fix our hardware and have done so in the next revision but
> > > > > > why should one device be able to block the descriptors file that most
> > > > > > user land USB code seem to use.
> > > > >
> > > > > If the device does not respond, what is the kernel or userspace supposed
> > > > > to do?
> > > >
> > > > Might not have been clear that the issue is when I "plug in"/connect the
> > > > device that it happens. I think the kernel is doing the right thing here and
> > > > just timing out the device and at least in the kernel it does not seem to block
> > > > other devices from doing their thing. The problem is that part of the userspace
> > > > interface used for listing all devices on a hub block until the timeout
> > > > happens.
> > >
> > > What userspace code exactly is doing this?  Perhaps just work on making
> > > that tool handle timeouts better?
> >
> > We are using libusb to drive an automated flashing setup to test our hardware
> > but libusb_get_device_list blocks as it reads
> > /sys/bus/usb/devices/usbX/descriptors
> > for the hub the broken hardware is attached to. The hang happens when we
> > put the device into flash mode(by setting some flashing pins) where the MCU
> > has some low level USB function where we can load u-boot over a
> > proprietary protocol but for some reason does not enter fully into this state.
> >
> > So we have workaround code to see if the hardware has blocked the descriptors
> > file of the hub and then power cycle the device until it starts
> > behaving and set a
> > global mutex that everything else attached to that hub has to wait as we can't
> > scan the hub.
> >
> > But the problem is general so if we try to run lsusb or tools using
> > libusb they will
> > block until the kernel times out the device.
> >
> > >
> > > > One nice options would be if the timeout was configurable based on
> > > > port/devpath, I can understand 30-60 seconds timeout for a spindel USB
> > > > disk, but for other devices 5 seconds would be more than enough to
> > > > conclude they are dead, but that's nice to have.
> > >
> > > The timeouts the kernel has now have had to be increased over time due
> > > to bad devices.  And we don't know what type of device this is until we
> > > read from it, so you can't pick the timeout based on the type of device
> > > if you can't read the type of device :)
> > >
> >
> > It might be a special use case, for our automated hardware testing station
> > we know what goes into what port/hub so it would be nice to have an option
> > to lower the timeout in general or per hub or per port.
>
> There already is such an option.  It's named "early_stop" and it's
> described in Documentation/ABI/testing/sysfs-bus-usb.  You may not be
> aware of it because it was added after the 6.1 version of the kernel was
> released.

Thanks, is it something that has to be enabled when compiling the kernel?
Using Ubuntu mainline 6.1.4 and it does not seem to have this file in the
ports folder.

>
> > > > > > Would there be any reasoning against just serving the descriptors file
> > > > > > as it looked before inserting the broken USB device instead of
> > > > > > blocking the read?
> > > > >
> > > > > So a different device's descriptor file is being blocked by a broken
> > > > > device?  Are you sure?  They should all be independent.
> > > >
> > > > Not the descriptor file, but the descriptor*s* under the hub folder in sysfs:
> > > >
> > > > >From https://www.kernel.org/doc/Documentation/ABI/testing/sysfs-bus-usb :
> > > >
> > > > What: /sys/bus/usb/devices/usbX/descriptors
> > > > Description:
> > > > Contains the interface descriptors, in binary.
> > > >
> > > > As I understand it, this is a file that contains all the information for devices
> > > > under a hub.
> > >
> > > No, just the single device's descriptor.
> >
> > Ahh, sorry I misunderstood but then it makes even less sense that the hub's
> > descriptors file blocks when the device hangs or am I missing something.
>
> Reading the file blocks because it has to be mutually exclusive with
> other parts of the kernel which can reallocate the buffers storing the
> descriptors.  This mutual exclusion is provided by a per-device lock,
> and for hubs this device lock is held while a child device is being
> probed.
>
I guess the reasoning for also holding a lock for the hubs is that there is some
accounting on the hub for the children. But the hub's descriptors file won't
change because a child device got enumerated right?

Also if I understand it correctly based on your second email both the parsed
sysfs files(fx idProduct, idVendor, etc.) and the descriptors file won't change
for the lifetime of the hub. It's just that the descriptors file is backed by
buffers that need to be locked because they can be reallocated by the kernel.

Why not store the descriptors file the same way as the parsed sysfs files,
etc. it seems fairly small and I guess it contains the same data that is found
in the sysfs folder for the hub?

I don't know how much work it would be to try to avoid locking the hub or if
it even makes sense. So maybe it would be better if we spent time trying to
workaround this in userspace, fx. by getting libusb to open the descriptors
file in non-blocking mode and falling back to reading the individual files in
sysfs if we get an EAGAIN. Would there be anything wrong with that
approach?

> > The other files in /sys/bus/usb/devices/3-3/ such as idProduct, idVendor, etc.
> > do not block.
>
> Because they rely on values stored in the kernel's copy of the device
> descriptor, which does not get reallocated during the lifetime of the
> device.
>
> > This is what I get when the hardware is in broken state:
> >
> > strace lsusb
> > ...
> > openat(AT_FDCWD, "/sys/bus/usb/devices/3-3/descriptors", O_RDONLY|O_CLOEXEC) = 8
> > read(8,
> > ...
> >
> > dmesg -wH
> > [  +2.528009] usb 3-3.6: new high-speed USB device number 20 using xhci_hcd
> > [  +5.300072] usb 3-3.6: device descriptor read/64, error -110
> > [ +15.615955] usb 3-3.6: device descriptor read/64, error -110
> > [  +0.187975] usb 3-3.6: new high-speed USB device number 21 using xhci_hcd
> > [  +5.188069] usb 3-3.6: device descriptor read/64, error -110
> > [ +15.615973] usb 3-3.6: device descriptor read/64, error -110
> > [  +0.112158] usb 3-3-port6: attempt power cycle
> > [  +0.603789] usb 3-3.6: new high-speed USB device number 22 using xhci_hcd
> > [Jan26 13:33] xhci_hcd 0000:00:14.0: Timeout while waiting for setup
> > device command
> > [  +5.375996] xhci_hcd 0000:00:14.0: Timeout while waiting for setup
> > device command
> > [  +0.207876] usb 3-3.6: device not accepting address 22, error -62
> > [  +0.080030] usb 3-3.6: new high-speed USB device number 23 using xhci_hcd
> > [  +5.088086] xhci_hcd 0000:00:14.0: Timeout while waiting for setup
> > device command
> > [  +5.376001] xhci_hcd 0000:00:14.0: Timeout while waiting for setup
> > device command
> > [  +0.207889] usb 3-3.6: device not accepting address 23, error -62
> > [  +0.002418] usb 3-3-port6: unable to enumerate USB device
> >
> > I tried the other devices attached to the hub and their descriptors do
> > not block on
> > read, only the hubs.
>
> Because the other children are not locked while the new device is being
> probed.  Only the parent hub and the new device itself are locked.
>
> Alan Stern
>
> > > > Most likely an optimization made for lsusb and libusb so they
> > > > don't have to traverse all the individual folders to get the same information.
> > >
> > > Nope, libusb walks the whole bus if you ask it to.
> > >
> > > > The problem is that /sys/bus/usb/devices/usbX/descriptors block while the
> > > > kernel is trying to do the descriptor read on that one broken device even if
> > > > all the other devices on the hub is well behaving the read is blocked until
> > > > it times out.
> > >
> > > So if you read one descriptor, it will time out for others if you do so
> > > at the same time?  Do they all share a single kernel lock perhaps?
> > >
> > > > If lsusb and libusb had traversed the folder structure they would not have
> > > > blocked as the broken devices never showed in the folder structure:
> > > >
> > > > fx.
> > > >
> > > > tlb@tlb-nuc:/sys/bus/usb/devices/usb3$ ls -1
> > > > 3-0:1.0 # Device shows up when USB initialization is done
> > > > 3-10 # Device shows up when USB initialization is done
> > > > 3-3 # Device shows up when USB initialization is done
> > > > ...
> > > > descriptors # Blocks on read until kernel times out waiting for descriptor read.
> > > > ...
> > > >
> > > > > > And if we wanted to create a pull request for a change like that would
> > > > > > it be accepted or would it be considered breaking the API?
> > > > >
> > > > > It depends on what the kernel change looks like.  Have you tried
> > > > > anything that worked for you that you wish to propose?
> > > > >
> > > >
> > > > I would like to change /sys/bus/usb/devices/usbX/descriptors so it never blocks.
> > >
> > > Patches gladly reviewed to do so :)
> >
> > We will have a look and get back to you.
> >
> > >
> > > thanks,
> > >
> > > greg k-h
> >
> > Regards Troels

Also in general thanks for the quick and detailed responses, it's a
pleasure writing on this mailing list.

Regards Troels

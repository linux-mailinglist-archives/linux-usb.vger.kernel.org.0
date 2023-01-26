Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D3C467CBB4
	for <lists+linux-usb@lfdr.de>; Thu, 26 Jan 2023 14:13:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229657AbjAZNNA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 Jan 2023 08:13:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229471AbjAZNNA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 26 Jan 2023 08:13:00 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15D0945F45
        for <linux-usb@vger.kernel.org>; Thu, 26 Jan 2023 05:12:59 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A3D72617C4
        for <linux-usb@vger.kernel.org>; Thu, 26 Jan 2023 13:12:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5FD0C433D2;
        Thu, 26 Jan 2023 13:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1674738778;
        bh=gx5qUdDXtHTRrHLOXwvTm0SpJVM5QLJDWnEv7jI8hs8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=h8luFZTmdMPQ/iTlbL72cHfdb6+TYt7OQVI3hvThEWCTvauZFrF2n8ypYH1hoByrC
         aicyDniNZ5MsvdXR3ykpU5ik4+2feStaupv27X8fQWEmeubKUzQ4sxwx2do1iySDkk
         June5itb/mk3Qye6aR0WALrIIUFxqUBgPc/sWsC8=
Date:   Thu, 26 Jan 2023 14:12:54 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Troels Liebe Bentsen <troels@connectedcars.dk>
Cc:     linux-usb@vger.kernel.org
Subject: Re: All USB tools hang when one descriptor read fails and needs to
 timeout
Message-ID: <Y9J8VncWSJdVURgB@kroah.com>
References: <CAHHqYPMHBuPZqG9Rd9i+hN9Mq89pRn6M_0PLsyWkcK_hZr3xAA@mail.gmail.com>
 <Y9Jwv1ColWNwH4+0@kroah.com>
 <CAHHqYPONhyKrqMWiw29TRETtiBatNaej8+62Z40fvuj3LX4RWQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHHqYPONhyKrqMWiw29TRETtiBatNaej8+62Z40fvuj3LX4RWQ@mail.gmail.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jan 26, 2023 at 02:06:39PM +0100, Troels Liebe Bentsen wrote:
> Hi Greg,
> 
> On Thu, 26 Jan 2023 at 13:23, Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > On Thu, Jan 26, 2023 at 12:49:32PM +0100, Troels Liebe Bentsen wrote:
> > > Hi,
> > >
> > > We have a hardware projekt where something is off with power ON
> > > timing. It sometimes gets started in a broken state where the device
> > > is seen by the USB system but does not respond to descriptor reads.
> >
> > Ah, a broken USB device, not much the kernel can do about that :(
> 
> Would be nice if it could, but I settle for papering over the worst parts  :)
> 
> >
> > > When this happens this causes lsusb and libusb based tools to hang
> > > until the descriptor read in the USB subsystem timeout out after 30
> > > seconds or so. It looks like the tools are trying to read
> > > /sys/bus/usb/devices/.../descriptors and it blocks until the timeout
> > > happens.
> > >
> > > We should fix our hardware and have done so in the next revision but
> > > why should one device be able to block the descriptors file that most
> > > user land USB code seem to use.
> >
> > If the device does not respond, what is the kernel or userspace supposed
> > to do?
> 
> Might not have been clear that the issue is when I "plug in"/connect the
> device that it happens. I think the kernel is doing the right thing here and
> just timing out the device and at least in the kernel it does not seem to block
> other devices from doing their thing. The problem is that part of the userspace
> interface used for listing all devices on a hub block until the timeout
> happens.

What userspace code exactly is doing this?  Perhaps just work on making
that tool handle timeouts better?

> One nice options would be if the timeout was configurable based on
> port/devpath, I can understand 30-60 seconds timeout for a spindel USB
> disk, but for other devices 5 seconds would be more than enough to
> conclude they are dead, but that's nice to have.

The timeouts the kernel has now have had to be increased over time due
to bad devices.  And we don't know what type of device this is until we
read from it, so you can't pick the timeout based on the type of device
if you can't read the type of device :)

> >
> > > Would there be any reasoning against just serving the descriptors file
> > > as it looked before inserting the broken USB device instead of
> > > blocking the read?
> >
> > So a different device's descriptor file is being blocked by a broken
> > device?  Are you sure?  They should all be independent.
> 
> Not the descriptor file, but the descriptor*s* under the hub folder in sysfs:
> 
> >From https://www.kernel.org/doc/Documentation/ABI/testing/sysfs-bus-usb :
> 
> What: /sys/bus/usb/devices/usbX/descriptors
> Description:
> Contains the interface descriptors, in binary.
> 
> As I understand it, this is a file that contains all the information for devices
> under a hub.

No, just the single device's descriptor.

> Most likely an optimization made for lsusb and libusb so they
> don't have to traverse all the individual folders to get the same information.

Nope, libusb walks the whole bus if you ask it to.

> The problem is that /sys/bus/usb/devices/usbX/descriptors block while the
> kernel is trying to do the descriptor read on that one broken device even if
> all the other devices on the hub is well behaving the read is blocked until
> it times out.

So if you read one descriptor, it will time out for others if you do so
at the same time?  Do they all share a single kernel lock perhaps?

> If lsusb and libusb had traversed the folder structure they would not have
> blocked as the broken devices never showed in the folder structure:
> 
> fx.
> 
> tlb@tlb-nuc:/sys/bus/usb/devices/usb3$ ls -1
> 3-0:1.0 # Device shows up when USB initialization is done
> 3-10 # Device shows up when USB initialization is done
> 3-3 # Device shows up when USB initialization is done
> ...
> descriptors # Blocks on read until kernel times out waiting for descriptor read.
> ...
> 
> > > And if we wanted to create a pull request for a change like that would
> > > it be accepted or would it be considered breaking the API?
> >
> > It depends on what the kernel change looks like.  Have you tried
> > anything that worked for you that you wish to propose?
> >
> 
> I would like to change /sys/bus/usb/devices/usbX/descriptors so it never blocks.

Patches gladly reviewed to do so :)

thanks,

greg k-h

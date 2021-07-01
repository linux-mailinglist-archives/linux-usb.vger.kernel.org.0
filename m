Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7A763B90F3
	for <lists+linux-usb@lfdr.de>; Thu,  1 Jul 2021 13:05:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236053AbhGALHF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 1 Jul 2021 07:07:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:35182 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236040AbhGALHE (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 1 Jul 2021 07:07:04 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 859646144F;
        Thu,  1 Jul 2021 11:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1625137474;
        bh=QZnyDKEi7IRS5IA+GaRHAZOmAiyREGmw2yGoCKyjN0U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=2VKHdVHzF8VTiAKFFvjmku9NZzFp2gNkvJVVzel2BPYDT/08uc/DJZHQlsv7Unj5k
         JiOwryJYuNYqIvHInDnHdilCDHdhmY1WTIY/4xPp/sSBsma6wl9NT+0Jy3AeQOvdut
         x2MR8u0NjOE77HJzxayh1JhFzrityPa/OErIeM6o=
Date:   Thu, 1 Jul 2021 13:04:31 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Benjamin Marty <benjamin.marty@gmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: USB Gadget Filesystem HID stuck on write when using mass storage
 at the same time
Message-ID: <YN2hP7r1MiHTIBtm@kroah.com>
References: <CABSdY3LGN202SN5YJxnk_bMAx2-js=AB0hictqo69ENgWbMQSw@mail.gmail.com>
 <YNtWMnNUsuL5YE3g@kroah.com>
 <CABSdY3KORj8JNg8PATysXSaWjWVfHHA-uFhEEY4f-U8nvOUCWw@mail.gmail.com>
 <YNw5Iemje5SddNzc@kroah.com>
 <CABSdY3KyA-R3RDcnPZ2W5GNtdrPee_0WQMKBJRaJe3ZQu_N+fw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABSdY3KyA-R3RDcnPZ2W5GNtdrPee_0WQMKBJRaJe3ZQu_N+fw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jun 30, 2021 at 12:25:09PM +0200, Benjamin Marty wrote:
> Am Mi., 30. Juni 2021 um 11:28 Uhr schrieb Greg KH <gregkh@linuxfoundation.org>:
> > On Wed, Jun 30, 2021 at 10:55:04AM +0200, Benjamin Marty wrote:
> > > On the iMX8 device `Linux imx8mm-var-dart 5.4.3-g050b21f4b394 #1 SMP
> > > PREEMPT Fri Oct 9 11:36:53 PDT 2020 aarch64 GNU/Linux` and on the
> > > Raspberry Pi device `Linux raspberry 5.10.17-v7l+ #1403 SMP Mon Feb 22
> > > 11:33:35 GMT 2021 armv7l GNU/Linux`.
> >
> > I do not understand, which is the host and which is the gadget here?
> 
> I use both as Gadget, two different HW platforms to rule out a
> Hardware related issue.
> As Host, I've tried multiple normal Intel computers.

What OS is running on the host?

> I was able to reproduce this issue with all HW Combinations

Then perhaps your userspace code running on the gadget is not working
properly?

> > > File write to `/dev/hidg0` starts to hang when there was high mass
> > > storage traffic. It also doesn't recover itself. There is no `complete
> > > kernel lockup`.
> >
> > File write on the host or gadget?
> 
> File write on the gadget to the gadget HID device `/dev/hidg0`

What do you do if that fails?

> > If things are not locked up, what is stalled?
> 
> The File write to the gadget HID device is stalled.

What gadget controller driver are you using?

> > > I haven't used usbmon yet but if I don't have high traffic scenarios
> > > on the mass storage then the mass storage and HID device works as
> > > expected. So I'm confident that I send the correct data.
> >
> > That's fine, but it is good to use usbmon to see what the errors are as
> > well when things go wrong.
> 
> Unfortunately both Kernel Versions don't have the usbmon module, need
> to recompile the Kernel first.

Try that, on the host, it should be part of any normal Linux distro
kernel already.

> > > Also saw that I'm getting this error in dmesg on both devices:
> > > [ 1895.677053] configfs-gadget gadget: End Point Request ERROR: -108
> >
> > Ah, is your userspace code on the gadget not handling this properly?
> > What userspace code is running on the gadget for your USB device
> > emulation?
> 
> Yes, my userspace code is on the gadget. It runs after I've setup the
> gadget HID + gadget Mass Storage. But it starts to fail after High
> Traffic scenarios to the gadget Mass Storage.
> 
> To replicate the issue, I wrote a simple Bash script which just
> wiggles the gadget HID (Mouse) every 50ms:
> 
> while true; do
> if [ -e "/dev/hidg0" ]; then
> echo write0
> echo \\x00\\xff\\xff\\x00\\xff\\xff > /dev/hidg0
> sleep 0.05
> echo write1
> echo \\x00\\xff\\xff\\x00\\xff\\x00 > /dev/hidg0
> sleep 0.05
> fi
> done
> 
> Do I need to check something before writing to the gadget HID device?
> Or should this usage of the gadget HID device be fine?

I do not know, sorry.

greg k-h

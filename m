Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 919D867CBA8
	for <lists+linux-usb@lfdr.de>; Thu, 26 Jan 2023 14:06:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236427AbjAZNGy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 Jan 2023 08:06:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232090AbjAZNGw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 26 Jan 2023 08:06:52 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD8CDAD18
        for <linux-usb@vger.kernel.org>; Thu, 26 Jan 2023 05:06:50 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id lp10so1461622pjb.4
        for <linux-usb@vger.kernel.org>; Thu, 26 Jan 2023 05:06:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=connectedcars.dk; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4SHYuSlwBNzbs8051reMrl7jFWUhVHplzRq+KDSzAWw=;
        b=MBtije0cAUf2/QgeKxRwovb4KcQXIttClMglujqJ/kIy7XWCNDYZJFUbd2u8sYZMhx
         fCDSZsn+3shyXAZ9JmJWUvxPdNjmqDdYw57le0566mQllC+6pvafLmwUjOK6KKesDtEH
         iPYCpdMje0/mowrzkkJ18PKBHHOsVqg/CmWmE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4SHYuSlwBNzbs8051reMrl7jFWUhVHplzRq+KDSzAWw=;
        b=KxQRUndcrYa4l0QAq78wgOM3UdrJY83bZ9v6rl6e5Y/wVA2WnkOhpMkwK6dyRs+/zD
         5joT31ZiKxcxA8Ka9KBRhVWhdHBHsJImSWJbdZrO/GEP5Icq/QZaqGpiPD0jXIBY6FF/
         Iat8aoWy8yc/FpnYaRP0B6E5eoNWrUiirxsRoXKpr8kR7T72FvbcYChbeEPO69R1sU7m
         q6ipvZtIaOqIpVbc6vry/9og47RlDe/98FE9d798R9VSa43ru9tqg4NXOpbHJBX00D6P
         G/hm4RFJMVylIxa76IlE4hxPqR3VpE6LAOW7/2sPCE3XHd+bY+gEI4Lj6ogSTAbPJsBq
         7BiQ==
X-Gm-Message-State: AFqh2kqcaT7Z5VokODBckjXIjEGnNYdN5+7lJeBaJ1GYfnj2xjc/qOf8
        rCJZmXoJaTce3qx9eb6WopxOG5tLhmY2rVGJPqE8dQkPl9m6U0SWtxE=
X-Google-Smtp-Source: AMrXdXt3BxQIqTxOqkZgttnM14083jf1nNLXi5UmBRN7mgrnfilFduYFVlRgiHAd5NQI+AQiu2kteJUtG/S7y/aIXVk=
X-Received: by 2002:a17:902:8d94:b0:189:a2d4:7f5 with SMTP id
 v20-20020a1709028d9400b00189a2d407f5mr3983108plo.23.1674738410299; Thu, 26
 Jan 2023 05:06:50 -0800 (PST)
MIME-Version: 1.0
References: <CAHHqYPMHBuPZqG9Rd9i+hN9Mq89pRn6M_0PLsyWkcK_hZr3xAA@mail.gmail.com>
 <Y9Jwv1ColWNwH4+0@kroah.com>
In-Reply-To: <Y9Jwv1ColWNwH4+0@kroah.com>
From:   Troels Liebe Bentsen <troels@connectedcars.dk>
Date:   Thu, 26 Jan 2023 14:06:39 +0100
Message-ID: <CAHHqYPONhyKrqMWiw29TRETtiBatNaej8+62Z40fvuj3LX4RWQ@mail.gmail.com>
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

Hi Greg,

On Thu, 26 Jan 2023 at 13:23, Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Thu, Jan 26, 2023 at 12:49:32PM +0100, Troels Liebe Bentsen wrote:
> > Hi,
> >
> > We have a hardware projekt where something is off with power ON
> > timing. It sometimes gets started in a broken state where the device
> > is seen by the USB system but does not respond to descriptor reads.
>
> Ah, a broken USB device, not much the kernel can do about that :(

Would be nice if it could, but I settle for papering over the worst parts  :)

>
> > When this happens this causes lsusb and libusb based tools to hang
> > until the descriptor read in the USB subsystem timeout out after 30
> > seconds or so. It looks like the tools are trying to read
> > /sys/bus/usb/devices/.../descriptors and it blocks until the timeout
> > happens.
> >
> > We should fix our hardware and have done so in the next revision but
> > why should one device be able to block the descriptors file that most
> > user land USB code seem to use.
>
> If the device does not respond, what is the kernel or userspace supposed
> to do?

Might not have been clear that the issue is when I "plug in"/connect the
device that it happens. I think the kernel is doing the right thing here and
just timing out the device and at least in the kernel it does not seem to block
other devices from doing their thing. The problem is that part of the userspace
interface used for listing all devices on a hub block until the timeout
happens.

One nice options would be if the timeout was configurable based on
port/devpath, I can understand 30-60 seconds timeout for a spindel USB
disk, but for other devices 5 seconds would be more than enough to
conclude they are dead, but that's nice to have.

>
> > Would there be any reasoning against just serving the descriptors file
> > as it looked before inserting the broken USB device instead of
> > blocking the read?
>
> So a different device's descriptor file is being blocked by a broken
> device?  Are you sure?  They should all be independent.

Not the descriptor file, but the descriptor*s* under the hub folder in sysfs:

From https://www.kernel.org/doc/Documentation/ABI/testing/sysfs-bus-usb :

What: /sys/bus/usb/devices/usbX/descriptors
Description:
Contains the interface descriptors, in binary.

As I understand it, this is a file that contains all the information for devices
under a hub. Most likely an optimization made for lsusb and libusb so they
don't have to traverse all the individual folders to get the same information.
The problem is that /sys/bus/usb/devices/usbX/descriptors block while the
kernel is trying to do the descriptor read on that one broken device even if
all the other devices on the hub is well behaving the read is blocked until
it times out.

If lsusb and libusb had traversed the folder structure they would not have
blocked as the broken devices never showed in the folder structure:

fx.

tlb@tlb-nuc:/sys/bus/usb/devices/usb3$ ls -1
3-0:1.0 # Device shows up when USB initialization is done
3-10 # Device shows up when USB initialization is done
3-3 # Device shows up when USB initialization is done
...
descriptors # Blocks on read until kernel times out waiting for descriptor read.
...

> > And if we wanted to create a pull request for a change like that would
> > it be accepted or would it be considered breaking the API?
>
> It depends on what the kernel change looks like.  Have you tried
> anything that worked for you that you wish to propose?
>

I would like to change /sys/bus/usb/devices/usbX/descriptors so it never blocks.

Regards Troels

Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3B4A3B7F72
	for <lists+linux-usb@lfdr.de>; Wed, 30 Jun 2021 10:55:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233442AbhF3I5p (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 30 Jun 2021 04:57:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233727AbhF3I5p (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 30 Jun 2021 04:57:45 -0400
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EFFBC061756
        for <linux-usb@vger.kernel.org>; Wed, 30 Jun 2021 01:55:15 -0700 (PDT)
Received: by mail-yb1-xb2e.google.com with SMTP id s129so3793577ybf.3
        for <linux-usb@vger.kernel.org>; Wed, 30 Jun 2021 01:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:cc;
        bh=D67Bi4dIqH/qRU2WngEBH6JuWsWjXHygRjWKcKzg//c=;
        b=MYjk6jte12Iy75egvRQ02nUwXOcT2F/9Pj2F2/GgIadZUzeSRavYCXVPzgdQCxl2GO
         jle9HqIrNKG2yllkWKq2dXgNoUnw3PeIImsiaWMPWYjs6MJxkzmQY3RY3MqNqL9jIDQb
         0dSTl59WIpxg/edbvsYARuw8HjHAReHGthelecVRS8c2XN4QCLrgmtVcDABw0J9LNITM
         OgsPs0oWgAU5lI4NGeJbzFmLn7lNODl9qL2COQ7P0LYZeV7p7KukLcO2eEz0ysAh1Bus
         FM2lpolE1RAinoNX8dxm3PFqEe+4lMZpQtFgtG2liZMAmpNz/zcqYARd+e6kJfmnQLny
         V5Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:cc;
        bh=D67Bi4dIqH/qRU2WngEBH6JuWsWjXHygRjWKcKzg//c=;
        b=qKZDm1J0K8mCLA/Q5MuLH1yaB5WdLotQrztVp6L/PtVfOggWTRXLFXkitG6mAVNMbC
         v3nZuc3PkDLXhKSHfti3b1mAINj0voiDD8B1yIQb5S+wsgjudoJ3qpS94NLNchQ1KsTW
         VPfY7WpO739W1ErtvwwpSXcNMbb7qiRuyt2CHDYzRvhs0PuUUqh850ENhn2dXMEfqo5n
         IaYMg1G7sKMcmyRHVzC9yvtk+dYNcXcEsKybMe1FjyPOv/fv5hso8eMJIUKHinsBHKoT
         KU93soKk0xh+AsymQ3IRDk9+/Ai144goKqPhEM1sQxXQRh+EcNvs4l/m33o+XjvpUIra
         Kn4Q==
X-Gm-Message-State: AOAM531hJvoKFod/GJ5aNz870ZbgHAOgjiGN2sjKWIfHjFm61n287ily
        Xv8NPPjAqYmc8xPk6o3sxNB8IGVUFXRdWqCN/CZ6GXDns70=
X-Google-Smtp-Source: ABdhPJy8hB3BPnIEogYrrIzLxYsqaOnq8efv41suT4rSioyiX9s4q0rv/XLKAgkjfbYA2bpiFYtbhSZ9ZMfRgBPQeJg=
X-Received: by 2002:a25:7b86:: with SMTP id w128mr22259777ybc.273.1625043314906;
 Wed, 30 Jun 2021 01:55:14 -0700 (PDT)
MIME-Version: 1.0
References: <CABSdY3LGN202SN5YJxnk_bMAx2-js=AB0hictqo69ENgWbMQSw@mail.gmail.com>
 <YNtWMnNUsuL5YE3g@kroah.com>
In-Reply-To: <YNtWMnNUsuL5YE3g@kroah.com>
From:   Benjamin Marty <benjamin.marty@gmail.com>
Date:   Wed, 30 Jun 2021 10:55:04 +0200
Message-ID: <CABSdY3KORj8JNg8PATysXSaWjWVfHHA-uFhEEY4f-U8nvOUCWw@mail.gmail.com>
Subject: Re: USB Gadget Filesystem HID stuck on write when using mass storage
 at the same time
Cc:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On the iMX8 device `Linux imx8mm-var-dart 5.4.3-g050b21f4b394 #1 SMP
PREEMPT Fri Oct 9 11:36:53 PDT 2020 aarch64 GNU/Linux` and on the
Raspberry Pi device `Linux raspberry 5.10.17-v7l+ #1403 SMP Mon Feb 22
11:33:35 GMT 2021 armv7l GNU/Linux`.

File write to `/dev/hidg0` starts to hang when there was high mass
storage traffic. It also doesn't recover itself. There is no `complete
kernel lockup`.

I haven't used usbmon yet but if I don't have high traffic scenarios
on the mass storage then the mass storage and HID device works as
expected. So I'm confident that I send the correct data.

Also saw that I'm getting this error in dmesg on both devices:
[ 1895.677053] configfs-gadget gadget: End Point Request ERROR: -108

Thanks

Benjamin

Am Di., 29. Juni 2021 um 19:20 Uhr schrieb Greg KH <gregkh@linuxfoundation.org>:
>
> On Tue, Jun 29, 2021 at 03:45:46PM +0200, Benjamin Marty wrote:
> > Hello
> >
> > In my application, I boot a Linux System through USB Gadget mass
> > storage and at the same time pass in USB Touch commands via USB HID
> > Device. Both over the same USB OTG Gadget Link.
> >
> > If I execute USB HID commands during high traffic over the USB Mass
> > Storage, the HID device gets stuck. Writes to it are then blocking
> > forever. I'm not sure if I use something wrong or if this is a Kernel
> > issue. Do I maybe need to check something before I'm allowed to write
> > to the HID device?
> >
> > Hardware issue are unlikely, I tried it on the Raspberry Pi Platform
> > and also on the NXP iMX8MM platform. Both have this HID device stuck
> > issue. I have also tried multiple Intel Computers as USB Host.
> >
> > I tried to document my issue here with test scripts to replicate what
> > I do in my C Application with the same result:
> > https://github.com/raspberrypi/linux/issues/4373
>
> What kernel version are you using for your device?
>
> What is locking up, the kernel on the device, or the kernel on the USB
> host side?
>
> And have you used usbmon to look at the USB traffic to ensure that you
> really are sending the data you think you are sending?
>
> thanks,
>
> greg k-h

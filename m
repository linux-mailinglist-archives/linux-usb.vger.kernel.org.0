Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0EEC13B80D7
	for <lists+linux-usb@lfdr.de>; Wed, 30 Jun 2021 12:25:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234014AbhF3K1v (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 30 Jun 2021 06:27:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233959AbhF3K1u (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 30 Jun 2021 06:27:50 -0400
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AF09C061756
        for <linux-usb@vger.kernel.org>; Wed, 30 Jun 2021 03:25:21 -0700 (PDT)
Received: by mail-yb1-xb2c.google.com with SMTP id p15so4133936ybe.6
        for <linux-usb@vger.kernel.org>; Wed, 30 Jun 2021 03:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vycuH5kI+EmbhBmtqtupQN6izlv7YCQHgkRvx/zTlCU=;
        b=nVCCzT5AbE6RFlQ2UE+ekXLBfKRzj1FR3gf+qegApydTG/3Me2/timnMRgpaf9qX7h
         4vJef5FYOnJo+MWzufhbyKpURRVykG4WLwgJ7fan1xclVyYQm2mmNIJ8x0ToHdfCEMjN
         fwdfGiIbyb4+u7Q48QdJkquVrs+/SbuUGOonxOaU/oz0OgeM3b0Jygl5LAiKL0OuVSV7
         0/mqqYvbxVe4OsvXVeCV9wMr/FKFkRPCQMaEVBDHGEI3gGCpIFwcOqyUw42RgCIDmZ0c
         0SbU6ssgra2rIWSX7wm+P6LMBTOG/yGzmeVZfInU0vfEW5YkxcvxBxKWpfrPdj9riOQ/
         TjFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vycuH5kI+EmbhBmtqtupQN6izlv7YCQHgkRvx/zTlCU=;
        b=caM4GzN84QGAzcaRkd7mI4BDN0+T2ywNN63AHomp/UkqTNVMDniOXIqOsPUmUluWMe
         Jk4ntPt30tJjBGWuR9uur+B4AnMqKcoGzqv/iDIXiqxj4kx3f+kJf8iuZ7Sqf16naMeu
         1E7rz3eLA/h5bvuzHCaCQl7D4WexGPXTGKu28cJ+/7tbdr1G7l5+FCzza5x03gQ3RMrm
         2sF6q8KbdGKRfcEuKyQ2eylg8NzAe1kNf64Ds8fEtkX6Tevv8lRyDYb6Fa1cQHKqYuiZ
         dDGSNOc2BWgfBIVZnhed7gEcnvjbs70TNSZUyT7xVSfhosgoa6EP7IH4PGDzW4KENURS
         ULfQ==
X-Gm-Message-State: AOAM531epQ57hedcjIUi3jlXH/N2KcQ/gmjynZsCzv5x+38nXgQZUknc
        dLs7lg7Bj30EioNX1yxQVvamXn6z3ttH/xByJUuEl37zteM=
X-Google-Smtp-Source: ABdhPJxmWFJhKl8IdwLVjdy+/3mcJ/TYjJWQIuHiEmB/Miq7Q6UxSf8vcIGDWRjGS3WzCgdCTXpWniwa1TPPc0DyyaE=
X-Received: by 2002:a25:7ec4:: with SMTP id z187mr43610029ybc.136.1625048720371;
 Wed, 30 Jun 2021 03:25:20 -0700 (PDT)
MIME-Version: 1.0
References: <CABSdY3LGN202SN5YJxnk_bMAx2-js=AB0hictqo69ENgWbMQSw@mail.gmail.com>
 <YNtWMnNUsuL5YE3g@kroah.com> <CABSdY3KORj8JNg8PATysXSaWjWVfHHA-uFhEEY4f-U8nvOUCWw@mail.gmail.com>
 <YNw5Iemje5SddNzc@kroah.com>
In-Reply-To: <YNw5Iemje5SddNzc@kroah.com>
From:   Benjamin Marty <benjamin.marty@gmail.com>
Date:   Wed, 30 Jun 2021 12:25:09 +0200
Message-ID: <CABSdY3KyA-R3RDcnPZ2W5GNtdrPee_0WQMKBJRaJe3ZQu_N+fw@mail.gmail.com>
Subject: Re: USB Gadget Filesystem HID stuck on write when using mass storage
 at the same time
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Mi., 30. Juni 2021 um 11:28 Uhr schrieb Greg KH <gregkh@linuxfoundation.org>:
> On Wed, Jun 30, 2021 at 10:55:04AM +0200, Benjamin Marty wrote:
> > On the iMX8 device `Linux imx8mm-var-dart 5.4.3-g050b21f4b394 #1 SMP
> > PREEMPT Fri Oct 9 11:36:53 PDT 2020 aarch64 GNU/Linux` and on the
> > Raspberry Pi device `Linux raspberry 5.10.17-v7l+ #1403 SMP Mon Feb 22
> > 11:33:35 GMT 2021 armv7l GNU/Linux`.
>
> I do not understand, which is the host and which is the gadget here?

I use both as Gadget, two different HW platforms to rule out a
Hardware related issue.
As Host, I've tried multiple normal Intel computers.
I was able to reproduce this issue with all HW Combinations

> > File write to `/dev/hidg0` starts to hang when there was high mass
> > storage traffic. It also doesn't recover itself. There is no `complete
> > kernel lockup`.
>
> File write on the host or gadget?

File write on the gadget to the gadget HID device `/dev/hidg0`

> If things are not locked up, what is stalled?

The File write to the gadget HID device is stalled.

> > I haven't used usbmon yet but if I don't have high traffic scenarios
> > on the mass storage then the mass storage and HID device works as
> > expected. So I'm confident that I send the correct data.
>
> That's fine, but it is good to use usbmon to see what the errors are as
> well when things go wrong.

Unfortunately both Kernel Versions don't have the usbmon module, need
to recompile the Kernel first.

> > Also saw that I'm getting this error in dmesg on both devices:
> > [ 1895.677053] configfs-gadget gadget: End Point Request ERROR: -108
>
> Ah, is your userspace code on the gadget not handling this properly?
> What userspace code is running on the gadget for your USB device
> emulation?

Yes, my userspace code is on the gadget. It runs after I've setup the
gadget HID + gadget Mass Storage. But it starts to fail after High
Traffic scenarios to the gadget Mass Storage.

To replicate the issue, I wrote a simple Bash script which just
wiggles the gadget HID (Mouse) every 50ms:

while true; do
if [ -e "/dev/hidg0" ]; then
echo write0
echo \\x00\\xff\\xff\\x00\\xff\\xff > /dev/hidg0
sleep 0.05
echo write1
echo \\x00\\xff\\xff\\x00\\xff\\x00 > /dev/hidg0
sleep 0.05
fi
done

Do I need to check something before writing to the gadget HID device?
Or should this usage of the gadget HID device be fine?

Thanks

Benjamin

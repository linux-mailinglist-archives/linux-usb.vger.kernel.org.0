Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8EB6E1000F6
	for <lists+linux-usb@lfdr.de>; Mon, 18 Nov 2019 10:09:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726708AbfKRJJw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 18 Nov 2019 04:09:52 -0500
Received: from mail-io1-f67.google.com ([209.85.166.67]:44591 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726460AbfKRJJv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 18 Nov 2019 04:09:51 -0500
Received: by mail-io1-f67.google.com with SMTP id j20so6833968ioo.11;
        Mon, 18 Nov 2019 01:09:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=u4HgSkMzE4iVC5LW/seWzQGSJ+Ei13PBQsERT1tUML0=;
        b=eXdzBu6eNcShD5tKrPW7CDnBmIb2CgN0EUBIECu1wGT3wrU5j6LuG7lQh977GcAf5M
         ocHDT8xMqXn7OXOzTyHD4/+7K9pNvgNpOjK5JjulSiMB9V59C1MmeQW04Zrp7+sCYBNF
         0/vVoerZ6NwM42Hpw07KzxCebzejKR8K0s9dc2hydrsJQ+B0P4Oymcw4a2gBjW+vJ+M/
         Gh9dAfg4aqSUQokb6nbgb3OkR4ehdxSjy7AIgj5iGifS6rLdkPmXD57HvugcFuKmzqt4
         j69QNltGvM8Jq47RqiTkh32rU9fqfUpBmYDJxjbXbuuKCcCdCie6NGDPdZYg5RwAvFm9
         9Rog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=u4HgSkMzE4iVC5LW/seWzQGSJ+Ei13PBQsERT1tUML0=;
        b=UvpcDLGtgMQaAViOaRV+VFZLDESRQkkY19LHcEb6viq8MCGYACTSLnM+QGgkBpyvDE
         WlLKZ96wFKCpzcygQ5R5pHS5F/Jj7MIJDcb2DZaa4/6krMyLkfP0bTMr8VXg8Ar9Si2A
         KnNV8NNuAl6fA/9RiZ8k9RlwnvI4AMthRXijydg3NwgnxPLCXrlopeGqfRAoPqejYZgk
         ZAejAry53/ZbA3Q0sL0OhzIyBcmpL6CYDF7lClmERzESh2UO+eWH8l54HOzpA++2uAVX
         Qn/GGaVfvBLVSxNRm5GkbFrKes4jQsrK6EYzL2kHwLxqCwLVHg7js4PaIylBvJGAFb9e
         kQlA==
X-Gm-Message-State: APjAAAWVe3sAJerGvMrg0Jv/38vKmow66cTafTqxDTaRaglkEofTTWiU
        2IQjxNg5QZulRo53fpL+jDoeGJ1Eh0F9SNdXWik=
X-Google-Smtp-Source: APXvYqyMxBZFqkuwLi9/CsXsLO5eNh//bOflfrwz18Oe/pw2eVVRdiRWaTFo5eZWQJPqtI58B43bhW8pC0lAlS6luss=
X-Received: by 2002:a6b:204:: with SMTP id 4mr12262515ioc.303.1574068190919;
 Mon, 18 Nov 2019 01:09:50 -0800 (PST)
MIME-Version: 1.0
References: <20191030034046.188808-1-weiyongjun1@huawei.com> <20191030081101.GF26815@b29397-desktop>
In-Reply-To: <20191030081101.GF26815@b29397-desktop>
From:   Peter Chen <hzpeterchen@gmail.com>
Date:   Mon, 18 Nov 2019 17:09:39 +0800
Message-ID: <CAL411-pVmtTr58YFmsotcY+w2KR3kR1hQ1bJOG9CNA-fmPQYGg@mail.gmail.com>
Subject: Re: [PATCH -next] usb: gadget: configfs: Fix missing spin_lock_init()
To:     Peter Chen <peter.chen@nxp.com>, Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Wei Yongjun <weiyongjun1@huawei.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

BR,
Peter Chen

On Wed, Oct 30, 2019 at 4:12 PM Peter Chen <peter.chen@nxp.com> wrote:
>
> On 19-10-30 03:40:46, Wei Yongjun wrote:
> > The driver allocates the spinlock but not initialize it.
> > Use spin_lock_init() on it to initialize it correctly.
> >
> > This is detected by Coccinelle semantic patch.
> >
> > Fixes: 1a1c851bbd70 ("usb: gadget: configfs: fix concurrent issue between composite APIs")
> > Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> > ---
> >  drivers/usb/gadget/configfs.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
> > index 33852c2b29d1..ab9ac48a751a 100644
> > --- a/drivers/usb/gadget/configfs.c
> > +++ b/drivers/usb/gadget/configfs.c
> > @@ -1544,6 +1544,7 @@ static struct config_group *gadgets_make(
> >       gi->composite.resume = NULL;
> >       gi->composite.max_speed = USB_SPEED_SUPER;
> >
> > +     spin_lock_init(&gi->spinlock);
> >       mutex_init(&gi->lock);
> >       INIT_LIST_HEAD(&gi->string_list);
> >       INIT_LIST_HEAD(&gi->available_func);
> >
>
> Reviewed-by: Peter Chen <peter.chen@nxp.com>

Hi Felipe & Greg,

We may need this patch for usb/next and usb/linus tree, otherwise, there will
be kernel dump if enable lockdep:

mount: /sys/kernel/config: none already mounted or mount point busy.
[   77.368029] Mass Storage Function, version: 2009/09/11
[   77.373485] LUN: removable file: (no medium)
[   77.483545] INFO: trying to register non-static key.
[   77.488532] the code is fine but needs lockdep annotation.
[   77.494020] turning off the locking correctness validator.
[   77.499516] CPU: 0 PID: 497 Comm: sh Not tainted
5.4.0-rc6-00127-g65ce4f17e132 #132
[   77.507174] Hardware name: Freescale i.MX6 SoloLite (Device Tree)
[   77.513295] [<c0112b00>] (unwind_backtrace) from [<c010ccf8>]
(show_stack+0x10/0x14)
[   77.521055] [<c010ccf8>] (show_stack) from [<c0c47654>]
(dump_stack+0xd4/0x108)
[   77.528380] [<c0c47654>] (dump_stack) from [<c0184eb4>]
(register_lock_class+0x6a0/0x724)
[   77.536567] [<c0184eb4>] (register_lock_class) from [<c0182aa4>]
(__lock_acquire+0x58/0x10dc)
[   77.545099] [<c0182aa4>] (__lock_acquire) from [<c01843b0>]
(lock_acquire+0xd4/0x1f4)
[   77.552939] [<c01843b0>] (lock_acquire) from [<c0c6aac0>]
(_raw_spin_lock_irqsave+0x38/0x4c)
[   77.561413] [<c0c6aac0>] (_raw_spin_lock_irqsave) from [<bf01c8ec>]
(configfs_composite_disconnect+0x20/0x64 [libco
mposite])
[   77.572668] [<bf01c8ec>] (configfs_composite_disconnect
[libcomposite]) from [<c0810ad0>] (usb_gadget_disconnect+0x
13c/0x184)
[   77.583985] [<c0810ad0>] (usb_gadget_disconnect) from [<c080a9d0>]
(ci_udc_start+0x74/0x94)
[   77.592344] [<c080a9d0>] (ci_udc_start) from [<c08111c8>]
(udc_bind_to_driver+0x98/0x100)
[   77.600528] [<c08111c8>] (udc_bind_to_driver) from [<c081164c>]
(usb_gadget_probe_driver+0xfc/0x14c)
[   77.609690] [<c081164c>] (usb_gadget_probe_driver) from
[<bf01d55c>] (gadget_dev_desc_UDC_store+0xb4/0xcc [libcompo
site])
[   77.620692] [<bf01d55c>] (gadget_dev_desc_UDC_store [libcomposite])
from [<bf00d730>] (configfs_write_file+0x10c/0x
1b4 [configfs])
[   77.632457] [<bf00d730>] (configfs_write_file [configfs]) from
[<c0291da0>] (__vfs_write+0x28/0x1c4)
[   77.641601] [<c0291da0>] (__vfs_write) from [<c02944bc>]
(vfs_write+0xa0/0x180)
[   77.648919] [<c02944bc>] (vfs_write) from [<c0294704>] (ksys_write+0x54/0xcc)
[   77.656064] [<c0294704>] (ksys_write) from [<c0101000>]
(ret_fast_syscall+0x0/0x28)
[   77.663723] Exception stack(0xecafffa8 to 0xecaffff0)
[   77.668781] ffa0:                   0000000a 00256330 00000001
00256330 0000000a 00000000
[   77.676964] ffc0: 0000000a 00256330 b6e9ada8 00000004 0000000a
0000000a 00000000 00000000
[   77.685145] ffe0: 00000444 bef0b9d0 b6dc7a18 b6e1f6cc

Peter

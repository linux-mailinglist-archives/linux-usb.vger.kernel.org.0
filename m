Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8653F549C81
	for <lists+linux-usb@lfdr.de>; Mon, 13 Jun 2022 21:00:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346116AbiFMTAI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 13 Jun 2022 15:00:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343675AbiFMS7J (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 13 Jun 2022 14:59:09 -0400
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com [IPv6:2607:f8b0:4864:20::d35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADEF36F4B6
        for <linux-usb@vger.kernel.org>; Mon, 13 Jun 2022 09:15:40 -0700 (PDT)
Received: by mail-io1-xd35.google.com with SMTP id r5so6601227iod.5
        for <linux-usb@vger.kernel.org>; Mon, 13 Jun 2022 09:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PYZe5UL43Pt/5rjj2IGf6yyCJ3NQfWmYVfUD+mx7O1w=;
        b=UeN/WQLW+puNI6LeYRJXu1w8vNh6/RgWKRNXyVQa/ozSw0Gyz2df4viJf7V9Sgo7zg
         uPLX82XgDcqA2NbLDgZ3HpFqPdynymC5bPHlywgU4Jvc4ZYz6HVQAumaWBMYBWVn+2k0
         aDCtycL1a2LGrjhJywOS8a5d+PGdB8/QFoy1tGpUSLBlNnUFjQvkrX47QjfMe7xzbU4M
         hmOoePrsopODNYvMZhOAqChkYKkTnE2rQQEKN7TxHHpH64YRs57+DwVtbEpm2Tha3lLa
         AcH393d2lPKKWA6Eficax9PHE/8zOS0HOhRL2NFNouF6Dm6ZOlf7+pdTGBlwfC84gp7F
         xYng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PYZe5UL43Pt/5rjj2IGf6yyCJ3NQfWmYVfUD+mx7O1w=;
        b=efL5jamArpPmq7O0JYmoiXaqSHQS9/xxqkYJFl3RqCXZKyZwzlOZJaoboMVrp9IAJn
         TVMCBHFgXSoMDmg/ZVy5FecbkLbaieTJcne6GCuwkFEh+E3tsgAZppXNsn8SYGpC8BMA
         veyG8MyXiDDOINkK3jQxPObfUkP9uAz1BiGZ08VhrqfzcHWiZ8AznuD812DmWQuteY6M
         XlEz6QJ3AH+8f/IpLnz4dhQs7snDlu0kihT9ZMy5G9DJxgTtYEytVD7gHj2bsQa3c2pa
         2/k2Yoz7SDDnExofTpKNcleroTA50H2onDmzrPDuHf8xXgT4IUs9BGbZkR4EMNT+X7C4
         7YBg==
X-Gm-Message-State: AOAM533knl4K7UUD5AmyRR6nqf8oT/K2xftJJlhs219kTRslq6hExSPQ
        EFfImGdhxCQIPNnEw7kII1gLVQgFBnmeN6E6QiY=
X-Google-Smtp-Source: ABdhPJxfe3c7lq3/rya57tG+Tx3CbYMsbDQgVQJf+FD2aGBjFs516745zpFSChkspi17fheKORKkn0v7tkcVMgg5LPM=
X-Received: by 2002:a05:6638:13d5:b0:331:a6f2:3dbf with SMTP id
 i21-20020a05663813d500b00331a6f23dbfmr336266jaj.9.1655136939904; Mon, 13 Jun
 2022 09:15:39 -0700 (PDT)
MIME-Version: 1.0
References: <YqdG32w+3h8c1s7z@rowland.harvard.edu>
In-Reply-To: <YqdG32w+3h8c1s7z@rowland.harvard.edu>
From:   Andrey Konovalov <andreyknvl@gmail.com>
Date:   Mon, 13 Jun 2022 18:15:29 +0200
Message-ID: <CA+fCnZfXEyxMhO07Vw9swOr8pWakMbtkF6GRrqB4n3G4X5-bKA@mail.gmail.com>
Subject: Re: [PATCH] usb: gadget: Fix non-unique driver names in raw-gadget driver
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Hillf Danton <hdanton@sina.com>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        USB mailing list <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jun 13, 2022 at 4:17 PM Alan Stern <stern@rowland.harvard.edu> wrote:
>
> In a report for a separate bug (which has already been fixed by commit
> 5f0b5f4d50fa "usb: gadget: fix race when gadget driver register via
> ioctl") in the raw-gadget driver, the syzbot console log included
> error messages caused by attempted registration of a new driver with
> the same name as an existing driver:
>
> > kobject_add_internal failed for raw-gadget with -EEXIST, don't try to register things with the same name in the same directory.
> > UDC core: USB Raw Gadget: driver registration failed: -17
> > misc raw-gadget: fail, usb_gadget_register_driver returned -17
>
> These errors arise because raw_gadget.c registers a separate UDC
> driver for each of the UDC instances it creates, but these drivers all
> have the same name: "raw-gadget".  Until recently this wasn't a
> problem, but when the "gadget" bus was added and UDC drivers were
> registered on this bus, it became possible for name conflicts to cause
> the registrations to fail.  The reason is simply that the bus code in
> the driver core uses the driver name as a sysfs directory name (e.g.,
> /sys/bus/gadget/drivers/raw-gadget/), and you can't create two
> directories with the same pathname.
>
> To fix this problem, the driver names used by raw-gadget are made
> distinct by appending a unique ID number: "raw-gadget.N", with a
> different value of N for each driver instance.  And to avoid the
> proliferation of error handling code in the raw_ioctl_init() routine,
> the error return paths are refactored into the common pattern (goto
> statements leading to cleanup code at the end of the routine).
>
> Reported-and-tested-by: syzbot+02b16343704b3af1667e@syzkaller.appspotmail.com
> Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
> Acked-by: Hillf Danton <hdanton@sina.com>
> CC: Andrey Konovalov <andreyknvl@gmail.com>
> CC: <stable@vger.kernel.org>
> Fixes: fc274c1e9973 "USB: gadget: Add a new bus for gadgets"
> Link: https://lore.kernel.org/all/0000000000008c664105dffae2eb@google.com/
>
> ---
>
>
> [as1981]
>
>
>  drivers/usb/gadget/legacy/raw_gadget.c |   62 ++++++++++++++++++++++++---------
>  1 file changed, 46 insertions(+), 16 deletions(-)
>
> Index: usb-devel/drivers/usb/gadget/legacy/raw_gadget.c
> ===================================================================
> --- usb-devel.orig/drivers/usb/gadget/legacy/raw_gadget.c
> +++ usb-devel/drivers/usb/gadget/legacy/raw_gadget.c
> @@ -11,6 +11,7 @@
>  #include <linux/ctype.h>
>  #include <linux/debugfs.h>
>  #include <linux/delay.h>
> +#include <linux/idr.h>
>  #include <linux/kref.h>
>  #include <linux/miscdevice.h>
>  #include <linux/module.h>
> @@ -36,6 +37,9 @@ MODULE_LICENSE("GPL");
>
>  /*----------------------------------------------------------------------*/
>
> +static DEFINE_IDA(driver_id_numbers);
> +#define DRIVER_DRIVER_NAME_LENGTH_MAX  32
> +
>  #define RAW_EVENT_QUEUE_SIZE   16
>
>  struct raw_event_queue {
> @@ -161,6 +165,9 @@ struct raw_dev {
>         /* Reference to misc device: */
>         struct device                   *dev;
>
> +       /* Make driver names unique */
> +       int                             driver_id_number;
> +
>         /* Protected by lock: */
>         enum dev_state                  state;
>         bool                            gadget_registered;
> @@ -189,6 +196,7 @@ static struct raw_dev *dev_new(void)
>         spin_lock_init(&dev->lock);
>         init_completion(&dev->ep0_done);
>         raw_event_queue_init(&dev->queue);
> +       dev->driver_id_number = -1;
>         return dev;
>  }
>
> @@ -199,6 +207,9 @@ static void dev_free(struct kref *kref)
>
>         kfree(dev->udc_name);
>         kfree(dev->driver.udc_name);
> +       kfree(dev->driver.driver.name);
> +       if (dev->driver_id_number >= 0)
> +               ida_free(&driver_id_numbers, dev->driver_id_number);
>         if (dev->req) {
>                 if (dev->ep0_urb_queued)
>                         usb_ep_dequeue(dev->gadget->ep0, dev->req);
> @@ -422,6 +433,7 @@ static int raw_ioctl_init(struct raw_dev
>         struct usb_raw_init arg;
>         char *udc_driver_name;
>         char *udc_device_name;
> +       char *driver_driver_name;
>         unsigned long flags;
>
>         if (copy_from_user(&arg, (void __user *)value, sizeof(arg)))
> @@ -440,36 +452,44 @@ static int raw_ioctl_init(struct raw_dev
>                 return -EINVAL;
>         }
>
> +       ret = ida_alloc(&driver_id_numbers, GFP_KERNEL);
> +       if (ret < 0)
> +               return ret;
> +       dev->driver_id_number = ret;
> +
> +       driver_driver_name = kmalloc(DRIVER_DRIVER_NAME_LENGTH_MAX, GFP_KERNEL);
> +       if (!driver_driver_name) {
> +               ret = -ENOMEM;
> +               goto out_free_driver_id_number;
> +       }
> +       snprintf(driver_driver_name, DRIVER_DRIVER_NAME_LENGTH_MAX,
> +                               DRIVER_NAME ".%d", dev->driver_id_number);
> +
>         udc_driver_name = kmalloc(UDC_NAME_LENGTH_MAX, GFP_KERNEL);
> -       if (!udc_driver_name)
> -               return -ENOMEM;
> +       if (!udc_driver_name) {
> +               ret = -ENOMEM;
> +               goto out_free_driver_driver_name;
> +       }
>         ret = strscpy(udc_driver_name, &arg.driver_name[0],
>                                 UDC_NAME_LENGTH_MAX);
> -       if (ret < 0) {
> -               kfree(udc_driver_name);
> -               return ret;
> -       }
> +       if (ret < 0)
> +               goto out_free_udc_driver_name;
>         ret = 0;
>
>         udc_device_name = kmalloc(UDC_NAME_LENGTH_MAX, GFP_KERNEL);
>         if (!udc_device_name) {
> -               kfree(udc_driver_name);
> -               return -ENOMEM;
> +               ret = -ENOMEM;
> +               goto out_free_udc_driver_name;
>         }
>         ret = strscpy(udc_device_name, &arg.device_name[0],
>                                 UDC_NAME_LENGTH_MAX);
> -       if (ret < 0) {
> -               kfree(udc_driver_name);
> -               kfree(udc_device_name);
> -               return ret;
> -       }
> +       if (ret < 0)
> +               goto out_free_udc_device_name;
>         ret = 0;
>
>         spin_lock_irqsave(&dev->lock, flags);
>         if (dev->state != STATE_DEV_OPENED) {
>                 dev_dbg(dev->dev, "fail, device is not opened\n");
> -               kfree(udc_driver_name);
> -               kfree(udc_device_name);
>                 ret = -EINVAL;
>                 goto out_unlock;
>         }
> @@ -484,14 +504,24 @@ static int raw_ioctl_init(struct raw_dev
>         dev->driver.suspend = gadget_suspend;
>         dev->driver.resume = gadget_resume;
>         dev->driver.reset = gadget_reset;
> -       dev->driver.driver.name = DRIVER_NAME;
> +       dev->driver.driver.name = driver_driver_name;
>         dev->driver.udc_name = udc_device_name;
>         dev->driver.match_existing_only = 1;
>
>         dev->state = STATE_DEV_INITIALIZED;
> +       spin_unlock_irqrestore(&dev->lock, flags);
> +       return ret;
>
>  out_unlock:
>         spin_unlock_irqrestore(&dev->lock, flags);
> +out_free_udc_device_name:
> +       kfree(udc_device_name);
> +out_free_udc_driver_name:
> +       kfree(udc_driver_name);
> +out_free_driver_driver_name:
> +       kfree(driver_driver_name);
> +out_free_driver_id_number:
> +       ida_free(&driver_id_numbers, dev->driver_id_number);
>         return ret;
>  }
>

Reviewed-by: Andrey Konovalov <andreyknvl@gmail.com>

Thank you for fixing this, Alan!

Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9EABE4E3EED
	for <lists+linux-usb@lfdr.de>; Tue, 22 Mar 2022 13:58:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235103AbiCVM6v (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 22 Mar 2022 08:58:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235050AbiCVM6n (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 22 Mar 2022 08:58:43 -0400
Received: from mail-vs1-xe2d.google.com (mail-vs1-xe2d.google.com [IPv6:2607:f8b0:4864:20::e2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C4F67E59E
        for <linux-usb@vger.kernel.org>; Tue, 22 Mar 2022 05:57:16 -0700 (PDT)
Received: by mail-vs1-xe2d.google.com with SMTP id o67so1440643vsc.0
        for <linux-usb@vger.kernel.org>; Tue, 22 Mar 2022 05:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Ppk4E5hYstLtlP6lp8ICcikx4DHgZFKDbW5AAggvyp4=;
        b=h+aYh8qwAh0UWC0P1YNSPbmFo/bym0qi4GWojagLChRGKGnqh150DFUZpK71ETFZvR
         9NWBQtpH+nwNsEwJj5rUdeXvddoVz/Kc/vCezqdTVneUS5m4KkGrBnwXn4iXqBwcqfD/
         y3VoBEoVdEDLlK0/J84XV97KaRSm++2H+spgQUsPoKnQZ+ITBi7kdDYjtQ821f/sr1aX
         b+3F2j0nE92cD601xxuON4t9RmE/5RKFIx3OH7kUZ4X93WE5RDYTL9QoumW3hVTq4GLQ
         pYqhSunDrjnZEWKwwYUh7xHtS+ny9mXUK93ZUqzmAiPaSXL5HJ0ICL65CJYjPgusnVSA
         AfnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Ppk4E5hYstLtlP6lp8ICcikx4DHgZFKDbW5AAggvyp4=;
        b=4THFtsHFZHF07qIiz/hKezeHr52lhupM0TKGHx5MvtGW0jd8Tt0K2bUtorC7x3Sa98
         Bz9mKEphYKCZHNs8Xsr9BWEnV1CiE6lM1l3kgPm1eIzqvhAG0HHPvxsFg3FRz187sYRm
         4Oj+0TQ0r5PnJV8oKXfJTInbJrRIZN0bFA3VctLAns6ywIKm8ritUiXprMfJ5QQOhf6j
         iUQoT4up+1cHT4Y9rokLTViSFzHJYstH0uulVadlFdWonZoeC3wLDr8Jgr68tQKMplWi
         AqjT8MKZdZKzfTr7vPwjfRl3wc6hb2msq6KqQ0MEUEUGmpsnWIVXUb4nnXnTIUCTdxbl
         GJ3Q==
X-Gm-Message-State: AOAM530EsexgQ2auR0hyeK5Vh42MWDth4nkTAm0CrMp+TWY0XB3l7X0+
        oQ80QBw+Cjoz6++TMLhfP0osr0DzL1K3ajBokM8=
X-Google-Smtp-Source: ABdhPJygHHoa2/UTtXQcBrBslzhE3K1ccSz/R2LAv9mwYqbUcQcwOh6A+pZ+ydhNU8zY1xB5uzdZnr+ovv2UckDm3Lk=
X-Received: by 2002:a67:c787:0:b0:31e:874e:b9a3 with SMTP id
 t7-20020a67c787000000b0031e874eb9a3mr9177725vsk.54.1647953835452; Tue, 22 Mar
 2022 05:57:15 -0700 (PDT)
MIME-Version: 1.0
References: <YjeEbHL8ITkW692W@rowland.harvard.edu> <YjeEwspj0V3JaV1L@rowland.harvard.edu>
In-Reply-To: <YjeEwspj0V3JaV1L@rowland.harvard.edu>
From:   Jun Li <lijun.kernel@gmail.com>
Date:   Tue, 22 Mar 2022 20:57:04 +0800
Message-ID: <CAKgpwJUMXiPoLNNXzk2d=532fhfdWK0awopd0PPPg87kBi3=jg@mail.gmail.com>
Subject: Re: [RFC PATCH 1/4] USB: gadget: Rename usb_gadget_probe_driver()
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        USB mailing list <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Alan Stern <stern@rowland.harvard.edu> =E4=BA=8E2022=E5=B9=B43=E6=9C=8822=
=E6=97=A5=E5=91=A8=E4=BA=8C 06:57=E5=86=99=E9=81=93=EF=BC=9A
>
> In preparation for adding a "gadget" bus, this patch renames
> usb_gadget_probe_driver() to usb_gadget_register_driver().  The new
> name will be more accurate, since gadget drivers will be registered on
> the gadget bus and the probing will be done by the driver core, not
> the UDC core.
>
> Signed-off-by: Alan Stern <stern@rowland.harvard.edu>

Missed one rename change:
diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
index 1fb837d9271e..4141206bb0ed 100644
--- a/drivers/usb/gadget/configfs.c
+++ b/drivers/usb/gadget/configfs.c
@@ -284,7 +284,7 @@ static ssize_t gadget_dev_desc_UDC_store(struct
config_item *item,
                        goto err;
                }
                gi->composite.gadget_driver.udc_name =3D name;
-               ret =3D usb_gadget_probe_driver(&gi->composite.gadget_drive=
r);
+               ret =3D usb_gadget_register_driver(&gi->composite.gadget_dr=
iver);
                if (ret) {
                        gi->composite.gadget_driver.udc_name =3D NULL;
                        goto err;
Li Jun
>
>
>  drivers/usb/gadget/composite.c         |    2 +-
>  drivers/usb/gadget/legacy/dbgp.c       |    2 +-
>  drivers/usb/gadget/legacy/inode.c      |    2 +-
>  drivers/usb/gadget/legacy/raw_gadget.c |    4 ++--
>  drivers/usb/gadget/udc/core.c          |    4 ++--
>  include/linux/usb/gadget.h             |    4 ++--
>  6 files changed, 9 insertions(+), 9 deletions(-)
>
> Index: usb-devel/drivers/usb/gadget/composite.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- usb-devel.orig/drivers/usb/gadget/composite.c
> +++ usb-devel/drivers/usb/gadget/composite.c
> @@ -2500,7 +2500,7 @@ int usb_composite_probe(struct usb_compo
>         gadget_driver->driver.name =3D driver->name;
>         gadget_driver->max_speed =3D driver->max_speed;
>
> -       return usb_gadget_probe_driver(gadget_driver);
> +       return usb_gadget_register_driver(gadget_driver);
>  }
>  EXPORT_SYMBOL_GPL(usb_composite_probe);
>
> Index: usb-devel/drivers/usb/gadget/legacy/dbgp.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- usb-devel.orig/drivers/usb/gadget/legacy/dbgp.c
> +++ usb-devel/drivers/usb/gadget/legacy/dbgp.c
> @@ -422,7 +422,7 @@ static struct usb_gadget_driver dbgp_dri
>
>  static int __init dbgp_init(void)
>  {
> -       return usb_gadget_probe_driver(&dbgp_driver);
> +       return usb_gadget_register_driver(&dbgp_driver);
>  }
>
>  static void __exit dbgp_exit(void)
> Index: usb-devel/drivers/usb/gadget/legacy/inode.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- usb-devel.orig/drivers/usb/gadget/legacy/inode.c
> +++ usb-devel/drivers/usb/gadget/legacy/inode.c
> @@ -1873,7 +1873,7 @@ dev_config (struct file *fd, const char
>         else
>                 gadgetfs_driver.max_speed =3D USB_SPEED_FULL;
>
> -       value =3D usb_gadget_probe_driver(&gadgetfs_driver);
> +       value =3D usb_gadget_register_driver(&gadgetfs_driver);
>         if (value !=3D 0) {
>                 spin_lock_irq(&dev->lock);
>                 goto fail;
> Index: usb-devel/drivers/usb/gadget/legacy/raw_gadget.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- usb-devel.orig/drivers/usb/gadget/legacy/raw_gadget.c
> +++ usb-devel/drivers/usb/gadget/legacy/raw_gadget.c
> @@ -510,12 +510,12 @@ static int raw_ioctl_run(struct raw_dev
>         }
>         spin_unlock_irqrestore(&dev->lock, flags);
>
> -       ret =3D usb_gadget_probe_driver(&dev->driver);
> +       ret =3D usb_gadget_register_driver(&dev->driver);
>
>         spin_lock_irqsave(&dev->lock, flags);
>         if (ret) {
>                 dev_err(dev->dev,
> -                       "fail, usb_gadget_probe_driver returned %d\n", re=
t);
> +                       "fail, usb_gadget_register_driver returned %d\n",=
 ret);
>                 dev->state =3D STATE_DEV_FAILED;
>                 goto out_unlock;
>         }
> Index: usb-devel/drivers/usb/gadget/udc/core.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- usb-devel.orig/drivers/usb/gadget/udc/core.c
> +++ usb-devel/drivers/usb/gadget/udc/core.c
> @@ -1523,7 +1523,7 @@ err1:
>         return ret;
>  }
>
> -int usb_gadget_probe_driver(struct usb_gadget_driver *driver)
> +int usb_gadget_register_driver(struct usb_gadget_driver *driver)
>  {
>         struct usb_udc          *udc =3D NULL;
>         int                     ret =3D -ENODEV;
> @@ -1568,7 +1568,7 @@ found:
>         mutex_unlock(&udc_lock);
>         return ret;
>  }
> -EXPORT_SYMBOL_GPL(usb_gadget_probe_driver);
> +EXPORT_SYMBOL_GPL(usb_gadget_register_driver);
>
>  int usb_gadget_unregister_driver(struct usb_gadget_driver *driver)
>  {
> Index: usb-devel/include/linux/usb/gadget.h
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- usb-devel.orig/include/linux/usb/gadget.h
> +++ usb-devel/include/linux/usb/gadget.h
> @@ -745,7 +745,7 @@ struct usb_gadget_driver {
>   */
>
>  /**
> - * usb_gadget_probe_driver - probe a gadget driver
> + * usb_gadget_register_driver - register a gadget driver
>   * @driver: the driver being registered
>   * Context: can sleep
>   *
> @@ -755,7 +755,7 @@ struct usb_gadget_driver {
>   * registration call returns.  It's expected that the @bind() function w=
ill
>   * be in init sections.
>   */
> -int usb_gadget_probe_driver(struct usb_gadget_driver *driver);
> +int usb_gadget_register_driver(struct usb_gadget_driver *driver);
>
>  /**
>   * usb_gadget_unregister_driver - unregister a gadget driver

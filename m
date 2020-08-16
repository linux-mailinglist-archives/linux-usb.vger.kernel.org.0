Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60B9D24588E
	for <lists+linux-usb@lfdr.de>; Sun, 16 Aug 2020 18:35:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728930AbgHPQfJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 16 Aug 2020 12:35:09 -0400
Received: from mail-40141.protonmail.ch ([185.70.40.141]:64106 "EHLO
        mail-40141.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726847AbgHPQfC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 16 Aug 2020 12:35:02 -0400
Date:   Sun, 16 Aug 2020 16:26:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1597595208;
        bh=VJXZWDr8pvELsKvpITMJ44UTSavFLSVEBFyOsrC8SKw=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=h2AgYKyDHYCXFTy9CKTcH/5AT1ibwEI3xYcG/sPS5bEwZpEzuMcsFhX2EC31xhQMi
         o+NCCswrKFJalSzr/Ylc5Nw2R+UqCZ3QiMtabuoLigwEKPtSteZUJqoCB7uufHw6Rx
         iM5v9ypge97V8NILkc0A1Tfk3fo6Ybs7muZZdneU=
To:     jaap aarts <jaap.aarts1@gmail.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: Re: [PATCH V5] hwmon: add fan/pwm driver for corsair h100i platinum
Message-ID: <YcOLu5n1YsbbIiTVblXKHVMFei1t1cEGBU-xqO_bI-IIJjch8WQH_sVjAlM2kiRBvw98-OrU_ngvOeawnPapk4BjrBuUknPW6Z3qvMkytG0=@protonmail.com>
In-Reply-To: <CACtzdJ3t_yZ+kru0djW3D8zf33eU6xOdP+TErCFCMf3zX7ycaA@mail.gmail.com>
References: <20200816095500.123839-1-jaap.aarts1@gmail.com> <W-BU2h4EaZ7Mkux9N8n5gAkJqGXf2DjXOpj8ik1rbBrdMBvc_OyDzUfJZdtaZ_BXMd2qTtQksE9ptwMkYa_igP-QXqaYlDG5RaMUBVAaM54=@protonmail.com> <CACtzdJ3t_yZ+kru0djW3D8zf33eU6xOdP+TErCFCMf3zX7ycaA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mail.protonmail.ch
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> > > +             fan->fan_channel =3D fan_id;
> > > +             fan->mode =3D 0;
> > > +             data->channel_data[fan_id] =3D fan;
> > > +     }
> > > +
> > > +     hwmon_info->ops =3D &i_pro_ops;
> > > +     hwmon_info->info =3D hdev->config->hwmon_info;
> > > +
> > > +     data->hdev =3D hdev;
> > > +     hwmon_dev =3D devm_hwmon_device_register_with_info(
> > > +             &hdev->udev->dev, hdev->config->name, data, hwmon_info,=
 NULL);
> > > +     if (IS_ERR(hwmon_dev))
> > > +             return PTR_ERR(hwmon_dev);
> > > +
> > > +     dev_info(&hdev->udev->dev, "setup hwmon for %s\n", hdev->config=
->name);
> > > +     return 0;
> > > +}
> >
> > It is still possible that hwmon_init() leaks memory on failure.
>
> you mean the allocated memory doesn't get deallocated until
> the driver detaches? I can't free the memory myself because
> when the driver does detach it will double-free.
> I have looked at how other drivers handle this, none of them
> deallocate any memory.
> If you mean error check the allocations, I added those now.
>

Sorry, my bad, the devm_ part went over my head when reading. I also forgot=
 to
mention that in astk_probe() you use kmalloc() to allocate the IO buffers,
but those are not freed if init_device() or hwmon_init() fails.


Barnab=C3=A1s P=C5=91cze

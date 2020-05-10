Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9BB81CCE3C
	for <lists+linux-usb@lfdr.de>; Sun, 10 May 2020 23:44:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729078AbgEJVoY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 10 May 2020 17:44:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728972AbgEJVoY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 10 May 2020 17:44:24 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCA11C061A0C
        for <linux-usb@vger.kernel.org>; Sun, 10 May 2020 14:44:23 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id k19so3072376pll.9
        for <linux-usb@vger.kernel.org>; Sun, 10 May 2020 14:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :content-transfer-encoding:mime-version;
        bh=TbO75A5Gn8gWHO4gwUNWqoHwkBpk2egJ3kslUHiUBjc=;
        b=Ys8fwHHyoBUtdt4s9CCwekJehrIh/ska7PwkTviYx+3AT7ZT/5ORkSkrZHO/qg9h/P
         c+QTP2XZT/DJniIHP33j9F7b4QpZ4vEysQUJswattEOXJFQGGG/sxegHP4K1rmHemjkY
         QSu7UGL8AdYqIeiI/uRNq0QPETdeLmX7H+nY1ZNRwZQgyV6J9b2vLl8H+BXL3oJ7qPSL
         99oC241UfxIGRlpClQehSF7znp1aCyV4eQM/pEkO8Y1DoeQdXvVATE+QXZLQZ2lxfZBR
         4hEg3L/xzyOLLjMXhmXfDv1/JBAFsurjMrAOpm2TIK+LMdo1ryC+QKL1kzK6GMVfy3uq
         UtzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:thread-topic:thread-index
         :date:message-id:references:in-reply-to:accept-language
         :content-language:content-transfer-encoding:mime-version;
        bh=TbO75A5Gn8gWHO4gwUNWqoHwkBpk2egJ3kslUHiUBjc=;
        b=qHX4U0Mh8scbpVj+RycB92Eq90KG32zpVIDUykwwsyJiRV+F5z7WuPQgl6AuoDGiKp
         8ujKccdWy05W4Tda/a/uIp05WAPXxOKUJIpXS6O0qIjDHB3oIguJl6qikl+hyemwg3cT
         VLtYdn6wAbCGhNS9L/7/JSJYznoK7HXaOv0ftW+mD1QPCgeDp2Mt/24L9WCJJRKXPBjM
         UNWwHZmvFJniQnrmwmoFRml85nMlqQolThuvBMkfbPCYOOQl9GYAa1Ac1nEdAPp8AkHa
         2/XRFIg8ZQmwu+hSvNeRW7ugwlWOc4mjuwQrTee63LLfyWWeCUb2dmOWx59XR+jf3bO0
         gRqA==
X-Gm-Message-State: AGi0PubJTEXGzZfIGgkkPSTzG5iTgtMYkR3tVAeNctCddkG4wzS/Oxwh
        8TKIwlzFZi8jnZiIxJa4uNw=
X-Google-Smtp-Source: APiQypLpiBUrsTPNHWIeSrqoqJ1lPzhBjZ1nog8zsbMNjYWmqB4S+b7C+ekQ8gXMrQwgkeXU7xQodg==
X-Received: by 2002:a17:90a:9302:: with SMTP id p2mr18359448pjo.230.1589147063246;
        Sun, 10 May 2020 14:44:23 -0700 (PDT)
Received: from SL2P216MB0105.KORP216.PROD.OUTLOOK.COM ([2603:1046:100:22::5])
        by smtp.gmail.com with ESMTPSA id j186sm7566456pfb.220.2020.05.10.14.44.20
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 10 May 2020 14:44:22 -0700 (PDT)
From:   Jingoo Han <jingoohan1@gmail.com>
To:     =?iso-8859-1?Q?Noralf_Tr=F8nnes?= <noralf@tronnes.org>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>
CC:     "sam@ravnborg.org" <sam@ravnborg.org>,
        "daniel.thompson@linaro.org" <daniel.thompson@linaro.org>,
        Han Jingoo <jingoohan1@gmail.com>
Subject: Re: [PATCH v2 01/10] backlight: Add backlight_device_get_by_name()
Thread-Topic: [PATCH v2 01/10] backlight: Add backlight_device_get_by_name()
Thread-Index: AWZuNzkxnA4fzGnWCrmX5dZ1Wlp95mZuNzkx3D5IIXY=
X-MS-Exchange-MessageSentRepresentingType: 1
Date:   Sun, 10 May 2020 21:44:17 +0000
Message-ID: <SL2P216MB0105AD2B905A372B585A2828AAA00@SL2P216MB0105.KORP216.PROD.OUTLOOK.COM>
References: <20200509141619.32970-1-noralf@tronnes.org>
 <20200509141619.32970-2-noralf@tronnes.org>
In-Reply-To: <20200509141619.32970-2-noralf@tronnes.org>
Accept-Language: ko-KR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-Exchange-Organization-SCL: -1
X-MS-TNEF-Correlator: 
X-MS-Exchange-Organization-RecordReviewCfmType: 0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 5/9/20, 10:16 AM, Noralf Tr=F8nnes wrote:
>=20
> Add a way to lookup a backlight device based on its name.
> Will be used by a USB display gadget getting the name from configfs.
>
> Cc: Lee Jones <lee.jones@linaro.org>

Please delete this line, because Lee already sent his Acked-by.

> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Jingoo Han <jingoohan1@gmail.com>

Acked-by: Jingoo Han <jingoohan1@gmail.com>

Best regards,
Jingoo Han

> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> Acked-by: Lee Jones <lee.jones@linaro.org>
> Signed-off-by: Noralf Tr=F8nnes <noralf@tronnes.org>
> ---
 > drivers/video/backlight/backlight.c | 21 +++++++++++++++++++++
 > include/linux/backlight.h           |  1 +
 > 2 files changed, 22 insertions(+)
>
> diff --git a/drivers/video/backlight/backlight.c b/drivers/video/backligh=
t/backlight.c
> index cac3e35d7630..92d80aa0c0ef 100644
> --- a/drivers/video/backlight/backlight.c
> +++ b/drivers/video/backlight/backlight.c
> @@ -432,6 +432,27 @@ struct backlight_device *backlight_device_get_by_typ=
e(enum backlight_type type)
>  }
>  EXPORT_SYMBOL(backlight_device_get_by_type);
> =20
> +/**
> + * backlight_device_get_by_name - Get backlight device by name
> + * @name: Device name
> + *
> + * This function looks up a backlight device by its name. It obtains a r=
eference
> + * on the backlight device and it is the caller's responsibility to drop=
 the
> + * reference by calling backlight_put().
> + *
> + * Returns:
> + * A pointer to the backlight device if found, otherwise NULL.
> + */
> +struct backlight_device *backlight_device_get_by_name(const char *name)
> +{
> +	struct device *dev;
> +
> +	dev =3D class_find_device_by_name(backlight_class, name);
> +
> +	return dev ? to_backlight_device(dev) : NULL;
> +}
> +EXPORT_SYMBOL(backlight_device_get_by_name);
> +
>  /**
>   * backlight_device_unregister - unregisters a backlight device object.
>   * @bd: the backlight device object to be unregistered and freed.
> diff --git a/include/linux/backlight.h b/include/linux/backlight.h
> index c7d6b2e8c3b5..56e4580d4f55 100644
> --- a/include/linux/backlight.h
> +++ b/include/linux/backlight.h
> @@ -190,6 +190,7 @@ extern void backlight_force_update(struct backlight_d=
evice *bd,
>  extern int backlight_register_notifier(struct notifier_block *nb);
>  extern int backlight_unregister_notifier(struct notifier_block *nb);
>  extern struct backlight_device *backlight_device_get_by_type(enum backli=
ght_type type);
> +struct backlight_device *backlight_device_get_by_name(const char *name);
>  extern int backlight_device_set_brightness(struct backlight_device *bd, =
unsigned long brightness);
> =20
>  #define to_backlight_device(obj) container_of(obj, struct backlight_devi=
ce, dev)
> --=20
> 2.23.0


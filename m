Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 45D61169A23
	for <lists+linux-usb@lfdr.de>; Sun, 23 Feb 2020 21:59:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726678AbgBWU7q (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 23 Feb 2020 15:59:46 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:45637 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726302AbgBWU7q (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 23 Feb 2020 15:59:46 -0500
Received: by mail-ot1-f68.google.com with SMTP id 59so6902220otp.12
        for <linux-usb@vger.kernel.org>; Sun, 23 Feb 2020 12:59:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=yLerEjQyKf5kmZPFmeSynvzmvw9OGsBrsA5dtIaOS1o=;
        b=jYw/UvDkD/iCvN0cYrck0oS3/SKfZUngYndn54iGw0m9TB1QBNp6J3IN3tFmZlzHKN
         92Felhy7bgNvQEjQ/JN9ge9/EElH/lZqFcmn9KxhOuYb4OTvy2aPti85lwIpVLAPcwSL
         JXNLJi8klEY7FP3Uuv86zKDjQWRPTNjv7iHaw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=yLerEjQyKf5kmZPFmeSynvzmvw9OGsBrsA5dtIaOS1o=;
        b=AfFYlGJorFX0DnEu4RHyi1BrDl3L7C7Tufd4gyLDigMNmhdmVtRrY6T7jq3L6NMvpX
         KuQ12J/uBYZ+huEboj44F3VNaFAYDM4RUEkx8ZH7tDPwc+/CVepjJfK36wXGJGliWamS
         w4fZc8yEk1wpr7x+ojehfiLS9CzNg1hId+bvBEbS5ePAvI4CKIzG6TFeKONGsZDxtbzN
         6ekboz7rR9Fatcvx183m/AXqC3AtQeA1zci1VvK9guTgFI7s8qHK0OZt/vwvy/1mgsXB
         /Iar31BQ/jdZmyFuXHargDp25NlsmYppxJDwF6yoqU5SGsxx/6KB0jDHQCDl1xATxu1z
         kH6Q==
X-Gm-Message-State: APjAAAU7alN1A+Fm9JNQcXzn+ARusjJxUqUpuecLTL5fgaqEfWIiARt8
        6OnXVD9JYjHA4znAhwLaHva7boSvBaEHchBy6X8OHr0T
X-Google-Smtp-Source: APXvYqyGJWW/yU3lj3vs+yyHCrwnN4qbgs2YaW9Rs5GjVnHZZ2Jf0UcWdn7pvq+7appAtc7PZ8TvlOMKk/UdtW5No1M=
X-Received: by 2002:a9d:7696:: with SMTP id j22mr39757561otl.188.1582491583142;
 Sun, 23 Feb 2020 12:59:43 -0800 (PST)
MIME-Version: 1.0
References: <20200216172117.49832-1-noralf@tronnes.org> <20200216172117.49832-9-noralf@tronnes.org>
 <20200217093836.GH2363188@phenom.ffwll.local> <393a8dcf-e01b-715c-551b-5108e42ebefc@tronnes.org>
In-Reply-To: <393a8dcf-e01b-715c-551b-5108e42ebefc@tronnes.org>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Sun, 23 Feb 2020 21:59:32 +0100
Message-ID: <CAKMK7uH0e4gqYja3igPm8oScJxkJkGDZfoA0Pbs9qgwnsW+moA@mail.gmail.com>
Subject: Re: [RFC 8/9] drm/client: Add drm_client_init_from_id() and drm_client_modeset_set()
To:     =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>
Cc:     Mark Brown <broonie@kernel.org>, balbi@kernel.org,
        Lee Jones <lee.jones@linaro.org>,
        USB list <linux-usb@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Greg KH <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Feb 23, 2020 at 6:43 PM Noralf Tr=C3=B8nnes <noralf@tronnes.org> wr=
ote:
> Den 17.02.2020 10.38, skrev Daniel Vetter:
> > On Sun, Feb 16, 2020 at 06:21:16PM +0100, Noralf Tr=C3=B8nnes wrote:
> >> drm_client_init_from_id() provides a way for clients to add a client b=
ased
> >> on the minor. drm_client_modeset_set() provides a way to set the modes=
et
> >> for clients that handles connectors and display mode on their own.
> >>
> >> Signed-off-by: Noralf Tr=C3=B8nnes <noralf@tronnes.org>
> >> ---
> >>  drivers/gpu/drm/drm_client.c         | 37 ++++++++++++++++++++
> >>  drivers/gpu/drm/drm_client_modeset.c | 52 +++++++++++++++++++++++++++=
+
> >>  include/drm/drm_client.h             |  4 +++
> >>  3 files changed, 93 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client=
.c
> >> index d9a2e3695525..dbd73fe8d987 100644
> >> --- a/drivers/gpu/drm/drm_client.c
> >> +++ b/drivers/gpu/drm/drm_client.c
> >> @@ -112,6 +112,43 @@ int drm_client_init(struct drm_device *dev, struc=
t drm_client_dev *client,
> >>  }
> >>  EXPORT_SYMBOL(drm_client_init);
> >>
> >> +/**
> >> + * drm_client_init_from_id - Initialise a DRM client
> >> + * @minor_id: DRM minor id
> >> + * @client: DRM client
> >> + * @name: Client name
> >> + * @funcs: DRM client functions (optional)
> >> + *
> >> + * This function looks up the drm_device using the minor id and initi=
alizes the client.
> >> + * It also registeres the client to avoid a possible race with DRM de=
vice unregister.
> >
> > I think another sentence here would be good, explaining that this is fo=
r
> > drivers outside of drm to expose a specific drm driver in some fashion,
> > and just outright mention your use-case as an example.
> >
> > I'm also not sure whether lookup-by-minor is the greatest thing for
> > kernel-internal lookups like this, maybe Greg has some idea?
> >
>
> What alternatives do you see? Parent device name?
>
> I did a scan to see what others are doing, and most have a consumer name
> lookup on the struct device (Device Tree or lookup tables):

I think those are all for other purposes. What we want here is that
some interface things binds to something else. I was thinking sysfs
paths to the underlying struct device (i.e. the one in
drm_device->dev) might be neater, since that's more unique. Using
minors we get that entire trouble of having duplicates (and in the
past triplicatres) due to our uapi-flavors. But in sysfs there's only
one underlying device.

Anyway if there's no precedence and Greg doesn't have ideas either
then I guess we can just go with minor ids. It's about as good as
anything else really.
-Daniel

>
> struct reset_control *__reset_control_get(struct device *dev, const char
> *id,
>                                           int index, bool shared,
>                                           bool optional, bool acquired);
>
> struct iio_channel *iio_channel_get(struct device *dev,
>                                     const char *consumer_channel);
>
> struct regulator *__must_check regulator_get(struct device *dev,
>                                              const char *id);
>
> struct pwm_device *pwm_get(struct device *dev, const char *con_id)
>
> struct gpio_desc *__must_check gpiod_get(struct device *dev,
>                                          const char *con_id,
>                                          enum gpiod_flags flags);
>
> SPI and I2C use the bus index as lookup:
>
> extern struct i2c_adapter *i2c_get_adapter(int nr);
>
> extern struct spi_controller *spi_busnum_to_master(u16 busnum);
>
>
> Noralf.
>
> >> + *
> >> + * See drm_client_init() and drm_client_register().
> >> + *
> >> + * Returns:
> >> + * Zero on success or negative error code on failure.
> >> + */
> >> +int drm_client_init_from_id(unsigned int minor_id, struct drm_client_=
dev *client,
> >> +                        const char *name, const struct drm_client_fun=
cs *funcs)
> >> +{
> >> +    struct drm_minor *minor;
> >> +    int ret;
> >> +
> >> +    minor =3D drm_minor_acquire(minor_id);
> >> +    if (IS_ERR(minor))
> >> +            return PTR_ERR(minor);
> >> +
> >> +    mutex_lock(&minor->dev->clientlist_mutex);
> >> +    ret =3D drm_client_init(minor->dev, client, name, funcs);
> >> +    if (!ret)
> >> +            list_add(&client->list, &minor->dev->clientlist);
> >> +    mutex_unlock(&minor->dev->clientlist_mutex);
> >> +
> >> +    drm_minor_release(minor);
> >> +
> >> +    return ret;
> >> +}
> >> +EXPORT_SYMBOL(drm_client_init_from_id);
> >> +
> >>  /**
> >>   * drm_client_register - Register client
> >>   * @client: DRM client



--=20
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch

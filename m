Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 119A02FD785
	for <lists+linux-usb@lfdr.de>; Wed, 20 Jan 2021 18:53:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732361AbhATRvk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 20 Jan 2021 12:51:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388723AbhATRuN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 20 Jan 2021 12:50:13 -0500
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61339C061757
        for <linux-usb@vger.kernel.org>; Wed, 20 Jan 2021 09:49:28 -0800 (PST)
Received: by mail-yb1-xb33.google.com with SMTP id w24so18006745ybi.7
        for <linux-usb@vger.kernel.org>; Wed, 20 Jan 2021 09:49:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=1PhAclZULQwbysk/mkrBuB0ypY2UFK2B9x9hQ0ArLyU=;
        b=PKnCL3c12xNtaUgxfTXl1AFHvQy3cYfP7plFtQx8ivsifTomD+7OyzVK3rNBiKx8Jp
         BfpdmStXrrd5YQjGo0eJibuoj0IEwDjxupUIVuiBk5RJC+OMsBVv/eWPFlfkIB45yBWA
         8QOlOVEpLIG1bWahHIV2Hy817oGTKYP9WX1vk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=1PhAclZULQwbysk/mkrBuB0ypY2UFK2B9x9hQ0ArLyU=;
        b=iuCSJK1f3LUZQRxX+luXDJkys0vN9Tg6XdhxFRlsB8mtgrbR+XbxxxypYB/ET9UkAN
         KwQsulxD3o8EV/bSB+C7n7psbkUlRrF4QRcvQ9rcTwDvZTlXvEaKtED1WT3ZCuiu5gn6
         IKn1IB1/45HELyTBXzfww6M7gJG3DSCcVIPaiKNVCTRIRnP/EJZUj7UlmjlpFWWfNCMl
         DA0pd+29Jsf4IjGC+7n3TUL5UMcZ62Rcppxntuoq2cosWDGGMQ9ZHGaVq2D2Dyb1IXeH
         19yYToaZSug7QZUXe65r0hgA5DrYaxtoN0Xu9MELbsiQZXJ83eYB89syVQGxSkmnlwsR
         oCEQ==
X-Gm-Message-State: AOAM533jq09wydPyuNbuziPSm6HBB91C0EuqSItL5lqczjl8CGv18Saa
        zVCYzvPBwWbnjdbhkbXh1hJ6cJlyzEDR/Z8VrJM/OB8gqjY=
X-Google-Smtp-Source: ABdhPJyQJxihaFNA4A53Zw4JJfauiFp1ByT3l2+b9XytEbEObkDahNtSovQIudpiKYScOGBh9rACIAdh0+OPg31F68w=
X-Received: by 2002:a05:6830:1bef:: with SMTP id k15mr7631084otb.303.1611164527608;
 Wed, 20 Jan 2021 09:42:07 -0800 (PST)
MIME-Version: 1.0
References: <20210120170033.38468-1-noralf@tronnes.org> <20210120170033.38468-3-noralf@tronnes.org>
In-Reply-To: <20210120170033.38468-3-noralf@tronnes.org>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Wed, 20 Jan 2021 18:41:56 +0100
Message-ID: <CAKMK7uF62TrWhqBMM6qa+nXbKEs=sEGw6eF62S_NfTanyXc_Xg@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] drm/probe-helper: Check epoch counter in output_poll_execute()
To:     =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>, hudson@trmm.net,
        markus@raatikainen.cc, Sam Ravnborg <sam@ravnborg.org>,
        USB list <linux-usb@vger.kernel.org>,
        Tyler Hardin <th020394@gmail.com>,
        Lubomir Rintel <lkundrak@v3.sk>, pontus.fuchs@gmail.com,
        peter@stuge.se
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jan 20, 2021 at 6:10 PM Noralf Tr=C3=B8nnes <noralf@tronnes.org> wr=
ote:
>
> drm_helper_hpd_irq_event() checks the epoch counter to determine
> connector status change. This was introduced in
> commit 5186421cbfe2 ("drm: Introduce epoch counter to drm_connector").
> Do the same for output_poll_execute() so it can detect other changes
> beside connection status value changes.
>
> Signed-off-by: Noralf Tr=C3=B8nnes <noralf@tronnes.org>
> ---
>  drivers/gpu/drm/drm_probe_helper.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_pro=
be_helper.c
> index d6017726cc2a..e5432dcf6999 100644
> --- a/drivers/gpu/drm/drm_probe_helper.c
> +++ b/drivers/gpu/drm/drm_probe_helper.c
> @@ -623,6 +623,7 @@ static void output_poll_execute(struct work_struct *w=
ork)
>         struct drm_connector_list_iter conn_iter;
>         enum drm_connector_status old_status;
>         bool repoll =3D false, changed;
> +       u64 old_epoch_counter;
>
>         if (!dev->mode_config.poll_enabled)
>                 return;
> @@ -659,8 +660,9 @@ static void output_poll_execute(struct work_struct *w=
ork)
>
>                 repoll =3D true;
>
> +               old_epoch_counter =3D connector->epoch_counter;
>                 connector->status =3D drm_helper_probe_detect(connector, =
NULL, false);
> -               if (old_status !=3D connector->status) {
Was about to ask whether we're not missing connector status changes
here, but that's already handled. Not sure why this wasn't done as
part of the original patch, I'd include a cc: stable here.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> +               if (old_epoch_counter !=3D connector->epoch_counter) {
>                         const char *old, *new;
>
>                         /*
> @@ -689,6 +691,9 @@ static void output_poll_execute(struct work_struct *w=
ork)
>                                       connector->base.id,
>                                       connector->name,
>                                       old, new);
> +                       DRM_DEBUG_KMS("[CONNECTOR:%d:%s] epoch counter %l=
lu -> %llu\n",
> +                                     connector->base.id, connector->name=
,
> +                                     old_epoch_counter, connector->epoch=
_counter);
>
>                         changed =3D true;
>                 }
> --
> 2.23.0
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel



--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

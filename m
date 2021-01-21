Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D5142FE4FF
	for <lists+linux-usb@lfdr.de>; Thu, 21 Jan 2021 09:30:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726545AbhAUI2t (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 21 Jan 2021 03:28:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728054AbhAUI2k (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 21 Jan 2021 03:28:40 -0500
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com [IPv6:2607:f8b0:4864:20::c29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA695C061575
        for <linux-usb@vger.kernel.org>; Thu, 21 Jan 2021 00:27:59 -0800 (PST)
Received: by mail-oo1-xc29.google.com with SMTP id j21so295343oou.11
        for <linux-usb@vger.kernel.org>; Thu, 21 Jan 2021 00:27:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=3DWfhAf0O5VKGxPrvVIq7P4df0BxBVjRhTibdhksyv0=;
        b=BxfB7cGgvfaXW68wVNsC2xzlRISsBn2rxD9Mpl8s3L9rjPFpB/PvjwqoOaPoqVQufT
         GhHvU5u9dms0u6zSWGTfbwGNiHZV9dBIIKxYsVM5P/ImmTnSSBul0eXqEhWI/EN3fLNe
         f3wA1OafrKMaLvc+P5tX6VWYn0FploK4OE2pc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=3DWfhAf0O5VKGxPrvVIq7P4df0BxBVjRhTibdhksyv0=;
        b=rTtuCYNqsjs6ETlt/7yEwStqpLDaxkkpXuaOajwj3I4Uv4aYqSQCdPdLtRwdiU3muP
         IqPZCrwqdgaxPgXfZHzNUCkdBIl+Jz+kH2zDeq94PrMR64ONHG8GUrhpA07CE60sT9Nj
         bStrxn86qWWhhOtHpOT1MvO726s8zyH6xfLKH5l80HZRk39N9J6rNDAfGHyJ9mR8VZrs
         9SpIpMYcz7k3yoI9nuS7b8H/IDg9JV8NQdtBE7qriiBLbol1a4kLNZImKujDJMnQJW34
         4UHltTdPA8Xcj4e6MDa+s4c3j2PIFnvauXTKf4Jhkxfv/ncdwThVWbxR5+sEnLKWwmQF
         N1OQ==
X-Gm-Message-State: AOAM532OR32F+yW0gbgfGmh1YBsE9607JsUyT2jlhTGfIetdPdUS3cPT
        UsrKVlJvy8SP52UnBmFGV6zqsKmZx+fFuOEVNBaxHA==
X-Google-Smtp-Source: ABdhPJzRbplKL10b0xnxB5cq9dstRsRdcUVICyER8i9a2nkskBu3A5lHV3gTRql3FRfQZTiM9WKyN7zDATdcL1n6ETg=
X-Received: by 2002:a4a:9722:: with SMTP id u31mr8673370ooi.28.1611217679254;
 Thu, 21 Jan 2021 00:27:59 -0800 (PST)
MIME-Version: 1.0
References: <20210120170033.38468-1-noralf@tronnes.org> <20210120170033.38468-2-noralf@tronnes.org>
 <CAKMK7uHoALsGRgJjPzpeAvN10CoBpLsT86=gUm82ki-h2DkPwQ@mail.gmail.com> <9660eec0-15b7-ee8b-10ed-c6ceed54a56f@suse.de>
In-Reply-To: <9660eec0-15b7-ee8b-10ed-c6ceed54a56f@suse.de>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Thu, 21 Jan 2021 09:27:48 +0100
Message-ID: <CAKMK7uHiQ3i-Rz_y_3joR2Zi3fA=1qp8MdGZ9w9PUcGoWT3urw@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] drm/uapi: Add USB connector type
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
        hudson@trmm.net, markus@raatikainen.cc, peter@stuge.se,
        USB list <linux-usb@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Tyler Hardin <th020394@gmail.com>,
        Lubomir Rintel <lkundrak@v3.sk>, pontus.fuchs@gmail.com,
        Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jan 21, 2021 at 8:45 AM Thomas Zimmermann <tzimmermann@suse.de> wro=
te:
>
> Hi Noralf,
>
> glad to hear from you! Welcome back!
>
> Am 20.01.21 um 18:42 schrieb Daniel Vetter:
> > On Wed, Jan 20, 2021 at 6:10 PM Noralf Tr=C3=B8nnes <noralf@tronnes.org=
> wrote:
> >>
> >> Add a connector type for USB connected display panels.
> >>
> >> Signed-off-by: Noralf Tr=C3=B8nnes <noralf@tronnes.org>
> >> ---
> >>   include/uapi/drm/drm_mode.h | 1 +
> >>   1 file changed, 1 insertion(+)
> >>
> >> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> >> index fed66a03c7ae..33024cc5d26e 100644
> >> --- a/include/uapi/drm/drm_mode.h
> >> +++ b/include/uapi/drm/drm_mode.h
> >> @@ -367,6 +367,7 @@ enum drm_mode_subconnector {
> >>   #define DRM_MODE_CONNECTOR_DPI         17
> >>   #define DRM_MODE_CONNECTOR_WRITEBACK   18
> >>   #define DRM_MODE_CONNECTOR_SPI         19
> >> +#define DRM_MODE_CONNECTOR_USB         20
>
> I would not call it USB. I could imagine that at some point a generic
> USB protocol could serve simple displays (i.e. in the sense of USB HID
> or data or imaging). (Maybe Thunderbold already counts.) Anyway, USB
> should be reserved for this case.

We end up calling those DisplayPort, since that's what's being
transported over thunderbolt or usb-C. So the usb connector would be
called usb-C. I think the reason we don't do fancy connector names is
that adding them is a bit a pain. Plus drm/i915 specifically has some
very quirky connector enumerating that doesn't match much with reality
unfortunately anyway :-/
-Daniel

>
> Best regards
> Thomas
>
> >
> > Beware, new connector types have in the past resulted in userspace
> > burning&crashing. Maybe it's become better ...
> >
> > Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> >>
> >>   /**
> >>    * struct drm_mode_get_connector - Get connector metadata.
> >> --
> >> 2.23.0
> >>
> >> _______________________________________________
> >> dri-devel mailing list
> >> dri-devel@lists.freedesktop.org
> >> https://lists.freedesktop.org/mailman/listinfo/dri-devel
> >
> >
> >
>
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> (HRB 36809, AG N=C3=BCrnberg)
> Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer
>


--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

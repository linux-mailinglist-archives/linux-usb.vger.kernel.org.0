Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F0FD2FD76E
	for <lists+linux-usb@lfdr.de>; Wed, 20 Jan 2021 18:48:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390101AbhATRo4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 20 Jan 2021 12:44:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387520AbhATRoM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 20 Jan 2021 12:44:12 -0500
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76673C061575
        for <linux-usb@vger.kernel.org>; Wed, 20 Jan 2021 09:42:56 -0800 (PST)
Received: by mail-oi1-x229.google.com with SMTP id q205so25827120oig.13
        for <linux-usb@vger.kernel.org>; Wed, 20 Jan 2021 09:42:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ZHFJYxonu4R04UeV13qr5aQCh6joeK9ZeuixK9rcGkk=;
        b=hKomSCRs608d2bMutf97y6mNcaeWWXi38yiePkG2w2tDIm25ynueBiiU9WRsqvl5kR
         40Q3FP/QegTjhg3NumRkeSt0ET60h4KAM2xGtz8THPRERE4ob0Z7REuRhkEjg/FL3Ojk
         NAfoS6rvq33lRcjP8PNDSnw57EN1/cYED3UnE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ZHFJYxonu4R04UeV13qr5aQCh6joeK9ZeuixK9rcGkk=;
        b=nErw1K51WfvqA+d0auVtVHNnhy58UaASH609XG/NUnSQQymaatEQOS5X1mBQE1l/UQ
         iAGjt3H+1KVIsWx4i5fkNuzV04cyJG1KdWFnN/ggIqUuUxm2tNGpvbNbqcfHkSuW71TA
         Qo53hZEU4jKKK4yw4lIDScq9w3DsOCbFXnltNwVEoRE/OfWtgophA0BbxkmTG6ZOfrkn
         6vrplLGfymAcEGlmfwgaXgaLa78tOa0yVh8tqj45l5Ssb+eX45xon+FYe00gKijP3m7M
         rVdKT7jY3m4KG+Emo5sUeW1DVs/fb59Ao+TPFfyJ5ied6Uy/nnQ9OSNRKnmtPsTlGm85
         2EMw==
X-Gm-Message-State: AOAM532KPQT0Xq0TQRDJ12VE6TAelG3x44WyIcUALJWSjFRYlDh/okTk
        lzcT3E78HDeJDUGjcysglJ9Ly2g+6YLWuv8vKotoxA==
X-Google-Smtp-Source: ABdhPJyck96jsLs3n3qcqJVFLkf0UQpIkK0m0v7CRoC8WM/OLSvNQAyqVVOnAiMwOVCBFjuGfGkc9ejvNC8Cfc0RRFY=
X-Received: by 2002:aca:4ac5:: with SMTP id x188mr3474327oia.14.1611164575945;
 Wed, 20 Jan 2021 09:42:55 -0800 (PST)
MIME-Version: 1.0
References: <20210120170033.38468-1-noralf@tronnes.org> <20210120170033.38468-2-noralf@tronnes.org>
In-Reply-To: <20210120170033.38468-2-noralf@tronnes.org>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Wed, 20 Jan 2021 18:42:45 +0100
Message-ID: <CAKMK7uHoALsGRgJjPzpeAvN10CoBpLsT86=gUm82ki-h2DkPwQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] drm/uapi: Add USB connector type
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
> Add a connector type for USB connected display panels.
>
> Signed-off-by: Noralf Tr=C3=B8nnes <noralf@tronnes.org>
> ---
>  include/uapi/drm/drm_mode.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> index fed66a03c7ae..33024cc5d26e 100644
> --- a/include/uapi/drm/drm_mode.h
> +++ b/include/uapi/drm/drm_mode.h
> @@ -367,6 +367,7 @@ enum drm_mode_subconnector {
>  #define DRM_MODE_CONNECTOR_DPI         17
>  #define DRM_MODE_CONNECTOR_WRITEBACK   18
>  #define DRM_MODE_CONNECTOR_SPI         19
> +#define DRM_MODE_CONNECTOR_USB         20

Beware, new connector types have in the past resulted in userspace
burning&crashing. Maybe it's become better ...

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>
>  /**
>   * struct drm_mode_get_connector - Get connector metadata.
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

Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05F0B391993
	for <lists+linux-usb@lfdr.de>; Wed, 26 May 2021 16:11:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234504AbhEZOMk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 May 2021 10:12:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232802AbhEZOMj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 26 May 2021 10:12:39 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE805C061756
        for <linux-usb@vger.kernel.org>; Wed, 26 May 2021 07:11:07 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id f75-20020a1c1f4e0000b0290171001e7329so599396wmf.1
        for <linux-usb@vger.kernel.org>; Wed, 26 May 2021 07:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:content-transfer-encoding:date:message-id:to:cc
         :subject:from:references:in-reply-to;
        bh=+2FNtzevJ4qM2Fi7yCUYyh+8owZT/RfCjcCcFFpDxCo=;
        b=kJnBFRGy2Qk3liIbBYF+s4ylrkulEO33hYBKTvb2+e4YoqH8YWyBoMWfRh3tguebht
         jFQkqz/4c1yOV/44EWaOsk7utHt2h9fQIvKS6Rao6FQSSE8rLt1oDbpYG4Tb7t9nfa/n
         g0xIFC9m4dlqqWM0cJWoEUUu/yw/ZSuXD0m+BWhlLRckqceZLH8IdKX7wIPhsjCsL9qa
         VsXUpH1h14vtH7rS3I6pYnuXRdMbPB8HijoWbMP2xDGY6n3SxaAyIZCs+bqZZ3mZpvXz
         SZu877Ha0DvTirbSdJq6s7qcwicub/ZqgEoxHdbnXAO/rEChYCO971tyBlTWTgGm3V5k
         uFKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding:date
         :message-id:to:cc:subject:from:references:in-reply-to;
        bh=+2FNtzevJ4qM2Fi7yCUYyh+8owZT/RfCjcCcFFpDxCo=;
        b=e6CYbGhQihxovRRpOK+S/gKjzwI8nROIy/UA46CPygfaq86tIZT26ERH9iIB1eu6OQ
         W6Pwgxgebf9mkBAjY211BqmcOxbHnRuUR+4ykaCcsqNMgE2EFroSvh5kGsQjDcmoncRk
         CM/D4Eo/oyMSdjwe74dIsuG6ftGUMr8dud46rfrhjCAlkZXFUZFsSqaDs0tu4x+y3L4k
         xfEvyX+8sopGbXss2L7HVhbgKqV6J4km3JPowZrVidL+gaSTEsBA/X1gjCnRoPqYT/pY
         yIgRfBb2xJAWwpIkUM0NNLDcC/dSC41125p0kYaFCJLuEEdT+vvUELM7Nj0Iw7vHBqw4
         /QCw==
X-Gm-Message-State: AOAM532hmkQPiEr8ZBJYsMjCtjEEmWcBjgtdF1tC1+TYklpUwtTtqv9t
        1sUSSKrEvhlrYNkYDkcZEhYT5Q==
X-Google-Smtp-Source: ABdhPJze0yp8Mpe8hzE4v/dQoiiVLfHunD7AbUa47ZMHimdS0UwcSwiH28GiE4Hv+1aBbcBbc4sdUw==
X-Received: by 2002:a05:600c:3544:: with SMTP id i4mr3733209wmq.112.1622038266468;
        Wed, 26 May 2021 07:11:06 -0700 (PDT)
Received: from localhost (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id k11sm6737212wmj.1.2021.05.26.07.11.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 07:11:05 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Wed, 26 May 2021 15:11:04 +0100
Message-Id: <CBN8KRXT6GKH.3TIZOGGT3RG0W@arch-thunder>
To:     "Lee Jones" <lee.jones@linaro.org>
Cc:     <linux-kernel@vger.kernel.org>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
        "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>,
        <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 06/24] usb: isp1760: isp1760-udc: Provide missing
 description for 'udc' param
From:   "Rui Miguel Silva" <rui.silva@linaro.org>
References: <20210526130037.856068-1-lee.jones@linaro.org>
 <20210526130037.856068-7-lee.jones@linaro.org>
In-Reply-To: <20210526130037.856068-7-lee.jones@linaro.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Lee,
On Wed May 26, 2021 at 2:00 PM WEST, Lee Jones wrote:

> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/usb/isp1760/isp1760-udc.c:150: warning: Function parameter or me=
mber 'udc' not described in 'isp1760_udc_select_ep'
>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Rui Miguel Silva <rui.silva@linaro.org>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: linux-usb@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/usb/isp1760/isp1760-udc.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/usb/isp1760/isp1760-udc.c b/drivers/usb/isp1760/isp1=
760-udc.c
> index 3e05e36054357..a78da59d6417b 100644
> --- a/drivers/usb/isp1760/isp1760-udc.c
> +++ b/drivers/usb/isp1760/isp1760-udc.c
> @@ -137,6 +137,7 @@ static void __isp1760_udc_select_ep(struct isp1760_ud=
c *udc,
>  /**
>   * isp1760_udc_select_ep - Select an endpoint for register access
>   * @ep: The endpoint
> + * @udc: Reference to the device controller

I had this in my latest patch set, but got lost, thanks for fixing
this.

I'd like to ask you to swap the order to match the order in which
the args appear in the function declaration.

With this changed you can add my:
Reviewed-by: Rui Miguel Silva <rui.silva@linaro.org>

------
Cheers,
     Rui


>   *
>   * The ISP1761 endpoint registers are banked. This function selects the =
target
>   * endpoint for banked register access. The selection remains valid unti=
l the
> --=20
> 2.31.1




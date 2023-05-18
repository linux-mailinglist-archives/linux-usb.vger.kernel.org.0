Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE5BD707F04
	for <lists+linux-usb@lfdr.de>; Thu, 18 May 2023 13:18:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230346AbjERLSj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 18 May 2023 07:18:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229957AbjERLSi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 18 May 2023 07:18:38 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56049B7
        for <linux-usb@vger.kernel.org>; Thu, 18 May 2023 04:18:37 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-3f41dceb9d1so18586845e9.1
        for <linux-usb@vger.kernel.org>; Thu, 18 May 2023 04:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684408716; x=1687000716;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pLUvkG7USbzCR0kby3sWcizMW3PyVgl9g57t4JxwVZU=;
        b=dQeVH6exRbC2WVFHYh+DvlxSchEkdwKcRBXEbfegrP2H8aipKyyLXFTIyQ1LIfQ+7L
         S7zod1lLIxdNLzmKxMulKMZNhq9Ssgl1kZNgALmXg3idIW82ukvTVr4fVdlOIqQ8ITsq
         YMwDNNGEyQpFhlmI0dxyDRoNrEkt4fSlzRE6VYuBBfrTaa8pW8vVBNEVsYe/SVz6Z7Di
         SU8f/bFDseLYYE1Y7ijxi4R3H4Mw5aIQn/VSoqTQpQdu8BgOXs11Cu2klGmI5NiQckos
         TcttHECdg6kbPrILNRCUzvAviKrmnQMdEodrxu8ZVLAHXieopDflf1Xzyy3ZwtLF9Oh+
         XcYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684408716; x=1687000716;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pLUvkG7USbzCR0kby3sWcizMW3PyVgl9g57t4JxwVZU=;
        b=htlAlIS/6sjl/Y76Bu8HH3vK+3R6+z7xSgn8YYqJ381PSBKJrlbMe6ig/NLL+etKVV
         g9OWZsDNmDFHwIV5EridmgzZzxIe4ZD+9GUpNd3etlMB++A58Z7yrPRCKSh4Qlsz4o2G
         sTRduy0kXNOIdub2IdQX42RvE1w3xaCuyBIleqjrWFXP0P5HJMOEzX4zS/0yiz9l8T3z
         P94Wm/CElkCyGGNoHvrUeXDZ+sbddRdtiU8vxrff3YuiXujqaPEZc4FTCSgndvc2AHuH
         bPoIHOSQq/ajwj//VLrBDQ++5B7jqjtXTj+X3ExoVqqvm7ug28UdyBnh6CGLhmNlL2L+
         3OIw==
X-Gm-Message-State: AC+VfDxPoCXYBkSljAGfBJe0WJAwngowUBU+eh/vhhFwIax9903HWaMV
        zsSMMmQMnvn+c0HX2GJh/M5VyMvPcA2EToyT4+G9tg==
X-Google-Smtp-Source: ACHHUZ7E+j3k3ijKvP6RP7KJ9kZa7n2ZSVSPKmMXGLWBalTGM3hfVayB2Ol8ggkmrJqmX4uRIXCZOCgpNFnJTmP4AJI=
X-Received: by 2002:a1c:7311:0:b0:3f1:969f:c9d0 with SMTP id
 d17-20020a1c7311000000b003f1969fc9d0mr1270596wmb.4.1684408715647; Thu, 18 May
 2023 04:18:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de> <20230517230239.187727-87-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230517230239.187727-87-u.kleine-koenig@pengutronix.de>
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
Date:   Thu, 18 May 2023 16:48:23 +0530
Message-ID: <CAH=2NtxC6ufxR588ZbMqgwy7LEuKtUVhnCYgivU7uqKjDeczbw@mail.gmail.com>
Subject: Re: [PATCH 86/97] usb: misc: eud: Convert to platform remove callback
 returning void
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        kernel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, 18 May 2023 at 04:34, Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart fro=
m
> emitting a warning) and this typically results in resource leaks. To impr=
ove
> here there is a quest to make the remove callback return void. In the fir=
st
> step of this quest all drivers are converted to .remove_new() which alrea=
dy
> returns void. Eventually after all drivers are converted, .remove_new() i=
s
> renamed to .remove().
>
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/usb/misc/qcom_eud.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
> index b7f13df00764..0dc414463759 100644
> --- a/drivers/usb/misc/qcom_eud.c
> +++ b/drivers/usb/misc/qcom_eud.c
> @@ -217,7 +217,7 @@ static int eud_probe(struct platform_device *pdev)
>         return 0;
>  }
>
> -static int eud_remove(struct platform_device *pdev)
> +static void eud_remove(struct platform_device *pdev)
>  {
>         struct eud_chip *chip =3D platform_get_drvdata(pdev);
>
> @@ -226,8 +226,6 @@ static int eud_remove(struct platform_device *pdev)
>
>         device_init_wakeup(&pdev->dev, false);
>         disable_irq_wake(chip->irq);
> -
> -       return 0;
>  }
>
>  static const struct of_device_id eud_dt_match[] =3D {
> @@ -238,7 +236,7 @@ MODULE_DEVICE_TABLE(of, eud_dt_match);
>
>  static struct platform_driver eud_driver =3D {
>         .probe  =3D eud_probe,
> -       .remove =3D eud_remove,
> +       .remove_new =3D eud_remove,
>         .driver =3D {
>                 .name =3D "qcom_eud",
>                 .dev_groups =3D eud_groups,
> --
> 2.39.2

Reviewed-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>

Thanks.

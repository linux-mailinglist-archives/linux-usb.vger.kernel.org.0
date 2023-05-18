Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BBC94707E85
	for <lists+linux-usb@lfdr.de>; Thu, 18 May 2023 12:51:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230090AbjERKvg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 18 May 2023 06:51:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230049AbjERKve (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 18 May 2023 06:51:34 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 299311FE0
        for <linux-usb@vger.kernel.org>; Thu, 18 May 2023 03:51:08 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-3f509ec3196so71182465e9.1
        for <linux-usb@vger.kernel.org>; Thu, 18 May 2023 03:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684407066; x=1686999066;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1vJ7owF2jZ1jgfetzeBylwbCZSWloUm6wP6XItRtZ8s=;
        b=VMeB48dPma3GJC0dQwksluHosrINKA1DDP7qsDZlsdhI2GdU9ARLmgNlVFYW7haDNe
         uQtLGh+D6d2QU5XRn+M4cszYk5KxMOiK9xFuOKQ6IeUc0HqQziLEhhqnlX2VlvyzXOwK
         SdRYGijam05xx2lgOQdkinMlL3LE3xi4xN232/v7BvB+M3FKDbmHN/ddepo1gq0MlOBH
         QlDqD9hTCtFXgsNtpSAcDFG+goTH9vqWVa+jB6ZUc0yd8zidl0lL4jJNF33DgoOQFovz
         JVGPrcNEYg2wuYNkxmPjzJRKM6JO0lHZuru3DOSqNPLyYpZg0VdFfcTCLrs8frArVNLB
         ZEYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684407066; x=1686999066;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1vJ7owF2jZ1jgfetzeBylwbCZSWloUm6wP6XItRtZ8s=;
        b=F+NxwqBDBTIdIIkD2wUEkMsspkRluESa9/lInO3EMUravbBXeEfHBb7+l91DHYfLwN
         y+m2E9CbI4sDl8rcBVXHH/lLx3kalu9lXaG+yTVFcDk64Lap26VektfdAs1jhrVTJE+r
         M4X/LiKEtDt/Z0zm2QLbaezRLtiLOK9PaylZbTLKZBQrjsIftK1c2j5KYJrs2cxGm+Pe
         1pYEjQL1G3da5cC2xKd+78A70LUvuPphkhzMexFASDRXUTw4cpbND+6TE752lsRMoxoB
         Sm46Vc6WXTS7U7xYm+elO6aSzA492BQp5dirk0tNqfFTwZ9vTeYDluSHLFGKI2UMQyki
         tKyg==
X-Gm-Message-State: AC+VfDzL/hmtlkxwmNv5nM5EFDuv4vUc84OFiC3v0aLr2W5OJIe08UzJ
        oGoD6tLAbVdZAcHZkrV51UgidQ==
X-Google-Smtp-Source: ACHHUZ6aobTELqAgLfxSzBbfcI4AMLUJO+mzfT4FsHyrhGPPpkFnYckQgAINqLn5pHTye1+YLGvpNg==
X-Received: by 2002:a5d:58e4:0:b0:307:d04a:60d8 with SMTP id f4-20020a5d58e4000000b00307d04a60d8mr1224645wrd.0.1684407066237;
        Thu, 18 May 2023 03:51:06 -0700 (PDT)
Received: from localhost (a109-49-33-111.cpe.netcabo.pt. [109.49.33.111])
        by smtp.gmail.com with ESMTPSA id y18-20020a1c4b12000000b003f4fffccd73sm1669394wma.9.2023.05.18.03.51.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 May 2023 03:51:06 -0700 (PDT)
From:   Rui Miguel Silva <rui.silva@linaro.org>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH 85/97] usb: isp1760: Convert to platform remove callback
 returning void
In-Reply-To: <20230517230239.187727-86-u.kleine-koenig@pengutronix.de>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
 <20230517230239.187727-86-u.kleine-koenig@pengutronix.de>
Date:   Thu, 18 May 2023 11:51:05 +0100
Message-ID: <m3zg61ap5y.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

Hey Uwe,

Thanks for the patch.

Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de> writes:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart from
> emitting a warning) and this typically results in resource leaks. To impr=
ove
> here there is a quest to make the remove callback return void. In the fir=
st
> step of this quest all drivers are converted to .remove_new() which alrea=
dy
> returns void. Eventually after all drivers are converted, .remove_new() is
> renamed to .remove().
>
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

LGTM
Acked-by: Rui Miguel Silva <rui.silva@linaro.org>

Cheers,
   Rui
=20=20=20
> ---
>  drivers/usb/isp1760/isp1760-if.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/usb/isp1760/isp1760-if.c b/drivers/usb/isp1760/isp17=
60-if.c
> index 65ba5aca2a4f..fe1e3985419a 100644
> --- a/drivers/usb/isp1760/isp1760-if.c
> +++ b/drivers/usb/isp1760/isp1760-if.c
> @@ -246,11 +246,9 @@ static int isp1760_plat_probe(struct platform_device=
 *pdev)
>  	return 0;
>  }
>=20=20
> -static int isp1760_plat_remove(struct platform_device *pdev)
> +static void isp1760_plat_remove(struct platform_device *pdev)
>  {
>  	isp1760_unregister(&pdev->dev);
> -
> -	return 0;
>  }
>=20=20
>  #ifdef CONFIG_OF
> @@ -265,7 +263,7 @@ MODULE_DEVICE_TABLE(of, isp1760_of_match);
>=20=20
>  static struct platform_driver isp1760_plat_driver =3D {
>  	.probe	=3D isp1760_plat_probe,
> -	.remove	=3D isp1760_plat_remove,
> +	.remove_new =3D isp1760_plat_remove,
>  	.driver	=3D {
>  		.name	=3D "isp1760",
>  		.of_match_table =3D of_match_ptr(isp1760_of_match),
> --=20
> 2.39.2

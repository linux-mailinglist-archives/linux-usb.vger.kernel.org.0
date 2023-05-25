Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 90848710BFE
	for <lists+linux-usb@lfdr.de>; Thu, 25 May 2023 14:25:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240858AbjEYMZw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 25 May 2023 08:25:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231599AbjEYMZv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 25 May 2023 08:25:51 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C77812E;
        Thu, 25 May 2023 05:25:50 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1ae40dcdc18so10007015ad.2;
        Thu, 25 May 2023 05:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685017550; x=1687609550;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ymi8+ESyr5hcPy4jkcXXjlbBsSht1Su+Vk/ZbjlIT7s=;
        b=MtMY9L1x0yFzPt+64KeTsJs6E7QNOtUtKr+nV1PG0mW9QbIdXDl1bFgJP0fLKtFZIf
         h9r9533BBS7DkhP4JhYN5qaiYJUORnWw+dHjfM0P3khXnsvMN169n+zjXdJo645mdOC4
         H2wTM14Im/gvkTq/BfL+dTsYflaf187P6UwEMdRwp7oh2jjnWW05JX6Lq3sYKufnN4DO
         3Ok7wlldXcZIAcJHDHtJqMucE2/1hL5MtX5wFa9huy91SllUFPUaYClVQp0+6+NyXss+
         DHch+E/L1TMhR2Yo8Po5uborvj8iiRDfn/zkrZ/83nzIG/vgJ+7qJ++tj6d8hZYeBWHx
         F4rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685017550; x=1687609550;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ymi8+ESyr5hcPy4jkcXXjlbBsSht1Su+Vk/ZbjlIT7s=;
        b=V2II3DAZtC5x3siDS2JAtWTCfh8o+ZEUJgnRr1pZTo9gdYg1TsPOZkTFZPyL+jDXtn
         r1fe/6sIZdvVo8a4bjwFretrEbNWQlAZljZcPIQwupdKMKR83w1schspokgFIG+cFx/+
         /qwj1x+qQ5HpmeVLH41sDI3emb96F3Ocec6tGVFzdfEfDp3TELPyAQeUm5M+SsSmbwiN
         KQTxITMT//Z1urPknMV1vgU2KmDhRnBsvFekiCU3d4/YHO3VA2bnSBYFr+1rGjAkJINV
         emNg27/7IYhzSgDgAAqd2sZo0z/xIYloQUl6K0go1bzzFP2Zc8ab/LjtZX4LT2BfrAkH
         Rpbw==
X-Gm-Message-State: AC+VfDyZJwuhgiUJ1t1W64ni57QSLVJRaOejdqVTRNZrZQRmWsqbocD6
        8d/5ySiIQ3jtDX8kjdwWK4kuFEO/B/UN3cVTkPg=
X-Google-Smtp-Source: ACHHUZ6nkRBt2arGuTFntOI08nshgppWIKNKBkg/W4bziUDYoQB6qd4FobSOVhcYt61bwNFjevGUG9a/GQrfyxsvABg=
X-Received: by 2002:a17:902:988c:b0:1af:d3b2:4eb7 with SMTP id
 s12-20020a170902988c00b001afd3b24eb7mr1137397plp.21.1685017549501; Thu, 25
 May 2023 05:25:49 -0700 (PDT)
MIME-Version: 1.0
References: <80496b6d-990e-4fb3-808b-daf3143cef15@kili.mountain>
In-Reply-To: <80496b6d-990e-4fb3-808b-daf3143cef15@kili.mountain>
From:   Dongliang Mu <mudongliangabcd@gmail.com>
Date:   Thu, 25 May 2023 20:22:15 +0800
Message-ID: <CAD-N9QXOXrHRg+_-ZqPtcqokQvkgVBDEucMW91+xzt8Jm1c80A@mail.gmail.com>
Subject: Re: [PATCH] usb: phy: tahvo: release resources on error in probe()
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Sergey Shtylyov <s.shtylyov@omp.ru>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Felipe Balbi <balbi@kernel.org>,
        linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, May 25, 2023 at 4:12=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> We need to do some clean up before returning on this error path.
>
> Fixes: 0d45a1373e66 ("usb: phy: tahvo: add IRQ check")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Hi Dan,

it seems this patch is already submitted with Yang Li from our mailing
list. Please refer to:

https://www.spinics.net/lists/linux-usb/msg240531.html

> ---
>  drivers/usb/phy/phy-tahvo.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/usb/phy/phy-tahvo.c b/drivers/usb/phy/phy-tahvo.c
> index 47562d49dfc1..5cac31c6029b 100644
> --- a/drivers/usb/phy/phy-tahvo.c
> +++ b/drivers/usb/phy/phy-tahvo.c
> @@ -391,7 +391,7 @@ static int tahvo_usb_probe(struct platform_device *pd=
ev)
>
>         tu->irq =3D ret =3D platform_get_irq(pdev, 0);
>         if (ret < 0)
> -               return ret;
> +               goto err_remove_phy;
>         ret =3D request_threaded_irq(tu->irq, NULL, tahvo_usb_vbus_interr=
upt,
>                                    IRQF_ONESHOT,
>                                    "tahvo-vbus", tu);
> --
> 2.39.2
>

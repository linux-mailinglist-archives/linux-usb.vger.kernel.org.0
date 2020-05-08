Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 459071CAAD0
	for <lists+linux-usb@lfdr.de>; Fri,  8 May 2020 14:37:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727989AbgEHMhF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 8 May 2020 08:37:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727950AbgEHMhD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 8 May 2020 08:37:03 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DBE9C05BD43
        for <linux-usb@vger.kernel.org>; Fri,  8 May 2020 05:37:03 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id b26so1287453lfa.5
        for <linux-usb@vger.kernel.org>; Fri, 08 May 2020 05:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=U4SacIaMP60OvVPcfU2T1BqaEzUhibsMT/zMLXsQoBA=;
        b=e7Jl3BJ19Ism1P69TIKtpxPGh8ZbCx3+AicmlgVw1Ddf4OGSAxhpdch9sq2p+QSiVo
         3YsVMpDJIritdffnSQ56k5Ar0uEFC1kA+lpRoFaGM/3QKzX+NoO+2JpDefk+s2Ngsdn4
         XZD+ETty1X0MmMdVk0RfYq0WJ8QXJO4BcSTLiYd7qeZeXeHYwzcYcwoyEmpbukvRKo4u
         I0g9Bzs3arfDfATNVgf3ISI49GPvOyIYg8JqmjndM1LNqP3IwRe+f61d8HWoQKv/57Dh
         L9b+x6kyIV4YNpaQCl5+m4w12SQmHOx0U/2Cv+4S0ICA/4R0C91q6hhsn6KScRcFI7ax
         g/tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=U4SacIaMP60OvVPcfU2T1BqaEzUhibsMT/zMLXsQoBA=;
        b=r6q14IlX19wfmSBu7f2zE6+otBpnbjvnzqrNCrln7zIiA2TP8J/8vT3CLtADOaorRm
         hXLLKc4HWs8WVKPNPJKBtxzgEJhhtYKyWjSHfxNJy/PZf8TwhnIArFQ9BapCpFGJ3zyj
         v8yao9zhMDE70PoBPe3ytL+qay3Hg+J0+DivAo3aSUVzz2yrmy1LlIp1OB++mxLtAIW0
         mWd518bS0JLLiOKu/9UJeQ35UZvkAHMQYb/BrV13v1P/pkwAdkFEQyGxt3x4Pk/g4jEu
         CeNCOHAaPgqPIUj/aNDWzRo1gOdacyXZGYA9cHiOMwsdyOkQLHGZVBd1mIFEJ05RXlGE
         hY6Q==
X-Gm-Message-State: AOAM532qrWXMqceeoK8jAJAXYHgmEZq0VvudPS/Ka8e4GdPYLOF0rk7A
        BNCDsRWGeosIcQsb9HrUTxv+9B6V2L4=
X-Google-Smtp-Source: ABdhPJxy+8NEqLtFSDb3Fk59b+pbAlFVgu2JXH47tPNrz+EeA2gznZaAotnzrizT44ExADroaPOUkg==
X-Received: by 2002:ac2:443c:: with SMTP id w28mr1800869lfl.2.1588941421508;
        Fri, 08 May 2020 05:37:01 -0700 (PDT)
Received: from saruman (91-155-214-58.elisa-laajakaista.fi. [91.155.214.58])
        by smtp.gmail.com with ESMTPSA id w15sm1134939ljd.35.2020.05.08.05.37.00
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 May 2020 05:37:00 -0700 (PDT)
From:   Felipe Balbi <balbi@kernel.org>
To:     Li Jun <jun.li@nxp.com>
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        john.stultz@linaro.org, chenyu56@huawei.com
Subject: Re: [PATCH] usb: dwc3: use readl_poll_timeout_atomic for register polling
In-Reply-To: <1588928985-1585-1-git-send-email-jun.li@nxp.com>
References: <1588928985-1585-1-git-send-email-jun.li@nxp.com>
Date:   Fri, 08 May 2020 15:36:56 +0300
Message-ID: <87blmymwlz.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Li Jun <jun.li@nxp.com> writes:

> Introduce dwc3_read_poll_timeout_atomic for register polling to
> simplify code, this way we use time(us) instead of register read
> iteration counter to wait register value change, this is also to
> resolve one ep command timeout issue found on imx8M, Chen Yu also
> encoutered this problem on his Hisilicon Kirin Soc[1], on imx8M,
> some ep command need more time to complete when SS PHY is at P3
> because suspend_clk(32K) is used, trace shows it takes about 400us
> to complete, see below trace(44.286278 - 44.285897 =3D 0.000381):
>
> configfs_acm.sh-822   [000] d..1    44.285896: dwc3_writel: addr
> 000000006d59aae1 value 00000401
> configfs_acm.sh-822   [000] d..1    44.285897: dwc3_readl: addr
> 000000006d59aae1 value 00000401
> ... ...
> configfs_acm.sh-822   [000] d..1    44.286278: dwc3_readl: addr
> 000000006d59aae1 value 00000001
> configfs_acm.sh-822   [000] d..1    44.286279: dwc3_gadget_ep_cmd:
> ep0out: cmd 'Set Endpoint Configuration' [401] params 00001000
> 00000500 00000000 --> status: Successful
>
> So set timeout to be 500us for dwc3_send_gadget_ep_cmd().
>
> [1] https://lkml.org/lkml/2019/9/25/754
>
> Signed-off-by: Li Jun <jun.li@nxp.com>

Let's fix the original bug first. This patch is likely to need changes
after that ;-)

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl61UmgACgkQzL64meEa
mQax7w/8D4t18kgePISqaVPsuRrdYfFWy/TX9g6L0tZrk6TjWoxLjWM+y9SY6QnD
qgBEScAFjCK2PqR8QQYzoqUK/7N2GbBj+vmg1SAOGsgUnKmXesPlLQ81oeO2+jx5
ygggSWEd3fjthV5oUChQy6Bu4smXGyHrFzc/KHaxTe23RaW150K6ZI6Eb4L0ff5u
m7wPju05a4/ESsIPv3QFPmFgr7j1k9uYo/I9WiB5i6KfsjrH1RICOLwzGfw4gubP
xxGFtT8PIV+Wz7JV9mM6+zjTwMkP6ger0bKTO5K2ZdScR1Evsfe9ndPWuwziT9CI
BdeOGuurTvfdlRhp+FYWC9WfqGRQ2QodQsKCTx4XjA9JYfKKMGcH2mkEzH+iV639
zq9yoeJF2Gii0IkkANyJppoKsOoxtpndvY4Jq1GQK1FdUIoOowFYq+BqTXHZMR+c
cRip6HaTTDSz548F1vDvhi84nI7PskuG1OLzqeAaf4rR0GFVfXcWNT+belbsAwmh
RWJFoHI0bK3ebk10XurM6CDj+52qgStgjHIMu+g7bVMh9qEkyVCEpC6PvnhmtpMm
v3tzsMHm353oux82Ipd+pTcteRa66+2rJ8biJ3Kte8k994SzmLTwQqZIWwnfke7L
Feu8Dpto8MYShDTk7JBKJ08gRnleJ3jDAzLVnHLb+xpxjOpt14k=
=hB31
-----END PGP SIGNATURE-----
--=-=-=--

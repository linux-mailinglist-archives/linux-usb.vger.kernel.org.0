Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A052221946
	for <lists+linux-usb@lfdr.de>; Thu, 16 Jul 2020 03:07:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727912AbgGPBGN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Jul 2020 21:06:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726785AbgGPBGN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Jul 2020 21:06:13 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CAB1C08C5CE
        for <linux-usb@vger.kernel.org>; Wed, 15 Jul 2020 18:06:13 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id md7so3848867pjb.1
        for <linux-usb@vger.kernel.org>; Wed, 15 Jul 2020 18:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=e2rVUlKuuIkQy85IOtUCVSZFDO7sfvuCwv9FBlIGudc=;
        b=WBRwXuL1J49aFDX6OowkdQp60wkBLDyNji+VnP+47luf3SDgodM5CwOA/KeRQyBiK/
         Ds76Qrv97EixHLwWaFyaLiwTYTLZejCwlFlXIoUV0aQV3W6LmFuXJ0T9YbB3FvLVWKvL
         v9EEQ8v7wIiTl2OmiIYvZKqXM71Q7RR3K0iF8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=e2rVUlKuuIkQy85IOtUCVSZFDO7sfvuCwv9FBlIGudc=;
        b=VfTZWGoNrqUnl+M2B2q/4+MNuAr31tYTBgOc3v+/ZjacliQCAhHp3JXcK0CzlYU/Ky
         djxjNE1f+zQWhyrieoS1CzVFNtvGJ4TkNXgTxttGgYrk6FVWqi+KpIsMiDJNKycyWdXp
         RdoVdXpkC3oDenUdqJHt3boY+sgy/feRdfPPSuJ5/laGs5GjuiHoXmcqiWtsVUrhzoSi
         mZ26dh5jPI1dK9MUlRdVoZQ7rAXW4lbRq8+BTi/fLfxjTlqVmlRbwlNIHutArtFw6i6f
         wpwFJMhAIKA1Yq93tUVbeAor+9gyw+bKfWT9itfPm+v2kPqTifSCXQGYKc444eWTYgLG
         8vhQ==
X-Gm-Message-State: AOAM533GWB2ww+d3n7k8LSn9QEqVaFxdFjd5f8CN8QxS6eJ1bt0nCqCJ
        MNPEJAIp+Mg18aiEv3evsyVluN7FxI4=
X-Google-Smtp-Source: ABdhPJwDuXNH1tttabpe1OV+jVg8VPDxCAe+DQNCQJLCDygr1r24B/9SZizwmtIKi2LthbUBcxYHIA==
X-Received: by 2002:a17:902:8d8b:: with SMTP id v11mr1626798plo.221.1594861572552;
        Wed, 15 Jul 2020 18:06:12 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id j19sm3134274pjy.40.2020.07.15.18.06.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2020 18:06:11 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1594622881-6563-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1594622881-6563-1-git-send-email-chunfeng.yun@mediatek.com>
Subject: Re: [v3 PATCH] usb: gadget: bdc: use readl_poll_timeout() to simplify code
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, YueHaibing <yuehaibing@huawei.com>,
        linux-kernel@vger.kernel.org,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        linux-mediatek@lists.infradead.org,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-arm-kernel@lists.infradead.org
To:     Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Felipe Balbi <balbi@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>
Date:   Wed, 15 Jul 2020 18:06:10 -0700
Message-ID: <159486157046.1987609.11356860908068064534@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Quoting Chunfeng Yun (2020-07-12 23:48:01)
> diff --git a/drivers/usb/gadget/udc/bdc/bdc_core.c b/drivers/usb/gadget/u=
dc/bdc/bdc_core.c
> index 02a3a77..d567e20 100644
> --- a/drivers/usb/gadget/udc/bdc/bdc_core.c
> +++ b/drivers/usb/gadget/udc/bdc/bdc_core.c
> @@ -29,24 +30,19 @@
>  #include "bdc_dbg.h"
> =20
>  /* Poll till controller status is not OIP */
> -static int poll_oip(struct bdc *bdc, int usec)
> +static int poll_oip(struct bdc *bdc, u32 usec)
>  {
>         u32 status;
> -       /* Poll till STS!=3D OIP */
> -       while (usec) {
> -               status =3D bdc_readl(bdc->regs, BDC_BDCSC);
> -               if (BDC_CSTS(status) !=3D BDC_OIP) {
> -                       dev_dbg(bdc->dev,
> -                               "poll_oip complete status=3D%d",
> -                               BDC_CSTS(status));
> -                       return 0;
> -               }
> -               udelay(10);
> -               usec -=3D 10;
> -       }
> -       dev_err(bdc->dev, "Err: operation timedout BDCSC: 0x%08x\n", stat=
us);
> +       int ret;
> =20
> -       return -ETIMEDOUT;
> +       ret =3D readl_poll_timeout(bdc->regs + BDC_BDCSC, status,
> +                                (BDC_CSTS(status) !=3D BDC_OIP), 10, use=
c);
> +       if (ret)
> +               dev_err(bdc->dev, "operation timedout BDCSC: 0x%08x\n", s=
tatus);
> +       else
> +               dev_dbg(bdc->dev, "%s complete status=3D%d", __func__, BD=
C_CSTS(status));

Different than before but OK.

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

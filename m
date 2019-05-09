Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 99A7218B84
	for <lists+linux-usb@lfdr.de>; Thu,  9 May 2019 16:17:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727101AbfEIOQH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 May 2019 10:16:07 -0400
Received: from mail-it1-f194.google.com ([209.85.166.194]:40078 "EHLO
        mail-it1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726839AbfEIOQH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 9 May 2019 10:16:07 -0400
Received: by mail-it1-f194.google.com with SMTP id g71so3570408ita.5;
        Thu, 09 May 2019 07:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VB9VW1DXgM5qsk34IWnaFfc5rrlp9hnpSv4gxGZLTzw=;
        b=LlqjSbHWA1WFzBfPS7JC2JpLHcIH3PlnAWBx5OhX3OrDq0LwVisdc3gmp8fmVz+ik1
         /l1+xH4+zOAK7kUdtQUSgPYqjvRRWWiirSHTw1GyC6ucAJB1PKCEVjsYPeL/WFp42yZL
         c6/2M/IpPmXqe1hzXxo/0x06f77J9nLiCXO/nSQt50sdpgPemR3Mmu/9eInVXBqb8yLM
         4YQQnM4iyNCi/4YzTjsiU2QJJVL8MNOvKxr5SMl8Yz6aU/p4ux4H2Mp2g5Ep96I79GUE
         KpKeqHVg9FSouihmQN4lSt2vfIEB32OebkIOpdo5uwDSLZAHkTlVALq94HAa1OjNaKdw
         Bzpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VB9VW1DXgM5qsk34IWnaFfc5rrlp9hnpSv4gxGZLTzw=;
        b=eQez2O0KJRq0KGUZMs30T6sV5vk74AAugyT4uOZQfu/Tc6W21K9ijqSeTWyHeNaNix
         vPsjoay/ZZ8jTr4gGvLGDWqGqDm2Hprs5Mg5H357egUyJjDU+spWCaibz+41EoTBUetu
         RBK8bq/uP9hQdOxUIdk/mTrUnB/vrRMn2Id0Qdn1GVjH+y08LXdQE+V3UJWB2+8dPg55
         dVtFPa70XWGEDWRXLA8gNhIPNwayBSSxvWHr0Zf6MvCGZEkTdz4zY3ztkbrNmmfFmKeD
         m9B77S+8Tikmfs5FlPFBLz+lznUYr5woRkhSZBWzFexIms41AifD5AHq5qxokoNqu5iR
         kPuw==
X-Gm-Message-State: APjAAAXdrVb/aSqvMjRHvklDzWaV+39UkhtGVJBHfdppH6NPmKI+cj/N
        RYQXCKBZ3L21ZpjDdhSTMnZtpABEj/WS5jcqGX4qm8Z7ELg=
X-Google-Smtp-Source: APXvYqx/fExGbExiF3LH9V1VVeMV1Wj79ugYIqqIfBk7vXMkbUDBUyYgY8WiMCd/APzg6HCsy+XVoJOKTUS6PytMV/Q=
X-Received: by 2002:a24:cd05:: with SMTP id l5mr2978259itg.44.1557411366279;
 Thu, 09 May 2019 07:16:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190504070407.56915-1-weiyongjun1@huawei.com> <5a3a89cf-eee3-136c-1c5a-58024e946a24@mleia.com>
In-Reply-To: <5a3a89cf-eee3-136c-1c5a-58024e946a24@mleia.com>
From:   Sylvain Lemieux <slemieux.tyco@gmail.com>
Date:   Thu, 9 May 2019 10:15:54 -0400
Message-ID: <CA+rxa6oh+Qxo5aLgW11vrAvuu7t7JAFONC6b0+kxRx9rwCmjhg@mail.gmail.com>
Subject: Re: [PATCH -next] usb: gadget: udc: lpc32xx: fix return value check
 in lpc32xx_udc_probe()
To:     Vladimir Zapolskiy <vz@mleia.com>
Cc:     Wei Yongjun <weiyongjun1@huawei.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-usb@vger.kernel.org,
        "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Thanks

Acked-by: Sylvain Lemieux <slemieux.tyco@gmail.com>

On Sat, May 4, 2019 at 8:17 AM Vladimir Zapolskiy <vz@mleia.com> wrote:
>
> Hi Wei Yongjun,
>
> On 05/04/2019 10:04 AM, Wei Yongjun wrote:
> > In case of error, the function devm_ioremap_resource() returns ERR_PTR()
> > and never returns NULL. The NULL test in the return value check should
> > be replaced with IS_ERR().
> >
> > This issue was detected by using the Coccinelle software.
> >
> > Fixes: 408b56ca5c8e ("usb: gadget: udc: lpc32xx: simplify probe")
> > Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> > ---
> >  drivers/usb/gadget/udc/lpc32xx_udc.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/usb/gadget/udc/lpc32xx_udc.c b/drivers/usb/gadget/udc/lpc32xx_udc.c
> > index d8f1c60793ed..00fb79c6d025 100644
> > --- a/drivers/usb/gadget/udc/lpc32xx_udc.c
> > +++ b/drivers/usb/gadget/udc/lpc32xx_udc.c
> > @@ -3070,9 +3070,9 @@ static int lpc32xx_udc_probe(struct platform_device *pdev)
> >       }
> >
> >       udc->udp_baseaddr = devm_ioremap_resource(dev, res);
> > -     if (!udc->udp_baseaddr) {
> > +     if (IS_ERR(udc->udp_baseaddr)) {
> >               dev_err(udc->dev, "IO map failure\n");
> > -             return -ENOMEM;
> > +             return PTR_ERR(udc->udp_baseaddr);
> >       }
> >
> >       /* Get USB device clock */
>
> thank you for the change, it is a correct fix.
>
> I do suppose that dev_err() in the context can be evenly removed, but
> likely it should be another change.
>
> Acked-by: Vladimir Zapolskiy <vz@mleia.com>
>
> --
> Best wishes,
> Vladimir

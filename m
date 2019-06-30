Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 805B25AFA5
	for <lists+linux-usb@lfdr.de>; Sun, 30 Jun 2019 12:31:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726519AbfF3Kbm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 30 Jun 2019 06:31:42 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:40031 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726482AbfF3Kbm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 30 Jun 2019 06:31:42 -0400
Received: by mail-io1-f68.google.com with SMTP id n5so22108639ioc.7
        for <linux-usb@vger.kernel.org>; Sun, 30 Jun 2019 03:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=2oqIz75KNESlOqUJhBPXcjPOp+quk31+qKsCBUMp1bY=;
        b=tlU1bOJpyygzlPoTZQyUZDvcfsOWRUcyVdyAFqatjxNKTiHCepSZfFygc01h99WQG9
         rpZketCL3kRNJ2lD9X0TFADuR+R5J/Xh9l+8wxe90yq5udZW3WDs9MyKpsSwOXFwWUSc
         1ugwmJ3EJ+m3d8u1lkWerGKlklTDpVdRzB6kdK82C8QmaPDQS9rN/eWskIZU//5TPtiy
         akxA5lp9guFiLdAXkRXAV5QvdsPy6Z25yuiIVNjxAjzadMhKK4fjtiHTC4mVxAhPPFJW
         S7Ch+ODlA8Nn7fCdG89NuAxganpscmqO/dMvs+kh8iAFf6WR79wiefaMCw/g+2KqrIwn
         SUKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=2oqIz75KNESlOqUJhBPXcjPOp+quk31+qKsCBUMp1bY=;
        b=XQr1hR1HQQdpUS1SKqt9rtzoxKT1bydB5FnYViY7mgWFvODJhl57cyAEQTeSEzCD9a
         orykvcjYNj0O8l3R5TiUiujCDPHTRziwqmnoTioJ9Olh6TjKPvgps0YWbii0xbk0QFrC
         NrmegCypR7DDSffSoSeDYoJoi2TYUalSAUppPylOaK4kweV55cOol0N2FGjNNvdAowUq
         lxITcY1/YmvarZrFodhZt69D1o3qw++57mnNEJuJbeHMUf18D17LrqjgD+1LhaXmL0gn
         35UYyS6kKJmH/eduabadzjrl6eTP1cDpbQ7Lvm4EceZK8ngGeBhR9HWvrofXQ5Er6i/l
         l/Sw==
X-Gm-Message-State: APjAAAVFcQdZFaXwwYs78fkph2QAJM9oq+BRfHgsTAIwSN3nWIcjvogU
        +L3TUVFDLcLhDod98+vPlYZXVVDO70KDKxsNsKk=
X-Google-Smtp-Source: APXvYqzLtrrAb53eIs9wY6s+sNSZRXSfLxPUWK5FR9BnBkqBGhKdyZJzjY65DKBiSib9WSMIg5tmp/NCa4lbL2OGm5c=
X-Received: by 2002:a02:5502:: with SMTP id e2mr21875994jab.87.1561890701191;
 Sun, 30 Jun 2019 03:31:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190626082512.7637-1-michonskikrzysztof@gmail.com> <VI1PR04MB53274E7E20C099F0F84B18198BFD0@VI1PR04MB5327.eurprd04.prod.outlook.com>
In-Reply-To: <VI1PR04MB53274E7E20C099F0F84B18198BFD0@VI1PR04MB5327.eurprd04.prod.outlook.com>
From:   =?UTF-8?Q?Krzysztof_Micho=C5=84ski?= <michonskikrzysztof@gmail.com>
Date:   Sun, 30 Jun 2019 12:31:30 +0200
Message-ID: <CAOiNxGDs9Ki7_y_=Mv1tnSsqObv9EYzkdmo+yLCO6gMPBLNwYA@mail.gmail.com>
Subject: Re: [PATCH] imx: usb: get pinctrl if it's not yet initialized
To:     Peter Chen <peter.chen@nxp.com>
Cc:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "afenkart@gmail.com" <afenkart@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Peter,
Yes you are right! This file's been patched previously in my fork.
Sorry about that.

Regards,
Krzysztof Micho=C5=84ski

czw., 27 cze 2019 o 05:22 Peter Chen <peter.chen@nxp.com> napisa=C5=82(a):
>
>
> > In case usb phy mode is other than USBPHY_INTERFACE_MODE_HSIC the pinct=
rl
> > for device is not acquired. It is however used later regardless of the =
mode, hence
> > leads to requesting access to uninitialized data.
> >
> > Signed-off-by: Krzysztof Michonski <michonskikrzysztof@gmail.com>
> > ---
> >  drivers/usb/chipidea/ci_hdrc_imx.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/=
ci_hdrc_imx.c
> > index a4b482c3dc65..2f02b35c40b6 100644
> > --- a/drivers/usb/chipidea/ci_hdrc_imx.c
> > +++ b/drivers/usb/chipidea/ci_hdrc_imx.c
> > @@ -428,6 +428,9 @@ static int ci_hdrc_imx_probe(struct platform_device=
 *pdev)
> >               pm_runtime_enable(dev);
> >       }
> >
> > +     if (!data->pinctrl)
> > +             data->pinctrl =3D devm_pinctrl_get(dev);
> > +
> >       if (!IS_ERR(data->pinctrl)) {
> >               struct pinctrl_state *state;
> >
>
> Sorry, what kernel version you are using? The recent kernel is different =
with the patch you posted.
>
> Peter
>

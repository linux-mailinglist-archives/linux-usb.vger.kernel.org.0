Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC2AD15044
	for <lists+linux-usb@lfdr.de>; Mon,  6 May 2019 17:30:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726181AbfEFPam (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 May 2019 11:30:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:51598 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726034AbfEFPal (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 6 May 2019 11:30:41 -0400
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AC7A221019;
        Mon,  6 May 2019 15:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1557156640;
        bh=y4bAG5gq6U3haHrnf1MAV7rGMGFLAEB6Ibt6G1yZvZ8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=aCPzxtAo0cqsJZqURdeQaqK83/p0unGaJCJFcRgDP3xUetjGuPbKSaaz4RyQZOCGf
         /URNPAAIMkGZjS1uhIVqAHOYluDNONqThbPpvu6Ld1kr9ug6sBG0HSGe7yCwjzvQbi
         J/2K1pqUToZdrV4joYCJYB6MSw6KfCpGLH9VsV8Y=
Received: by mail-qk1-f174.google.com with SMTP id p19so4450698qkm.10;
        Mon, 06 May 2019 08:30:40 -0700 (PDT)
X-Gm-Message-State: APjAAAUTFHW6Yv+1imJFWhtyF/17+TEb5rhfhqGn9GCPR2W7S0CtxeeK
        SRSAGAi16LWES0Ho67wyE+JECLI+j6sBIV7NTw==
X-Google-Smtp-Source: APXvYqznvmDWZUjkaxr0sSjLP51EjpfxMMduwQvYSJXU0WPFWR7Y+y3kDu4pbxxZImHKPkVymEqchQsoW0f0gHPW8x4=
X-Received: by 2002:a37:4711:: with SMTP id u17mr20161936qka.326.1557156639851;
 Mon, 06 May 2019 08:30:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190428024847.5046-1-peter.chen@nxp.com> <20190428024847.5046-7-peter.chen@nxp.com>
 <CAL_JsqLPK8kuYTT7ekZbAzywp2kr9xKA0_X3BAqVn5hShbPM+w@mail.gmail.com> <VI1PR04MB5327641FD0A21BB4C93A85A58B370@VI1PR04MB5327.eurprd04.prod.outlook.com>
In-Reply-To: <VI1PR04MB5327641FD0A21BB4C93A85A58B370@VI1PR04MB5327.eurprd04.prod.outlook.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Mon, 6 May 2019 10:30:27 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+OywH+_caxtrBJF=nMVxFeHsuL8jbLq=a6VBXWiZ0ktA@mail.gmail.com>
Message-ID: <CAL_Jsq+OywH+_caxtrBJF=nMVxFeHsuL8jbLq=a6VBXWiZ0ktA@mail.gmail.com>
Subject: Re: [PATCH 6/7] ARM: dts: imx7ulp: add imx7ulp USBOTG1 support
To:     Peter Chen <peter.chen@nxp.com>
Cc:     "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "balbi@kernel.org" <balbi@kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, May 4, 2019 at 10:13 PM Peter Chen <peter.chen@nxp.com> wrote:
>
>
> > > ---
> > >  arch/arm/boot/dts/imx7ulp.dtsi | 30 ++++++++++++++++++++++++++++++
> > >  1 file changed, 30 insertions(+)
> > >
> > > diff --git a/arch/arm/boot/dts/imx7ulp.dtsi
> > > b/arch/arm/boot/dts/imx7ulp.dtsi index fca6e50f37c8..e2944f98eac6
> > > 100644
> > > --- a/arch/arm/boot/dts/imx7ulp.dtsi
> > > +++ b/arch/arm/boot/dts/imx7ulp.dtsi
> > > @@ -30,6 +30,7 @@
> > >                 serial1 = &lpuart5;
> > >                 serial2 = &lpuart6;
> > >                 serial3 = &lpuart7;
> > > +               usbphy0 = &usbphy1;
> >
> > Drop this. You shouldn't need an alias.
> >
>
> It is a derived USB PHY and used on most of i.mx chipidea USB controllers.
> At the source code, we use aligned id to know the controller number.
>
>         ret = of_alias_get_id(np, "usbphy");
>         if (ret < 0)
>                 dev_dbg(&pdev->dev, "failed to get alias id, errno %d\n", ret);
>         mxs_phy->port_id = ret;

fsl,anatop property should probably have cell to specify this.

>
> > >         };
> > >
> > >         cpus {
> > > @@ -133,6 +134,35 @@
> > >                         clock-names = "ipg", "per";
> > >                 };
> > >
> > > +               usbotg1: usb@40330000 {
> > > +                       compatible = "fsl,imx7ulp-usb", "fsl,imx6ul-usb",
> > > +                               "fsl,imx27-usb";
> > > +                       reg = <0x40330000 0x200>;
> > > +                       interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
> > > +                       clocks = <&pcc2 IMX7ULP_CLK_USB0>;
> > > +                       fsl,usbphy = <&usbphy1>;
> >
> > Don't use this for new users. Use the phy binding instead.
> >
>
> It is not a new user, the USB PHY used at imx7ulp is the same with imx6's.

New SoC is a new user. The chipidea core already supports using 'phys'
so you should be able to just use the common code.

Rob

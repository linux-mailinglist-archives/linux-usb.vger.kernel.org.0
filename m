Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 175B3156FF2
	for <lists+linux-usb@lfdr.de>; Mon, 10 Feb 2020 08:39:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726584AbgBJHj0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Feb 2020 02:39:26 -0500
Received: from kernel.crashing.org ([76.164.61.194]:54252 "EHLO
        kernel.crashing.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726118AbgBJHj0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 10 Feb 2020 02:39:26 -0500
X-Greylist: delayed 654 seconds by postgrey-1.27 at vger.kernel.org; Mon, 10 Feb 2020 02:39:17 EST
Received: from localhost (gate.crashing.org [63.228.1.57])
        (authenticated bits=0)
        by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 01A7TN4p010982
        (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Mon, 10 Feb 2020 01:29:29 -0600
Message-ID: <b7bf421b5fad397a7ef430af6c0c09602dd66c2a.camel@kernel.crashing.org>
Subject: Re: [PATCH 2/3] usb: gadget: aspeed: add ast2600 vhub support
From:   Benjamin Herrenschmidt <benh@kernel.crashing.org>
To:     Joel Stanley <joel@jms.id.au>, Tao Ren <rentao.bupt@gmail.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Jeffery <andrew@aj.id.au>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Colin Ian King <colin.king@canonical.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-usb@vger.kernel.org,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date:   Mon, 10 Feb 2020 08:29:22 +0100
In-Reply-To: <CACPK8XcmUYhnePr1AG2M9P-oGvOM=zCM+r44jWUzPYGxUEGOGw@mail.gmail.com>
References: <20200131222157.20849-1-rentao.bupt@gmail.com>
         <20200131222157.20849-3-rentao.bupt@gmail.com>
         <CACPK8XcmUYhnePr1AG2M9P-oGvOM=zCM+r44jWUzPYGxUEGOGw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, 2020-02-10 at 02:48 +0000, Joel Stanley wrote:
> On Fri, 31 Jan 2020 at 22:22, <rentao.bupt@gmail.com> wrote:
> > 
> > From: Tao Ren <rentao.bupt@gmail.com>
> > 
> > Add AST2600 support in aspeed-vhub driver. There are 3 major differences
> > between AST2500 and AST2600 vhub:
> >   - AST2600 supports 7 downstream ports while AST2500 supports 5.
> >   - AST2600 supports 21 generic endpoints while AST2500 supports 15.
> >   - EP0 data buffer's 8-byte DMA alignment restriction is removed from
> >     AST2600.
> > 
> > Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
> > Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

Travelling at the moment so my review might be a bit delayed. Also for
some reason I missed your original submission, sorry about that, please
poke me next time if I don't reply within a couple of days !

One thing to look into as well is the 2600 has revived the "device
controller" which looks like a cut down version of a vhub device, so we
should break a bit more the linkage between vhub and the underlying
devices so the latter can be instanciated standalone...

(Foor for thought, I'm not asking you to do that right now)

Cheers,
Ben.

> Reviewed-by: Joel Stanley <joel@jms.id.au>
> 
> > ---
> >  drivers/usb/gadget/udc/aspeed-vhub/Kconfig | 4 ++--
> >  drivers/usb/gadget/udc/aspeed-vhub/core.c  | 9 +++++++++
> >  2 files changed, 11 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/usb/gadget/udc/aspeed-vhub/Kconfig b/drivers/usb/gadget/udc/aspeed-vhub/Kconfig
> > index 83ba8a2eb6af..605500b19cf3 100644
> > --- a/drivers/usb/gadget/udc/aspeed-vhub/Kconfig
> > +++ b/drivers/usb/gadget/udc/aspeed-vhub/Kconfig
> > @@ -4,5 +4,5 @@ config USB_ASPEED_VHUB
> >         depends on ARCH_ASPEED || COMPILE_TEST
> >         depends on USB_LIBCOMPOSITE
> >         help
> > -         USB peripheral controller for the Aspeed AST2500 family
> > -         SoCs supporting the "vHub" functionality and USB2.0
> > +         USB peripheral controller for the Aspeed AST2400, AST2500 and
> > +         AST2600 family SoCs supporting the "vHub" functionality and USB2.0
> > diff --git a/drivers/usb/gadget/udc/aspeed-vhub/core.c b/drivers/usb/gadget/udc/aspeed-vhub/core.c
> > index 94081cc04113..c827bf420278 100644
> > --- a/drivers/usb/gadget/udc/aspeed-vhub/core.c
> > +++ b/drivers/usb/gadget/udc/aspeed-vhub/core.c
> > @@ -42,6 +42,11 @@ static const struct ast_vhub_config ast2400_config = {
> >         .max_epns = 15,
> >  };
> > 
> > +static const struct ast_vhub_config ast2600_config = {
> > +       .max_ports = 7,
> > +       .max_epns = 21,
> > +};
> > +
> >  static const struct of_device_id ast_vhub_dt_ids[] = {
> >         {
> >                 .compatible = "aspeed,ast2400-usb-vhub",
> > @@ -51,6 +56,10 @@ static const struct of_device_id ast_vhub_dt_ids[] = {
> >                 .compatible = "aspeed,ast2500-usb-vhub",
> >                 .data = &ast2400_config,
> >         },
> > +       {
> > +               .compatible = "aspeed,ast2600-usb-vhub",
> > +               .data = &ast2600_config,
> > +       },
> >         { }
> >  };
> >  MODULE_DEVICE_TABLE(of, ast_vhub_dt_ids);
> > --
> > 2.17.1
> > 


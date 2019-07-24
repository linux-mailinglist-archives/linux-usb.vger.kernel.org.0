Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 38C3272F99
	for <lists+linux-usb@lfdr.de>; Wed, 24 Jul 2019 15:09:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387477AbfGXNJo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 24 Jul 2019 09:09:44 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:46787 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726535AbfGXNJo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 24 Jul 2019 09:09:44 -0400
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1hqH1X-0007kg-UH; Wed, 24 Jul 2019 15:09:39 +0200
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1hqH1X-0000cL-5c; Wed, 24 Jul 2019 15:09:39 +0200
Date:   Wed, 24 Jul 2019 15:09:39 +0200
From:   Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Peter Chen <peter.chen@nxp.com>,
        "felipe.balbi@linux.intel.com" <felipe.balbi@linux.intel.com>,
        Marco Felsch <m.felsch@pengutronix.de>
Cc:     "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] ARM: imx25: provide a fixed regulator for usb phys
Message-ID: <20190724130939.43t66umrasbe4wwf@pengutronix.de>
References: <20190625100412.11815-1-u.kleine-koenig@pengutronix.de>
 <VI1PR04MB5327E09DB0DFEB7E868DB59D8BE20@VI1PR04MB5327.eurprd04.prod.outlook.com>
 <20190626055409.jjiwptyths6p6jty@pengutronix.de>
 <VI1PR04MB53270E979BA9817D47A7AFC88BFD0@VI1PR04MB5327.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <VI1PR04MB53270E979BA9817D47A7AFC88BFD0@VI1PR04MB5327.eurprd04.prod.outlook.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

On Thu, Jun 27, 2019 at 03:15:10AM +0000, Peter Chen wrote:
>  
> > On 19-06-26 02:40, Peter Chen wrote:
> > >
> > > > Subject: [PATCH] ARM: imx25: provide a fixed regulator for usb phys
> > > >
> > > > The usb phys are internal to the SoC and so it their 5V supply. With
> > > > this regulator added explicitly the following (harmless) boot messages go away:
> > > >
> > > > 	usb_phy_generic usbphy:usb-phy@0: usbphy:usb-phy@0 supply vcc not found, using dummy regulator
> > > > 	usb_phy_generic usbphy:usb-phy@1: usbphy:usb-phy@1 supply vcc not found, using dummy regulator
> > > >
> > >
> > > To eliminate the warning message, I suggest doing below changes, as
> > > vcc supply is not mandatory.
> > >
> > > diff --git a/drivers/usb/phy/phy-generic.c
> > > b/drivers/usb/phy/phy-generic.c index a53b89be5324..01a5ff1a0515
> > > 100644
> > > --- a/drivers/usb/phy/phy-generic.c
> > > +++ b/drivers/usb/phy/phy-generic.c
> > > @@ -275,7 +275,7 @@ int usb_phy_gen_create_phy(struct device *dev, struct usb_phy_generic *nop,
> > >                 }
> > >         }
> > >
> > > -       nop->vcc = devm_regulator_get(dev, "vcc");
> > > +       nop->vcc = devm_regulator_get_optional(dev, "vcc");
> > 
> > Is the regulator optional? IMHO this shouldn't be the fix. I think the right fix is Uwe's
> > approach.
> > 
> 
> Add Felipe.
> 
> Some USB PHY's power are from the core system's power (eg, DDR), and some are
> fixed at the board and no switch for it. So, it is transparent for software at some cases.

It's not clear to me how to proceed. There are two opposing opinions and
I don't know enough about USB on mx25 to judge myself.

Felipe?

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

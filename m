Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45D2161528C
	for <lists+linux-usb@lfdr.de>; Tue,  1 Nov 2022 20:51:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229562AbiKATvg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Nov 2022 15:51:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229487AbiKATvf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 1 Nov 2022 15:51:35 -0400
Received: from smtp-out-01.comm2000.it (smtp-out-01.comm2000.it [212.97.32.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E1AB1A22A
        for <linux-usb@vger.kernel.org>; Tue,  1 Nov 2022 12:51:31 -0700 (PDT)
Received: from francesco-nb.int.toradex.com (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: francesco@dolcini.it)
        by smtp-out-01.comm2000.it (Postfix) with ESMTPSA id 13ED184148A;
        Tue,  1 Nov 2022 20:51:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailserver.it;
        s=mailsrv; t=1667332286;
        bh=izI0AqxMfY3qaG334kqSJtKeDAM9elfHVjbfJaoH+FM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To;
        b=CrKQlYW1QRhZNAwKN4J41RD5hcZPS+qZ+X6ouPti83/dQlAIzGazfWDekQSHsItd7
         Xo3n5+OBOOgOfSWeHhBC7IHTrIj4FN5m6EPA5yELU/KULvyRYn9w//Ze3b3JGM5yw7
         C0nJ/mMh3C7w8Z7/q6Bb07zXuyoX5F6yEcvIw2AsZ5DevTl1XKbFE2pj1Rwyl9zGfd
         V9f8nMVMX4t4+OHXVGjkEjtu3Z+maYvnaxU5j9zSfRir90SgSMcw+gIRoqj+HOYHlh
         NmyPyOs8Q9UzYdTfJVgJPZAK3h4xEU0YhuvpT3e9WgEjf4Ro3cFewJdlkSjN9pS9Zv
         pMavo+DBE+U4w==
Date:   Tue, 1 Nov 2022 20:51:16 +0100
From:   Francesco Dolcini <francesco@dolcini.it>
To:     Jun Li <jun.li@nxp.com>
Cc:     Francesco Dolcini <francesco@dolcini.it>,
        "Jun Li (OSS)" <jun.li@oss.nxp.com>,
        Peter Chen <peter.chen@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        Felipe Balbi <balbi@kernel.org>,
        "philippe.schenker@toradex.com" <philippe.schenker@toradex.com>,
        Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: Re: USB runtime PM issues on i.MX6ULL
Message-ID: <Y2F4tCMaB4x2fZck@francesco-nb.int.toradex.com>
References: <Y1vLpaxpc5WBCuGD@francesco-nb.int.toradex.com>
 <PA4PR04MB9640E8D3E851800492D8FCAD89379@PA4PR04MB9640.eurprd04.prod.outlook.com>
 <Y1/TZqsqy/ZRVNqJ@francesco-nb.int.toradex.com>
 <PA4PR04MB9640863D2A1F38A10C8BDFDC89369@PA4PR04MB9640.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PA4PR04MB9640863D2A1F38A10C8BDFDC89369@PA4PR04MB9640.eurprd04.prod.outlook.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello Jun Li,

On Tue, Nov 01, 2022 at 03:10:46AM +0000, Jun Li wrote:
> > On Mon, Oct 31, 2022 at 01:40:39PM +0000, Jun Li (OSS) wrote:
> > > > I am debugging some unexpected USB behavior on a i.MX6ULL SOC,
> > > > chipidea controller ("fsl,imx6ul-usb") and a fsl mxs usbphy
> > > > ("fsl,imx6ul-usbphy").
> > > >
> > > > The HW design has 2 USB interface, the first one is dual-role, while
> > > > the second one is a host port with NO way to re-read the VBUS
> > > > (USB_OTG2_VBUS is not really connected, there is just a capacitor to
> > > > GND).
> > >
> > > How is your USB_OTG1_VBUS status? Can you try to make your
> > > USB_OTG1_VBUS pad has a valid VBUS voltage, then run your Host only
> > > port test with runtime PM enabled?
> > 
> > USB_OTG1_VBUS is tied to GND the same way as USB_OTG2_VBUS, not really
> > straightforward to do such a test.
> 
> iMX6ULL need at least one valid VBUS(either from OTG1 or OTG2) as input to
> power the internal USB LDO if I understand correctly.
This surprise me a little bit, since
 - the i.MX6ULL datasheet prescribe to keep the VBUS disconnected if
   unused
 - downstream NXP kernel seems to work fine ("seems" since we do have
   some patches there, so I could be wrong)
 - disabling runtime pm on upstream Linux kernel make it works
   perfectly, so there is a way in SW to have this HW configuration
   working.

> your HW to meet this: for Host only port, you have to connect USB_OTG2_VBUS
> to a valid VBUS and make it always present for simple.
> You can do some quick HW change to prove this.
We have no way to change the HW in reality, therefore doing a one off
test would be pretty much irrelevant.

Said all of that, given what you wrote, I feel like having a specific
dts property in the chipidea driver to disable runtime pm might be the
way to go.

Something like `ci,disable-runtime-pm`? I know the DTS is supposed to
describe the HW, so maybe a different property name would be required.

What do you think about this?

Francesco

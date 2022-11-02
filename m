Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D74A616B58
	for <lists+linux-usb@lfdr.de>; Wed,  2 Nov 2022 18:59:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229640AbiKBR7a (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Nov 2022 13:59:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229993AbiKBR7N (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 2 Nov 2022 13:59:13 -0400
Received: from smtp-out-08.comm2000.it (smtp-out-08.comm2000.it [212.97.32.78])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 198C52034E
        for <linux-usb@vger.kernel.org>; Wed,  2 Nov 2022 10:59:11 -0700 (PDT)
Received: from francesco-nb.int.toradex.com (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: francesco@dolcini.it)
        by smtp-out-08.comm2000.it (Postfix) with ESMTPSA id ACF894241D8;
        Wed,  2 Nov 2022 18:59:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailserver.it;
        s=mailsrv; t=1667411949;
        bh=FaFrZyO2fP+uYEly8MiK/7Jg47AKOZjm0GZpChzCzio=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To;
        b=TrN55qIJBT6H3HafAgBXpYQwxWhzb0Zlfa3X2uDBoFLcVlroWCZq2QvA+KTixOdyX
         DokVCVZ6KvusEPFLSeGInHUeH1FfiNCscOaXNnp7OGYt/rahwrBQlHl9fKsVDZkHiE
         cprLWpcxD/iFYGWDd6UIjVyGfFQ1e/ew9ArTjQnWcdNjd+IrpJ1zXNS+ZmvMH0diyw
         G/Hy6RmhNNHiPdx0vm+cwI/rvUuGvGRrdV0P6PNAFvdt3sBKIHTALeWPzNID0MKuRH
         l81etSnTMS/Je2UUCdF3nrPoGF5GO1P1Rt3vTeu43XXivKr0/ZY3q7lJJn622J/DVy
         bOnwmFQeGdwrQ==
Date:   Wed, 2 Nov 2022 18:59:04 +0100
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
Message-ID: <Y2Kv6IkOFc4W0Ebc@francesco-nb.int.toradex.com>
References: <Y1vLpaxpc5WBCuGD@francesco-nb.int.toradex.com>
 <PA4PR04MB9640E8D3E851800492D8FCAD89379@PA4PR04MB9640.eurprd04.prod.outlook.com>
 <Y1/TZqsqy/ZRVNqJ@francesco-nb.int.toradex.com>
 <PA4PR04MB9640863D2A1F38A10C8BDFDC89369@PA4PR04MB9640.eurprd04.prod.outlook.com>
 <Y2F4tCMaB4x2fZck@francesco-nb.int.toradex.com>
 <PA4PR04MB9640FA4674C8B80A9FEA44DC89399@PA4PR04MB9640.eurprd04.prod.outlook.com>
 <PA4PR04MB9640217920D3CD7A506FF9E389399@PA4PR04MB9640.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PA4PR04MB9640217920D3CD7A506FF9E389399@PA4PR04MB9640.eurprd04.prod.outlook.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Nov 02, 2022 at 10:12:42AM +0000, Jun Li wrote:
> > > On Tue, Nov 01, 2022 at 03:10:46AM +0000, Jun Li wrote:
> > > > > On Mon, Oct 31, 2022 at 01:40:39PM +0000, Jun Li (OSS) wrote:
> > > > > > > I am debugging some unexpected USB behavior on a i.MX6ULL SOC,
> > > > > > > chipidea controller ("fsl,imx6ul-usb") and a fsl mxs usbphy
> > > > > > > ("fsl,imx6ul-usbphy").
> > > > > > >
> > > > > > > The HW design has 2 USB interface, the first one is dual-role,
> > > > > > > while the second one is a host port with NO way to re-read the
> > > > > > > VBUS (USB_OTG2_VBUS is not really connected, there is just a
> > > > > > > capacitor to GND).
> > > > > >
> > > > > > How is your USB_OTG1_VBUS status? Can you try to make your
> > > > > > USB_OTG1_VBUS pad has a valid VBUS voltage, then run your Host
> > > > > > only port test with runtime PM enabled?
> > > > >
> > > > > USB_OTG1_VBUS is tied to GND the same way as USB_OTG2_VBUS, not
> > > > > really straightforward to do such a test.
> > > >
> > > > iMX6ULL need at least one valid VBUS(either from OTG1 or OTG2) as
> > > > input to power the internal USB LDO if I understand correctly.
> > > This surprise me a little bit, since
> > >  - the i.MX6ULL datasheet prescribe to keep the VBUS disconnected if
> > >    unused
> > 
> > I think "unused" here means you do not need/enable the port at all.
> > 
> > >  - downstream NXP kernel seems to work fine ("seems" since we do have
> > >    some patches there, so I could be wrong)
> > 
> > What do you mean by " downstream NXP kernel seems to work fine"?
> > The downstream kernel can work on your HW? But upstream kernel
> > driver does not?

Correct, NXP downstream kernel is working fine, upstream kernel requires
runtime PM disabled to work correctly.

> > >  - disabling runtime pm on upstream Linux kernel make it works
> > >    perfectly, so there is a way in SW to have this HW configuration
> > >    working.
> > 
> > Again I want to make sure the both VBUS pads(OTG1 and OTG2) voltage
> > are always at 0v on your HW, can you double check and confirm?
> > I ask this again because such situation should cause the USB port
> > Cannot work at any cases, but your current status is: only low
> > power wakeup cannot work.
> 
> Could you please check the voltage of pad of VDD_USB_CAP on your HW?

I was about to clarify you this point, it's important and I forgot about
it, sorry about that!

VDD_USB_CAP in our design is connected to a 3.0V external LDO, voltage
on both VBUS pads is 0V (FYI: this specific hardware design was validated
by NXP hardware engineers).

Francesco


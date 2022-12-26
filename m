Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ADAC16563E2
	for <lists+linux-usb@lfdr.de>; Mon, 26 Dec 2022 16:51:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229823AbiLZPve (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 26 Dec 2022 10:51:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229476AbiLZPvb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 26 Dec 2022 10:51:31 -0500
X-Greylist: delayed 380 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 26 Dec 2022 07:51:27 PST
Received: from smtp-out-04.comm2000.it (smtp-out-04.comm2000.it [212.97.32.67])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE1A3C7E
        for <linux-usb@vger.kernel.org>; Mon, 26 Dec 2022 07:51:27 -0800 (PST)
Received: from francesco-nb.int.toradex.com (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: francesco@dolcini.it)
        by smtp-out-04.comm2000.it (Postfix) with ESMTPSA id EA6D5BC3042;
        Mon, 26 Dec 2022 16:44:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailserver.it;
        s=mailsrv; t=1672069504;
        bh=JyUXcb49oj84ABjWXO7qnR1+TICymj+GVtGQMMfWIOE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To;
        b=YNFoUti0WohPG9u6tt45hREKi7gQ6uVlduuqYnMDjpLTtXW36fpMuoyTDoJzFYAp7
         KHvX/4cQDMOjQxXxHWqEmSzZy8wCqcb0p0DCjlzY76Yp/HmBlxIWS8UmKat91H++4n
         zQ5/BbZJwAFzlyqYqPyFZOlNES01k0N6O1S5zvtF5ep7GIxo3lTeEbqpURTTWz7l0g
         gYMVbgNvrZbTSNcgekUbRaHgEu42franMuBkgJSoPnyY2PdK0PPf4X+Qm+MEDnFCY9
         BUXQzvFiQVe8h7Nm8InO3XvUVhk9UYg3Cub1yfN78+XFsbfgKd7mNVExHYhIl6rg64
         3fYqedy8YSiag==
Date:   Mon, 26 Dec 2022 16:44:47 +0100
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
        Francesco Dolcini <francesco.dolcini@toradex.com>,
        Xu Yang <xu.yang_2@nxp.com>
Subject: Re: USB runtime PM issues on i.MX6ULL
Message-ID: <Y6nBb4pq4+GD1DDB@francesco-nb.int.toradex.com>
References: <Y1vLpaxpc5WBCuGD@francesco-nb.int.toradex.com>
 <PA4PR04MB9640E8D3E851800492D8FCAD89379@PA4PR04MB9640.eurprd04.prod.outlook.com>
 <Y1/TZqsqy/ZRVNqJ@francesco-nb.int.toradex.com>
 <PA4PR04MB9640863D2A1F38A10C8BDFDC89369@PA4PR04MB9640.eurprd04.prod.outlook.com>
 <Y2F4tCMaB4x2fZck@francesco-nb.int.toradex.com>
 <PA4PR04MB9640FA4674C8B80A9FEA44DC89399@PA4PR04MB9640.eurprd04.prod.outlook.com>
 <PA4PR04MB9640217920D3CD7A506FF9E389399@PA4PR04MB9640.eurprd04.prod.outlook.com>
 <Y2Kv6IkOFc4W0Ebc@francesco-nb.int.toradex.com>
 <PA4PR04MB9640FC6466D5BC1588FC37F789389@PA4PR04MB9640.eurprd04.prod.outlook.com>
 <PA4PR04MB9640BDD0B040765259B010E489EC9@PA4PR04MB9640.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PA4PR04MB9640BDD0B040765259B010E489EC9@PA4PR04MB9640.eurprd04.prod.outlook.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Dec 26, 2022 at 03:17:12AM +0000, Jun Li wrote:
> > From: Jun Li
> > Sent: Thursday, November 3, 2022 7:53 PM
> > > From: Francesco Dolcini <francesco@dolcini.it>
> > > Sent: Thursday, November 3, 2022 1:59 AM
> > > On Wed, Nov 02, 2022 at 10:12:42AM +0000, Jun Li wrote:
> > > > > > On Tue, Nov 01, 2022 at 03:10:46AM +0000, Jun Li wrote:
> > > > > > > > On Mon, Oct 31, 2022 at 01:40:39PM +0000, Jun Li (OSS) wrote:
> > > > > > > > > > I am debugging some unexpected USB behavior on a
> > > > > > > > > > i.MX6ULL SOC, chipidea controller ("fsl,imx6ul-usb") and
> > > > > > > > > > a fsl mxs usbphy ("fsl,imx6ul-usbphy").
> > > > > > > > > >
> > > > > > > > > > The HW design has 2 USB interface, the first one is
> > > > > > > > > > dual-role, while the second one is a host port with NO
> > > > > > > > > > way to re-read
> > > the
> > > > > > > > > > VBUS (USB_OTG2_VBUS is not really connected, there is
> > > > > > > > > > just
> > > a
> > > > > > > > > > capacitor to GND).
> > > > > > > > >
> > > > > > > > > How is your USB_OTG1_VBUS status? Can you try to make your
> > > > > > > > > USB_OTG1_VBUS pad has a valid VBUS voltage, then run your
> > > > > > > > > Host only port test with runtime PM enabled?
> > > > > > > >
> > > > > > > > USB_OTG1_VBUS is tied to GND the same way as USB_OTG2_VBUS,
> > > > > > > > not really straightforward to do such a test.
> > > > > > >
> > > > > > > iMX6ULL need at least one valid VBUS(either from OTG1 or OTG2)
> > > > > > > as input to power the internal USB LDO if I understand correctly.
> > > > > > This surprise me a little bit, since
> > > > > >  - the i.MX6ULL datasheet prescribe to keep the VBUS disconnected
> > if
> > > > > >    unused
> > > > >
> > > > > I think "unused" here means you do not need/enable the port at all.
> > > > >
> > > > > >  - downstream NXP kernel seems to work fine ("seems" since we do
> > have
> > > > > >    some patches there, so I could be wrong)
> > > > >
> > > > > What do you mean by " downstream NXP kernel seems to work fine"?
> > > > > The downstream kernel can work on your HW? But upstream kernel
> > > > > driver does not?
> > >
> > > Correct, NXP downstream kernel is working fine, upstream kernel
> > > requires runtime PM disabled to work correctly.
> > >
> > > > > >  - disabling runtime pm on upstream Linux kernel make it works
> > > > > >    perfectly, so there is a way in SW to have this HW configuration
> > > > > >    working.
> > > > >
> > > > > Again I want to make sure the both VBUS pads(OTG1 and OTG2)
> > > > > voltage are always at 0v on your HW, can you double check and confirm?
> > > > > I ask this again because such situation should cause the USB port
> > > > > Cannot work at any cases, but your current status is: only low
> > > > > power wakeup cannot work.
> > > >
> > > > Could you please check the voltage of pad of VDD_USB_CAP on your HW?
> > >
> > > I was about to clarify you this point, it's important and I forgot
> > > about it, sorry about that!
> > >
> > > VDD_USB_CAP in our design is connected to a 3.0V external LDO, voltage
> > > on both VBUS pads is 0V (FYI: this specific hardware design was
> > > validated by NXP hardware engineers).
> > 
> > Then the HW design should be fine.
> > I need find time to try the upstream kernel on my iMX6ULL board to check
> > this.
> 
> My iMX6ULL EVK board cannot reproduce this issue with upstream kernel.
> 
> Could you try to set the bits [7,3] of 0x020c8200(for 2nd USB controller OTG2)
> to be value like 0x1000FC? This may be done at your bootloader(uboot), so
> make sure those targets bits are set before doing your test, or doing this
> with below change(not compiled or tested):
> 
> diff --git a/drivers/usb/phy/phy-mxs-usb.c b/drivers/usb/phy/phy-mxs-usb.c
> index d2836ef5d15c..e390ef534a7c 100644
> --- a/drivers/usb/phy/phy-mxs-usb.c
> +++ b/drivers/usb/phy/phy-mxs-usb.c
> @@ -89,6 +89,9 @@
>  #define ANADIG_USB1_CHRG_DET_STAT_CHRG_DETECTED        BIT(1)
>  #define ANADIG_USB1_CHRG_DET_STAT_PLUG_CONTACT BIT(0)
>  
> +#define ANADIG_USB2_VBUS_DET_SET               0x204
> +#define ANADIG_USB2_VBUS_DET_VBUS_OVERRIDE     GENMASK(7, 3)
> +
>  #define ANADIG_USB2_VBUS_DET_STAT              0x220
>  
>  #define ANADIG_USB1_LOOPBACK_SET               0x1e4
> @@ -288,6 +291,11 @@ static int mxs_phy_hw_init(struct mxs_phy *mxs_phy)
>         if (ret)
>                 goto disable_pll;
>  
> +       if (mxs_phy->regmap_anatop && (mxs_phy->port_id == 1))
> +               regmap_write(mxs_phy->regmap_anatop,
> +                            ANADIG_USB2_VBUS_DET_SET,
> +                            ANADIG_USB2_VBUS_DET_VBUS_OVERRIDE);
> +
>         /* Power up the PHY */
>         writel(0, base + HW_USBPHY_PWD);

Hello,
I tested your patch and it does not work. I therefore tested a slightly
improved version that really ensure the right register value is written.

[    8.408564] port=0 reg=0x200 val=0x1000fc
[    8.440235] port=1 reg=0x204 val=0x1000fc

but it does not work never the less. Unfortunately bits 7-3 are not
documented, so I was not able to do much more.


diff --git a/drivers/usb/phy/phy-mxs-usb.c b/drivers/usb/phy/phy-mxs-usb.c
index d2836ef5d15c..3ff5489d679e 100644
--- a/drivers/usb/phy/phy-mxs-usb.c
+++ b/drivers/usb/phy/phy-mxs-usb.c
@@ -89,6 +89,10 @@
 #define ANADIG_USB1_CHRG_DET_STAT_CHRG_DETECTED        BIT(1)
 #define ANADIG_USB1_CHRG_DET_STAT_PLUG_CONTACT BIT(0)
 
+#define ANADIG_USB1_VBUS_DET_SET               0x200
+#define ANADIG_USB2_VBUS_DET_SET               0x204
+#define ANADIG_USB1_VBUS_DET_VBUS_OVERRIDE     GENMASK(7, 3)
+
 #define ANADIG_USB2_VBUS_DET_STAT              0x220
 
 #define ANADIG_USB1_LOOPBACK_SET               0x1e4
@@ -309,6 +313,7 @@ static int mxs_phy_hw_init(struct mxs_phy *mxs_phy)
                writel(BM_USBPHY_IP_FIX, base + HW_USBPHY_IP_SET);
 
        if (mxs_phy->regmap_anatop) {
+               unsigned int val;
                unsigned int reg = mxs_phy->port_id ?
                        ANADIG_USB1_CHRG_DETECT_SET :
                        ANADIG_USB2_CHRG_DETECT_SET;
@@ -319,6 +324,15 @@ static int mxs_phy_hw_init(struct mxs_phy *mxs_phy)
                regmap_write(mxs_phy->regmap_anatop, reg,
                             ANADIG_USB1_CHRG_DETECT_EN_B |
                             ANADIG_USB1_CHRG_DETECT_CHK_CHRG_B);
+
+               reg = mxs_phy->port_id ?
+                       ANADIG_USB2_VBUS_DET_SET :
+                       ANADIG_USB1_VBUS_DET_SET;
+
+               regmap_set_bits(mxs_phy->regmap_anatop, reg,
+                            ANADIG_USB1_VBUS_DET_VBUS_OVERRIDE);
+               regmap_read(mxs_phy->regmap_anatop, reg, &val);
+               printk("port=%d reg=0x%x val=0x%x\n", mxs_phy->port_id, reg, val);
        }
 
        mxs_phy_tx_init(mxs_phy);



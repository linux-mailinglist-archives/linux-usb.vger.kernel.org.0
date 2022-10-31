Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF475613874
	for <lists+linux-usb@lfdr.de>; Mon, 31 Oct 2022 14:53:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231283AbiJaNx5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 31 Oct 2022 09:53:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231276AbiJaNxy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 31 Oct 2022 09:53:54 -0400
Received: from smtp-out-07.comm2000.it (smtp-out-07.comm2000.it [212.97.32.77])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E873FAD3
        for <linux-usb@vger.kernel.org>; Mon, 31 Oct 2022 06:53:50 -0700 (PDT)
Received: from francesco-nb.int.toradex.com (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: francesco@dolcini.it)
        by smtp-out-07.comm2000.it (Postfix) with ESMTPSA id 8EABE3C2A82;
        Mon, 31 Oct 2022 14:53:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailserver.it;
        s=mailsrv; t=1667224427;
        bh=flMSspQqBml4EnMKNx+0jBT0/KPBShMFxH4Wg6d0+PM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To;
        b=RaVxLZPtc1NfgnNqrUp4k8ifk0P0/9Adv/5A0vkYYPRgG7I/TXS+8amfeZGhgykY2
         BSFojGOfdVkT1hHxdjg20oLMYgytSHZtfvb2hcJeT8zFVz/VN6t+lRm7M2npjSI5Ob
         Q6f9F6IQWss1qfCfXJYb3Q3mETBN/2gHX0PWMYVQDQ9Ize4EFR85zz7dMmnyF0qy7K
         6FQPbYs6hcSp2FxC6ODV0Nh4rqbouJCiz6F2x0h3kne05QbR6hD/VXsXu6kac56K1R
         pN8btMBS5rS0v/85a+y6axyIRJWLJxk2Zd1/ROU69QfkJlNcypyysFqzLZ6pbebe5H
         hET9rLoU0jFBw==
Date:   Mon, 31 Oct 2022 14:53:42 +0100
From:   Francesco Dolcini <francesco@dolcini.it>
To:     "Jun Li (OSS)" <jun.li@oss.nxp.com>
Cc:     Francesco Dolcini <francesco@dolcini.it>,
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
Message-ID: <Y1/TZqsqy/ZRVNqJ@francesco-nb.int.toradex.com>
References: <Y1vLpaxpc5WBCuGD@francesco-nb.int.toradex.com>
 <PA4PR04MB9640E8D3E851800492D8FCAD89379@PA4PR04MB9640.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PA4PR04MB9640E8D3E851800492D8FCAD89379@PA4PR04MB9640.eurprd04.prod.outlook.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello Li Jun,

On Mon, Oct 31, 2022 at 01:40:39PM +0000, Jun Li (OSS) wrote:
> > -----Original Message-----
> > From: Francesco Dolcini <francesco@dolcini.it>
> > Sent: Friday, October 28, 2022 8:32 PM
> > To: Peter Chen <peter.chen@kernel.org>; linux-usb@vger.kernel.org; Jun Li
> > <jun.li@nxp.com>
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>; Shawn Guo
> > <shawnguo@kernel.org>; Sascha Hauer <s.hauer@pengutronix.de>; Pengutronix
> > Kernel Team <kernel@pengutronix.de>; Fabio Estevam <festevam@gmail.com>;
> > dl-linux-imx <linux-imx@nxp.com>; Felipe Balbi <balbi@kernel.org>;
> > philippe.schenker@toradex.com; Francesco Dolcini
> > <francesco.dolcini@toradex.com>
> > Subject: USB runtime PM issues on i.MX6ULL
> > 
> > Hello all,
> > 
> > I am debugging some unexpected USB behavior on a i.MX6ULL SOC,
> > chipidea controller ("fsl,imx6ul-usb") and a fsl mxs usbphy
> > ("fsl,imx6ul-usbphy").
> > 
> > The HW design has 2 USB interface, the first one is dual-role, while the
> > second
> > one is a host port with NO way to re-read the VBUS (USB_OTG2_VBUS is not
> > really connected, there is just a capacitor to GND).
> 
> How is your USB_OTG1_VBUS status? Can you try to make your USB_OTG1_VBUS pad
> has a valid VBUS voltage, then run your Host only port test with runtime PM
> enabled?

USB_OTG1_VBUS is tied to GND the same way as USB_OTG2_VBUS, not really
straightforward to do such a test.

Francesco


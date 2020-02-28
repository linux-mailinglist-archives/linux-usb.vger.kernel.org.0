Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9EAEA17320D
	for <lists+linux-usb@lfdr.de>; Fri, 28 Feb 2020 08:49:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726740AbgB1HtB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 28 Feb 2020 02:49:01 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:41369 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725870AbgB1HtA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 28 Feb 2020 02:49:00 -0500
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1j7aOI-0002VD-9t; Fri, 28 Feb 2020 08:48:58 +0100
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1j7aOG-0001nf-9z; Fri, 28 Feb 2020 08:48:56 +0100
Date:   Fri, 28 Feb 2020 08:48:56 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     "jun.li@freescale.com" <jun.li@freescale.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "stern@rowland.harvard.edu" <stern@rowland.harvard.edu>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 0/3] USB IMX Chipidea fix gpio vbus control
Message-ID: <20200228074856.gomzgtoxwzj4eele@pengutronix.de>
References: <20200227104212.12562-1-m.felsch@pengutronix.de>
 <20200227111838.GA24071@b29397-desktop>
 <20200227113539.gcx3nfwm2fbm3ukv@pengutronix.de>
 <20200227122045.GB24071@b29397-desktop>
 <20200227124406.6kbgu3dbru4qmews@pengutronix.de>
 <VI1PR04MB53270541BB66CAB1EB8F00008BEB0@VI1PR04MB5327.eurprd04.prod.outlook.com>
 <20200227143914.mi3vsltrtyo5sqed@pengutronix.de>
 <20200228025129.GA31815@b29397-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200228025129.GA31815@b29397-desktop>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 08:18:19 up 104 days, 22:36, 122 users,  load average: 0.23, 0.56,
 0.38
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Peter,

On 20-02-28 02:51, Peter Chen wrote:

...

> > > CI_HDRC_TURN_VBUS_EARLY_ON is introduced by fixing a bug that some i.mx USB
> > > controllers PHY's power is sourced from VBUS, the PHY's power need to be on before
> > > touch some ehci registers, otherwise, the USB signal will be wrong at some low speed
> > > devices use case. So, this flag can't be deleted, it may cause regression.
> > 
> > Pls check my archeological findings and again pls check my patches. I
> > deleted the flag because isn't required anymore afterwards.
> 
> I have already checked your patch, your patch deletes CI_HDRC_TURN_VBUS_EARLY_ON
> quirk, and it may cause regression.

Arg, sorry now I see what you mean. Thanks for your explanation :)
Since the 'struct ehci_ci_priv' contains now an enabled state we can
git rid of the flag. To get it right, the writing the ehci PORT_POWER
must be done before or after we enabled the VBUS? I'm asking because
we can drop the 1st patch of this series.

> > > The solution I see is your may need to implement chipidea VBUS control flow by considering
> > > pm_qos_no_power_off at suspend situation. You may add .suspend API for ci_role_driver,
> > > and called by ci_controller_suspend/ci_controller_resume, of cos, better solution is welcome.
> > 
> > I fixed it within the core [1] and here at the chipidea side.
> > 
> > [1] https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flkml.org%2Flkml%2F2020%2F2%2F27%2F669&amp;data=02%7C01%7Cpeter.chen%40nxp.com%7Cad9b3833ae2f433d93ef08d7bb92d4a0%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637184111614326500&amp;sdata=SPwwBEGBco6IdP8ufmAnJeeRxuAXGLa0xzYlzFA%2FAvg%3D&amp;reserved=0
> > 
> > You will never enter the ehci_ci_portpower() during suspend without [1]
> > if you are using a vanilla kernel. So IMHO this case can't be tested,
> > sorry.
> > 
> 
> Through set pm_qos_no_power_off as 0, the VBUS will be off. You
> never need to call .ehci_ci_portpower again. You may try my second
> suggestion for fix chipidea issue. I will reply your RFC patch for
> USB core.

Many thanks for testing =)

Regards,
  Marco

> -- 
> 
> Thanks,
> Peter Chen

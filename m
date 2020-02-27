Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F85517161B
	for <lists+linux-usb@lfdr.de>; Thu, 27 Feb 2020 12:35:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728885AbgB0Lfm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 Feb 2020 06:35:42 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:48871 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728856AbgB0Lfm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 27 Feb 2020 06:35:42 -0500
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1j7HS8-0001mn-Pt; Thu, 27 Feb 2020 12:35:40 +0100
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1j7HS7-0003vJ-Lw; Thu, 27 Feb 2020 12:35:39 +0100
Date:   Thu, 27 Feb 2020 12:35:39 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "jun.li@freescale.com" <jun.li@freescale.com>,
        "stern@rowland.harvard.edu" <stern@rowland.harvard.edu>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 0/3] USB IMX Chipidea fix gpio vbus control
Message-ID: <20200227113539.gcx3nfwm2fbm3ukv@pengutronix.de>
References: <20200227104212.12562-1-m.felsch@pengutronix.de>
 <20200227111838.GA24071@b29397-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200227111838.GA24071@b29397-desktop>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 12:28:58 up 104 days,  2:47, 122 users,  load average: 0.00, 0.01,
 0.00
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

thanks for your fast reply :)

On 20-02-27 11:18, Peter Chen wrote:
> On 20-02-27 11:42:09, Marco Felsch wrote:
> > Hi,
> > 
> > the gpio-based port power is broken since commit [1,2]. I changed the
> > core behaviour to to cleanup the code and avoid local workaround fixes.
> 
> Many i.mx series evk boards work well for gpio-based port power control,
> what problem you have found, would you please list it detail?

Hm.. who could that work? I picked the important parts:

static int ehci_ci_portpower(struct usb_hcd *hcd, int portnum, bool enable)
{
	...

	if (priv->reg_vbus && enable != priv->enabled) {

		...

		if (enable)
			ret = regulator_enable(priv->reg_vbus);
		else
			ret = regulator_disable(priv->reg_vbus);

		...
	}

	...
}

static int host_start(struct ci_hdrc *ci)
{
	...

	priv->reg_vbus = NULL;

	if (ci->platdata->reg_vbus && !ci_otg_is_fsm_mode(ci)) {
		if (ci->platdata->flags & CI_HDRC_TURN_VBUS_EARLY_ON) {
			ret = regulator_enable(ci->platdata->reg_vbus);
			if (ret) {
				dev_err(ci->dev,
				"Failed to enable vbus regulator, ret=%d\n",
									ret);
				goto put_hcd;
			}
		} else {
			priv->reg_vbus = ci->platdata->reg_vbus;
		}
	}

	...
}

Note, I'm using a imx6q which has the CI_HDRC_TURN_VBUS_EARLY_ON set.

Regards,
  Marco

> Peter
> > 
> > With this series and [3] I'am now able to disable the port completely
> > after I disbaled the pm_qos_no_power_off flag.
> > 
> > [1] 6adb9b7b5fb6 ("usb: chipidea: add a flag for turn on vbus early for host")
> > [2] 659459174188 ("usb: chipidea: host: turn on vbus before add hcd if early vbus on is required")
> > [3] https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flkml.org%2Flkml%2F2020%2F2%2F27%2F198&amp;data=02%7C01%7Cpeter.chen%40nxp.com%7Cc1b3094e826b49b572cb08d7bb71b6bc%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637183969379126557&amp;sdata=i7O7vBqiVCb2opVNva7ffxIdqFb%2BvGzV5Qsy5wwarbQ%3D&amp;reserved=0
> > 
> > Regards,
> >   Marco
> > 
> > Marco Felsch (3):
> >   USB: ehci-hub: let port_power() override the ehci_port_power()
> >   Partially Revert "usb: chipidea: host: turn on vbus before add hcd if
> >     early vbus on is required"
> >   Revert "usb: chipidea: add a flag for turn on vbus early for host"
> > 
> >  drivers/usb/chipidea/ci_hdrc_imx.c | 10 ++--------
> >  drivers/usb/chipidea/host.c        | 31 ++++++++++--------------------
> >  drivers/usb/host/ehci-hub.c        |  6 +++---
> >  include/linux/usb/chipidea.h       | 17 ++++++++--------
> >  4 files changed, 23 insertions(+), 41 deletions(-)
> > 
> > -- 
> > 2.20.1
> > 
> 
> -- 
> 
> Thanks,
> Peter Chen
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 87B241712A0
	for <lists+linux-usb@lfdr.de>; Thu, 27 Feb 2020 09:37:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728539AbgB0IhV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 Feb 2020 03:37:21 -0500
Received: from mail1.skidata.com ([91.230.2.99]:26501 "EHLO mail1.skidata.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728525AbgB0IhV (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 27 Feb 2020 03:37:21 -0500
X-Greylist: delayed 429 seconds by postgrey-1.27 at vger.kernel.org; Thu, 27 Feb 2020 03:37:20 EST
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
  t=1582792640; x=1614328640;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=DvBKSOMVkQBbaEkzMCNU9T66titG0U3Zupd2dLbiojw=;
  b=onVIKMgmCOk72E/ChFGJWCm+SN8avS1Ap76vtM2Y8BIsa2/djJ/DF+VX
   RUyRybyr4RJoOrOrEtOanqRN9qOodALi7bVadlZz67BxMkdq7NP8AjZuv
   f4zw7VJ49hzTv3zA6RMXrVM5LUgx3eZuixKL24chtVSFN8TL8/1mi3b4m
   OXQ6JFpaEBDsV4nc88rzbMHr2QowrZB9dA9ig7HfhBGSb01/jtHEwJg5d
   tbz81EwLVmJMrGmhbX0BH40P7T8yoRckWuMUnZC+0V3a/eGupGhayKHg1
   ihdoDJi28lUPxc41tOPPM69lrz9gEc+BouCZ5tNnxLVimldaOfjxNSnd0
   w==;
IronPort-SDR: 5asNblOW+DHpfJUE2l6cUjbP3v50DKyL2GYf8JPwFlqRrISEQp+N8F2NUR/+2HN+4zpzTQ+GjN
 pjcg5V0a87rci7UnZezhy21a2CWrKMCHdooidjHjMOdavNjRS5chk4WfKNFhkTr8qwlHvNBX4y
 HeBWCL22JjY8qEpgpFseff5Qy93YVe2xVhZhCgHiaF7H+Qho6WdWiCxx/T/GZO0inrphhI/WfT
 GQDziA/H1YecxQIlT2igNqRW1Ff3KyZv9QTdweRmIYzIpycPrUQv3C8Td4iFgxkWCxejRNv4Iq
 bw8=
X-IronPort-AV: E=Sophos;i="5.70,491,1574118000"; 
   d="scan'208";a="22909581"
Date:   Thu, 27 Feb 2020 09:30:07 +0100
From:   Richard Leitner <richard.leitner@skidata.com>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
CC:     Marco Felsch <m.felsch@pengutronix.de>,
        <gregkh@linuxfoundation.org>, <linux-usb@vger.kernel.org>,
        <kernel@pengutronix.de>
Subject: Re: [PATCH] usb: usb251xb: check if hub is already attached
Message-ID: <20200227083007.GB13758@pcleri>
References: <20200227072545.16856-1-m.felsch@pengutronix.de>
 <20200227081448.f7ul3idseybln3sc@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200227081448.f7ul3idseybln3sc@pengutronix.de>
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex3srv.skidata.net (192.168.111.81) To
 sdex5srv.skidata.net (192.168.111.83)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Feb 27, 2020 at 09:14:48AM +0100, Uwe Kleine-König wrote:
> On Thu, Feb 27, 2020 at 08:25:45AM +0100, Marco Felsch wrote:
> > It is possible that the hub was configured earlier by the bootloader and
> > we lack of the reset-gpio. In such a case the usb251xb_connect() fails
> > because the registers are write-protected. Add a check to test if the
> > hub is already connected and don't try to reconfigure the hub if we
> > can't toggle the reset pin. Don't change the usb251xb_connect() logic
> > if we can't read the status.
> > 
> > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > ---
> >  drivers/usb/misc/usb251xb.c | 33 +++++++++++++++++++++++++++++++++
> >  1 file changed, 33 insertions(+)
> > 
> > diff --git a/drivers/usb/misc/usb251xb.c b/drivers/usb/misc/usb251xb.c
> > index 29fe5771c21b..9f9a64bab059 100644
> > --- a/drivers/usb/misc/usb251xb.c
> > +++ b/drivers/usb/misc/usb251xb.c
> > @@ -266,6 +266,30 @@ static int usb251x_check_gpio_chip(struct usb251xb *hub)
> >  }
> >  #endif
> >  
> > +static bool usb251xb_hub_attached(struct usb251xb *hub)
> > +{
> > +	char i2c_rb;
> > +	int err;
> > +
> > +	err = i2c_smbus_read_block_data(hub->i2c, USB251XB_ADDR_STATUS_COMMAND,
> > +					&i2c_rb);
> > +	if (err < 0) {
> > +		/*
> > +		 * The device disables the i2c-interface immediately after it
> > +		 * received the USB_ATTACH signal.
> > +		 */
> > +		if (err == -ENXIO)
> > +			return true;
> > +
> > +		dev_warn(hub->dev,
> > +			 "Checking hub Status/Command register failed: %d\n",
> > +			 err);
> > +		return false;
> > +	}
> > +
> > +	return !!(i2c_rb & USB251XB_STATUS_COMMAND_ATTACH);
> > +}
> > +
> >  static void usb251xb_reset(struct usb251xb *hub)
> >  {
> >  	if (!hub->gpio_reset)
> > @@ -288,6 +312,15 @@ static int usb251xb_connect(struct usb251xb *hub)
> >  	struct device *dev = hub->dev;
> >  	int err, i;
> >  	char i2c_wb[USB251XB_I2C_REG_SZ];
> > +	bool is_attached;
> > +
> > +	/*
> > +	 * Check if configuration was done earlier by the bootloader. Trust them
> > +	 * if it is the case and we are not capable to reset the hub.
> > +	 */
> > +	is_attached = usb251xb_hub_attached(hub);
> > +	if (!hub->gpio_reset && is_attached)
> > +		return 0;
> 
> If you write this as:
> 
> 	if (!hub->gpio_reset && usb251xb_hub_attached(hub))
> 		return 0;
> 
> you save some i2c transfers in the presence of a reset gpio.

I'd also go with this solution, so you only have i2c transfers when a
reset gpio is configured/present.

> 
> Also I wonder if skipping the initialisation is at least worth a
> pr_info.

+1 for pr_info.

regards;rl

> 
> Best regards
> Uwe
> 
> -- 
> Pengutronix e.K.                           | Uwe Kleine-König            |
> Industrial Linux Solutions                 | https://www.pengutronix.de/ |

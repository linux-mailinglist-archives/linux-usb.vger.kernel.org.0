Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D902B5F03
	for <lists+linux-usb@lfdr.de>; Wed, 18 Sep 2019 10:21:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727443AbfIRIVw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 18 Sep 2019 04:21:52 -0400
Received: from mail1.skidata.com ([91.230.2.99]:11724 "EHLO mail1.skidata.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726131AbfIRIVw (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 18 Sep 2019 04:21:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
  t=1568794911; x=1600330911;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=JYYKb4Og8/LgmZTeUewdUokg/KSASFzdq7s/jlHBVzo=;
  b=Wcs6tEqYJ99w6nl8f5w0tIip/ShPdDjxCQ/6T84aJ2PDtligwqEa6c3F
   j0uqCBBETSdoHuDqCHrqJyb4apPAJaYYdE7E0rntQHz0ifSsjxhKM+KWx
   kEhj6AkWNK7hX8/ujg+Nfdc1rPeJcRun9SwoIQDnW79kP8zihZtjOq9pV
   ggTIrV4B1DFks4G4/ltKx5MQRgQ83/DVt66b9Y10ug4L6ciDZs6hWwW0G
   pRjWZBidgl68qEHQk6hAXPyFQFsdLqQNL51yRAmlElXwSCKIkqxgU8alG
   RyTw6AWyLMS4fuzmWAXJJtch4aV++LtxIoeIrcDvy7yctIjkIwjwV8spe
   Q==;
IronPort-SDR: zzVPZwHkK+FnvOfx6lAfkfQFe094QYDi+yAHndt9+uXdUbHxqEv/NWle8QKdTnKvwU9+XiFtiJ
 WUmLQF8EkR2AWKvPQD13iG0DVi3Nz8T5e/7ve95+THDjGCr24/IP2SAj7njzg2uqNmhdHNaWmS
 mt4GaO2AID+3KD6fSN3oaTvmuiYCl13pkeEEwfXJha+SdTXTymEajLpurIyHeeyGGfIE3vxuEF
 Q1ueo1Q1/cyMHWP/3PQGBTtHMHZlOPoPaYKNjwcPAgptFw3RVgvkqs2LaTgaVVHw+spfyfW7bj
 RpM=
X-IronPort-AV: E=Sophos;i="5.64,520,1559512800"; 
   d="scan'208";a="19688650"
Subject: Re: [PATCH 2/4] usb: usb251xb: add vdd supply support
To:     Marco Felsch <m.felsch@pengutronix.de>, <robh+dt@kernel.org>,
        <fancer.lancer@gmail.com>
CC:     <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <kernel@pengutronix.de>
References: <20190917144449.32739-1-m.felsch@pengutronix.de>
 <20190917144449.32739-3-m.felsch@pengutronix.de>
From:   Richard Leitner <richard.leitner@skidata.com>
Message-ID: <31006213-bd7e-b8f6-de23-24afc63ebf7c@skidata.com>
Date:   Wed, 18 Sep 2019 10:14:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190917144449.32739-3-m.felsch@pengutronix.de>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex3srv.skidata.net (192.168.111.81) To
 sdex5srv.skidata.net (192.168.111.83)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 17/09/2019 16:44, Marco Felsch wrote:
> Currently we don't handle the supply. We need to add the supply support
> to be able to switch the supply off e.g. during a suspend-to-ram
> operation. So we can guarantee a correct (re-)initialization.
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>

Hi,
tested it on a i.MX6 based platform with an usb2512.
Therefore please feel free to add:

Reviewed-by: Richard Leitner <richard.leitner@skidata.com>

and/or

Tested-by: Richard Leitner <richard.leitner@skidata.com>

regards;Richard.L

> ---
>   drivers/usb/misc/usb251xb.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/usb/misc/usb251xb.c b/drivers/usb/misc/usb251xb.c
> index 6ca9111d150a..05819167604d 100644
> --- a/drivers/usb/misc/usb251xb.c
> +++ b/drivers/usb/misc/usb251xb.c
> @@ -17,6 +17,7 @@
>   #include <linux/module.h>
>   #include <linux/nls.h>
>   #include <linux/of_device.h>
> +#include <linux/regulator/consumer.h>
>   #include <linux/slab.h>
>   
>   /* Internal Register Set Addresses & Default Values acc. to DS00001692C */
> @@ -116,6 +117,7 @@
>   struct usb251xb {
>   	struct device *dev;
>   	struct i2c_client *i2c;
> +	struct regulator *vdd;
>   	u8 skip_config;
>   	struct gpio_desc *gpio_reset;
>   	u16 vendor_id;
> @@ -420,6 +422,10 @@ static int usb251xb_get_ofdata(struct usb251xb *hub,
>   		return err;
>   	}
>   
> +	hub->vdd = devm_regulator_get(dev, "vdd");
> +	if (IS_ERR(hub->vdd))
> +		return PTR_ERR(hub->vdd);
> +
>   	if (of_property_read_u16_array(np, "vendor-id", &hub->vendor_id, 1))
>   		hub->vendor_id = USB251XB_DEF_VENDOR_ID;
>   
> @@ -665,6 +671,10 @@ static int usb251xb_probe(struct usb251xb *hub)
>   	if (err)
>   		return err;
>   
> +	err = regulator_enable(hub->vdd);
> +	if (err)
> +		return err;
> +
>   	err = usb251xb_connect(hub);
>   	if (err) {
>   		dev_err(dev, "Failed to connect hub (%d)\n", err);
> 

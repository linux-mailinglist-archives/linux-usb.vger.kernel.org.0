Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D01E6B5F05
	for <lists+linux-usb@lfdr.de>; Wed, 18 Sep 2019 10:22:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730129AbfIRIWD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 18 Sep 2019 04:22:03 -0400
Received: from mail2.skidata.com ([91.230.2.91]:2187 "EHLO mail2.skidata.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726131AbfIRIWD (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 18 Sep 2019 04:22:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
  t=1568794922; x=1600330922;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=ItTQ634pOZkTmlAo3FaDr7g0AAqS3F7gyf8qNzFJzX4=;
  b=BI644oAeMLqX0pi7GXjxvdWDm0kGnR9if9UABVGW4CcO0NqsiYWoRai0
   706yQwSSGH3PiX2xRjUMVzlOf3JHqNQzt4aZbpbQkbaiN0Xlj/XiAdwe/
   jHRWoWDDamauwVQ0+CkbsAOMfmtx2eijQg927S0db++l2/wAvoOSpDgBN
   Bf5C5qOW5284+SvovPYWP58DVBCuvBZ9pGBoOHH3c8ZSneulh8qgI3RdZ
   nORkAJNA2CgfsOwckGHYWC6uHtdVeS3sbuD4fcMU/HP+iF3vYKBfesuNr
   4rdRnraQhlUOl2tRq2qUbvEsmBRUrcXYimV07qkReUBMcMmRFXyXpgrxS
   w==;
IronPort-SDR: RcaiKXnQs/s3HpXWyWKyNAiKLCaBqgBLWX1ME4I4JP9f9Tj1EU3J5KNmhK98EHn/2lb8U+4zy8
 10YbvVpeKBWyKhzjm6ru+VSTP+ZSiwYPzuM29srmlGwagjkc9mSVE8hQeAdfL2DRm6OutIHvaq
 eZ6yjkIWsMzOv0FCBd6yb4R96KmQG7SoT68NBaJqqkMt/KGP3NDQeyAhdYpTlqHHOMFuxBd2Bf
 tQoJitEFLVLHzt8jdkIRVoMVHX2I/VFfiFc9YebvaPaNNEZaaYVH6yl38bm7kkX1AZubfsxQUE
 5tg=
X-IronPort-AV: E=Sophos;i="5.64,520,1559512800"; 
   d="scan'208";a="2338235"
Subject: Re: [PATCH 3/4] usb: usb251xb: simplify reset helper
To:     Marco Felsch <m.felsch@pengutronix.de>, <robh+dt@kernel.org>,
        <fancer.lancer@gmail.com>
CC:     <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <kernel@pengutronix.de>
References: <20190917144449.32739-1-m.felsch@pengutronix.de>
 <20190917144449.32739-4-m.felsch@pengutronix.de>
From:   Richard Leitner <richard.leitner@skidata.com>
Message-ID: <61b35bdc-8eaa-e019-7754-316af9d360cb@skidata.com>
Date:   Wed, 18 Sep 2019 10:14:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190917144449.32739-4-m.felsch@pengutronix.de>
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
> Currently the reset handler was always called to deassert the reset
> line because assert the line was done during probe. Now if we want to
> support pm by turn of the supply we need to call this routine twice and
> the i2c_lock_bus is done twice too. To simplify that we can drop the
> state and just do a reset in one go. So a future pm operation don't need
> to lock the i2c bus twice.
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
>   drivers/usb/misc/usb251xb.c | 15 +++++++--------
>   1 file changed, 7 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/usb/misc/usb251xb.c b/drivers/usb/misc/usb251xb.c
> index 05819167604d..bc031d33f433 100644
> --- a/drivers/usb/misc/usb251xb.c
> +++ b/drivers/usb/misc/usb251xb.c
> @@ -263,20 +263,19 @@ static int usb251x_check_gpio_chip(struct usb251xb *hub)
>   }
>   #endif
>   
> -static void usb251xb_reset(struct usb251xb *hub, int state)
> +static void usb251xb_reset(struct usb251xb *hub)
>   {
>   	if (!hub->gpio_reset)
>   		return;
>   
>   	i2c_lock_bus(hub->i2c->adapter, I2C_LOCK_SEGMENT);
>   
> -	gpiod_set_value_cansleep(hub->gpio_reset, state);
> +	gpiod_set_value_cansleep(hub->gpio_reset, 1);
> +	usleep_range(1, 10);	/* >=1us RESET_N asserted */
> +	gpiod_set_value_cansleep(hub->gpio_reset, 0);
>   
>   	/* wait for hub recovery/stabilization */
> -	if (!state)
> -		usleep_range(500, 750);	/* >=500us at power on */
> -	else
> -		usleep_range(1, 10);	/* >=1us at power down */
> +	usleep_range(500, 750);	/* >=500us after RESET_N deasserted */
>   
>   	i2c_unlock_bus(hub->i2c->adapter, I2C_LOCK_SEGMENT);
>   }
> @@ -294,7 +293,7 @@ static int usb251xb_connect(struct usb251xb *hub)
>   		i2c_wb[0] = 0x01;
>   		i2c_wb[1] = USB251XB_STATUS_COMMAND_ATTACH;
>   
> -		usb251xb_reset(hub, 0);
> +		usb251xb_reset(hub);
>   
>   		err = i2c_smbus_write_i2c_block_data(hub->i2c,
>   				USB251XB_ADDR_STATUS_COMMAND, 2, i2c_wb);
> @@ -344,7 +343,7 @@ static int usb251xb_connect(struct usb251xb *hub)
>   	i2c_wb[USB251XB_ADDR_PORT_MAP_7]        = hub->port_map7;
>   	i2c_wb[USB251XB_ADDR_STATUS_COMMAND] = USB251XB_STATUS_COMMAND_ATTACH;
>   
> -	usb251xb_reset(hub, 0);
> +	usb251xb_reset(hub);
>   
>   	/* write registers */
>   	for (i = 0; i < (USB251XB_I2C_REG_SZ / USB251XB_I2C_WRITE_SZ); i++) {
> 

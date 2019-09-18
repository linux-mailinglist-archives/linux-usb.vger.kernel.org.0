Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23D56B5F09
	for <lists+linux-usb@lfdr.de>; Wed, 18 Sep 2019 10:22:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730146AbfIRIWT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 18 Sep 2019 04:22:19 -0400
Received: from mail1.skidata.com ([91.230.2.99]:11745 "EHLO mail1.skidata.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726131AbfIRIWT (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 18 Sep 2019 04:22:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
  t=1568794938; x=1600330938;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=rswJ5WxDWZwddCdcSLNEq+OSvFSxpWf7w+XpjK4JuP4=;
  b=r4iWWtoToecOwOxCGCcDP1K9YIQRuvZhS/1F2ZGp8Gqklb1rFuvPZToP
   Z2y/fZTIpVRWtFV/JuGiYadxVfw0aD2DGusMYwILxVVQYX14nHWvhWV7s
   Fk7zU1n1NsJc/uM0UbhRK2ZuwLb8yn0NPUGQuFAUXuF6RO3cjGjU+h8pu
   QsKRBI4vUezRxeIe0RhdZx5D6pjtm7C3kJQYfYKvN3gUtzGqjXQVsA87/
   48Clf+yK23UygkA2DLpZTA/CaM7EV3mSQIHlKMCU4UeHnYb6Wbb1jCcp6
   h4csYSIEyxMLhDxirrbH6ZIGixP5UPVgiIBDF4g+upbL4wU9+yR2QofpE
   g==;
IronPort-SDR: UPLjlh1T4Li46m59Iv45TvSNAbi4yti9noUKNniIwinTbMOfJlS9RJed6NPIdlN2ULQ4STOYyV
 R334N0USt57rg22/xj+9imazVpLCUEFiajlQ63z5spe0N5uSrCMGuACnRIWHNkDt+qMBPbyxlO
 LiOwYU5EZxDaG/w8GZr6QKsuaUyXe/kAWjUXil/W1+5wsve3XLnyDTiWM+gQ6SPeDjoW7hPSNh
 Eejz9axjfGQCUX42BgGnu/BrB5YnUhO9e6QE5r2tnxErV5Qw3DHHSRh6L+VboqcRpgGVkyI1TE
 +3s=
X-IronPort-AV: E=Sophos;i="5.64,520,1559512800"; 
   d="scan'208";a="19688656"
Subject: Re: [PATCH 4/4] usb: usb251xb: add pm_ops
To:     Marco Felsch <m.felsch@pengutronix.de>, <robh+dt@kernel.org>,
        <fancer.lancer@gmail.com>
CC:     <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <kernel@pengutronix.de>
References: <20190917144449.32739-1-m.felsch@pengutronix.de>
 <20190917144449.32739-5-m.felsch@pengutronix.de>
From:   Richard Leitner <richard.leitner@skidata.com>
Message-ID: <2c720a64-5ca6-5f5c-1b7e-ea2d63f83bd0@skidata.com>
Date:   Wed, 18 Sep 2019 10:15:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190917144449.32739-5-m.felsch@pengutronix.de>
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
> Currently the driver don't support pm_ops. These ops are not necessary
> if the supply isn't switchable (always on). This assumptions seems to be
> wrong because no one needs a powered hub during suspend-to-ram/disk.
> 
> So adding simple_dev_pm_ops to be able to switch off the hub during
> suspend and to restore the config after a resume operation.
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>

Hi,
please feel free to add:

Acked-by: Richard Leitner <richard.leitner@skidata.com>

regards;Richard.L

> ---
>   drivers/usb/misc/usb251xb.c | 24 ++++++++++++++++++++++++
>   1 file changed, 24 insertions(+)
> 
> diff --git a/drivers/usb/misc/usb251xb.c b/drivers/usb/misc/usb251xb.c
> index bc031d33f433..5bba19937da1 100644
> --- a/drivers/usb/misc/usb251xb.c
> +++ b/drivers/usb/misc/usb251xb.c
> @@ -701,6 +701,29 @@ static int usb251xb_i2c_probe(struct i2c_client *i2c,
>   	return usb251xb_probe(hub);
>   }
>   
> +static int __maybe_unused usb251xb_suspend(struct device *dev)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +	struct usb251xb *hub = i2c_get_clientdata(client);
> +
> +	return regulator_disable(hub->vdd);
> +}
> +
> +static int __maybe_unused usb251xb_resume(struct device *dev)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +	struct usb251xb *hub = i2c_get_clientdata(client);
> +	int err;
> +
> +	err = regulator_enable(hub->vdd);
> +	if (err)
> +		return err;
> +
> +	return usb251xb_connect(hub);
> +}
> +
> +static SIMPLE_DEV_PM_OPS(usb251xb_pm_ops, usb251xb_suspend, usb251xb_resume);
> +
>   static const struct i2c_device_id usb251xb_id[] = {
>   	{ "usb2512b", 0 },
>   	{ "usb2512bi", 0 },
> @@ -718,6 +741,7 @@ static struct i2c_driver usb251xb_i2c_driver = {
>   	.driver = {
>   		.name = DRIVER_NAME,
>   		.of_match_table = of_match_ptr(usb251xb_of_match),
> +		.pm = &usb251xb_pm_ops,
>   	},
>   	.probe    = usb251xb_i2c_probe,
>   	.id_table = usb251xb_id,
> 

Return-Path: <linux-usb+bounces-10989-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DD0038FF493
	for <lists+linux-usb@lfdr.de>; Thu,  6 Jun 2024 20:24:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BC3C61C23A4D
	for <lists+linux-usb@lfdr.de>; Thu,  6 Jun 2024 18:24:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59D8419939E;
	Thu,  6 Jun 2024 18:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="EEsprxD1"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 573DD19938C
	for <linux-usb@vger.kernel.org>; Thu,  6 Jun 2024 18:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717698246; cv=none; b=Nv8fweBByo+p8vnWGULP52FhZfym2e9PEk3F6lDA0NK8dJNBpvpk95ghLi2rhFVAqzw+uaKGsSNaAyazaTZguTIZOkxWq53e2Db7UQq2qSdBGLeySrt35LlN6vp8W/C4eaT4681DSs2HwHoDknp6nKSL1wPFrM3x0v7QuS22n3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717698246; c=relaxed/simple;
	bh=GkWa7BIPh4/KmbJyOT/Mk5hzWzWa5IQyYQXoThRbpnk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OCyzoK7M+gp+8/WEIUJytVANs/+UbTdrjxF4ze7h69AQNY80cqtGBXIuIMA0ErddgU2MdvOCWy+OSreM7PDfqc2iIHpneeWb5ThcROvZS4y0IydliWXx1mRksBsEZqSwv62CrX9AjPhLaOHTHc2INTtnlOJMNb0FqjrPnJNXxVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=EEsprxD1; arc=none smtp.client-ip=209.85.166.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-374a7d73669so5297745ab.2
        for <linux-usb@vger.kernel.org>; Thu, 06 Jun 2024 11:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717698244; x=1718303044; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Gl+OqhWGBvRrXejeIiWyBxaA/z/+TnOK8uadnUzKZxU=;
        b=EEsprxD1SbSPBe0cxtYH/7sTBKSfsrej5TCeM5l2QQGH0/BvAISGrk9+6PcfcYButW
         9bIsAuWR75+ZGQOGie7B/hwDIitSFaH7E8CQSipn38b67E5UuDGNdLqbWP0LgkYjaByR
         29D41PbWncfwXf+l114QGwPGg1/BknlslZwJw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717698244; x=1718303044;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gl+OqhWGBvRrXejeIiWyBxaA/z/+TnOK8uadnUzKZxU=;
        b=LUrJjrPlGzBCL9YkzI1Dh9aBj6TdRsXCkAd3qtXY10FvPD2oj8ixhzdX0OYLquyc88
         A3eYVSKRbnXa9VDQMsRGQRC6RSls8qoVft5/vw9GDGEiZUutdeTRPznUmnh+5jeE94wH
         XQvTxkpsjX9U+gze7uyV3o6qKqI2Cbf6Wd8tEIWrPBm5Jhu99p2Q6S+QarhGYXoiksjy
         IXHzLugXEGm7qBSfPchSUVJFm0U6RQDhZIdpiKiyBgqKVXaPIhts5yHItHyUgpU7rgAa
         xGVnZxi8KfmQXKcF2IE+VjTN50aymnFS7Lg+tQMjKQX36a5Ue7GfqKQz347HL/57+bhv
         P/dA==
X-Forwarded-Encrypted: i=1; AJvYcCVeEb2lvv1Cm+Z6b7GD3OESM3T+O491q96iiIpADD3XFltOM+7kwAxRyBTdAMeZ8rfIbzbg/hP/rrDPyABjL98sAOP8fO2zaFEb
X-Gm-Message-State: AOJu0YyqApwBtqLjnFaye21iiRUNjP2QdA2oRe7QENUTSZjoXuSeI8IW
	YmjCTaL31qhlX56TZLWfUfmUbRc1tM0WNFs3TKpSH5Ozk6YNkIN/uZI/A8dpRA==
X-Google-Smtp-Source: AGHT+IFJPZFXI4+pEL8XTW85t1QN+HSWQIYmTgmWjR8yPBouYuGxl/ji+dUgM0GRTYwa/tPXlAUkYg==
X-Received: by 2002:a05:6e02:1d1e:b0:374:91a6:7bc9 with SMTP id e9e14a558f8ab-375803a748bmr5902575ab.30.1717698243975;
        Thu, 06 Jun 2024 11:24:03 -0700 (PDT)
Received: from localhost (113.176.132.34.bc.googleusercontent.com. [34.132.176.113])
        by smtp.gmail.com with UTF8SMTPSA id e9e14a558f8ab-374bc1c82fesm3948695ab.84.2024.06.06.11.24.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jun 2024 11:24:03 -0700 (PDT)
Date: Thu, 6 Jun 2024 18:24:02 +0000
From: Matthias Kaehlcke <mka@chromium.org>
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Cc: gregkh@linuxfoundation.org, javier.carrasco@wolfvision.net,
	benjamin.bara@skidata.com, m.felsch@pengutronix.de,
	jbrunet@baylibre.com, frieder.schrempf@kontron.de,
	stefan.eichenberger@toradex.com, michal.simek@amd.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	git@amd.com
Subject: Re: [PATCH] usb: misc: add Microchip usb5744 SMBus programming
 support
Message-ID: <ZmH-wuS8TUxpm6h-@google.com>
References: <1717676883-2876611-1-git-send-email-radhey.shyam.pandey@amd.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1717676883-2876611-1-git-send-email-radhey.shyam.pandey@amd.com>

On Thu, Jun 06, 2024 at 05:58:03PM +0530, Radhey Shyam Pandey wrote:

> PATCH] usb: misc: add Microchip usb5744 SMBus programming support

usb: misc: onboard_usb_dev: ...

>
> usb5744 supports SMBus Configuration and it may be configured via the
> SMBus slave interface during the hub’s start-up configuration stage.
> 
> To program it introduce i2c initialization hook and set usb5744 platform
> data with function having required smbus initialization sequence. Core
> driver uses i2c-bus phandle (added in commit '02be19e914b8 dt-bindings:
> usb: Add support for Microchip usb5744 hub controller') to get i2c client
> device and then calls usb5744 i2c default initialization sequence.
> 
> Apart from the USB command attach, prevent the hub from suspend.
> when the “USB Attach with SMBus (0xAA56)” command is issued to the hub,
> the hub is getting enumerated and then it puts in a suspend mode.
> This causes the hub to NAK any SMBus access made by the SMBus Master
> during this period and not able to see the hub's slave address while
> running the "i2c probe" command.
> 
> Prevent the MCU from the putting the HUB in suspend mode through
> register write. The BYPASS_UDC_SUSPEND bit (Bit 3) of the RuntimeFlags2
> register at address 0x411D controls this aspect of the hub. The
> BYPASS_UDC_SUSPEND bit in register 0x411Dh must be set to ensure that the
> MCU is always enabled and ready to respond to SMBus runtime commands.
> This register needs to be written before the USB attach command is issued.
> 
> The byte sequence is as follows:
> Slave addr: 0x2d           00 00 05 00 01 41 1D 08
> Slave addr: 0x2d           99 37 00
> Slave addr: 0x2d           AA 56 00
> 
> In addition to SMBus programming sequence also update post reset
> delay as without it there is a failure on first SMBus write.
> i2c 2-002d: error -ENXIO: BYPASS_UDC_SUSPEND bit configuration failed
> 
> Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
> ---
> ---
>  drivers/usb/misc/onboard_usb_dev.c | 46 ++++++++++++++++++++++++++++++
>  drivers/usb/misc/onboard_usb_dev.h |  8 +++++-
>  2 files changed, 53 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/misc/onboard_usb_dev.c b/drivers/usb/misc/onboard_usb_dev.c
> index f2bcc1a8b95f..5621c1273a12 100644
> --- a/drivers/usb/misc/onboard_usb_dev.c
> +++ b/drivers/usb/misc/onboard_usb_dev.c
> @@ -98,6 +98,7 @@ static int onboard_dev_power_on(struct onboard_dev *onboard_dev)
>  
>  	fsleep(onboard_dev->pdata->reset_us);
>  	gpiod_set_value_cansleep(onboard_dev->reset_gpio, 0);
> +	fsleep(onboard_dev->pdata->reset_us);

This also impacts devices that don't require a delay, plus requirements for
this delay are not necessarily the same as the reset delay.

Better add a dedicated field like 'power_on_delay_us'.

>  
>  	onboard_dev->is_powered_on = true;
>  
> @@ -296,10 +297,34 @@ static void onboard_dev_attach_usb_driver(struct work_struct *work)
>  		pr_err("Failed to attach USB driver: %pe\n", ERR_PTR(err));
>  }
>  
> +int onboard_dev_5744_i2c_init(struct i2c_client *client)

static int

We probably want to move hardware specific code to a dedicated file
as there is added more, but I for now it's ok to have it in the main
driver.

> +{
> +	struct device *dev = &client->dev;
> +	int ret;
> +
> +	char wr_buf[7] = {0x00, 0x05, 0x00, 0x01, 0x41, 0x1D, 0x08};

Please use constants for the different bits instead of magic values. I know
the magic values are explained in the commit message, but that's something
people have to dig up.

> +
> +	ret = i2c_smbus_write_block_data(client, 0, sizeof(wr_buf), wr_buf);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "BYPASS_UDC_SUSPEND bit configuration failed\n");
> +
> +	ret = i2c_smbus_write_word_data(client, 0x99, htons(0x3700));

ditto, no magic values please

> +	if (ret)
> +		return dev_err_probe(dev, ret, "Configuration Register Access Command failed\n");
> +
> +	/* Send SMBus command to boot hub. */
> +	ret = i2c_smbus_write_word_data(client, 0xAA, htons(0x5600));

ditto

> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "USB Attach with SMBus command failed\n");
> +
> +	return ret;

  	return 0;
> +}
> +
>  static int onboard_dev_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
>  	struct onboard_dev *onboard_dev;
> +	struct device_node *i2c_node;
>  	int err;
>  
>  	onboard_dev = devm_kzalloc(dev, sizeof(*onboard_dev), GFP_KERNEL);
> @@ -339,6 +364,23 @@ static int onboard_dev_probe(struct platform_device *pdev)
>  	if (err)
>  		return err;
>  
> +	i2c_node = of_parse_phandle(pdev->dev.of_node, "i2c-bus", 0);
> +	if (i2c_node) {
> +		struct i2c_client *client;
> +
> +		client = of_find_i2c_device_by_node(i2c_node);
> +		of_node_put(i2c_node);
> +
> +		if (!client) {
> +			err = -EPROBE_DEFER;
> +			goto err_dev_power_off;

nit: err_power_off

> +		}
> +		err = onboard_dev->pdata->onboard_dev_i2c_init(client);
> +		put_device(&client->dev);
> +		if (err < 0)
> +			goto err_dev_power_off;
> +	}
> +
>  	/*
>  	 * The USB driver might have been detached from the USB devices by
>  	 * onboard_dev_remove() (e.g. through an 'unbind' by userspace),
> @@ -350,6 +392,10 @@ static int onboard_dev_probe(struct platform_device *pdev)
>  	schedule_work(&attach_usb_driver_work);
>  
>  	return 0;
> +
> +err_dev_power_off:
> +	onboard_dev_power_off(onboard_dev);
> +	return err;
>  }
>  
>  static void onboard_dev_remove(struct platform_device *pdev)
> diff --git a/drivers/usb/misc/onboard_usb_dev.h b/drivers/usb/misc/onboard_usb_dev.h
> index fbba549c0f47..17311ea7bacd 100644
> --- a/drivers/usb/misc/onboard_usb_dev.h
> +++ b/drivers/usb/misc/onboard_usb_dev.h
> @@ -6,6 +6,8 @@
>  #ifndef _USB_MISC_ONBOARD_USB_DEV_H
>  #define _USB_MISC_ONBOARD_USB_DEV_H
>  
> +#include <linux/i2c.h>
> +
>  #define MAX_SUPPLIES 2
>  
>  struct onboard_dev_pdata {
> @@ -13,6 +15,7 @@ struct onboard_dev_pdata {
>  	unsigned int num_supplies;	/* number of supplies */
>  	const char * const supply_names[MAX_SUPPLIES];
>  	bool is_hub;
> +	int (*onboard_dev_i2c_init)(struct i2c_client *client);
>  };
>  
>  static const struct onboard_dev_pdata microchip_usb424_data = {
> @@ -22,11 +25,14 @@ static const struct onboard_dev_pdata microchip_usb424_data = {
>  	.is_hub = true,
>  };
>  
> +int onboard_dev_5744_i2c_init(struct i2c_client *client);
> +
>  static const struct onboard_dev_pdata microchip_usb5744_data = {
> -	.reset_us = 0,
> +	.reset_us = 10000,

That's one reason why I don't think it's a good idea to use 'reset_us'
twice. In this case the total delay would go from formerly 0ms to 20ms,
when a delay of 10ms after the reset should be sufficient.

>  	.num_supplies = 2,
>  	.supply_names = { "vdd", "vdd2" },
>  	.is_hub = true,
> +	.onboard_dev_i2c_init = onboard_dev_5744_i2c_init,
>  };
>  
>  static const struct onboard_dev_pdata realtek_rts5411_data = {
> -- 
> 2.34.1
> 


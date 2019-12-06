Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE693114CFB
	for <lists+linux-usb@lfdr.de>; Fri,  6 Dec 2019 08:55:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726814AbfLFHzH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 6 Dec 2019 02:55:07 -0500
Received: from mailout1.w1.samsung.com ([210.118.77.11]:44503 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726184AbfLFHzG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 6 Dec 2019 02:55:06 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20191206075504euoutp01f6d53f2190560fe346b976a11cf75acd~duQvFJaq63212632126euoutp01U
        for <linux-usb@vger.kernel.org>; Fri,  6 Dec 2019 07:55:04 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20191206075504euoutp01f6d53f2190560fe346b976a11cf75acd~duQvFJaq63212632126euoutp01U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1575618904;
        bh=9QeQRI3Ys7bYqQv0c7q7Znm6LnBMaemN7e5/D4Yhu8M=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=Qe7VqjjJ8DfzV8CGMkhNYF933gyLFS8Xzq/Yr1cGDd5AdbGiZOXsg5B70apIkF8h8
         vOkxW9JvQRYuxpg84K3LfzMRQFmwDf6URRTo4xWHyWJ3dDssWk2zvt5LmlC/y34ocW
         njZZs8XzqE5ZcPvGWVcXTvSBr6NfkSOIhyLyKHNY=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20191206075504eucas1p29fcfed8743dbd1e47063f2b4656ece50~duQuzQX4g2615726157eucas1p2_;
        Fri,  6 Dec 2019 07:55:04 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 6D.E9.60698.8590AED5; Fri,  6
        Dec 2019 07:55:04 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20191206075504eucas1p2a20f41f038106d29246983ffeb079215~duQuZUmgp2007220072eucas1p2j;
        Fri,  6 Dec 2019 07:55:04 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20191206075504eusmtrp10570434ae53b88e46618846419cf76f1~duQuYbEVu1934119341eusmtrp1M;
        Fri,  6 Dec 2019 07:55:04 +0000 (GMT)
X-AuditID: cbfec7f5-e577d9c00001ed1a-a4-5dea0958f3a0
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 44.03.08375.8590AED5; Fri,  6
        Dec 2019 07:55:04 +0000 (GMT)
Received: from [106.120.51.15] (unknown [106.120.51.15]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20191206075503eusmtip10b9ab83eec8adf90ae67e1579b680256~duQuC2rmZ1297212972eusmtip10;
        Fri,  6 Dec 2019 07:55:03 +0000 (GMT)
Subject: Re: [PATCH] usb: usb3503: Convert to use GPIO descriptors
To:     Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Stefan Agner <stefan@agner.ch>,
        Krzysztof Kozlowski <krzk@kernel.org>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <39902b1d-656c-2dc9-34bc-3bfe715db22f@samsung.com>
Date:   Fri, 6 Dec 2019 08:55:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
        Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191205145633.187511-1-linus.walleij@linaro.org>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrFKsWRmVeSWpSXmKPExsWy7djP87oRnK9iDXb+lrNo3zeXxaJ58Xo2
        i/PnN7BbTPmznMli0bJWZovN69rZHdg8Fn+/x+yxaVUnm8eda3vYPPbPXcPu0XJyP4vH501y
        AWxRXDYpqTmZZalF+nYJXBmP32xgLrhrUrHg5BSWBsZHml2MnBwSAiYSv6b/Y+xi5OIQEljB
        KDH5Rw+U84VRYtPfTywQzmdGiY2nz7LCtLxee4YJxBYSWM4oMfGVM0TRW0aJ2a/XsYEkhAWc
        JD7MnsMCYosIxEtsv3yLHcRmFpjAKHHwSTGIzSZgKNH1tgusnlfATuL7jFPMIDaLgIrEm4WP
        gZZxcIgKxEp0LM+AKBGUODnzCdhITgF7iS8/mlkhRspLbH87hxnCFpe49WQ+E8g9EgLb2CXm
        3TjCBHG0i8Sj3n3MELawxKvjW9ghbBmJ05N7WCAamhklHp5byw7h9DBKXG6awQhRZS1x+PhF
        sIuYBTQl1u/Shwg7Skzrvc8IEpYQ4JO48VYQ4gg+iUnbpjNDhHklOtqEIKrVJGYdXwe39uCF
        S8wTGJVmIXltFpJ3ZiF5ZxbC3gWMLKsYxVNLi3PTU4uN81LL9YoTc4tL89L1kvNzNzECU9Dp
        f8e/7mDc9yfpEKMAB6MSD++Mzy9ihVgTy4orcw8xSnAwK4nwpvO9jBXiTUmsrEotyo8vKs1J
        LT7EKM3BoiTOa7wIKCWQnliSmp2aWpBaBJNl4uCUamBk+bsulS8q9vvU7KS9XbzxBuGbrsxX
        3vWHMajjv0Eho+9Rv49z+i2O1nJKL1FYdryotqOt/rGcfu8TzxUpGh8m/z7w3j1Jo1RgUvfr
        2Ao/l5vv9odEnPit0a867Z/ny8PFqjLBOyYtWvVR9MONE8xfjszedlb0Mv/2mRbc776+DTv9
        MYYtWuiaEktxRqKhFnNRcSIAaMkehz0DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrPIsWRmVeSWpSXmKPExsVy+t/xu7oRnK9iDX7PZ7Vo3zeXxaJ58Xo2
        i/PnN7BbTPmznMli0bJWZovN69rZHdg8Fn+/x+yxaVUnm8eda3vYPPbPXcPu0XJyP4vH501y
        AWxRejZF+aUlqQoZ+cUltkrRhhZGeoaWFnpGJpZ6hsbmsVZGpkr6djYpqTmZZalF+nYJehmP
        32xgLrhrUrHg5BSWBsZHml2MnBwSAiYSr9eeYepi5OIQEljKKNH2aBIzREJG4uS0BlYIW1ji
        z7UuNoii14wSP2ZtZAJJCAs4SXyYPYcFxBYRiJfYfryJBaSIWWACo0RncxcLRMckRokjzycy
        glSxCRhKdL0FGcXJwStgJ/F9ximwdSwCKhJvFj4GWycqECvxfeUnRogaQYmTM5+AbeAUsJf4
        8qMZrIZZwExi3uaHzBC2vMT2t3OgbHGJW0/mM01gFJqFpH0WkpZZSFpmIWlZwMiyilEktbQ4
        Nz232FCvODG3uDQvXS85P3cTIzDyth37uXkH46WNwYcYBTgYlXh4Z3x+ESvEmlhWXJl7iFGC
        g1lJhDed72WsEG9KYmVValF+fFFpTmrxIUZToOcmMkuJJucDk0JeSbyhqaG5haWhubG5sZmF
        kjhvh8DBGCGB9MSS1OzU1ILUIpg+Jg5OqQZGp7iLbzaEs27YK7pAzEl4wRZrq1JfCcuW/V+Z
        v2pri/R+MSjtP2thyJnPJXQ09Kh0o5bTqnO33Ew1G5Yz/pgUKcXRK3Gk2PxkK1dU5fubb5YH
        lJ7hZvljzC/03upmieT/Iwa2DqUyk3S+dkk7JajdCy67NT3SsTbt2FWZE7XrumfF1zvHFyqx
        FGckGmoxFxUnAgD9mkC+0gIAAA==
X-CMS-MailID: 20191206075504eucas1p2a20f41f038106d29246983ffeb079215
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20191205145641eucas1p1e3f40dff8a0c8e9ca47425e2370eabbb
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20191205145641eucas1p1e3f40dff8a0c8e9ca47425e2370eabbb
References: <CGME20191205145641eucas1p1e3f40dff8a0c8e9ca47425e2370eabbb@eucas1p1.samsung.com>
        <20191205145633.187511-1-linus.walleij@linaro.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Linus,

On 05.12.2019 15:56, Linus Walleij wrote:
> This converts the USB3503 to pick GPIO descriptors from the
> device tree instead of iteratively picking out GPIO number
> references and then referencing these from the global GPIO
> numberspace.
>
> The USB3503 is only used from device tree among the in-tree
> platforms. If board files would still desire to use it they can
> provide machine descriptor tables.
>
> Make sure to preserve semantics such as the reset delay
> introduced by Stefan.
>
> Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>
> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> Cc: Stefan Agner <stefan@agner.ch>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

NAK.

Sorry, but this patch breaks USB3503 HUB operation on Arndale5250 board. 
A brief scan through the code reveals that the whole control logic for 
the 'intn' gpio is lost.

> ---
>   drivers/usb/misc/usb3503.c            | 94 ++++++++++-----------------
>   include/linux/platform_data/usb3503.h |  3 -
>   2 files changed, 35 insertions(+), 62 deletions(-)
>
> diff --git a/drivers/usb/misc/usb3503.c b/drivers/usb/misc/usb3503.c
> index 72f39a9751b5..c3c1f65f4196 100644
> --- a/drivers/usb/misc/usb3503.c
> +++ b/drivers/usb/misc/usb3503.c
> @@ -7,11 +7,10 @@
>   
>   #include <linux/clk.h>
>   #include <linux/i2c.h>
> -#include <linux/gpio.h>
> +#include <linux/gpio/consumer.h>
>   #include <linux/delay.h>
>   #include <linux/slab.h>
>   #include <linux/module.h>
> -#include <linux/of_gpio.h>
>   #include <linux/platform_device.h>
>   #include <linux/platform_data/usb3503.h>
>   #include <linux/regmap.h>
> @@ -47,19 +46,19 @@ struct usb3503 {
>   	struct device		*dev;
>   	struct clk		*clk;
>   	u8	port_off_mask;
> -	int	gpio_intn;
> -	int	gpio_reset;
> -	int	gpio_connect;
> +	struct gpio_desc	*intn;
> +	struct gpio_desc 	*reset;
> +	struct gpio_desc 	*connect;
>   	bool	secondary_ref_clk;
>   };
>   
>   static int usb3503_reset(struct usb3503 *hub, int state)
>   {
> -	if (!state && gpio_is_valid(hub->gpio_connect))
> -		gpio_set_value_cansleep(hub->gpio_connect, 0);
> +	if (!state && hub->connect)
> +		gpiod_set_value_cansleep(hub->connect, 0);
>   
> -	if (gpio_is_valid(hub->gpio_reset))
> -		gpio_set_value_cansleep(hub->gpio_reset, state);
> +	if (hub->reset)
> +		gpiod_set_value_cansleep(hub->reset, state);
>   
>   	/* Wait T_HUBINIT == 4ms for hub logic to stabilize */
>   	if (state)
> @@ -115,8 +114,8 @@ static int usb3503_connect(struct usb3503 *hub)
>   		}
>   	}
>   
> -	if (gpio_is_valid(hub->gpio_connect))
> -		gpio_set_value_cansleep(hub->gpio_connect, 1);
> +	if (hub->connect)
> +		gpiod_set_value_cansleep(hub->connect, 1);
>   
>   	hub->mode = USB3503_MODE_HUB;
>   	dev_info(dev, "switched to HUB mode\n");
> @@ -163,13 +162,11 @@ static int usb3503_probe(struct usb3503 *hub)
>   	int err;
>   	u32 mode = USB3503_MODE_HUB;
>   	const u32 *property;
> +	enum gpiod_flags flags;
>   	int len;
>   
>   	if (pdata) {
>   		hub->port_off_mask	= pdata->port_off_mask;
> -		hub->gpio_intn		= pdata->gpio_intn;
> -		hub->gpio_connect	= pdata->gpio_connect;
> -		hub->gpio_reset		= pdata->gpio_reset;
>   		hub->mode		= pdata->initial_mode;
>   	} else if (np) {
>   		u32 rate = 0;
> @@ -230,59 +227,38 @@ static int usb3503_probe(struct usb3503 *hub)
>   			}
>   		}
>   
> -		hub->gpio_intn	= of_get_named_gpio(np, "intn-gpios", 0);
> -		if (hub->gpio_intn == -EPROBE_DEFER)
> -			return -EPROBE_DEFER;
> -		hub->gpio_connect = of_get_named_gpio(np, "connect-gpios", 0);
> -		if (hub->gpio_connect == -EPROBE_DEFER)
> -			return -EPROBE_DEFER;
> -		hub->gpio_reset = of_get_named_gpio(np, "reset-gpios", 0);
> -		if (hub->gpio_reset == -EPROBE_DEFER)
> -			return -EPROBE_DEFER;
>   		of_property_read_u32(np, "initial-mode", &mode);
>   		hub->mode = mode;
>   	}
>   
> -	if (hub->port_off_mask && !hub->regmap)
> -		dev_err(dev, "Ports disabled with no control interface\n");
> -
> -	if (gpio_is_valid(hub->gpio_intn)) {
> -		int val = hub->secondary_ref_clk ? GPIOF_OUT_INIT_LOW :
> -						   GPIOF_OUT_INIT_HIGH;
> -		err = devm_gpio_request_one(dev, hub->gpio_intn, val,
> -					    "usb3503 intn");
> -		if (err) {
> -			dev_err(dev,
> -				"unable to request GPIO %d as interrupt pin (%d)\n",
> -				hub->gpio_intn, err);
> -			return err;
> -		}
> -	}
> -
> -	if (gpio_is_valid(hub->gpio_connect)) {
> -		err = devm_gpio_request_one(dev, hub->gpio_connect,
> -				GPIOF_OUT_INIT_LOW, "usb3503 connect");
> -		if (err) {
> -			dev_err(dev,
> -				"unable to request GPIO %d as connect pin (%d)\n",
> -				hub->gpio_connect, err);
> -			return err;
> -		}
> -	}
> -
> -	if (gpio_is_valid(hub->gpio_reset)) {
> -		err = devm_gpio_request_one(dev, hub->gpio_reset,
> -				GPIOF_OUT_INIT_LOW, "usb3503 reset");
> +	if (hub->secondary_ref_clk)
> +		flags = GPIOD_OUT_LOW;
> +	else
> +		flags = GPIOD_OUT_HIGH;
> +	hub->intn = devm_gpiod_get_optional(dev, "intn", flags);
> +	if (IS_ERR(hub->intn))
> +		return PTR_ERR(hub->intn);
> +	if (hub->intn)
> +		gpiod_set_consumer_name(hub->intn, "usb3503 intn");
> +
> +	hub->connect = devm_gpiod_get_optional(dev, "connect", GPIOD_OUT_LOW);
> +	if (IS_ERR(hub->connect))
> +		return PTR_ERR(hub->connect);
> +	if (hub->connect)
> +		gpiod_set_consumer_name(hub->connect, "usb3503 connect");
> +
> +	hub->reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
> +	if (IS_ERR(hub->reset))
> +		return PTR_ERR(hub->reset);
> +	if (hub->reset) {
>   		/* Datasheet defines a hardware reset to be at least 100us */
>   		usleep_range(100, 10000);
> -		if (err) {
> -			dev_err(dev,
> -				"unable to request GPIO %d as reset pin (%d)\n",
> -				hub->gpio_reset, err);
> -			return err;
> -		}
> +		gpiod_set_consumer_name(hub->reset, "usb3503 reset");
>   	}
>   
> +	if (hub->port_off_mask && !hub->regmap)
> +		dev_err(dev, "Ports disabled with no control interface\n");
> +
>   	usb3503_switch_mode(hub, hub->mode);
>   
>   	dev_info(dev, "%s: probed in %s mode\n", __func__,
> diff --git a/include/linux/platform_data/usb3503.h b/include/linux/platform_data/usb3503.h
> index e049d51c1353..d01ef97ddf36 100644
> --- a/include/linux/platform_data/usb3503.h
> +++ b/include/linux/platform_data/usb3503.h
> @@ -17,9 +17,6 @@ enum usb3503_mode {
>   struct usb3503_platform_data {
>   	enum usb3503_mode	initial_mode;
>   	u8	port_off_mask;
> -	int	gpio_intn;
> -	int	gpio_connect;
> -	int	gpio_reset;
>   };
>   
>   #endif

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


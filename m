Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 938CA147897
	for <lists+linux-usb@lfdr.de>; Fri, 24 Jan 2020 07:33:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730645AbgAXGdk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 Jan 2020 01:33:40 -0500
Received: from mailout2.w1.samsung.com ([210.118.77.12]:47822 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725843AbgAXGdk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 24 Jan 2020 01:33:40 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20200124063338euoutp0292e6bf5d66fffc7a9863ace1c3a8bfa0~svwnMI0xn2810528105euoutp02Q
        for <linux-usb@vger.kernel.org>; Fri, 24 Jan 2020 06:33:38 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20200124063338euoutp0292e6bf5d66fffc7a9863ace1c3a8bfa0~svwnMI0xn2810528105euoutp02Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1579847618;
        bh=Ct1+M600GbivO8trkBvbvsU2msFfjzAJ2vdxPc6gXx4=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=CDndVIpc4dYiCH4bDKVdmZDqp0uNpdQaqlaZMnaqz9du8dbdMvi4fDJBzZM7Vrkkb
         rIz1NZkzivPdoYDCIxEi71A4H5Mba4c41KM1yGoAFRtm4ziE+qCx/zllpszIblyVgC
         qFgcdq9S00MNFUZNsS9Alc6GJEPOZvjVwoT+DDVI=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200124063337eucas1p1b186dbd7075158a30085b706b533a311~svwnFPGJE2152021520eucas1p1d;
        Fri, 24 Jan 2020 06:33:37 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 0B.F1.60679.1CF8A2E5; Fri, 24
        Jan 2020 06:33:37 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20200124063337eucas1p167e129e414defb6b1be69f418b983f94~svwmufmXe3124431244eucas1p1X;
        Fri, 24 Jan 2020 06:33:37 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200124063337eusmtrp2ed4ab8a5ed569dd830b89a9d33f921a3~svwmt6YDZ1736317363eusmtrp2d;
        Fri, 24 Jan 2020 06:33:37 +0000 (GMT)
X-AuditID: cbfec7f4-0e5ff7000001ed07-4a-5e2a8fc13ea6
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 70.3C.08375.1CF8A2E5; Fri, 24
        Jan 2020 06:33:37 +0000 (GMT)
Received: from [106.120.51.15] (unknown [106.120.51.15]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200124063337eusmtip2033180911d648c66d9061838200f8e33~svwmYd73R2233022330eusmtip2U;
        Fri, 24 Jan 2020 06:33:37 +0000 (GMT)
Subject: Re: [PATCH] usb: misc: usb3503: Use gpio descriptor interface
To:     =?UTF-8?Q?Pavel_L=c3=b6bl?= <pavel@loebl.cz>,
        linux-usb@vger.kernel.org
Cc:     gregkh@linuxfoundation.org,
        Linus Walleij <linus.walleij@linaro.org>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <4c850344-192a-00c5-9789-fd666d1587b1@samsung.com>
Date:   Fri, 24 Jan 2020 07:33:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
        Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200123144231.284762-1-pavel@loebl.cz>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprGKsWRmVeSWpSXmKPExsWy7djP87oH+7XiDKbvMrVoXryezWLKn+VM
        FouWtTJbLJnzgdWBxePOtT1sHvvnrmH3aO2exubxeZNcAEsUl01Kak5mWWqRvl0CV0brqT6m
        glk2FXvfzWBvYPyp38XIySEhYCIx5dxF5i5GLg4hgRWMEkeWvGYGSQgJfAFy3ilDJD4zSkzb
        18UI03Fj/SqojuWMEj/bHzFBOG8ZJfonTmcFqRIWcJOYcOsQWIeIgLfErM0bgGwODmYBD4n/
        /bYgYTYBQ4mut11sIDavgJ3Egl/fmUBsFgFViW9Pv4HFRQViJe6vnsoIUSMocXLmExYQm1PA
        VOL6nh9gNrOAvETz1tnMELa4xK0n88HukRCYzC6xYvdeJoirXSQ+32qG+kBY4tXxLewQtozE
        /50wDc2MEg/PrWWHcHoYJS43zYDqsJa4c+4XG8QHmhLrd0EDz1GiYVEHM0hYQoBP4sZbQYgj
        +CQmbZsOFeaV6GgTgqhWk5h1fB3c2oMXLjFPYFSaheS1WUjemYXknVkIexcwsqxiFE8tLc5N
        Ty02ykst1ytOzC0uzUvXS87P3cQITC2n/x3/soNx15+kQ4wCHIxKPLwSvZpxQqyJZcWVuYcY
        JTiYlUR4GcOAQrwpiZVVqUX58UWlOanFhxilOViUxHmNF72MFRJITyxJzU5NLUgtgskycXBK
        NTAqvinWPX0m/Epk7v15zqdeOktdZu/Zf31LhrxvSK+wyndN3XPV9d/eGO+Rj9btyFF+tPSR
        Q3SS3D89pQnl7T1mP1lTP275NNfXdXV7G7Nrx7v7fjsSV3o+KKrVaBOcx3/3GvfBlJuTmmJU
        f7E8n/7zxhtmeZNZWo8l2/u3340LuPVz6RMO/39KLMUZiYZazEXFiQA/NksXKQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrJIsWRmVeSWpSXmKPExsVy+t/xe7oH+7XiDJ5Ol7NoXryezWLKn+VM
        FouWtTJbLJnzgdWBxePOtT1sHvvnrmH3aO2exubxeZNcAEuUnk1RfmlJqkJGfnGJrVK0oYWR
        nqGlhZ6RiaWeobF5rJWRqZK+nU1Kak5mWWqRvl2CXkbrqT6mglk2FXvfzWBvYPyp38XIySEh
        YCJxY/0q5i5GLg4hgaWMEu8/r2KHSMhInJzWwAphC0v8udbFBlH0mlFi75tGZpCEsICbxIRb
        hxhBbBEBb4lZmzcA2RwczAIeEv/7bSHqOxglZh9/ADaITcBQoustyCBODl4BO4kFv74zgdgs
        AqoS355+A4uLCsRK/D9zDapGUOLkzCcsIDangKnE9T0/wGxmATOJeZsfMkPY8hLNW2dD2eIS
        t57MZ5rAKDQLSfssJC2zkLTMQtKygJFlFaNIamlxbnpusaFecWJucWleul5yfu4mRmA0bTv2
        c/MOxksbgw8xCnAwKvHwSvRqxgmxJpYVV+YeYpTgYFYS4WUMAwrxpiRWVqUW5ccXleakFh9i
        NAV6biKzlGhyPjDS80riDU0NzS0sDc2NzY3NLJTEeTsEDsYICaQnlqRmp6YWpBbB9DFxcEo1
        MKo6HBKe+OnMPN5JJqtmcM9dbbpeY12i7KM7+gd8Hhcsb/TJ5vkdnLT7/+w9r+K3LXx4577Z
        oq3LxAS0lj+JuKF99YuseNXiZ4t+3Hc42Hghct+29lKJaRu1u1cubZit49LxYMFEpw1eqw65
        nXzyUVhj6yoN7pvN11sL7wnMLr+70FfsUbf944cnlFiKMxINtZiLihMBmFgk8LwCAAA=
X-CMS-MailID: 20200124063337eucas1p167e129e414defb6b1be69f418b983f94
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200123144414eucas1p220590ff849a8d9e534ab6aa3cf5ade28
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200123144414eucas1p220590ff849a8d9e534ab6aa3cf5ade28
References: <CGME20200123144414eucas1p220590ff849a8d9e534ab6aa3cf5ade28@eucas1p2.samsung.com>
        <20200123144231.284762-1-pavel@loebl.cz>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Pavel,

On 23.01.2020 15:42, Pavel Löbl wrote:
> Move gpio related code to descriptor-based interface. This makes
> driver to respect active physical level as specified in DT. Existing
> DT nodes are adjusted to reflect the former behaviour.
>
> Signed-off-by: Pavel Löbl <pavel@loebl.cz>

This is a duplicate of https://patchwork.kernel.org/cover/11285261/ 
which has been already applied to current linux-next.

> ---
>   arch/arm/boot/dts/exynos5250-arndale.dts      |  4 +-
>   .../boot/dts/sun8i-a83t-cubietruck-plus.dts   |  2 +-
>   arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi     |  2 +-
>   drivers/usb/misc/usb3503.c                    | 79 +++++++------------
>   include/linux/platform_data/usb3503.h         |  6 +-
>   5 files changed, 35 insertions(+), 58 deletions(-)
>
> diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts b/arch/arm/boot/dts/exynos5250-arndale.dts
> index d6c85efdb465..344e15a4c959 100644
> --- a/arch/arm/boot/dts/exynos5250-arndale.dts
> +++ b/arch/arm/boot/dts/exynos5250-arndale.dts
> @@ -153,8 +153,8 @@ xxti {
>   	usb_hub: usb-hub {
>   		compatible = "smsc,usb3503a";
>   
> -		reset-gpios = <&gpx3 5 GPIO_ACTIVE_LOW>;
> -		connect-gpios = <&gpd1 7 GPIO_ACTIVE_LOW>;
> +		reset-gpios = <&gpx3 5 GPIO_ACTIVE_HIGH>;
> +		connect-gpios = <&gpd1 7 GPIO_ACTIVE_HIGH>;
>   	};
>   };
>   
> diff --git a/arch/arm/boot/dts/sun8i-a83t-cubietruck-plus.dts b/arch/arm/boot/dts/sun8i-a83t-cubietruck-plus.dts
> index d9be511f054f..fb928503ad45 100644
> --- a/arch/arm/boot/dts/sun8i-a83t-cubietruck-plus.dts
> +++ b/arch/arm/boot/dts/sun8i-a83t-cubietruck-plus.dts
> @@ -101,7 +101,7 @@ usb-hub {
>   		initial-mode = <1>; /* initialize in HUB mode */
>   		disabled-ports = <1>;
>   		intn-gpios = <&pio 7 5 GPIO_ACTIVE_HIGH>; /* PH5 */
> -		reset-gpios = <&pio 4 16 GPIO_ACTIVE_LOW>; /* PE16 */
> +		reset-gpios = <&pio 4 16 GPIO_ACTIVE_HIGH>; /* PE16 */
>   		connect-gpios = <&pio 4 17 GPIO_ACTIVE_HIGH>; /* PE17 */
>   		refclk-frequency = <19200000>;
>   	};
> diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
> index e12a36ce5d93..a1d3575edb39 100644
> --- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
> +++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
> @@ -498,7 +498,7 @@ wcnss@a21b000 {
>   
>   	usb2513 {
>   		compatible = "smsc,usb3503";
> -		reset-gpios = <&pm8916_gpios 3 GPIO_ACTIVE_LOW>;
> +		reset-gpios = <&pm8916_gpios 3 GPIO_ACTIVE_HIGH>;
>   		initial-mode = <1>;
>   	};
>   
> diff --git a/drivers/usb/misc/usb3503.c b/drivers/usb/misc/usb3503.c
> index 72f39a9751b5..d9ffb2d5c318 100644
> --- a/drivers/usb/misc/usb3503.c
> +++ b/drivers/usb/misc/usb3503.c
> @@ -47,19 +47,19 @@ struct usb3503 {
>   	struct device		*dev;
>   	struct clk		*clk;
>   	u8	port_off_mask;
> -	int	gpio_intn;
> -	int	gpio_reset;
> -	int	gpio_connect;
> +	struct gpio_desc	*gpio_intn;
> +	struct gpio_desc	*gpio_reset;
> +	struct gpio_desc	*gpio_connect;
>   	bool	secondary_ref_clk;
>   };
>   
>   static int usb3503_reset(struct usb3503 *hub, int state)
>   {
> -	if (!state && gpio_is_valid(hub->gpio_connect))
> -		gpio_set_value_cansleep(hub->gpio_connect, 0);
> +	if (!state && hub->gpio_connect)
> +		gpiod_set_value_cansleep(hub->gpio_connect, 0);
>   
> -	if (gpio_is_valid(hub->gpio_reset))
> -		gpio_set_value_cansleep(hub->gpio_reset, state);
> +	if (hub->gpio_reset)
> +		gpiod_set_value_cansleep(hub->gpio_reset, state);
>   
>   	/* Wait T_HUBINIT == 4ms for hub logic to stabilize */
>   	if (state)
> @@ -115,8 +115,8 @@ static int usb3503_connect(struct usb3503 *hub)
>   		}
>   	}
>   
> -	if (gpio_is_valid(hub->gpio_connect))
> -		gpio_set_value_cansleep(hub->gpio_connect, 1);
> +	if (hub->gpio_connect)
> +		gpiod_set_value_cansleep(hub->gpio_connect, 1);
>   
>   	hub->mode = USB3503_MODE_HUB;
>   	dev_info(dev, "switched to HUB mode\n");
> @@ -164,6 +164,7 @@ static int usb3503_probe(struct usb3503 *hub)
>   	u32 mode = USB3503_MODE_HUB;
>   	const u32 *property;
>   	int len;
> +	int intn_level;
>   
>   	if (pdata) {
>   		hub->port_off_mask	= pdata->port_off_mask;
> @@ -230,59 +231,35 @@ static int usb3503_probe(struct usb3503 *hub)
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
> -		of_property_read_u32(np, "initial-mode", &mode);
> -		hub->mode = mode;
> -	}
> -
> -	if (hub->port_off_mask && !hub->regmap)
> -		dev_err(dev, "Ports disabled with no control interface\n");
> -
> -	if (gpio_is_valid(hub->gpio_intn)) {
> -		int val = hub->secondary_ref_clk ? GPIOF_OUT_INIT_LOW :
> -						   GPIOF_OUT_INIT_HIGH;
> -		err = devm_gpio_request_one(dev, hub->gpio_intn, val,
> -					    "usb3503 intn");
> +		intn_level = hub->secondary_ref_clk ? GPIOD_OUT_LOW : GPIOD_OUT_HIGH;
> +		hub->gpio_intn	= devm_gpiod_get_optional(dev, "intn", intn_level);
> +		err = PTR_ERR_OR_ZERO(hub->gpio_intn);
>   		if (err) {
> -			dev_err(dev,
> -				"unable to request GPIO %d as interrupt pin (%d)\n",
> -				hub->gpio_intn, err);
> +			if (err != -EPROBE_DEFER)
> +				dev_err(dev, "failed to get interrupt GPIO");
>   			return err;
>   		}
> -	}
> -
> -	if (gpio_is_valid(hub->gpio_connect)) {
> -		err = devm_gpio_request_one(dev, hub->gpio_connect,
> -				GPIOF_OUT_INIT_LOW, "usb3503 connect");
> +		hub->gpio_connect = devm_gpiod_get_optional(dev, "connect", GPIOD_OUT_LOW);
> +		err = PTR_ERR_OR_ZERO(hub->gpio_connect);
>   		if (err) {
> -			dev_err(dev,
> -				"unable to request GPIO %d as connect pin (%d)\n",
> -				hub->gpio_connect, err);
> +			if (err != -EPROBE_DEFER)
> +				dev_err(dev, "failed to get GPIO for connect");
>   			return err;
>   		}
> -	}
> -
> -	if (gpio_is_valid(hub->gpio_reset)) {
> -		err = devm_gpio_request_one(dev, hub->gpio_reset,
> -				GPIOF_OUT_INIT_LOW, "usb3503 reset");
> -		/* Datasheet defines a hardware reset to be at least 100us */
> -		usleep_range(100, 10000);
> +		hub->gpio_reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
> +		err = PTR_ERR_OR_ZERO(hub->gpio_reset);
>   		if (err) {
> -			dev_err(dev,
> -				"unable to request GPIO %d as reset pin (%d)\n",
> -				hub->gpio_reset, err);
> +			if (err != -EPROBE_DEFER)
> +				dev_err(dev, "failed to get reset GPIO");
>   			return err;
>   		}
> +		of_property_read_u32(np, "initial-mode", &mode);
> +		hub->mode = mode;
>   	}
>   
> +	if (hub->port_off_mask && !hub->regmap)
> +		dev_err(dev, "Ports disabled with no control interface\n");
> +
>   	usb3503_switch_mode(hub, hub->mode);
>   
>   	dev_info(dev, "%s: probed in %s mode\n", __func__,
> diff --git a/include/linux/platform_data/usb3503.h b/include/linux/platform_data/usb3503.h
> index e049d51c1353..3e966a62277e 100644
> --- a/include/linux/platform_data/usb3503.h
> +++ b/include/linux/platform_data/usb3503.h
> @@ -17,9 +17,9 @@ enum usb3503_mode {
>   struct usb3503_platform_data {
>   	enum usb3503_mode	initial_mode;
>   	u8	port_off_mask;
> -	int	gpio_intn;
> -	int	gpio_connect;
> -	int	gpio_reset;
> +	struct gpio_desc	*gpio_intn;
> +	struct gpio_desc	*gpio_connect;
> +	struct gpio_desc	*gpio_reset;
>   };
>   
>   #endif

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


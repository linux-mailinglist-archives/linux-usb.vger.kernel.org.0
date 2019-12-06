Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F381E114E08
	for <lists+linux-usb@lfdr.de>; Fri,  6 Dec 2019 10:14:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726171AbfLFJOL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 6 Dec 2019 04:14:11 -0500
Received: from mailout2.w1.samsung.com ([210.118.77.12]:35442 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726109AbfLFJOL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 6 Dec 2019 04:14:11 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20191206091408euoutp02d36ed1b1e6d8a51882b53d266566217a~dvVxHZFd33227232272euoutp02a
        for <linux-usb@vger.kernel.org>; Fri,  6 Dec 2019 09:14:08 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20191206091408euoutp02d36ed1b1e6d8a51882b53d266566217a~dvVxHZFd33227232272euoutp02a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1575623648;
        bh=aI0NpP/i5Gu7A+h13N0b6DMkMr7rXbud2xx0Ia02NKU=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=fc3YOkrhotF6HPc7xKtSk0xLoBxC8rBrwmMm/WrWhFB4ZyR8lcoz/1QvR1WwryjRs
         05MI41DuYjwZ16uuIAIE5CH8mQvge6QpZZRjeJALMmEi9Qge+97kAkiQ9qed6OrQSf
         U9ffZlIlnMJiwXqwzxm/KuE/Q07sDzlrpn2fKKVE=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20191206091408eucas1p11cd59a94da7cad91f15271ee2284d4e5~dvVw46wdP2771127711eucas1p1j;
        Fri,  6 Dec 2019 09:14:08 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 5F.44.61286.0EB1AED5; Fri,  6
        Dec 2019 09:14:08 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20191206091408eucas1p2cc009df4395f47d484aa9318bc74c88f~dvVwizolT2624526245eucas1p25;
        Fri,  6 Dec 2019 09:14:08 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20191206091408eusmtrp10139113d0e5ac44a39e1d5ca8f7d2fc3~dvVwiMYLf0907409074eusmtrp1G;
        Fri,  6 Dec 2019 09:14:08 +0000 (GMT)
X-AuditID: cbfec7f2-f0bff7000001ef66-cf-5dea1be0d0ee
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 30.6C.08375.FDB1AED5; Fri,  6
        Dec 2019 09:14:08 +0000 (GMT)
Received: from [106.120.51.15] (unknown [106.120.51.15]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20191206091407eusmtip13b9c5b304ded88f8521a526bbed9b95b~dvVwLFAsH0204802048eusmtip1u;
        Fri,  6 Dec 2019 09:14:07 +0000 (GMT)
Subject: Re: [PATCH] usb: usb3503: Convert to use GPIO descriptors
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Stefan Agner <stefan@agner.ch>,
        Krzysztof Kozlowski <krzk@kernel.org>
Message-ID: <e4ba86d5-3c25-8b2c-981c-efaad4ebc60c@samsung.com>
Date:   Fri, 6 Dec 2019 10:14:07 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
        Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <39902b1d-656c-2dc9-34bc-3bfe715db22f@samsung.com>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sa0hTYRju85ydHVeTz2n4pmI4I9DICwaNUrsYtSCooF/V0KUnJ7ppO9Nl
        GFiWl6EhZWrT0qalydQwM83QtHAMQdNFppQXEvJOeCmU0jyeWf573ud5vud9H/hoQvJM4E7H
        anSMVqOMl1IisrFzqXvviMekIrD8O8gyWx+SsvTyOkrW0/NcKMv/XekgMz29Tche1GYKD1Py
        8l9DhLy+OpuSf/n0hpK3PTQL5besbaR8vt7rDHVeFBLNxMcmM9qAsEiRasS2KkhsOXG1rMFA
        paH3oQbkSAPeB0tzywIDEtESXIWg+u0y4ocFBAOd/XZlHsHwVDvaeGJqHqV4oRLBk9Jxgh9m
        ECxmfxRyLhd8FH4Ul5AcpnAQGGYMFIddcQS8sg2uewich6B9jDUgmhbjMMjNdOZoEu+Cwdxp
        iqO3YwVkVao4WoydwfpgbD3RER+C+713KD5lJ6S/LCZ47AaDY6UO3DmAG4Uw1ZVPcDmAj8GS
        Wcjf7wKTlgY79oSuezkk709HMNpdI+SHHAS2m0X2xgfhnaVXwAUR2BfqXgfw9BEoyB1GfL4T
        fJ5x5m9wgruNhfa1YsjKkPDu3WC01P5b2/6hj8hDUuOmZsZNbYyb2hj/7y1DZDVyY5JYdQzD
        BmkYvT+rVLNJmhj/qAR1PVr7QF0rlrkmtNh3qQNhGkm3iYvmxxUSgTKZTVF3IKAJqas4xmlC
        IRFHK1OuMdqECG1SPMN2IA+alLqJg01rEo5R6pg4hklktBuqA+3onobMFxcCfdSmAjfdacrP
        NBt1xVs6/gjGRNR0rM7mKUberUPTcfsfN5ljq8jePyqfyJMtXzP0kpUtHTgoWKqlL2wtUlxe
        vG4uT/Vynv15nC5LPatYCTXM6Vv1qQG+hd9WD+wIUS1L9BUDN0pSmk8VV4RZwveET7QPGa3n
        rDX9EinJqpRBfoSWVf4FxedD4DwDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrHIsWRmVeSWpSXmKPExsVy+t/xu7oPpF/FGrw4z2jRvm8ui0Xz4vVs
        FufPb2C3mPJnOZPFomWtzBab17WzO7B5LP5+j9lj06pONo871/aweeyfu4bdo+XkfhaPz5vk
        Atii9GyK8ktLUhUy8otLbJWiDS2M9AwtLfSMTCz1DI3NY62MTJX07WxSUnMyy1KL9O0S9DIe
        XP7PWrDbvWLBli62BsYjtl2MnBwSAiYSi3Y+ZOti5OIQEljKKHF4229WiISMxMlpDVC2sMSf
        a11QRa8ZJVbeXcoCkhAWcJL4MHsOmM0mYCjR9RakiJNDRCBeYvvxJhaQBmaBCYwSnc1dLBDd
        xxklbi+6wd7FyMHBK2An0dsuCNLAIqAicav3DVizqECsxPeVnxhBbF4BQYmTM5+ALeAUsJeY
        erEPrIZZwExi3uaHzBC2vETz1tlQtrjErSfzmSYwCs1C0j4LScssJC2zkLQsYGRZxSiSWlqc
        m55bbKhXnJhbXJqXrpecn7uJERh324793LyD8dLG4EOMAhyMSjy8Mz6/iBViTSwrrsw9xCjB
        wawkwpvO9zJWiDclsbIqtSg/vqg0J7X4EKMp0HMTmaVEk/OBKSGvJN7Q1NDcwtLQ3Njc2MxC
        SZy3Q+BgjJBAemJJanZqakFqEUwfEwenVAPj5Ip9h3Ijn+d825boH/LLU2Dzt5c1mhFx3Hac
        q08eixFKvZE0eavEwcl8akaxt6tEfqY4uF6PFlrv2+8talNatyjW7e2e0gqxdV7hN97zu7ed
        /JLBZ9h7clNv0u2jOp3TfC7sOBSy0HEl41PVCkPZUvHIfQ77Pr5u1nv45/9MD96yFZzsBjlK
        LMUZiYZazEXFiQAK6D270QIAAA==
X-CMS-MailID: 20191206091408eucas1p2cc009df4395f47d484aa9318bc74c88f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20191205145641eucas1p1e3f40dff8a0c8e9ca47425e2370eabbb
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20191205145641eucas1p1e3f40dff8a0c8e9ca47425e2370eabbb
References: <CGME20191205145641eucas1p1e3f40dff8a0c8e9ca47425e2370eabbb@eucas1p1.samsung.com>
        <20191205145633.187511-1-linus.walleij@linaro.org>
        <39902b1d-656c-2dc9-34bc-3bfe715db22f@samsung.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi

On 06.12.2019 08:55, Marek Szyprowski wrote:
> Hi Linus,
>
> On 05.12.2019 15:56, Linus Walleij wrote:
>> This converts the USB3503 to pick GPIO descriptors from the
>> device tree instead of iteratively picking out GPIO number
>> references and then referencing these from the global GPIO
>> numberspace.
>>
>> The USB3503 is only used from device tree among the in-tree
>> platforms. If board files would still desire to use it they can
>> provide machine descriptor tables.
>>
>> Make sure to preserve semantics such as the reset delay
>> introduced by Stefan.
>>
>> Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>
>> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
>> Cc: Stefan Agner <stefan@agner.ch>
>> Cc: Krzysztof Kozlowski <krzk@kernel.org>
>> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>
> NAK.
>
> Sorry, but this patch breaks USB3503 HUB operation on Arndale5250 
> board. A brief scan through the code reveals that the whole control 
> logic for the 'intn' gpio is lost.

Well, I've checked further and 'intn' logic is there. The issue with 
Arndale5250 board is something different. Changing the gpio active 
values in arch/arm/boot/dts/exynos5250-arndale.dts from GPIO_ACTIVE_LOW 
to GPIO_ACTIVE_HIGH fixed operation of usb3503 HUB. I really wonder why 
it worked fine with non-descriptor code and the ACTIVE_LOW DT flags...

I'm not sure how to handle this. Old code works also fine with DT flags 
changed to GPIO_ACTIVE_HIGH, which seems to be a proper value for those 
gpio lines.

>> ---
>>   drivers/usb/misc/usb3503.c            | 94 ++++++++++-----------------
>>   include/linux/platform_data/usb3503.h |  3 -
>>   2 files changed, 35 insertions(+), 62 deletions(-)
>>
>> diff --git a/drivers/usb/misc/usb3503.c b/drivers/usb/misc/usb3503.c
>> index 72f39a9751b5..c3c1f65f4196 100644
>> --- a/drivers/usb/misc/usb3503.c
>> +++ b/drivers/usb/misc/usb3503.c
>> @@ -7,11 +7,10 @@
>>     #include <linux/clk.h>
>>   #include <linux/i2c.h>
>> -#include <linux/gpio.h>
>> +#include <linux/gpio/consumer.h>
>>   #include <linux/delay.h>
>>   #include <linux/slab.h>
>>   #include <linux/module.h>
>> -#include <linux/of_gpio.h>
>>   #include <linux/platform_device.h>
>>   #include <linux/platform_data/usb3503.h>
>>   #include <linux/regmap.h>
>> @@ -47,19 +46,19 @@ struct usb3503 {
>>       struct device        *dev;
>>       struct clk        *clk;
>>       u8    port_off_mask;
>> -    int    gpio_intn;
>> -    int    gpio_reset;
>> -    int    gpio_connect;
>> +    struct gpio_desc    *intn;
>> +    struct gpio_desc     *reset;
>> +    struct gpio_desc     *connect;
>>       bool    secondary_ref_clk;
>>   };
>>     static int usb3503_reset(struct usb3503 *hub, int state)
>>   {
>> -    if (!state && gpio_is_valid(hub->gpio_connect))
>> -        gpio_set_value_cansleep(hub->gpio_connect, 0);
>> +    if (!state && hub->connect)
>> +        gpiod_set_value_cansleep(hub->connect, 0);
>>   -    if (gpio_is_valid(hub->gpio_reset))
>> -        gpio_set_value_cansleep(hub->gpio_reset, state);
>> +    if (hub->reset)
>> +        gpiod_set_value_cansleep(hub->reset, state);
>>         /* Wait T_HUBINIT == 4ms for hub logic to stabilize */
>>       if (state)
>> @@ -115,8 +114,8 @@ static int usb3503_connect(struct usb3503 *hub)
>>           }
>>       }
>>   -    if (gpio_is_valid(hub->gpio_connect))
>> -        gpio_set_value_cansleep(hub->gpio_connect, 1);
>> +    if (hub->connect)
>> +        gpiod_set_value_cansleep(hub->connect, 1);
>>         hub->mode = USB3503_MODE_HUB;
>>       dev_info(dev, "switched to HUB mode\n");
>> @@ -163,13 +162,11 @@ static int usb3503_probe(struct usb3503 *hub)
>>       int err;
>>       u32 mode = USB3503_MODE_HUB;
>>       const u32 *property;
>> +    enum gpiod_flags flags;
>>       int len;
>>         if (pdata) {
>>           hub->port_off_mask    = pdata->port_off_mask;
>> -        hub->gpio_intn        = pdata->gpio_intn;
>> -        hub->gpio_connect    = pdata->gpio_connect;
>> -        hub->gpio_reset        = pdata->gpio_reset;
>>           hub->mode        = pdata->initial_mode;
>>       } else if (np) {
>>           u32 rate = 0;
>> @@ -230,59 +227,38 @@ static int usb3503_probe(struct usb3503 *hub)
>>               }
>>           }
>>   -        hub->gpio_intn    = of_get_named_gpio(np, "intn-gpios", 0);
>> -        if (hub->gpio_intn == -EPROBE_DEFER)
>> -            return -EPROBE_DEFER;
>> -        hub->gpio_connect = of_get_named_gpio(np, "connect-gpios", 0);
>> -        if (hub->gpio_connect == -EPROBE_DEFER)
>> -            return -EPROBE_DEFER;
>> -        hub->gpio_reset = of_get_named_gpio(np, "reset-gpios", 0);
>> -        if (hub->gpio_reset == -EPROBE_DEFER)
>> -            return -EPROBE_DEFER;
>>           of_property_read_u32(np, "initial-mode", &mode);
>>           hub->mode = mode;
>>       }
>>   -    if (hub->port_off_mask && !hub->regmap)
>> -        dev_err(dev, "Ports disabled with no control interface\n");
>> -
>> -    if (gpio_is_valid(hub->gpio_intn)) {
>> -        int val = hub->secondary_ref_clk ? GPIOF_OUT_INIT_LOW :
>> -                           GPIOF_OUT_INIT_HIGH;
>> -        err = devm_gpio_request_one(dev, hub->gpio_intn, val,
>> -                        "usb3503 intn");
>> -        if (err) {
>> -            dev_err(dev,
>> -                "unable to request GPIO %d as interrupt pin (%d)\n",
>> -                hub->gpio_intn, err);
>> -            return err;
>> -        }
>> -    }
>> -
>> -    if (gpio_is_valid(hub->gpio_connect)) {
>> -        err = devm_gpio_request_one(dev, hub->gpio_connect,
>> -                GPIOF_OUT_INIT_LOW, "usb3503 connect");
>> -        if (err) {
>> -            dev_err(dev,
>> -                "unable to request GPIO %d as connect pin (%d)\n",
>> -                hub->gpio_connect, err);
>> -            return err;
>> -        }
>> -    }
>> -
>> -    if (gpio_is_valid(hub->gpio_reset)) {
>> -        err = devm_gpio_request_one(dev, hub->gpio_reset,
>> -                GPIOF_OUT_INIT_LOW, "usb3503 reset");
>> +    if (hub->secondary_ref_clk)
>> +        flags = GPIOD_OUT_LOW;
>> +    else
>> +        flags = GPIOD_OUT_HIGH;
>> +    hub->intn = devm_gpiod_get_optional(dev, "intn", flags);
>> +    if (IS_ERR(hub->intn))
>> +        return PTR_ERR(hub->intn);
>> +    if (hub->intn)
>> +        gpiod_set_consumer_name(hub->intn, "usb3503 intn");
>> +
>> +    hub->connect = devm_gpiod_get_optional(dev, "connect", 
>> GPIOD_OUT_LOW);
>> +    if (IS_ERR(hub->connect))
>> +        return PTR_ERR(hub->connect);
>> +    if (hub->connect)
>> +        gpiod_set_consumer_name(hub->connect, "usb3503 connect");
>> +
>> +    hub->reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
>> +    if (IS_ERR(hub->reset))
>> +        return PTR_ERR(hub->reset);
>> +    if (hub->reset) {
>>           /* Datasheet defines a hardware reset to be at least 100us */
>>           usleep_range(100, 10000);
>> -        if (err) {
>> -            dev_err(dev,
>> -                "unable to request GPIO %d as reset pin (%d)\n",
>> -                hub->gpio_reset, err);
>> -            return err;
>> -        }
>> +        gpiod_set_consumer_name(hub->reset, "usb3503 reset");
>>       }
>>   +    if (hub->port_off_mask && !hub->regmap)
>> +        dev_err(dev, "Ports disabled with no control interface\n");
>> +
>>       usb3503_switch_mode(hub, hub->mode);
>>         dev_info(dev, "%s: probed in %s mode\n", __func__,
>> diff --git a/include/linux/platform_data/usb3503.h 
>> b/include/linux/platform_data/usb3503.h
>> index e049d51c1353..d01ef97ddf36 100644
>> --- a/include/linux/platform_data/usb3503.h
>> +++ b/include/linux/platform_data/usb3503.h
>> @@ -17,9 +17,6 @@ enum usb3503_mode {
>>   struct usb3503_platform_data {
>>       enum usb3503_mode    initial_mode;
>>       u8    port_off_mask;
>> -    int    gpio_intn;
>> -    int    gpio_connect;
>> -    int    gpio_reset;
>>   };
>>     #endif

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9860F114FE3
	for <lists+linux-usb@lfdr.de>; Fri,  6 Dec 2019 12:43:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726234AbfLFLnB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 6 Dec 2019 06:43:01 -0500
Received: from mailout1.w1.samsung.com ([210.118.77.11]:37058 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726116AbfLFLnB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 6 Dec 2019 06:43:01 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20191206114259euoutp014ad68ef37c60357eb176ca912f88bd2d~dxXuvm4rU2645326453euoutp01k
        for <linux-usb@vger.kernel.org>; Fri,  6 Dec 2019 11:42:59 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20191206114259euoutp014ad68ef37c60357eb176ca912f88bd2d~dxXuvm4rU2645326453euoutp01k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1575632579;
        bh=kuwIWw6rIR2Cn0TDLhKvKd4G6docWipEzHSuNoUUdis=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=X5hVhUD+K//ex8lrkAqPlYwQNPewTngQInA79rndSMhASM/gvlFGdjKXfeVknx5VG
         J1uJBLbKWvqT5MMto3iXkDMSTECCKJ5idrb2Ckk9Imsde1JQV5p0K4UtVwEvlOAdra
         SbSGqbXvtAymw2wOUvhDS0hKdnWCMgt9K8quB6fg=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20191206114259eucas1p2a71adfe70785ae5cc6520bd0ffa9e7f8~dxXuoI2mH1133911339eucas1p24;
        Fri,  6 Dec 2019 11:42:59 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 66.28.61286.3CE3AED5; Fri,  6
        Dec 2019 11:42:59 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20191206114258eucas1p1068933c6dbd00a63af1ce507da0628f2~dxXuHj-LC2632926329eucas1p1l;
        Fri,  6 Dec 2019 11:42:58 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20191206114258eusmtrp1f1f0e580dfd96a8d2c1a9adc825b0718~dxXuG9LtN1063710637eusmtrp1G;
        Fri,  6 Dec 2019 11:42:58 +0000 (GMT)
X-AuditID: cbfec7f2-ef1ff7000001ef66-bd-5dea3ec31e90
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 0F.30.07950.2CE3AED5; Fri,  6
        Dec 2019 11:42:58 +0000 (GMT)
Received: from [106.120.51.15] (unknown [106.120.51.15]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20191206114258eusmtip21a2782061b9c950c405bc011d055bfff~dxXt0hlrW2948529485eusmtip2O;
        Fri,  6 Dec 2019 11:42:58 +0000 (GMT)
Subject: Re: [PATCH] usb: usb3503: Convert to use GPIO descriptors
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb <linux-usb@vger.kernel.org>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Stefan Agner <stefan@agner.ch>,
        Krzysztof Kozlowski <krzk@kernel.org>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <402598f1-3230-c48f-c1c0-feda19cb2261@samsung.com>
Date:   Fri, 6 Dec 2019 12:42:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
        Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <CACRpkdaV9zoVzpZ3SW-Nvjo6ytUCEjA6fWuW1FSBciQ24j5SZg@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrFKsWRmVeSWpSXmKPExsWy7djP87qH7V7FGhz5JGXRvm8ui0Xz4vVs
        FufPb2C3mPJnOZPFomWtzBab17WzO7B5LP5+j9lj06pONo871/aweeyfu4bdo+XkfhaPz5vk
        AtiiuGxSUnMyy1KL9O0SuDLW704rmCJS0ThhNlsD4wGBLkZODgkBE4lT94+xdTFycQgJrGCU
        aP3+kRXC+cIo8fRKDxOE85lRYt7Wn6wwLcvWPWeGSCxnlHg0/yo7hPOWUeLTvDYWkCphASeJ
        D7PngNkiAjoS3dt+gs1lFjjPKLH27yGwUWwChhJdb7vYQGxeATuJx79Xg8VZBFQkWm81AE3l
        4BAViJXoWJ4BUSIocXLmE7CZnAKBEv+/zAVrZRaQl9j+dg4zhC0ucevJfLCzJQS2sUuc+HSD
        BWSOhICLRN9tNogPhCVeHd/CDmHLSJye3MMCUd/MKPHw3Fp2CKeHUeJy0wxGiCpricPHL7KC
        DGIW0JRYv0sfIuwoMa33PiPEfD6JG28FIW7gk5i0bTozRJhXoqNNCKJaTWLW8XVwaw9euMQ8
        gVFpFpLPZiH5ZhaSb2Yh7F3AyLKKUTy1tDg3PbXYMC+1XK84Mbe4NC9dLzk/dxMjMAWd/nf8
        0w7Gr5eSDjEKcDAq8fDO+PwiVog1say4MvcQowQHs5IIbzrfy1gh3pTEyqrUovz4otKc1OJD
        jNIcLErivMaLgFIC6YklqdmpqQWpRTBZJg5OqQZG2zqpctXnuSkTf0VOWKY9mf2IQArXlqc+
        32b9z/tsPqFZ0eykYdzjEwXa9jwXPrHaNbuybdfOm9+wxu9Sy4/syEtlC0pvf7YR13G/dslV
        fLZ9bu8Lj+PZiYXGXueYBRKisrgksqYuXpeXcOPF0iBRmwzDIrtOnS0L1ZdsO/Wnd900/qQ1
        xW+UWIozEg21mIuKEwHp4dsCPQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrHIsWRmVeSWpSXmKPExsVy+t/xe7qH7F7FGhzbb2XRvm8ui0Xz4vVs
        FufPb2C3mPJnOZPFomWtzBab17WzO7B5LP5+j9lj06pONo871/aweeyfu4bdo+XkfhaPz5vk
        Atii9GyK8ktLUhUy8otLbJWiDS2M9AwtLfSMTCz1DI3NY62MTJX07WxSUnMyy1KL9O0S9DLW
        704rmCJS0ThhNlsD4wGBLkZODgkBE4ll654zdzFycQgJLGWUuDTvBjtEQkbi5LQGVghbWOLP
        tS42iKLXjBJP3n5jBEkICzhJfJg9hwXEFhHQkeje9pMVpIhZ4CKjxIkz7awQHYeZJF7eXgg2
        lk3AUKLrLcgoTg5eATuJx79Xg61gEVCRaL3VAFYjKhAr8X3lJ0aIGkGJkzOfgG3gFAiU+P9l
        Llgvs4CZxLzND5khbHmJ7W/nQNniEreezGeawCg0C0n7LCQts5C0zELSsoCRZRWjSGppcW56
        brGRXnFibnFpXrpecn7uJkZg3G079nPLDsaud8GHGAU4GJV4eGd8fhErxJpYVlyZe4hRgoNZ
        SYQ3ne9lrBBvSmJlVWpRfnxRaU5q8SFGU6DnJjJLiSbnA1NCXkm8oamhuYWlobmxubGZhZI4
        b4fAwRghgfTEktTs1NSC1CKYPiYOTqkGxry/lilhzg8uKDB5tSRJPbor9ePAvYn3FadUVoed
        n82/Ozb0z78l7Jcb/XZ1LJx1UCRhy6qy7U5/dRaIm+VMOfF3ydELh7m/xRfutTsyla3jooYu
        R+TxHMX0W0ZL3/UInW9omPUtXHn1Cj5168lWlVN2x8Re2fp7zZszl5QS/pU6P0s8rfrCJ0uJ
        pTgj0VCLuag4EQASYXlV0QIAAA==
X-CMS-MailID: 20191206114258eucas1p1068933c6dbd00a63af1ce507da0628f2
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20191205145641eucas1p1e3f40dff8a0c8e9ca47425e2370eabbb
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20191205145641eucas1p1e3f40dff8a0c8e9ca47425e2370eabbb
References: <CGME20191205145641eucas1p1e3f40dff8a0c8e9ca47425e2370eabbb@eucas1p1.samsung.com>
        <20191205145633.187511-1-linus.walleij@linaro.org>
        <39902b1d-656c-2dc9-34bc-3bfe715db22f@samsung.com>
        <e4ba86d5-3c25-8b2c-981c-efaad4ebc60c@samsung.com>
        <CACRpkdaV9zoVzpZ3SW-Nvjo6ytUCEjA6fWuW1FSBciQ24j5SZg@mail.gmail.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Linus,

On 06.12.2019 10:56, Linus Walleij wrote:
> On Fri, Dec 6, 2019 at 10:14 AM Marek Szyprowski
> <m.szyprowski@samsung.com> wrote:
>> On 06.12.2019 08:55, Marek Szyprowski wrote:
>>> NAK.
>>>
>>> Sorry, but this patch breaks USB3503 HUB operation on Arndale5250
>>> board. A brief scan through the code reveals that the whole control
>>> logic for the 'intn' gpio is lost.
>> Well, I've checked further and 'intn' logic is there. The issue with
>> Arndale5250 board is something different. Changing the gpio active
>> values in arch/arm/boot/dts/exynos5250-arndale.dts from GPIO_ACTIVE_LOW
>> to GPIO_ACTIVE_HIGH fixed operation of usb3503 HUB. I really wonder why
>> it worked fine with non-descriptor code and the ACTIVE_LOW DT flags...
>>
>> I'm not sure how to handle this. Old code works also fine with DT flags
>> changed to GPIO_ACTIVE_HIGH, which seems to be a proper value for those
>> gpio lines.
> We should of course fix up the device trees so the polarity in them
> is correct.

Okay. I've checked the driver and dts:

According to the USB3503 datasheet, reset-gpios should be ACTIVE_LOW 
probably for the all boards. The driver itself should be then fixed to 
set reset line to the opposite values: HIGH (ASSERTED) during probe and 
suspend, and LOW (DE-ASSERTED) during normal operation.

With the above assumptions, the following DTS should be fixed:

arch/arm/boot/dts/exynos4412-odroid-common.dtsi: invert RESET gpio 
polarity (to ACTIVE_LOW)

arch/arm/boot/dts/exynos5250-arndale.dts: invert CONNECT gpio polarity 
(to ACTIVE_HIGH)

arch/arm/boot/dts/exynos5410-odroidxu.dts: invert RESET gpio polarity 
(to ACTIVE_LOW)

arch/arm/boot/dts/qcom-mdm9615-wp8548-mangoh-green.dts: invert RESET 
gpio polarity (to ACTIVE_LOW), not sure about INTN gpio

arch/arm/boot/dts/sun8i-a83t-cubietruck-plus.dts: invert RESET gpio 
polarity (to ACTIVE_LOW)

I've tested such changes with your patch on Odroid X2, U3, XU and 
Arndale boards - USB3503 worked fine.

I can prepare patchset with the above changes (dts and the driver logic).

> If the compatibility with elder device trees is mandatory I will make
> a quirk into the gpiolib-of.c that enforce active high on this specific
> GPIO line. This is pretty straight-forward, I can just use the compatible
> of the board and usb3503 in combination to enforce it.

Frankly, I don't care about compatibility with old dtbs. It is already 
broken by other changes in the bindings.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


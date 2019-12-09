Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D3731171D8
	for <lists+linux-usb@lfdr.de>; Mon,  9 Dec 2019 17:33:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727063AbfLIQdj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 Dec 2019 11:33:39 -0500
Received: from mailout2.w1.samsung.com ([210.118.77.12]:59304 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726532AbfLIQdi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 9 Dec 2019 11:33:38 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20191209163335euoutp02d3e05a5691af3ffe265f9178d14cf2af~ewRUVwiA_2742027420euoutp026
        for <linux-usb@vger.kernel.org>; Mon,  9 Dec 2019 16:33:35 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20191209163335euoutp02d3e05a5691af3ffe265f9178d14cf2af~ewRUVwiA_2742027420euoutp026
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1575909215;
        bh=DyGQrdSddK1IOZ5nAiM1nEd4bz27yRjPhWkBl04617Y=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=rR9QhKoRuM4+A7z/mIMnqdgsXMwEx3+SyjLKciH8T8+WB/O/+GEY/c0v//pI3i0WT
         8r3W8a4dBNmM/MHoIpyFAwPpJUS1vySLIIJIhP/Z7E8wW6587shYT9e8IYAnSD9kj+
         yWub965tm1XWszqufcF8MCvgrdG4g0bxT3qyskn0=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20191209163335eucas1p14695adc620beba90e6256a9ae50a9a9b~ewRUKoKVU0473004730eucas1p1r;
        Mon,  9 Dec 2019 16:33:35 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 42.31.60679.F577EED5; Mon,  9
        Dec 2019 16:33:35 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20191209163335eucas1p29d4d373272157f1ebb7d0fb5ce20a43b~ewRT0al2N0393103931eucas1p2Y;
        Mon,  9 Dec 2019 16:33:35 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20191209163335eusmtrp1c930a5a62ccdc79e9a9a38dbbaac9904~ewRTzyQSD2189121891eusmtrp16;
        Mon,  9 Dec 2019 16:33:35 +0000 (GMT)
X-AuditID: cbfec7f4-0e5ff7000001ed07-53-5dee775fe343
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 38.C5.08375.F577EED5; Mon,  9
        Dec 2019 16:33:35 +0000 (GMT)
Received: from [106.120.51.15] (unknown [106.120.51.15]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20191209163334eusmtip252cee99b05dcdba348cf9eb901370595~ewRTZQTLG1708017080eusmtip2V;
        Mon,  9 Dec 2019 16:33:34 +0000 (GMT)
Subject: Re: [PATCH] usb: usb3503: Convert to use GPIO descriptors
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb <linux-usb@vger.kernel.org>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Stefan Agner <stefan@agner.ch>,
        Krzysztof Kozlowski <krzk@kernel.org>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <bb1432d3-1fee-9c3d-0ae1-af305deed636@samsung.com>
Date:   Mon, 9 Dec 2019 17:33:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
        Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <CACRpkdZBOFXxm_n+A+Oz=MubkSTKG7aUX+9jonB5vm+_XPK_DA@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrNKsWRmVeSWpSXmKPExsWy7djP87rx5e9iDZ51aVm075vLYtG8eD2b
        xfnzG9gtpvxZzmSxaFkrs8Xmde3sDmwei7/fY/bYtKqTzePOtT1sHvvnrmH3aDm5n8Xj8ya5
        ALYoLpuU1JzMstQifbsEroy+wzNZCx5xVqzZ84mpgfElexcjJ4eEgInE5EWvWbsYuTiEBFYw
        SnT/es0E4XxhlLi95R1U5jOjxKnlt1lhWj4eOsoIkVjOKPH6Qhs7hPOWUWL+nQNsIFXCAk4S
        H2bPYQGxRQR0JLq3/QQbxSxwnlFi7d9DYKPYBAwlut52gTXwCthJHLjQAWazCKhIzF10GmgF
        B4eoQKxEx/IMiBJBiZMzn4DN5BQIlGiftpsZxGYWkJfY/nYOlC0ucevJfLAfJAQ2sUtsOjsJ
        bI6EgIvE8T5ViA+EJV4d3wINABmJ05N7WCDqmxklHp5byw7h9DBKXG6awQhRZS1x+PhFVpBB
        zAKaEut36UOEHSWm9d6Hms8nceOtIMQNfBKTtk1nhgjzSnS0CUFUq0nMOr4Obu3BC5eYJzAq
        zULy2Swk38xC8s0shL0LGFlWMYqnlhbnpqcWG+WllusVJ+YWl+al6yXn525iBCah0/+Of9nB
        uOtP0iFGAQ5GJR7eBQ7vYoVYE8uKK3MPMUpwMCuJ8C6Z+CpWiDclsbIqtSg/vqg0J7X4EKM0
        B4uSOK/xopexQgLpiSWp2ampBalFMFkmDk6pBsaM/2XFLeq/Ww8VFRqxXjsqr3PUKoNVOr70
        EcO0pPKSHVe9VoodYv+0ZgvH5ekPrmou6zijGjXnSmOjjP6ZHK0jDa6nm3kSi5cm36xn/nni
        4FvFKYbvI3R+vjkn4bmQ+9l0nYon/FPOFdRv1Ne5smJj0kmhFWJ8oiYchyZvahXzz7ZQSFTe
        ba3EUpyRaKjFXFScCACPriwBPgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrPIsWRmVeSWpSXmKPExsVy+t/xe7rx5e9iDW495Ldo3zeXxaJ58Xo2
        i/PnN7BbTPmznMli0bJWZovN69rZHdg8Fn+/x+yxaVUnm8eda3vYPPbPXcPu0XJyP4vH501y
        AWxRejZF+aUlqQoZ+cUltkrRhhZGeoaWFnpGJpZ6hsbmsVZGpkr6djYpqTmZZalF+nYJehl9
        h2eyFjzirFiz5xNTA+NL9i5GTg4JAROJj4eOMnYxcnEICSxllJj84QUjREJG4uS0BlYIW1ji
        z7UuNoii14wSzx/sZgZJCAs4SXyYPYcFxBYR0JHo3vaTFaSIWeAio8SJM+2sEB37mSU2H3wH
        1sEmYCjR9RZkFCcHr4CdxIELHWA2i4CKxNxFp8FWiwrESnxf+YkRokZQ4uTMJ2AbOAUCJdqn
        QWxmFjCTmLf5IZQtL7H97RwoW1zi1pP5TBMYhWYhaZ+FpGUWkpZZSFoWMLKsYhRJLS3OTc8t
        NtQrTswtLs1L10vOz93ECIy8bcd+bt7BeGlj8CFGAQ5GJR7eBQ7vYoVYE8uKK3MPMUpwMCuJ
        8C6Z+CpWiDclsbIqtSg/vqg0J7X4EKMp0HMTmaVEk/OBSSGvJN7Q1NDcwtLQ3Njc2MxCSZy3
        Q+BgjJBAemJJanZqakFqEUwfEwenVANjc3HW1ETdwyoR/Z/afknuO/o/jnmO6ruzcdVaIvuF
        FvQ8StzUXqLHevF97LoblZUXjvHIx5S8qV/jKXr667RjUf0VAb1SWw/qVcbpT9lgqe//OUm8
        KbamfWXV1HU7s5acO93DViwXp7L9tebmhyvV9mVectr1MESn6kWj1DHLde168x7oPRdRYinO
        SDTUYi4qTgQAQ7MZzNICAAA=
X-CMS-MailID: 20191209163335eucas1p29d4d373272157f1ebb7d0fb5ce20a43b
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
        <402598f1-3230-c48f-c1c0-feda19cb2261@samsung.com>
        <CACRpkdZBOFXxm_n+A+Oz=MubkSTKG7aUX+9jonB5vm+_XPK_DA@mail.gmail.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Linus,

On 06.12.2019 14:43, Linus Walleij wrote:
> On Fri, Dec 6, 2019 at 12:43 PM Marek Szyprowski
> <m.szyprowski@samsung.com> wrote:
>
>> arch/arm/boot/dts/qcom-mdm9615-wp8548-mangoh-green.dts: invert RESET
>> gpio polarity (to ACTIVE_LOW), not sure about INTN gpio
> AFAICT INTN should be set to ACTIVE_HIGH if it is working with the
> current code in the kernel.
>
> However it is pretty confusing with the "N" at the end of INTN,
> indicating negative polarity. Maybe it means something else,
> I haven't checked the datasheet. Maybe all boards have inverters
> on these lines so they come out active high.

Well, this line is indeed active low. The datasheet names it 'int_n'. 
However I think it makes sense to keep it as ACTIVE_HIGH, because the 
'n' is already in the gpio name (and dt binding). In contrary, the reset 
gpio pin/binding is named without the 'n', thus I want to clarify it as 
active low. The datasheet names it 'reset_n'.

If you are okay with this approach, I will send a patchset fixing 
polarity in DTS together with your patch converting the driver to gpio 
descriptors with the fixup for the reset gpio polarity.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


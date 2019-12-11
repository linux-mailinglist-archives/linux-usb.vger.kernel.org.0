Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5262111A632
	for <lists+linux-usb@lfdr.de>; Wed, 11 Dec 2019 09:48:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728027AbfLKIsx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 Dec 2019 03:48:53 -0500
Received: from mailout2.w1.samsung.com ([210.118.77.12]:55458 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727888AbfLKIsx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 11 Dec 2019 03:48:53 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20191211084848euoutp02b073dbcbbd12c2b5375a553c432168fb~fROEvSCxJ3098930989euoutp026
        for <linux-usb@vger.kernel.org>; Wed, 11 Dec 2019 08:48:48 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20191211084848euoutp02b073dbcbbd12c2b5375a553c432168fb~fROEvSCxJ3098930989euoutp026
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1576054128;
        bh=bEyz5GNemnNf3yhuE1MEyqZcKfKypJgqirB3YswW9ks=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=K9aVEUsGqF1yP+77TZzr6nCIzY/f9A5QKLhp1phSZ93ifyVBrptjidu8yXYi0zMBi
         wqI3xyuu2O7bvdE3Xq4hWMR5wboBivDEk9kzzkX8aG9Xrukcxgj9q4brm2Z6VaNNiV
         TOsuOaLWp89lVAU6lVAQgRn7EXQ7Qg0O2fMfGNcg=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20191211084848eucas1p19acc317b4a358c6a4a118f0107c74fb2~fROEUzZcw2958929589eucas1p1v;
        Wed, 11 Dec 2019 08:48:48 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 04.C0.60679.F6DA0FD5; Wed, 11
        Dec 2019 08:48:47 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20191211084847eucas1p2efc65c6823ee42e3edf3cf4e65dc1f19~fROD5DmCh2392723927eucas1p2M;
        Wed, 11 Dec 2019 08:48:47 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20191211084847eusmtrp13ecb665491dc46f6be3244441c8745ba~fROD4c8Rb1532615326eusmtrp1c;
        Wed, 11 Dec 2019 08:48:47 +0000 (GMT)
X-AuditID: cbfec7f4-0cbff7000001ed07-b8-5df0ad6f67f4
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 2A.E6.07950.F6DA0FD5; Wed, 11
        Dec 2019 08:48:47 +0000 (GMT)
Received: from [106.120.51.15] (unknown [106.120.51.15]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20191211084847eusmtip11825d09c1ede12d168804ba229d223b7~fRODgRWLd0422004220eusmtip1t;
        Wed, 11 Dec 2019 08:48:47 +0000 (GMT)
Subject: Re: [PATCH] usb: usb3503: Convert to use GPIO descriptors
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb <linux-usb@vger.kernel.org>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Stefan Agner <stefan@agner.ch>,
        Krzysztof Kozlowski <krzk@kernel.org>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <cbeaedc6-2753-c4b1-5477-364b1613a697@samsung.com>
Date:   Wed, 11 Dec 2019 09:48:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
        Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <CACRpkdbPpxY2s8fqNuoYcrQUY1TJXmy__qbJ6nbw4XYrqtNHNQ@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01SbUhTYRjl3b27u45N3qbhg0nposhl86tooGlZP9a/oigMVq28TNNtsquW
        9iNLU9tmaJra1DSFZn43Q8NMa0VDLM2PVCItS4KKmaIUklbOq+W/c55zno8DD01I6vjedJwu
        iTHo1AlSSki2vpjv3aFvmFYFddjCFdmd5aQio7qJUvT1NQsUhQtWnqLq7lVC0dKYLdhLKat/
        jhNKW+01SvluuINSdpXXC5SZ3V2kcta28RB1QhgewyTEpTCGwIjTwtj8+oDEAdGFHmMxkY7y
        hUbkRgPeCaNdv5ARCWkJrkFgyiugODKH4HrxfQFHZhE8r3aQqy3dd26uCFYE5semFeJE0Dpt
        E7hcHjgKpkvLljs8cQCYWuf5LhOB+xA0LNr5LoHCwWB0GikXFuMIsIxcJlyYxFtgyJy5NIim
        12MV5FhjOcs66L41uTzTDR+GuuaxZTuBN0Gbs2wFe8HbyQqeaxdgmwByHZ0Ud/YBsH98xeOw
        B3x1PBBw2Ad6Cswk15CBYKK3QcARM4LBKyWIc4XBM0c/33URgf2hqT2QK++Dotz3yFUG7A6j
        znXcEe5wo7WY4MpiyMmScO6tYHE0/lv79PUAkYekljXRLGviWNbEsfzfW4nIWuTFJLNaDcOG
        6JjzclatZZN1GvlZvdaGll6o57dj7iFqXzhjR5hGUpG4su27SsJXp7CpWjsCmpB6ih1ZUyqJ
        OEadmsYY9KcMyQkMa0cbaFLqJQ6t+qKSYI06iYlnmETGsKryaDfvdOSfFl0/s+eNz+DBD4qA
        sVKZ5rNvxpHOe304NDrDOuKXNCJKq51Z0Fvpk35Riepzu/Psw5GjQyL2ifucSladVDF+ycj0
        F/14JC6QbY6aEuKmxZfJbQFtvEKRr19Q77GayOMTgTKTz+39OdtD5NuGwBR2sfxPS4l+1ze5
        8Oin+HApycaqg2WEgVX/BWa1xzg+AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrHIsWRmVeSWpSXmKPExsVy+t/xu7r5az/EGvz7qmLRvm8ui0Xz4vVs
        FufPb2C3mPJnOZPFomWtzBab17WzO7B5LP5+j9lj06pONo871/aweeyfu4bdo+XkfhaPz5vk
        Atii9GyK8ktLUhUy8otLbJWiDS2M9AwtLfSMTCz1DI3NY62MTJX07WxSUnMyy1KL9O0S9DIm
        rtEpuMRTcbprOnMD40SuLkZODgkBE4mTC6eydzFycQgJLGWUaN/dwAaRkJE4Oa2BFcIWlvhz
        rYsNoug1o8SuAyvBioQFnCQ+zJ7DAmKLCOhIdG/7yQpSxCxwkVHixJl2VoiO3SwSmz9dAati
        EzCU6HrbBdbNK2AnMet6IzOIzSKgKnGlp4UdxBYViJX4vvITI0SNoMTJmU/AejkFAiVWb7gL
        Vs8sYCYxb/NDKFteYvvbOVC2uMStJ/OZJjAKzULSPgtJyywkLbOQtCxgZFnFKJJaWpybnlts
        pFecmFtcmpeul5yfu4kRGHfbjv3csoOx613wIUYBDkYlHt4F29/HCrEmlhVX5h5ilOBgVhLh
        Pd72LlaINyWxsiq1KD++qDQntfgQoynQcxOZpUST84EpIa8k3tDU0NzC0tDc2NzYzEJJnLdD
        4GCMkEB6YklqdmpqQWoRTB8TB6dUA6P0xpWPlBgPzk9PmmNx40toGZtQ7g+n536bdc4o/629
        Z2+ft2OqwU+ubaV1xaWBE+UZZCaWO5w8kPpr2ZslUx9IxbyMOKhnl8PDzFISLHKiveDGd+V5
        mge5ZirMetFi/5hTvqz/86X9v2YK7fHIXW55p+DKOt6XE3yvWc3sPhNat/yP5eJw3XYlluKM
        REMt5qLiRAAuxCFN0QIAAA==
X-CMS-MailID: 20191211084847eucas1p2efc65c6823ee42e3edf3cf4e65dc1f19
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
        <bb1432d3-1fee-9c3d-0ae1-af305deed636@samsung.com>
        <CACRpkdbPpxY2s8fqNuoYcrQUY1TJXmy__qbJ6nbw4XYrqtNHNQ@mail.gmail.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Linus,

On 11.12.2019 00:13, Linus Walleij wrote:
> On Mon, Dec 9, 2019 at 5:33 PM Marek Szyprowski
> <m.szyprowski@samsung.com> wrote:
>> On 06.12.2019 14:43, Linus Walleij wrote:
>>> On Fri, Dec 6, 2019 at 12:43 PM Marek Szyprowski
>>> <m.szyprowski@samsung.com> wrote:
>>>
>>>> arch/arm/boot/dts/qcom-mdm9615-wp8548-mangoh-green.dts: invert RESET
>>>> gpio polarity (to ACTIVE_LOW), not sure about INTN gpio
>>> AFAICT INTN should be set to ACTIVE_HIGH if it is working with the
>>> current code in the kernel.
>>>
>>> However it is pretty confusing with the "N" at the end of INTN,
>>> indicating negative polarity. Maybe it means something else,
>>> I haven't checked the datasheet. Maybe all boards have inverters
>>> on these lines so they come out active high.
>> Well, this line is indeed active low. The datasheet names it 'int_n'.
>> However I think it makes sense to keep it as ACTIVE_HIGH, because the
>> 'n' is already in the gpio name (and dt binding). In contrary, the reset
>> gpio pin/binding is named without the 'n', thus I want to clarify it as
>> active low. The datasheet names it 'reset_n'.
> Agreed.
>
>> If you are okay with this approach, I will send a patchset fixing
>> polarity in DTS together with your patch converting the driver to gpio
>> descriptors with the fixup for the reset gpio polarity.
> Yes this approach should work, will you fold in fixes to my
> patch (like asserting reset high) as well or do you want me
> to send a v2?

I will fold a fixup for your patch.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


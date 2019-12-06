Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 39DFD11500E
	for <lists+linux-usb@lfdr.de>; Fri,  6 Dec 2019 12:53:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726160AbfLFLxD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 6 Dec 2019 06:53:03 -0500
Received: from mailout1.w1.samsung.com ([210.118.77.11]:40068 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726116AbfLFLxD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 6 Dec 2019 06:53:03 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20191206115301euoutp01fc82c3fae597b43d9c3573a9b4c9f318~dxgfIXPym0370503705euoutp01T
        for <linux-usb@vger.kernel.org>; Fri,  6 Dec 2019 11:53:01 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20191206115301euoutp01fc82c3fae597b43d9c3573a9b4c9f318~dxgfIXPym0370503705euoutp01T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1575633181;
        bh=fKEEf+12lAfzOO80ywBApiNlFWiLShA0Y5flC2sl1Nk=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=gnlNnNjPrPUhNCK1IAjTQ0psH/ngucnE1VPOAL0qcfFkhaKPQwfQaxRlTJ0Cj3gw1
         l17BKv6kyfrLpGk6ukCZKg/QhVkF1kWyprq4dtGX9dWoOItlhozi9T8pvKIDADbGam
         MpNUlb2918J5pAAs8q44K96lkLU8bpbTY6yXjKVE=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20191206115300eucas1p1fc1abecc2dda40602c03f935fa1134d9~dxgewPtR90558605586eucas1p1S;
        Fri,  6 Dec 2019 11:53:00 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id FE.D0.60679.C114AED5; Fri,  6
        Dec 2019 11:53:00 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20191206115300eucas1p24f7209c7194d97d56e248a0162576e2a~dxgeVv3291453614536eucas1p2N;
        Fri,  6 Dec 2019 11:53:00 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20191206115300eusmtrp1853e2f0bfbc783a29d0df426a0cf8e4e~dxgeVP-Ft1648116481eusmtrp11;
        Fri,  6 Dec 2019 11:53:00 +0000 (GMT)
X-AuditID: cbfec7f4-0e5ff7000001ed07-c7-5dea411cb532
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id C7.70.08375.C114AED5; Fri,  6
        Dec 2019 11:53:00 +0000 (GMT)
Received: from [106.120.51.15] (unknown [106.120.51.15]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20191206115300eusmtip13a089f0d6cca922700bb55708a2188a3~dxgd-SNVw0526305263eusmtip1T;
        Fri,  6 Dec 2019 11:53:00 +0000 (GMT)
Subject: Re: [PATCH] usb: usb3503: Convert to use GPIO descriptors
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb <linux-usb@vger.kernel.org>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Stefan Agner <stefan@agner.ch>,
        Krzysztof Kozlowski <krzk@kernel.org>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <cc924d9c-d8b2-d14e-f758-556551557e5d@samsung.com>
Date:   Fri, 6 Dec 2019 12:52:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
        Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <CACRpkdZmPN-3_+VgBcrC_DczT4HzBWAg6tDa1hd=yAktnpYPdA@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrDKsWRmVeSWpSXmKPExsWy7djPc7oyjq9iDU78tLBo3zeXxaJ58Xo2
        i/PnN7BbTPmznMli0bJWZovN69rZHdg8Fn+/x+yxaVUnm8eda3vYPPbPXcPu0XJyP4vH501y
        AWxRXDYpqTmZZalF+nYJXBnr/h1jKnjDUrHjwWaWBsYXzF2MnBwSAiYSty8vY+ti5OIQEljB
        KPH4wxNGCOcLo8SjxdtYIZzPjBLtu3eyw7ScOd3PDJFYzijRu28qVMtbRomX7WvABgsLOEl8
        mD2HBcQWEdCR6N72E2wUs8B5Rom1fw+xgiTYBAwlut52sYHYvAJ2Euv3XwRbwSKgItE9bwVQ
        MweHqECsRMfyDIgSQYmTM5+AzeQUCJT4+eU7mM0sIC+x/e0cZghbXOLWk/lMILskBDaxS3Ru
        7IX61EXizpr/TBC2sMSr41ug3pGROD25hwWioZlR4uG5tewQTg+jxOWmGYwQVdYSh49fZAW5
        iFlAU2L9Ln2IsKPEtN77jCBhCQE+iRtvBSGO4JOYtG06M0SYV6KjTQiiWk1i1vF1cGsPXrjE
        PIFRaRaS12YheWcWkndmIexdwMiyilE8tbQ4Nz212CgvtVyvODG3uDQvXS85P3cTIzANnf53
        /MsOxl1/kg4xCnAwKvHwzvj8IlaINbGsuDL3EKMEB7OSCG8638tYId6UxMqq1KL8+KLSnNTi
        Q4zSHCxK4rzGi4BSAumJJanZqakFqUUwWSYOTqkGRoN74cvO9iqGeDhUnZwcXzxDTy6ufjHn
        hYQa6T2r2hZKp+6PlHRdd8/sr9rB3X1Mhy+xLJ+1XWppmUHEx0nSYtbl/Gs87l1aES1Scab1
        T0X/0QNJsbcfrT5lJCqW9kni3LLb6haHg7J9ftWw/dj8rcF8etLxWfymuaJ1/opWC4Mn3fmV
        LO96VomlOCPRUIu5qDgRANjCrQg/AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrHIsWRmVeSWpSXmKPExsVy+t/xu7oyjq9iDTZ3yVm075vLYtG8eD2b
        xfnzG9gtpvxZzmSxaFkrs8Xmde3sDmwei7/fY/bYtKqTzePOtT1sHvvnrmH3aDm5n8Xj8ya5
        ALYoPZui/NKSVIWM/OISW6VoQwsjPUNLCz0jE0s9Q2PzWCsjUyV9O5uU1JzMstQifbsEvYx1
        /44xFbxhqdjxYDNLA+ML5i5GTg4JAROJM6f7gWwuDiGBpYwSXd/7GCESMhInpzWwQtjCEn+u
        dbGB2EICrxkltm/KB7GFBZwkPsyewwJiiwjoSHRv+8kKMohZ4CKjxIkz7awQUw8zSTze0McO
        UsUmYCjR9RZiEq+AncT6/RfB4iwCKhLd81aATRIViJX4vvITI0SNoMTJmU/A4pwCgRI/v3wH
        s5kFzCTmbX7IDGHLS2x/OwfKFpe49WQ+0wRGoVlI2mchaZmFpGUWkpYFjCyrGEVSS4tz03OL
        DfWKE3OLS/PS9ZLzczcxAuNu27Gfm3cwXtoYfIhRgINRiYd3xucXsUKsiWXFlbmHGCU4mJVE
        eNP5XsYK8aYkVlalFuXHF5XmpBYfYjQFem4is5Rocj4wJeSVxBuaGppbWBqaG5sbm1koifN2
        CByMERJITyxJzU5NLUgtgulj4uCUamBke2kh4HJJsufJ3yWXXxrXby42/DTR07TZaneC1+PH
        5+rOhWoIb3Th6edbruhuNPEnl29XTbNcwVLflSFniq6sdnp1M26VWev9DPtjP4v8ec8m5pbf
        u/xiFStLdWTerYr5z37uy7p1bX9T+LEzG/wVQzSDV3DHPYlaxyljkRPl/XyR23wJx2glluKM
        REMt5qLiRABuRNMF0QIAAA==
X-CMS-MailID: 20191206115300eucas1p24f7209c7194d97d56e248a0162576e2a
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
        <CACRpkdZmPN-3_+VgBcrC_DczT4HzBWAg6tDa1hd=yAktnpYPdA@mail.gmail.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Linus,

On 06.12.2019 10:58, Linus Walleij wrote:
> On Fri, Dec 6, 2019 at 10:14 AM Marek Szyprowski
> <m.szyprowski@samsung.com> wrote:
>
> BTW:
>
>> I really wonder why
>> it worked fine with non-descriptor code and the ACTIVE_LOW DT flags...
> The old code ignored the polarity flags in the device tree and
> assumed everything was active high, that's how. It could as well
> be hardcoded to 1337.

Okay, then to restore current driver behavior after your patch, one has 
to change gpio flags in all dts to ACTIVE_HIGH...

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


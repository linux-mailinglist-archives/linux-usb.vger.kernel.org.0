Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A209E14796E
	for <lists+linux-usb@lfdr.de>; Fri, 24 Jan 2020 09:30:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729847AbgAXIaU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 Jan 2020 03:30:20 -0500
Received: from mailout2.w1.samsung.com ([210.118.77.12]:50181 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725843AbgAXIaU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 24 Jan 2020 03:30:20 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20200124083018euoutp029763039fdf1fe71f4b4b505652791b25~sxWfN1-ry0392803928euoutp02M
        for <linux-usb@vger.kernel.org>; Fri, 24 Jan 2020 08:30:18 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20200124083018euoutp029763039fdf1fe71f4b4b505652791b25~sxWfN1-ry0392803928euoutp02M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1579854618;
        bh=wzIWvgFGP+ht/NOzBW6vuBTOwQE5T02OF1/HFutZz8Y=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=qvNYXFvmh4n++82MHy6o8ugiDbqCfz/V7CvK5+Vf/iU0TAVXaYSSjCnyJagUErRXO
         Hd9fwzK1C6F02bSg39VcvOrze1k+cG8rTXnBnecnCzwOKkF8sWZXZ6b6eYJ54mcgXf
         1XxVrH3w+yutZjEGLM+3D0k0wH78ERPi17u0oasc=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200124083018eucas1p17d1f572c0c7d5a1c9c6d1bbeddd88cbb~sxWfEnk4m0116701167eucas1p17;
        Fri, 24 Jan 2020 08:30:18 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id E6.2D.60679.A1BAA2E5; Fri, 24
        Jan 2020 08:30:18 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20200124083018eucas1p1a9eddf05ef548d3ce267a89b4f0fc58a~sxWep13IX0118701187eucas1p11;
        Fri, 24 Jan 2020 08:30:18 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200124083018eusmtrp2b183d636ab0333ab94c8b9bb1a653d02~sxWepO_OX2540125401eusmtrp2Z;
        Fri, 24 Jan 2020 08:30:18 +0000 (GMT)
X-AuditID: cbfec7f4-0e5ff7000001ed07-0f-5e2aab1a9157
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 73.06.08375.A1BAA2E5; Fri, 24
        Jan 2020 08:30:18 +0000 (GMT)
Received: from [106.120.51.15] (unknown [106.120.51.15]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200124083017eusmtip21925516da8144e1252571c69d6b57a74~sxWeTcGJb0457304573eusmtip2G;
        Fri, 24 Jan 2020 08:30:17 +0000 (GMT)
Subject: Re: [PATCH] usb: misc: usb3503: Use gpio descriptor interface
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     =?UTF-8?Q?Pavel_L=c3=b6bl?= <pavel@loebl.cz>,
        linux-usb@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <543d4ba9-a4f0-8db9-28a8-55dffc18092b@samsung.com>
Date:   Fri, 24 Jan 2020 09:30:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
        Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200124082232.GA2921425@kroah.com>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprKKsWRmVeSWpSXmKPExsWy7djP87pSq7XiDPY81bVoXryezWLKn+VM
        FouWtTJbLJnzgdWBxePOtT1sHvvnrmH3aO2exubxeZNcAEsUl01Kak5mWWqRvl0CV8a5CYdY
        C96zVfR9nsvSwHiDtYuRg0NCwETiw7ziLkYuDiGBFYwS+38eZYVwvjBKXHlyj6WLkRPI+cwo
        seeXAUzDvUYviJrljBI927uZIZy3jBIHL25nBmkQFnCTmHDrECOILSKgIfHy6C2wQcwC5RK7
        2/4ygdhsAoYSXW+72EBsXgE7iTN9z8DiLAKqEt8Od4DZogKxEvdXT2WEqBGUODnzCdgcTqDe
        4xseMkPMlJdo3jobyhaXuPVkPhPIQRIC3ewSl/41sYIkJARcJM6fn8wIYQtLvDq+hR3ClpH4
        vxOmoZlR4uG5tewQTg+jxOWmGVAd1hJ3zv1iA/mfWUBTYv0ufYiwo0TDog5mSLDwSdx4Kwhx
        BJ/EpG3TocK8Eh1tQhDVahKzjq+DW3vwwiXmCYxKs5C8NgvJO7OQvDMLYe8CRpZVjOKppcW5
        6anFRnmp5XrFibnFpXnpesn5uZsYgYnl9L/jX3Yw7vqTdIhRgINRiYdXolczTog1say4MvcQ
        owQHs5IIL2MYUIg3JbGyKrUoP76oNCe1+BCjNAeLkjiv8aKXsUIC6YklqdmpqQWpRTBZJg5O
        qQbGVfx2Cmqvwi5PWB2ktfWInfOlt3tX7Dg/Ndvh8b5OT4tVs/4tCe9cktQ/I6nQy+n27hmG
        0slT/7MtO+Nsx9rjlHDa3M1NVymySiQmY+mM47PX7S2qfeV+Q/lUwjYfy/TJ6lctPxrEOrGf
        mNlYzTzdqZ/nwhuVXeXLVr1f+qW4TVbw0UnJ+1xnlViKMxINtZiLihMBvQPOJSgDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrBIsWRmVeSWpSXmKPExsVy+t/xe7pSq7XiDJa95LNoXryezWLKn+VM
        FouWtTJbLJnzgdWBxePOtT1sHvvnrmH3aO2exubxeZNcAEuUnk1RfmlJqkJGfnGJrVK0oYWR
        nqGlhZ6RiaWeobF5rJWRqZK+nU1Kak5mWWqRvl2CXsa5CYdYC96zVfR9nsvSwHiDtYuRg0NC
        wETiXqNXFyMnh5DAUkaJBd1iILaEgIzEyWkNrBC2sMSfa11sXYxcQDWvGSVafy9lBEkIC7hJ
        TLh1CMwWEdCQeHn0FguIzSxQLtG0ZBUzRMMTRolzd5aAJdgEDCW63oJM4uTgFbCTONP3jAnE
        ZhFQlfh2uAPMFhWIlfh/5hpUjaDEyZlPwHo5gXqPb3jIDLHATGLeZhhbXqJ562woW1zi1pP5
        TBMYhWYhaZ+FpGUWkpZZSFoWMLKsYhRJLS3OTc8tNtQrTswtLs1L10vOz93ECIylbcd+bt7B
        eGlj8CFGAQ5GJR5eiV7NOCHWxLLiytxDjBIczEoivIxhQCHelMTKqtSi/Pii0pzU4kOMpkDP
        TWSWEk3OB8Z5Xkm8oamhuYWlobmxubGZhZI4b4fAwRghgfTEktTs1NSC1CKYPiYOTqkGxta/
        k3ftts6XfJNRtzBs8dIiGQ61VTw27RXRXp6yU2dfrU8+sGuayQxmWZ5Q52slbnb8sTZB/hkC
        DH7qPc+dVZv6vN+di/v6R3edrcqM8g3XXyzPYdvKN+HCitNb+edzCBx71z7nqErk3+WKkw1T
        HdWD2HWfsjQmKRv77rzT9tfT6P6kc0VcSizFGYmGWsxFxYkA/HYcrbsCAAA=
X-CMS-MailID: 20200124083018eucas1p1a9eddf05ef548d3ce267a89b4f0fc58a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200123144414eucas1p220590ff849a8d9e534ab6aa3cf5ade28
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200123144414eucas1p220590ff849a8d9e534ab6aa3cf5ade28
References: <CGME20200123144414eucas1p220590ff849a8d9e534ab6aa3cf5ade28@eucas1p2.samsung.com>
        <20200123144231.284762-1-pavel@loebl.cz>
        <4c850344-192a-00c5-9789-fd666d1587b1@samsung.com>
        <20200124082232.GA2921425@kroah.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

On 24.01.2020 09:22, Greg KH wrote:
> On Fri, Jan 24, 2020 at 07:33:36AM +0100, Marek Szyprowski wrote:
>> On 23.01.2020 15:42, Pavel Löbl wrote:
>>> Move gpio related code to descriptor-based interface. This makes
>>> driver to respect active physical level as specified in DT. Existing
>>> DT nodes are adjusted to reflect the former behaviour.
>>>
>>> Signed-off-by: Pavel Löbl <pavel@loebl.cz>
>> This is a duplicate of https://patchwork.kernel.org/cover/11285261/
>> which has been already applied to current linux-next.
> With the exception fof the dts changes :(

DTS changes has been merged via respective arm-soc trees, see commits:

c2f59e8180c9311108872dba582b1b0146acb054

1c226017d3ec93547b58082bdf778d9db7401c95

5206265f78e4e313bc982e289248a239cb3409e2


Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


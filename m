Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84B2A5A0979
	for <lists+linux-usb@lfdr.de>; Thu, 25 Aug 2022 09:07:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233743AbiHYHHn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 25 Aug 2022 03:07:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231259AbiHYHHk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 25 Aug 2022 03:07:40 -0400
Received: from mailout1.w1.samsung.com (unknown [210.118.77.11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97D043AB2D
        for <linux-usb@vger.kernel.org>; Thu, 25 Aug 2022 00:07:37 -0700 (PDT)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20220825070732euoutp01e2468ff9d32a35d1c553e9352937f6b5~OhLtQG7Rd1413614136euoutp01Y
        for <linux-usb@vger.kernel.org>; Thu, 25 Aug 2022 07:07:32 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20220825070732euoutp01e2468ff9d32a35d1c553e9352937f6b5~OhLtQG7Rd1413614136euoutp01Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1661411252;
        bh=Oa/KbPaGCw+IS7jioNsy4t14+XnRm2//F/qtrDKVQQs=;
        h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
        b=XWHIFFcF0hslihdaII5BwtQ0GR98tgSNC9xm2XwCYg8RYkNC3Wn0wkqCfKBs/bb9m
         feuZY49Q2czgI2z75QWIxaceO0EN1Gr+uQVBkbaRypl6pLLIfcPZvlDbrurJbSXRZi
         yfZFVH+3aV3VenJbBYqoLo2TAF0eSEXdO96hplRs=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20220825070732eucas1p22ead886c16ae3a692f4edec93f8fbcd6~OhLtINgso2406424064eucas1p2T;
        Thu, 25 Aug 2022 07:07:32 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id B5.A4.29727.4BF17036; Thu, 25
        Aug 2022 08:07:32 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20220825070732eucas1p145ccef8b3ef705527d0f96c8e970e582~OhLszmHEs2025820258eucas1p1q;
        Thu, 25 Aug 2022 07:07:32 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20220825070732eusmtrp15864206d81a94011a2b00fd96e75a615~OhLsy29ul3166531665eusmtrp17;
        Thu, 25 Aug 2022 07:07:32 +0000 (GMT)
X-AuditID: cbfec7f2-21dff7000001741f-75-63071fb435a1
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 1A.B5.10862.3BF17036; Thu, 25
        Aug 2022 08:07:32 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20220825070731eusmtip2679b4017a248a8900822cb032716c209~OhLsXxkkb2984029840eusmtip26;
        Thu, 25 Aug 2022 07:07:31 +0000 (GMT)
Message-ID: <d6beaa41-1409-3ad6-c972-ff31f4702405@samsung.com>
Date:   Thu, 25 Aug 2022 09:07:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
        Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [PATCH v2] usb: dwc2: fix wrong order of phy_power_on and
 phy_init
Content-Language: en-US
To:     Heiner Kallweit <hkallweit1@gmail.com>,
        Minas Harutyunyan <hminas@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Linux USB Mailing List <linux-usb@vger.kernel.org>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <dfcc6b40-2274-4e86-e73c-5c5e6aa3e046@gmail.com>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphleLIzCtJLcpLzFFi42LZduznOd0t8uzJBi+viVs0L17PZrHo/QxW
        i8Zfe9ktFi1rZbZ4N+U2swOrx85Zd9k99s9dw+6xZf9nRo/Pm+QCWKK4bFJSczLLUov07RK4
        Mk4//s5U0CJY8WDBTaYGxrO8XYycHBICJhJrty5i7GLk4hASWMEoMe/8PCYI5wujxNyWRewQ
        zmdGiQ+zT7DBtPy6u4QFIrGcUeLTtsnMEM5HRol9786wglTxCthJfH+9nhnEZhFQlbj38igb
        RFxQ4uTMJywgtqhAssSz/4vZQWxhgUCJPZebwXqZBcQlbj2ZD3aHiEAbo8SeBbOBGjiAEjkS
        t7vlQGrYBAwlut52gc3kFLCV2LL3JDtEr7zE9rdzmCEuPcEhsfdnLoTtInHlejMThC0s8er4
        FnYIW0bi9OQesPESAvkSf2cYQ4QrJK69XgM1xlrizrlfbBAXaEqs36UPEXaUuHPrEytEJ5/E
        jbeCEAfwSUzaNp0ZIswr0dEmBFGtJjHr+Dq4nQcvXGKewKg0CylIZiF5fRaSV2Yh7F3AyLKK
        UTy1tDg3PbXYMC+1XK84Mbe4NC9dLzk/dxMjMMGc/nf80w7Gua8+6h1iZOJgPMQowcGsJMJr
        dYwlWYg3JbGyKrUoP76oNCe1+BCjNAeLkjhvcuaGRCGB9MSS1OzU1ILUIpgsEwenVANTW7X4
        g0i1JdH6/Eu3ySpm8+j+7j9VW9aZ/vDUw3pnn9/re97a/bA6WnAu7vUF2xnSaw46B7v8fRtt
        +zQ02+jr+u1Kh+sN1Tz0Zvani3fz/LzJd2rTH5NdrA6L7XSY67LDfBWfxFa5+4a4vfZ7U2ia
        f0hVOdrxnPwsvehna1XaZu8pmbkx0TPa+OaRKXsSHCx/OWwsTsx62/d/X/XHl7tYEtk+x0r4
        JPwXl0xemdS1/n3t/FTeLE2LVQv6ttnt0WVfNe2QyiS+iQFZ3Au334o5OiHvWLJwGOPWbI6z
        dzT/ZcyZPW19K8tCZncGbs6iDadWz/J08Fe0FDzwTZX53aGHHZKSr0QmGxudThHivajEUpyR
        aKjFXFScCABsKLK6nwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrMIsWRmVeSWpSXmKPExsVy+t/xe7pb5NmTDU7OYLJoXryezWLR+xms
        Fo2/9rJbLFrWymzxbsptZgdWj52z7rJ77J+7ht1jy/7PjB6fN8kFsETp2RTll5akKmTkF5fY
        KkUbWhjpGVpa6BmZWOoZGpvHWhmZKunb2aSk5mSWpRbp2yXoZZx+/J2poEWw4sGCm0wNjGd5
        uxg5OSQETCR+3V3C0sXIxSEksJRR4sDVj4wQCRmJk9MaWCFsYYk/17rYIIreM0q8vdfNDJLg
        FbCT+P56PZjNIqAqce/lUTaIuKDEyZlPWEBsUYFkiQWHloLZwgKBEnsuN4MNZRYQl7j1ZD4T
        yFARgQ5GiRlX+9kgEjkS+1f+gNo2gVHi3Lp9YN1sAoYSXW+7wIo4BWwltuw9yQ7RYCbRtbWL
        EcKWl9j+dg7zBEahWUgOmYVk4SwkLbOQtCxgZFnFKJJaWpybnltspFecmFtcmpeul5yfu4kR
        GFvbjv3csoNx5auPeocYmTgYDzFKcDArifBaHWNJFuJNSaysSi3Kjy8qzUktPsRoCgyNicxS
        osn5wOjOK4k3NDMwNTQxszQwtTQzVhLn9SzoSBQSSE8sSc1OTS1ILYLpY+LglGpg8lEo/aWz
        20qoa/Hqt9+/PPKyN/rw6tGU73aL5VxNt378x1kV8Hb+pbYfjgf6ml67W9pl2+xZPCO1QGOy
        /OnCpelbfwieZ6mcMUOFuaP/1KfF3h3fL1wRNGyYsXX9y+VMeqqLIjhMfTaFbF99ure3z33P
        NbHLuptuWK82tFp9aG5vzoV/j06460wMe97W3Dnf6Nn/3zvYpp9IZDj0SECms1z07F1H+VCd
        kN+/E802tluX+jaxTdIwTH2VwVWnXDGn3PJJ+/mr/46oS715vXGxmN//quu/j8RYPfeMObG4
        IOSlTe5t7m/7yxusF15znLp4bgDr3/DVn0Imd+Z/OmRmpPGL/UPkvGPRsVK3j+rqT1ZiKc5I
        NNRiLipOBAA44G5rNgMAAA==
X-CMS-MailID: 20220825070732eucas1p145ccef8b3ef705527d0f96c8e970e582
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20220823175856eucas1p2a3a51cb9649cd875f5c9c89e9f84ee72
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20220823175856eucas1p2a3a51cb9649cd875f5c9c89e9f84ee72
References: <CGME20220823175856eucas1p2a3a51cb9649cd875f5c9c89e9f84ee72@eucas1p2.samsung.com>
        <dfcc6b40-2274-4e86-e73c-5c5e6aa3e046@gmail.com>
X-Spam-Status: No, score=-6.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,RDNS_NONE,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 23.08.2022 19:58, Heiner Kallweit wrote:
> Since 1599069a62c6 ("phy: core: Warn when phy_power_on is called before
> phy_init") the driver complains. In my case (Amlogic SoC) the warning
> is: phy phy-fe03e000.phy.2: phy_power_on was called before phy_init
> So change the order of the two calls. The same change has to be done
> to the order of phy_exit() and phy_power_off().
>
> Fixes: 09a75e857790 ("usb: dwc2: refactor common low-level hw code to platform.c")
> Cc: stable@vger.kernel.org
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

I was about to send similar patch some time ago, but I didn't have time 
to check if all PHY drivers that are used by DWC2 would work fine after 
such change. It works fine on Exynos based SoCs though (init/exit 
callbacks are noop in this case), so:

Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>

> ---
> v2:
> - switch the order of phy_power_off() and phy_exit() too
> ---
>   drivers/usb/dwc2/platform.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/usb/dwc2/platform.c b/drivers/usb/dwc2/platform.c
> index c8ba87df7..91febf0e1 100644
> --- a/drivers/usb/dwc2/platform.c
> +++ b/drivers/usb/dwc2/platform.c
> @@ -154,9 +154,9 @@ static int __dwc2_lowlevel_hw_enable(struct dwc2_hsotg *hsotg)
>   	} else if (hsotg->plat && hsotg->plat->phy_init) {
>   		ret = hsotg->plat->phy_init(pdev, hsotg->plat->phy_type);
>   	} else {
> -		ret = phy_power_on(hsotg->phy);
> +		ret = phy_init(hsotg->phy);
>   		if (ret == 0)
> -			ret = phy_init(hsotg->phy);
> +			ret = phy_power_on(hsotg->phy);
>   	}
>   
>   	return ret;
> @@ -188,9 +188,9 @@ static int __dwc2_lowlevel_hw_disable(struct dwc2_hsotg *hsotg)
>   	} else if (hsotg->plat && hsotg->plat->phy_exit) {
>   		ret = hsotg->plat->phy_exit(pdev, hsotg->plat->phy_type);
>   	} else {
> -		ret = phy_exit(hsotg->phy);
> +		ret = phy_power_off(hsotg->phy);
>   		if (ret == 0)
> -			ret = phy_power_off(hsotg->phy);
> +			ret = phy_exit(hsotg->phy);
>   	}
>   	if (ret)
>   		return ret;

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


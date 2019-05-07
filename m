Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB1BE16258
	for <lists+linux-usb@lfdr.de>; Tue,  7 May 2019 12:56:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726642AbfEGKzL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 May 2019 06:55:11 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:43893 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727200AbfEGKyP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 7 May 2019 06:54:15 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20190507105413euoutp014394efe5e339abbae2bfe7960ef97e23~cYTWCfoAY0863608636euoutp01D
        for <linux-usb@vger.kernel.org>; Tue,  7 May 2019 10:54:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20190507105413euoutp014394efe5e339abbae2bfe7960ef97e23~cYTWCfoAY0863608636euoutp01D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1557226453;
        bh=9W6OuaewdZkpfk30RkEcPYHoP0nC0huCNPm4PsSVD4Q=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=Vn7lMm8tVJY7c6/vDm4SoP2nDhcpXen0WuGP5TN9zMgSxQ/wNQjfOZwe7M+f6MjYf
         AU+JrhKcmNWAgf84FyP73f4ELyMXC5tZG3R+KuKxP37F+zQOFk6wiRL7QbUiBmCtoo
         e3re4cCHYoyRGhVEy2CkskSryFmvuiFepIceN7dg=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20190507105412eucas1p1ab15fb1ba532a3608725ed38b383c17d~cYTVZ_IJR2502325023eucas1p1H;
        Tue,  7 May 2019 10:54:12 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 09.91.04298.4D361DC5; Tue,  7
        May 2019 11:54:12 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20190507105411eucas1p28930411f88189db4004c22b7e3de13d9~cYTUhX1Dv0943109431eucas1p2u;
        Tue,  7 May 2019 10:54:11 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20190507105411eusmtrp2f8419432ffd4d0e86eabf80d1589d599~cYTUTa4--0675206752eusmtrp2K;
        Tue,  7 May 2019 10:54:11 +0000 (GMT)
X-AuditID: cbfec7f2-f2dff700000010ca-8a-5cd163d41831
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id CB.E7.04146.3D361DC5; Tue,  7
        May 2019 11:54:11 +0100 (BST)
Received: from [106.120.50.25] (unknown [106.120.50.25]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20190507105411eusmtip1ec57196972d907f4242d222fd3c79046~cYTT9hc4E2266522665eusmtip1p;
        Tue,  7 May 2019 10:54:11 +0000 (GMT)
Subject: Re: [PATCH] usb: dwc2: Use generic PHY width in params setup
To:     Jules Maselbas <jmaselbas@kalray.eu>,
        Minas Harutyunyan <hminas@synopsys.com>
Cc:     Markus Reichl <m.reichl@fivetechno.de>,
        Felipe Balbi <felipe.balbi@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <dac9e8d9-6552-b21e-2991-5f8df11d8439@samsung.com>
Date:   Tue, 7 May 2019 12:54:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
        Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190507100852.11263-2-jmaselbas@kalray.eu>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrCKsWRmVeSWpSXmKPExsWy7djP87pXki/GGLx8qWYx/2aSRfPi9WwW
        jb/2slvMmnGa1WLRslZmi5dHfjA6sHnculPvcXr9TUaPeScDPfbPXcPusWX/Z0aPz5vkAtii
        uGxSUnMyy1KL9O0SuDJmXWUpaBKuaO7qYG1gnMffxcjBISFgIrH7RVYXIxeHkMAKRomdHV9Z
        IJwvjBJH1pxggnA+M0qcal/M2MXICdYx5+cjdojEckaJv/d/sUI4bxklrky/yARSJSzgKtHa
        9owRZIeIQLDE3jk5IDXMIA0Pp71iBalhEzCU6HrbxQZSwytgJzGtSwEkzCKgInFl/hwWkLCo
        QIzEos9sIGFeAUGJkzOfsIDYnAKWEpemrgezmQXkJba/ncMMYYtL3HoyH+xoCYF17BL39qxk
        g3jTReL2T2mI+4UlXh3fwg5hy0j83wlT3wx02rm17BBOD6PE5aYZUB9bSxw+fpEVZBCzgKbE
        +l36EGFHiferm9kh5vNJ3HgrCHEDn8SkbdOZIcK8Eh1tQhDVahKzjq+DW3vwwiXmCYxKs5B8
        NgvJN7OQfDMLYe8CRpZVjOKppcW56anFhnmp5XrFibnFpXnpesn5uZsYgWnn9L/jn3Ywfr2U
        dIhRgINRiYf3hcuFGCHWxLLiytxDjBIczEoivInPzsUI8aYkVlalFuXHF5XmpBYfYpTmYFES
        561meBAtJJCeWJKanZpakFoEk2Xi4JRqYFTq2hyuszSiz/ccJ1MCwxqjTvviBY37LL2ORZrx
        znFYq7b16r7uxZvEi1tebeafvHDKPPcGx8W/9sTlhTkl6+7akVj9z6/kzfEzWu7ZCyfdv8c7
        N+ujUqj1ZPM7Z/cpm2vterwnIvJv71umrtoDii2NSTHKfRPXLHq5uvbkpB7zZ3/vXT78oVqJ
        pTgj0VCLuag4EQA2O8npNwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrJIsWRmVeSWpSXmKPExsVy+t/xu7qXky/GGJxbpm0x/2aSRfPi9WwW
        jb/2slvMmnGa1WLRslZmi5dHfjA6sHnculPvcXr9TUaPeScDPfbPXcPusWX/Z0aPz5vkAtii
        9GyK8ktLUhUy8otLbJWiDS2M9AwtLfSMTCz1DI3NY62MTJX07WxSUnMyy1KL9O0S9DJmXWUp
        aBKuaO7qYG1gnMffxcjJISFgIjHn5yP2LkYuDiGBpYwSUxq6WCASMhInpzWwQtjCEn+udbFB
        FL1mlHg88Rs7SEJYwFWite0ZI4gtIhAscWNyGwtIEbPAckaJ1Wt+gyWEBB4wSvw5B7aOTcBQ
        oustyCQODl4BO4lpXQogYRYBFYkr8+eALRYViJE4MXUL2HxeAUGJkzOfgMU5BSwlLk1dD2Yz
        C5hJzNv8kBnClpfY/nYOlC0ucevJfKYJjEKzkLTPQtIyC0nLLCQtCxhZVjGKpJYW56bnFhvq
        FSfmFpfmpesl5+duYgRG27ZjPzfvYLy0MfgQowAHoxIP7wPbCzFCrIllxZW5hxglOJiVRHgT
        n52LEeJNSaysSi3Kjy8qzUktPsRoCvTcRGYp0eR8YCLIK4k3NDU0t7A0NDc2NzazUBLn7RA4
        GCMkkJ5YkpqdmlqQWgTTx8TBKdXAaBVccfREm2LUhX3+aQt55zSdOel2P+V98adimzPftv/R
        2mWXxLTD+XJWXMRDG51K3ZRLc6Ise1Zkb+fJvR1r1sfNWVD7aRtbzo6ejIkOmvOnq25k9db9
        pJWt52O27lSuyAZFucM825dJfeKwerVeJOXvz0udL3SlfgVYK5nuMPOrSM/82JmlxFKckWio
        xVxUnAgAQO45KswCAAA=
X-CMS-MailID: 20190507105411eucas1p28930411f88189db4004c22b7e3de13d9
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190507100949epcas4p2d0f64a47bbba46bfff3eece00b9bdb3d
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190507100949epcas4p2d0f64a47bbba46bfff3eece00b9bdb3d
References: <20190503204958.GA12532@kozik-lap>
        <20190507100852.11263-1-jmaselbas@kalray.eu>
        <CGME20190507100949epcas4p2d0f64a47bbba46bfff3eece00b9bdb3d@epcas4p2.samsung.com>
        <20190507100852.11263-2-jmaselbas@kalray.eu>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Jules,

On 2019-05-07 12:08, Jules Maselbas wrote:
> Setting params.phy_utmi_width in dwc2_lowlevel_hw_init() is pointless since
> it's value will be overwritten by dwc2_init_params().
>
> This change make sure to take in account the generic PHY width information
> during parmas initialization, done in dwc2_set_param_phy_utmi_width().
>
> By doing so, the phy_utmi_width params can still be overridden by
> devicetree specific params and will also be checked against hardware
> capabilities.
>
> Signed-off-by: Jules Maselbas <jmaselbas@kalray.eu>

Right, this fixes the issue spotten on Exynos4412 SoCs.

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

IMHO it would also make sense to add:

Fixes: 707d80f0a3c5 ("usb: dwc2: gadget: Replace phyif with phy_utmi_width")

> ---
>   drivers/usb/dwc2/params.c   | 9 +++++++++
>   drivers/usb/dwc2/platform.c | 9 ---------
>   2 files changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/usb/dwc2/params.c b/drivers/usb/dwc2/params.c
> index 6900eea57526..5949262ff669 100644
> --- a/drivers/usb/dwc2/params.c
> +++ b/drivers/usb/dwc2/params.c
> @@ -253,6 +253,15 @@ static void dwc2_set_param_phy_utmi_width(struct dwc2_hsotg *hsotg)
>   	val = (hsotg->hw_params.utmi_phy_data_width ==
>   	       GHWCFG4_UTMI_PHY_DATA_WIDTH_8) ? 8 : 16;
>   
> +	if (hsotg->phy) {
> +		/*
> +		 * If using the generic PHY framework, check if the PHY bus
> +		 * width is 8-bit and set the phyif appropriately.
> +		 */
> +		if (phy_get_bus_width(hsotg->phy) == 8)
> +			val = 8;
> +	}
> +
>   	hsotg->params.phy_utmi_width = val;
>   }
>   
> diff --git a/drivers/usb/dwc2/platform.c b/drivers/usb/dwc2/platform.c
> index d10a7f8daec3..e98d7812da2d 100644
> --- a/drivers/usb/dwc2/platform.c
> +++ b/drivers/usb/dwc2/platform.c
> @@ -271,15 +271,6 @@ static int dwc2_lowlevel_hw_init(struct dwc2_hsotg *hsotg)
>   
>   	hsotg->plat = dev_get_platdata(hsotg->dev);
>   
> -	if (hsotg->phy) {
> -		/*
> -		 * If using the generic PHY framework, check if the PHY bus
> -		 * width is 8-bit and set the phyif appropriately.
> -		 */
> -		if (phy_get_bus_width(hsotg->phy) == 8)
> -			hsotg->params.phy_utmi_width = 8;
> -	}
> -
>   	/* Clock */
>   	hsotg->clk = devm_clk_get_optional(hsotg->dev, "otg");
>   	if (IS_ERR(hsotg->clk)) {

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


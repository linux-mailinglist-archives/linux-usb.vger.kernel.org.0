Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 39474115106
	for <lists+linux-usb@lfdr.de>; Fri,  6 Dec 2019 14:33:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726237AbfLFNd0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 6 Dec 2019 08:33:26 -0500
Received: from mailout2.w1.samsung.com ([210.118.77.12]:38547 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726213AbfLFNd0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 6 Dec 2019 08:33:26 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20191206133323euoutp0265fccf674d66321540d2ac351954545f~dy4HY_Gc50353003530euoutp02d
        for <linux-usb@vger.kernel.org>; Fri,  6 Dec 2019 13:33:23 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20191206133323euoutp0265fccf674d66321540d2ac351954545f~dy4HY_Gc50353003530euoutp02d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1575639203;
        bh=CcxllySEdyf3C3JiKM7KeKc9NaD41RLksUaGT/pxOnY=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=AtRcM0JC1+o6gmP8BcjhtYtq0MtEKJSsAmrqJwlFQRzEb/cIxNU1LLhYrzKTbSPVT
         W/tc5Vtxc7r6bUYvVZWFNk9JX3XfDu9CbUKyBGSJSU91ctTdvaiCOWR1R6BYKomh2R
         F/aBZuNRh/C7qAB33TyFkmfKUwmyK277cxVX80NA=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20191206133322eucas1p1c06e33e785f94611dfe20785a227b13b~dy4HCNf1A2458824588eucas1p1i;
        Fri,  6 Dec 2019 13:33:22 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id DB.26.61286.2A85AED5; Fri,  6
        Dec 2019 13:33:22 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20191206133322eucas1p2ba5c0f6c937c44273eed2f09d6bd7802~dy4GqlNQf3064130641eucas1p2F;
        Fri,  6 Dec 2019 13:33:22 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20191206133322eusmtrp111fbe766a0870dee5eedbf5aea0fa446~dy4GqFMj41912219122eusmtrp1S;
        Fri,  6 Dec 2019 13:33:22 +0000 (GMT)
X-AuditID: cbfec7f2-f0bff7000001ef66-ea-5dea58a2d0d3
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 2B.DC.07950.2A85AED5; Fri,  6
        Dec 2019 13:33:22 +0000 (GMT)
Received: from [106.120.51.15] (unknown [106.120.51.15]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20191206133322eusmtip237b48ebaf1ed9eedf375a8eafb45cf87~dy4GWwhrr0131801318eusmtip2R;
        Fri,  6 Dec 2019 13:33:22 +0000 (GMT)
Subject: Re: [PATCH] usb: usb3503: Convert to use GPIO descriptors
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb <linux-usb@vger.kernel.org>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Stefan Agner <stefan@agner.ch>,
        Krzysztof Kozlowski <krzk@kernel.org>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <c39f102f-532d-fb07-b5f4-920412fafef7@samsung.com>
Date:   Fri, 6 Dec 2019 14:33:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
        Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <CACRpkdYABrazSkSn0Qn-dCguxhgJUiQ2viDRMw4VAggafmZrQQ@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrJKsWRmVeSWpSXmKPExsWy7djP87qLIl7FGqxuNbBo3zeXxaJ58Xo2
        i/PnN7BbTPmznMli0bJWZovN69rZHdg8Fn+/x+yxaVUnm8eda3vYPPbPXcPu0XJyP4vH501y
        AWxRXDYpqTmZZalF+nYJXBkNa/4yFcznqrh9ey1jA2MPRxcjB4eEgInE7a2sXYycHEICKxgl
        rh5W6GLkArK/MEq0TP7CDJH4zCjRuFwTxAapn/xoFytE0XJGiZ6jO1kgnLeMEmtXr2QHqRIW
        cJL4MHsOC4gtIqAj0b3tJ1gHs8B5oKK/h8D2sQkYSnS97WIDsXkF7CR2n/sGFmcRUJHYt34e
        G8h5ogKxEh3LMyBKBCVOznwCNpNTIFDizPM7YLuYBeQltr+dwwxhi0vcejKfCWSXhMAmdomV
        izayQ5ztInFr3xtmCFtY4tXxLVBxGYnTk3tYIBqaGSUenlvLDuH0MEpcbprBCFFlLXH4+EVW
        kIuYBTQl1u/Shwg7Skzrvc8ICUc+iRtvBSGO4JOYtG06M0SYV6KjTQiiWk1i1vF1cGsPXrjE
        PIFRaRaS12YheWcWkndmIexdwMiyilE8tbQ4Nz212DAvtVyvODG3uDQvXS85P3cTIzABnf53
        /NMOxq+Xkg4xCnAwKvHwzvj8IlaINbGsuDL3EKMEB7OSCG8638tYId6UxMqq1KL8+KLSnNTi
        Q4zSHCxK4rzGi4BSAumJJanZqakFqUUwWSYOTqkGxn1HFzVqFLWGpenG2W14LHpnadUSm/cz
        PewepQVH/udXzgn7NUX+y+es7qIlhiK1uZdd5X5pvv6sF/ik0ttAR32qRTM3K9vlt7K72C4b
        3Vf98HKzvNGuEz33/1qwnmMpE/HYIbOQf8Wc0x63fFperGEu4are57hzz3f97mrxzxeWq+26
        PqHwrhJLcUaioRZzUXEiADxXAXA8AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrHIsWRmVeSWpSXmKPExsVy+t/xe7qLIl7FGjybJ27Rvm8ui0Xz4vVs
        FufPb2C3mPJnOZPFomWtzBab17WzO7B5LP5+j9lj06pONo871/aweeyfu4bdo+XkfhaPz5vk
        Atii9GyK8ktLUhUy8otLbJWiDS2M9AwtLfSMTCz1DI3NY62MTJX07WxSUnMyy1KL9O0S9DIa
        1vxlKpjPVXH79lrGBsYeji5GTg4JAROJyY92sXYxcnEICSxllGg7+ZcRIiEjcXJaAyuELSzx
        51oXG4gtJPCaUeLjRhcQW1jASeLD7DksILaIgI5E97afYIOYBS4ySpw40w41dT+zxPJ7S8Em
        sQkYSnS9hZjEK2AnsfvcN7A4i4CKxL7188DiogKxEt9XfmKEqBGUODnzCdgGToFAiTPP77CD
        2MwCZhLzNj9khrDlJba/nQNli0vcejKfaQKj0Cwk7bOQtMxC0jILScsCRpZVjCKppcW56bnF
        RnrFibnFpXnpesn5uZsYgXG37djPLTsYu94FH2IU4GBU4uGd8flFrBBrYllxZe4hRgkOZiUR
        3nS+l7FCvCmJlVWpRfnxRaU5qcWHGE2BnpvILCWanA9MCXkl8YamhuYWlobmxubGZhZK4rwd
        AgdjhATSE0tSs1NTC1KLYPqYODilGhhTzvhOeXa0PFZF/w1vf/bPY4+7L996ktx84wBrsPdc
        /RnlSV5L96z+L5DTkfDlT3T7jC/b37ZGRE24rq3M3ntwf6SWz8w5m6af3af5MPHS43PnChne
        b4lYJqXMcbh9b6HtNWVl/vCKc5+iPxx9pRk+KaF46nR3l5eyYS8XNtZGTffX7He7Xc6ixFKc
        kWioxVxUnAgA8OW+z9ECAAA=
X-CMS-MailID: 20191206133322eucas1p2ba5c0f6c937c44273eed2f09d6bd7802
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
        <cc924d9c-d8b2-d14e-f758-556551557e5d@samsung.com>
        <CACRpkdYABrazSkSn0Qn-dCguxhgJUiQ2viDRMw4VAggafmZrQQ@mail.gmail.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Linus,

On 06.12.2019 14:21, Linus Walleij wrote:
> On Fri, Dec 6, 2019 at 12:53 PM Marek Szyprowski
> <m.szyprowski@samsung.com> wrote:
>> On 06.12.2019 10:58, Linus Walleij wrote:
>>> On Fri, Dec 6, 2019 at 10:14 AM Marek Szyprowski
>>> <m.szyprowski@samsung.com> wrote:
>>>
>>> BTW:
>>>
>>>> I really wonder why
>>>> it worked fine with non-descriptor code and the ACTIVE_LOW DT flags...
>>> The old code ignored the polarity flags in the device tree and
>>> assumed everything was active high, that's how. It could as well
>>> be hardcoded to 1337.
>> Okay, then to restore current driver behavior after your patch, one has
>> to change gpio flags in all dts to ACTIVE_HIGH...
> Yeah :/
>
> I think we should do a two-stage rocket here, if you make a patch to
> all the DTS files I will make sure to add some logic enforcing the
> right line levels in this patch as well.
>
> I'll make sure to assert reset expecting it to be flagged as active low.

Frankly, if delay applying this patch one release after the DTS changes 
are applied, no workarounds in gpio core are needed. In such case we 
combine your patch with a driver logic cleanup for the reset gpio, so 
DTS can use ACTIVE_LOW flag then.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


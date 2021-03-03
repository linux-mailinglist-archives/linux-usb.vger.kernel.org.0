Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39EEF32C608
	for <lists+linux-usb@lfdr.de>; Thu,  4 Mar 2021 02:01:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238729AbhCDA1V (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 3 Mar 2021 19:27:21 -0500
Received: from mailout2.samsung.com ([203.254.224.25]:33885 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238173AbhCCNNK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 3 Mar 2021 08:13:10 -0500
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
        by mailout2.samsung.com (KnoxPortal) with ESMTP id 20210303131123epoutp020f39f8ae5d56914c1c92e2b642748ef0~o1zPSvUlk1532615326epoutp02m
        for <linux-usb@vger.kernel.org>; Wed,  3 Mar 2021 13:11:23 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20210303131123epoutp020f39f8ae5d56914c1c92e2b642748ef0~o1zPSvUlk1532615326epoutp02m
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1614777084;
        bh=HqLEP19uy6vF36GMHGn6NYmT2QcSQq+jD8KnFUHdYAY=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=mp1ftS5rP4GmAmjY1JKWBl7nzpVvUGgKDTx2Z1/qYomNdaGvupwEB/Hv6vosVLlJq
         uG9rAe527k9sJlr+9U/cQxOfA2eyavKE0A4WjfGbKzwit92+64n+T5oV57ER0sa5vI
         JZV3pyI+e1teqmEuDVM5go79LQ8YrQtuKo+yigjA=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
        epcas2p2.samsung.com (KnoxPortal) with ESMTP id
        20210303131123epcas2p27be3be0c47e7a303171f9e652aea71c3~o1zPE-v-X1862418624epcas2p2T;
        Wed,  3 Mar 2021 13:11:23 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.40.185]) by
        epsnrtp2.localdomain (Postfix) with ESMTP id 4DrDsQ4KVZz4x9Pt; Wed,  3 Mar
        2021 13:11:22 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
        epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        1E.36.56312.AFA8F306; Wed,  3 Mar 2021 22:11:22 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
        20210303131121epcas2p4c878cc671f2b0f2114b83a73328877d7~o1zNFMwvy2430724307epcas2p4S;
        Wed,  3 Mar 2021 13:11:21 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20210303131121epsmtrp22233c306f1416892556941834891ede6~o1zNB-weW1070310703epsmtrp2T;
        Wed,  3 Mar 2021 13:11:21 +0000 (GMT)
X-AuditID: b6c32a46-1d9ff7000000dbf8-c2-603f8afa502a
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        7D.E0.08745.9FA8F306; Wed,  3 Mar 2021 22:11:21 +0900 (KST)
Received: from rack03 (unknown [12.36.155.109]) by epsmtip2.samsung.com
        (KnoxPortal) with ESMTPA id
        20210303131121epsmtip2ae8e1afcf08f36cd063563f0942e49ae~o1zM28lDv0357003570epsmtip2L;
        Wed,  3 Mar 2021 13:11:21 +0000 (GMT)
Date:   Wed, 3 Mar 2021 22:12:16 +0900
From:   taehyun cho <taehyun.cho@samsung.com>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     balbi@kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: dwc3: make USB_DWC3_EXYNOS independent
Message-ID: <20210303131216.GA136468@rack03>
MIME-Version: 1.0
In-Reply-To: <c9ac155c-56c2-4025-d1ae-d0c6c95533b8@kernel.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrOKsWRmVeSWpSXmKPExsWy7bCmme6vLvsEg3nz5C2OtT1htzh/fgO7
        xaJlrcwOzB6bVnWyeXzeJBfAFJVjk5GamJJapJCal5yfkpmXbqvkHRzvHG9qZmCoa2hpYa6k
        kJeYm2qr5OIToOuWmQO0Q0mhLDGnFCgUkFhcrKRvZ1OUX1qSqpCRX1xiq5RakJJTYGhYoFec
        mFtcmpeul5yfa2VoYGBkClSZkJMx6+Na5oJ7vBW7z/xhbWDcw93FyMkhIWAice75ddYuRi4O
        IYEdjBIvjhxnhnA+MUosmvKdHcL5zCixeU0LK0xL/4vlbBCJXYwSp4+uZ4RwnjBKTJt9jR2k
        ikVAReL18VuMIDabgLbE/uabYN0iApoS1/9+B7OZBfQlVtybwwJiCws4SHw+tw8sziugI3H3
        4A92CFtQ4uTMJ2A1nAJ2Ei/39QNt5uAQBZr/6mA9yF4JgWPsEm/WfGGBuM5F4mrrNnYIW1ji
        1fEtULaUxOd3e9kgGtoZJX6dWMMK4UxhlPiw7hQjRJWxxKxn7YwQ12VKrHzRBrZNQkBZ4sgt
        Fogwn0TH4b/sEGFeiY42IYhOVYn2i/fZIGxpiUubb0LZHhJ9y1dBg/Ewo0TXsYuMExjlZyH5
        bRaSbRC2jsSC3Z+AbA4gW1pi+T8OCFNTYv0u/QWMrKsYxVILinPTU4uNCoyQo3sTIzgFarnt
        YJzy9oPeIUYmDsZDjBIczEoivOIvbROEeFMSK6tSi/Lji0pzUosPMZoCI2ois5Rocj4wCeeV
        xBuaGpmZGViaWpiaGVkoifMWGzyIFxJITyxJzU5NLUgtgulj4uCUamCq/x7Rd8tQrNxE1mPF
        5dCCtZV77PfHyc4pmf+rsL3O+uHjznQ+l7mWK3Yuf1fV9z6+kHXN/XOrwq70/wwyST7dkqUT
        P4mDsc2SLyveRlBHbZJvUlYR690FvxZMSL4Sz+70ifPuEonWhJOrN7DtmP/a4Yz84kJpT7fP
        Ya7qiS/0BVb5HD1qaf3daGKHVcp8vgOhQVKFiu+P/dsSdsjWpPbV84dfvCITW9w0VZlZk8PL
        rTITvYKMlrElb55Wdllo91/Okh+RtTLywTfucm/++pPbNttzX4rr3f+T83iUWAtFNVNlWjbz
        Z85hN7k36UJCfFqzyIpTWp9XfTzXGG96qym6efu9dlfTBJXZL2dIKrEUZyQaajEXFScCAKvx
        myQKBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrJLMWRmVeSWpSXmKPExsWy7bCSvO7PLvsEg1vHpS2OtT1htzh/fgO7
        xaJlrcwOzB6bVnWyeXzeJBfAFMVlk5Kak1mWWqRvl8CVsWj5acaC2dwV7x7lNzBO4uxi5OSQ
        EDCR6H+xnK2LkYtDSGAHo8Sl8/0sEAlpiVOPFzBD2MIS91uOsEIUPWKUeHpmPhtIgkVAReL1
        8VuMIDabgLbE/uabrCC2iICmxPW/38FsZgF9iRX35oANFRZwkPh8bh9YnFdAR+LuwR/sEEMP
        M0p8bzkFlRCUODnzCQtEs5bEjX8vmboYOYBsaYnl/zhAwpwCdhIv9/WzgYRFgW54dbB+AqPg
        LCTNs5A0z0JoXsDIvIpRMrWgODc9t9iwwCgvtVyvODG3uDQvXS85P3cTIzh0tbR2MO5Z9UHv
        ECMTB+MhRgkOZiURXvGXtglCvCmJlVWpRfnxRaU5qcWHGKU5WJTEeS90nYwXEkhPLEnNTk0t
        SC2CyTJxcEo1MNky6y0MerUhVsyQRfWK7mO++zcfvN7zcadH9ZEKVt7/9pY6vCpfKzdPXPVj
        0md5o/I7E552ck3Y1hCmWOmV/S2hssDlWOeVvv0r2k6uNpPfzFnjlH//K/Pe+hU+cyMWHOHo
        n6ogPZHHTf7h1eUWnzXPTyufybwrOV6g4F7kN67Tsmf1NdfJhtU3cfcum/pok0NFqwHHlnn6
        /65Ei53hVj7ut7hjrseW/24bPlfZvdNbKfw+5t06ScOvMw5ImKvM7jwk/e1K+GRO9+7QldYx
        62TfLa/6IPBQdz7Pjxevfj16f/FDxHztkH+/HnzduEWjvilU67iaTIDKDVmxjaEte9WnM7We
        UlkR1bP1uZBN7RklluKMREMt5qLiRADzDtypzAIAAA==
X-CMS-MailID: 20210303131121epcas2p4c878cc671f2b0f2114b83a73328877d7
X-Msg-Generator: CA
Content-Type: multipart/mixed;
        boundary="----WZLI4USkVYiVjVtGawWGutc5pNztY3GR2qy8kqsclN4GFAmP=_1a2651_"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20210303022537epcas2p1b85ab825ceca3a411a177cc1af8a2c7b
References: <CGME20210303022537epcas2p1b85ab825ceca3a411a177cc1af8a2c7b@epcas2p1.samsung.com>
        <20210303022628.6540-1-taehyun.cho@samsung.com>
        <c9ac155c-56c2-4025-d1ae-d0c6c95533b8@kernel.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

------WZLI4USkVYiVjVtGawWGutc5pNztY3GR2qy8kqsclN4GFAmP=_1a2651_
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Mar 03, 2021 at 11:24:01AM +0100, Krzysztof Kozlowski wrote:
> On 03/03/2021 03:26, taehyun cho wrote:
> >'ARCH_EXYNOS' is not suitable for DWC3_EXYNOS config.
> >'USB_DWC3_EXYNOS' is glue layer which can be used with
> >Synopsys DWC3 controller on Exynos SoCs. USB_DWC3_EXYNOS'
> >can be used from Exynos5 to Exynos9.
> >
> >Signed-off-by: taehyun cho <taehyun.cho@samsung.com>
> 
> NACK because you ignored comments from March. Please respond to them instead
> of resending the same patch.
> 
> Anyway, when resending you need to version your patches and explain the
> differences. Please also Cc reviewers and other maintainers. I pointed out
> this before:
> scripts/get_maintainer.pl -f drivers/usb/dwc3/dwc3-exynos.c
> 
> The driver - in current form - should not be available for other
> architectures. It would clutter other platforms and kernel config selection.
> If you want to change this, you need to provide rationale (usually by adding
> support to new non-Exynos platform).
> 
> Best regards,
> Krzysztof
>

Sorry for not answering the comments previously. I was confused with the policy.
I couldn't use 'USB_DWC3_EXYNOS' when 'ARCH_EXYNOS' was not defined. That's why
I changed 'ARCH_EXYNOS' to 'USB_DWC3'. I modified changelog text from previous
commit. I saw some more discussion was done about 'ARCH_XX'. I will wait for
the decision.

Thanks.

Best Regards,
Taehyun Cho

------WZLI4USkVYiVjVtGawWGutc5pNztY3GR2qy8kqsclN4GFAmP=_1a2651_
Content-Type: text/plain; charset="utf-8"


------WZLI4USkVYiVjVtGawWGutc5pNztY3GR2qy8kqsclN4GFAmP=_1a2651_--

Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27B125A20E2
	for <lists+linux-usb@lfdr.de>; Fri, 26 Aug 2022 08:31:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235593AbiHZGbD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 26 Aug 2022 02:31:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229556AbiHZGbB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 26 Aug 2022 02:31:01 -0400
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7ED032D9B
        for <linux-usb@vger.kernel.org>; Thu, 25 Aug 2022 23:30:56 -0700 (PDT)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20220826063051euoutp0237d2e9ac77cf15a765f7d1646428ee67~O0U97S5Zk0462704627euoutp02B
        for <linux-usb@vger.kernel.org>; Fri, 26 Aug 2022 06:30:51 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20220826063051euoutp0237d2e9ac77cf15a765f7d1646428ee67~O0U97S5Zk0462704627euoutp02B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1661495451;
        bh=W+UMzgOy5nrhfOOkuzPjb/BXopoI0JJlZTrynR9BkzA=;
        h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
        b=FCRSoa1HH+wY1PfFdDx5sBPGlMyQbAfRchoFFXElsslNhkZ6qepUtibiUnrLPVFDH
         ZIas2SdXnoLIyDj3Lq1kK+dnFvnoowoZn9eHyq2ySk9MZzH4eOMWfor43Q1opjcgXa
         a4VrzJUU4OkqX4dFz6YlIdrvZQpzfzJUZrmdnpDo=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20220826063051eucas1p22e2a079e2ba427d70bc765dbb17e3800~O0U9tY6um1228312283eucas1p2d;
        Fri, 26 Aug 2022 06:30:51 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id AA.5E.29727.B9868036; Fri, 26
        Aug 2022 07:30:51 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20220826063051eucas1p1221e5515617dbd4c8c3b31917b8ce26a~O0U9XVEyf2391823918eucas1p1o;
        Fri, 26 Aug 2022 06:30:51 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20220826063051eusmtrp19e2b799dcbdfce83ebaa2121ed0d2c38~O0U9V-Ebk0256002560eusmtrp1z;
        Fri, 26 Aug 2022 06:30:51 +0000 (GMT)
X-AuditID: cbfec7f2-21dff7000001741f-a9-6308689b73a3
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id BE.B7.07473.B9868036; Fri, 26
        Aug 2022 07:30:51 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20220826063050eusmtip162f1db11e1b5404e629e8731daca3897~O0U865DvI3084430844eusmtip12;
        Fri, 26 Aug 2022 06:30:50 +0000 (GMT)
Message-ID: <d174d0cc-464d-7ae0-35e8-bb78c35eac22@samsung.com>
Date:   Fri, 26 Aug 2022 08:30:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
        Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH] USB: gadget: Fix use-after-free Read in
 usb_udc_uevent()
Content-Language: en-US
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        USB mailing list <linux-usb@vger.kernel.org>,
        syzkaller-bugs@googlegroups.com
From:   Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <YvUo7ukc8xKxKLZt@rowland.harvard.edu>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprJKsWRmVeSWpSXmKPExsWy7djP87qzMziSDZonyFsca3vCbtG8eD2b
        xaJlrcwWx3sPMFlM+H2BzeLGlrnMDmweeyaeZPPYvELLY9OqTjaP/XPXsHvMvvuD0ePzJrkA
        tigum5TUnMyy1CJ9uwSujI2zljEXvOar2DJnCmMD43/uLkYODgkBE4l3TUpdjFwcQgIrGCUu
        NN5gg3C+MEp0nZvBAuF8ZpSY/Ow6excjJ1jHx1NnoaqWM0p8vXiPGcL5yCgxv2cmC0gVr4Cd
        xLsZq1lBbBYBVYk9J+4zQ8QFJU7OfAJWIyqQLDHr2DFGkDuEBfwlrs1OAQkzC4hL3HoynwnE
        FhHQktjc9BJsPrPAYUaJLVtmgiXYBAwlut52sYHYnALGEp2rVjJDNMtLbH87B6xBQuAGh8SG
        GwfZIB51kWjcKwfxgbDEq+NboL6RkTg9uYcFoiRf4u8MY4hwhcS112uYIWxriTvnfoFNYRbQ
        lFi/Sx8i7CjRtWAxO0Qnn8SNt4IQB/BJTNo2nRkizCvR0SYEUa0mMev4OridBy9cYp7AqDQL
        KUhmIfl9FpJXZiHsXcDIsopRPLW0ODc9tdgwL7Vcrzgxt7g0L10vOT93EyMw9Zz+d/zTDsa5
        rz7qHWJk4mA8xCjBwawkwmt1jCVZiDclsbIqtSg/vqg0J7X4EKM0B4uSOG9y5oZEIYH0xJLU
        7NTUgtQimCwTB6dUA5N084KtDl8l9NsFhKesyI6sfpjH0jNFWvr5lDknHhQvuKe093hEzIOZ
        u5XWBLzrEXVNXz1j29sJ30+uzEieFXnwgdR55km5D+4tKvfbFm1+ep0Eg5iIRKj/ior7/Qu+
        Be18pxS/wvXnWwHW3A0hcdIui25MYdvE8rLs/f5r79SlZ96sFTMX8t9+0iBLw3lZrb7THtat
        l/bI7Ttwe/ubX3V5fNvbtnvPepQdp77wduaGgzkNSws5tA5cX3P13JPIZ5fesXGUHPRe8e2B
        V+lu0yp2fjWBvfKBx2Pvv3tbPlH89x4Xtacr/USZyxUK55UderJd2GanbX3g1vbLJo/WLmjj
        evOsMcH6yJQnpWt2bl8zQYmlOCPRUIu5qDgRALy2mv+sAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrIIsWRmVeSWpSXmKPExsVy+t/xu7qzMziSDR5c4LI41vaE3aJ58Xo2
        i0XLWpktjvceYLKY8PsCm8WNLXOZHdg89kw8yeaxeYWWx6ZVnWwe++euYfeYffcHo8fnTXIB
        bFF6NkX5pSWpChn5xSW2StGGFkZ6hpYWekYmlnqGxuaxVkamSvp2NimpOZllqUX6dgl6GRtn
        LWMueM1XsWXOFMYGxv/cXYycHBICJhIfT51l62Lk4hASWMooMe/GYXaIhIzEyWkNrBC2sMSf
        a11QRe+Biva/YANJ8ArYSbybsRqsiEVAVWLPifvMEHFBiZMzn7CA2KICyRJLGu6D1QgL+ErM
        2dYPVsMsIC5x68l8JhBbREBLYnPTS2aQBcwChxklNqw8xgKxbR+zxOlni8G2sQkYSnS97QKz
        OQWMJTpXrYSaZCbRtbWLEcKWl9j+dg7zBEahWUgOmYVk4SwkLbOQtCxgZFnFKJJaWpybnlts
        qFecmFtcmpeul5yfu4kRGHfbjv3cvINx3quPeocYmTgYDzFKcDArifBaHWNJFuJNSaysSi3K
        jy8qzUktPsRoCgyNicxSosn5wMjPK4k3NDMwNTQxszQwtTQzVhLn9SzoSBQSSE8sSc1OTS1I
        LYLpY+LglGpgWue4QO8hjxBjHnea0Cb7g3fs2EsvT6qUmWaR+1OCKUDHcE3xveBnbN665XEq
        lqfjGmbvDXfUvf2p4r6Ds0Zj+CvJub89D7hrrfrx6Crn87iNFY+/vojmMrJ9yfTBWf+f2YtF
        +3xigvJ4/L/f5NjavNtrm+HSBI4/ZrzpEyfXRHTN3RV8WjvGbrKvlMjJn9/ZV/f9bW3JSJby
        XL9fL/z00wN7Pfx/s0fKGp2+1P1f8ExgfKDB7gaHjvKInKx5i9eubz11SNx13l3X7k8Tl3/z
        n8CiwfzKsCdvz81ga74T+8sulEWU6Onms386yzQ3Y/6NyalsvO0fFtVqi0/ZISm9zN6C/z33
        1kwppXsRNu+UWIozEg21mIuKEwGmoZbJRAMAAA==
X-CMS-MailID: 20220826063051eucas1p1221e5515617dbd4c8c3b31917b8ce26a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20220808145736eucas1p234e56422bd7973d7f0676e74f03ba405
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20220808145736eucas1p234e56422bd7973d7f0676e74f03ba405
References: <YtlbkmVGJyhO4kR6@rowland.harvard.edu>
        <000000000000acc0e905e4517fa0@google.com>
        <YtlrnhHyrHsSky9m@rowland.harvard.edu>
        <CGME20220808145736eucas1p234e56422bd7973d7f0676e74f03ba405@eucas1p2.samsung.com>
        <b2ba4245-9917-e399-94c8-03a383e7070e@samsung.com>
        <YvFxiXmPlJc9wLZT@rowland.harvard.edu>
        <YvQH7IMTIFO0OCnG@rowland.harvard.edu>
        <febf579a-6451-1dc6-b583-0ba1a76344a6@samsung.com>
        <YvUo7ukc8xKxKLZt@rowland.harvard.edu>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 11.08.2022 18:06, Alan Stern wrote:
> On Thu, Aug 11, 2022 at 09:31:34AM +0200, Marek Szyprowski wrote:
>> On 10.08.2022 21:33, Alan Stern wrote:
>>> On Mon, Aug 08, 2022 at 04:26:49PM -0400, Alan Stern wrote:
>>>> On Mon, Aug 08, 2022 at 04:57:35PM +0200, Marek Szyprowski wrote:
>>>>> This patch landed recently in linux-next as commit 2191c00855b0 ("USB:
>>>>> gadget: Fix use-after-free Read in usb_udc_uevent()"). Unfortunately it
>>>>> fixes the issue by introducing another one. It doesn't look very
>>>>> probable, but it would be nice to fix it to make the lock dependency
>>>>> checker happy.
>>>> Indeed.
>>>> I suspect the problem is that udc_lock is held for too long.  Probably it
>>>> should be released during the calls to udc->driver->bind and
>>>> udc->driver->unbind.
>>>>
>>>> Getting this right will require some careful study.  Marek, if I send you
>>>> a patch later, will you be able to test it?
>>> Here's a patch for you to try, when you have the chance.  It reduces the
>>> scope of udc_lock to cover only the fields it's supposed to protect and
>>> changes the locking in a few other places.
>>>
>>> There's still the possibility of a locking cycle, because udc_lock is
>>> held in the ->disconnect pathway.  It's very hard to know whether that
>>> might cause any trouble; it depends on how the function drivers handle
>>> disconnections.
>> It looks this fixed the issue I've reported. I've checked it on all my
>> test systems and none reported any issue related to the udc.
>>
>> Feel free to add:
>>
>> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>
>> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Thanks for the quick testing.  I'll submit the patch when the current
> merge window ends.

Gentle ping for the final patch...

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


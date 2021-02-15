Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9521631B730
	for <lists+linux-usb@lfdr.de>; Mon, 15 Feb 2021 11:33:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229994AbhBOKct (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 15 Feb 2021 05:32:49 -0500
Received: from mailout1.w1.samsung.com ([210.118.77.11]:58651 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229991AbhBOKcn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 15 Feb 2021 05:32:43 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20210215103200euoutp010d5cbc851594a4eb5a44a721d1aee7b2~j5TgWC_0_0759407594euoutp01Y
        for <linux-usb@vger.kernel.org>; Mon, 15 Feb 2021 10:32:00 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20210215103200euoutp010d5cbc851594a4eb5a44a721d1aee7b2~j5TgWC_0_0759407594euoutp01Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1613385120;
        bh=ueLdsSJtbO3+40sftWiWMrWNs4CAL5ohHBxR4pg3RG4=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=jvjamunfCfjhipzIf42bJkV8mmwtfjcGYmd7LpjbS1mJm9TZJEolOiavqJA2yhGSg
         /GASn0kNrBEYGS1Lac36fTP+M/rY772UK6ulplRt2CkkdbEvtTm003lKdYazc3UXzO
         I+LwplQ8KqEohsLxiTO9de5Ia5hAlFPmjroKb9T8=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20210215103200eucas1p25a5b729905c0e6165893a86015f19af1~j5TgGd3Q33076930769eucas1p2o;
        Mon, 15 Feb 2021 10:32:00 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 5A.C3.27958.0AD4A206; Mon, 15
        Feb 2021 10:32:00 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20210215103159eucas1p11b6b30507308deca31eb7ec419bf3b2b~j5Tfl5fcd0931809318eucas1p1n;
        Mon, 15 Feb 2021 10:31:59 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20210215103159eusmtrp1505b01907eff060abb95bc31903f90fa~j5TflNATu0582805828eusmtrp1W;
        Mon, 15 Feb 2021 10:31:59 +0000 (GMT)
X-AuditID: cbfec7f2-f15ff70000006d36-98-602a4da02e2d
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 42.06.16282.F9D4A206; Mon, 15
        Feb 2021 10:31:59 +0000 (GMT)
Received: from [192.168.56.1] (unknown [106.210.133.45]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20210215103159eusmtip2d4e8a26b68374fef490cab320081c2b7~j5TfCujWg0760107601eusmtip24;
        Mon, 15 Feb 2021 10:31:59 +0000 (GMT)
Subject: Re: proposal: move Linux userspace USB gadget projects to linux-usb
 GitHub organisation?
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Cc:     Paul Wise <pabs3@bonedaddy.net>,
        Karol Lewandowski <k.lewandowsk@samsung.com>,
        linux-usb@vger.kernel.org
From:   Krzysztof Opasiak <k.opasiak@samsung.com>
Message-ID: <0fa0f4cc-8e0a-d798-f33c-193a760595f2@samsung.com>
Date:   Mon, 15 Feb 2021 11:31:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <YCpH/2PbQtrmUYhJ@kroah.com>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprIKsWRmVeSWpSXmKPExsWy7djPc7oLfLUSDKa84rdY9vgei0Xz4vVs
        Fo2f5jJbLFrWymzx+fV7RgdWj4WzP7F77Li7hNFj/9w17B59W1YxenzeJBfAGsVlk5Kak1mW
        WqRvl8CVMXvGVeaCx+IVCy5sZ25gfCrUxcjJISFgIjHh1Rv2LkYuDiGBFYwS+/7PZIRwvjBK
        HO0/wQLhfGaU+LDuHSNMy/FjE5lAbCGB5YwSk5fqQhS9ZZT4u+A5K0hCWCBZYuXsjWANIgJp
        Eq9/d4LZzAJ5ElMXTAVq5uBgE9CXmLdLFCTMK2AnsfrdFDYQm0VAVeLB/VusICWiAhESp78m
        QpQISpyc+YQFJMwpoCnRfjECYqC4xK0n85kgbHmJ5q2zmUGukRC4wCEx794EFoiTXSSatrRA
        2cISr45vYYewZSROT+5hgWjYxCjxf+51NghnN6PEhYMbmSCqrCUO//vNBrKZGWjz+l36EGFH
        id9/WxhBwhICfBI33gpCHMEnMWnbdGaIMK9ERxs0oJUl7rc/YIWwJSW+r97NPoFRaRaSz2Yh
        eWcWkndmIexdwMiyilE8tbQ4Nz212DAvtVyvODG3uDQvXS85P3cTIzDVnP53/NMOxrmvPuod
        YmTiYDzEKMHBrCTCe1VCI0GINyWxsiq1KD++qDQntfgQozQHi5I476rZa+KFBNITS1KzU1ML
        UotgskwcnFINTG5PA199npLI+VvKaNl7zT9XHYJeHZvcnXhzcs+Xq/sObeKwtRF1vvzyxOSi
        Jx/WpZjI+yQ8uF2R+il+h0eWrdsRs8CQy3dNtrmKSzJ+CP735mum6jMmeRbfcEeZeW/LDv3j
        EPHdYVnnlaqwddu73c9SXb8vys58nvQ57+unFfwKGzrTm8pXWL1b/HfPjRlRm2UsFoZlVFbE
        Ttup9cS38XdHbWvWu9NT23p+8irqfiz1Ugz1WjVDXET04Z6tJ/yePElclqfzRmHmql2aZTmu
        yYJPS5kbOU6/erdVs7Nwu1Dme/91j5xmTdvyV83ccKr8YiWuWd1nT+ROF1bXWSx6YuuHXS4f
        9b7WdHX8uMH5bKsSS3FGoqEWc1FxIgDk6EnhpAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrCIsWRmVeSWpSXmKPExsVy+t/xe7rzfbUSDH6+1rBY9vgei0Xz4vVs
        Fo2f5jJbLFrWymzx+fV7RgdWj4WzP7F77Li7hNFj/9w17B59W1YxenzeJBfAGqVnU5RfWpKq
        kJFfXGKrFG1oYaRnaGmhZ2RiqWdobB5rZWSqpG9nk5Kak1mWWqRvl6CXMXvGVeaCx+IVCy5s
        Z25gfCrUxcjJISFgInH82ESmLkYuDiGBpYwSS15tY4VISEpMf3GCGcIWlvhzrYsNoug1o8Ss
        PQcZQRLCAskSK2dvBLNFBNIkOv90soDYzAJ5Eocez2AHsYUEvjJLbF+u0sXIwcEmoC8xb5co
        SJhXwE5i9bspbCA2i4CqxIP7t8D2igpESDzffoMRokZQ4uTMJywgrZwCmhLtFyMgpptJzNv8
        kBnCFpe49WQ+E4QtL9G8dTbzBEahWUi6ZyFpmYWkZRaSlgWMLKsYRVJLi3PTc4uN9IoTc4tL
        89L1kvNzNzECo2vbsZ9bdjCufPVR7xAjEwfjIUYJDmYlEd6rEhoJQrwpiZVVqUX58UWlOanF
        hxhNgd6ZyCwlmpwPjO+8knhDMwNTQxMzSwNTSzNjJXFekyNr4oUE0hNLUrNTUwtSi2D6mDg4
        pRqYovyfV0Qql0oaqxYGs5X/3/t6+3rzOfKr2JKn9hbdjTy23YXh51L/JWGL/a6EqkxR7pow
        V5VT9trj8/KTLjn+MVJ+pumXyr+5zaxUTCLw1b3vJ6zZ2xkZeqstUjI3nrVg3K1yfFlXypQQ
        0xqbgyXn/kyyLtbjEn23yoC7sDpx8nuXFr+1zL6zf66MZS/TMzFkqg6N/bxi0fTeF5P28rDK
        TDqtzXsrwU3N+dbHisJ2Fq2FJ6/tOj3fvj/86q0HScss1tT161QmfJ7b0Fl+/eX7xv4XtWr5
        nxW/aRTe/ya38dBOybXW/bzRFvucoj9Lcug9uX4q78ze85/ZdV8tVZjn5thjfWdSlJvh0RvO
        U+WVWIozEg21mIuKEwFLPuY6NwMAAA==
X-CMS-MailID: 20210215103159eucas1p11b6b30507308deca31eb7ec419bf3b2b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210215100806eucas1p1d27b1d12bd505368a392f9123958d696
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210215100806eucas1p1d27b1d12bd505368a392f9123958d696
References: <c38162833d1c8fede734e41eb5ce23cf393d6555.camel@bonedaddy.net>
        <YAhKAiz2U9KQWQPE@kroah.com>
        <86c0f13b298c8584bc7070543637f424075e526f.camel@bonedaddy.net>
        <YB6WKs/6QMWJSS2t@kroah.com>
        <ffd238f1787b8e23f974a220e94aa39eb62b2e60.camel@bonedaddy.net>
        <8f31baea8cad893f416fac972a3a64922c97bcc5.camel@bonedaddy.net>
        <e80a776a-5d05-8936-82c9-21180cd87e22@collabora.com>
        <CGME20210215100806eucas1p1d27b1d12bd505368a392f9123958d696@eucas1p1.samsung.com>
        <YCpH/2PbQtrmUYhJ@kroah.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

let me add my 3 cents here.

On 15.02.2021 11:07, Greg Kroah-Hartman wrote:
> On Mon, Feb 15, 2021 at 10:53:16AM +0100, Andrzej Pietrasiewicz wrote:
>> W dniu 14.02.2021 o 03:17, Paul Wise pisze:
>>> On Sun, 2021-02-07 at 07:28 +0800, Paul Wise wrote:
>>>
>>>> All the standard benefits of the GitHub organisations feature and
>>>> collaborative maintenance in general
>>>
>>> Since the linux-usb GitHub organisation isn't yet available for
>>> collaborative maintenance of Linux userspace USB gadget projects on
>>> GitHub, we will create a linux-usb-gadgets GitHub organisation and can
>>> move gadget projects to the linux-usb org when it becomes available.
>>>
>>
>> Any prospects of it "becoming available"?
> 
> I still fail to see what this is going to help with here.  Are usb
> userspace projects going to somehow get loads of more developers
> somehow this way?  What is preventing that from happening today that
> dumping them all in a single project going to change?

Partially it's my fault. I'd love to help with further libusbgx 
development but in my work time I'm dealing now with some other 
challenges and additional duties in private life does not allow me to 
continue active development. I tried to at least review and merge pull 
reqs but the context switch of my brain turned out to be to heavy.

> 
> Am I now somehow the arbitrator of what is, and is not, a valid project
> to join?  We already have competing libraries scattered around, lumping
> them all in a single location isn't going to change that problem from
> what I can tell.

I already had this discussion with Matt Porter. We agreed that libusbg 
is obsolete and libusbgx is the direct ancestor for it. If you take a 
look into commit history you will see that libusbg is just a small piece 
of libusbgx history.

Now when it comes to the other projects. My company actively uses two of 
them in tizen:

- libusbgx
- gt

gadgetd has been developed by us but at the end of the day it was 
dropped and the functionality has been simplified and merged to the 
other system daemon that we have - deviced. For the two that are used in 
tizen. They are just there and serve their purpose. They are definitely 
not feature complete but the use case in which they are used there 
pretty much is.

Based on what I see in github traffic I expect that the three projects 
that definitely have some traction and interest are:

- libusbgx
- gt
- mtp-responder

> 
> So, what problem would this solve that the added maintenance burden by me
> and others would be worth it?
> 

 From organizational perspective I believe that keeping those 3 together 
makes sense. Personally I don't have any strong preference under which 
github org they are going to be published. For me the most important is 
to have them easily accessible to people and have someone onboard who 
can help with the maintenance.

Best regards,
-- 
Krzysztof Opasiak
Samsung R&D Institute Poland
Samsung Electronics

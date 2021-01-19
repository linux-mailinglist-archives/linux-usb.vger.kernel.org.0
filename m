Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E1982FC0BD
	for <lists+linux-usb@lfdr.de>; Tue, 19 Jan 2021 21:19:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730341AbhASUQ7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 19 Jan 2021 15:16:59 -0500
Received: from mailout1.w1.samsung.com ([210.118.77.11]:53812 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729052AbhASUQF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 19 Jan 2021 15:16:05 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20210119201517euoutp01f9d3e8d915ef820d45f65b37156fe10d~bu2EBmeF41815118151euoutp01q
        for <linux-usb@vger.kernel.org>; Tue, 19 Jan 2021 20:15:17 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20210119201517euoutp01f9d3e8d915ef820d45f65b37156fe10d~bu2EBmeF41815118151euoutp01q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1611087317;
        bh=uixeGNIXuQqaRWYQCKh6Zc8oTzYGCWnzHGlmjnWGSkA=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=Ij/OkAhM0usbZHp8m6wEeMz8taig2knocmT8EHu1iD6RorGqTBfrFJjYBNldhqNT6
         UX1Lc3/tnwvvbAlcP17UZeL6aJEotAmx1XeaxQzGB1fqOtOiGr0BpvQY63Sf8DmzhL
         Ks95qFbAav45wH/Usry5NTTcXwBDO6fd0WaDGxnY=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20210119201516eucas1p16b863414ab8307b7a394fda87e1696f1~bu2DtBxXc1327513275eucas1p1g;
        Tue, 19 Jan 2021 20:15:16 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 7D.7A.27958.4DD37006; Tue, 19
        Jan 2021 20:15:16 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20210119201515eucas1p21f72594a2ab798adc261531f566aa7b7~bu2C6JZsE1226312263eucas1p2k;
        Tue, 19 Jan 2021 20:15:15 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20210119201515eusmtrp1be004caaca2ed4921b8dd4d301977ada~bu2C5jvUO1086310863eusmtrp18;
        Tue, 19 Jan 2021 20:15:15 +0000 (GMT)
X-AuditID: cbfec7f2-f15ff70000006d36-76-60073dd4b3c1
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 7A.BF.16282.3DD37006; Tue, 19
        Jan 2021 20:15:15 +0000 (GMT)
Received: from [192.168.56.1] (unknown [106.210.133.45]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20210119201515eusmtip147bef8c7d2841114c7259b0607e0d264~bu2COLmwu2145621456eusmtip1Q;
        Tue, 19 Jan 2021 20:15:15 +0000 (GMT)
Subject: Re: proposal: move Linux userspace USB gadget projects to linux-usb
 GitHub organisation?
To:     Paul Wise <pabs3@bonedaddy.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Matt Porter <mporter@linaro.org>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        Karol Lewandowski <k.lewandowsk@samsung.com>
Cc:     linux-usb@vger.kernel.org
From:   Krzysztof Opasiak <k.opasiak@samsung.com>
Message-ID: <ef8906a7-0412-dbe3-d30a-2ac6d4f1b76d@samsung.com>
Date:   Tue, 19 Jan 2021 21:15:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <c38162833d1c8fede734e41eb5ce23cf393d6555.camel@bonedaddy.net>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sa0xSYRjexzmcc6CRRxR9u1lRrjST7MpGdln9oOXKdZvVSknPNBM1jlZq
        W6VTU9Jp2igQLWtYKjGdqeuyiiwqWxfXlehiuZUWWViS3cVTy3/P7f3e99k+ChMb+aOprclp
        jCZZlSQlhHjztYHb0++HkzEz8romyE2vn+PynOMWQr7PZcTk1aZcTF5hnibve9eLFhHKYwYX
        qWx9dgIpHQ/PE8qLxnpSWdxUi5R9jQGRxAbh/DgmaesORiNbECNMaLOU4am99K7qlg60F2m9
        CpGAAno2FN4w8wuRkBLTJxG0VP5AHPmMwGnp/Ev6EJTcvEn8G7lnKyY5owbB72s2nCNOBLlF
        jqGUDx0LpwwNQ+O+9FMEvb2n+B4Do8eBwfZo0KAogpZB5VmJRxbRC6Ct5SrpwTgdCPbGTr4n
        IqGjoP2Liot4w40jXbgHC+jlkFtdgLgX/cHeVcXj8HhocVZgnrVAOyhwlBeT3NVLwWR6gjjs
        Az22pr/6WGgvO4BzA42DbYyPCI6cQ3D3cgOPSyngyq/vhOcijA4Cy1kZJy+GnirHkAz0SHjs
        9OaOGAkHm3UYJ4tgf56YS0+CF/kv+RweBe66c2QJkuqHVdMPq6MfVkf/f+9RhNcifyadVccz
        bFgyszOUVanZ9OT40NgUdSMa/EHtv2yuVmTs+RRqRTwKWRFQmNRXlP2TiBGL4lQZmYwmJVqT
        nsSwVjSGwqX+olpDfbSYjlelMdsYJpXR/HN5lGD0Xl72W3f9j8OTBrbVbZGE5L+oaGrNl3X2
        x17SCgNis0aMtwbqQ8gDXorPt/3Wj5ux8sF2dxar3eKfqk5flmCh1oUvv1LkmB+J908RZGem
        PfkYXNURLlGQcfmSHPurY4dsJm3/nMQCUdT05w3ikKmTOxRRb950H4XVeLkNhfWE6TZ1aD+4
        Z14oWdu1wtX6zSf6WUTKvNnGgVvzMq0Ta50pbhu2ZG7G18TSw5mbFkedCa7b6PVaoOg23JEV
        ZFgj5uQY02reRY6JU5tXvFe3/Sw1+s0yr8oKWJjgsgtikirKWOuq04seXNflee3xUxUFntxc
        o1uzO6i78r59TbVO4quXlpoTpTiboAoLxjSs6g+Vx2+esAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrAIsWRmVeSWpSXmKPExsVy+t/xu7qXbdkTDB6+1rVY9vgei0Xz4vVs
        Fo2f5jJbLFrWymwxZ622xefX7xkd2DwWzv7E7rHj7hJGjzvX9rB57J+7ht2jb8sqRo/Pm+QC
        2KL0bIryS0tSFTLyi0tslaINLYz0DC0t9IxMLPUMjc1jrYxMlfTtbFJSczLLUov07RL0Mo6s
        n8xS8F6gYtH2S4wNjN38XYycHBICJhIXj/exdzFycQgJLGWUmPVxPRtEQlJi+osTzBC2sMSf
        a11sEEWvGSUOPD4EViQskCyxcvZGRpCEiMBdRonJnUtZQBLMArISs49fZ4TomMcoMf3YRqAd
        HBxsAvoS83aJgtTwCthJHNl+lB3EZhFQlbi16SEriC0qECHxfPsNRogaQYmTM5+AzeQU8JZo
        XdTJCDHfTGLe5ofMELa4xK0n85kgbHmJ7W/nME9gFJqFpH0WkpZZSFpmIWlZwMiyilEktbQ4
        Nz232EivODG3uDQvXS85P3cTIzDqth37uWUH48pXH/UOMTJxMB5ilOBgVhLhbfrLliDEm5JY
        WZValB9fVJqTWnyI0RTon4nMUqLJ+cC4zyuJNzQzMDU0MbM0MLU0M1YS5zU5siZeSCA9sSQ1
        OzW1ILUIpo+Jg1OqgWn3ollWOcn34rse/1DdG/bhwMT3Oz4Exk6q0a9ZxbtVbuINOxF7s6ZO
        a/esvj3LI/Y6XlMItY1lyhTL2/GGdT9P09ZZe5zvSE9XN/x13aXvSUttWbb/1uzXJXrrdjse
        6t90QmXFrJurqpf6bZhfHiBd/KT9z55fPTt39sz9xPoxr/O8Sdslnac7H7xqMSmX1zvTEFDz
        92lsnbajhDT/q/+HzBrzH76zyNUJsIhLL/r3aJFn0rSXqXcZYvZ4LD/wgrmux7Ql+IcxT6aO
        k6jfzf+8DFmyEueSl4U2vZy/zHFPXmMjh+2rY/M8V05h5v/QnD577xQXpYoLDwt1TyrKLVuV
        wlnI0sz1ycztsN+B60osxRmJhlrMRcWJACTJFJFDAwAA
X-CMS-MailID: 20210119201515eucas1p21f72594a2ab798adc261531f566aa7b7
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210119200737eucas1p12bfb53d11543ee2ccb1a4bc2138f6535
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210119200737eucas1p12bfb53d11543ee2ccb1a4bc2138f6535
References: <CGME20210119200737eucas1p12bfb53d11543ee2ccb1a4bc2138f6535@eucas1p1.samsung.com>
        <c38162833d1c8fede734e41eb5ce23cf393d6555.camel@bonedaddy.net>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 19.01.2021 21:06, Paul Wise wrote:
> Hi Greg, all,
> 
> Right now all the Linux userspace USB gadget projects (libusbg,
> libusbgx, gt, gadgetd, cmtp-responder etc) are spread out across
> different GitHub organisations and user accounts.

Anything that could increase the bandwidth on the components that I 
maintain makes perfect sense to me.
I've been moved to a little bit different challenges and I've very 
little to no time for the maintenance...

> 
> https://protect2.fireeye.com/v1/url?k=36d205a3-69493ce5-36d38eec-0cc47a3003e8-c869fc0c32bcd2f2&q=1&e=2a55e3c4-4296-4db1-a167-ae053bfff96d&u=https%3A%2F%2Fgithub.com%2Flibusbg%2Flibusbg
> https://protect2.fireeye.com/v1/url?k=2eb4e6c5-712fdf83-2eb56d8a-0cc47a3003e8-ca5ba8afa5f53a10&q=1&e=2a55e3c4-4296-4db1-a167-ae053bfff96d&u=https%3A%2F%2Fgithub.com%2Flibusbgx%2Flibusbgx
> https://protect2.fireeye.com/v1/url?k=37e1763c-687a4f7a-37e0fd73-0cc47a3003e8-7dd615eb27d63f0f&q=1&e=2a55e3c4-4296-4db1-a167-ae053bfff96d&u=https%3A%2F%2Fgithub.com%2Fkopasiak%2Fgt
> https://protect2.fireeye.com/v1/url?k=a910f7f3-f68bceb5-a9117cbc-0cc47a3003e8-206b6f1fce59b778&q=1&e=2a55e3c4-4296-4db1-a167-ae053bfff96d&u=https%3A%2F%2Fgithub.com%2Fgadgetd%2Fgadgetd
> https://protect2.fireeye.com/v1/url?k=60e2956d-3f79ac2b-60e31e22-0cc47a3003e8-f704717cf1c5b072&q=1&e=2a55e3c4-4296-4db1-a167-ae053bfff96d&u=https%3A%2F%2Fgithub.com%2Fcmtp-responder%2Fcmtp-responder
> 
> I would like to move each of these projects to the linux-usb GitHub
> organisation and add some more folks to the list of admins so that
> these projects can be more collaboratively maintained. The linux-usb
> GitHub organisation is currently solely owned by Greg Kroah-Hartman.
> 
> https://protect2.fireeye.com/v1/url?k=b3677d3e-ecfc4478-b366f671-0cc47a3003e8-727c0c894daa9fcf&q=1&e=2a55e3c4-4296-4db1-a167-ae053bfff96d&u=https%3A%2F%2Fgithub.com%2Flinux-usb
> 
> I don't propose to move maintenance of these projects to kernel.org
> since the issue and pull request databases for them are on GitHub and
> would need to be preserved.
> 

-- 
Krzysztof Opasiak
Samsung R&D Institute Poland
Samsung Electronics

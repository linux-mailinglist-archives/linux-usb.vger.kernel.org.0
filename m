Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3244280F74
	for <lists+linux-usb@lfdr.de>; Fri,  2 Oct 2020 11:05:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387660AbgJBJFM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 2 Oct 2020 05:05:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387654AbgJBJFJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 2 Oct 2020 05:05:09 -0400
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com [IPv6:2607:f8b0:4864:20::741])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E500C0613D0
        for <linux-usb@vger.kernel.org>; Fri,  2 Oct 2020 02:05:09 -0700 (PDT)
Received: by mail-qk1-x741.google.com with SMTP id w12so615481qki.6
        for <linux-usb@vger.kernel.org>; Fri, 02 Oct 2020 02:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=4KLGIY8kBZKQW79md08Gf33a5SrMCafAhLuF6uyuXZU=;
        b=ZTARo13FwOJBk4hUyi+czT3bpWxbBZgs6RxxBwBlogM8KH+GRE64DOJJpb7e1pvKtt
         8KPGjfSDznNeTGDNHvmtDDRfq1QuP4T7r2I4lOgeyN5HyZmEYiSNoI8sVvt8hEy/rv5H
         ewjYGd9G4DQ0p9+2OKrfCisWRBDxBTKTbGgueDWd0ASZFJVX4b4NVx2udhFxx//pFc2g
         jp+SIRGST/fM1kRMhmD3w/rk+cSEna6k4LcSFCmD6oeGRWHDWn0LNFKNKa+t1Z7FFEw6
         By5Ayu1eIe4YL47X3NLwZjZDlJpVp+s5mkA9PHBstGA1q32eVZNylIT361ufldp8dqzw
         4a9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4KLGIY8kBZKQW79md08Gf33a5SrMCafAhLuF6uyuXZU=;
        b=fR1XO7UnoKD+3zRp/uB4H1IhgwVIhL6qqFOzfRlWK9WmAm9ZjkfOVB6fIxMsun8HUc
         Ej8aM4SSM+33sHVZ5M6EvlymRnRYou0TAVwkk1vS/bVZYKxPFKigBvO1lA10Tiuc3GDk
         MSesIQpZ+9mB1nXAUDyuxrA76VXwtgXEo/YhHq5FaUGG35EFSWtPPb48+gBe8Q7+YFL+
         VN3MT2PoOoYZf1TD83upe9tv6fyljuQkA8W/49QS51z0y9wawLeIUz6bJ6OtTxtT5PJB
         JWlIOkWbhhw1lRd5QxYvehTfBy+MBsNfQUjHXaPuK0o3R2IN5QtK+tjAe2ftEZj9rmU+
         fTTA==
X-Gm-Message-State: AOAM531ICsfS6fJ0C+1CvWGQpxTL3FpbAo7KTPvMbSiygSqJ4fXgl5QC
        Mi5q85uVcP1ZvPqqIGThU7U=
X-Google-Smtp-Source: ABdhPJy/jILnfWqRBJ/hLIJmuYZW7T/uFcKJmpwJS64Uddff4KJbpT7AxMvydKzXF+7+rCeHeDV0sQ==
X-Received: by 2002:a05:620a:4c3:: with SMTP id 3mr1130875qks.105.1601629508315;
        Fri, 02 Oct 2020 02:05:08 -0700 (PDT)
Received: from [192.168.1.181] (pool-173-75-208-99.phlapa.fios.verizon.net. [173.75.208.99])
        by smtp.gmail.com with ESMTPSA id 206sm669840qkk.27.2020.10.02.02.05.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2020 02:05:07 -0700 (PDT)
Subject: Re: [PATCH v3 0/4] Fixes for usbip and specialised USB driver
 selection
To:     "M. Vefa Bicakci" <m.v.b@runbox.com>, linux-usb@vger.kernel.org
Cc:     Bastien Nocera <hadess@hadess.net>,
        Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        syzkaller@googlegroups.com
References: <20200922110703.720960-1-m.v.b@runbox.com>
 <36a8c401-029e-54ae-2468-04d557f3c31f@gmail.com>
 <a0a61fc1-eb83-f4a3-1e06-63e0c67bf4ae@runbox.com>
From:   Brooke Basile <brookebasile@gmail.com>
Message-ID: <46d06a65-82b7-30ab-c59c-0061903addc0@gmail.com>
Date:   Fri, 2 Oct 2020 05:05:06 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <a0a61fc1-eb83-f4a3-1e06-63e0c67bf4ae@runbox.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 10/2/20 5:00 AM, M. Vefa Bicakci wrote:
> On 10/2/20 6:11 AM, Brooke Basile wrote:
>> On 9/22/20 7:06 AM, M. Vefa Bicakci wrote:
>>> Hello all,
>>>
>>> This is the third version of the patch sets originally published in t=
he
>>> e-mail thread thread at [1]. As mentioned in the same e-mail thread w=
ith
>>> the e-mail at [2], I was able to find a more acceptable solution to t=
he
>>> issue reported by Andrey Konovalov, where usbip takes over the
>>> dummy_hcd-provided devices set up by the USB fuzzing instance of the
>>> syzkaller fuzzer.
>>>
>>> In summary, the approach involves:
>>>
>>> * Removal of the usbip_match function.
>>> * Fixing two bugs in the specialised USB driver selection code.
>>> * Accommodating usbip by changing the logic in the specialised USB
>>> =C2=A0=C2=A0 driver selection code, while preserving legacy/previous =
behaviour.
>>>
>>> I have tested this patch set with Greg Kroah-Hartman's usb-next tree
>>> based on v5.9-rc6 with the base commit mentioned below in this e-mail=
,
>>> and I can report that usbip works as expected, with no regressions in=

>>> the usbip_test.sh self-test suite output compared to v4.14.119. I hav=
e
>>> also verified that the apple-mfi-fastcharge driver is correctly used
>>> when an iPhone is plugged in to my system. Finally, I can report that=

>>> Andrey Konovalov's "keyboard" test program making use of dummy_hcd,
>>> found at [3], also works as expected.
>>>
>>> I would appreciate your comments.
>>>
>>> Thank you,
>>>
>>> Vefa
>>>
>>> [1]=20
>>> https://lore.kernel.org/linux-usb/CAAeHK+zOrHnxjRFs=3DOE8T=3DO9208B9H=
P_oo8RZpyVOZ9AJ54pAA@mail.gmail.com/=20
>>>
>>> [2]=20
>>> https://lore.kernel.org/linux-usb/9f332d7b-e33d-ebd0-3154-246fbfb6912=
8@runbox.com/=20
>>>
>>> [3] https://github.com/xairy/raw-gadget
>>>
>>> Cc: Bastien Nocera <hadess@hadess.net>
>>> Cc: Valentina Manea <valentina.manea.m@gmail.com>
>>> Cc: Shuah Khan <shuah@kernel.org>
>>> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>>> Cc: Alan Stern <stern@rowland.harvard.edu>
>>> Cc: <syzkaller@googlegroups.com>
>>>
>>> M. Vefa Bicakci (4):
>>> =C2=A0=C2=A0 Revert "usbip: Implement a match function to fix usbip"
>>> =C2=A0=C2=A0 usbcore/driver: Fix specific driver selection
>>> =C2=A0=C2=A0 usbcore/driver: Fix incorrect downcast
>>> =C2=A0=C2=A0 usbcore/driver: Accommodate usbip
>>>
>>> =C2=A0 drivers/usb/core/driver.c=C2=A0=C2=A0=C2=A0 | 50 +++++++++++++=
+++++++++++------------
>>> =C2=A0 drivers/usb/usbip/stub_dev.c |=C2=A0 6 -----
>>> =C2=A0 2 files changed, 34 insertions(+), 22 deletions(-)
>>>
>>>
>>> base-commit: 55be22adf11b48c80ea181366685ec91a4700b7e
>>>
>>
>> Hi,
>>
>> I ran into this issue when trying to use two different FTDI serial TTL=
=20
>> cables on my laptop, running 5.9-rc7.
>>
>> This patch set fixes the issue.
>>
>> Oddly, I was unable to reproduce the issue on another laptop, also=20
>> running 5.9-rc7.
>>
>> Tested-by: Brooke Basile <brookebasile@gmail.com>
>>
>> Thank you!
>> Brooke Basile
>=20
> Hello Brooke,
>=20
> Thank you for the feedback! Greg Kroah-Hartman has committed the patche=
s
> to the usb-linus branch of the USB git tree about a week ago, so it may=

> unfortunately be a bit late to add your Tested-by tag to the patch seri=
es.
> Nevertheless, I appreciate your success report!
>=20
> In case you are interested, the committed patches can be seen here:
>   =20
> https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/log/?h=3D=
usb-linus&id=3D3fce39601a1a34d940cf62858ee01ed9dac5d459=20
>=20
>=20
> Thanks again,
>=20
> Vefa
>=20

Vefa,

Ah, no worries at all!  Sorry, I didn't see this on LKML so I assumed it =

hadn't been merged yet.
Thanks for the link!

Best,
Brooke Basile



Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8FD3280C78
	for <lists+linux-usb@lfdr.de>; Fri,  2 Oct 2020 05:11:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387491AbgJBDLy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 1 Oct 2020 23:11:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727780AbgJBDLy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 1 Oct 2020 23:11:54 -0400
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com [IPv6:2607:f8b0:4864:20::f41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C24B2C0613D0
        for <linux-usb@vger.kernel.org>; Thu,  1 Oct 2020 20:11:52 -0700 (PDT)
Received: by mail-qv1-xf41.google.com with SMTP id ef16so91050qvb.8
        for <linux-usb@vger.kernel.org>; Thu, 01 Oct 2020 20:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=uc2QDZ3Bf7vIOPlEoRb6xWeOC6zEjJ0XdzPqM03F85I=;
        b=Dy11IHEDp45zE4iHR2aLd84SydoBGVdn3R4u4JHtXjSq9HfqtyEepU0e0pZSh3WQ7z
         iy597C8J5RVB4zGvGnt1C9MlnvybZgfFNf1O+i11no46Qqgx1L1zcoAbhrGHDs41RGWO
         hZD2LLIOTlq+rYEeUc3KA9/dNofOyKTBsN8IxX3xYdAsexAbJB2HkGtSZFvEwqx0+/c8
         6lRH7kzmFNp/7vigXdlAfajf2Ll5syhZmxe6NMPAh9MyLcZGTWlPM+GGBEW6Cu6/EEYU
         Ow33iXirI1rKVFp0koXmGcoi744Bn0wBs/0vec27550YuScpkGTV1SksFj8UerXbZ9ra
         zkvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=uc2QDZ3Bf7vIOPlEoRb6xWeOC6zEjJ0XdzPqM03F85I=;
        b=Z+s9FUE4K+Rtv/SAznCDinfpoAw9JV0KPuqSk2sv4tDN1qk5HlZH6Fh1AbaQ+rU6RK
         VCk1cK9iAJZvsEt17Dbuw8iK/J3DebmbfihceeKNoD1xt0t0TyZ6hT96RNZE0k2OS/9A
         d29DeqqteF0Huv3rzrFHKMvofEZp82hKYdki8NaIy9Wgl8ggFE7WknBiQeg3RF1XwL82
         W8ZeRXXuv9CQBGFy+SBFXesJ76676WFvhwdPwk4DJNtHUzTl1KIHD1Ql41FCaGYmSl1j
         mvyr5RdZkWmt5TTgdwE9zdDWs/rvqtZISIU/OCQUU3xEd1MCUWTpK7U6AFM4tnQgpVKs
         4edQ==
X-Gm-Message-State: AOAM533KOvBn1QPXPqYbmWEaixItJZP7hrsAdG2F3dFceBd/TkQZw4U8
        d4tfwJUadgUzmP54D4szy8I=
X-Google-Smtp-Source: ABdhPJxjdMwewEsoXsNWVcJYlymjtI7sC7YZKHCleddOcX9bWPqIY2YTtD+U+u/k7gsjqtGhu5Z1TA==
X-Received: by 2002:a05:6214:d6b:: with SMTP id 11mr439344qvs.30.1601608311809;
        Thu, 01 Oct 2020 20:11:51 -0700 (PDT)
Received: from [192.168.1.181] (pool-173-75-208-99.phlapa.fios.verizon.net. [173.75.208.99])
        by smtp.gmail.com with ESMTPSA id v28sm203715qkv.72.2020.10.01.20.11.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2020 20:11:51 -0700 (PDT)
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
From:   Brooke Basile <brookebasile@gmail.com>
Message-ID: <36a8c401-029e-54ae-2468-04d557f3c31f@gmail.com>
Date:   Thu, 1 Oct 2020 23:11:50 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20200922110703.720960-1-m.v.b@runbox.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 9/22/20 7:06 AM, M. Vefa Bicakci wrote:
> Hello all,
> 
> This is the third version of the patch sets originally published in the
> e-mail thread thread at [1]. As mentioned in the same e-mail thread with
> the e-mail at [2], I was able to find a more acceptable solution to the
> issue reported by Andrey Konovalov, where usbip takes over the
> dummy_hcd-provided devices set up by the USB fuzzing instance of the
> syzkaller fuzzer.
> 
> In summary, the approach involves:
> 
> * Removal of the usbip_match function.
> * Fixing two bugs in the specialised USB driver selection code.
> * Accommodating usbip by changing the logic in the specialised USB
>    driver selection code, while preserving legacy/previous behaviour.
> 
> I have tested this patch set with Greg Kroah-Hartman's usb-next tree
> based on v5.9-rc6 with the base commit mentioned below in this e-mail,
> and I can report that usbip works as expected, with no regressions in
> the usbip_test.sh self-test suite output compared to v4.14.119. I have
> also verified that the apple-mfi-fastcharge driver is correctly used
> when an iPhone is plugged in to my system. Finally, I can report that
> Andrey Konovalov's "keyboard" test program making use of dummy_hcd,
> found at [3], also works as expected.
> 
> I would appreciate your comments.
> 
> Thank you,
> 
> Vefa
> 
> [1] https://lore.kernel.org/linux-usb/CAAeHK+zOrHnxjRFs=OE8T=O9208B9HP_oo8RZpyVOZ9AJ54pAA@mail.gmail.com/
> [2] https://lore.kernel.org/linux-usb/9f332d7b-e33d-ebd0-3154-246fbfb69128@runbox.com/
> [3] https://github.com/xairy/raw-gadget
> 
> Cc: Bastien Nocera <hadess@hadess.net>
> Cc: Valentina Manea <valentina.manea.m@gmail.com>
> Cc: Shuah Khan <shuah@kernel.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Alan Stern <stern@rowland.harvard.edu>
> Cc: <syzkaller@googlegroups.com>
> 
> M. Vefa Bicakci (4):
>    Revert "usbip: Implement a match function to fix usbip"
>    usbcore/driver: Fix specific driver selection
>    usbcore/driver: Fix incorrect downcast
>    usbcore/driver: Accommodate usbip
> 
>   drivers/usb/core/driver.c    | 50 ++++++++++++++++++++++++------------
>   drivers/usb/usbip/stub_dev.c |  6 -----
>   2 files changed, 34 insertions(+), 22 deletions(-)
> 
> 
> base-commit: 55be22adf11b48c80ea181366685ec91a4700b7e
> 

Hi,

I ran into this issue when trying to use two different FTDI serial TTL 
cables on my laptop, running 5.9-rc7.

This patch set fixes the issue.

Oddly, I was unable to reproduce the issue on another laptop, also 
running 5.9-rc7.

Tested-by: Brooke Basile <brookebasile@gmail.com>

Thank you!
Brooke Basile


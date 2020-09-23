Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 194A0275EEC
	for <lists+linux-usb@lfdr.de>; Wed, 23 Sep 2020 19:42:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726557AbgIWRm6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 23 Sep 2020 13:42:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726234AbgIWRm5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 23 Sep 2020 13:42:57 -0400
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com [IPv6:2607:f8b0:4864:20::843])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9755CC0613CE
        for <linux-usb@vger.kernel.org>; Wed, 23 Sep 2020 10:42:57 -0700 (PDT)
Received: by mail-qt1-x843.google.com with SMTP id e7so570655qtj.11
        for <linux-usb@vger.kernel.org>; Wed, 23 Sep 2020 10:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=aBpMxa0AhdY+HmStqdxjmTci0X9ObGOL6bHOjSyPr3k=;
        b=AiEKWgzvXixna7WJSIbt58U4+YN4qEAfutUbDVAFzaH8NzWO0GaAy4XfTngiNlxots
         +hY/GC09oU/K/9t7X+lC4raq/rE2BJhH/77odrq1czBDmrARthwvEMu9g/wBKG8iniqP
         b+8hScE9PQOUJVRNltBF2JC961ftI9t+TYdRxnwGI19G2xY6q+AjGaTU9blkmuX/Q/18
         1NHoPGeLkSOZdNPNGGc9lLv3tXf4/7Q8l1wFGgQvtk+fWt4zs76fTc4HgTVFIh36ahu0
         dz62b76vxOtzQ1Au7PeJ4l47x4mktH3huDlggAi5r9rPANHwjV0mdVJA7n+BDvDfHiw0
         vtYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=aBpMxa0AhdY+HmStqdxjmTci0X9ObGOL6bHOjSyPr3k=;
        b=bp0q6qvD2y+86qmGAKgWq7RkbRWi+C8OSo5Rf/Z6zN+9cqm9nXzGf8LmKQaRsLLhqx
         aQ1v7NJjv+o8vYtyb7gy8Wfrl5jwv5q13UBfk62yyooKFJYElFO9Im57Plh3O9cjt9hs
         A+zoSCATk+W0Le1/iSxDd4pcD90P8j/+qBsqbYhymNpmYWmGnQrcExDvZMpeD6k30p2U
         987D6IBR/fsqB+QBpNiGxdWR4kNb45FVyRRljOUbHk4vl8Sau76nmoRkTZMJ2pMQuCiK
         Da/QVcMmgD81P3XUXSEXra2RJeTDIcKPGTjGf6g63Z4IHarsnvcVzYjIQxyD2Y5KKVE1
         4u0Q==
X-Gm-Message-State: AOAM531W2Oy0lnbgUWFiPwO2uwhrd+KWQTD527VyV3zc9nHGHSd3EW9v
        higdl7nebWbDIw9TXozODFE89/ALZF22zLqD
X-Google-Smtp-Source: ABdhPJyn97zvWIdumgUMUiYGWjB9WErq6b+nOEeq4kTthLvX1DPraNJPOM7uSPTrb2gVi+wn+HEtoA==
X-Received: by 2002:ac8:3713:: with SMTP id o19mr1212075qtb.256.1600882976701;
        Wed, 23 Sep 2020 10:42:56 -0700 (PDT)
Received: from [192.168.1.181] (pool-173-75-208-99.phlapa.fios.verizon.net. [173.75.208.99])
        by smtp.gmail.com with ESMTPSA id q35sm294484qtd.75.2020.09.23.10.42.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2020 10:42:55 -0700 (PDT)
Subject: Re: INFO: trying to register non-static key in ath9k_htc_rxep
To:     Dmitry Vyukov <dvyukov@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     syzbot <syzbot+4d2d56175b934b9a7bf9@syzkaller.appspotmail.com>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        Andrey Konovalov <andreyknvl@google.com>,
        USB list <linux-usb@vger.kernel.org>,
        linux-kernel-mentees@lists.linuxfoundation.org
References: <13659a4e-ad71-0cef-4bfa-3eb4b8c73f4b@gmail.com>
 <000000000000cce55c05afe0f8f0@google.com>
 <CACT4Y+YmbmrH9gCCnCzP-FYa-dKxx9qhKZ+RQxi1f-+Hoj1SUg@mail.gmail.com>
 <20200922072639.GA1578565@kroah.com>
 <CACT4Y+YQf8NJTy9=UUrLiZidV8won0QCYmnVBy-5DFVXumRAPQ@mail.gmail.com>
From:   Brooke Basile <brookebasile@gmail.com>
Message-ID: <f66a9255-80d9-fbed-f99c-3c64ee060146@gmail.com>
Date:   Wed, 23 Sep 2020 13:42:55 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CACT4Y+YQf8NJTy9=UUrLiZidV8won0QCYmnVBy-5DFVXumRAPQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 9/22/20 3:38 AM, Dmitry Vyukov wrote:
> On Tue, Sep 22, 2020 at 9:26 AM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
>>
>> On Tue, Sep 22, 2020 at 08:49:39AM +0200, Dmitry Vyukov wrote:
>>> On Tue, Sep 22, 2020 at 8:21 AM syzbot
>>> <syzbot+4d2d56175b934b9a7bf9@syzkaller.appspotmail.com> wrote:
>>>>
>>>> Hello,
>>>>
>>>> syzbot has tested the proposed patch and the reproducer did not trigger any issue:
>>>>
>>>> Reported-and-tested-by: syzbot+4d2d56175b934b9a7bf9@syzkaller.appspotmail.com
>>>>
>>>> Tested on:
>>>>
>>>> commit:         98477740 Merge branch 'rcu/urgent' of git://git.kernel.org..
>>>> git tree:       upstream
>>>> kernel config:  https://syzkaller.appspot.com/x/.config?x=2c523334171d074
>>>> dashboard link: https://syzkaller.appspot.com/bug?extid=4d2d56175b934b9a7bf9
>>>> compiler:       gcc (GCC) 10.1.0-syz 20200507
>>>>
>>>> Note: testing is done by a robot and is best-effort only.
>>>
>>> Hi Brooke,
>>>
>>> As far as I understand, UBS is currently completely broken on upstream
>>> HEAD, so testing any USB bugs on upstream HEAD will lead to false
>>> positive results only.
>>
>> Broken in what way?  I don't see any bug reports here...
> 
> I mean this "USB driver ID matching broke":
> https://groups.google.com/g/syzkaller/c/VKfxh__m05w/m/ArzTtar-AgAJ
> syzkaller can't test usb, nor reproduce any existing bugs on the upstream tree.
> 

Hi Dmitry,

Thanks for the heads up and for the link to the thread with the information.

I recently fixed the following bug:
https://syzkaller.appspot.com/bug?id=cabffad18eb74197f84871802fd2c5117b61febf

I tested this on my local syzkaller instance before sending it in to 
syzbot and the kernel panic was resolved, however I did get "-busid- is 
not in match_busid table... skip!" in dmesg-- should this be taken as a 
false positive as well?

Best,
Brooke Basile

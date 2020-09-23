Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDF15275FD1
	for <lists+linux-usb@lfdr.de>; Wed, 23 Sep 2020 20:28:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726693AbgIWS2s (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 23 Sep 2020 14:28:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726650AbgIWS2s (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 23 Sep 2020 14:28:48 -0400
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com [IPv6:2607:f8b0:4864:20::f44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E5C3C0613CE
        for <linux-usb@vger.kernel.org>; Wed, 23 Sep 2020 11:28:48 -0700 (PDT)
Received: by mail-qv1-xf44.google.com with SMTP id p15so498199qvk.5
        for <linux-usb@vger.kernel.org>; Wed, 23 Sep 2020 11:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=VGzTEKpD5CpmrbQCtNlFNBWHnx22rQ0E5sQ9NHh5iAo=;
        b=gJCOFQNIMnvHis0Dq7EgkFUPXlANNifJ/24uhguwpuHpl3lrfmsueBs0HnY+mF9LOW
         rY19qrMOX+3o0nEwkY9Ksx1kJNsisKeMWSHHLaY4gvuTwFyZLDU1vROPrlH6hjoWGP71
         oDgwnNuOYs/fGnRM1ORAN2/tPOAisJyimdFH/h1elRsjNOCdHL75BTSJ8qKI99RlVUno
         kcW5y7W15wwwBnmtEeT46Q/kIuTcQXB9K7L94GMyCUeR80AVWaoPoU01TOnwZE3gFqZg
         SiNLq3QDjx52pjdtNTxYKAnEc1/vYY7ZBwBEu0wkFizMphLKiLSXfw+mUtXbrhczOT5m
         YM4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=VGzTEKpD5CpmrbQCtNlFNBWHnx22rQ0E5sQ9NHh5iAo=;
        b=McYCzQGJdpfQDZWH5g5+5Uu6yhm5G0nq2sysI6dvI5LraAMldk1iWE/XSmctKV0jMd
         77cIzzSnSJQQT/2Slx38aOxcusVWwRMyWG4IRw+ekgH3oDTMbt6hFXzjENV9lJ6LHyGr
         UNB+yFgC9R+yRVbWDLpxo66rQwRXxl+nDLbF5jykToMIq6x3JyDJsUnI+aO30jniC41b
         8LON6Bb42sd5FAzYn5hEJZu3D1YLB2z/FW6h6Lb/9uYa8EO7SS+fai9hRiPE+6/Lg4e4
         M/qj+n/bViE6ctJoQTFI8jEUm3o4L29QKJ8C4Mcd1m/DFfrhritlKZH8pNYUIVdRQb8X
         iEmw==
X-Gm-Message-State: AOAM530VXMjoTZPN/JrTTyytmeebMCKuf/8neFID7knpncBtMjQIjxLO
        1He3dg0evUg/tnnSZnembHs=
X-Google-Smtp-Source: ABdhPJzDoFcae5HkqTmP2YXY4IfF6kNXnB2Ip52b/UEKalRKgeelTw0kHSIsvegxGwYHXV/ToYeZZQ==
X-Received: by 2002:a0c:b409:: with SMTP id u9mr1355810qve.9.1600885727146;
        Wed, 23 Sep 2020 11:28:47 -0700 (PDT)
Received: from [192.168.1.181] (pool-173-75-208-99.phlapa.fios.verizon.net. [173.75.208.99])
        by smtp.gmail.com with ESMTPSA id z6sm516862qkl.39.2020.09.23.11.28.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2020 11:28:46 -0700 (PDT)
Subject: Re: INFO: trying to register non-static key in ath9k_htc_rxep
To:     Andrey Konovalov <andreyknvl@google.com>
Cc:     Dmitry Vyukov <dvyukov@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        syzbot <syzbot+4d2d56175b934b9a7bf9@syzkaller.appspotmail.com>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        USB list <linux-usb@vger.kernel.org>,
        linux-kernel-mentees@lists.linuxfoundation.org
References: <13659a4e-ad71-0cef-4bfa-3eb4b8c73f4b@gmail.com>
 <000000000000cce55c05afe0f8f0@google.com>
 <CACT4Y+YmbmrH9gCCnCzP-FYa-dKxx9qhKZ+RQxi1f-+Hoj1SUg@mail.gmail.com>
 <20200922072639.GA1578565@kroah.com>
 <CACT4Y+YQf8NJTy9=UUrLiZidV8won0QCYmnVBy-5DFVXumRAPQ@mail.gmail.com>
 <f66a9255-80d9-fbed-f99c-3c64ee060146@gmail.com>
 <CAAeHK+zwehY9a4ku56wzBUv2sArV5bfZGtKh6FPNz8a-AtQvyg@mail.gmail.com>
From:   Brooke Basile <brookebasile@gmail.com>
Message-ID: <8f8706c4-090d-20fe-a4c9-40d99d3a0e1c@gmail.com>
Date:   Wed, 23 Sep 2020 14:28:45 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAAeHK+zwehY9a4ku56wzBUv2sArV5bfZGtKh6FPNz8a-AtQvyg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 9/23/20 2:06 PM, Andrey Konovalov wrote:
> On Wed, Sep 23, 2020 at 7:42 PM Brooke Basile <brookebasile@gmail.com> wrote:
>>
>> On 9/22/20 3:38 AM, Dmitry Vyukov wrote:
>>> On Tue, Sep 22, 2020 at 9:26 AM Greg Kroah-Hartman
>>> <gregkh@linuxfoundation.org> wrote:
>>>>
>>>> On Tue, Sep 22, 2020 at 08:49:39AM +0200, Dmitry Vyukov wrote:
>>>>> On Tue, Sep 22, 2020 at 8:21 AM syzbot
>>>>> <syzbot+4d2d56175b934b9a7bf9@syzkaller.appspotmail.com> wrote:
>>>>>>
>>>>>> Hello,
>>>>>>
>>>>>> syzbot has tested the proposed patch and the reproducer did not trigger any issue:
>>>>>>
>>>>>> Reported-and-tested-by: syzbot+4d2d56175b934b9a7bf9@syzkaller.appspotmail.com
>>>>>>
>>>>>> Tested on:
>>>>>>
>>>>>> commit:         98477740 Merge branch 'rcu/urgent' of git://git.kernel.org..
>>>>>> git tree:       upstream
>>>>>> kernel config:  https://syzkaller.appspot.com/x/.config?x=2c523334171d074
>>>>>> dashboard link: https://syzkaller.appspot.com/bug?extid=4d2d56175b934b9a7bf9
>>>>>> compiler:       gcc (GCC) 10.1.0-syz 20200507
>>>>>>
>>>>>> Note: testing is done by a robot and is best-effort only.
>>>>>
>>>>> Hi Brooke,
>>>>>
>>>>> As far as I understand, UBS is currently completely broken on upstream
>>>>> HEAD, so testing any USB bugs on upstream HEAD will lead to false
>>>>> positive results only.
>>>>
>>>> Broken in what way?  I don't see any bug reports here...
>>>
>>> I mean this "USB driver ID matching broke":
>>> https://groups.google.com/g/syzkaller/c/VKfxh__m05w/m/ArzTtar-AgAJ
>>> syzkaller can't test usb, nor reproduce any existing bugs on the upstream tree.
>>>
>>
>> Hi Dmitry,
>>
>> Thanks for the heads up and for the link to the thread with the information.
>>
>> I recently fixed the following bug:
>> https://syzkaller.appspot.com/bug?id=cabffad18eb74197f84871802fd2c5117b61febf
>>
>> I tested this on my local syzkaller instance before sending it in to
>> syzbot and the kernel panic was resolved, however I did get "-busid- is
>> not in match_busid table... skip!" in dmesg-- should this be taken as a
>> false positive as well?
> 
> Hi Brooke,
> 
> Yes, this line means that the kernel is broken and testing USB
> programs with syzkaller is impossible.
> 
> Thanks!
> 
Gotcha, I'll hold off on working on USB bugs for now then.

The above patch has already been applied to the ath-next tree:
	https://patchwork.kernel.org/patch/11769845/

Should I have the patch reverted or is it safe to assume that any 
regressions will be caught in the -next tree?

Thank you,
Brooke Basile

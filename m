Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EE02292A43
	for <lists+linux-usb@lfdr.de>; Mon, 19 Oct 2020 17:22:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729852AbgJSPW0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 19 Oct 2020 11:22:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730019AbgJSPWZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 19 Oct 2020 11:22:25 -0400
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com [IPv6:2607:f8b0:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AFDBC0613D0
        for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2020 08:22:24 -0700 (PDT)
Received: by mail-il1-x12a.google.com with SMTP id q1so494176ilt.6
        for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2020 08:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=6itkt5xjcu8RJ55TJDt9qjiT96VHBXsR7l8iWPY1kfM=;
        b=T4D43KSTr/BTZjGGXxrmUHSbiu48CcOR1IihLZ++3IJorWFAh0aDEeHzPtRnxxLfvO
         soZc07fiT7+VOUM/7S+JFQom9wsrxs5n5uB0tXTuPWW/0qaK1ycLJpfyZ/hpsRQoHGhq
         uag4o/d0JTSQJdnpQ4cfcd06rks2pyqhpwoNc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6itkt5xjcu8RJ55TJDt9qjiT96VHBXsR7l8iWPY1kfM=;
        b=aXjIq1YORZAAFPsJqUxfGxCfOMON/IiQyCHrGbnA5ZQh0WyyNVTegm70gnxrdkGfZY
         Gv/pu9xycpTlYo0xoIAODs7xBVekwS8EouaQ2DaDmdngry6LoOLZEZsdkiHcsg/FP2Dl
         OKgHWZpi41BAvSwZIxFcgl5RyshhcHwlu8h+z92AHPkQq+x3PkL74lH5T/7ZQgcu6Wjx
         uhTijkVQmNBysTWt8f7spQ5BGgt5NGFStVJZpl7X8ulIVL7zghv32SAR7KyAZ8czwutP
         Oljy2ycTXD5l77SdiCzsENbcgit9vKwhi5uPEFACK2Lg9tgF/tntVENDk1ELqT+3iK1B
         4yig==
X-Gm-Message-State: AOAM530T7lNJyO6qRZye5P3nDTT25OLgPos/wYByn62rmjTGJtMYVABJ
        EW9D0gD64KQo3TSq/XOh/V7cMA==
X-Google-Smtp-Source: ABdhPJwacLcR2tRiPH6QS15W2qKZIkZ7mASOYnynQOhrw4LWuYYvA0e8BYLaUibr1/V5EPN4JSsx2Q==
X-Received: by 2002:a92:ab07:: with SMTP id v7mr434994ilh.82.1603120943821;
        Mon, 19 Oct 2020 08:22:23 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id d21sm49343ioi.39.2020.10.19.08.22.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2020 08:22:23 -0700 (PDT)
Subject: Re: KASAN: null-ptr-deref Write in event_handler
To:     Andrey Konovalov <andreyknvl@google.com>
Cc:     Shuah Khan <shuah@kernel.org>,
        Valentina Manea <valentina.manea.m@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        syzbot <syzbot+bf1a360e305ee719e364@syzkaller.appspotmail.com>,
        Nazime Hande Harputluoglu <handeharputlu@google.com>,
        Shuah Khan <skhan@linuxfoundation.org>
References: <000000000000810a4405b0ece316@google.com>
 <CAAeHK+xWQp87S=bF2RfUjcudGaLVjk3yKLL-bxRzVM=YNRtzRA@mail.gmail.com>
 <2947473d-76cd-a663-049a-4d51a97e2a3e@linuxfoundation.org>
 <4b6c9d53-a4de-8749-e0b1-055dbb42703b@linuxfoundation.org>
 <CAAeHK+wZGwovnT969F-aq+EzH8-K21GxJ7YJ0S0Ynd4GM_B4kA@mail.gmail.com>
 <5e0e21bd-5cc9-f1d8-d45e-ec7f10edbfba@linuxfoundation.org>
 <9256b41b-fe27-a453-ab30-8999379bc1e3@linuxfoundation.org>
 <CAAeHK+xpbCExXG2xP5xGBbMpJg4sesHLsMn++Qz47jfNELhXjQ@mail.gmail.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <9887a296-b98e-ef2b-553f-448cd9ad72b6@linuxfoundation.org>
Date:   Mon, 19 Oct 2020 09:22:21 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAAeHK+xpbCExXG2xP5xGBbMpJg4sesHLsMn++Qz47jfNELhXjQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 10/19/20 9:10 AM, Andrey Konovalov wrote:
> On Fri, Oct 16, 2020 at 9:48 PM Shuah Khan <skhan@linuxfoundation.org> wrote:
>>
>> Andrey,
>>
>> I am unable to reproduce the problem. I even tweaked the reproducer
>> to launch 10 procs and 100 threads.
>>
>> Can you test the following patch with your setup
>>
>> Here it is - also attached.
> 
> Hi Shuah,
> 
> I get the crash below with this change. It complains about
> kthread_stop_put() being called in atomic context.
> 

Thanks for testing. I was concerned about that. I will try to
reproduce the problem again.

I am running into a amd_gpu issue during boot on my test system
with KASAN enabled which results in disabling lock debugging. This
makes it harder to debug and fix this null-ptr-deref Write in
event_handler as it needs KASAN enabled. Fun stuff.

I will switch to a different test system and see if I can reproduce
the problem first.

Thanks again for testing.

thanks,
-- Shuah

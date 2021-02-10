Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A14FD317106
	for <lists+linux-usb@lfdr.de>; Wed, 10 Feb 2021 21:16:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232936AbhBJUQG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 10 Feb 2021 15:16:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232180AbhBJUPx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 10 Feb 2021 15:15:53 -0500
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com [IPv6:2607:f8b0:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4122C061574
        for <linux-usb@vger.kernel.org>; Wed, 10 Feb 2021 12:15:13 -0800 (PST)
Received: by mail-il1-x12a.google.com with SMTP id y5so3081645ilg.4
        for <linux-usb@vger.kernel.org>; Wed, 10 Feb 2021 12:15:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=J1a6cDUzXWVuASWBrVI4K9cZLXxGUovrDwHhTgPAC7k=;
        b=GKXFivfVvv6Yl40FDF1Z5LhWIJ6gxuHQrSsVVo1+sSsHjbc7vSVr///0bOKRX/dzwz
         iPirUogC6LyOUgyLj5KYl2OMhwcr5moIEUJr5zF1bHkMvcvkTJjA5WmTO4ghQppqK3sh
         6lO9AFmZQiJbamcyZLV4P65LrajWEVv8OctSc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=J1a6cDUzXWVuASWBrVI4K9cZLXxGUovrDwHhTgPAC7k=;
        b=PU8hhVvBfHl7SSyZ709/yJmEWgivWl29K2umE5Cu9p3IXFYYwuHPs0zSES2NrP6mbA
         ZKuSJ+Yq4n+G7WEJNqfqUl+6e8zACDkAkMI49QlqIe+gBl66L1+t1qJn2625VrcvnPDY
         vv8tkXvnZqvSbjpGcBhOPWsCz1skbv4UNzOwOtDXd8CTq0Sddbx+Fa1GC+46u58a7n1Y
         7WBzZGP5wNf8Acjiw4YhhS8TKjzUAfRqSMcvQUgzTy7uCjDbMfby6n8FCJSqjIKTQuEb
         Upo6XIsr4QEsWBjZyg1q9d9ISWOXpDuKqLt1hN/aqIjr48AtBlo/RgxuA29vNcOEwbqC
         5CKA==
X-Gm-Message-State: AOAM532OhjYqAJqG873m9zunycTC5ihYY8J+IK/btPKYYOJTGYXM1nQ1
        FF5c6dmYkNlEU+3FbglttSlapw==
X-Google-Smtp-Source: ABdhPJw0/kFJnIStKyO8WVO0eFrfq2j/vYHKEyYBkCheGxOVOLaX2yhK0tqOp67NQ+SCnL7cGar0kQ==
X-Received: by 2002:a92:c907:: with SMTP id t7mr2699585ilp.87.1612988113249;
        Wed, 10 Feb 2021 12:15:13 -0800 (PST)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id g6sm1483527ilf.3.2021.02.10.12.15.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Feb 2021 12:15:12 -0800 (PST)
Subject: Re: [PATCH] usb: usbip: fix error handling of kthread_get_run()
To:     Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>
Cc:     Hillf Danton <hdanton@sina.com>, linux-usb@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>,
        Shuah Khan <skhan@linuxfoundation.org>
References: <000000000000414db905b6e9bae8@google.com>
 <20210205135707.4574-1-penguin-kernel@I-love.SAKURA.ne.jp>
 <6b2b9f7c-a412-0f52-3373-bc58d1e95ad9@linuxfoundation.org>
 <ee936421-66ea-c6a7-fa1e-d4077ab28ed0@i-love.sakura.ne.jp>
 <1f4b36a1-460e-1154-b46c-32ba72b88205@linuxfoundation.org>
 <dffdefc9-9499-2cd0-fce9-b084df1511af@i-love.sakura.ne.jp>
 <2f922e76-623e-1d87-17a5-c4a87dc8f2fc@linuxfoundation.org>
 <bb8f438f-8a77-2aac-cb2b-b2551f6a64b0@i-love.sakura.ne.jp>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <f97b85c7-d319-0897-e0f1-29c4154ca060@linuxfoundation.org>
Date:   Wed, 10 Feb 2021 13:15:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <bb8f438f-8a77-2aac-cb2b-b2551f6a64b0@i-love.sakura.ne.jp>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2/10/21 11:43 AM, Tetsuo Handa wrote:
> On 2021/02/11 3:20, Shuah Khan wrote:
>> On 2/10/21 11:16 AM, Tetsuo Handa wrote:
>>> On 2021/02/11 3:11, Shuah Khan wrote:
>>>> I would like to see to see a complete fix. This patch changes
>>>> kthread_get_run() to return NULL. Without adding handling for
>>>> NULL in the callers of kthread_get_run(), we will start seeing
>>>> problems.
>>>
>>> What problems are you aware of?
>>>
>>
>> The fact that driver doesn't cleanup after failing to create
>> the thread is a problem.
> 
> What are the cleanup functions?
> 

When user-space requests attaching to a device, attach_store()
tries to attach the requested device. When kthread_get_run()
failure is ignored silently, and continue with call to
rh_port_connect(), user-space assumes attach is successful.
User thinks attach is successful.

When and how will this attach failure gets reported to the
in this scenario?

Error handling for this case is no different from other error
paths in attach_store().

Please see error handling for other errors in attach_store().
In this case the right error handling is to rewind the vdev
init and bail out returning error. This would include setting
vdev->ud.status to VDEV_ST_NULL.

I found the following reproducer that tells me how attach
is triggered.
https://syzkaller.appspot.com/text?tag=ReproC&x=128506e4d00000

syzbot is helping us harden these paths, which is awesome.
Fixing these have to consider user api.

I you would like to fix this, please send me a complete fix.

thanks,
-- Shuah

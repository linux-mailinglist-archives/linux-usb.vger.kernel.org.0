Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B6FF32647A
	for <lists+linux-usb@lfdr.de>; Fri, 26 Feb 2021 16:05:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230090AbhBZPEu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 26 Feb 2021 10:04:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230042AbhBZPEt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 26 Feb 2021 10:04:49 -0500
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com [IPv6:2607:f8b0:4864:20::d33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CC7BC061574
        for <linux-usb@vger.kernel.org>; Fri, 26 Feb 2021 07:04:09 -0800 (PST)
Received: by mail-io1-xd33.google.com with SMTP id n14so9919043iog.3
        for <linux-usb@vger.kernel.org>; Fri, 26 Feb 2021 07:04:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=HjfzUZHoKqfvc2I8SUsOTPs5AXbC4GDdKq1dwPKUckQ=;
        b=SBRPLUOcL6tfBgOfs/kUKD0DdEEkGTREzI0xkgvlyAvq8Szef/tub0dercRWjem3tC
         8VzMHoE9WQxy3pto4ocNMJwvwaztfYAHAFK+03dmjmiJ9zdu0iqtyz6uX2dQQ6NOHlp7
         5Ta0epil1ay3O6XqcBAfv+0AfYcRgo9cUAxvA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=HjfzUZHoKqfvc2I8SUsOTPs5AXbC4GDdKq1dwPKUckQ=;
        b=eq41aEgPpZl5w7WMtejfyxbMC6SZ+fG4v46gwkhL4fFfq8pRiijEp1VwuEM0wIU604
         MRz62O0PfXeJb17aQ3g9duUgLzGOAy/Xe89PhnxKGPeBSf6sLuRLyweI1b7Rve4jghUD
         R1HpUyDMD4o3XHVh5iDGjRR6pgQJw4EueqSkrf8G5Qacbj9QZpFYEp07bG4EWlNImNVT
         LcpEhLx5NAmKuvwY+2/t4F0M1aekJG0Qu+jek6IypJyGwOKhfMGdkVoyCd8pXLHjjJMf
         gabvADlmnyguUTPQrGqDUT0wqpd1te7iB3c8yyD8etSF5y64zPVGZHUw2uZBvCpl0ZGr
         O6/g==
X-Gm-Message-State: AOAM533QQg8i9+3ybHlzAcw51Vxf9vNScMkjQ5Yy1cl9AAE95/Z5LBbS
        gTJ/Eh/QzPLxDm5LZtJnA1tFymSxjdC+2A==
X-Google-Smtp-Source: ABdhPJwq7Uss5cey4W0yYLgL0fVpm67BXXpIqMMNmni5EMlIA78X2Usbf6mFVOomtGUPdn35nkUr0Q==
X-Received: by 2002:a5e:870f:: with SMTP id y15mr3186612ioj.68.1614351848568;
        Fri, 26 Feb 2021 07:04:08 -0800 (PST)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id c19sm4818224ile.17.2021.02.26.07.04.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Feb 2021 07:04:08 -0800 (PST)
Subject: Re: [PATCH v3] usb: usbip: serialize attach/detach operations
To:     Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, linux-usb@vger.kernel.org,
        Julia Lawall <julia.lawall@inria.fr>,
        The kernel test robot <lkp@intel.com>,
        Shuah Khan <skhan@linuxfoundation.org>
References: <YDCzLfhawx4u28dd@kroah.com>
 <20210223015907.3506-1-penguin-kernel@I-love.SAKURA.ne.jp>
 <95d1398b-6b95-2da4-43f7-7a6b0c87c4f8@linuxfoundation.org>
 <53dfc860-e118-4aac-8afd-80ea3fa2f4ce@i-love.sakura.ne.jp>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <df337d16-2a6e-f671-7134-449d7da6a9cb@linuxfoundation.org>
Date:   Fri, 26 Feb 2021 08:04:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <53dfc860-e118-4aac-8afd-80ea3fa2f4ce@i-love.sakura.ne.jp>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2/25/21 5:10 PM, Tetsuo Handa wrote:
> On 2021/02/26 9:00, Shuah Khan wrote:
>> This patch makes changes to 3 different drivers. Please split these
>> patches. Makes it easier to revert or fix them.
>>
>> Patch1 could add common routines and use them in stud_dev and vudc
>> Same for usbip_event_lock_killable() and usbip_event_unlock().
>> Introduce them in a separate patch.
>>
>> __usbip_sockfd_store() could be made common to stub_dev and vudc
>> similar to usbip_prepare_threads() and usbip_unprepare_threads()
>>
>> It will lot easier to review if this large patch is split into
>> smaller patches.
> 
> Then, can we apply
> https://lkml.kernel.org/r/20210205135707.4574-1-penguin-kernel@I-love.SAKURA.ne.jp
> as the first patch? It is very easy to review and apply and backport to stable.
> 

Same concerns as before about error path handling.

I have a patch in the works that is simpler and solves the crashes
you are seeing and addresses my error path concerns.

I will send it out later on today. Thanks for all the heavy lifting.
Much appreciated.

thanks,
-- Shuah

Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E630316EC9
	for <lists+linux-usb@lfdr.de>; Wed, 10 Feb 2021 19:35:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233956AbhBJSfH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 10 Feb 2021 13:35:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233947AbhBJScM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 10 Feb 2021 13:32:12 -0500
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com [IPv6:2607:f8b0:4864:20::d2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7AD0C061756
        for <linux-usb@vger.kernel.org>; Wed, 10 Feb 2021 10:20:31 -0800 (PST)
Received: by mail-io1-xd2d.google.com with SMTP id e133so2892633iof.8
        for <linux-usb@vger.kernel.org>; Wed, 10 Feb 2021 10:20:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=b43PsbKLZs/vBpTDQh9k4VdN96qQmTTLaCluxnQ4OkY=;
        b=DsgZ03jMXJdBHIWqhx/ApU5E4NFOkEfq+G+w5bm8MgUw9gTp9reH1rVREPFW/EqmWb
         UGxPW4tszVddOaeaC2xhAJfefybhi9MPYcryA5eCict/R5Q0hQjwinOdWKYOK6ktWVyD
         bKqHY0+vgk+rcGIcs1jJ7pGf9U+NVBUZs4oi0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=b43PsbKLZs/vBpTDQh9k4VdN96qQmTTLaCluxnQ4OkY=;
        b=YJ2vTrvkkFEGwgaKUgSoQftmIc/Hd34GewYP6YL+owiflpWvk4gRAXZhEsrnF7EbgM
         vS8s8EVN47EOkoxobbzI9QpxPCdhA6iJBDbM5OHy20Jl6HNx8vtbYy6kO2nxD2y/FeDq
         klBLtIvsuqkZ2hWL9ztnLS6RdQo3Mnsydisr/jOA00cPM2eYHzEtplQrKXWLmnnD1x8n
         16C7MKALbMf7ELVnRgUMln34i2YW25KDLd0VHcuM2c5F7oApobjQTOQkSBxPIpBj55PY
         b24kEjybySnHN5/h71vITDsVMSYpQGZkOgIK9zNCfpAraxOapSdc0rz50+IorT2Xt3XR
         ykrA==
X-Gm-Message-State: AOAM532S5F+fdUfvEzmmrqMcJaupq5/7QVeI3U5vXQL4149qUHLO9tLK
        fGogisbnUEO5pefGVQWL0Pu7qg==
X-Google-Smtp-Source: ABdhPJx9jPnbqOVfZRPeAIKJXTOTuyTJYssPYAT502YBX9u4fTAsSuwhlpi9SAKGrx4NWafogEszdA==
X-Received: by 2002:a05:6638:42:: with SMTP id a2mr4624716jap.99.1612981231322;
        Wed, 10 Feb 2021 10:20:31 -0800 (PST)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id i8sm1291097ilv.57.2021.02.10.10.20.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Feb 2021 10:20:31 -0800 (PST)
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
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <2f922e76-623e-1d87-17a5-c4a87dc8f2fc@linuxfoundation.org>
Date:   Wed, 10 Feb 2021 11:20:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <dffdefc9-9499-2cd0-fce9-b084df1511af@i-love.sakura.ne.jp>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2/10/21 11:16 AM, Tetsuo Handa wrote:
> On 2021/02/11 3:11, Shuah Khan wrote:
>> I would like to see to see a complete fix. This patch changes
>> kthread_get_run() to return NULL. Without adding handling for
>> NULL in the callers of kthread_get_run(), we will start seeing
>> problems.
> 
> What problems are you aware of?
> 

The fact that driver doesn't cleanup after failing to create
the thread is a problem.

>>
>> Does this patch fix the problem syzbot found?
> 
> Yes, this patch as-is avoids the crash syzbot found.
> 

Good to know. Please add handling for kthread_get_run() return
in the places I suggested in you next version of this patch.

thanks,
-- Shuah

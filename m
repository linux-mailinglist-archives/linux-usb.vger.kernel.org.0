Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12A0D38114B
	for <lists+linux-usb@lfdr.de>; Fri, 14 May 2021 21:57:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233256AbhENT6h (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 14 May 2021 15:58:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233187AbhENT6g (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 14 May 2021 15:58:36 -0400
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com [IPv6:2607:f8b0:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE4B5C061574
        for <linux-usb@vger.kernel.org>; Fri, 14 May 2021 12:57:22 -0700 (PDT)
Received: by mail-il1-x12d.google.com with SMTP id o9so754657ilh.6
        for <linux-usb@vger.kernel.org>; Fri, 14 May 2021 12:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=URzNzA8vwTk8ltn99LExmH9Gj1Z1XVZ/xKYnVSUJ+eY=;
        b=hgsntZOgovnbfwcq8LAgBDSF+PVAqFk+Ju2ltBGfH5ND1+JSIbu0c6EjXVMN59icok
         a4GCJC//h3rxW0E16RUMRSych/V7Hu2B7MkTLvRXbrL4THeEaXfqDIrBlwoCDifkBbsh
         xtlHJpvMQa2e4TOhH9Ziu2M44ze6iXEhgqMVc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=URzNzA8vwTk8ltn99LExmH9Gj1Z1XVZ/xKYnVSUJ+eY=;
        b=GgTdkDD1dSCDkMqj3kWhYf7CJmOhdv8t8PM1xC8W1Y1fNZDoz+klS0VSiwBeEVkjkc
         vysGHV9aPQw243DBdFQ/lTQV0q9Fo9u0CIa+ju1vJXurCYIK7dtJaQEjC8AFJoJHeCf7
         ihbkc2HxKnEW4AGUcgaY+e8HuWLJk2l6M24hA21WJ0xok+KNuV4dHZvxXYEagui5bsA8
         fejbeoaFlsDgtf2SGK+kDL7eRO2A+7J2heap8HquoY4UXq1RAjT4W0G0wfnT056saHwT
         NN9kZ/vSpjIt4HVP2wpJYcuKx7WJxQSkkm0hvnn2zq15Mg0OW5oDCxo2hddBB/0tAyDr
         AXpQ==
X-Gm-Message-State: AOAM530X6DuNhQV4XbVUNXIZ82aVkTlj3Dgg8aR/3Vaf7tZbQzU9Ra22
        yd5i5z+k1If2O0A0CxQs3VHwdg==
X-Google-Smtp-Source: ABdhPJyp/b+5at/LzYZqPekDe6AZ5C8y/A3NmSXVzEe0D96R5hR+Z4HeaCWpaT0rQwiE1EIoqRNcRQ==
X-Received: by 2002:a05:6e02:4c4:: with SMTP id f4mr42333117ils.272.1621022242170;
        Fri, 14 May 2021 12:57:22 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id s23sm2749891iol.49.2021.05.14.12.57.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 May 2021 12:57:21 -0700 (PDT)
Subject: Re: [PATCH v2 07/10] thunderbolt: test: Remove sone casts which are
 no longer required
To:     David Gow <davidgow@google.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Brendan Higgins <brendanhiggins@google.com>
Cc:     Daniel Latypov <dlatypov@google.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        KUnit Development <kunit-dev@googlegroups.com>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-usb@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20210513193204.816681-1-davidgow@google.com>
 <20210513193204.816681-7-davidgow@google.com>
 <20210514060618.GA3511397@lahna.fi.intel.com>
 <CABVgOS=Zt8-dHPKTjjQ_C+jZ8ySZejjXyQYSN-hRF95cqCLYmw@mail.gmail.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <f9bc6cbc-2196-3418-4c8d-f47981cc8816@linuxfoundation.org>
Date:   Fri, 14 May 2021 13:57:20 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CABVgOS=Zt8-dHPKTjjQ_C+jZ8ySZejjXyQYSN-hRF95cqCLYmw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 5/14/21 1:27 AM, David Gow wrote:
> On Fri, May 14, 2021 at 2:08 PM Mika Westerberg
> <mika.westerberg@linux.intel.com> wrote:
>>
>> Hi,
>>
>> On Thu, May 13, 2021 at 12:32:01PM -0700, David Gow wrote:
>>> With some of the stricter type checking in KUnit's EXPECT macros
>>> removed, several casts in the thunderbolt KUnit tests are no longer
>>> required.
>>>
>>> Remove the unnecessary casts, making the conditions clearer.
>>>
>>> Signed-off-by: David Gow <davidgow@google.com>
>>
>> Looks good.
>>
>> Does this go through KUnit tree or you want me to take it? In case of
>> the former feel free to add:
>>
>> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
>>
> 
> Thanks. I think it's probably easier for this to go in via the KUnit
> tree, unless Brendan or Shuah have any objections.
> 

It is fine either way unless there are dependencies on the KUnit
tree. I can take this in through KUnit once Brendan looks at it.

thanks,
-- Shuah


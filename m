Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B336321B8B
	for <lists+linux-usb@lfdr.de>; Mon, 22 Feb 2021 16:35:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231491AbhBVPfW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 22 Feb 2021 10:35:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230302AbhBVPfO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 22 Feb 2021 10:35:14 -0500
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com [IPv6:2607:f8b0:4864:20::d30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5E0EC06174A
        for <linux-usb@vger.kernel.org>; Mon, 22 Feb 2021 07:34:30 -0800 (PST)
Received: by mail-io1-xd30.google.com with SMTP id s24so13622295iob.6
        for <linux-usb@vger.kernel.org>; Mon, 22 Feb 2021 07:34:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=7msZ9xj22dqXGIzjQ9fBlLW6jqLzXdmQWLiCiQMfGHk=;
        b=VwDuBsrOdGnaQkdVTbZ0sucgDtVCvYOJG71c84MH0nQtKdH9Jz1KF7RKcVeoFQa0iE
         Q/4XFyvgQKWZ8obuYgWTJvUulyHSIE8ExfDEhLsQtXeYSf995T9FZmrmVe4s73wgFaGQ
         qxU7dlSrET2H7uglR8BW4N6H4T9iy0kEriiQM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7msZ9xj22dqXGIzjQ9fBlLW6jqLzXdmQWLiCiQMfGHk=;
        b=LjiOkMiHcTtK3W6x6fjdkXLbekIdBvCU1HHSMiaSGQK8a4PoBcyWt02P81keQcGU8l
         y634rIwuCqsj0/T//uN7QO3SsF5WCgFQxhp7MQ2hnWU6mJWVdVQv63JpBH56q8PH20ut
         DHINkuQhzbn+CsE2wqk44TFnog6QyOLuMAeworcj+VJ9/x6vDx3WtAxVz7ARCm4U5Dw/
         caWVNOwUVP0OoVnMTKexGYtw3u02Q7fAgMqd9YdGG7xyWV8HUkj5ZtbpeBmwaPLd0HO2
         hBBdFHRJ7vDgEyzZQkyHYID5mShPSxNO13l/j5saTwF/wFO6lWLYW+ufsg2yx/Pqi355
         7bHg==
X-Gm-Message-State: AOAM53349l15H07GdNTrs0X1VBvb/2fP0+UeOgex5Hi8sHUADb82+kJu
        3lQa5RQBSDr+0pQITLe6ZH3biQ==
X-Google-Smtp-Source: ABdhPJxhrm5cyMgKyMbXRykf4cdUQOSindjUfW490dgbHSWivSzWhBOldzvuFOnKNFgyyI6jgLlM+g==
X-Received: by 2002:a05:6638:2721:: with SMTP id m33mr22884265jav.59.1614008070287;
        Mon, 22 Feb 2021 07:34:30 -0800 (PST)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id w1sm11510123ilv.52.2021.02.22.07.34.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Feb 2021 07:34:29 -0800 (PST)
Subject: Re: [PATCH v2] usb: usbip: serialize attach/detach operations
To:     Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        linux-usb@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20210219094744.3577-1-penguin-kernel@I-love.SAKURA.ne.jp>
 <20210219150832.4701-1-penguin-kernel@I-love.SAKURA.ne.jp>
 <YC/fF0c7PA3ndTPv@kroah.com>
 <68fe3981-27d2-1f8d-17c6-9cb773382e66@linuxfoundation.org>
 <f8110365-767d-6aa4-ff9e-3ab8380c0919@i-love.sakura.ne.jp>
 <YDCzLfhawx4u28dd@kroah.com>
 <e1fe719d-35df-3898-33dd-f8bfc6d10b5d@i-love.sakura.ne.jp>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <50126879-0095-b556-308f-36d5c75c2db0@linuxfoundation.org>
Date:   Mon, 22 Feb 2021 08:34:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <e1fe719d-35df-3898-33dd-f8bfc6d10b5d@i-love.sakura.ne.jp>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2/20/21 2:51 AM, Tetsuo Handa wrote:
> On 2021/02/20 15:58, Greg Kroah-Hartman wrote:
>>>> Also please run the usbip test on your changes:
>>>> tools/testing/selftests/drivers/usb/usbip/usbip_test.sh
>>>
>>> Too much requirements for me to run that test. I'm not a user of your module.
>>
>> It should be self-contained, what requirements do you see that you do
>> not have?
> 
> It asks me to build usbip tools from source code. I took source code from
> https://github.com/lucianm/usbip-utils , but I couldn't rebuild without
> removing -Werror from Makefile . Where is maintained source code?
> Please embed appropriate URL into usbip_test.sh .
> 

usbip tools are part of the kernel source. Please look under:

tools/usb/usbip

> Too many error messages to convince that the test succeeded. The only device listed
> in my environment is a Virtual Mouse, which makes me wonder if the test did work.
> Therefore, I think I should wait for your test result in your environment which
> would list appropriate devices.
> 

Please use the right tool version from the kernel sources. I usually
run with server and client running on the same system, client going
over the loopback interface. Server exports any input devices mouse
or keyboard.

I will run the test on your v3.

thanks,
-- Shuah

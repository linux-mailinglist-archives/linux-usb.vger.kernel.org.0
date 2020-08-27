Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B30B6254778
	for <lists+linux-usb@lfdr.de>; Thu, 27 Aug 2020 16:50:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728249AbgH0Oue (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 Aug 2020 10:50:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728107AbgH0NlT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 27 Aug 2020 09:41:19 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9F9BC061264
        for <linux-usb@vger.kernel.org>; Thu, 27 Aug 2020 06:41:09 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id v12so6443950ljc.10
        for <linux-usb@vger.kernel.org>; Thu, 27 Aug 2020 06:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=SQRD+t3B3BhDgCZyy/X8yI1I6ZdI7vaahMfVCu8hVtc=;
        b=CpXkU+hXp1QnM7ojLivh4d5Bmqi4h8btqinup18fFNC7GXCdtN0smcpO17RkifyAIx
         Y0amYg/fPzSsfG8gt9M90i3OSb/BtPcX2JDgFtmSAXjkVNEkrvyylvDZYP76e+5BDB8U
         lNx/uq7bb+38w5YPBEm02y20Fnv2ie3aoJoxs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=SQRD+t3B3BhDgCZyy/X8yI1I6ZdI7vaahMfVCu8hVtc=;
        b=sh8kl0Vzi1Xj9FLhvF6bifavRlRv//hzAS9p0h7uJwijUSNppgKzFDk1EoM5ZN+RZ3
         X2qTva+oEoMuWBGus9bi0b0XDWkAb1w/kq5PkajZhrVBClVjBM/RAz7kvPiFBLYBW8mr
         p2eCRTLAQTER5Rx3rdbcKemA0/aWXtcARiDK8UyhYd2Fpor+wWCIMA2ygT4puYEi+Qwh
         Axn3UC3kJAjdQYaEt0fFuj3P3irMvJXUJu54ysXeat8rlPMvWJ1juKIDyGKxDoxv7qoU
         QM7YQn3jeAUmpQ0nYwHemFikkX1nukNv+mGl3F/8vE+QWyLJSDdZv/7IuuIZo3gnRYlf
         7+gw==
X-Gm-Message-State: AOAM530fYA1eIwpy3QUBU1xMnxSMlXEwsYhnzjl8/CbfvqEHC2FRH900
        iW+Ol3XnPA6sa3GWrfEdfbuIgg==
X-Google-Smtp-Source: ABdhPJwkDjSUj8IlsGiwNf7IhV9DFi8APBm4o7xWJMxTxBgBybmgAqSoWU2asXcoivMC0ejHhlf40w==
X-Received: by 2002:a2e:a314:: with SMTP id l20mr10255281lje.213.1598535668264;
        Thu, 27 Aug 2020 06:41:08 -0700 (PDT)
Received: from [172.16.11.132] ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id n24sm483425lji.83.2020.08.27.06.41.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2020 06:41:07 -0700 (PDT)
Subject: Re: [PATCH] usb: atm: don't use snprintf() for sysfs attrs
To:     Alex Dewar <alex.dewar90@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Kees Cook <keescook@chromium.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        accessrunner-general@lists.sourceforge.net,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200824222322.22962-1-alex.dewar90@gmail.com>
 <48f2dc90-7852-eaf1-55d7-2c85cf954688@rasmusvillemoes.dk>
 <20200827071537.GA168593@kroah.com>
 <20200827131819.7rcl2f5js3hkoqj2@lenovo-laptop>
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <def24e9e-018c-9712-0d07-d4cbc84f07d9@rasmusvillemoes.dk>
Date:   Thu, 27 Aug 2020 15:41:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200827131819.7rcl2f5js3hkoqj2@lenovo-laptop>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 27/08/2020 15.18, Alex Dewar wrote:
> On Thu, Aug 27, 2020 at 09:15:37AM +0200, Greg Kroah-Hartman wrote:
>> On Thu, Aug 27, 2020 at 08:42:06AM +0200, Rasmus Villemoes wrote:
>>> On 25/08/2020 00.23, Alex Dewar wrote:
>>>> kernel/cpu.c: don't use snprintf() for sysfs attrs
>>>>
>>>> As per the documentation (Documentation/filesystems/sysfs.rst),
>>>> snprintf() should not be used for formatting values returned by sysfs.
>>>>
>>>
>>> Can we have a sysfs_sprintf() (could just be a macro that does sprintf)
>>> to make it clear to the next reader that we know we're in a sysfs show
>>> method? It would make auditing uses of sprintf() much easier.
>>
>> Code churn to keep code checkers quiet for pointless reasons?  What
>> could go wrong with that...

I did not (mean to) suggest replacing existing sprintf() calls in sysfs
show methods. But when changes _are_ being made, such as when replacing
snprintf() calls for whatever reasons, can we please not make it harder
for people doing manual audits (those are "code checkers" as well, I
suppose, but they do tend to only make noise when finding something).

>> It should be pretty obvious to any reader that you are in a sysfs show
>> method, as almost all of them are trivially tiny and obvious.

git grep doesn't immediately show that, not even with a suitable -C
argument, as you can't really know the potential callers unless you open
the file and see that the function is only assigned as a .show method.
And even that can be a pain because it's all hidden behind five levels
of magic macros that build identifiers with ##.

> Perhaps I should have mentioned this in the commit message, but the problem
> is that snprintf() doesn't return the number of bytes written to the
> destination buffer,

I'm perfectly well aware of that, TYVM (you may want to 'git log
--author Villemoes lib/vsprintf.c').

 but the number of bytes that *would have been written if
> they fitted*, which may be more than the bounds specified [1]. So "return
> snprintf(...)" for sysfs attributes is an antipattern. If you need bounded
> string ops, scnprintf() is the way to go. Using snprintf() can give a
> false sense of security, because it isn't necessarily safe.

Huh? This all seems utterly irrelevant WRT a change that replaces
PAGE_SIZE by INT_MAX (because that's what sprintf() is going to pretend
you passed). You get the same return value.

But I'm not at all concerned about whether one passes the proper buffer
size or not in sysfs show methods; with my embedded hat on, I'm all for
saving a few bytes of .text here and there. The problem, as far as I'm
concerned, is merely that adding sprintf() callers makes it harder to
find the problematic sprintf() instances.


>> Anyway, we've had this for 20 years,

My bad, for a moment I forgot that code and patterns of that vintage
cannot have bugs.

Rasmus

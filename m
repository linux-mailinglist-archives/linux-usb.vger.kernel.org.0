Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1823F218A4E
	for <lists+linux-usb@lfdr.de>; Wed,  8 Jul 2020 16:42:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729799AbgGHOm3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 Jul 2020 10:42:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729699AbgGHOm3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 8 Jul 2020 10:42:29 -0400
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com [IPv6:2607:f8b0:4864:20::d41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D02C7C08C5CE
        for <linux-usb@vger.kernel.org>; Wed,  8 Jul 2020 07:42:28 -0700 (PDT)
Received: by mail-io1-xd41.google.com with SMTP id q74so23685569iod.1
        for <linux-usb@vger.kernel.org>; Wed, 08 Jul 2020 07:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=olFZheMiwXV/hWN7JvWbJtXZG77gpY4w4jkiOAkoKwM=;
        b=A8AnotPqLSlZRRqYmspoS+6VXNBxfSG+I6aEVCqsfSgA+78sfaKBHlhDJuQvT5Z9fG
         ATD9tzSA3JJaeER79AscDOhx8gESCzX2TQ1BQqbx7rOvAkErjONQaQ5YxEM79dJipabC
         pCzFSpBDStem7TgumX2cqauSmd0K7vlrUSqHo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=olFZheMiwXV/hWN7JvWbJtXZG77gpY4w4jkiOAkoKwM=;
        b=sun4HskziSRmuoLopHG1Mbn9i0z36yZPCt5Q4YFR5/9hMB00O6RZkGrq3iUHpoCNfV
         2y1apwk3GZqgYO3beZt5Q3RWq0jPuAdJF1DzQWITdSF4cyp68Q6HKv1bhiAppaF++Z8r
         TwI8jAjK+laodO9BfYVsHoPuzCA38EMYvjqK8nUQV0JK+uGKM7LGUcywCZHuTRYK2CqF
         f5o25vBKzlLoLqvjAB0R41vMS002xmBAAORU2ixbIDq+3u/S1aAwYUcYs6oZdTBO98ov
         OZ/5FlSBdlUNEu29KmIQSypd6ouu8b40Bl1AWCpbiZdkKxCs/v+/THVhRnvocrIWdIry
         d6Hg==
X-Gm-Message-State: AOAM533l/I/DAcc0L5d0BZlfAB8s+ZPv7YmqP3hPemQ1hHqH0pFvEtxT
        t7LiZnf6yyOq6VZxFLKOlg7C9Q==
X-Google-Smtp-Source: ABdhPJztx42BQruhpR+Eein2ofg+xHraiz1u5gK80gHGG1Sl2yr4WRL+agEWtq6nE56YmByNEYSJ+Q==
X-Received: by 2002:a6b:1d7:: with SMTP id 206mr37360623iob.138.1594219348015;
        Wed, 08 Jul 2020 07:42:28 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id b21sm121894ioc.36.2020.07.08.07.42.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2020 07:42:27 -0700 (PDT)
Subject: Re: [PATCH] usbip: Use fallthrough pseudo-keyword
To:     Julia Lawall <julia.lawall@inria.fr>, Joe Perches <joe@perches.com>
Cc:     "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20200707195214.GA3932@embeddedor>
 <977e88c2-58cb-9507-c889-854e574a8f31@linuxfoundation.org>
 <8e08240671d65f1e92dbf5e1e066190149e0d074.camel@perches.com>
 <alpine.DEB.2.22.394.2007081209500.2558@hadrien>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <486d9450-21a9-fb35-3473-4e589005d1c7@linuxfoundation.org>
Date:   Wed, 8 Jul 2020 08:42:26 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.22.394.2007081209500.2558@hadrien>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 7/8/20 4:16 AM, Julia Lawall wrote:
> 
> 
> On Tue, 7 Jul 2020, Joe Perches wrote:
> 
>> On Tue, 2020-07-07 at 14:06 -0600, Shuah Khan wrote:
>>> On 7/7/20 1:52 PM, Gustavo A. R. Silva wrote:
>>>> Replace the existing /* fall through */ comments and its variants with
>>>> the new pseudo-keyword macro fallthrough[1]. Also, remove unnecessary
>>>> fall-through markings when it is the case.
>>>>
>>>> [1] https://www.kernel.org/doc/html/latest/process/deprecated.html?highlight=fallthrough#implicit-switch-case-fall-through
>>>>
>>>
>>> Is fallthrough syntax supported on our min gcc version?
>>
>> No.  Introduced in gcc 7.
>>
>>> Does checkpatch or coccicheck catch these cases?
>>
>> Kinda.  checkpatch isn't very good at it.
>> I _believe_, though I'm not at all sure,
>> that coccinelle can find these.
> 
> I would not guarantee anything about the support of Coccinelle for switch.
> Coccinelle does now have the ability to match on comments.  So since there
> is a distinct comment that it is to be removed, it might be possible to do
> that part automatically.
> 
> Maybe it would have to look something like this:
> 
> @r1@
> comments c : script:python() { code to recognize the comment };
> statement S;
> @@
> 
> S@c
> + fallthrough(); //or whatever is wanted
> 
> @@
> statement r1.S;
> @@
> 
> - S
> - fallthrough();
> + S
> + fallthrough();
> 
> The second rule probably looks pretty strange, but the goal is to remove
> the comments between S and fallthrough();
> 
> There is an example demos/comments.cocci that shows how to access the
> comment information using both ocaml and python.
> 

Thanks Julia. Maybe this is a way to address all of the cases. I am a
bit concerned about min gcc which is 4.8 and the fallthrough syntax
support is in gcc 7

-- Shuah


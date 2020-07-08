Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 822CE218A38
	for <lists+linux-usb@lfdr.de>; Wed,  8 Jul 2020 16:35:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729809AbgGHOfG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 Jul 2020 10:35:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729746AbgGHOfG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 8 Jul 2020 10:35:06 -0400
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B233C08C5CE
        for <linux-usb@vger.kernel.org>; Wed,  8 Jul 2020 07:35:06 -0700 (PDT)
Received: by mail-ot1-x342.google.com with SMTP id g37so13347415otb.9
        for <linux-usb@vger.kernel.org>; Wed, 08 Jul 2020 07:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=8hC3XvGyCsI20W0CB9NNMoDweDfY9pNGkQ9Zc0NBsrQ=;
        b=Hz0dHVKfKtEdJFlXltQaUHZzx6WteXWGkmSB7eD22oIwFeZVZELMu9EA49dnk3KZf/
         aS/ETKRKmCiOmiwgysN/+jpT7uxyUI58Z009UkjClozxMn7u/xlsXr9AbkwKe+uZv0VU
         RgWoSkklvaEdXxPUMaPjLgy3/DeSC40KLf2oo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8hC3XvGyCsI20W0CB9NNMoDweDfY9pNGkQ9Zc0NBsrQ=;
        b=gH/7MFR4CwoTbmV3or6HRmdb6Ky+iWgW42ym7FkVU5RqB6zhVBmmFjApLm0vIRNHos
         R/I/YhEkWWPm2nsALCOPZsc0PPgb2nflfogxuOLKpJUmHLubdzIWEyEbOpyC4albXbKT
         haoy3xPOZ+pwIo/T4EY6D+3h5yRf3RfR6NUe8wMHNAagSHAkxsvhM3mhPZQI89g2B/d6
         v0lp63//iJyKr2dkQiSv1ffnwaMVnzcyJeC5lBo90t3ycmhq8imRYCxGuTd1U8aI25c7
         qYNEoaHMFl7V8aWAPWVgepZHirIjTacbbygwJL2Hx73fMkZ2gsaiEcpFBb/lM3kc+Ukw
         LXxg==
X-Gm-Message-State: AOAM532S0sNwnwMFUgPoFZEj1bbkJkH1t8kytKs7P9kV5BXTPzIit9EK
        L+Pd0u62DjRJsL4XUEZ3z+/MsQ==
X-Google-Smtp-Source: ABdhPJw0gOV53aPbW5ql2DbAxEGAYpwAxjrPK+hBKhUzJEU+vwTdPq884fkUySj6uv8O6gWuq7ZXvQ==
X-Received: by 2002:a9d:7853:: with SMTP id c19mr28772727otm.68.1594218905540;
        Wed, 08 Jul 2020 07:35:05 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id r25sm3572oot.38.2020.07.08.07.35.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2020 07:35:04 -0700 (PDT)
Subject: Re: [PATCH] usbip: Use fallthrough pseudo-keyword
To:     Joe Perches <joe@perches.com>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Julia Lawall <julia.lawall@lip6.fr>,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20200707195214.GA3932@embeddedor>
 <977e88c2-58cb-9507-c889-854e574a8f31@linuxfoundation.org>
 <8e08240671d65f1e92dbf5e1e066190149e0d074.camel@perches.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <1b6b83f7-c749-6e0a-0001-2febbf01b603@linuxfoundation.org>
Date:   Wed, 8 Jul 2020 08:35:02 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <8e08240671d65f1e92dbf5e1e066190149e0d074.camel@perches.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 7/7/20 7:56 PM, Joe Perches wrote:
> On Tue, 2020-07-07 at 14:06 -0600, Shuah Khan wrote:
>> On 7/7/20 1:52 PM, Gustavo A. R. Silva wrote:
>>> Replace the existing /* fall through */ comments and its variants with
>>> the new pseudo-keyword macro fallthrough[1]. Also, remove unnecessary
>>> fall-through markings when it is the case.
>>>
>>> [1] https://www.kernel.org/doc/html/latest/process/deprecated.html?highlight=fallthrough#implicit-switch-case-fall-through
>>>
>>
>> Is fallthrough syntax supported on our min gcc version?
> 
> No.  Introduced in gcc 7.
> 

Gustavo,

In which case, this patch would break usbip build on older gcc
revisions.

thanks,
-- Shuah

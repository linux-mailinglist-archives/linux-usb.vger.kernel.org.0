Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAF2F218D1F
	for <lists+linux-usb@lfdr.de>; Wed,  8 Jul 2020 18:39:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730450AbgGHQjZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 Jul 2020 12:39:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730157AbgGHQjZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 8 Jul 2020 12:39:25 -0400
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com [IPv6:2607:f8b0:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E62AC061A0B
        for <linux-usb@vger.kernel.org>; Wed,  8 Jul 2020 09:39:25 -0700 (PDT)
Received: by mail-il1-x141.google.com with SMTP id q3so28934378ilt.8
        for <linux-usb@vger.kernel.org>; Wed, 08 Jul 2020 09:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Qa9LxZ/Xp7LSUBALu/srE8cRDf8Prb/D5kd949P1QlM=;
        b=U6erRdYaii7klc7yOP94p3/uPbGGnpncN/oc7Vqx0R5MDbJQ7folwjhamHzQffg03K
         TtT1P+8bnIx/8y3HgfyWpy6B6ykQmJIb6orrM0Wsa7wtad9sG/zAF0QOTGowWTZGWaR3
         JxpdGi2Qv2IMyEjhHBeP39h+XiFuYSCL3Jq90=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Qa9LxZ/Xp7LSUBALu/srE8cRDf8Prb/D5kd949P1QlM=;
        b=cDzD4BA831tBnkM7/klErSLQcqx3Z/COYcpVJHvVPACdL6oshFhZwQE8OCedfrDV6w
         Ul47NDRWzMoEhd7uvfoy+tCM2mPGCbxIuOsrSBW4+MTRvkfl2ViJNxaPDYRMBYXR78HQ
         bzTo4+PHTPTWWF2xvS4koJJ592Z+5QvyLswcYwZx9EQQwkgNbDYkoFG+R90zMYpqdGzo
         6LpY4plAThbxltm3BPfk4KE5RqY2EGX4EeAaSylhK+/sCktocaZFJmrGtHdv0ajvFDSF
         /XfvOHJ51XvrxajiPDobRhHKC4oZEkTX2cj7E/P419I/DC95RZAxnNtkT53gY/FhZDwl
         DAYg==
X-Gm-Message-State: AOAM530am+rgphyoOzcr+ejKci9iozDfSRDVLWE8JaZ/VUUNMRTjrwIw
        9dAz3l2lyb+iPH0TQS25ASsXaw==
X-Google-Smtp-Source: ABdhPJx8X2O1CogKcVn+rBwEE7qVExBLojkb/kbvaNGcLF7zCON1nxAI7Upk+AtfhsZ5gRv+EepLfg==
X-Received: by 2002:a92:8b51:: with SMTP id i78mr29409737ild.179.1594226364571;
        Wed, 08 Jul 2020 09:39:24 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id c3sm143942ilj.31.2020.07.08.09.39.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2020 09:39:23 -0700 (PDT)
Subject: Re: [PATCH] usbip: Use fallthrough pseudo-keyword
To:     Joe Perches <joe@perches.com>
Cc:     "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20200707195214.GA3932@embeddedor>
 <977e88c2-58cb-9507-c889-854e574a8f31@linuxfoundation.org>
 <8e08240671d65f1e92dbf5e1e066190149e0d074.camel@perches.com>
 <1b6b83f7-c749-6e0a-0001-2febbf01b603@linuxfoundation.org>
 <dd532813cc28b6f27b2d0ed6bd3529f2@perches.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <0459d720-b2f5-c604-9356-c022fa3d37c8@linuxfoundation.org>
Date:   Wed, 8 Jul 2020 10:39:22 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <dd532813cc28b6f27b2d0ed6bd3529f2@perches.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 7/8/20 9:39 AM, Joe Perches wrote:
> On 2020-07-08 07:35, Shuah Khan wrote:
>> On 7/7/20 7:56 PM, Joe Perches wrote:
>>> On Tue, 2020-07-07 at 14:06 -0600, Shuah Khan wrote:
>>>> On 7/7/20 1:52 PM, Gustavo A. R. Silva wrote:
>>>>> Replace the existing /* fall through */ comments and its variants with
>>>>> the new pseudo-keyword macro fallthrough[1]. Also, remove unnecessary
>>>>> fall-through markings when it is the case.
>>>>>
>>>>> [1] 
>>>>> https://www.kernel.org/doc/html/latest/process/deprecated.html?highlight=fallthrough#implicit-switch-case-fall-through 
>>>>>
>>>>>
>>>>
>>>> Is fallthrough syntax supported on our min gcc version?
>>>
>>> No.  Introduced in gcc 7.
>>>
>>
>> Gustavo,
>>
>> In which case, this patch would break usbip build on older gcc
>> revisions.
> 
> No it will not.  Comment fall through was introduced in gcc 7 and this 
> devolved into a do while 0

Ah thanks. I didn't know that. No concerns of patch to go in.

thanks,
--- Shuah


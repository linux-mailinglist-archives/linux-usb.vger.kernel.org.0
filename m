Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD8723E82B8
	for <lists+linux-usb@lfdr.de>; Tue, 10 Aug 2021 20:17:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236737AbhHJSRa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 10 Aug 2021 14:17:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238814AbhHJSPA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 10 Aug 2021 14:15:00 -0400
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73D9CC03E586
        for <linux-usb@vger.kernel.org>; Tue, 10 Aug 2021 10:46:58 -0700 (PDT)
Received: by mail-ot1-x32f.google.com with SMTP id d10-20020a9d4f0a0000b02904f51c5004e3so9946otl.9
        for <linux-usb@vger.kernel.org>; Tue, 10 Aug 2021 10:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=JNGqukZNLlv0aFWFy8HqZUMwbBzjAv62MTk5xyepWJw=;
        b=JfO53THyZ/pY2Xgb1vnPJRiXpCwHfgtTuAcYvNL5SGoveEsmVu2JWOCg2g3iO1AZtX
         YKuH+MlMF8XZayefBH1H5H4Eu2wbfzZhlXPFXA2PIRR4YWugzdysKg4p0EW5t6L8VENH
         Qci8mcQbZLW9n3WVkF8zuYA02j6t97zQqxmdI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=JNGqukZNLlv0aFWFy8HqZUMwbBzjAv62MTk5xyepWJw=;
        b=Ogst/LImsJtScX2pVqJGwPYi+ZI1/445izRM9fqPQBbToveeMtIu3F9yGsbjg0ylI4
         Gqa6G8OTvPBtbbCBMu+HW5pp8a3RdjENAW6j3r4z5zH1gnPwmk1e0lFlOIa1XqwC9ip4
         DVEE87746XZ1YG65ogzQh6cx5b4ZW4cG0Pk0dE0RQOOheQN8o+7PyyavZIB9l07v7yl1
         uh4kPMXo1SAL23LXzADaDAWVH242AaNvIpyYSTNIybrJ9d9ywOoGkgrQCHchx1pjo5aN
         B/bgrBiiIcSUcis8Vm202DbErA+Or+pI+TK4m2WAme0o5c0oJRcSo+Ofo9WEdX0lJww1
         6V4w==
X-Gm-Message-State: AOAM530MHa0IzHNhTydg+/qFZrelNXGectIQqaFhIl4XXEJSsAK66JL4
        aaH64YAJZY1Epm5na2Vn4hXHuw==
X-Google-Smtp-Source: ABdhPJy4obKBBysTjZZbvUO3M5drqw9Q+yzknQFK4vObi5m9f4ZVdhjK1X/c/sZE3MwQ+PxfPSrLCw==
X-Received: by 2002:a05:6830:16cb:: with SMTP id l11mr21199314otr.209.1628617617843;
        Tue, 10 Aug 2021 10:46:57 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id y5sm2778886ots.56.2021.08.10.10.46.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Aug 2021 10:46:57 -0700 (PDT)
Subject: Re: [PATCH v2] vhci_hcd: USB port can get stuck in the disabled state
To:     Michael <msbroadf@gmail.com>
Cc:     valentina.manea.m@gmail.com, shuah@kernel.org,
        gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20210721235526.10588-1-msbroadf@gmail.com>
 <7b02cb66-d672-ae95-01ea-c6015725e1ac@linuxfoundation.org>
 <CALdjXpA4_eXen6RjhsEBYt8CQs-2gzwYs9h9q0Z2LKZ=rXVp+Q@mail.gmail.com>
 <ad07410b-05d6-6a12-13df-14e31cbf50ff@linuxfoundation.org>
 <CALdjXpBPRraC8xxORgE3SXw4xFnTW-Y6rLbcS+Cx0xYq3+aBeQ@mail.gmail.com>
 <976d34c0-d603-1f16-edbd-ad6c8881ad4e@linuxfoundation.org>
 <CALdjXpAzE3o7Bwdvj1TvsBRpDWDe1FZ8LsmL5q0suxYnRJCOaA@mail.gmail.com>
 <5165bd84-11af-35dd-8a9b-11c7f219fb88@linuxfoundation.org>
 <CALdjXpCmx_nfYEguv9UvOrBMYFxB4sqwmNiV99ggHRZnZjiM-A@mail.gmail.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <4f345afe-61d5-66b3-3252-562988c8926f@linuxfoundation.org>
Date:   Tue, 10 Aug 2021 11:46:56 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CALdjXpCmx_nfYEguv9UvOrBMYFxB4sqwmNiV99ggHRZnZjiM-A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 8/2/21 7:00 PM, Michael wrote:
> On Tue, 3 Aug 2021 at 09:14, Shuah Khan <skhan@linuxfoundation.org> wrote:
>>
>> On 7/30/21 5:52 PM, Michael wrote:
>>> Yes i think just adding the VDEV_ST_USED check in addition to the
>>> VDEV_ST_NOT_ASSIGNED state is fine and would fix the issue.
>>>
>>
>> Can you please confirm if this works?
>>
>>> After many years of writing virtualhere (a similar system to usb/ip
>>> but cross-platform and different non-kernel way of doing it server
>>> side) I've seen many drivers that issue reset at any time. Loading
>>> firmware is usually the reason.  Also sometimes switching
>>> configurations requires a reset also, for example some gaming wheels
>>> do this. I don't think you should make this VDEV_ST_USED check
>>> specific to Wifi devices, as a lot of devices don't follow too closely
>>> to the USB protocol to begin with from my experience. They primarily
>>> base their USB interactions assuming the windows platform and its
>>> quirks.
>>>
>>
>> When sending responses to Linux kernel mailing lists, please use bottom post.
>> This check will be used for all drivers. We don't add checks for specific cases
>> in the code.
>>
>> thanks,
>> -- Shuah
>>
> 
> Yes it works with that change.
> 

Would you like to send me a patch for this?

thanks,
-- Shuah

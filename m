Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CD07333214
	for <lists+linux-usb@lfdr.de>; Wed, 10 Mar 2021 00:53:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232111AbhCIXw3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 9 Mar 2021 18:52:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230320AbhCIXwY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 9 Mar 2021 18:52:24 -0500
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com [IPv6:2607:f8b0:4864:20::d35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25D10C06174A
        for <linux-usb@vger.kernel.org>; Tue,  9 Mar 2021 15:52:24 -0800 (PST)
Received: by mail-io1-xd35.google.com with SMTP id f20so15919822ioo.10
        for <linux-usb@vger.kernel.org>; Tue, 09 Mar 2021 15:52:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=REUw8g2y43c321ZFf4wniE6SfG0LnaZCmbqDKBfW+Q0=;
        b=ZYVgmEtQBfN41n39yuDbyeBtwB6/iRzY9OcJ5Qk9edUYMYOL2R6H5GN8QXePUgLJlf
         jINDmgG8JIzXPROv1WdKrtIrcrqvAz0lao62anrh9IUr1dL5OLpq9ZKMNLdEknpkCljT
         Z8dyYb40amb51BWS8DBeVhVRIALabb+0rhHQE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=REUw8g2y43c321ZFf4wniE6SfG0LnaZCmbqDKBfW+Q0=;
        b=R6MVWIAg1jW6HVPrgpd3ncaHd4s/um6zVKZaBqKk6eqVdsMfo3WPQbpO4l5f0hio5R
         pSEENBmd4XbhWpGIgZHWXLfjaw7yJcyraT48Z9eLxIS+h5mlqqzmlcqCDeW/0sHUUXFE
         gaHK6bmWCRsd9/m3BTxyPYn2RS+X0CXtrHGgnMoaFxZiHc0dZQHdDXkrLZAlFm8ZnXak
         ixh0LBGpOhXcIeAzwMUKiMx55QQWlVLzN4nGighAdjI9RfN2WrxNSMLGoBfkNPyFl2Qp
         tWJe36JAMxxDgPP5fo6Dv0rvkmWK5yhVSZsyrf8pArnZm8Wj7Hb3K0sUh7fyc8BWrVBG
         0IoA==
X-Gm-Message-State: AOAM530Y4D4ow98dKXj/rhn8Gscamof8ckBRK1/U/5a60yZ4KpZjti7v
        oPqAO8Drfcp7zmUm4vjDhM9WbA==
X-Google-Smtp-Source: ABdhPJxXgWT9Wk8M/LPzPo8BcOhkb/1qJlj68iw5KG8LyfeKPaKLgwje19EwC1mDfAyBL1muC0PasQ==
X-Received: by 2002:a6b:f401:: with SMTP id i1mr491311iog.142.1615333943479;
        Tue, 09 Mar 2021 15:52:23 -0800 (PST)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id l16sm8452842ils.11.2021.03.09.15.52.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Mar 2021 15:52:23 -0800 (PST)
Subject: Re: [PATCH 4/6] usbip: fix stub_dev usbip_sockfd_store() races
 leading to gpf
To:     Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        shuah@kernel.org, valentina.manea.m@gmail.com,
        gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>
References: <cover.1615171203.git.skhan@linuxfoundation.org>
 <268a0668144d5ff36ec7d87fdfa90faf583b7ccc.1615171203.git.skhan@linuxfoundation.org>
 <05aed75a-4a81-ef59-fc4f-6007f18e7839@i-love.sakura.ne.jp>
 <5df3d221-9e78-4cbe-826b-81cbfc4d5888@i-love.sakura.ne.jp>
 <3305d1a1-12e2-087b-30f5-10f4bf8eaf83@linuxfoundation.org>
 <f8f5e763-da2d-b26f-c6a5-d345bbe55448@i-love.sakura.ne.jp>
 <30a1afb2-d5a4-40b2-385d-24a2bf110e92@linuxfoundation.org>
 <7b9465aa-213e-a513-d033-12c048df15d6@i-love.sakura.ne.jp>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <05e8e744-0847-cde2-b978-0bfd7ef93a9f@linuxfoundation.org>
Date:   Tue, 9 Mar 2021 16:52:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <7b9465aa-213e-a513-d033-12c048df15d6@i-love.sakura.ne.jp>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 3/9/21 4:40 PM, Tetsuo Handa wrote:
> On 2021/03/10 4:50, Shuah Khan wrote:
>> On 3/9/21 4:04 AM, Tetsuo Handa wrote:
>>> On 2021/03/09 1:27, Shuah Khan wrote:
>>>> Yes. We might need synchronization between events, threads, and shutdown
>>>> in usbip_host side and in connection polling and threads in vhci.
>>>>
>>>> I am also looking at the shutdown sequences closely as well since the
>>>> local state is referenced without usbip_device lock in these paths.
>>>>
>>>> I am approaching these problems as peeling the onion an expression so
>>>> we can limit the changes and take a spot fix approach. We have the
>>>> goal to address these crashes and not introduce regressions.
>>>
>>> I think my [PATCH v4 01/12]-[PATCH v4 06/12] simplify your further changes
>>> without introducing regressions. While ud->lock is held when checking ud->status,
>>> current attach/detach code is racy about read/update of ud->status . I think we
>>> can close race in attach/detach code via a simple usbip_event_mutex serialization.
>>>
>>
>> Do you mean patches 1,2,3,3,4,5,6?
> 
> Yes, my 1,2,3,4,5,6.
> 
> Since you think that usbip_prepare_threads() does not worth introducing, I'm fine with
> replacing my 7,8,9,10,11,12 with your "[PATCH 0/6] usbip fixes to crashes found by syzbot".
> 

Using event lock isn't the right approach to solve the race. It is a
large grain lock. I am not looking to replace patches.

I still haven't seen any response from you about if you were able to
verify the fixes I sent in fix the problem you are seeing.

thanks,
-- Shuah



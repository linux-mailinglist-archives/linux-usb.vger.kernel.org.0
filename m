Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1372332F4F
	for <lists+linux-usb@lfdr.de>; Tue,  9 Mar 2021 20:51:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231243AbhCITvR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 9 Mar 2021 14:51:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231358AbhCITun (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 9 Mar 2021 14:50:43 -0500
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com [IPv6:2607:f8b0:4864:20::d35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07938C06175F
        for <linux-usb@vger.kernel.org>; Tue,  9 Mar 2021 11:50:43 -0800 (PST)
Received: by mail-io1-xd35.google.com with SMTP id u8so15230030ior.13
        for <linux-usb@vger.kernel.org>; Tue, 09 Mar 2021 11:50:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=s4S8/+/ShE6kjbQJvDKz3qw4bMkp0nOrlz4OJ6atpPo=;
        b=brHTK+bpVwVqvkjz6Ihcl1pRXYVgX+aShYtWFnIis/UUQ6rJdQOCxVo4j/BUMf2wQc
         QtNq4xgOXkxTZb7u8uK22Y+NSdA9+RpYaav0Yh9kvhtveD5HO/WWRg1sfc+m/za4qShF
         hKEbY1YXlwaKoIYOTBUU9Tmr2mJ9X02DX2Lw4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=s4S8/+/ShE6kjbQJvDKz3qw4bMkp0nOrlz4OJ6atpPo=;
        b=XjyEWSG57jOtcJex4EOis0NnQ6JnlUHqREk2RFVBr5041W4a3xnqWuLcXT88nRLHM2
         38hjfR4rQ+/sfiOwjYSdpNPKvZrh4Z1mHetebKpubLGaQJ8z/TH9Agjq/Iw7lG6Hwe8Q
         rUZuO1CI4sE7CUT6DIwpCIgbD2vQanJT+hnd6XdBxE8onOXfk31sOqzTNBcEkolJ3X1q
         ADvnBqGRPHdMjqsrhNhT9latrixePuHHJ7sGxwS/A49jz9Ot1XUPmvO8Y3W0N4DxejVD
         WbzPB4QzX/6CeMA1Exh4F3CGpT5QUcX/UTnltTPctftXNexVgR4J2aHtOdynvVhrFSlV
         smbw==
X-Gm-Message-State: AOAM532RDbcC+dsvy6wXEM99lRKCgGxI/ZmploHW16YwwAuJB1FjIB0P
        hu4EFBhBrhU5uczQ3VlAQ8KKFgjNE3bgtg==
X-Google-Smtp-Source: ABdhPJy65Q596qcb6e0PepIhXZafRRXfsEfQveMLO0xDgBWnvZWM59tXqEJZfFh5v6iTU1c3qfyRjQ==
X-Received: by 2002:a02:6654:: with SMTP id l20mr5506243jaf.55.1615319442445;
        Tue, 09 Mar 2021 11:50:42 -0800 (PST)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id x16sm8170308ilp.44.2021.03.09.11.50.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Mar 2021 11:50:42 -0800 (PST)
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
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <30a1afb2-d5a4-40b2-385d-24a2bf110e92@linuxfoundation.org>
Date:   Tue, 9 Mar 2021 12:50:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <f8f5e763-da2d-b26f-c6a5-d345bbe55448@i-love.sakura.ne.jp>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 3/9/21 4:04 AM, Tetsuo Handa wrote:
> On 2021/03/09 1:27, Shuah Khan wrote:
>> Yes. We might need synchronization between events, threads, and shutdown
>> in usbip_host side and in connection polling and threads in vhci.
>>
>> I am also looking at the shutdown sequences closely as well since the
>> local state is referenced without usbip_device lock in these paths.
>>
>> I am approaching these problems as peeling the onion an expression so
>> we can limit the changes and take a spot fix approach. We have the
>> goal to address these crashes and not introduce regressions.
> 
> I think my [PATCH v4 01/12]-[PATCH v4 06/12] simplify your further changes
> without introducing regressions. While ud->lock is held when checking ud->status,
> current attach/detach code is racy about read/update of ud->status . I think we
> can close race in attach/detach code via a simple usbip_event_mutex serialization.
> 

Do you mean patches 1,2,3,3,4,5,6?

thanks,
-- Shuah

Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 682023A8812
	for <lists+linux-usb@lfdr.de>; Tue, 15 Jun 2021 19:50:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231325AbhFORu6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 15 Jun 2021 13:50:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231241AbhFORu5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 15 Jun 2021 13:50:57 -0400
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com [IPv6:2607:f8b0:4864:20::d31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDB05C061574
        for <linux-usb@vger.kernel.org>; Tue, 15 Jun 2021 10:48:51 -0700 (PDT)
Received: by mail-io1-xd31.google.com with SMTP id h5so68561iok.5
        for <linux-usb@vger.kernel.org>; Tue, 15 Jun 2021 10:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=OMBjXE0nRB8hM4ofcPKfdh+yz7lSZL32Yvdx3/K1Jlo=;
        b=hKxtm8WFh9YoGvi0n7W5NAiFIcqM6qTSjF8UPIf1AJdLVuS9d4lDmVdlZ2CbC3LEBh
         OzNJQHSrOk7cyez+SEwLHyCLXJL+2nOUoUL45k8eDRYJrmDlPzX+LSlA6AEqRjebAi/E
         Uw19hk04bLMxvlKlW+t9l6GIpAqjntY+JrygE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=OMBjXE0nRB8hM4ofcPKfdh+yz7lSZL32Yvdx3/K1Jlo=;
        b=qWqNQ397jpa8vE+ivFYnrz/nKALXOgk12wiieCrGd65UkND8DSxrcNZY3SowCOBoLR
         Sb2hPljHxS4lALRy5wsOBP6wuvmnKLMSGhFx6d+cb9OVkrJA/JMNYBrcqZOjKLNhOwLX
         TkxUlbl4IUu0ZhpP3h57zh53EmLCdL/1FrX9XTNfa6gQGPoSLt+gHN+9owm7Ih9WOM70
         +n5rF8BQIivqptRRhgz9fqYCvD4jbYWU+Psok9GAaGweXNmDR+qwqPRdm075cwZKMIaP
         mtBnMROzVuzjLqaRduF7sj5MkYQbShP/VHDFNNd2KPDjop8yZ8/07kGYoJrt4+GT7p/u
         wClw==
X-Gm-Message-State: AOAM532HbchkTcSJXCpcQQCTdMcsVU8ox0fYT4G/lNsKG7q0rG8bQetS
        VF7HsZM3uKpAP1qgRYlMFMqnCA==
X-Google-Smtp-Source: ABdhPJzRmw+gb2MPsjwBJ8v4iy5MCoEBD646f5nqJkHMdAYrFtY+hr/mpSeNhJ0hTqIQ7KCPKyuOrQ==
X-Received: by 2002:a02:838c:: with SMTP id z12mr387399jag.89.1623779331309;
        Tue, 15 Jun 2021 10:48:51 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id e14sm9444583ile.2.2021.06.15.10.48.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Jun 2021 10:48:50 -0700 (PDT)
Subject: Re: [PATCH -next] usbip: tools: Convert list_for_each to entry
 variant
To:     Zou Wei <zou_wei@huawei.com>, valentina.manea.m@gmail.com,
        shuah@kernel.org
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>
References: <1623740319-15988-1-git-send-email-zou_wei@huawei.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <e86d8888-e8a2-bb20-4295-26442af455fa@linuxfoundation.org>
Date:   Tue, 15 Jun 2021 11:48:49 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1623740319-15988-1-git-send-email-zou_wei@huawei.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 6/15/21 12:58 AM, Zou Wei wrote:
> convert list_for_each() to list_for_each_entry() where
> applicable.
>  > Reported-by: Hulk Robot <hulkci@huawei.com>

What is the report? Please include the reports.

> Signed-off-by: Zou Wei <zou_wei@huawei.com>
> ---
>   tools/usb/usbip/libsrc/usbip_host_common.c | 4 +---
>   tools/usb/usbip/src/usbipd.c               | 8 ++------
>   2 files changed, 3 insertions(+), 9 deletions(-)
> 

Please explain why this change is necessary. Is it a good
idea to explain what happens if you don't make this change?

thanks,
-- Shuah

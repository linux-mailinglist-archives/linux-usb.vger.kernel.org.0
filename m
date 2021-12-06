Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3645046A67E
	for <lists+linux-usb@lfdr.de>; Mon,  6 Dec 2021 21:02:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349115AbhLFUGL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Dec 2021 15:06:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245711AbhLFUGF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Dec 2021 15:06:05 -0500
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com [IPv6:2607:f8b0:4864:20::d2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C795BC0611F7
        for <linux-usb@vger.kernel.org>; Mon,  6 Dec 2021 12:02:36 -0800 (PST)
Received: by mail-io1-xd2c.google.com with SMTP id x10so14348699ioj.9
        for <linux-usb@vger.kernel.org>; Mon, 06 Dec 2021 12:02:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:references:from:cc:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=yk3ousZPXXzXe52s/kVs7XK8dVsrx/pIIkEm67Z9oLE=;
        b=gzG2Y8Bp5NEV4LxXgvd50TIzXp49/hv0TShqQ82afdaM/uN0FW41hslIBFGUBAOo9S
         brmnWGwQb7fPCZrpbh0xd18h2i+WQgl73zrU+UO+fsMTO9NgEdw/w8g2XrhDpkd3Vjpw
         OD9Fop2658mn8SQ/laWaUQcQIm7+1ER1IfX1Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:references:from:cc:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=yk3ousZPXXzXe52s/kVs7XK8dVsrx/pIIkEm67Z9oLE=;
        b=Ng7Bo6iqKW3wZUCgWURTz+6c2jjcB1OSOWOGEdma4fdphn8W6Y/AXeEj1GQc6wJm4X
         1JDc6fR7PFPMFr7mG7v7M5f87te26wfRUH4bkqBa0NiQNgo7JTI3K7ZKqKxbzbJRvfah
         SkX/IopbcFW8HU3oDz3/2nuqo2Rp0C8vH2mvYEKB8RpB6awas/2WjPIi1CwHHHAT3m99
         MPdqFZn7l5DRQMNw4dhGee4MI9UKd9KGIFbuC1ut0mFwXwkj8U0VN9Zp1jxoZ6bLebIX
         FSftXyfGyBeiijuxQ25zb8pUc/02cu39pvP24lsFNEgGJmKpfmdSYg4FU3LTJmbv9RFc
         24xg==
X-Gm-Message-State: AOAM530q+4jIhErOycRDNRY2oK/z2S2odTyuDYHlmE6mWxJvcEFVKki3
        fbvmpiAjApadXHOkQMujuBKewMQnIDU8Qw==
X-Google-Smtp-Source: ABdhPJzMkM/a5XIBWQprI1ufd8AZdS9Aw0g3x/jA3b4O9Gq/xodLry0I+4tZnQ3txdVT+ab8HIzCqg==
X-Received: by 2002:a5d:9857:: with SMTP id p23mr36348293ios.137.1638820956210;
        Mon, 06 Dec 2021 12:02:36 -0800 (PST)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id j21sm8000369ila.6.2021.12.06.12.02.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Dec 2021 12:02:35 -0800 (PST)
Subject: Re: [PATCH v6 0/5] tools/usbip: Patch set summary
To:     Lars Gunnarsson <gunnarsson.lars@gmail.com>,
        Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>
References: <20211130222254.GA16447@dell-precision-T3610>
From:   Shuah Khan <skhan@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <ea85cb17-69a1-6f6b-d1ab-a75eb73991e1@linuxfoundation.org>
Date:   Mon, 6 Dec 2021 13:02:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20211130222254.GA16447@dell-precision-T3610>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 11/30/21 3:22 PM, Lars Gunnarsson wrote:
> To forward a remote usb device over usbip the following steps is required:
> 
> 1. Execute "usbip bind" on remote end.
> 2. Execute "usbip attach" on local end.
> 
> These steps must be perfomed in above order and after usb device is plugged in.
> If the usb device is unplugged on the remote end the steps above needs to be
> performed again to establish the connection. This patch set implements a feature
> to persistently forward devices on a given bus. When using flag "-p|--persistent"
> on remot end, the USB device becomes exported when plugged in. When using flag
> "-p|--persistent" on local end, the USB device becomes imported when available
> on remote end. Thus it is only required to run the usbip command once on each
> end, in any order, to persistently forward usb devices on a given bus.
> 
> This is sent in five separate patches:
>    tools/usbip: update protocol documentation
>    tools/usbip: update manual pages
>    tools/usbip: add usb event monitor into libusbip
>    tools/usbip: export USB devices on a given bus persistently
>    tools/usbip: import USB devices on a given bus persistently
> 

When -p is used, the command stays in foreground. This is a very
different use model compared to current model. In addition, once
persistent flag is set on a bus, all devices even the ones that
are inserted in the future get exported. What happens if one of
the devices shouldn't be exported?

There are several conditions to be thought through:

- What happens if if the command that is running on the foreground
   is killed on either end?
- What happens when one or more devices are detached?
- What happens when one or more devices are unbound from
   the server?

Let's walk through these scenarios.

thanks,
-- Shuah



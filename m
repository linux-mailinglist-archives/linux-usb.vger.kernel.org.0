Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36DC44576D5
	for <lists+linux-usb@lfdr.de>; Fri, 19 Nov 2021 20:00:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235363AbhKSTDp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 19 Nov 2021 14:03:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234568AbhKSTDp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 19 Nov 2021 14:03:45 -0500
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com [IPv6:2607:f8b0:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DC5FC061574
        for <linux-usb@vger.kernel.org>; Fri, 19 Nov 2021 11:00:43 -0800 (PST)
Received: by mail-il1-x12f.google.com with SMTP id s14so11161628ilv.10
        for <linux-usb@vger.kernel.org>; Fri, 19 Nov 2021 11:00:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=XAEzHWF08EdlsQ6uHuhyOeYKqmfDnGnJ3ixv4DeJbt8=;
        b=Ka7RBmI+xAf0noF7sFe4MmKyRwU6YgezCUAaspWLoaAvN82Nnxv8ikGUWY1glj1mEZ
         XJkQX5IfcG7CDgLSr9fTcQNsqfk1c2D4JAkJk4tBCiE1vTFSRPjHmyNtiVS970Vys9/d
         wROiK65GkwMfow/yznFt6qPANYpc/L5QAZTeI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=XAEzHWF08EdlsQ6uHuhyOeYKqmfDnGnJ3ixv4DeJbt8=;
        b=EQ8vV4PMGO+BZ/fbwA+8eZn8DbWrtXlJrsW6yQ09LnXDaWr84g2OiViF5DfpeWpt5V
         QeuJzWmt9ZdyqN7rbCYE76qoKYrgBP7Mw7tTA2IYwg+L/Fd9LDPLGstDIr2N5MRVU/w6
         yaQxQncOrXbV8KZHv4VJCZ+kAVqhQI2tN6BAk7CWncQT6uCwX0xTT5XLMHlvYJqHwTZU
         8WBxLVkwr9f3j6JXq5KpCY/c2J7VOVY89GoMJC/KKySwEKwoKyiPLZyALWTPb076hkwo
         sA8/gIkGvcU97QlKWJWbparIcJto8nSpV24Z+IOQywQM5HjkqUJkbkDhdzAX9xamBDsu
         BzDA==
X-Gm-Message-State: AOAM530gCozVesvpkhtFvjVfRdCoFdGkfFi3S/lWw6Y+bnmlcQYGWM1t
        YwgSeKr7/a19DOUpJXO7kLASxg==
X-Google-Smtp-Source: ABdhPJw7ioWPueWnUxTkSmpbQuWphBCvPXE2x4ZoFWvASA+XXiZncW3mUeFxmUo5da/vsPByW5gUow==
X-Received: by 2002:a05:6e02:219c:: with SMTP id j28mr6415980ila.264.1637348442960;
        Fri, 19 Nov 2021 11:00:42 -0800 (PST)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id m2sm321083iob.21.2021.11.19.11.00.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Nov 2021 11:00:42 -0800 (PST)
Subject: Re: [PATCH v1 1/4] tools/usbip: update documentation
To:     Lars Gunnarsson <gunnarsson.lars@gmail.com>,
        Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>, linux-usb@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20211107171514.GA14492@dell-precision-T3610>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <ffecc1ad-2df3-9e9d-6001-b910c82d328c@linuxfoundation.org>
Date:   Fri, 19 Nov 2021 12:00:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20211107171514.GA14492@dell-precision-T3610>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 11/7/21 10:15 AM, Lars Gunnarsson wrote:
> This patch contains usbip protocol documentation updates for
> the implementation changes in subsequent patches.
> 
> Signed-off-by: Lars Gunnarsson <gunnarsson.lars@gmail.com>
> ---
> v1: New patch added in series.
> 
>   Documentation/usb/usbip_protocol.rst | 61 ++++++++++++++++++++++++----
>   1 file changed, 53 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/usb/usbip_protocol.rst b/Documentation/usb/usbip_protocol.rst
> index 0b8541fda4d8..1afe6d297efc 100644
> --- a/Documentation/usb/usbip_protocol.rst
> +++ b/Documentation/usb/usbip_protocol.rst
> @@ -9,6 +9,11 @@ The USB/IP protocol follows a server/client architecture. The server exports the
>   USB devices and the clients import them. The device driver for the exported
>   USB device runs on the client machine.
>   
> +Initially the server may choose to export any of its available USB devices,
> +based on the busid. The device will remain exported until it's unplugged or
> +unbound from the usbip driver. It is also possible to persistently export
> +devices on a given bus by monitor when they are plugged in.
> +

The current description is mixing export and unbound.
Let's rephrase this as follows.

"The server may choose to export any of its available USB devices based on their
busid. These devices will remain exported until they are unplugged or unexported.
Optionally, it is possible to persistently export the devices on a given bus by
monitor when they are plugged in"

I don't see tools/usb/usbip/doc updated to reflect the new commands? Please
include tools/usb/usbip/doc to both usbipd.8 and usbip.8 to describe how this
new feature can be used. Also include details on how to reverse persistent
export. Right now it is a decision made on each boot and there is no need to
be concerned about exporting devices that should no longer be exported. With
this feature, it becomes important to make sure there is clear indication that
devices are being exported in persistent manner.

I would like to see the doc updates - please add them as the second patch in
this series, so it would be easier for people to review.

thanks,
-- Shuah

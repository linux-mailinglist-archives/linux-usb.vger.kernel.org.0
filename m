Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F54A115872
	for <lists+linux-usb@lfdr.de>; Fri,  6 Dec 2019 22:12:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726388AbfLFVML (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 6 Dec 2019 16:12:11 -0500
Received: from mail-il1-f194.google.com ([209.85.166.194]:45054 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726353AbfLFVMK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 6 Dec 2019 16:12:10 -0500
Received: by mail-il1-f194.google.com with SMTP id z12so7431330iln.11
        for <linux-usb@vger.kernel.org>; Fri, 06 Dec 2019 13:12:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=HgsFWq8DP+87XL1itZQUo3Iq+jc27icsaYyBl6Qdbek=;
        b=VjBchgtEW8rAa39w4O6vhJyi3xH8m8n7oqNfZv0Tmkq59vBIdw7n1qXNiiO0XDzJPR
         Qu3L/UFY4dh2VTm9r8XVW+64V62kXL/uUUpoKIZZ34xH3U6PsTZUpJzjj/GTIalvF0QJ
         jCCxQ4SJTPejgFlekDTUYuXWGdPEaJF+S5X2Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=HgsFWq8DP+87XL1itZQUo3Iq+jc27icsaYyBl6Qdbek=;
        b=Gx9G2juhV8zlxjEgQTD/F6iI554D+BvdqfyuNJsDggZIXQ0H4rVw9WtAphb8HK8j3y
         DdL5k2JS4Yf/RkU7xs7T+63kJCM0stlZJGJYKX4aEdXAtRodrQ48iwv064szUdxj828w
         q1nbKENb+flpURCh2ePpUUfu2gasXlcFf5taoZFg/f3NJFsHVwkT/ERGBor4+91JcH58
         HTgnrPiP/gQymELUp3De5OS5h+pZLcX5PmpHkn7IStMCADBbivykRvmZOV3g5LONSzW6
         GdgxZOSv4WNwSmKJUq/Zi0bOu6903Dby64j2DA9JRRFyT29k5CpeMaJbqaj8ZaEotZ8n
         dLeg==
X-Gm-Message-State: APjAAAWrU/vTK1+b6nWbNQ0FZd3iiJ8ZDyqwZLdZ4nOzbi0cRQNGwzsg
        ZxuSif95LN6L9tIvx46piKao3fOOjfz6uw==
X-Google-Smtp-Source: APXvYqw9X5X0vyBmAc3vBGUG0XXQJ6yscingPirw5aUWCvXnNgsCuFzjunYdzfWI1+UtVjyc1ks+Mg==
X-Received: by 2002:a92:8fd8:: with SMTP id r85mr16149146ilk.29.1575666730133;
        Fri, 06 Dec 2019 13:12:10 -0800 (PST)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id r7sm3500563iop.9.2019.12.06.13.12.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Dec 2019 13:12:09 -0800 (PST)
Subject: Re: "usbip: Implement SG support to vhci-hcd and stub driver" causes
 a deadlock
To:     =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= 
        <marmarek@invisiblethingslab.com>,
        Suwan Kim <suwan.kim027@gmail.com>
Cc:     linux-usb@vger.kernel.org,
        Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20191206032406.GE1208@mail-itl>
 <20191206065058.GA9792@localhost.localdomain>
 <20191206205742.GP1122@mail-itl>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <49f180e4-0e36-1615-0988-31b0199c4e2b@linuxfoundation.org>
Date:   Fri, 6 Dec 2019 14:12:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191206205742.GP1122@mail-itl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 12/6/19 1:57 PM, Marek Marczykowski-Górecki wrote:
> On Fri, Dec 06, 2019 at 03:50:58PM +0900, Suwan Kim wrote:
>> On Fri, Dec 06, 2019 at 04:24:06AM +0100, Marek Marczykowski-Górecki wrote:
>>> Hello,
>>>
>>> I've hit an issue with recent 4.19 and 5.4 kernels. In short: if I
>>> connect Yubikey 4 and use its CCID interface (for example `ykman oath
>>> list` command), the client side hangs (100% reliably). After 60s I get a
>>> message that a CPU hangs waiting for a spinlock (see below).
>>>
>>> I've bisected it to a ea44d190764b4422af ("usbip: Implement SG support
>>> to vhci-hcd and stub driver") commit. Which indeed is also backported to
>>> 4.19.
>>>
>>> Any idea what is going on here? I can easily provide more information,
>>> if you tell me how to get it.
>>>
>>
>> Hi,
>>
>> Thanks for reporting. Could you turn on lockdep and USBIP_DEBUG
>> in kernel config and send dmesg log? It will be helpful to figure
>> out lock dependency in vhci_hcd.
> 
> Hmm, I've tried, but I don't see much more information there (see
> below). I've just enabled PROVE_LOCKING and USBIP_DEBUG. Do I need to do
> anything more, like some boot option?
> 
> Also, this one (as the previous one) is from 4.19.84. Interestingly, on
> 4.19.87 I don't get the message at all.
> 
> Hmm, I've done also another test: got 4.19.84 with "usbip: Implement SG
> support to vhci-hcd and stub driver" reverted and it still hangs...
> 
> I'm going for another bisect round (4.19.81 works, 4.19.84 doesn't).

Does 4.19.82 work?

thanks,
-- Shuah


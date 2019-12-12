Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 69C4E11D962
	for <lists+linux-usb@lfdr.de>; Thu, 12 Dec 2019 23:33:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730887AbfLLWdb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 12 Dec 2019 17:33:31 -0500
Received: from mail-il1-f173.google.com ([209.85.166.173]:38869 "EHLO
        mail-il1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730818AbfLLWdb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 12 Dec 2019 17:33:31 -0500
Received: by mail-il1-f173.google.com with SMTP id f5so391221ilq.5
        for <linux-usb@vger.kernel.org>; Thu, 12 Dec 2019 14:33:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=kBQmgIA/pqYf7NAckzyUIkENaobxqJRYpBocCoBdvIE=;
        b=ZqDNYcYXixkd4o5jUCNADfdE7n4OiUtTBV9bmCori3mvXcs2mXl63Yhc/dNEaS1L8E
         RV/nDptFL+6mlBrahJ+AYZrQc8wuVAUtHsWgEvY1LWnmiaS45USShnqSWFoKeYySxIfO
         oVkp2XEPIJnWu2Yh/FqsBe/dMvCOTQMiUcyw0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=kBQmgIA/pqYf7NAckzyUIkENaobxqJRYpBocCoBdvIE=;
        b=uh2sLLVM8kFoGmWgwHyE0oMcwSjxpiHHfIcFaqsfUyc5qTSEkiDLT7HVvSWkOTpk9M
         QxEE4mHjmgdMvmkG3bBhOVE1lb+WSflNKJT7kEfAYimwnyXqBQonLi9X1HVkPPIcwKTh
         rnu/IKsk5UPvNW7JNdQkdt/31UbDsO4PKmG1RR4lGldKgixOPjp1Un8DgussAFwUMMz7
         azXdPwtBoZ5mD2GeE2kteGwUANvWh8Hn3h7rq+CQF2xg5LF+4FvFxe3dDislyP3DxRI6
         6yHgPF60rg7SVFoy2GwsrMG1bqvu5fgVW5Nahavi9SLeax83tCayaP3YqvaHXQYRytiY
         ugxQ==
X-Gm-Message-State: APjAAAVWUQNJJ2bsVtknyTUcBeNq7B/zo+Lk4gcqFRZLL5FKZbZ9GLhP
        O5oUjBg93kCX0nhNzHyfgbFs/A==
X-Google-Smtp-Source: APXvYqzR+BKkmMkjKLrAedWVOjdeEct98TAiyDT53E4iYr8PX8gi28WZIxLg1Su50u2XnwpimsolZg==
X-Received: by 2002:a92:3c84:: with SMTP id j4mr10278728ilf.244.1576190010822;
        Thu, 12 Dec 2019 14:33:30 -0800 (PST)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id n2sm2099932ilh.88.2019.12.12.14.33.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2019 14:33:29 -0800 (PST)
Subject: Re: [issue] usbip: vhci-hcd: Device unable to get work after reset
To:     Zhai Zhaoxuan <kxuanobj@gmail.com>,
        Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>
Cc:     linux-usb@vger.kernel.org,
        "skh >> Shuah Khan" <skhan@linuxfoundation.org>
References: <9b961779-abe7-f6a4-3f2b-f9303ef39c5b@gmail.com>
 <804f452e-e724-b508-80e7-cfd05da2ff84@linuxfoundation.org>
 <3e97b00c-ca87-0085-3f8e-6e85fd9b6c30@gmail.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <6ee3a823-4359-41f1-0cd6-1b0b22d5dea3@linuxfoundation.org>
Date:   Thu, 12 Dec 2019 15:33:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <3e97b00c-ca87-0085-3f8e-6e85fd9b6c30@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Zhai,

On 12/11/19 8:19 PM, Zhai Zhaoxuan wrote:
> Hi Shuah,
> 
> For me, I want to let the remote control software passing some virtual 
> device (e.g. ethernet device) to the remote computer.
> 
> More specifically, the remote computer is connected to a private 
> network, and the local computer is connected to the Internet. And the 
> local can only connect to the remote computer using RDP/SPICE protocols, 
> some other softwares such as vmware client, or even remote management cards.
> 
> All these protocols or softwares support USB redirection.

Does USB redirection support virtual devices? My understanding
it is usually a physical device connected to the local system.

So I can
> create a virtual ethernet device with usbip, 

How are you creating the virtual device?

let them

Who is them here?

redirect the USB
> ethernet device to the remote computer, and enable NAT forward.
> 

Is this virtual device is exported by USBIP host driver on your local
machine?

> Then I am able to access the private network with local computer.
> 
> 
> Currently, I am writing a user-space program. It runs usbip protocol, 
> and can be connected and attached to the vhci.

Why do you need to write a user-space program and what does it do?

Where does this vhci run? On the local system? I still don't fully
follow the use-case.

> 
> But the USB redirection will always reset the USB device before it 
> passing the device to the remote computer.
> 
Does USB redirection support virtual devices?

> And now, this "reset" results the device be disabled and never be 
> enabled again. So the redirection fails.
> 
> 
> In addition to this, I think usbip is a great module to allow the user 
> emulate some other devices and passing them to the remote computer 
> easily. For example, the virtual serial port can be emulated in 
> user-space, and communicate with the remote computer over SPICE. And 
> then, I can get the console output from the remote computer or send 
> console command to it.
> 
> 
thanks,
-- Shuah

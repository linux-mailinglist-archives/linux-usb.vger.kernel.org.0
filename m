Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2BCAC12DED9
	for <lists+linux-usb@lfdr.de>; Wed,  1 Jan 2020 12:50:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725884AbgAALuW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Jan 2020 06:50:22 -0500
Received: from mail-pf1-f182.google.com ([209.85.210.182]:33361 "EHLO
        mail-pf1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725783AbgAALuV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 1 Jan 2020 06:50:21 -0500
Received: by mail-pf1-f182.google.com with SMTP id z16so20744118pfk.0
        for <linux-usb@vger.kernel.org>; Wed, 01 Jan 2020 03:50:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=Xj3V2oDYGI/kLv+zkR7Gm/0BWRstoAqjrUHUD1TyHfE=;
        b=qwnTygXvxNQAfc9RCsqM/dNOb7/hK62hneeC5tefQOi7Jxs2iD3f145XOrtg9Atjc6
         wA6ZWtdAiHfJ2LpCkO9WuvrtLFVJJkrK4PpNfxVdKMLPFbU7LjP4XLWXkvV52sDJhwai
         hQEYSlcUhg317LmWRkuhgSm+YcUY1niDwxJqHpTYLxAAdjMW5fmPeMVREY1kSdfwl4vZ
         rAu3iO2VbVzYJQvQbgbzoZ5fLOykZwpHYVSDvLwsu+Fiu/wl6ZwMQFeUXQufZRo2PZmJ
         OyQ9rNlI4HmxbAn25p/9eDc9Zh//dYL2H2lZAXB/ny8EL+U215ZL01Ndl55D4RZGojpD
         +j7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=Xj3V2oDYGI/kLv+zkR7Gm/0BWRstoAqjrUHUD1TyHfE=;
        b=bTWJfGwpfp5GZ4ovvZQ3zekKP5OQnkEb8x4jtg7w4h75mXaRJULTDEVVan0xV1bNvI
         KUFWV/JJO5y8W0croZkR4peF4REeuoiFpP0P6MncAIdJlj6s0v/RWaVVs6UvUbuWfD7o
         CDV2rVKDcMmN1IeVFQgUK3dT8CFJhwiyT7aRN0MSHRAXN4GjHUFHWUHPNhXWfjcBiE00
         Mgl5sKIOVw5ZS0OpzPd5df//0+1QI4xGp3ILlTMVd+cKlr8N4I9dNJ2ymJi4Mh1xe/iI
         e87IagYgb8/oXf74AgqFzJGuv4wtsMiwduoPazW4ZB5+pc/RfZQZvkuoG0HpXhCKeicN
         08XA==
X-Gm-Message-State: APjAAAXKUl+kJ7pRE2SMKn7+B32WQ8yHZqE3IELOyaASPOpaX9azjnLS
        91bJFj+npCYuCS7xt8xpBf3Z4JTqGeRpUw==
X-Google-Smtp-Source: APXvYqwZTxIrh1MSLl5jCz/SkW7JDBk9106O7RObjQYmfnoaMSoDEic3YKVCCA+e1bkGh0h2XAiXjA==
X-Received: by 2002:aa7:824d:: with SMTP id e13mr42539649pfn.247.1577879420569;
        Wed, 01 Jan 2020 03:50:20 -0800 (PST)
Received: from [0.0.0.0] (vps.kxuan.tech. [67.216.207.230])
        by smtp.gmail.com with ESMTPSA id k1sm53455416pgq.70.2020.01.01.03.50.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jan 2020 03:50:19 -0800 (PST)
Subject: Re: [issue] usbip: vhci-hcd: Device unable to get work after reset
From:   Zhai Zhaoxuan <kxuanobj@gmail.com>
To:     Shuah Khan <skhan@linuxfoundation.org>,
        Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>
Cc:     linux-usb@vger.kernel.org
References: <9b961779-abe7-f6a4-3f2b-f9303ef39c5b@gmail.com>
 <804f452e-e724-b508-80e7-cfd05da2ff84@linuxfoundation.org>
 <3e97b00c-ca87-0085-3f8e-6e85fd9b6c30@gmail.com>
 <6ee3a823-4359-41f1-0cd6-1b0b22d5dea3@linuxfoundation.org>
 <5333270a-e6c4-4aa1-1cbf-8f2e7ba81434@gmail.com>
Message-ID: <0980a31b-8af7-02da-8780-ce8f5db36053@gmail.com>
Date:   Wed, 1 Jan 2020 19:50:10 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <5333270a-e6c4-4aa1-1cbf-8f2e7ba81434@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Shuah,


It has been almost 3 weeks since the last email.

Can you confirm if this is a bug or a feature?


I am still looking forward to your reply. And hope this issue can be 
resolved.


Thanks,

Zhai Zhaoxuan

On 12/13/19 11:01 AM, Zhai Zhaoxuan wrote:
> Hi Shuah,
>
> On 12/13/19 6:33 AM, Shuah Khan wrote:
>> Hi Zhai,
>>
>> On 12/11/19 8:19 PM, Zhai Zhaoxuan wrote:
>>> Hi Shuah,
>>>
>>> For me, I want to let the remote control software passing some 
>>> virtual device (e.g. ethernet device) to the remote computer.
>>>
>>> More specifically, the remote computer is connected to a private 
>>> network, and the local computer is connected to the Internet. And 
>>> the local can only connect to the remote computer using RDP/SPICE 
>>> protocols, some other softwares such as vmware client, or even 
>>> remote management cards.
>>>
>>> All these protocols or softwares support USB redirection.
>>
>> Does USB redirection support virtual devices? My understanding
>> it is usually a physical device connected to the local system.
>
> Yes. At least "spicy" (a SPICE protocol client program) allows users 
> choose virtual devices in the list.
>
> But "spicy" is unable to reset devices. "spicy" redirection fails with 
> the error: "Could not redirect [Device Product Name] at 6-2: error 
> resetting device: LIBUSB_ERROR_NOT_FOUND".
>
>>
>> So I can
>>> create a virtual ethernet device with usbip, 
>>
>> How are you creating the virtual device?
>
> usbip creates a virtual device and attach the device to the vhci.
>
> It just like local usbip client connected to a virtual remote system. 
> And the virtual remote system has a usb ethernet card.
>
> But in my use case, the virtual remote system is emulated by the 
> user-space program.
>
>
>>
>> let them
>>
>> Who is them here?
>> redirect the USB
>
> "them" indicates SPICE/RDP protocols, remote control softwares (e.g 
> vmware client), and remote management cards, etc.
>
> They are protocols or programs which allows the user passing a local 
> USB device to the remote system.
>
> Let's call them "AGENT".
>
>
>>> ethernet device to the remote computer, and enable NAT forward.
>>>
>>
>> Is this virtual device is exported by USBIP host driver on your local
>> machine?
>
> Yes, you are correct!
>
>
>>
>>> Then I am able to access the private network with local computer.
>>>
>>>
>>> Currently, I am writing a user-space program. It runs usbip 
>>> protocol, and can be connected and attached to the vhci.
>>
>> Why do you need to write a user-space program and what does it do?
>> Where does this vhci run? On the local system? I still don't fully
>> follow the use-case.
> The vhci runs on local system.
>
> The user-space program transfers the data from vhci to the network 
> subsystem. I plans use TAP device to communicate with the network 
> subsystem.
>
> If the USB redirection sucessed, the full chain will be:
>
> remote kernel network subsystem <--> remote USB bus <--> AGENT <--> 
> local vhci <--> local user-space program <--> local TAP device <--> 
> local kernel network subsystem
>
>
>>
>>>
>>> But the USB redirection will always reset the USB device before it 
>>> passing the device to the remote computer.
>>>
>> Does USB redirection support virtual devices?
> Yes. The virtual devices are USB devices. The remote agents does not 
> filter out the virtual devices.
>>
>>> And now, this "reset" results the device be disabled and never be 
>>> enabled again. So the redirection fails.
>>>
>>>
>>> In addition to this, I think usbip is a great module to allow the 
>>> user emulate some other devices and passing them to the remote 
>>> computer easily. For example, the virtual serial port can be 
>>> emulated in user-space, and communicate with the remote computer 
>>> over SPICE. And then, I can get the console output from the remote 
>>> computer or send console command to it.
>>>
>>>
>> thanks,
>> -- Shuah
>
> Thanks,
> Zhai Zhaoxuan
>

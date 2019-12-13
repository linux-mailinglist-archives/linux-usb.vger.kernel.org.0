Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 30FED11DC5D
	for <lists+linux-usb@lfdr.de>; Fri, 13 Dec 2019 04:02:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731880AbfLMDCI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 12 Dec 2019 22:02:08 -0500
Received: from mail-pg1-f176.google.com ([209.85.215.176]:44551 "EHLO
        mail-pg1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731878AbfLMDCH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 12 Dec 2019 22:02:07 -0500
Received: by mail-pg1-f176.google.com with SMTP id x7so776142pgl.11
        for <linux-usb@vger.kernel.org>; Thu, 12 Dec 2019 19:02:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=fpYL1YMT2FiupItrDX5GNq/+jY+qD6yfa+05d88Jdso=;
        b=vT8As+Ur5YIQjdYaVwxe+0CVYZKL9f8pDRl+ZKpuqR+ZDsu6Gbzfa6J+JJB0U2UWCK
         mgsixmKzj/e6zQH43NdSi1DqPry10aDdWQck6K00UyEbG1f3TpOJTnYV/AqDaBb99z3x
         26/80R59CssB1SMKiBthXYffXjEbsZlmCnqJWu9uh8YIbSeJ42BiH7W0TITEM/KdfOvg
         9ffhAf490o8yuq7hnk3jP2Hmnz5utHLJ+/PgOgUo3nevHRMyIFG26jiTB3MgtW8VTJb+
         9WA5n2/1OZl4DdBiYPWNf2baDwF4bOHv7dQeQtsvXWySJtmO9yd+ZHo9s5vZbl9GBd59
         BkCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=fpYL1YMT2FiupItrDX5GNq/+jY+qD6yfa+05d88Jdso=;
        b=omeu2zhbrxI9HPuxOnD+TERnvSY0r2dfO453e0gloNcOhaZ9PbK/k+tGBZyVMZcaQV
         niAyCPTaxUHGOB5Ar7Qs+ujF2CCXMTEZGF5U64XbKxQ33/eT08CUVIrDbfJjESbiQwwY
         2Czyes6hOf+Z0/jjQUG3UaImx+ctKM0woiHJ7b8gtazdPJjHiL9/odv6TkWuZeH3o+QF
         jj3m11j3Rc5CmXKv1VVl1yKCdKcZrORSEdG++w0cs9oVLm4hq6J+XKXqEIG6qVJrdaFd
         /4s7SJq1G/Uk3lKaa89dNAlhX5Ier5shnabI6d87nGXSXHfb6qCuVfBEsbMXwjSbTQgW
         itBQ==
X-Gm-Message-State: APjAAAVl998DjiGqofn3mRWIO63cK88M6xvVRzLNvr0LWrSO7TGMcfMe
        PZNBxJ9on83Ltd12SnrpkSMcfxGQnUsHrz6a
X-Google-Smtp-Source: APXvYqzDyeJ0Son/Tki7+K0cZ5QE7CM3mwMzlVF9qnbpHkZblLtU0im7A0TdYvSyGaKH+bTZDinJ5Q==
X-Received: by 2002:a63:a34b:: with SMTP id v11mr14006843pgn.229.1576206126234;
        Thu, 12 Dec 2019 19:02:06 -0800 (PST)
Received: from [0.0.0.0] (vps.kxuan.tech. [67.216.207.230])
        by smtp.gmail.com with ESMTPSA id f8sm7356792pjg.28.2019.12.12.19.02.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2019 19:02:05 -0800 (PST)
Subject: Re: [issue] usbip: vhci-hcd: Device unable to get work after reset
To:     Shuah Khan <skhan@linuxfoundation.org>,
        Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>
Cc:     linux-usb@vger.kernel.org
References: <9b961779-abe7-f6a4-3f2b-f9303ef39c5b@gmail.com>
 <804f452e-e724-b508-80e7-cfd05da2ff84@linuxfoundation.org>
 <3e97b00c-ca87-0085-3f8e-6e85fd9b6c30@gmail.com>
 <6ee3a823-4359-41f1-0cd6-1b0b22d5dea3@linuxfoundation.org>
From:   Zhai Zhaoxuan <kxuanobj@gmail.com>
Message-ID: <5333270a-e6c4-4aa1-1cbf-8f2e7ba81434@gmail.com>
Date:   Fri, 13 Dec 2019 11:01:57 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <6ee3a823-4359-41f1-0cd6-1b0b22d5dea3@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Shuah,

On 12/13/19 6:33 AM, Shuah Khan wrote:
> Hi Zhai,
>
> On 12/11/19 8:19 PM, Zhai Zhaoxuan wrote:
>> Hi Shuah,
>>
>> For me, I want to let the remote control software passing some 
>> virtual device (e.g. ethernet device) to the remote computer.
>>
>> More specifically, the remote computer is connected to a private 
>> network, and the local computer is connected to the Internet. And the 
>> local can only connect to the remote computer using RDP/SPICE 
>> protocols, some other softwares such as vmware client, or even remote 
>> management cards.
>>
>> All these protocols or softwares support USB redirection.
>
> Does USB redirection support virtual devices? My understanding
> it is usually a physical device connected to the local system.

Yes. At least "spicy" (a SPICE protocol client program) allows users 
choose virtual devices in the list.

But "spicy" is unable to reset devices. "spicy" redirection fails with 
the error: "Could not redirect [Device Product Name] at 6-2: error 
resetting device: LIBUSB_ERROR_NOT_FOUND".

>
> So I can
>> create a virtual ethernet device with usbip, 
>
> How are you creating the virtual device?

usbip creates a virtual device and attach the device to the vhci.

It just like local usbip client connected to a virtual remote system. 
And the virtual remote system has a usb ethernet card.

But in my use case, the virtual remote system is emulated by the 
user-space program.


>
> let them
>
> Who is them here?
> redirect the USB

"them" indicates SPICE/RDP protocols, remote control softwares (e.g 
vmware client), and remote management cards, etc.

They are protocols or programs which allows the user passing a local USB 
device to the remote system.

Let's call them "AGENT".


>> ethernet device to the remote computer, and enable NAT forward.
>>
>
> Is this virtual device is exported by USBIP host driver on your local
> machine?

Yes, you are correct!


>
>> Then I am able to access the private network with local computer.
>>
>>
>> Currently, I am writing a user-space program. It runs usbip protocol, 
>> and can be connected and attached to the vhci.
>
> Why do you need to write a user-space program and what does it do?
> Where does this vhci run? On the local system? I still don't fully
> follow the use-case.
The vhci runs on local system.

The user-space program transfers the data from vhci to the network 
subsystem. I plans use TAP device to communicate with the network subsystem.

If the USB redirection sucessed, the full chain will be:

remote kernel network subsystem <--> remote USB bus <--> AGENT <--> 
local vhci <--> local user-space program <--> local TAP device <--> 
local kernel network subsystem


>
>>
>> But the USB redirection will always reset the USB device before it 
>> passing the device to the remote computer.
>>
> Does USB redirection support virtual devices?
Yes. The virtual devices are USB devices. The remote agents does not 
filter out the virtual devices.
>
>> And now, this "reset" results the device be disabled and never be 
>> enabled again. So the redirection fails.
>>
>>
>> In addition to this, I think usbip is a great module to allow the 
>> user emulate some other devices and passing them to the remote 
>> computer easily. For example, the virtual serial port can be emulated 
>> in user-space, and communicate with the remote computer over SPICE. 
>> And then, I can get the console output from the remote computer or 
>> send console command to it.
>>
>>
> thanks,
> -- Shuah

Thanks,
Zhai Zhaoxuan


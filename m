Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB7FAD1010
	for <lists+linux-usb@lfdr.de>; Wed,  9 Oct 2019 15:28:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731152AbfJIN1x (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Oct 2019 09:27:53 -0400
Received: from mail-yw1-f45.google.com ([209.85.161.45]:34432 "EHLO
        mail-yw1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731524AbfJIN1v (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 9 Oct 2019 09:27:51 -0400
Received: by mail-yw1-f45.google.com with SMTP id d192so808290ywa.1
        for <linux-usb@vger.kernel.org>; Wed, 09 Oct 2019 06:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=LSmHr2OYlnV8VmZra+Chbv/dxVvZkoOZFofJ9A6EX2c=;
        b=MqeZqUZK6KtEuEPhf+Cwnlcl2+1qD7pJB8e32fC11sivsQa6B9T+ooFMIwoLMkTRdM
         9GtzERJl7MCZZrhVX6jpHJ4ZhJvxTrW81Ifa3fkMxyvlLHF7hSZpM3bd2TwzUw6R7Dyg
         e5IcYhGpo38FBIKVmDuV8k93huntB4yOpFzyj3Hci6b8holjvBlCcfMr4Jg5tZodhy89
         l1mqzmbLi21r4j5iSs+Zl1pcJbMy5Kfg4ZN4mc4xUx4MQ3RKZzV7T2ArOXFqs3Lbw377
         B/Ndp/o7Ypn7yal4oMUvCUsylPc59ep2vlSH+3e3nak8UoltEwY/lPHjo0XCpSS2/IWR
         ub9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=LSmHr2OYlnV8VmZra+Chbv/dxVvZkoOZFofJ9A6EX2c=;
        b=Qea38cc4mWed/uqABa3Y7TWkM7GI3cX15Fh4qhzypcDmFqkXfp3piJuWWYrlFuk/1x
         5CsxSGvqpmx4kOq6avDtorseAXFd7cCsPhe4IG6627s1oKAJzWroOabVjYoRwoGzWC2t
         af3Kk8waPqjZ6Vxrywhvy2+HbZEk1mXGp5gxr9RVi/Idc6Grz+YvODN8X7MBksRNoEjw
         T9v45eKcsUuF2ujlciuc/BM/vHNAItCIairuoJ35GPrML9dgxJAvdkGa50Je5M6C+pdy
         V8xSFfHqdjsmfAHsCcrqnZzxA65Ai0dyuuOSnXMEmHWGnjgTHEl0gTCoBB7onJTLstDM
         z0kg==
X-Gm-Message-State: APjAAAXOf7HAw5OCSsoagn+q2qtKD/le0UEcFRf9YgUykKo5IrC1AQWh
        rf8k8xAs8uKRsTj6at/7XwNz94tMiFU=
X-Google-Smtp-Source: APXvYqxXPuGFN0jOYaXtWht9YSaBF2V/MAWCD5YuT8SdIg68+fFh0AgL6ErYmL2mpiKcLYxDj0kdTA==
X-Received: by 2002:a0d:d907:: with SMTP id b7mr2478878ywe.159.1570627670064;
        Wed, 09 Oct 2019 06:27:50 -0700 (PDT)
Received: from [192.168.100.202] (66-211-222-36.static.velocity.net. [66.211.222.36])
        by smtp.gmail.com with ESMTPSA id x16sm598078ywx.103.2019.10.09.06.27.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Oct 2019 06:27:49 -0700 (PDT)
Subject: Re: Possible bug with cdc_ether, triggers NETDEV WATCHDOG
To:     =?UTF-8?Q?Bj=c3=b8rn_Mork?= <bjorn@mork.no>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
References: <3913c851-93f8-3d26-a578-f5a2c8b69aaa@gmail.com>
 <878spuxpu6.fsf@miraculix.mork.no>
From:   Adam Bennett <abennett72@gmail.com>
Message-ID: <339e0633-6dd3-5c0f-0b6d-598848bf1d37@gmail.com>
Date:   Wed, 9 Oct 2019 09:27:48 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <878spuxpu6.fsf@miraculix.mork.no>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 10/9/19 4:53 AM, Bjørn Mork wrote:

> Adam Bennett <abennett72@gmail.com> writes:
>
>> I've been messing around with a Raspberry Pi Zero, in its ethernet
>> gadget mode.  This possible bug report is not against the Pi Zero
>> linux kernel, but rather the host computer's linux kernel.  I've been
>> able to reproduce the same host computer issue with my normal laptop,
>> and an embedded board (buildroot-based). Both run a newish version of
>> 4.19.
> The issue is reported on the host, but it's really a problem with the
> gadget.  You'll probably have the same issues with any host, including
> hosts running something other than Linux.  They just won't be as verbose
> about it.
>
That was my original assumption also.  But I tested the Pi Zero on 
Windows 10 (build 1903) and latest MacOS, and it works fine on those 
machines.
>> The bug report is that most of the time I cannot ping through the
>> local link, and I get a kernel debug message:  sometimes I can ping
>> the Pi Zero with no kernel message, most of the time I can't ping and
>> the message comes up, and occasionally I get the message right when I
>> plug in the Pi Zero, before I issue the ping command.
>>
>> Here is the dmesg on my normal laptop (I've included the plug-in
>> sequence also):
>>
>> [11728.029900] usb 1-1: new high-speed USB device number 10 using xhci_hcd
>> [11728.434200] usb 1-1: device descriptor read/64, error -71
> First symptom of something wrong with the gadget...
>
>> [11728.669543] usb 1-1: New USB device found, idVendor=0525,
>> idProduct=a4a2, bcdDevice= 4.19
>> [11728.669548] usb 1-1: New USB device strings: Mfr=1, Product=2,
>> SerialNumber=0
>> [11728.669551] usb 1-1: Product: RNDIS/Ethernet Gadget
>> [11728.669554] usb 1-1: Manufacturer: Linux 4.19.75+ with 20980000.usb
>> [11728.674528] cdc_ether 1-1:1.0 usb0: register 'cdc_ether' at
>> usb-0000:00:14.0-1, CDC Ethernet Device, 22:93:3a:1e:ac:5c
>> [11730.725278] cdc_ether 1-1:1.0 enp0s20f0u1: renamed from usb0
>> [11768.174915] ------------[ cut here ]------------
>> [11768.174921] NETDEV WATCHDOG: enp0s20f0u1 (cdc_ether): transmit
>> queue 0 timed out
>
> This warning means that the gadget doesn't accept the packets we send
> it.  There isn't much the host can do about that, except dropping
> packets on the floor.  Which is why the warning is this loud.
>
Would a firewall on either the linux host or the Pi Zero cause the same 
problem (and message)?
>
> Bjørn

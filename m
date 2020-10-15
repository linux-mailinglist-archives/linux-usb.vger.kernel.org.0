Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E26AB28F317
	for <lists+linux-usb@lfdr.de>; Thu, 15 Oct 2020 15:22:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728513AbgJONWS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 15 Oct 2020 09:22:18 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:54625 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726959AbgJONWS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 15 Oct 2020 09:22:18 -0400
Received: by mail-wm1-f67.google.com with SMTP id p15so3153774wmi.4
        for <linux-usb@vger.kernel.org>; Thu, 15 Oct 2020 06:22:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:reply-to:subject:to:cc:references:from
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=dg+DyVAu6RTSAvj/uSkVO8Wdtjrpab6/Nr3YoBxQCAw=;
        b=UQDRoRFusR1OlsKLvSpOWpwCpeKS/UZkUaK/4fvgUN8wu2p70C2GQFg181W/rJilVg
         ukUrwwNibWKr0Xz20GaTnmZoMNUUxBVBfDQZS0ULt9p5kpCASTlg4MQe+f7KfGKSIAGj
         5A4Kqtl46WglkqJN8jU2prxur7IlOjeUKuzIjurLDOVoh2pXRuPu5im+LpfmAxRhqTDW
         bhTr4RiVhy9LvzA/FFY8qYdTC7AczfHrpI/M/u/dIy+La8OXxTVot9O5szDMJWXNaAyk
         azIam3PzGm4ghi0c+fUGYsd5BmCAU0CnpiaSFQswH2ZgPXF9PIgxP8B0GL+KBahjQOKa
         +k5Q==
X-Gm-Message-State: AOAM53353DuRv0V2/aCBz3Ng3QcXUuXDs3VIVBqMzCFyjp8yvGgvwcaq
        9RV15P12Qtqe+smCwbs39Xg=
X-Google-Smtp-Source: ABdhPJzulD133RfaYPv2iWp1hKJ9l/cqB/CmkxhWrnu/12z2QHCTK6cXF3+5g9NR9BTEka22JuA0gg==
X-Received: by 2002:a1c:3243:: with SMTP id y64mr3990357wmy.175.1602768136941;
        Thu, 15 Oct 2020 06:22:16 -0700 (PDT)
Received: from [192.168.86.26] (cpc87451-finc19-2-0-cust61.4-2.cable.virginm.net. [82.11.51.62])
        by smtp.gmail.com with ESMTPSA id 205sm4538233wme.38.2020.10.15.06.22.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2020 06:22:16 -0700 (PDT)
Reply-To: tanure@linux.com
Subject: Re: USB Question about devices being reconnected to the host
To:     Greg KH <greg@kroah.com>
Cc:     linux-usb@vger.kernel.org, kernelnewbies@kernelnewbies.org
References: <d4c94e87-a1bb-18d5-054f-2e6ed01fab5b@linux.com>
 <20201015123056.GA4021854@kroah.com>
From:   Lucas Tanure <tanure@linux.com>
Message-ID: <429802b5-46f1-9631-25f6-d50ddb622cb0@linux.com>
Date:   Thu, 15 Oct 2020 14:22:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201015123056.GA4021854@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 10/15/20 1:30 PM, Greg KH wrote:
> On Thu, Oct 15, 2020 at 01:17:45PM +0100, Lucas Tanure wrote:
>> Hi,
>>
>> I'm learning about USB drivers and I would like to know about disconnecting
>> and reconnecting usb devices.
>>
>> I can see my probe function being called and also the disconnect function.
>> But if I reconnect the device there is no call from the kernel to notify my
>> driver about the device being reconnected.
> 
> That's not good, your driver should be told this.
> 
>> I can also see that the module for my driver was not unloaded, so I dont
>> understand the life cycle of a USB device.
> 
> Modules are never auto-unloaded.
> 
>> If the module is not unloaded at disconnection and re-loaded for a new
>> device being connected, how can the driver know the device is there after a
>> disconnection?
> 
> The probe function should be called, are you sure it isn't?
I re-did the test couple more times and I can see now the probe
function being called.

Thanks
> 
> 
>>
>> Thanks
>> Lucas
>>
>> This is my dmesg for the driver at the end of this email:
>>
>> [   34.706041] usb 1-1.1.2: new high-speed USB device number 5 using dwc_otg
>> [   34.837647] usb 1-1.1.2: New USB device found, idVendor=04b4,
>> idProduct=00f1, bcdDevice= 0.00
>> [   34.837666] usb 1-1.1.2: New USB device strings: Mfr=1, Product=2,
>> SerialNumber=0
>> [   34.837679] usb 1-1.1.2: Product: FX3
>> [   34.837693] usb 1-1.1.2: Manufacturer: Cypress
>> [   34.902480] usbdev_probe
>> [   34.902681] usbcore: registered new interface driver My USB Device
>> [   45.416310] usb 1-1.1.2: USB disconnect, device number 5
>> [   45.416655] usbdev_disconnect
>> [   61.326035] usb 1-1.1.2: new high-speed USB device number 6 using dwc_otg
>> [   61.457674] usb 1-1.1.2: New USB device found, idVendor=04b4,
>> idProduct=00f1, bcdDevice= 0.00
>> [   61.457692] usb 1-1.1.2: New USB device strings: Mfr=1, Product=2,
>> SerialNumber=0
>> [   61.457706] usb 1-1.1.2: Product: FX3
>> [   61.457720] usb 1-1.1.2: Manufacturer: Cypress
> 
> That is odd, sorry, don't know what to suggest.
> 
> greg k-h
> 

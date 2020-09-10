Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28AB2264811
	for <lists+linux-usb@lfdr.de>; Thu, 10 Sep 2020 16:36:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730870AbgIJOgW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 10 Sep 2020 10:36:22 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:35387 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728211AbgIJOeR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 10 Sep 2020 10:34:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1599748441;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=7LH+FwkTwx6nSJCYI1KtwqE1gO8u9UI8dkFe2h5a2YM=;
        b=PrPhz023Ogdp4tdvGIwiwORnXKRBX0qbGCU3Wm7a9qKiLJzB6/dLOx9KYNiLjY722lpt3w
        NMU4e2u4ROmq1/GxUSxxTYf9X0sl95Z+/c13BGgfPS1lIGAyeQFvMUxcISj5gVfrNgheSg
        YhMzInHH+iCl99WP/2VXnTB9gH77gWw=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-453-ceFymzVLN5CNmU-3hM-VYA-1; Thu, 10 Sep 2020 09:58:53 -0400
X-MC-Unique: ceFymzVLN5CNmU-3hM-VYA-1
Received: by mail-ed1-f72.google.com with SMTP id i22so2497562edu.1
        for <linux-usb@vger.kernel.org>; Thu, 10 Sep 2020 06:58:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7LH+FwkTwx6nSJCYI1KtwqE1gO8u9UI8dkFe2h5a2YM=;
        b=Nphmkk43lPPYjSPnfO8s8taqgSi3ezjLUqnF97g4EuFnzlTSwbBd134Pp+LoSjIm1r
         WA3JtzPloST31j2y6TrJcf+xWgZvD3rwT+Irp+RvmE5qpqLVTZS8Ca7h+0giiuB17gr8
         IobVVhqDM0ZSbdOmK4vMDCVFXeOFtVsAbEk7zgZK2JIP7wDOpgxyu8Bq33v7F+NBwfp9
         +Oms2BGIuxaGHPXIO83B+kE3UvBcIAs1ylK1j4z4GY+nWQmCtt10geVq0iZtxR2InLvL
         EQgYkzQsjuS6XGj1tygbTRS0bGa7jBby1rdQKjcCTg88ItoEo4x9PgggyGtydP1CEc3W
         wZlA==
X-Gm-Message-State: AOAM530mze+y9Kn4nn9yC8Opr8+GLeI2MiGgTP7haKAiDTh43oBGKIqW
        jXh+M2eKiq1xvUlA9X6lccTVd++n0UoLk9hcPJYekFIQXbTJcfgVmn4LFSgKeY2XoipM/Lmm+Jr
        4JzeSf+HzbQL/ulHXhAIb
X-Received: by 2002:a05:6402:78b:: with SMTP id d11mr9810628edy.341.1599746331705;
        Thu, 10 Sep 2020 06:58:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwEB+RkeGm9dqLhuNHTmUrJ7s7H6k9Hsct7lOvj3k827noqmc67qC++zNOH0aCPFqvcaOG9LQ==
X-Received: by 2002:a05:6402:78b:: with SMTP id d11mr9810608edy.341.1599746331478;
        Thu, 10 Sep 2020 06:58:51 -0700 (PDT)
Received: from x1.localdomain ([109.38.136.20])
        by smtp.gmail.com with ESMTPSA id z4sm7439503ede.65.2020.09.10.06.58.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2020 06:58:50 -0700 (PDT)
Subject: Re: How to set USB_PORT_QUIRK_OLD_SCHEME on an usb-port ?
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
References: <2f2dd720-3ab4-ba0a-16bf-8b899aafa26d@redhat.com>
 <20200906022229.GA729107@rowland.harvard.edu>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <28948e6c-b67b-5b5c-daeb-070a1dadf9c8@redhat.com>
Date:   Thu, 10 Sep 2020 15:58:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200906022229.GA729107@rowland.harvard.edu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 9/6/20 4:22 AM, Alan Stern wrote:
> On Sat, Sep 05, 2020 at 01:37:38PM +0200, Hans de Goede wrote:
>> Hi All,
>>
>> I have been debugging an issue with a 2-in-1 which
>> consists of a tablet + a kbd-dock, where the device
>> turns into a clamshell when docked into the kbd-dock.
>>
>> The kbd dock is connected via pogo-pins. This works
>> fine when docked at boot. But there is an enumeration
>> issue when hot-docked (and the keyboard looses power
>> when the lid is closedm so this also triggers after
>> a suspend/resume):
>>
>> [ 3498.924190] usb 1-3: new full-speed USB device number 5 using xhci_hcd
>> [ 3499.041725] usb 1-3: device descriptor read/64, error -71
>> [ 3515.215890] usb 1-3: device descriptor read/64, error -110
>> [ 3515.440369] usb 1-3: new full-speed USB device number 6 using xhci_hcd
>> [ 3515.603544] usb 1-3: New USB device found, idVendor=06cb, idProduct=73f5, bcdDevice= 0.02
>> [ 3515.603574] usb 1-3: New USB device strings: Mfr=1, Product=2, SerialNumber=0
>> [ 3515.603596] usb 1-3: Product: ITE Device(8910)
>> [ 3515.603614] usb 1-3: Manufacturer: ITE Tech. Inc.
>>
>> Note there is about 6 seconds before the keyboard becomes
>> usable, which is quite long when trying to unlock the
>> laptop after opening the lid.
>>
>> If I set the USB_PORT_QUIRK_OLD_SCHEME on the port used by the kbd-dock:
>>
>> echo 1 >  /sys/devices/pci0000\:00/0000\:00\:14.0/usb1/1-0\:1.0/usb1-port3/quirks
>>
>> Then this changes to:
>>
>> [ 4467.875008] usb 1-3: new full-speed USB device number 7 using xhci_hcd
>> [ 4467.878483] usb 1-3: Device not responding to setup address.
>> [ 4468.082476] usb 1-3: Device not responding to setup address.
>> [ 4468.289990] usb 1-3: device not accepting address 7, error -71
>> [ 4468.614928] usb 1-3: new full-speed USB device number 8 using xhci_hcd
>> [ 4468.662392] usb 1-3: New USB device found, idVendor=06cb, idProduct=73f5, bcdDevice= 0.02
>> [ 4468.662423] usb 1-3: New USB device strings: Mfr=1, Product=2, SerialNumber=0
>> [ 4468.662444] usb 1-3: Product: ITE Device(8910)
>> [ 4468.662461] usb 1-3: Manufacturer: ITE Tech. Inc.
>>
>> Which is a lot better wrt making the keyboard available for
>> use in a timely manner.
>>
>> So now I'm looking into a way to automatically do this. I would
>> prefer to keep the handling of this out of the kernel, so I looked into
>> udev, but it seems that the usb_port_device_type device-s registered by
>> usb_hub_create_port_device() are not visible to udev?
>>
>> At least I'm not seeing them, in the output of "udevadm info -e"
> 
> My impression is that fixing this would be the simplest approach.

I agree that first trying to fix it is a good idea.

>> Note another option would be to set the global old_scheme_first kernel
>> cmdline parameter on this 2-in-1. That can be done with a simple
>> dmi_system_id table on which to do this, but adding such a table
>> seems undesirable.
>>
>>
>> A third option I guess would be to try and improve the probe time
>> of the kbd-dock under the new scheme.
> 
> Have you tried decreasing the initial_descriptor_timeout module
> parameter for usbcore?  That would probably help, but it's kind of a
> sledgehammer.

So I tried this:

[root@localhost ~]# cat /sys/module/usbcore/parameters/initial_descriptor_timeout
1000

But it does not really seem to help:

[ 1171.435346] usb 1-3: USB disconnect, device number 2
[ 1180.430958] usb 1-3: new full-speed USB device number 3 using xhci_hcd
[ 1180.551543] usb 1-3: device descriptor read/64, error -71
[ 1184.045548] usb 1-3: device descriptor read/64, error -110
[ 1184.270924] usb 1-3: new full-speed USB device number 4 using xhci_hcd
[ 1184.438336] usb 1-3: New USB device found, idVendor=06cb, idProduct=73f5, bcdDevice= 0.02
[ 1184.438371] usb 1-3: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[ 1184.438399] usb 1-3: Product: ITE Device(8910)
[ 1184.438425] usb 1-3: Manufacturer: ITE Tech. Inc.

Regards,

Hans


Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5877D25ADEE
	for <lists+linux-usb@lfdr.de>; Wed,  2 Sep 2020 16:51:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727903AbgIBOvs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Sep 2020 10:51:48 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:43598 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727918AbgIBOvV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 2 Sep 2020 10:51:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1599058278;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=5vzgzU1CZMtoI06KWeIJ83LEN/Kkpi9UoniHWN651oQ=;
        b=V7oofZNs4HLfQvG4BaGw2HL4duyT1/pT/QrEB+KsNtbhHr8pHINa9Njf53/qHzfC8nbSai
        qgz/gXzRq3XZjmkUQGfZu9cIsADSEDZgjzsYJ43tIrlg4jD0BoEZ3bPyYa96ePbJdydwBs
        iMv7cxkSCiG2YIZBOFb+c/9qLEAp6tc=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-566-nNeXoKOMMWS6Gq8ao7IdNA-1; Wed, 02 Sep 2020 10:51:17 -0400
X-MC-Unique: nNeXoKOMMWS6Gq8ao7IdNA-1
Received: by mail-ed1-f72.google.com with SMTP id r19so2403080edq.12
        for <linux-usb@vger.kernel.org>; Wed, 02 Sep 2020 07:51:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5vzgzU1CZMtoI06KWeIJ83LEN/Kkpi9UoniHWN651oQ=;
        b=o3LGDPXXOdM4GlhcxdVos+3i4sE7j+v+fxDw3yHTPDz9H3+7rybt2JCoXb+5z7XZuj
         ZaqBY58Miws7dOuJgJMkZtq82scv2Iv8lRb2r0x++q/Hgogig/Lz1/iMdKy1GcRVzWy6
         WvAeQHTJM+WZVGuAuQvVsKp1MVZVDdSCeJelrDF4h2xosB6bz8hQIgrqhQ2QYXbL9VNU
         eGrsrwDR+oRqx/fqQ7iMcjR0CD7SaX2M0BGyybCr7rbWoHo3cRWrX5Ks8u/GFgNxxim2
         QD9nLFOMeSh5EYWhOds8HZnGstknpeqM9vsRU5M+MgKWkZec1BHqb+ZsXmjzgHoJ+nXh
         f72Q==
X-Gm-Message-State: AOAM530Il8Uxq+zaQP/Ujmo5ZTy+kOVhBFKo3Iiz3yNKj7vbNJQaUbhC
        /58qgkShW33zG3rV9BmLkg1VWGI1Xm1q2oayF7u5YLSF8zqhvyu/p+vjark4WnnLF1T8Vqh9ZvE
        n41KDKecjhwt2DZGK/9DL
X-Received: by 2002:aa7:d40f:: with SMTP id z15mr412674edq.247.1599058275704;
        Wed, 02 Sep 2020 07:51:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwtfaygVKbEv6sXYawjyl11rtlcE+oAJHNfqLpYjHizTIRUeXyeXwHD93bol0Ys7Z/BDsHpTA==
X-Received: by 2002:aa7:d40f:: with SMTP id z15mr412659edq.247.1599058275482;
        Wed, 02 Sep 2020 07:51:15 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id d9sm4184763edt.20.2020.09.02.07.51.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2020 07:51:14 -0700 (PDT)
Subject: Re: 5.8 regression: Low-speed interrupt transfers not working on
 (some?) 9 Series Chipset xHCI Controllers
To:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
References: <428aa83d-ab2e-d391-3449-770d108bb087@redhat.com>
 <9b1b1f17-83a8-2e4d-ee73-f28eedac2777@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <19385902-a72f-cdfa-f3b2-109c7d7c5619@redhat.com>
Date:   Wed, 2 Sep 2020 16:51:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <9b1b1f17-83a8-2e4d-ee73-f28eedac2777@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 9/2/20 2:17 PM, Mathias Nyman wrote:
> Hi
> 
> On 2.9.2020 12.07, Hans de Goede wrote:
>> Hi,
>>
>> I've been working with 2 Fedora users who both report that there
>> keyboard and mouse has stopped working after upgrading to
>> 5.7.17 -> 5.8.4 .
>>
>> After some back and forth I have found the following common pattern:
>>
>> 1. Both reporters have a "9 Series Chipset Family USB xHCI Controller"
>> 2. Both reporters have a lo-speed (1.5M) keyboard and mouse connected to
>>     that XHCI controller
>> 3. The kbd/mouse gets detected but does not send events.
>>
>> So there seems to be an issue with lo-speed USB interrupt-transfers
>> not working on the "9 Series Chipset Family USB xHCI Controller".
>>
>> One reporter is using a DELL Precicion T5610 laptop, the PCI id
>> of the XHCI controller there is 8086:8cb1 and both 5.7 and 5.8 dmesg say:
>>
>> [    3.324639] xhci_hcd 0000:00:14.0: hcc params 0x200077c1 hci version 0x100 quirks 0x0000000000009810
>> [    3.324643] xhci_hcd 0000:00:14.0: cache line size of 64 is not supported
> 
> Are there any logs of this?

Yes, sorry I should have included a bugzilla link, the bugzilla has
lsusb -t and dmesg out from both users with both kernels:

https://bugzilla.redhat.com/show_bug.cgi?id=1874300

But it seems that at least part of the problem is the xhci driver
being built as a module with the Fedora 5.8 kernels where as 5.7
had it builtin, so first let me investigate that angle further before
you spend more time on this.

Regards,

Hans




> Dynamic debug of xhci and usb core would help.
> 
> echo 'module usbcore =p' >/sys/kernel/debug/dynamic_debug/control
> echo 'module xhci_hcd =p' >/sys/kernel/debug/dynamic_debug/control
> 
>>
>> The other reporter is using a Gigabyte H97-D3H motherboard. This reporter
>> reports that plugging the kbd/mouse into the USB ports which are connected
>> to the H97's EHCI controller works around the problem.
>>
>> I have tried to reproduce this on some of my own systems, but I do
>> not have any hardware of this exact generation and I could not reproduce
>> it on the closest hardware which I do have.
>>
>> Matthias, if you have some idea which 4.8 change might have caused this
>> I can build rpms with a test kernel with that change reverted for
>> the reporters to test.
> 
> Can't see anything obvious that would cause this on the xhci side.
> Best guess would have been:
> 
> 8f97250c21f0 xhci: Don't clear hub TT buffer on ep0 protocol stall
>   - but it's already in 5.7.17.
> 
> 536dd97c6952 xhci: Fix enumeration issue when setting max packet size for FS devices
> - but is for Full-speed devices, and also in 5.7.17
> 
> If there is a hub (possibly built in) between the roothub and the keyboard then this
> could be related to the TT buffer of the hub. Just before 5.7 there were fixes related to this,
> and would concern LS and FS devices.
> 
> what does lsusb -t say?
> Are there any changes on the hid side that could case this?
> 
> -Mathias
> 
> 
> 


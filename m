Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF43725AEAF
	for <lists+linux-usb@lfdr.de>; Wed,  2 Sep 2020 17:22:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727961AbgIBPV6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Sep 2020 11:21:58 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:53457 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727943AbgIBPUT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 2 Sep 2020 11:20:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1599060004;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=5vzgzU1CZMtoI06KWeIJ83LEN/Kkpi9UoniHWN651oQ=;
        b=aVGDuKK7F8HJ27mKPGpPPd74tYe1AvwJOp+pkVNGGXB+XEQ+EsdxGbnOsB+d4a43Bzn20Y
        6R0x9zukTW4cE5HxXOuWhv5pr+ckTnGFdiK+agEwUMrLf20Ln6tNqYZ8604r0j5oxPGwXe
        Xb0Xg2wCc1/35hkBYA0yCLGCuCGXhuI=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-260-Ezm7WrjKNW2pYIrTzEtPVg-1; Wed, 02 Sep 2020 11:17:59 -0400
X-MC-Unique: Ezm7WrjKNW2pYIrTzEtPVg-1
Received: by mail-ej1-f69.google.com with SMTP id w10so2399721ejq.11
        for <linux-usb@vger.kernel.org>; Wed, 02 Sep 2020 08:17:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5vzgzU1CZMtoI06KWeIJ83LEN/Kkpi9UoniHWN651oQ=;
        b=PCWwBwJGDfRPI8/fss6PDLynVFuoTU9A2Bsv5ELL/EGgCq1Kmh7rPBjJKxZq2UzoEB
         USfhDh5KFHIbXkh7px16USxtRMC6u5RYFMb0epMnFi1mBylZv6y1X8iLDzRHt9I4gQsy
         dm7RhE1XbypvM/rCUII6hfFUEiceoxnD+LLiJpFXqurJipCpCUFCNP2my5oAcscUX6F0
         fEyCoQK36mxlRRGaqxQ3sPumDNgP1vYoNZE1lal7oVzJw8Rc4nQylogG59hdEwFfahuG
         YbAd0/v3JLEl0Ld8/8imaK+NksSAErX0xN3S+0m4chH/NsecDLmP9/gVGeo0HNSKQs+w
         PIVQ==
X-Gm-Message-State: AOAM532LV3NuH1oRkb31zhr58MM+qSs82r+7RqscO2v9GwhwOZMaYJfr
        QFHV4IyD1EfAVmOhVhxbv6N4c3f/We6ifkXshODjXSnj/pZCDYfQP5No4HTu86Bg8n6RqQiOOTF
        17dvifh18J0SGUEbFosfk
X-Received: by 2002:a05:6402:1219:: with SMTP id c25mr592029edw.220.1599059877208;
        Wed, 02 Sep 2020 08:17:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyI389Zs6lCQMyx004TOPtjQ1bRVYUiAwpVVLptqttVSjF+ydOm1epkcfLr5mhdWeJ///SciQ==
X-Received: by 2002:a05:6402:1219:: with SMTP id c25mr592010edw.220.1599059876956;
        Wed, 02 Sep 2020 08:17:56 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id c8sm4479157ejp.30.2020.09.02.08.17.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2020 08:17:55 -0700 (PDT)
From:   Hans de Goede <hdegoede@redhat.com>
Subject: Re: 5.8 regression: Low-speed interrupt transfers not working on
 (some?) 9 Series Chipset xHCI Controllers
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
References: <428aa83d-ab2e-d391-3449-770d108bb087@redhat.com>
 <9b1b1f17-83a8-2e4d-ee73-f28eedac2777@linux.intel.com>
Message-ID: <4e95ce6c-2e45-2c55-507d-02d5a9fed631@redhat.com>
Date:   Wed, 2 Sep 2020 17:17:55 +0200
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


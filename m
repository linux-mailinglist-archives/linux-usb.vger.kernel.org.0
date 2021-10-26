Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3C8343B019
	for <lists+linux-usb@lfdr.de>; Tue, 26 Oct 2021 12:34:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233641AbhJZKhH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 26 Oct 2021 06:37:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30249 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234397AbhJZKhD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 26 Oct 2021 06:37:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1635244477;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ltK4jSBRwp2IN/NcA6rj72NIrTrBE61WNme7h4EtW9o=;
        b=JIVeTWZ31pApPf5JZCgy/yCqCjqGLm/OveLkOjaBn1hopxQ0YqEUtNWp93PhGGPNWJB7mR
        YovtWL9HNCyMEmMqby0r88KnyZ+yiAZkWNp6HQczy1eBNIOwlGScwAJdMSKXUbVw8NLXxD
        uI3OMBOMCXhDBBiPSXZrkEmTpvQbALw=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-65-u9NEsochNNKRRMrmSgK6Pg-1; Tue, 26 Oct 2021 06:34:35 -0400
X-MC-Unique: u9NEsochNNKRRMrmSgK6Pg-1
Received: by mail-ed1-f70.google.com with SMTP id w7-20020a056402268700b003dd46823a18so6753720edd.18
        for <linux-usb@vger.kernel.org>; Tue, 26 Oct 2021 03:34:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ltK4jSBRwp2IN/NcA6rj72NIrTrBE61WNme7h4EtW9o=;
        b=bHQOgv19V6BiFvMcHcdVqC50JLtLkVit3u2XIFF2k9oJQF9zWqQ0ZlxCVf3h3c+hrk
         kVQIYll8mrvaSs6nsL0bRXBynWvR0A3S/0fw1bUyRDMS/WI1z+TqWVOJrDgcD6doTLas
         oOuIa30WslYTPIx5H2eH68VE8SWFueZ0Z9RUYQooYPY8JjeZCT1ujJFZK8SPjpJof+rd
         muG0LC9jTPmOPhWnAg8jbBEKf7wJzckjzNoGQr5TXn6yNqLXEkdAwiaUydiNDds4n40W
         T8nllxqsrttOz7OStTMPUuBdPbRWSF9PZkQwNVyS+Cjgol08WWIwnOb1gG2BqNfEuUNR
         R3qQ==
X-Gm-Message-State: AOAM533hxij4uOvipF0/utwXveK5UqxcRdnoyD9IkQ5nkwF78aNY8pAa
        8nH2fARW3hBlYTLgk7qsyzQAiwPJwxYjfsiLZu28U5hEBt2viVkMadTKvcs5qPFGfdhPz2JjomY
        kV9CXtzkMByaL3s2m0+Pg
X-Received: by 2002:a05:6402:508:: with SMTP id m8mr35472688edv.364.1635244474648;
        Tue, 26 Oct 2021 03:34:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzuL22WL3Hde8D671UGmMt1rJo+6diEEvxOYuNS8nx1ExY5CVI1+9KhsWgZYvix0zoRE1ImPg==
X-Received: by 2002:a05:6402:508:: with SMTP id m8mr35472663edv.364.1635244474492;
        Tue, 26 Oct 2021 03:34:34 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id x22sm10630175edv.14.2021.10.26.03.34.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Oct 2021 03:34:34 -0700 (PDT)
Message-ID: <46faa3fd-85bd-da33-42b5-9a40824e0b31@redhat.com>
Date:   Tue, 26 Oct 2021 12:34:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: Disabling intel-wmi-thunderbolt on devices without Thunderbolt /
 detecting if a device has Thunderbolt
Content-Language: en-US
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Mario Limonciello <mario.limonciello@outlook.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        linux-usb <linux-usb@vger.kernel.org>
References: <e21981cf-fef0-b73d-8fe4-4e1fab0d3864@redhat.com>
 <PH0PR15MB4992B80415BE9BD4836CF336E1839@PH0PR15MB4992.namprd15.prod.outlook.com>
 <b067d9f8-4d15-ac5e-3f1f-ff2ffa3b29aa@redhat.com> <YXbJZ+qP7s7TZ4rQ@lahna>
 <ba1fdd81-0580-1d1f-9e09-d78642b13d95@redhat.com> <YXfCGtrtUiej2EZT@lahna>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <YXfCGtrtUiej2EZT@lahna>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 10/26/21 10:53, Mika Westerberg wrote:
> Hi,
> 
> On Tue, Oct 26, 2021 at 10:17:53AM +0200, Hans de Goede wrote:
>> Hi,
>>
>> On 10/25/21 17:12, Mika Westerberg wrote:
>>> On Mon, Oct 25, 2021 at 04:54:41PM +0200, Hans de Goede wrote:
>>>>> Yes that's exactly what is supposed to happen that this attribute is made.
>>>>> What exactly happens when you write into it?
>>>>
>>>> The _SB.CGWR ACPI method gets called, with arguments coming from ACPI
>>>> settings stored in memory. Depending on those settings this function
>>>> either directly pokes some MMIO or tries to talk to an I2C GPIO
>>>> expander which is not present on the Surface Go, causing it to
>>>> MMIO poke an I2C controller which it should not touch.
>>>>
>>>> In either case the AML code ends up poking stuff it should not touch
>>>> and the entire force_power sysfs attribute should simply not be
>>>> there on devices without thunderbolt.
>>>
>>> That's right - it should not be there in the first place if there is no
>>> Thunderbolt controller on that thing.
>>>
>>> I guess most of the systems that have this actually do support
>>> Thunderbolt so maybe we can work this around by quirking all the Surface
>>> models in that driver?
>>
>> I was hoping that we could avoid this, but yes if there is no easy /
>> clean way to detect if there are any Thunderbolt controllers on the
>> system then a DMI table is necessary.
> 
> Well, the force power thing is there just for this reason. It should
> only be present on systems using ACPI assisted PCIe hotplug for
> Thunderbolt devices. Apparantly some BIOS engineer forgot to remove it
> on Surface :( I need to check if it is present on recent reference
> BIOSes too. If it is then I'll report an internal sighting about this to
> get it removed.
> 
> In theory we could also use a heuristic that if there is a TBT
> controller present when the driver probes it should fail the probe or
> so. Or even look for the PCI host bridge and if it got the PCIe hotplug
> capability from the BIOS (through _OSC negotiation) we can assume this
> system does not need the force power.

I think adding such heuristics might be a good thing to do, because
I suspect that this problem is much wider then just a couple of
surface devices.

One worry I have about this is probe ordering. We cannot assume the
entire PCI bus has been enumerated when the intel-wmi-thunderbolt's
probe() method runs. So that would mean doing something like
returning -EPROBE_DEFER if no thunderbolt controller is found and
then say 1 minute after boot return -ENODEV to get us of the
probe_deferal devices list...

IOW this is going to be ugly so for now I think a DMI list for the
devices where I want to make sure force_power does not poke the
GEXP device is best.

Regards,

Hans



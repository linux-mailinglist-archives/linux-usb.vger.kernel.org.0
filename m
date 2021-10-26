Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9C2643ADDD
	for <lists+linux-usb@lfdr.de>; Tue, 26 Oct 2021 10:17:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233583AbhJZIUV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 26 Oct 2021 04:20:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51357 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233575AbhJZIUV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 26 Oct 2021 04:20:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1635236277;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=LvEdsJ7Am5Comfg4Cqg6YLeRCJa8uayzgZIYwRzF8qw=;
        b=atmq++VVlYz9wz6dvHu2TbWP0SUZaKC4+dgFCCMTQ1m7aiRn1GVv/S5fZrP85vRnSn4FCJ
        xEjieKgsjY4ycHR1neEw3TGgIOcMqkxW0pdVm/QKmArziyqwXSHuBWFG+Xdsg2+bDDf3ao
        Go6oRjvcpot5qzlwOu6rgyDo6+at6gE=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-381-qgDdnXqKMSOq4xwu1R6LVA-1; Tue, 26 Oct 2021 04:17:55 -0400
X-MC-Unique: qgDdnXqKMSOq4xwu1R6LVA-1
Received: by mail-ed1-f69.google.com with SMTP id f21-20020a0564021e9500b003dd77985601so2158718edf.9
        for <linux-usb@vger.kernel.org>; Tue, 26 Oct 2021 01:17:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=LvEdsJ7Am5Comfg4Cqg6YLeRCJa8uayzgZIYwRzF8qw=;
        b=ZsCyjlFQjsuie93dxReuv8HoR3bjeuVV9BcqVJ717di6LYtQVVm1nF1bFngH+F179W
         2WvF8S6Zv3YUZpvsrh11EOCKLAg0oln7kCvlwLGO5DEVWnxGuNpf9uSwmQmYs33itadG
         9g6KypSU5WKwUHvHG3allDEKNU86aElY75k/CDSUNye9N7xuUmh2GHQvSNTDjMerLWeW
         aKLfqLWrVXiJZHbYeto1IDp78aheY6fAt8PM9XS7S6e/xIvorSTUvU0ctm7Yp23dx06O
         sK2SZ3pKqyT4e+BOAfBV4hJSXXztGv2dYACbpzH1M0KxjafbJNsrq8DAxmPkymx3tr3l
         Dx6Q==
X-Gm-Message-State: AOAM530r2NIMrCdMdtpqMV6NVYxnrmYXFt8U5pv6RFKhDeM8d8LGcww6
        HorXzaaF3rV9Wz5C/TiYKyVd4JP/kasdvBep0EDROJ7EyKdidU9cfnxZ05x36ZBFBSnqpKSLdlu
        S4aaJkVbJBjPNzUugtH3h
X-Received: by 2002:aa7:d31a:: with SMTP id p26mr580116edq.264.1635236274523;
        Tue, 26 Oct 2021 01:17:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxt/C+3cONMjyKzamDa9kbxzYJ1IFq5PllwO0LwVufiGEW+2i2kyr5n566Ka3N173JFKcoKBg==
X-Received: by 2002:aa7:d31a:: with SMTP id p26mr580093edq.264.1635236274379;
        Tue, 26 Oct 2021 01:17:54 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id r26sm8834794ejd.85.2021.10.26.01.17.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Oct 2021 01:17:54 -0700 (PDT)
Message-ID: <ba1fdd81-0580-1d1f-9e09-d78642b13d95@redhat.com>
Date:   Tue, 26 Oct 2021 10:17:53 +0200
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
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <YXbJZ+qP7s7TZ4rQ@lahna>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 10/25/21 17:12, Mika Westerberg wrote:
> On Mon, Oct 25, 2021 at 04:54:41PM +0200, Hans de Goede wrote:
>>> Yes that's exactly what is supposed to happen that this attribute is made.
>>> What exactly happens when you write into it?
>>
>> The _SB.CGWR ACPI method gets called, with arguments coming from ACPI
>> settings stored in memory. Depending on those settings this function
>> either directly pokes some MMIO or tries to talk to an I2C GPIO
>> expander which is not present on the Surface Go, causing it to
>> MMIO poke an I2C controller which it should not touch.
>>
>> In either case the AML code ends up poking stuff it should not touch
>> and the entire force_power sysfs attribute should simply not be
>> there on devices without thunderbolt.
> 
> That's right - it should not be there in the first place if there is no
> Thunderbolt controller on that thing.
> 
> I guess most of the systems that have this actually do support
> Thunderbolt so maybe we can work this around by quirking all the Surface
> models in that driver?

I was hoping that we could avoid this, but yes if there is no easy /
clean way to detect if there are any Thunderbolt controllers on the
system then a DMI table is necessary.

My reason for looking into this is because force_power writes
may end up accessing the _SB.GEXP ACPI device which is present in
most DSDTs for devices with recent Intel Core CPUs (this device
seems to represent an I2C attached GPIO expander).

This _SB.GEXP ACPI device claims the MMIO region / PCI BAR of the
I2C4 controller but on the Surface the I2C4 bus is used for the
front camera sensor; and i2cdetect shows there is no GPIO-expander.

So I plan to add an exception for acpi_enforce_resources for the
Surface Go and Surface Go 2 so that Linux can use I2C4. To make sure
this is safe I audited all GEXP accesses in the DSDT.

And depending on the value of the FPAT value from the ACPI config
memory area writing force_power may access the GEXP device, so to
make sure this does not happen; and thus it is safe to add an
override for acpi_enforce_resources, we will need something akin
to a no_thunderbolt_dmi_ids DMI table inside intel-wmi-thunderbolt.

Regards,

Hans


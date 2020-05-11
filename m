Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E08A1CD9D8
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2020 14:30:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729897AbgEKM3c (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 11 May 2020 08:29:32 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:23553 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728084AbgEKM3b (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 11 May 2020 08:29:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1589200170;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=C6bkmx2Au9aJV/eJKVFmnYa+SP3QUXOVqL+LmgTI3ts=;
        b=arjPJlm2grMfowNYYjITSyIm1MVGJbA0sFCoq3AQcH7RQndtgTX4Z8iDNsc3Pgq2t2InYY
        6YEuz4437XDYmqEJtiBCddSrsn69uqyMYGUyc2g1sSpHcUDnWoj4KLsxK+kbQmdJjGpBCj
        tdrrBqNjTmCYtjGmy1rUGiFPF8GgPS8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-391--eGssgXDPv6sSi-pUspLvA-1; Mon, 11 May 2020 08:29:27 -0400
X-MC-Unique: -eGssgXDPv6sSi-pUspLvA-1
Received: by mail-wr1-f71.google.com with SMTP id g10so5172194wrr.10
        for <linux-usb@vger.kernel.org>; Mon, 11 May 2020 05:29:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=C6bkmx2Au9aJV/eJKVFmnYa+SP3QUXOVqL+LmgTI3ts=;
        b=N8ZDhkgE836s8VdIDWocbUVAL5um0iP9Q7CTzsmhM+DrH/fqDe8dVtLW0DJYwln3dI
         kiVOUAGIeKM4xeJpv8fs5+fA9+EcRKSdKvz4CMjw4O2/5wd/uDMuFUz2XrHRTAJRiOdm
         9N/p1w8Qj+xtNlfc7/e+sUqLPjidUlLorCANzrfEil40yHqiqQBBRbXw2hWv17gHyEzo
         Ze0WliSC4l5LoH/uoQYZeUOATr4KYyt/F3eYAAbX0PDpKxKq4Sb0Pyrs8s98vh4fUELJ
         jn/VU6vdtwbiG/0dqrC8nVs2ACvIGAOA0LPl/S9puIpIW69TreFlTS3/GebmOC9thoHt
         Uzzw==
X-Gm-Message-State: AGi0PuaAagnGgAaovJ32xO9KwTgY62kWagSx5FZrQtmG0BbJ4W5Aa4Mm
        WuQ+dPGs3kkoVgwmQ6JrRC0vc3fKUBR/oWClYUBkjgnBy/Cp27EW/I2xPY14W9cOWcnXy6UaLWB
        wxG+/NTSiVGDt5uZqNRqx
X-Received: by 2002:a5d:55c5:: with SMTP id i5mr13014988wrw.402.1589200166325;
        Mon, 11 May 2020 05:29:26 -0700 (PDT)
X-Google-Smtp-Source: APiQypKe4b0dRV+F1Cr815EBSgnwnsGVHu87+SL20WjD6O61pau0W53Seo7zP9NaelOI+yQBG8GfIg==
X-Received: by 2002:a5d:55c5:: with SMTP id i5mr13014969wrw.402.1589200166059;
        Mon, 11 May 2020 05:29:26 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id h74sm18347920wrh.76.2020.05.11.05.29.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2020 05:29:25 -0700 (PDT)
Subject: Re: your mail
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     jakub@bilan.me,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        USB <linux-usb@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
References: <526351589195104@mail.yandex.com>
 <20200511113506.GB2062175@kuha.fi.intel.com>
 <CAHp75VcwUcbtZFQExEoJg9sFFVa_ueUT71SiMCVWetgaQg6kDQ@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <5ee2b9ef-25e3-c049-3f82-d3d51d392824@redhat.com>
Date:   Mon, 11 May 2020 14:29:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VcwUcbtZFQExEoJg9sFFVa_ueUT71SiMCVWetgaQg6kDQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 5/11/20 1:44 PM, Andy Shevchenko wrote:
> +Cc: Hans

Thank you, I'm afraid that I do not have much of value
to add here, Heikki knows these systems (with an INT3515 device)
a lot better then I do.

> On Mon, May 11, 2020 at 2:38 PM Heikki Krogerus
> <heikki.krogerus@linux.intel.com> wrote:
>>
>> +Andy
>>
>> Adding also the linux-usb mailing list.
>>
>> On Mon, May 11, 2020 at 01:06:18PM +0200, jakub@bilan.me wrote:
>>> Hello, I'm running Intel NUC10i3 with Ubuntu 20.04 on board. I have a problem
>>> with cpu interrups causing issues with deeper CPU sleep and increased power
>>> usage. Also load is always 1 even if machine has nothing to do.
>>>
>>> I made a reasearch and found that device named TPS6598x interrupts my CPU. This
>>> device is related with USB and according to datasheet it's "USB Interface IC USB
>>> Type-CG and USB PD controller power switch and high-speed multiplexer ". I have
>>> nothing connected to NUC except power plug and ethernet cable.
>>>
>>> Screenshots: https://imgur.com/a/uw9NDCi
>>>
>>> How to solve this issue? Could you help me?
>>
>> My guess is that the IRQ resource is not correct for the PD
>> controller causing you to see irq flood.
>>
>> The problem is that the ACPI device entry (the node) on this platform
>> has 4 I2CSerialBus resources and 4 IRQ resources. The idea is that the
>> single ACPI device entry can represent up to 4 USB PD controllers. The
>> problem is that there is no way to know which IRQ resource belongs to
>> which I2CSerialBus resource :-(.
>>
>> Andy, this is one of those multi-instantiate I2C slave devices with
>> HID INT3515.
>>
>> The only solution I can think of is that we start maintaining DMI
>> quirk table in drivers/platform/x86/i2c-multi-instantiate.c where we
>> supply the correct i2c to irq resource mapping for every platform
>> that has this device(s).
> 
> I would rather disable them and issue a firmware bug.
> Vendors, including us, should do something sane about this.

I have to partially disagree here. I agree that for future hardware
versions the firmware team of those devices should offer a saner
interface. But for the current hardware gen I guess we are stuck
with this and having a DMI table for popular models (well any model
a Linux user is willing to submit a quirk for) is better then simply
not having things working under Linux.

I do wonder what Windows does here though. Perhaps the INT3513 device
has some ACPI methods to query for more info, like how many Type-C
controllers there actually are?

Regards,

Hans


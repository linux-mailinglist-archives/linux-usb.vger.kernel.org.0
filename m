Return-Path: <linux-usb+bounces-10267-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3298C587E
	for <lists+linux-usb@lfdr.de>; Tue, 14 May 2024 17:10:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A083A28279A
	for <lists+linux-usb@lfdr.de>; Tue, 14 May 2024 15:10:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10FCA17EB87;
	Tue, 14 May 2024 15:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZqCZPnSX"
X-Original-To: linux-usb@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF001E480
	for <linux-usb@vger.kernel.org>; Tue, 14 May 2024 15:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715699423; cv=none; b=Y5UBJU0yX7L0mxDj3ESe8bkoqFQiZtMiPlTgaKqvXGGXkeEjNPkVFCfcwFMVN7A9e90WdZapeXM6QML3xZcJ095ki4usTeMjjh6LF9D6RVSZHTyhNNyQgkSb933n3+o+UWx/fKTNsWGR/1l8V6JhhyIW89XaNDWX3kk/UCxzPpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715699423; c=relaxed/simple;
	bh=YlvfgrWecR/BVHEZ9dXK0OemgjO8ca0eRw95vMoW9Ss=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=soqZOV8MMAPbmUnI+YMEiCtYvHH29gshnIL+DeGRFAmLGwj3JoRMmnI5lZx6JkCn2/HllI1jKchtZ18hPgn704zkbJnKqbzPWdWOJ7wNdBqVeN3NM06iAgj0bitpnXkKRoZ/i/calpB+BwcYSp3U227+amJoNMjvS/136Qwg5Pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZqCZPnSX; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715699420;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kvO0cxgHO+nsSHAdHeN0TV0zj1R+uYeQ/4oU4vqqMEg=;
	b=ZqCZPnSXcZJ50Y+bHKyrc969sy49sKmp/bpDVQMilHeBIgypdDVcisz/l0NKJsvtiHZC4D
	tcssZxHj7wrJJsCU4vgVzLo6MaRr9USQi7hmhpYjD/g0fZ9l05H4uDnM0SLD5+DRosi4B1
	wk9LWvFW5iLfCliJGZ3d66ve6Lys8ds=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-34-2itBacfiNWqmlggmmedySg-1; Tue, 14 May 2024 11:10:08 -0400
X-MC-Unique: 2itBacfiNWqmlggmmedySg-1
Received: by mail-lf1-f70.google.com with SMTP id 2adb3069b0e04-52236a56aa1so3338512e87.0
        for <linux-usb@vger.kernel.org>; Tue, 14 May 2024 08:10:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715699407; x=1716304207;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kvO0cxgHO+nsSHAdHeN0TV0zj1R+uYeQ/4oU4vqqMEg=;
        b=C1ag2JC6uWCyIRSoqaiCYQJ8rt/PSliR7gtD/GnVUSXpr4HmiA5+J6KkHCJiT+VyLw
         DngxXUyIkF7eBzWxxkh1b8j5LfUdhyZcRQG1xrdl98xvisRSuTgv2IuzLAY9mR0YfDh/
         7SpJWK3wIn+DuEhmLNZ1TOQse/iMKTwE9gDsNFuJFDZU9k92y1NC9KYoBOmW8Jja3IvU
         V0gPVCkyDuVlFFk07LIzGz4NLczp7sEjoN255oVms0LZs7qg++bfEZRIbAMFow7NU58w
         NKKetnprDzeWXAJhUu79fb1LlGxxN7QmQkoooumwWcVIlqqn7UH/QtPZPeor9102Ddbb
         UpEA==
X-Forwarded-Encrypted: i=1; AJvYcCUIhlC72hKErFBJhLtIeoY2Gwb8wJqc3x8Vjlzd4zOBaw6YZhbsLK6Hqxk1a1P+rsDKSjccB0SCF6gkJIZK/BY4bKrsb+ntyPSx
X-Gm-Message-State: AOJu0Ywi5myTPrgkcmW5GI1JuHnjNTWk4L6HUT8Zpx3sc1Jy1j0/x0oE
	Lapv1WNTnFxbJ654fi7BdRBpRjDp5fc+S+OrcmKpzOK5QAOR3B3PfuqXAo0VFnE58kCa3SnVYLk
	d6WWwUss6h4N2OHInzoz+J9qjOsmjqOx6RGu3L86KZc+CCdvR/i0f7Y0tIQ==
X-Received: by 2002:a19:6454:0:b0:523:87b6:917d with SMTP id 2adb3069b0e04-52387b691d6mr124677e87.69.1715699406933;
        Tue, 14 May 2024 08:10:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF4F3fHZbZdFrZKrm4Nyer9AlKUoTo2X/QSWY8wl1hVlMQzf4lZMcvxOy1vA2xtq85hXQ4Fxw==
X-Received: by 2002:a19:6454:0:b0:523:87b6:917d with SMTP id 2adb3069b0e04-52387b691d6mr124647e87.69.1715699406404;
        Tue, 14 May 2024 08:10:06 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a1787c715sm732538566b.46.2024.05.14.08.10.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 May 2024 08:10:05 -0700 (PDT)
Message-ID: <51cd4b4f-a658-406f-b76c-500231e3ec7d@redhat.com>
Date: Tue, 14 May 2024 17:10:05 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: Add new MeeGoPad ANX7428 Type-C Cross
 Switch driver
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 platform-driver-x86@vger.kernel.org, linux-usb@vger.kernel.org
References: <20240211195307.158956-1-hdegoede@redhat.com>
 <CAHp75VdSWwntsEh5xBz3jzXGi_QRuaRhcSs1-MwG3QYHW=wMtQ@mail.gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75VdSWwntsEh5xBz3jzXGi_QRuaRhcSs1-MwG3QYHW=wMtQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Andy,

Thank you for the review.

I agree with all your review comments below and I have fixed them all
for v2 of the patch which I'm about to post.

Regards,

Hans



On 2/11/24 9:50 PM, Andy Shevchenko wrote:
> On Sun, Feb 11, 2024 at 9:53 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Some MeeGoPad top-set boxes have an ANX7428 Type-C Switch for USB3.1 Gen 1
>> and DisplayPort over Type-C alternate mode support.
>>
>> The ANX7428 has a microcontroller which takes care of the PD negotiation
>> and automatically sets the builtin Crosspoint Switch to send the right
>> signal to the 4 highspeed pairs of the Type-C connector. It also takes
>> care of HPD and AUX channel routing for DP alternate mode.
>>
>> IOW the ANX7428 operates fully autonomous and to the x5-Z8350 SoC
>> things look like there simple is a USB-3 Type-A connector and a
>> separate DipslayPort connector. Except that the BIOS does not
> 
> DisplayPort
> 
>> power on the ANX7428 at boot (meh).
>>
>> Add a driver to power on the ANX7428. This driver is added under
>> drivers/platform/x86 rather then under drivers/usb/typec for 2 reasons:
> 
> than
> 
>> 1. This driver is specificly written to work with how the ANX7428 is
> 
> specifically
> 
>> described in the ACPI tables of the MeeGoPad x86 (Cherry Trail) devices.
>>
>> 2. This driver only powers on the ANX7428 and does not do anything wrt
>> its Type-C functionality. It should be possible to tell the controller
>> which data- and/or power-role to negotiate and to swap the role(s) after
>> negotiation but the MeeGoPad top-set boxes always draw their power from
>> a separate power-connector and they only support USB host-mode. So this
>> functionality is unnecessary and due to lack of documenation this
> 
> documentation
> 
>> is tricky to support.
> 
> ...
> 
>> +/*
>> + * meegopad_anx7428.c - Driver to power on the Analogix ANX7428
> 
> Keeping a filename inside the file is a burden in case the file gets
> renamed in the future.
> 
>> + * USB Type-C crosspoint switch on MeeGoPad top-set boxes.
>> + *
>> + * The MeeGoPad T8 and T9 are Cherry Trail top-set boxes which
>> + * use an ANX7428 to provide a Type-C port with USB3.1 Gen 1 and
>> + * DisplayPort over Type-C alternate mode support.
>> + *
>> + * The ANX7428 has a microcontroller which takes care of the PD
>> + * negotiation and automatically sets the builtin Crosspoint Switch
>> + * to send the right signal to the 4 highspeed pairs of the Type-C
>> + * connector. It also takes care of HPD and AUX channel routing for
>> + * DP alternate mode.
>> + *
>> + * IOW the ANX7428 operates fully autonomous and to the x5-Z8350 SoC
>> + * things look like there simple is a USB-3 Type-A connector and a
>> + * separate DipslayPort connector. Except that the BIOS does not
> 
> DisplayPort
> 
>> + * power on the ANX7428 at boot. This driver takes care of powering
>> + * on the ANX7428.
>> + *
>> + * It should be possible to tell the micro-controller which data- and/or
>> + * power-role to negotiate and to swap the role(s) after negotiation
>> + * but the MeeGoPad top-set boxes always draw their power from a separate
>> + * power-connector and they only support USB host-mode. So this functionality
>> + * is unnecessary and due to lack of documenation this is tricky to support.
> 
> documentation
> 
>> + * For a more complete ANX7428 driver see drivers/usb/misc/anx7418/ of
>> + * the LineageOS kernel for the LG G5 (International) aka the LG H850:
>> + * https://github.com/LineageOS/android_kernel_lge_msm8996/
>> + *
>> + * (C) Copyright 2024 Hans de Goede <hansg@kernel.org>
>> + */
>> +
>> +#include <linux/acpi.h>
> 
> + bits.h
> 
>> +#include <linux/delay.h>
>> +#include <linux/dmi.h>
>> +#include <linux/gpio/consumer.h>
>> +#include <linux/i2c.h>
>> +#include <linux/module.h>
> 
> ...
> 
>> +#define VENDOR_ID_L                    0x00
>> +#define VENDOR_ID_H                    0x01
>> +#define DEVICE_ID_L                    0x02
>> +#define DEVICE_ID_H                    0x03
> 
> You use word (16-bit) access, why do we need to know these?
> Just define them without suffixes (and if you want add a comment that
> they are 16-bit LE).
> 
> ...
> 
>> +       usleep_range(10000, 15000);
> 
> fsleep() ?
> 
> ...
> 
>> +       /* Wait for the OCM (On Chip Microcontroller) to start */
>> +       for (i = 0; i < max_tries; i++) {
>> +               usleep_range(5000, 10000);
>> +
>> +               ret = i2c_smbus_read_byte_data(client, TX_STATUS);
>> +               if (ret < 0)
>> +                       dev_err_probe(dev, ret, "reading status register\n");
>> +               else if (ret & OCM_STARTUP)
>> +                       break;
>> +       }
>> +       if (i == max_tries)
>> +               return dev_err_probe(dev, -EIO,
>> +                                    "On Chip Microcontroller did not start, status: 0x%02x\n",
>> +                                    ret);
> 
> Why not use read_poll_timeout() / readx_poll_timeout() (whichever suits better)?
> 
> ...
> 
>> +static struct i2c_driver anx7428_driver = {
>> +       .driver = {
>> +               .name = KBUILD_MODNAME,
> 
> Strictly speaking this is an ABI and we don't want it to be changed in
> case of filename change. Personally I _always_ prefer it be open
> coded.
> 
>> +               .acpi_match_table = anx7428_acpi_match,
>> +       },
>> +       .probe = anx7428_probe,
>> +};
> 



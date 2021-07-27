Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CAC83D81B4
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jul 2021 23:22:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233634AbhG0VWM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 27 Jul 2021 17:22:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56176 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232670AbhG0VTi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 27 Jul 2021 17:19:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1627420777;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=6T3hyx5Wd3tSDj0defm5CLFfxGj/ui51DEQ23tr7BJE=;
        b=gMwVn77xsESv8cnHr/BOl06V8lZl2lNueCIFEUFE2GC5R2ytYHTexO1l/LXpGOLEPi/8x4
        2CS449DRGaTD9FpePtZm8mdj666mky5W2wpOASfBt1qam5c5tPSc0kuyLytPVZCbvRgapR
        hN+JAfo/d3zaNyITfZ3+eYSjWoCl6h4=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-498-CEvpR8zhMFCkKrI9_7T2ow-1; Tue, 27 Jul 2021 17:19:36 -0400
X-MC-Unique: CEvpR8zhMFCkKrI9_7T2ow-1
Received: by mail-ed1-f72.google.com with SMTP id k14-20020a05640212ceb02903bc50d32c17so108306edx.12
        for <linux-usb@vger.kernel.org>; Tue, 27 Jul 2021 14:19:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6T3hyx5Wd3tSDj0defm5CLFfxGj/ui51DEQ23tr7BJE=;
        b=tZTPB3tfE7Rs/Ac6ey5YitFK6ZvqRa8K0ShOkEZpB4gTYiVLB7O3j59RXad5OhN9Ti
         l1mD8rJ5fad542+YtXIHB3c0f0kb/oWDSo1o0sa8oSdspn3WwiogEO0YDHxxW41gsEXZ
         mYGaZSa/yRllrZw3I7QJzEqac5Eq4rnCFiX2zrfvlYjfPTml4IHbHER3e/+m5aM3PPmw
         ZPObV3p7jpG3f9FDXYUByJTu0Oo5UH1JzN8XENBFjGUOW3366ve8hNHfKHvfEyUwhfA1
         5ttzV/HBawiqmFy/sIuQyzNguKgK/6aa2/miIyn4/8eCrz9iMs6OEB9EDn6swjEy83ll
         R4pg==
X-Gm-Message-State: AOAM530MR0uDa2wbrhIn15rzMNH9nG2bYQpwW/lvJ5AvfD4anSNC4xru
        +k+KDyTpxgLoJA7esaRzikwlTGerbPkX6YgTfNOh0p9Tylu/5bEMHllqEX+j/BWsbkgmf2JUlEO
        EkubyMVfFfnJG824EhsQ1uGHBKRShan8LOb5p1Q4Qiq+WWzkfDEMvgUHJ5KSrM67XNr8/5ANf
X-Received: by 2002:a05:6402:13c3:: with SMTP id a3mr29887680edx.187.1627420775082;
        Tue, 27 Jul 2021 14:19:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzNEPBlWz8HV5AVPitaiuOcsrE6AmJWgrQ5D1gnAeGbDG7dAgxa5oSqUqS/Igy9Qgd/y+/bGA==
X-Received: by 2002:a05:6402:13c3:: with SMTP id a3mr29887668edx.187.1627420774909;
        Tue, 27 Jul 2021 14:19:34 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id ch27sm1722761edb.57.2021.07.27.14.19.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jul 2021 14:19:34 -0700 (PDT)
Subject: Re: Lacie Rugged USB3-FW does not work with UAS
To:     Julian Sikorski <belegdol@gmail.com>,
        Oliver Neukum <oneukum@suse.com>,
        Nathan Stratton Treadway <vgerlists@nathanst.com>
Cc:     linux-usb@vger.kernel.org
References: <ffe7a644-bd56-3f3e-4673-f69f21f4132b@gmail.com>
 <1566567572.8347.54.camel@suse.com>
 <bedb5e9f-5332-4905-2237-347d7ea77447@gmail.com>
 <0eaecb64-4c67-110d-8493-31dd7fd58759@gmail.com>
 <1566595393.8347.56.camel@suse.com>
 <5f8f8e05-a29b-d868-b354-75ac48d40133@gmail.com>
 <a090c289-6b1a-8907-271a-069aea96ba2f@gmail.com>
 <1567424535.2469.11.camel@suse.com>
 <2a06a5dd-3fc9-0aac-a7e2-67be35e2d6bb@gmail.com>
 <20190904155831.GE4337@nathanst.com>
 <d11b22f3-3f09-2e3f-dc64-956193f2c5d3@gmail.com>
 <1568033125.365.17.camel@suse.com>
 <ed7f6cd6-b787-4876-2462-7977d69c8d4b@gmail.com>
 <f4682d70-9623-c877-78a1-2cdf471014f6@gmail.com>
 <4c2b1c8a-4126-ccfe-3431-323c4935566e@suse.com>
 <56cebf15-cf9d-475f-b388-b2be723697f6@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <c4d769e6-b906-f5f4-255b-7faf27f8702f@redhat.com>
Date:   Tue, 27 Jul 2021 23:19:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <56cebf15-cf9d-475f-b388-b2be723697f6@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 7/19/21 6:10 PM, Julian Sikorski wrote:
> W dniu 19.07.2021 o 14:47, Oliver Neukum pisze:
>>
>>> Hi all,
>>>
>>> apologies for necro-ing this thread. I have just tried this drive with
>>> my new laptop (Asus ZenBook UM425IA) and the same quirk was needed to
>>> get the drive to work:
>>> options usb-storage quirks=059f:1061:u
>>>
>>> Should we still try to get uas working with this drive or should I
>>> send a patch hardcoding a quirk? I am on 5.13.2-300.fc34.x86_64 kernel
>>> now. Thanks for the feedback in advance.
>>>
>>
>> Hi,
>>
>>
>> sometimes we must give up. This thing is too elusive. Please send a
>> patch with a quirk.
>>
>>      Regards
>>
>>          Oliver
>>
>>
> 
> Hi,
> 
> thanks for confirming. Patch is attached, it appears to be working correctly when applied against 5.13.3. Please let me know if changes are required.

I seem to have missed the earlier part of this thread somehow.

Looking at the USB-ids, your model seems mightily close to this existing quirk:

UNUSUAL_DEV(0x059f, 0x105f, 0x0000, 0x9999,
                "LaCie",
                "2Big Quadra USB3",
                USB_SC_DEVICE, USB_PR_DEVICE, NULL,
                US_FL_NO_REPORT_OPCODES | US_FL_NO_SAME),

Before we go with the suggested patch, can you give the uas driver one last
try with:

options usb-storage quirks=059f:1061:fk

? The fk translates like this:

f -> US_FL_NO_REPORT_OPCODES
k -> US_FL_NO_SAME

Regards,

Hans


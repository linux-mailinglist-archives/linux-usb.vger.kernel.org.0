Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E648D16997D
	for <lists+linux-usb@lfdr.de>; Sun, 23 Feb 2020 19:47:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726534AbgBWSrG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 23 Feb 2020 13:47:06 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:43172 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726208AbgBWSrG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 23 Feb 2020 13:47:06 -0500
Received: by mail-pg1-f196.google.com with SMTP id u12so3866781pgb.10
        for <linux-usb@vger.kernel.org>; Sun, 23 Feb 2020 10:47:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=+pmLbSE/kvii9Zz3FLUuP0hymIyoiyHxwc8vdYbytwU=;
        b=I2WXDLo+gzUanzhu4EsbM4qE8hbPngYy1CsjTmbHgrF3cSWt7EjwY+TQyHnVEAGdIc
         Jdr1L9klGa8mx0mgj2gNfvXb5uxFlELnj7fM4s3cD1Ae7YrjGxYSlZsFyQBKGlKacVrY
         8qfXAGHRlroqAnB+CzKouM3hOt+VykvP3kSIWT6gVe/j+CBCLSHEUzneDXuHD3iq6KUH
         9wIRgryKMMsEwwc++EnB7jGJiMg9LFIyBAG5lLR+EGzOKqj2dzYajpyZBb6K9QALenP7
         Oh4dfrXD4ArXKfbe/WmMYEk8Y7HNFAybZRx0KPFngN2EGUfDbYL9m3zRFlK4nlFuLybs
         KI9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+pmLbSE/kvii9Zz3FLUuP0hymIyoiyHxwc8vdYbytwU=;
        b=KwDMJ1O62vI6r7xVP9uRQHat80GJwplniNiLqxQ7C9GkV7MzVsEKmbeoBRnuUCd0e0
         751pjJyY+/6GZocSSZxMAymg2LmPS+KKRIfigB15Uei0kpUZZCEa2VKLEoLHYrrQ/DnX
         U+7tkcbBL2zFHvweOgX3XIvRnObfoWQFQmucrF2cGg9CWfxjgYmr52mRjjkUC4UzWyrc
         t7r4XApHVgM7CpQntfw17Itx60cmjTdDDAMBiPhxccmdkq02XMQ/5VtlcjLupFpcK+BR
         tcOUqPZXNs9QFjp0M0FTFhKHy+vfEspkdkwwQ15fjWk9Y7oqeS0nMTfBArZwXbD2xzQX
         Nmaw==
X-Gm-Message-State: APjAAAVwf5l5I7zUgs8tn3a3mIvyRPJJ77HwspEryFWYmBvs6giFbsB/
        z2dqGSM1EixwwreVjcqLFA4=
X-Google-Smtp-Source: APXvYqy5Kk9THGVlyw9Ipawcea2sz2hBcJ7pkXXsBo00nuBXqIUrz6JohksHQ2bPvm7fRarmHvyYeA==
X-Received: by 2002:a63:7b5a:: with SMTP id k26mr46983022pgn.406.1582483625369;
        Sun, 23 Feb 2020 10:47:05 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c15sm9942166pja.30.2020.02.23.10.47.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Feb 2020 10:47:04 -0800 (PST)
Subject: Re: [PATCH] usb: dwc2: extend treatment for incomplete transfer
To:     =?UTF-8?B?QW50dGkgU2VwcMOkbMOk?= <a.seppala@gmail.com>
Cc:     Boris ARZUR <boris@konbu.org>, linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Minas Harutyunyan <hminas@synopsys.com>,
        William Wu <william.wu@rock-chips.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Douglas Anderson <dianders@chromium.org>
References: <20200210213906.GA24079@roeck-us.net>
 <20200211054953.GA2401@tungsten> <20200211161522.GA1894@roeck-us.net>
 <20200215053647.GA10345@tungsten> <20200219211056.GA829@roeck-us.net>
 <CAKv9HNZx_YTC1QEyT-T2_BuXnnju+9czKx-JJjduk9TjUSjS7A@mail.gmail.com>
 <587c8fd7-6a31-098e-7fcb-815208f602bc@roeck-us.net>
 <CAKv9HNYoyzMbufYyaByDoKgwDO3Vfw2vk7RmpcGdf9pvzREjVA@mail.gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <7e225488-feec-e461-e22b-4befc5ce3c20@roeck-us.net>
Date:   Sun, 23 Feb 2020 10:47:03 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAKv9HNYoyzMbufYyaByDoKgwDO3Vfw2vk7RmpcGdf9pvzREjVA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2/23/20 10:20 AM, Antti Seppälä wrote:
> On Sun, 23 Feb 2020 at 15:45, Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> On 2/23/20 3:00 AM, Antti Seppälä wrote:
>>> Hi Guenter,
>>>
>>> On Wed, 19 Feb 2020 at 23:11, Guenter Roeck <linux@roeck-us.net> wrote:
>>>>
>>>> Yes, those patches didn't address the core problem. Can you test with the
>>>> attached two patches ?
>>>>
>>>> Thanks,
>>>> Guenter
>>>
>>> I took a look at your patch (usb: dwc2: Simplify DMA alignment code)
>>> and I don't believe it is correct.
>>>
>>> The patch re-introduces the dma_aligned_buffer struct and takes some
>>> care to align the beginning of the struct to dma cache lines. However
>>> we should be aligning the data[0] pointer inside the struct instead.
>>> With the code in the patch data[0] gets pushed to be at an offset from
>>> the alignment by kmalloc_ptr and old_xfer_buffer pointers. In other
>>> words data[0] is now not aligned to dma cache boundaries.
>>>
>>
>> I thought so too initially. However,
>>
>> temp = PTR_ALIGN(kmalloc_ptr + 1, TEGRA_USB_DMA_ALIGN) - 1;
>>
>> aligns the structure pointer such that its _end_ is DMA-aligned,
>> which is ->data[0].
>>
> 
> Hmm, looks like you're right. I somehow missed the - 1 at the end.
> Sorry for the noise I guess.
> 
No worries. It took me a while to understand hat code, and I initially
also thought it was wrong, so you are in good company.

> Would be nice to know what makes the previous code prone to pointer
> corruption issues though. With the added padding that pointer should
> also be on another dma cache line.
> 
Padding to DMA cache line size doesn't fix the real problem. The dwc2
IP expects input buffer size to be a multiple of wMaxPacketSize.
dwc2_hc_start_transfer() has the following code(where wMaxPacketSize ==
chan->max_packet).

		if (chan->xfer_len > 0) {
                         num_packets = (chan->xfer_len + chan->max_packet - 1) /
                                         chan->max_packet;
			...
		}
		...
		if (chan->ep_is_in)
			chan->xfer_len = num_packets * chan->max_packet;

If, for example, wMaxPacketSize is 64, and the original xfer_len is, say,
1522 (as observed in our case), xfer_len is updated to 1536, and the chip
is programmed to receive up to 1536 bytes. In most cases, padding the
buffer to the DMA cache line size (64 in our case) catches this, but not
if xfer_len is much lower than wMaxPacketSize.

My code tries to address that situation, but as Boris noticed there is
still something wrong with my fix.

Guenter

Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2993913A26E
	for <lists+linux-usb@lfdr.de>; Tue, 14 Jan 2020 09:04:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728951AbgANID7 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Tue, 14 Jan 2020 03:03:59 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:39850 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725956AbgANID6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 14 Jan 2020 03:03:58 -0500
Received: from mail-pj1-f69.google.com ([209.85.216.69])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <kai.heng.feng@canonical.com>)
        id 1irHB5-0006fw-Rb
        for linux-usb@vger.kernel.org; Tue, 14 Jan 2020 08:03:56 +0000
Received: by mail-pj1-f69.google.com with SMTP id ie20so7663160pjb.8
        for <linux-usb@vger.kernel.org>; Tue, 14 Jan 2020 00:03:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=oyHMiGCOwwLhZ3ql1qP5fClJMPTVAnuOcLkJMOC5WrM=;
        b=nNtzG+DJiX9ZpM3NOyZf3I1UwwEIi1kqCUY4xXf7rLLd8bpB0Ux0TpV2SJpHMgmYl5
         bQM8OefuNksep1TalswGTGH/ng1dKOd2Bb0NyY8j98V0P3mRC5Y4aGhSK/MoEC/RL7Q/
         76Og41nnWMbhd5T8v/UO0LLEZWewA57KSUsaAPurEztRO58+Dyvzojh5wzA9OMrg6Jgr
         LhUV0cHPIsAv97XmHWrlSuQnosJX/iFriZLXLi15qAqbSMG/dSOCxp8+KBzUWFkUcrpS
         O/ST5/fTkYQIQmmVG0bYVf/eiq/Gjzr8E/3rFA59z//enXhJGku1nGRt5XevcTeSip5q
         trqw==
X-Gm-Message-State: APjAAAV4Hsf3xs7B6Hc39ww2U15gHoS4iTPybtr5TZfKZWoR5lsZZSJE
        1M4DGkCNI4kDdc6JAVrwzBoQplNV4fR0xv2W6HSSZyacYBzpGK28fzjzK95o+oBa2RhLuD7z9dq
        sM7n5xdtweNWBupeSnjdBhJiAk1WNdyrV4BaDBw==
X-Received: by 2002:a63:ea4c:: with SMTP id l12mr24798743pgk.174.1578989034498;
        Tue, 14 Jan 2020 00:03:54 -0800 (PST)
X-Google-Smtp-Source: APXvYqxShyOZDQstdIjpd/FUo8c7HCAwhOQJ9K9D7HaFj30wgfmPowWV6e8wRIMwJtnAXgZ8tGtY1g==
X-Received: by 2002:a63:ea4c:: with SMTP id l12mr24798706pgk.174.1578989034126;
        Tue, 14 Jan 2020 00:03:54 -0800 (PST)
Received: from 2001-b011-380f-35a3-5d99-e277-e07f-4d26.dynamic-ip6.hinet.net (2001-b011-380f-35a3-5d99-e277-e07f-4d26.dynamic-ip6.hinet.net. [2001:b011:380f:35a3:5d99:e277:e07f:4d26])
        by smtp.gmail.com with ESMTPSA id bo19sm15439224pjb.25.2020.01.14.00.03.51
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 14 Jan 2020 00:03:53 -0800 (PST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.40.2.2.4\))
Subject: Re: [PATCH] r8152: Add MAC passthrough support to new device
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <CACeCKacQpDsptRi6AZhuFYg2c87-bW0KS6vy=CacB8+j+6YBXA@mail.gmail.com>
Date:   Tue, 14 Jan 2020 16:03:50 +0800
Cc:     David Miller <davem@davemloft.net>,
        Hayes Wang <hayeswang@realtek.com>,
        Jakub Kicinski <jakub.kicinski@netronome.com>,
        Grant Grundler <grundler@chromium.org>,
        Mario Limonciello <mario.limonciello@dell.com>,
        David Chen <david.chen7@dell.com>,
        "open list:USB NETWORKING DRIVERS" <linux-usb@vger.kernel.org>,
        "open list:NETWORKING DRIVERS" <netdev@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: 8BIT
Message-Id: <14A65209-846C-4C94-9EC3-55605D2528B0@canonical.com>
References: <20200114044127.20085-1-kai.heng.feng@canonical.com>
 <CACeCKacQpDsptRi6AZhuFYg2c87-bW0KS6vy=CacB8+j+6YBXA@mail.gmail.com>
To:     Prashant Malani <pmalani@chromium.org>
X-Mailer: Apple Mail (2.3608.40.2.2.4)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



> On Jan 14, 2020, at 15:51, Prashant Malani <pmalani@chromium.org> wrote:
> 
> On Mon, Jan 13, 2020 at 8:41 PM Kai-Heng Feng
> <kai.heng.feng@canonical.com> wrote:
>> 
>> Device 0xa387 also supports MAC passthrough, therefore add it to the
>> whitelst.
>> 
>> BugLink: https://bugs.launchpad.net/bugs/1827961/comments/30
>> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
>> ---
>> drivers/net/usb/r8152.c | 3 ++-
>> 1 file changed, 2 insertions(+), 1 deletion(-)
>> 
>> diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.c
>> index c5ebf35d2488..42dcf1442cc0 100644
>> --- a/drivers/net/usb/r8152.c
>> +++ b/drivers/net/usb/r8152.c
>> @@ -6657,7 +6657,8 @@ static int rtl8152_probe(struct usb_interface *intf,
>>        }
>> 
>>        if (le16_to_cpu(udev->descriptor.idVendor) == VENDOR_ID_LENOVO &&
>> -           le16_to_cpu(udev->descriptor.idProduct) == 0x3082)
>> +           (le16_to_cpu(udev->descriptor.idProduct) == 0x3082 ||
>> +            le16_to_cpu(udev->descriptor.idProduct) == 0xa387))
> Perhaps we can try to use #define's for these vendor IDs (like
> https://github.com/torvalds/linux/blob/master/drivers/net/usb/r8152.c#L680)
> ?

We can, but it'll bring some inconsistencies inside of rtl8152_table[], since we don't know idProduct for other devices.

Kai-Heng

> 
>>                set_bit(LENOVO_MACPASSTHRU, &tp->flags);
>> 
>>        if (le16_to_cpu(udev->descriptor.bcdDevice) == 0x3011 && udev->serial &&
>> --
>> 2.17.1
>> 


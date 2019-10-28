Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B0D29E6BC0
	for <lists+linux-usb@lfdr.de>; Mon, 28 Oct 2019 05:58:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726411AbfJ1E6S convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Mon, 28 Oct 2019 00:58:18 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:41842 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726154AbfJ1E6S (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 28 Oct 2019 00:58:18 -0400
Received: from mail-pg1-f199.google.com ([209.85.215.199])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <kai.heng.feng@canonical.com>)
        id 1iOx6e-0003jr-Mg
        for linux-usb@vger.kernel.org; Mon, 28 Oct 2019 04:58:16 +0000
Received: by mail-pg1-f199.google.com with SMTP id m20so4123218pgc.7
        for <linux-usb@vger.kernel.org>; Sun, 27 Oct 2019 21:58:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=/EG7yq3okU4wk/5he/oQsCiGYKz5l1BrEDtNp22dINI=;
        b=DWuc/ESq1IBH802HiUsajBrOf3NmKdG0wJoE0dSQis7zgS3CDN/rRz2q6HLcO1wW/w
         crHm941wZehIlQn2AsO7J7sylmXUnw+fsItW4/Bxsc31GgU572xcWF3BpGwcxJ/BsME1
         ipMUA0YQMh6sHpDMp5HH7eUYmZ/c0T+KhE0VSGjdEVoE6xtx64t3CFWzYpeilaGRGFAQ
         aMzaGhacgUg7ciJZnvZyrYvsdsudUKpxMfzLE72E5gvJRnqcrI3/jFhaZDJWwMcghwkU
         mSyVHj/bljGEOXHdEuMT1QUHaQBwo1bdDoVLwt7XxQTMEdLrsi4ecDaSzn3fmKdwJvvj
         FfDw==
X-Gm-Message-State: APjAAAVOJUmW/EHbSvksPYE6eSjoiXUQuLDVmkWW+etfELGOawp3jmtp
        bk7J2iHVDD69KBHLZUvmrFFY9V9DN8UGpIlqgDgHRpH7hEEmc3U+5uzKPXgVqw7iLfa0W6JfV5Y
        JY2lMgdMG/PKxIyhITSYzW4LgLEw7WebVJ+Dghg==
X-Received: by 2002:a63:ce4a:: with SMTP id r10mr18037351pgi.82.1572238695343;
        Sun, 27 Oct 2019 21:58:15 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxf7cGAOrHZX6mqNmmABB2ChDH0RPOgv4rgfBLIVuao1ZEmU6jcFyL3+82tR8QvhCZM57Me2g==
X-Received: by 2002:a63:ce4a:: with SMTP id r10mr18037315pgi.82.1572238694870;
        Sun, 27 Oct 2019 21:58:14 -0700 (PDT)
Received: from 2001-b011-380f-3c42-74a9-e8b4-eac5-9609.dynamic-ip6.hinet.net (2001-b011-380f-3c42-74a9-e8b4-eac5-9609.dynamic-ip6.hinet.net. [2001:b011:380f:3c42:74a9:e8b4:eac5:9609])
        by smtp.gmail.com with ESMTPSA id w6sm9419087pfw.84.2019.10.27.21.58.12
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 27 Oct 2019 21:58:14 -0700 (PDT)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3601\))
Subject: Re: [PATCH 2/2] r8152: Add macpassthru support for ThinkPad
 Thunderbolt 3 Dock Gen 2
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <0835B3720019904CB8F7AA43166CEEB2F18EEE4D@RTITMBSVM03.realtek.com.tw>
Date:   Mon, 28 Oct 2019 12:58:11 +0800
Cc:     "davem@davemloft.net" <davem@davemloft.net>,
        "oliver@neukum.org" <oliver@neukum.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        nic_swsd <nic_swsd@realtek.com>
Content-Transfer-Encoding: 8BIT
Message-Id: <3980F066-6783-45A6-9B34-1D838C2C1A2C@canonical.com>
References: <20191025105919.689-1-kai.heng.feng@canonical.com>
 <20191025105919.689-2-kai.heng.feng@canonical.com>
 <0835B3720019904CB8F7AA43166CEEB2F18EEE4D@RTITMBSVM03.realtek.com.tw>
To:     Hayes Wang <hayeswang@realtek.com>
X-Mailer: Apple Mail (2.3601)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


> On Oct 28, 2019, at 11:58, Hayes Wang <hayeswang@realtek.com> wrote:
> 
> Kai-Heng Feng [mailto:kai.heng.feng@canonical.com]
>> Sent: Friday, October 25, 2019 6:59 PM
> [...]
>> @@ -6626,6 +6648,9 @@ static int rtl8152_probe(struct usb_interface *intf,
>> 		netdev->hw_features &= ~NETIF_F_RXCSUM;
>> 	}
>> 
>> +	if (id->driver_info & R8152_QUIRK_LENOVO_MACPASSTHRU)
> 
> Do you really need this?
> It seems the information of idVendor and idProduct is enough. 

Both idVendor and idProduct are just part of "struct usb_device_id".
IMO it's clearer to add quirks there.

> 
>> +		set_bit(LENOVO_MACPASSTHRU, &tp->flags);
>> +
>> 	if (le16_to_cpu(udev->descriptor.bcdDevice) == 0x3011 && udev->serial
>> &&
>> 	    (!strcmp(udev->serial, "000001000000") ||
>> 	     !strcmp(udev->serial, "000002000000"))) {
>> @@ -6754,6 +6779,8 @@ static const struct usb_device_id rtl8152_table[] = {
>> 	{REALTEK_USB_DEVICE(VENDOR_ID_LENOVO,  0x304f, 0)},
>> 	{REALTEK_USB_DEVICE(VENDOR_ID_LENOVO,  0x3062, 0)},
>> 	{REALTEK_USB_DEVICE(VENDOR_ID_LENOVO,  0x3069, 0)},
>> +	{REALTEK_USB_DEVICE(VENDOR_ID_LENOVO,  0x3082,
>> +			R8152_QUIRK_LENOVO_MACPASSTHRU)},
> 
> This limits the usage of driver_info. For example, I couldn't
> use it to store a pointer address anymore.

But will the driver ever use .driver_info for pointers?
There are many driver use it for quirks and quirks only.

Kai-Heng

> 
>> 	{REALTEK_USB_DEVICE(VENDOR_ID_LENOVO,  0x7205, 0)},
>> 	{REALTEK_USB_DEVICE(VENDOR_ID_LENOVO,  0x720c, 0)},
>> 	{REALTEK_USB_DEVICE(VENDOR_ID_LENOVO,  0x7214, 0)},
>> --
>> 2.17.1
> 


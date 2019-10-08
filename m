Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6416FD01E7
	for <lists+linux-usb@lfdr.de>; Tue,  8 Oct 2019 22:07:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730070AbfJHUHC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Oct 2019 16:07:02 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:54639 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729602AbfJHUHC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Oct 2019 16:07:02 -0400
Received: by mail-wm1-f68.google.com with SMTP id p7so4494067wmp.4
        for <linux-usb@vger.kernel.org>; Tue, 08 Oct 2019 13:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=+V/9F8xQhDPWl2iYJu5SyyDDe0yxxolR22lIQyOlq6s=;
        b=JhqIYzo9c55TVg+jmIYOSZU2rVmX/xSH2cDOhs1CykWoqdr+Q3n5jgLktJDyCG3Qjg
         hl7mKBpgPFcUfoak+b8Slbmdggm2yoA+FhRDos+eHrx8Zg3inR064UQQAvexZIhchGyv
         ERv4LOwzK6zz81FDMJmD2kWTr3wIiuBLEMxBDusoAxaYcIONmbSixyH3j3E89N5OvLxI
         V9e8PDLiGQOoS7bKUaK+p26Zm3vgd3CBA9LqVkHkEhkPOvOSoHJFtPH0t5g8MOLwJQwZ
         uLcMvo9lo4H9pJcOi+xYz5v4RoDGdEIErd/ow3QtithY1RqH7amWgVelIiiBYXSh5scM
         oQGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+V/9F8xQhDPWl2iYJu5SyyDDe0yxxolR22lIQyOlq6s=;
        b=Wg4FaFsUmVWyDxJN2eG861B+osztL8k6OpqEiWiCivkscNZa+wN6bCGm/AHx3+gnfX
         VP9T3qZeomZ2q/xMb/eGO65UTapfxbqT9e7nkNl3m1vPJpMoCD1VVf9/wL7XXxLnZ5HO
         GAAJXQt9Uy0q4jdnbkHR4vvnSjtjo7TBBMYt/i7H+OiT/KKY0ZedDRwUQTCFOoL7i9LA
         c+ZVPjEKa6yrjq444ItmG6Mg6LpUI3pTp9UACVj0kWKvSW+eD/07aBAVxebH2OF7JMXr
         hGGQ+60xfJ94Up1yDhaSBZwnTjW9WwjoyWPWQJ6b9D7xos5OFCvub702XZc2Q1T6eanZ
         UkRA==
X-Gm-Message-State: APjAAAVAFycCtCCPLXffIE+NAhjHB3AJIC7mfC9wtu6BLEUBX+lMggjU
        wlXVFT7wbblwgRKRk0WqbI2PwbnA
X-Google-Smtp-Source: APXvYqzyUPNUAojKYxjUZjRE1JNFHnIG+mCDYRY2V4WR5EX+a5e06fwN/uAuelH29mJZjWLVakODTg==
X-Received: by 2002:a05:600c:cd:: with SMTP id u13mr4794210wmm.37.1570565220221;
        Tue, 08 Oct 2019 13:07:00 -0700 (PDT)
Received: from ?IPv6:2003:ea:8f26:6400:1dc6:b02d:53c2:ab45? (p200300EA8F2664001DC6B02D53C2AB45.dip0.t-ipconnect.de. [2003:ea:8f26:6400:1dc6:b02d:53c2:ab45])
        by smtp.googlemail.com with ESMTPSA id h7sm20079044wrs.15.2019.10.08.13.06.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Oct 2019 13:06:59 -0700 (PDT)
Subject: Re: Unknown symbol errors in usb storage driver
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Matthias Maennich <maennich@google.com>,
        Jessica Yu <jeyu@kernel.org>,
        Linux USB Mailing List <linux-usb@vger.kernel.org>
References: <e593864c-848f-0b6d-3408-f4c619f0cde5@gmail.com>
 <20191008200527.GB3129397@kroah.com>
From:   Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <2ccd4a5e-c5ed-ce14-2e89-89d039fd82e8@gmail.com>
Date:   Tue, 8 Oct 2019 22:06:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191008200527.GB3129397@kroah.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 08.10.2019 22:05, Greg KH wrote:
> On Tue, Oct 08, 2019 at 09:53:16PM +0200, Heiner Kallweit wrote:
>> Since a while I see the following. I didn't bisect yet, maybe issue is caused by
>> 32bca2df7da2 ("usb-storage: export symbols in USB_STORAGE namespace")?
>>
>>   DEPMOD  5.4.0-rc2-next-20191008+
>> depmod: WARNING: /lib/modules/5.4.0-rc2-next-20191008+/kernel/drivers/usb/storage/ums-realtek.ko needs unknown symbol usb_stor_probe1
>> depmod: WARNING: /lib/modules/5.4.0-rc2-next-20191008+/kernel/drivers/usb/storage/ums-realtek.ko needs unknown symbol usb_stor_reset_resume
>> depmod: WARNING: /lib/modules/5.4.0-rc2-next-20191008+/kernel/drivers/usb/storage/ums-realtek.ko needs unknown symbol usb_stor_pre_reset
>> depmod: WARNING: /lib/modules/5.4.0-rc2-next-20191008+/kernel/drivers/usb/storage/ums-realtek.ko needs unknown symbol usb_stor_host_template_init
>> depmod: WARNING: /lib/modules/5.4.0-rc2-next-20191008+/kernel/drivers/usb/storage/ums-realtek.ko needs unknown symbol usb_stor_probe2
>> depmod: WARNING: /lib/modules/5.4.0-rc2-next-20191008+/kernel/drivers/usb/storage/ums-realtek.ko needs unknown symbol usb_stor_disconnect
>> depmod: WARNING: /lib/modules/5.4.0-rc2-next-20191008+/kernel/drivers/usb/storage/ums-realtek.ko needs unknown symbol usb_stor_control_msg
>> depmod: WARNING: /lib/modules/5.4.0-rc2-next-20191008+/kernel/drivers/usb/storage/ums-realtek.ko needs unknown symbol usb_stor_post_reset
>> depmod: WARNING: /lib/modules/5.4.0-rc2-next-20191008+/kernel/drivers/usb/storage/ums-realtek.ko needs unknown symbol usb_stor_bulk_transfer_buf
>>
> 
> 
> It's a depmod bug, see lkml for the discussion and potential fixes.
> People are working on it :)
> 
Good to know, thanks for the quick reply.

> thanks,
> 
> greg k-h
> 
Heiner

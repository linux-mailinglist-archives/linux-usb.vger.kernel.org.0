Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0C9E27820F
	for <lists+linux-usb@lfdr.de>; Fri, 25 Sep 2020 09:56:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727238AbgIYH4J convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Fri, 25 Sep 2020 03:56:09 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:57087 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727519AbgIYH4I (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 25 Sep 2020 03:56:08 -0400
Received: from mail-pf1-f198.google.com ([209.85.210.198])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <kai.heng.feng@canonical.com>)
        id 1kLiaM-00022w-7K
        for linux-usb@vger.kernel.org; Fri, 25 Sep 2020 07:56:06 +0000
Received: by mail-pf1-f198.google.com with SMTP id k13so1538225pfh.4
        for <linux-usb@vger.kernel.org>; Fri, 25 Sep 2020 00:56:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=8ugg/DkpzBwuYR7dhD22Q37qdrmr6sS3PgbT3G/CEuk=;
        b=rKteq93BZjjX8UjkIU4nxN9bANtcG2r4yC6MTkivle+DNQ92gNno8z1G9xY0WSyekS
         MxIsNG46H/UKcgBbgpZESL7aLX7nPOpYcgd0TPP01U0Gx9qimyqjYuSaBELAbMRMCxxQ
         RoJ1V+Y65s8AkeJvJI1jbKxXL8Gj+cjvcegVKMpLbXioo6n9wfEkpnFtdM22mR8atafp
         Yi/ioU/Oxr9bTrzmlH0h/qUWhmYClIdn9cVFQfEee1B/UkRiWnY+WXGjNm3Mh0OuTXa3
         j+EwE9rCk+iqfZtMLZ9bhTNikB9uF93HQndJy3tpLDlgTrOCr3BgXGK5LsGO5oAD1su6
         3eYQ==
X-Gm-Message-State: AOAM533lTUSDpT3Ee+mjr94a1GX6jbt0FxloyBV+FnPggy422pmagMoU
        gnasr8Im9rnoOm6E+w3qTWIjMZ/VUCg4MfZW5XRoc8qpbS9c6FKtOiLUf3GiMvRo3EyKZ/0+OCE
        f5kTFKuKJrgqW3rcnA1io/El5NONLGyc1We6yTw==
X-Received: by 2002:a17:90a:5a48:: with SMTP id m8mr1520791pji.181.1601020563775;
        Fri, 25 Sep 2020 00:56:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy7qLIybDPC6grPZEe6B+ySzbx/Wm55NTGLHpPWYC/v8XxO10A+HeUuxt+dyiXPhfzkExo01A==
X-Received: by 2002:a17:90a:5a48:: with SMTP id m8mr1520775pji.181.1601020563365;
        Fri, 25 Sep 2020 00:56:03 -0700 (PDT)
Received: from [192.168.1.208] (220-133-187-190.HINET-IP.hinet.net. [220.133.187.190])
        by smtp.gmail.com with ESMTPSA id 27sm1433719pgy.26.2020.09.25.00.56.01
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 25 Sep 2020 00:56:02 -0700 (PDT)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.1\))
Subject: Re: [PATCH] Bluetooth: btusb: Avoid unnecessary reset upon system
 resume
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <70edd6da224048488806d2af89294d3e@realsil.com.cn>
Date:   Fri, 25 Sep 2020 15:56:00 +0800
Cc:     Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        "open list:BLUETOOTH DRIVERS" <linux-bluetooth@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:USB XHCI DRIVER" <linux-usb@vger.kernel.org>
Content-Transfer-Encoding: 8BIT
Message-Id: <B7DF43CE-1BD7-4A2B-838F-2CAC914E209B@canonical.com>
References: <6b46b6bca9d3486499d0374eb277b00c@realsil.com.cn>
 <4055CF26-9A1F-42E6-A88A-3726B4532669@canonical.com>
 <70edd6da224048488806d2af89294d3e@realsil.com.cn>
To:     =?utf-8?B?6ZmG5pyx5Lyf?= <alex_lu@realsil.com.cn>
X-Mailer: Apple Mail (2.3608.120.23.2.1)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Alex,

> On Sep 25, 2020, at 15:42, 陆朱伟 <alex_lu@realsil.com.cn> wrote:
> 
> Hi Kai-Heng,
> 
>> On 25 September 2020 at 15:14, Kai-Heng Feng wrote:
>> 
>> Hi Alex,

[snipped]

>> Apparently for my case, RTL8821CE, firmware was kept without setting
>> remote wakeup.
> 
> So you got the btusb disconnect and reprobe sequence after resume, and " Bluetooth: hci0: command 0x1001 tx timeout " before firmware downloading ?

USB power wasn't lost, but it got USB warm reset because btusb driver explicitly flagged "reset_resume = 1".
Then the issue appeared as "Bluetooth: hci0: command 0x1001 tx timeout", before downloading firmware.

> 
>> Is it okay to also set remote wakeup for global suspend to retain the
>> firmware?
> 
> Yes, it's ok.

Abhishek, does setting remote wakeup during global suspend works for you?

> 
>> If firmware was retained, does USB warm reset affect BT controller in
>> anyway?
> 
> USB warm reset shouldn't affect BT controller.
> But hci device will not work after resume, because btrtl will find "unknown IC info, lmp subvert ..." and return error when hci device setup is called.
> Tips: The lmp subver in controller changes after firmware downloading. And driver will find " unknown IC info, lmp subver  ..." when setup is called with firmware retained.

This should already be fixed by "Bluetooth: btrtl: Restore old logic to assume firmware is already loaded".

Kai-Heng

> 
>> 
>> Kai-Heng
>> 
>>> 
>>>> 
>>>> Kai-Heng
>>>> 
>>>>> 
>>>>> @Alex -- What is the common behavior for Realtek controllers? Should
>>>>> we set BTUSB_WAKEUP_DISABLE only on RTL8822CE or should we unset
>> it
>>>>> only on RTL8821CE?
>>>>> 
>>>>>>> 
>>>>>>> I would prefer this doesn't get accepted in its current state.
>>>>>> 
>>>>>> Of course.
>>>>>> I think we need to find the root cause for your case before applying this
>>>> one.
>>>>>> 
>>>>>> Kai-Heng
>>>>>> 
>>>>>>> 
>>>>>>> Abhishek
>>>>>>> 
>>>>>>> On Wed, Sep 23, 2020 at 10:56 AM Kai-Heng Feng
>>>>>>> <kai.heng.feng@canonical.com> wrote:
>>>>>>>> 
>>>>>>>> Realtek bluetooth controller may fail to work after system sleep:
>>>>>>>> [ 1272.707670] Bluetooth: hci0: command 0x1001 tx timeout
>>>>>>>> [ 1280.835712] Bluetooth: hci0: RTL: HCI_OP_READ_LOCAL_VERSION
>>>> failed (-110)
>>>>>>>> 
>>>>>>>> If platform firmware doesn't cut power off during suspend, the
>>>> firmware
>>>>>>>> is considered retained in controller but the driver is still asking USB
>>>>>>>> core to perform a reset-resume. This can make bluetooth controller
>>>>>>>> unusable.
>>>>>>>> 
>>>>>>>> So avoid unnecessary reset to resolve the issue.
>>>>>>>> 
>>>>>>>> For devices that really lose power during suspend, USB core will
>> detect
>>>>>>>> and handle reset-resume correctly.
>>>>>>>> 
>>>>>>>> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
>>>>>>>> ---
>>>>>>>> drivers/bluetooth/btusb.c | 8 +++-----
>>>>>>>> 1 file changed, 3 insertions(+), 5 deletions(-)
>>>>>>>> 
>>>>>>>> diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
>>>>>>>> index 8d2608ddfd08..de86ef4388f9 100644
>>>>>>>> --- a/drivers/bluetooth/btusb.c
>>>>>>>> +++ b/drivers/bluetooth/btusb.c
>>>>>>>> @@ -4255,17 +4255,15 @@ static int btusb_suspend(struct
>>>> usb_interface *intf, pm_message_t message)
>>>>>>>>             enable_irq(data->oob_wake_irq);
>>>>>>>>     }
>>>>>>>> 
>>>>>>>> -       /* For global suspend, Realtek devices lose the loaded fw
>>>>>>>> -        * in them. But for autosuspend, firmware should remain.
>>>>>>>> -        * Actually, it depends on whether the usb host sends
>>>>>>>> +       /* For global suspend, Realtek devices lose the loaded fw in
>> them
>>>> if
>>>>>>>> +        * platform firmware cut power off. But for autosuspend,
>>>> firmware
>>>>>>>> +        * should remain.  Actually, it depends on whether the usb host
>>>> sends
>>>>>>>>      * set feature (enable wakeup) or not.
>>>>>>>>      */
>>>>>>>>     if (test_bit(BTUSB_WAKEUP_DISABLE, &data->flags)) {
>>>>>>>>             if (PMSG_IS_AUTO(message) &&
>>>>>>>>                 device_can_wakeup(&data->udev->dev))
>>>>>>>>                     data->udev->do_remote_wakeup = 1;
>>>>>>>> -               else if (!PMSG_IS_AUTO(message))
>>>>>>>> -                       data->udev->reset_resume = 1;
>>>>>>>>     }
>>>>>>>> 
>>>>>>>>     return 0;
>>>>>>>> --
>>>>>>>> 2.17.1
>>>> 
>>>> 
>>>> ------Please consider the environment before printing this e-mail.


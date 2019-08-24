Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0824F9BECB
	for <lists+linux-usb@lfdr.de>; Sat, 24 Aug 2019 18:30:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727667AbfHXQaa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 24 Aug 2019 12:30:30 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:46144 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726808AbfHXQa2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 24 Aug 2019 12:30:28 -0400
Received: from mail-pl1-f198.google.com ([209.85.214.198])
        by youngberry.canonical.com with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
        (Exim 4.76)
        (envelope-from <kai.heng.feng@canonical.com>)
        id 1i1YuA-0005Pl-3b
        for linux-usb@vger.kernel.org; Sat, 24 Aug 2019 16:28:42 +0000
Received: by mail-pl1-f198.google.com with SMTP id x1so7691097plm.9
        for <linux-usb@vger.kernel.org>; Sat, 24 Aug 2019 09:28:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=unN30PKH+ZZ8YsivpT1ei8/hAxR34oI4epIJUsWIs08=;
        b=ON0F1AuZz4qpjElZcreekQNqfLISVH0WsXO56Mm7XtCI9xgmsFQSe2Miy0xmayod5v
         JI7vAERbVOtTmnv6FgxQe9tuqtjUmNwmzmXSLc6JPNDn/TT62It16megVgwKnXJfqeGm
         lVbAGhUJCZef+65r2o1N4xJQqLqRCS7sFi0nW/u0SVYzm33DStxgUSor+DpzxT1V9qYE
         c+sJvk0ZPKDE+spXWpeVjgN6odQl8phFhT5ZRcFu+MyhVIYFLMXlWLKgAmSmR6LR8VPg
         RGmvjRplk7UK5VWtx6tm+eFduGCFZcJg1KB15mD29BUecWaN5gnYKM+2lcLHaF7dt6L1
         IG6w==
X-Gm-Message-State: APjAAAVQxliBmwnYCljFuvX07TgcJwwKpGVNdVg0p3WS+rT6Xs+J6swi
        z2XhzFvmbzvwgLIbJxfmaeGr5ewINjyyk/EfiDC+EkqmIscMy5bQEs9s2Ot+V8DdiD2NyIZxezV
        CzQ3jjlAGTYt2S0jLiAdiO5iR2Ur2eC/L/qE6nA==
X-Received: by 2002:a17:902:e30f:: with SMTP id cg15mr10839454plb.46.1566664120766;
        Sat, 24 Aug 2019 09:28:40 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxzHiwTSAeEthDTCHx43zMtuCwV8V8nm1NvgnWj8+NHoizBqfQJ4MwvPMdViJlNApGYgGtVyQ==
X-Received: by 2002:a17:902:e30f:: with SMTP id cg15mr10839445plb.46.1566664120517;
        Sat, 24 Aug 2019 09:28:40 -0700 (PDT)
Received: from 2001-b011-380f-3c42-54b0-44c4-6d25-80e5.dynamic-ip6.hinet.net (2001-b011-380f-3c42-54b0-44c4-6d25-80e5.dynamic-ip6.hinet.net. [2001:b011:380f:3c42:54b0:44c4:6d25:80e5])
        by smtp.gmail.com with ESMTPSA id p20sm5729144pgi.81.2019.08.24.09.28.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 24 Aug 2019 09:28:40 -0700 (PDT)
Content-Type: text/plain;
        charset=utf-8;
        delsp=yes;
        format=flowed
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: [PATCH] HID: quirks: Disable runtime suspend on Microsoft Corp.
 Basic Optical Mouse v2.0
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <Pine.LNX.4.44L0.1908221043080.1311-100000@iolanthe.rowland.org>
Date:   Sun, 25 Aug 2019 00:28:37 +0800
Cc:     Oliver Neukum <oneukum@suse.com>, jikos@kernel.org,
        benjamin.tissoires@redhat.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Content-Transfer-Encoding: 8bit
Message-Id: <3620A9D2-36CD-49EA-928F-F30D49F7F5DB@canonical.com>
References: <Pine.LNX.4.44L0.1908221043080.1311-100000@iolanthe.rowland.org>
To:     Alan Stern <stern@rowland.harvard.edu>
X-Mailer: Apple Mail (2.3445.104.11)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

at 22:49, Alan Stern <stern@rowland.harvard.edu> wrote:

> On Thu, 22 Aug 2019, Kai-Heng Feng wrote:
>
>> at 18:38, Oliver Neukum <oneukum@suse.com> wrote:
>>
>>> Am Donnerstag, den 22.08.2019, 18:04 +0800 schrieb Kai-Heng Feng:
>>>> Hi Oliver,
>>>>
>>>> at 17:45, Oliver Neukum <oneukum@suse.com> wrote:
>>>>
>>>>> Am Donnerstag, den 22.08.2019, 17:17 +0800 schrieb Kai-Heng Feng:
>>>>>> The optical sensor of the mouse gets turned off when it's runtime
>>>>>> suspended, so moving the mouse can't wake the mouse up, despite that
>>>>>> USB remote wakeup is successfully set.
>>>>>>
>>>>>> Introduce a new quirk to prevent the mouse from getting runtime
>>>>>> suspended.
>>>>>
>>>>> Hi,
>>>>>
>>>>> I am afraid this is a bad approach in principle. The device
>>>>> behaves according to spec.
>>>>
>>>> Can you please point out which spec it is? Is it USB 2.0 spec?
>>>
>>> Well, sort of. The USB spec merely states how to enter and exit
>>> a suspended state and that device state must not be lost.
>>> It does not tell you what a suspended device must be able to do.
>>
>> But shouldn’t remote wakeup signaling wakes the device up and let it exit
>> suspend state?
>> Or it’s okay to let the device be suspended when remote wakeup is needed
>> but broken?
>>
>>>>> And it behaves like most hardware.
>>>>
>>>> So seems like most hardware are broken.
>>>> Maybe a more appropriate solution is to disable RPM for all USB mice.
>>>
>>> That is a decision a distro certainly can make. However, the kernel
>>> does not, by default, call usb_enable_autosuspend() for HID devices
>>> for this very reason. It is enabled by default only for hubs,
>>> BT dongles and UVC cameras (and some minor devices)
>>>
>>> In other words, if on your system it is on, you need to look
>>> at udev, not the kernel.
>>
>> So if a device is broken when “power/control” is flipped by user, we  
>> should
>> deal it at userspace? That doesn’t sound right to me.
>>
>>>>> If you do not want runtime PM for such devices, do not switch
>>>>> it on.
>>>>
>>>> A device should work regardless of runtime PM status.
>>>
>>> Well, no. Runtime PM is a trade off. You lose something if you use
>>> it. If it worked just as well as full power, you would never use
>>> full power, would you?
>>
>> I am not asking the suspended state to work as full power, but to  
>> prevent a
>> device enters suspend state because of broken remote wakeup.
>>
>>> Whether the loss of functionality or performance is worth the energy
>>> savings is a policy decision. Hence it belongs into udev.
>>> Ideally the kernel would tell user space what will work in a
>>> suspended state. Unfortunately HID does not provide support for that.
>>
>> I really don’t think “loss of functionally” belongs to policy decision.  
>> But
>> that’s just my opinion.
>>
>>> This is a deficiency of user space. The kernel has an ioctl()
>>> to let user space tell it, whether a device is fully needed.
>>> X does not use them.
>>
>> Ok, I’ll take a look at other device drivers that use it.
>>
>>>>> The refcounting needs to be done correctly.
>>>>
>>>> Will do.
>>>
>>> Well, I am afraid your patch breaks it and if you do not break
>>> it, the patch is reduced to nothing.
>>
>> Maybe just calling usb_autopm_put_interface() in usbhid_close() to balance
>> the refcount?
>>
>>>>> This patch does something that udev should do and in a
>>>>> questionable manner.
>>>>
>>>> IMO if the device doesn’t support runtime suspend, then it needs to be
>>>> disabled in kernel but not workaround in userspace.
>>>
>>> You switch it on from user space. Of course the kernel default
>>> must be safe, as you said. It already is.
>>
>> I’d also like to hear maintainers' opinion on this issue.
>
> I agree with Oliver.  There is no formal requirement on what actions
> should cause a mouse to generate a remote wakeup request.  Some mice
> will do it when they are moved and some mice won't.
>
> If you don't like the way a particular mouse behaves then you should
> not allow it to go into runtime suspend.  By default, the kernel
> prevents _all_ USB mice from being runtime suspended; the only way a
> mouse can be suspended is if some userspace program tells the kernel to
> allow it.
>
> It might be a udev script which does this, or a powertop setting, or
> something else.  Regardless, what the kernel does is correct.
> Furthermore, the kernel has to accomodate users who don't mind pressing
> a mouse button to wake up their mice.  For their sake, the kernel
> should not forbid a mouse from ever going into runtime suspend merely
> because it won't generate a wakeup request when it is moved.

True, if some users don’t mind clicking mouse button before using it then  
we need to keep the current behavior.

Kai-Heng

>
> Alan Stern



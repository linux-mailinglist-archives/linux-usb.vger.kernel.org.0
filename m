Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 87FC6994E0
	for <lists+linux-usb@lfdr.de>; Thu, 22 Aug 2019 15:23:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727401AbfHVNXN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 22 Aug 2019 09:23:13 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:35964 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731211AbfHVNXK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 22 Aug 2019 09:23:10 -0400
Received: from mail-pf1-f199.google.com ([209.85.210.199])
        by youngberry.canonical.com with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
        (Exim 4.76)
        (envelope-from <kai.heng.feng@canonical.com>)
        id 1i0n3U-0007PL-7g
        for linux-usb@vger.kernel.org; Thu, 22 Aug 2019 13:23:08 +0000
Received: by mail-pf1-f199.google.com with SMTP id a20so4007704pfn.19
        for <linux-usb@vger.kernel.org>; Thu, 22 Aug 2019 06:23:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=ARl7y420+012H6FiVBnjFHFRBlY5yJV7LGxsW8IuvSI=;
        b=QxcU6sQsFgq/1NgkASsmCm97gWHk0vwAVBvvB8//fYa4K3KW0d7NUF7AfL3YvzymBr
         4XzTTnUb+D0TfjEKskerakbfRFW1+jUnZ3j3Pvhp32UMwdqw1Uz08k76Er46cYtcyaCv
         5KBGs7X1CpSQnvwF26qqYxCUb2D3aALv9BmZfjJvCNg7j0MYBH6wnl7QKwNCegGB4Gxb
         b8+YkkwZsWWGHLYKaZ0njRKQ0ixY2bpPaBEfksOGYBFAyWgZbvREkpp5/uQacchJEdb9
         t/E04dweA7BuS5+4FEDxBgcGVNlktmU96WpsXUJ5gLZZZ9ooYUdEKDGWy7fdlqxh6MQA
         q7Sg==
X-Gm-Message-State: APjAAAVJrY1bqE/ui68Kl9dVshN50RB4yb7S8JNN8hRAndEeiNuWNNh2
        06jAffZnYISX5HwpiONRFBXHuabF3ny+fjE7UdraDw/VjxAY9Qd7TtOC8Ozigz5x/ysq6HJTXsD
        SvlXeSqEPBDCFGDCktRghyAnqo5Ay9mnG06oAyA==
X-Received: by 2002:a17:902:4581:: with SMTP id n1mr9351165pld.310.1566480186626;
        Thu, 22 Aug 2019 06:23:06 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzv7ty2hhyaXcteC+Xl7ZYtHxlCbdcTFINbhX9shCZ97tvwtUYh1pq7vKZaVZxPd3Z1kjiIlw==
X-Received: by 2002:a17:902:4581:: with SMTP id n1mr9351140pld.310.1566480186342;
        Thu, 22 Aug 2019 06:23:06 -0700 (PDT)
Received: from 2001-b011-380f-3c42-a909-253e-f960-c1e8.dynamic-ip6.hinet.net (2001-b011-380f-3c42-a909-253e-f960-c1e8.dynamic-ip6.hinet.net. [2001:b011:380f:3c42:a909:253e:f960:c1e8])
        by smtp.gmail.com with ESMTPSA id c70sm36693904pfb.163.2019.08.22.06.23.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 22 Aug 2019 06:23:05 -0700 (PDT)
Content-Type: text/plain;
        charset=utf-8;
        delsp=yes;
        format=flowed
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: [PATCH] HID: quirks: Disable runtime suspend on Microsoft Corp.
 Basic Optical Mouse v2.0
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <1566470325.8347.35.camel@suse.com>
Date:   Thu, 22 Aug 2019 21:23:03 +0800
Cc:     jikos@kernel.org, benjamin.tissoires@redhat.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
Content-Transfer-Encoding: 8bit
Message-Id: <D6E31CB0-BC2B-4B52-AF18-4BE990D3FDA5@canonical.com>
References: <20190822091744.3451-1-kai.heng.feng@canonical.com>
 <1566467151.8347.23.camel@suse.com>
 <AD8A4135-0275-45B3-BEB9-031737A2C756@canonical.com>
 <1566470325.8347.35.camel@suse.com>
To:     Oliver Neukum <oneukum@suse.com>
X-Mailer: Apple Mail (2.3445.104.11)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

at 18:38, Oliver Neukum <oneukum@suse.com> wrote:

> Am Donnerstag, den 22.08.2019, 18:04 +0800 schrieb Kai-Heng Feng:
>> Hi Oliver,
>>
>> at 17:45, Oliver Neukum <oneukum@suse.com> wrote:
>>
>>> Am Donnerstag, den 22.08.2019, 17:17 +0800 schrieb Kai-Heng Feng:
>>>> The optical sensor of the mouse gets turned off when it's runtime
>>>> suspended, so moving the mouse can't wake the mouse up, despite that
>>>> USB remote wakeup is successfully set.
>>>>
>>>> Introduce a new quirk to prevent the mouse from getting runtime
>>>> suspended.
>>>
>>> Hi,
>>>
>>> I am afraid this is a bad approach in principle. The device
>>> behaves according to spec.
>>
>> Can you please point out which spec it is? Is it USB 2.0 spec?
>
> Well, sort of. The USB spec merely states how to enter and exit
> a suspended state and that device state must not be lost.
> It does not tell you what a suspended device must be able to do.

But shouldn’t remote wakeup signaling wakes the device up and let it exit  
suspend state?
Or it’s okay to let the device be suspended when remote wakeup is needed  
but broken?

>
>>> And it behaves like most hardware.
>>
>> So seems like most hardware are broken.
>> Maybe a more appropriate solution is to disable RPM for all USB mice.
>
> That is a decision a distro certainly can make. However, the kernel
> does not, by default, call usb_enable_autosuspend() for HID devices
> for this very reason. It is enabled by default only for hubs,
> BT dongles and UVC cameras (and some minor devices)
>
> In other words, if on your system it is on, you need to look
> at udev, not the kernel.

So if a device is broken when “power/control” is flipped by user, we should  
deal it at userspace? That doesn’t sound right to me.

>
>>> If you do not want runtime PM for such devices, do not switch
>>> it on.
>>
>> A device should work regardless of runtime PM status.
>
> Well, no. Runtime PM is a trade off. You lose something if you use
> it. If it worked just as well as full power, you would never use
> full power, would you?

I am not asking the suspended state to work as full power, but to prevent a  
device enters suspend state because of broken remote wakeup.

>
> Whether the loss of functionality or performance is worth the energy
> savings is a policy decision. Hence it belongs into udev.
> Ideally the kernel would tell user space what will work in a
> suspended state. Unfortunately HID does not provide support for that.

I really don’t think “loss of functionally” belongs to policy decision. But  
that’s just my opinion.

>
> This is a deficiency of user space. The kernel has an ioctl()
> to let user space tell it, whether a device is fully needed.
> X does not use them.

Ok, I’ll take a look at other device drivers that use it.

>
>>> The refcounting needs to be done correctly.
>>
>> Will do.
>
> Well, I am afraid your patch breaks it and if you do not break
> it, the patch is reduced to nothing.

Maybe just calling usb_autopm_put_interface() in usbhid_close() to balance  
the refcount?

>
>>> This patch does something that udev should do and in a
>>> questionable manner.
>>
>> IMO if the device doesn’t support runtime suspend, then it needs to be
>> disabled in kernel but not workaround in userspace.
>
> You switch it on from user space. Of course the kernel default
> must be safe, as you said. It already is.

I’d also like to hear maintainers' opinion on this issue.

Kai-Heng

>
> 	Regards
> 		Oliver



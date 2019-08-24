Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D5CA9BEC0
	for <lists+linux-usb@lfdr.de>; Sat, 24 Aug 2019 18:24:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727628AbfHXQYJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 24 Aug 2019 12:24:09 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:46082 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726343AbfHXQYJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 24 Aug 2019 12:24:09 -0400
Received: from mail-pf1-f200.google.com ([209.85.210.200])
        by youngberry.canonical.com with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
        (Exim 4.76)
        (envelope-from <kai.heng.feng@canonical.com>)
        id 1i1Yob-00058i-1x
        for linux-usb@vger.kernel.org; Sat, 24 Aug 2019 16:22:57 +0000
Received: by mail-pf1-f200.google.com with SMTP id 191so2641014pfz.8
        for <linux-usb@vger.kernel.org>; Sat, 24 Aug 2019 09:22:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=5KUerDlSmB77Lo12oQ8r4Q4eH+L8kNrW2/kTpeARao4=;
        b=Nf3PyPM3/3SCZicC1p4MN9OKzeeLTUaY1EEHddoyyZBUjNMajrLJXCtIeMdsQ0D/Z+
         88ElMJ3W6LQs1oizLusLU4WQ0/rrT31HBnSyH2nwjjizNc+0xxBzw/mTIep+hAsK70zF
         sr5WvXfmne5OuMjwhfWUV+jrOmhfJ+P1udxzt6uNjwfiZ+WyDKfp+MKZLO0suGxERniq
         BcVDsusUVn1uQ5RBet7QId+1mswtrTwzD+c2NrdabRfpJY8jS6Jf9PH7Y7WjsRIWqkS1
         FW+q3zi8IN+Zi69/wmc/kmNloLW3vUPFvquBfG6AS2jfXOGanLv2YjywgY+1HbDHsR8H
         knng==
X-Gm-Message-State: APjAAAVnVvGa4y8QRTjFXx/Eer9BYJH0QEZs/SMdACg6xQfnGAKT+AaE
        qsOTIwejRIv9UgIyFaWrJFVxmnJ2OACGh+HJerDlWNsDWm8kWqy4jiRD3KjSZ6rWex2W3IEku/i
        9eiq6fWZPsXzmcFDipnsVG1AJjTaC/bRM03ss+Q==
X-Received: by 2002:a17:902:1024:: with SMTP id b33mr9858065pla.325.1566663775427;
        Sat, 24 Aug 2019 09:22:55 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxmg8gFJdWJtcToHyLrlyWnul3s1B2nKRoi4wilC9bUOgNMwGIwzjgfqh45xtiOOXF1F2sfhg==
X-Received: by 2002:a17:902:1024:: with SMTP id b33mr9858041pla.325.1566663775217;
        Sat, 24 Aug 2019 09:22:55 -0700 (PDT)
Received: from 2001-b011-380f-3c42-54b0-44c4-6d25-80e5.dynamic-ip6.hinet.net (2001-b011-380f-3c42-54b0-44c4-6d25-80e5.dynamic-ip6.hinet.net. [2001:b011:380f:3c42:54b0:44c4:6d25:80e5])
        by smtp.gmail.com with ESMTPSA id g19sm7073182pfh.27.2019.08.24.09.22.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 24 Aug 2019 09:22:54 -0700 (PDT)
Content-Type: text/plain;
        charset=utf-8;
        delsp=yes;
        format=flowed
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: [PATCH] HID: quirks: Disable runtime suspend on Microsoft Corp.
 Basic Optical Mouse v2.0
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <1566481032.8347.44.camel@suse.com>
Date:   Sun, 25 Aug 2019 00:22:51 +0800
Cc:     jikos@kernel.org, benjamin.tissoires@redhat.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
Content-Transfer-Encoding: 8bit
Message-Id: <E1CAAA78-D4F1-4EA4-8ED2-5B17839BB8D2@canonical.com>
References: <20190822091744.3451-1-kai.heng.feng@canonical.com>
 <1566467151.8347.23.camel@suse.com>
 <AD8A4135-0275-45B3-BEB9-031737A2C756@canonical.com>
 <1566470325.8347.35.camel@suse.com>
 <D6E31CB0-BC2B-4B52-AF18-4BE990D3FDA5@canonical.com>
 <1566481032.8347.44.camel@suse.com>
To:     Oliver Neukum <oneukum@suse.com>
X-Mailer: Apple Mail (2.3445.104.11)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

at 21:37, Oliver Neukum <oneukum@suse.com> wrote:

> Am Donnerstag, den 22.08.2019, 21:23 +0800 schrieb Kai-Heng Feng:
>> at 18:38, Oliver Neukum <oneukum@suse.com> wrote:
>>> Well, sort of. The USB spec merely states how to enter and exit
>>> a suspended state and that device state must not be lost.
>>> It does not tell you what a suspended device must be able to do.
>>
>> But shouldn’t remote wakeup signaling wakes the device up and let it exit
>> suspend state?
>
> Yes. Have you tested using a button? If they indeed do not work, then
> the device lies about supporting remote wakeup. That would warrant a
> quirk, but for remote wakeup.

Button click can wake the mouse up but not movement.

>
>> Or it’s okay to let the device be suspended when remote wakeup is needed
>> but broken?
>
> Again, the HID spec does not specify what should trigger a remote
> wakeup. Limiting this to mouse buttons but not movements is
> inconvinient, but not buggy.

Ok, I still find the behavior really surprising.

>
> This is indeed what Windows does. The device is suspended when the
> screen saver switches on. That we do not do that is a deficiency
> of X.
> To use runtime PM regularly you need an .ini file

Thanks for the explanation. I guess we can mimic the behavior in systemd or  
upower.

>
>
>>> In other words, if on your system it is on, you need to look
>>> at udev, not the kernel.
>>
>> So if a device is broken when “power/control” is flipped by user, we  
>> should
>> deal it at userspace? That doesn’t sound right to me.
>
> If it is broken, as in crashing we could talk about it. If it merely
> does not do what you want, then, yes, that is for user space to deal
> with.

Ok, I’ll take a look at userspace then.

>
>>> Well, no. Runtime PM is a trade off. You lose something if you use
>>> it. If it worked just as well as full power, you would never use
>>> full power, would you?
>>
>> I am not asking the suspended state to work as full power, but to  
>> prevent a
>> device enters suspend state because of broken remote wakeup.
>
> What then would be the difference between suspended and active? A small
> delay in data transfer?

Non-operational but with wakeup capability and vise versa.

>
>>> Whether the loss of functionality or performance is worth the energy
>>> savings is a policy decision. Hence it belongs into udev.
>>> Ideally the kernel would tell user space what will work in a
>>> suspended state. Unfortunately HID does not provide support for that.
>>
>> I really don’t think “loss of functionally” belongs to policy decision.  
>> But
>> that’s just my opinion.
>
> That is just what we do if, for example, you choose between the configs
> of a USB device or when you use authorization.
>
>> Maybe just calling usb_autopm_put_interface() in usbhid_close() to balance
>> the refcount?
>
> No, the refcount is good. If remote wakeup is totally broken, you need
> to introduce a quirk that will prevent the kernel from believing the
> device when it claims to support it.

Ok. I’ll see if it’s possible to mimic other OS under current Linux Desktop.

Kai-Heng

>
> 	Regards
> 		Oliver



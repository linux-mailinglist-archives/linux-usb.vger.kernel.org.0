Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5C33619E7AC
	for <lists+linux-usb@lfdr.de>; Sat,  4 Apr 2020 23:05:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726396AbgDDVFy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 4 Apr 2020 17:05:54 -0400
Received: from mail-oi1-f178.google.com ([209.85.167.178]:43401 "EHLO
        mail-oi1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726388AbgDDVFx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 4 Apr 2020 17:05:53 -0400
Received: by mail-oi1-f178.google.com with SMTP id k5so9544765oiw.10
        for <linux-usb@vger.kernel.org>; Sat, 04 Apr 2020 14:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=v2CXSpJoadCQ6dRHwm+fqdNgulGXSGavH5jMpSzEFok=;
        b=km7qdvU+OLOF6JfXzO5yT2M8PGVfH/VN31O1j8roraZTxPYwQ0zU9XbpHXaDdQWdx7
         Wc4HusvI9NTCjyuCrvIzWaBl0JsPU+boWSWgKtfm79E1T28+w782DMXHS/zpFkPeJYDj
         OAlrS3KqUkK0c+WNMPJomC+iRqCUbZ/E8FZIZJsvTDG2fVsPvm3/aeVV9D1DHrBsIBFc
         RoL3RpMHxzpexirwZ/aKIJlniV+Racb2/X2WrA6tnFtgRthQ2QOVGLAwTayyKfyw4jot
         JzRrOqIe5ceOPNLDDc+tz6saUv82DIwhe1sqqJHATZj0t6R1DIROlkMHV+jgzYz5s16Z
         oyVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=v2CXSpJoadCQ6dRHwm+fqdNgulGXSGavH5jMpSzEFok=;
        b=qjltgl138aBgnL3gWP9EgNYqY4qgDbIAvOwnbdQiAw0nMPkDEt5COwsM8bHt/zP8K6
         4H1QYRJclUe4CpavV6pp1hDXqWOCFbs6p7xc2Gba10dpBizUY1MOohMDS30gdkdgZ+9E
         linIIYaU1b/fwzHCIRW1ri4Vxo6MbpvZx9zBWqC6nvGiSyzdkiBCYUaM/aJREIJLmwga
         uk3c+3EEbDOUJcmf/LREhBxuorjPXyL7Olq8HgFJAnot4YA2IMYDRt4wfeE35surJHNP
         EHJt9MLcn/vtW0tHTVjguDdzhS2gRLohwpUKunWQ7P3JjLMA14oWUry+sFy1WconS0gf
         JzXg==
X-Gm-Message-State: AGi0PuYktb08s/uDhvIm82ZSVlIqk86BxhdHceTI/Mm7EuV2NkMoSccE
        tVhSN8VEiPcweB5Deyu+f0xSvV23BkI03U0fmZ/nPI4s
X-Google-Smtp-Source: APiQypILfBdPZ+s8uaj6hAz475I61hz5HRPIKdUK+rI779E2aIThoSKqFb0oH+9s4/mVsgwCW9hzDh3b5ZanztQrLeA=
X-Received: by 2002:aca:5403:: with SMTP id i3mr8026334oib.174.1586034352811;
 Sat, 04 Apr 2020 14:05:52 -0700 (PDT)
MIME-Version: 1.0
References: <CAPXXXSDVGeEK_NCSkDMwTpuvVxYkWGdQk=L=bz+RN4XLiGZmcg@mail.gmail.com>
 <CAPXXXSBYcU1QamovmP-gVTXms67Xi_QpMCV=V3570q1nnuWqNw@mail.gmail.com>
In-Reply-To: <CAPXXXSBYcU1QamovmP-gVTXms67Xi_QpMCV=V3570q1nnuWqNw@mail.gmail.com>
From:   Ruslan Bilovol <ruslan.bilovol@gmail.com>
Date:   Sun, 5 Apr 2020 00:05:41 +0300
Message-ID: <CAB=otbS1RTnn9PixJYjsW4U_37GcFvR-O3WZ-7YnamdcDGKvRA@mail.gmail.com>
Subject: Re:
To:     Colin Williams <colin.williams.seattle@gmail.com>,
        Linux USB <linux-usb@vger.kernel.org>,
        alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

Please also add to CC related mailing lists (alsa-devel, linux-usb) rather
then directly emailing - community may also help with the issue. Also it can be
googled so if somebody else have same issue it can find answers faster.

On Fri, Apr 3, 2020 at 10:56 AM Colin Williams
<colin.williams.seattle@gmail.com> wrote:
>
> https://ubuntuforums.org/showthread.php?t=2439897
>
> On Thu, Apr 2, 2020 at 4:50 PM Colin Williams <colin.williams.seattle@gmail.com> wrote:
>>
>> Hello,
>>
>> Is it possible that one of these commits or related broke support for the Blue Mic Yeti?
>>
>> https://github.com/torvalds/linux/blame/ac438771ccb4479528594c7e19f2c39cf1814a86/sound/usb/stream.c#L816

Tha'ts workaround to ignore last altsetting which is the same as previous.
During UAC3 implementation, I reimplemented that workaround carefully,
but I didn't have (and still do not own) any Blue Mic USB device.
I don't know whether it was tested after that by anyone.

>>
>> I am getting the following when I plug my mic in:

Which kernel version is that? Have you tried latest Linux Kernel?

>>
>> [ 1283.848740] usb 1-1.2: new full-speed USB device number 82 using ehci-pci
>> [ 1283.964802] usb 1-1.2: New USB device found, idVendor=b58e, idProduct=9e84, bcdDevice= 1.00
>> [ 1283.964808] usb 1-1.2: New USB device strings: Mfr=1, Product=2, SerialNumber=0
>> [ 1283.964810] usb 1-1.2: Product: Yeti Stereo Microphone
>> [ 1283.964812] usb 1-1.2: Manufacturer: Blue Microphones
>> [ 1284.080671] usb 1-1.3: new low-speed USB device number 83 using ehci-pci
>> [ 1284.784678] usb 1-1.3: device descriptor read/64, error -32
>> [ 1285.180674] usb 1-1.3: device descriptor read/64, error -32
>> [ 1285.992682] usb 1-1.3: new low-speed USB device number 84 using ehci-pci
>> [ 1286.696672] usb 1-1.3: device descriptor read/64, error -32
>> [ 1287.092695] usb 1-1.3: device descriptor read/64, error -32
>> [ 1287.200804] usb 1-1-port3: attempt power cycle
>> [ 1287.804662] usb 1-1.3: new low-speed USB device number 85 using ehci-pci
>> [ 1288.220686] usb 1-1.3: device not accepting address 85, error -32
>> [ 1288.508685] usb 1-1.3: new low-speed USB device number 86 using ehci-pci
>> [ 1288.924690] usb 1-1.3: device not accepting address 86, error -32
>> [ 1288.924916] usb 1-1-port3: unable to enumerate USB device
>> [ 1288.925391] usb 1-1.2: USB disconnect, device number 82
>> [ 1289.308736] usb 1-1.3: new low-speed USB device number 87 using ehci-pci
>> [ 1289.596727] usb 1-1.3: device descriptor read/64, error -32
>> [ 1289.992635] usb 1-1.3: device descriptor read/64, error -32
>> [ 1290.596683] usb 1-1.3: new low-speed USB device number 88 using ehci-pci
>> [ 1290.888718] usb 1-1.3: device descriptor read/64, error -32
>> [ 1291.284673] usb 1-1.3: device descriptor read/64, error -32
>> [ 1291.392928] usb 1-1-port3: attempt power cycle

Looking at this log, it seems the issue happens during enumeration,
so mentioned workaround isn't executed yet at this moment.
So it seems this is related to USB core, not to ALSA driver.

Thanks,
Ruslan

>>
>> Furthermore, there is some evidence this is happening to other users:
>>
>> https://askubuntu.com/questions/1027188/external-yeti-michrophone-not-detected-on-ubuntu-18-04
>>
>> Best Regards,
>>
>> Colin Williams
>>
>>

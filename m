Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C117104A8F
	for <lists+linux-usb@lfdr.de>; Thu, 21 Nov 2019 07:06:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726132AbfKUGGr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 21 Nov 2019 01:06:47 -0500
Received: from mail-il1-f173.google.com ([209.85.166.173]:35249 "EHLO
        mail-il1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725842AbfKUGGq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 21 Nov 2019 01:06:46 -0500
Received: by mail-il1-f173.google.com with SMTP id z12so2156585ilp.2
        for <linux-usb@vger.kernel.org>; Wed, 20 Nov 2019 22:06:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=oAPBx8oH/iBE9ErV5s+VbpVRzs6d82Lc30C8eG4ZKio=;
        b=jCgFKoHy7YN2fLe/hm+0WU1bxJ4h9my/zQUVvd7xO80ZVZbfjeyxrnmzkNdfe8zAQp
         NwKnrhdiFL0/yOMEyhVhbULKFCL6WcxdVQDc/5yylmXyAHVY2uodPOY23tTREYCXOqz1
         XOHo9qS3hShqY8KGkZJ6r6g1Ag9KDJaP9Kag6GyFMLlopT7sIZvJS3o8A+ZnsuO4V28L
         Zw1Hmv+PJQPJFo/dIgsrGbrRThQ0qrvDRJAofYy414Jc7kNy10E+k3M6Uvvj9U2b/w4i
         m2XG+UqN36U6SvRRb98HPCYVit4OVqx66NARqzi3yq3sZqN8fjYfqELjAf1wMSm+NPHp
         EaDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=oAPBx8oH/iBE9ErV5s+VbpVRzs6d82Lc30C8eG4ZKio=;
        b=QncJEPUVQI09P7ZxEwpPobj2nAprWlsRKF8lSjyixLuPsNqHlZvKDYhlyc2dwDhi/Z
         pW3GdwtIowc6z7d0kMwxwOfAQ3E+Ro1NTpDvlFdysAgUahOKv4ALXXcPyXaEUm1/jGpI
         0/XZqhns9wfBw6qDY6qEo/NXbgZXJFbXYxADPT0IePTy0Nn271Sy8iIbDmVHY80lwYii
         sJP1JWIws0Nw5phSblWZvA/2qo8xyySVYVIi4lZ4iV00fSekaThNBTZuiTKSKjlf+wTv
         VrbgGVD2KC3dD9GnOASvS06fEKP6xEj8g8MO0kVuIh34VD1fy6SxlHe8AY3z7SttuEk7
         4eWA==
X-Gm-Message-State: APjAAAXgLfjNewFfD2p4EfH8sYt5HzubaZ6YhCifLgLTdVTIPFSg+pVM
        fDH1R+umj+NY6PBqt2Sc0hhfTOxPg+ixo+wlvQg=
X-Google-Smtp-Source: APXvYqzDcs2R0P0rKU74F9+Sth05GtgcDtcU8nvUI+vA6HWr7zF3fTT2+1SXWTTjCBmynldb5gCd/q36WNd6cZl37TQ=
X-Received: by 2002:a92:d849:: with SMTP id h9mr8573075ilq.301.1574316405852;
 Wed, 20 Nov 2019 22:06:45 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:ac0:f24e:0:0:0:0:0 with HTTP; Wed, 20 Nov 2019 22:06:45
 -0800 (PST)
In-Reply-To: <20191121030842.GA7503@b29397-desktop>
References: <CAA=hcWRrES4cpXvqBtD8-pyrUwz-BR03c-hSG-Xr4dei3AQi_w@mail.gmail.com>
 <20191120133152.GB2892197@kroah.com> <CAA=hcWQaXPWWAv2c9ZuVnPw-g075SC1tyKy0DP2+WrktdQYymg@mail.gmail.com>
 <20191121030842.GA7503@b29397-desktop>
From:   JH <jupiter.hce@gmail.com>
Date:   Thu, 21 Nov 2019 17:06:45 +1100
Message-ID: <CAA=hcWRXo-iByT3ZiKmQEnu-tssoKfEpgEVhn=i=Hyc7u1DHTg@mail.gmail.com>
Subject: Re: kernel: Alignment trap
To:     Peter Chen <peter.chen@nxp.com>
Cc:     Greg KH <greg@kroah.com>, linux-usb <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Peter,

On 11/21/19, Peter Chen <peter.chen@nxp.com> wrote:
> On 19-11-21 07:08:32, JH wrote:
>> Hi Greg,
>>
>> On 11/21/19, Greg KH <greg@kroah.com> wrote:
>> > On Wed, Nov 20, 2019 at 09:28:14PM +1100, JH wrote:
>> >> Hi,
>> >>
>> >> I am running 4G LTE (USB protocol) and WiFi on IMX6 board, the kernel
>> >> is 4.19.75 LTE. It is not clear where the kernel alignment trap came
>> >> from, the only thing I could see is the alignment trap message
>> >> generated immediate after USB GSM communication or mwifiex_sdio. Where
>> >> that the alignment trap came from? Which parts of the program could
>> >> contribute the kernel alignment trap, kernel iteself, or USB GSM or
>> >> mwifiex_sdio? Appreciate clues how to fix it.
>> >>
>> >> Nov 20 05:08:09 solar kernel: usb 1-1: GSM modem (1-port) converter
>> >> now attached to ttyUSB0
>> >> Nov 20 05:08:09 solar kernel: option 1-1:1.2: GSM modem (1-port)
>> >> converter detected
>> >> Nov 20 05:08:09 solar kernel: usb 1-1: GSM modem (1-port) converter
>> >> now attached to ttyUSB1
>> >> Nov 20 05:08:10 solar kernel: mwifiex_sdio mmc0:0001:1: info: trying
>> >> to associate to 'Solar Analytics Wifi' bssid 78:8a:20:49:4b:c5
>> >> Nov 20 05:08:10 solar kernel: mwifiex_sdio mmc0:0001:1: info:
>> >> associated to bssid 78:8a:20:49:4b:c5 successfully
>> >> Nov 20 05:08:10 solar kernel: IPv6: ADDRCONF(NETDEV_CHANGE): mlan0:
>> >> link becomes ready
>> >> Nov 20 05:23:13 solar kernel: mwifiex_sdio mmc0:0001:1: info:
>> >> successfully disconnected from 78:8a:20:49:4b:c5: reason code 3
>> >> Nov 20 05:23:13 solar kernel: IPv6: ADDRCONF(NETDEV_UP): mlan0: link
>> >> is not ready
>> >> Nov 20 05:23:18 solar kernel: Alignment trap: not handling instruction
>> >> e8532f00 at [<b6c802b6>]
>> >> Nov 20 05:23:18 solar kernel: Unhandled fault: alignment exception
>> >> (0x001) at 0x38626667
>> >> Nov 20 05:23:18 solar kernel: pgd = 34bdb7e7
>> >> Nov 20 05:23:18 solar kernel: [38626667] *pgd=00000000
>> >
>> > You should have a much longer tracedump after this, right?  Can you
>> > provide that please?
>>
>> That was the last statement from the kernel log journalctl -t kernel
>> -b at the time.
>>
>> > And why do you think this was a USB issue?
>>
>> No, I was not saying it was a USB issue, nor did I know if it is a
>> kernel issue or mwifiex_sdio issue or something else, I don't have the
>> knowledge to determine it, that was why I have to go this list for
>> help, I did try to connect to Linux network mailing list linux-net or
>> kernel mailing list lkml, but I must get wrong with the mailing list
>> address, I could not get response or subscription frin linux-net or
>> lkml, if you could let me know the correct kernel network mailing
>> address and kernel mailing list address, I'll ask the help there as
>> well.
>>
>
> Do you have correct firmware has loaded for your device?

Not clear what the firmware you were talking about? I used open source
linux-firmware-sd8887, uBlox SARA-R4 and uBlox EMMY on IMX6. Let's say
we have been running this device for about 7 months, we used Kernel
5.1.0 before, I could not recall any error about the alignment trap in
kernel. We now moved to kernel 4.19.75 LTS, that is what it occurred
often, that worries me.

> Do you have issues if building these two modules in kernel?

No. I built the kernel and image from Yocto, there were no building issues.

Thank you Peter.

- jh

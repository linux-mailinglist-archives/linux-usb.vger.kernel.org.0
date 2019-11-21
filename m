Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E1B5105012
	for <lists+linux-usb@lfdr.de>; Thu, 21 Nov 2019 11:09:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726293AbfKUKJ2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 21 Nov 2019 05:09:28 -0500
Received: from mail-il1-f194.google.com ([209.85.166.194]:36547 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726132AbfKUKJ1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 21 Nov 2019 05:09:27 -0500
Received: by mail-il1-f194.google.com with SMTP id s75so2726256ilc.3
        for <linux-usb@vger.kernel.org>; Thu, 21 Nov 2019 02:09:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=DjNFjPaoz6f2lsXkHzW0cw3E5jXgFERJuT2BB22zEcY=;
        b=c0Lq8Fd5MBzDMp/xUJ6m19zpVzPB8BxSJ5zWU8tdEOFzr5tBFQWx6N+dxUYxfwMdiB
         tEkaNHQqeDSsQoRN3IVnHT7YNdVKO3co3Ro3IUoBLQvUqJROCXVlQao5LytiZ+1ev3NG
         CzZ73gFi3qB3M+v+wFl8bDlYZvBJ0QEmdfE8kzoAqb5IdSnq8eWssc5te+rcvl8bkOIW
         4XPgl07Dp5s1LIKFj2zVBhTrOUprSUdJQU6rFVBIvv7UwXT0UvddMPIwJIbqIUlVFE5E
         tkUfsNUAxoWcMUo1VNCK0B59kIV5wZ3SKTyP6ZCssK2m+ale438xKQ7CycCiqDSTS7ty
         xNyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=DjNFjPaoz6f2lsXkHzW0cw3E5jXgFERJuT2BB22zEcY=;
        b=c4KQv0EYgt5J0dHczXN0PKX+VqOs5sRls9v9XtPTOwuTI7Z+Bs2LfPrsSClItk5R0d
         DQEFRpM2G0+xBmLmlLNEyfoYWQEZA1uXJDC8AIz02hrvy+edyddsP76c5mUEr3Zmvp2G
         ev/VlkpyxfC5X7HPD5/LQQl5kFZqYWf2aD6RBMe2k5zLwHkvbY1JX1dSwqbV54plmqPo
         hOYFkVXOzFUT4PGXJpyvUs/gpkbAyrHklmLufvKU5NO9quw/IIeetpV35GSFOe9+BlZI
         zK6+A2KfKXkQIou1SOiuqdhiy2hRl1DGrmie26LtRxgqmOy6345Rq+MTiT4hj9gG5BLx
         Dt7g==
X-Gm-Message-State: APjAAAXyKvX9jA+1y+FLPelpRKHNK45uYtViP6IJdjHEJPph9xPeWZZI
        AqdjJMzLWa04LfDbNC4lOaog3CL9vDRDe/KddRHvaScxWDw=
X-Google-Smtp-Source: APXvYqwbh0LAZSCmctAUwixHKdj6kUUSyRkrVhMx5qCZ6ZIoIANATRk3AKO6xdD2RLvybtYHkXPMpIN4MfEGbffyNkk=
X-Received: by 2002:a05:6e02:8e7:: with SMTP id n7mr9091183ilt.302.1574330966995;
 Thu, 21 Nov 2019 02:09:26 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:ac0:f24e:0:0:0:0:0 with HTTP; Thu, 21 Nov 2019 02:09:26
 -0800 (PST)
In-Reply-To: <20191121064012.GA340116@kroah.com>
References: <CAA=hcWRrES4cpXvqBtD8-pyrUwz-BR03c-hSG-Xr4dei3AQi_w@mail.gmail.com>
 <20191120133152.GB2892197@kroah.com> <CAA=hcWQaXPWWAv2c9ZuVnPw-g075SC1tyKy0DP2+WrktdQYymg@mail.gmail.com>
 <20191121030842.GA7503@b29397-desktop> <CAA=hcWRXo-iByT3ZiKmQEnu-tssoKfEpgEVhn=i=Hyc7u1DHTg@mail.gmail.com>
 <20191121064012.GA340116@kroah.com>
From:   JH <jupiter.hce@gmail.com>
Date:   Thu, 21 Nov 2019 21:09:26 +1100
Message-ID: <CAA=hcWTeNreAfrH3+5tBj0pvc9qX7=1sYrcn5CxdckHj7WTd1g@mail.gmail.com>
Subject: Re: kernel: Alignment trap
To:     Greg KH <greg@kroah.com>
Cc:     Peter Chen <peter.chen@nxp.com>,
        linux-usb <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

On 11/21/19, Greg KH <greg@kroah.com> wrote:
> On Thu, Nov 21, 2019 at 05:06:45PM +1100, JH wrote:
>> Hi Peter,
>>
>> On 11/21/19, Peter Chen <peter.chen@nxp.com> wrote:
>> > On 19-11-21 07:08:32, JH wrote:
>> >> Hi Greg,
>> >>
>> >> On 11/21/19, Greg KH <greg@kroah.com> wrote:
>> >> > On Wed, Nov 20, 2019 at 09:28:14PM +1100, JH wrote:
>> >> >> Hi,
>> >> >>
>> >> >> I am running 4G LTE (USB protocol) and WiFi on IMX6 board, the
>> >> >> kernel
>> >> >> is 4.19.75 LTE. It is not clear where the kernel alignment trap
>> >> >> came
>> >> >> from, the only thing I could see is the alignment trap message
>> >> >> generated immediate after USB GSM communication or mwifiex_sdio.
>> >> >> Where
>> >> >> that the alignment trap came from? Which parts of the program could
>> >> >> contribute the kernel alignment trap, kernel iteself, or USB GSM or
>> >> >> mwifiex_sdio? Appreciate clues how to fix it.
>> >> >>
>> >> >> Nov 20 05:08:09 solar kernel: usb 1-1: GSM modem (1-port) converter
>> >> >> now attached to ttyUSB0
>> >> >> Nov 20 05:08:09 solar kernel: option 1-1:1.2: GSM modem (1-port)
>> >> >> converter detected
>> >> >> Nov 20 05:08:09 solar kernel: usb 1-1: GSM modem (1-port) converter
>> >> >> now attached to ttyUSB1
>> >> >> Nov 20 05:08:10 solar kernel: mwifiex_sdio mmc0:0001:1: info:
>> >> >> trying
>> >> >> to associate to 'Solar Analytics Wifi' bssid 78:8a:20:49:4b:c5
>> >> >> Nov 20 05:08:10 solar kernel: mwifiex_sdio mmc0:0001:1: info:
>> >> >> associated to bssid 78:8a:20:49:4b:c5 successfully
>> >> >> Nov 20 05:08:10 solar kernel: IPv6: ADDRCONF(NETDEV_CHANGE): mlan0:
>> >> >> link becomes ready
>> >> >> Nov 20 05:23:13 solar kernel: mwifiex_sdio mmc0:0001:1: info:
>> >> >> successfully disconnected from 78:8a:20:49:4b:c5: reason code 3
>> >> >> Nov 20 05:23:13 solar kernel: IPv6: ADDRCONF(NETDEV_UP): mlan0:
>> >> >> link
>> >> >> is not ready
>> >> >> Nov 20 05:23:18 solar kernel: Alignment trap: not handling
>> >> >> instruction
>> >> >> e8532f00 at [<b6c802b6>]
>> >> >> Nov 20 05:23:18 solar kernel: Unhandled fault: alignment exception
>> >> >> (0x001) at 0x38626667
>> >> >> Nov 20 05:23:18 solar kernel: pgd = 34bdb7e7
>> >> >> Nov 20 05:23:18 solar kernel: [38626667] *pgd=00000000
>> >> >
>> >> > You should have a much longer tracedump after this, right?  Can you
>> >> > provide that please?
>> >>
>> >> That was the last statement from the kernel log journalctl -t kernel
>> >> -b at the time.
>> >>
>> >> > And why do you think this was a USB issue?
>> >>
>> >> No, I was not saying it was a USB issue, nor did I know if it is a
>> >> kernel issue or mwifiex_sdio issue or something else, I don't have the
>> >> knowledge to determine it, that was why I have to go this list for
>> >> help, I did try to connect to Linux network mailing list linux-net or
>> >> kernel mailing list lkml, but I must get wrong with the mailing list
>> >> address, I could not get response or subscription frin linux-net or
>> >> lkml, if you could let me know the correct kernel network mailing
>> >> address and kernel mailing list address, I'll ask the help there as
>> >> well.
>> >>
>> >
>> > Do you have correct firmware has loaded for your device?
>>
>> Not clear what the firmware you were talking about? I used open source
>> linux-firmware-sd8887, uBlox SARA-R4 and uBlox EMMY on IMX6. Let's say
>> we have been running this device for about 7 months, we used Kernel
>> 5.1.0 before, I could not recall any error about the alignment trap in
>> kernel. We now moved to kernel 4.19.75 LTS, that is what it occurred
>> often, that worries me.
>
> Why did you move to an older kernel?  If it all works on a newer one,
> please stick with that, or use 'git bisect' to find the commit that
> breaks things.

My CTO wanted LTS and could not wait for 5.4, I did forward your blog
Linux Kernel Release Model for my CTO to read it, if it is caused by
kernel 4.19, I'll talk to the CTO again.

Thank you.

- jh

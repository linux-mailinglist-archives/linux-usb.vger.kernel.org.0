Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DFC0A1044C6
	for <lists+linux-usb@lfdr.de>; Wed, 20 Nov 2019 21:08:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727303AbfKTUIe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 20 Nov 2019 15:08:34 -0500
Received: from mail-il1-f181.google.com ([209.85.166.181]:46014 "EHLO
        mail-il1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726270AbfKTUIe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 20 Nov 2019 15:08:34 -0500
Received: by mail-il1-f181.google.com with SMTP id o18so819323ils.12
        for <linux-usb@vger.kernel.org>; Wed, 20 Nov 2019 12:08:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=917G6fTdFdfk6gxeDD3BYsoum2vlJmUuT956gq2OO0Y=;
        b=uNGSPF9X+5rgQ+jXSKchJzAaIkOs1w1Rky89v8+qzUMP5hOGpYr7RdNCpB6XuiRFdH
         RA6brpqbXd2kENeww5pl6W7Nk7kY65s53Etq5T47mTbgUEiuEdc1zJrdGPC2dG+9C+Zg
         gWkyD2DJHtUqHUHLtSaX1HlUOPdV5V3mzgU021Ujs2OT9/zdGNiMVEy5aKGN0dmmW2v4
         3WZfF7kMJpB8zPTIqL1bDcdAkK6bGZ8KcCWtCbWq3oUZ4ZwJbUxFsPF9Mc7yMeZZJJ5I
         FfcsTILhKFsurHHDWuJPRTHLJP3wmZk6TmGGd7n+6R2cHfynMzKIwSOV/sSCKsve7mxf
         4b6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=917G6fTdFdfk6gxeDD3BYsoum2vlJmUuT956gq2OO0Y=;
        b=Q8JdzS9KHx2LOXKAW24qLmK+8IlpJCsFFg9xDrQx0ghtGiHcRHTITki5mmH2OVKqOC
         nzzpdFtYvg016ZplIhbgoSAHO1ZPONacHhv8qgBn9yzCHjKh+hAN8qkYe5u3vQkosMFh
         xMMsH4ozkqxev4o/S678wc3Mcsm2TMYEmcgMRk4YFvqf+E+XsG/lTvlEci9jbe7EZUdm
         yW3mNkms5s15bVJDxRCyFb046vTPrw40nWhGNzmq++RXFG0oamBBLdKI3l2PEExzGgY6
         QKqhzwhaSJD29/Nklm41LxKabZQ4qBlrFSVxd5K9uA6qvtPnv176Av7oyDjtKYeApuWL
         saEg==
X-Gm-Message-State: APjAAAXQNY6MMZotaHQIiX9MaEjd1U0oIxvxmXdnxgBSmuze3w7KxDG8
        ZB5kE/WxQqVwXITQPOmcaqquXIW0sj+YLLTCnmTYSKo4
X-Google-Smtp-Source: APXvYqzI8vUIV7H/eNaAmQH67NGciTlEBa3vv3p0yZ+ol6C1RYsYjq/uwQD5VWXqnC5bEWp9h+U7cSRLm3SLFgDnPKI=
X-Received: by 2002:a92:c981:: with SMTP id y1mr5470549iln.53.1574280513280;
 Wed, 20 Nov 2019 12:08:33 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:ac0:f24e:0:0:0:0:0 with HTTP; Wed, 20 Nov 2019 12:08:32
 -0800 (PST)
In-Reply-To: <20191120133152.GB2892197@kroah.com>
References: <CAA=hcWRrES4cpXvqBtD8-pyrUwz-BR03c-hSG-Xr4dei3AQi_w@mail.gmail.com>
 <20191120133152.GB2892197@kroah.com>
From:   JH <jupiter.hce@gmail.com>
Date:   Thu, 21 Nov 2019 07:08:32 +1100
Message-ID: <CAA=hcWQaXPWWAv2c9ZuVnPw-g075SC1tyKy0DP2+WrktdQYymg@mail.gmail.com>
Subject: Re: kernel: Alignment trap
To:     Greg KH <greg@kroah.com>
Cc:     linux-usb <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

On 11/21/19, Greg KH <greg@kroah.com> wrote:
> On Wed, Nov 20, 2019 at 09:28:14PM +1100, JH wrote:
>> Hi,
>>
>> I am running 4G LTE (USB protocol) and WiFi on IMX6 board, the kernel
>> is 4.19.75 LTE. It is not clear where the kernel alignment trap came
>> from, the only thing I could see is the alignment trap message
>> generated immediate after USB GSM communication or mwifiex_sdio. Where
>> that the alignment trap came from? Which parts of the program could
>> contribute the kernel alignment trap, kernel iteself, or USB GSM or
>> mwifiex_sdio? Appreciate clues how to fix it.
>>
>> Nov 20 05:08:09 solar kernel: usb 1-1: GSM modem (1-port) converter
>> now attached to ttyUSB0
>> Nov 20 05:08:09 solar kernel: option 1-1:1.2: GSM modem (1-port)
>> converter detected
>> Nov 20 05:08:09 solar kernel: usb 1-1: GSM modem (1-port) converter
>> now attached to ttyUSB1
>> Nov 20 05:08:10 solar kernel: mwifiex_sdio mmc0:0001:1: info: trying
>> to associate to 'Solar Analytics Wifi' bssid 78:8a:20:49:4b:c5
>> Nov 20 05:08:10 solar kernel: mwifiex_sdio mmc0:0001:1: info:
>> associated to bssid 78:8a:20:49:4b:c5 successfully
>> Nov 20 05:08:10 solar kernel: IPv6: ADDRCONF(NETDEV_CHANGE): mlan0:
>> link becomes ready
>> Nov 20 05:23:13 solar kernel: mwifiex_sdio mmc0:0001:1: info:
>> successfully disconnected from 78:8a:20:49:4b:c5: reason code 3
>> Nov 20 05:23:13 solar kernel: IPv6: ADDRCONF(NETDEV_UP): mlan0: link
>> is not ready
>> Nov 20 05:23:18 solar kernel: Alignment trap: not handling instruction
>> e8532f00 at [<b6c802b6>]
>> Nov 20 05:23:18 solar kernel: Unhandled fault: alignment exception
>> (0x001) at 0x38626667
>> Nov 20 05:23:18 solar kernel: pgd = 34bdb7e7
>> Nov 20 05:23:18 solar kernel: [38626667] *pgd=00000000
>
> You should have a much longer tracedump after this, right?  Can you
> provide that please?

That was the last statement from the kernel log journalctl -t kernel
-b at the time.

> And why do you think this was a USB issue?

No, I was not saying it was a USB issue, nor did I know if it is a
kernel issue or mwifiex_sdio issue or something else, I don't have the
knowledge to determine it, that was why I have to go this list for
help, I did try to connect to Linux network mailing list linux-net or
kernel mailing list lkml, but I must get wrong with the mailing list
address, I could not get response or subscription frin linux-net or
lkml, if you could let me know the correct kernel network mailing
address and kernel mailing list address, I'll ask the help there as
well.

Thanks Greg.

- jh

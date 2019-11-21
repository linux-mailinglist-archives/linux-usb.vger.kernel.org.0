Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 49B40104AC9
	for <lists+linux-usb@lfdr.de>; Thu, 21 Nov 2019 07:40:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726132AbfKUGkR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 21 Nov 2019 01:40:17 -0500
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:51479 "EHLO
        wout5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725842AbfKUGkR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 21 Nov 2019 01:40:17 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id CF1AA7A9;
        Thu, 21 Nov 2019 01:40:15 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Thu, 21 Nov 2019 01:40:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=qHd3WJpxVibsNjaUXtHOdLj+O9P
        /RmGYSqCC1zpFjZk=; b=dInyfVqqc16bI4qDR6mtXjfqSx9riQ8hGDBdaMLqcaW
        FOHzXiZc7k0VXnHdOAE3HLkkdM4XXSF/0o1T3WlH8LYnPGghrYGKwcJEf8LtJZke
        3zeuBLm5TxXzrl9DOY6PpHUmNM7PrWfzm4Fo692jAb6K4h9wUNnWfVPiryaSCeZH
        H5RX+yPAKv7M7W7Oy6jD5aA1L6FEYjIS6SxzUw6VpnFhXj9bTiLXxBe/ikAqI6gQ
        eGdbgJE079jtqOMQuxLkAxrT8MqYQdI01Ls1U5d4r/EWD1XocwYmQ6euoBnLDLf1
        rU9rL5WH+yWuxPkgYGaLna9XEVmlbOP9q5awLf4oy5A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=qHd3WJ
        pxVibsNjaUXtHOdLj+O9P/RmGYSqCC1zpFjZk=; b=Oyit64YJE8nZ46JdFjtHFc
        m8RVRUqRl+nTUQDIHbntfhakOYTvw4rmtQMoa0I5L0T01wOUkNERJRT+un1K8Jo9
        2eAELxAOoo1XqimWQoIjRkFY2mqYHL5VcKtC2w3RXZ+weF6+sbwH1c5BcaHIcT5u
        vVrLqw7RhlBuMLdYd/OICLhlK5oRg4SHBxI5lSwJcbCpVBQu8SYmfjswj0eTMMb4
        Ni8HJMt7IOj739k7n+2Dw3vcGNqrznS9y1nen2zQ5t2btxZInIdJhiqBVkkZ2j73
        WK87qG/f8ExOu8ozCCDLLy+aSzStOQMxvyemlhZUBDtT4fXZGLx10+cDIizBFBUA
        ==
X-ME-Sender: <xms:TzHWXUaKMxGO2i1hzeTDbaCymK9J8IzWtSdAwoEt1KAvhP_Jv_d6MQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudehuddgleekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjfgesthdtredttdervdenucfhrhhomhepifhrvghg
    ucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecukfhppeekfedrkeeirdekledrud
    dtjeenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorghhrdgtohhmnecu
    vehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:TzHWXWw6vdvd1YtOdzDHihq-KKrygtxxFdBn1PmGiYdWp7TFUBRoiQ>
    <xmx:TzHWXUjsbBRcyr6aE4B3xmlySt1sSly6Nm4d1LQvakxpIP4hO5eJdQ>
    <xmx:TzHWXakmTbzm36W9wBgtVcvPA8dwWsWHTvSM0A_zMxgiQuPkrll3gg>
    <xmx:TzHWXWiVXqu14_Bu2Dn2AngLzK9DAqnhZziu5dkDlzo7WPCxOSsdzw>
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        by mail.messagingengine.com (Postfix) with ESMTPA id 7DDCD8005A;
        Thu, 21 Nov 2019 01:40:14 -0500 (EST)
Date:   Thu, 21 Nov 2019 07:40:12 +0100
From:   Greg KH <greg@kroah.com>
To:     JH <jupiter.hce@gmail.com>
Cc:     Peter Chen <peter.chen@nxp.com>,
        linux-usb <linux-usb@vger.kernel.org>
Subject: Re: kernel: Alignment trap
Message-ID: <20191121064012.GA340116@kroah.com>
References: <CAA=hcWRrES4cpXvqBtD8-pyrUwz-BR03c-hSG-Xr4dei3AQi_w@mail.gmail.com>
 <20191120133152.GB2892197@kroah.com>
 <CAA=hcWQaXPWWAv2c9ZuVnPw-g075SC1tyKy0DP2+WrktdQYymg@mail.gmail.com>
 <20191121030842.GA7503@b29397-desktop>
 <CAA=hcWRXo-iByT3ZiKmQEnu-tssoKfEpgEVhn=i=Hyc7u1DHTg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA=hcWRXo-iByT3ZiKmQEnu-tssoKfEpgEVhn=i=Hyc7u1DHTg@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Nov 21, 2019 at 05:06:45PM +1100, JH wrote:
> Hi Peter,
> 
> On 11/21/19, Peter Chen <peter.chen@nxp.com> wrote:
> > On 19-11-21 07:08:32, JH wrote:
> >> Hi Greg,
> >>
> >> On 11/21/19, Greg KH <greg@kroah.com> wrote:
> >> > On Wed, Nov 20, 2019 at 09:28:14PM +1100, JH wrote:
> >> >> Hi,
> >> >>
> >> >> I am running 4G LTE (USB protocol) and WiFi on IMX6 board, the kernel
> >> >> is 4.19.75 LTE. It is not clear where the kernel alignment trap came
> >> >> from, the only thing I could see is the alignment trap message
> >> >> generated immediate after USB GSM communication or mwifiex_sdio. Where
> >> >> that the alignment trap came from? Which parts of the program could
> >> >> contribute the kernel alignment trap, kernel iteself, or USB GSM or
> >> >> mwifiex_sdio? Appreciate clues how to fix it.
> >> >>
> >> >> Nov 20 05:08:09 solar kernel: usb 1-1: GSM modem (1-port) converter
> >> >> now attached to ttyUSB0
> >> >> Nov 20 05:08:09 solar kernel: option 1-1:1.2: GSM modem (1-port)
> >> >> converter detected
> >> >> Nov 20 05:08:09 solar kernel: usb 1-1: GSM modem (1-port) converter
> >> >> now attached to ttyUSB1
> >> >> Nov 20 05:08:10 solar kernel: mwifiex_sdio mmc0:0001:1: info: trying
> >> >> to associate to 'Solar Analytics Wifi' bssid 78:8a:20:49:4b:c5
> >> >> Nov 20 05:08:10 solar kernel: mwifiex_sdio mmc0:0001:1: info:
> >> >> associated to bssid 78:8a:20:49:4b:c5 successfully
> >> >> Nov 20 05:08:10 solar kernel: IPv6: ADDRCONF(NETDEV_CHANGE): mlan0:
> >> >> link becomes ready
> >> >> Nov 20 05:23:13 solar kernel: mwifiex_sdio mmc0:0001:1: info:
> >> >> successfully disconnected from 78:8a:20:49:4b:c5: reason code 3
> >> >> Nov 20 05:23:13 solar kernel: IPv6: ADDRCONF(NETDEV_UP): mlan0: link
> >> >> is not ready
> >> >> Nov 20 05:23:18 solar kernel: Alignment trap: not handling instruction
> >> >> e8532f00 at [<b6c802b6>]
> >> >> Nov 20 05:23:18 solar kernel: Unhandled fault: alignment exception
> >> >> (0x001) at 0x38626667
> >> >> Nov 20 05:23:18 solar kernel: pgd = 34bdb7e7
> >> >> Nov 20 05:23:18 solar kernel: [38626667] *pgd=00000000
> >> >
> >> > You should have a much longer tracedump after this, right?  Can you
> >> > provide that please?
> >>
> >> That was the last statement from the kernel log journalctl -t kernel
> >> -b at the time.
> >>
> >> > And why do you think this was a USB issue?
> >>
> >> No, I was not saying it was a USB issue, nor did I know if it is a
> >> kernel issue or mwifiex_sdio issue or something else, I don't have the
> >> knowledge to determine it, that was why I have to go this list for
> >> help, I did try to connect to Linux network mailing list linux-net or
> >> kernel mailing list lkml, but I must get wrong with the mailing list
> >> address, I could not get response or subscription frin linux-net or
> >> lkml, if you could let me know the correct kernel network mailing
> >> address and kernel mailing list address, I'll ask the help there as
> >> well.
> >>
> >
> > Do you have correct firmware has loaded for your device?
> 
> Not clear what the firmware you were talking about? I used open source
> linux-firmware-sd8887, uBlox SARA-R4 and uBlox EMMY on IMX6. Let's say
> we have been running this device for about 7 months, we used Kernel
> 5.1.0 before, I could not recall any error about the alignment trap in
> kernel. We now moved to kernel 4.19.75 LTS, that is what it occurred
> often, that worries me.

Why did you move to an older kernel?  If it all works on a newer one,
please stick with that, or use 'git bisect' to find the commit that
breaks things.

thanks,

greg k-h

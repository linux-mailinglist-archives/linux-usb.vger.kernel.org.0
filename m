Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 067FD458348
	for <lists+linux-usb@lfdr.de>; Sun, 21 Nov 2021 13:21:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238186AbhKUMYI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 21 Nov 2021 07:24:08 -0500
Received: from mail.kernel.org ([198.145.29.99]:42548 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235815AbhKUMYI (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 21 Nov 2021 07:24:08 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id D781560524;
        Sun, 21 Nov 2021 12:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1637497263;
        bh=mruXRUnIEZnUJhApjkXgnv/EukWxjl+fb3nCV/JuewY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vxf4Y8IcRe9k5SY3Ct5FRT6Gb2S/M4huG9+YmV0XFaYiUYu/iwph30mewbTK+fGOb
         fX9FLWORrSzo/Db4IIW5YaO+VyZ/1UR/n2q8dPiYCJcGjLsKQq6xqZfksfhlQ9WrGN
         Txm+JXlr42mP05dXd1DGdT098n/JbE9CjUqEBBUg=
Date:   Sun, 21 Nov 2021 13:21:00 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Alexandre Frade <kernel@xanmod.org>
Cc:     linux-usb <linux-usb@vger.kernel.org>
Subject: Re: [xanmod/linux] 5.14.14 renders unusable all USB ports except one
 (Issue #207)
Message-ID: <YZo5rEk9NkGk9SGg@kroah.com>
References: <17d40042d3b.f54aeba22864166.9088645547283469156@xanmod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <17d40042d3b.f54aeba22864166.9088645547283469156@xanmod.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Nov 20, 2021 at 10:02:35PM -0300, Alexandre Frade wrote:
> Dear USB Leadership Team,
> 
> Please, follow this issue: https://github.com/xanmod/linux/issues/207
> 
> kern.log:
> -----
> [   14.105940] usb 4-3: device not accepting address 2, error -108
> [   14.106012] usb usb3-port2: couldn't allocate usb_device
> [   14.106049] usb usb4-port3: couldn't allocate usb_device
> -----
> 
> SoftExpert: Hello, I updated to 5.14.14-xanmod1-cacule and then to 5.14.14-xanmod2-cacule - both versions render unusable my USB ports except the one that has pass-through charging.
> 
> When booting in the previous version 5.14.13 all USB ports function normally.
> Here are the requested files:
> https://github.com/xanmod/linux/files/7391333/lshw5.14.13.log
> https://github.com/xanmod/linux/files/7391334/lshw5.14.14.log
> kern.log
> I also performed a sudo lsusb -v under both versions:
> https://github.com/xanmod/linux/files/7391339/lsusb_xanmod5.14.14.txt
> https://github.com/xanmod/linux/files/7391340/lsusb_xanmod5.14.13.txt
> 
> SoftExpert: Hello, I installed 5.14.15 and I have the same issue ...
> 
> SoftExpert: Hello, I installed 5.14.15 and I have the same issue ...
> 
> SoftExpert: Hello, I confirm the same issue with 5.14.16 and with 5.15.0 ...
> 
> Vi: I'm using 5.14.20-xanmod1 #0~git20211118.f58acc8 and it indeed it broke something with USB interfaces, half of them doesn't work anymore.
> 
> Vi: Attached as requested. Note that I reverted back to 5.14.17 for now
> https://github.com/xanmod/linux/files/7572385/kern.log
> https://github.com/xanmod/linux/files/7572386/syslog.log

Can you find the offending commit that caused this issue by using 'git
bisect'?

thanks,

greg k-h

Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC74126CD5A
	for <lists+linux-usb@lfdr.de>; Wed, 16 Sep 2020 22:58:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728597AbgIPU6T (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Sep 2020 16:58:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:46162 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726541AbgIPQdO (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 16 Sep 2020 12:33:14 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B147922240;
        Wed, 16 Sep 2020 14:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600265679;
        bh=nZAQn55+aPcq8RzVKQN+6ql3dw2uD5nehssjhy2nZYk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IkFYpQXDgKNz2Afod07W1Wri9ZEd4d2XvR50R3r67V4f2627PcBsJDqX3iiWbhBM7
         4X9df7MET5/lGN6V5A+MiXTcanzDUE43eIA2fs7o89XN0Plr4UyHjbKiKcTU3S30GC
         bEkeT7DaM98kohGkPjVMKhlU8922XsSwVFiTG8Pw=
Date:   Wed, 16 Sep 2020 16:15:13 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Andrey Konovalov <andreyknvl@google.com>
Cc:     Bastien Nocera <hadess@hadess.net>,
        Alan Stern <stern@rowland.harvard.edu>,
        syzkaller <syzkaller@googlegroups.com>,
        USB list <linux-usb@vger.kernel.org>,
        Dmitry Vyukov <dvyukov@google.com>
Subject: Re: USB driver ID matching broken
Message-ID: <20200916141513.GA2977321@kroah.com>
References: <CAAeHK+zOrHnxjRFs=OE8T=O9208B9HP_oo8RZpyVOZ9AJ54pAA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAeHK+zOrHnxjRFs=OE8T=O9208B9HP_oo8RZpyVOZ9AJ54pAA@mail.gmail.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Sep 16, 2020 at 03:33:25PM +0200, Andrey Konovalov wrote:
> Hi Bastien, Greg, Alan,
> 
> Looks like commit adb6e6ac20ee ("USB: Also match device drivers using
> the ->match vfunc") broke the USB driver ID matching process. This, in
> turn, led to a complete breakage of the USB fuzzing instance.
> 
> This is how an attempt to connect a USB device looks now:
> 
> [   39.781642][   T12] usb 1-1: new high-speed USB device number 2
> using dummy_hcd
> [   40.299955][   T12] usb 1-1: New USB device found, idVendor=0cf3,
> idProduct=9271, bcdDevice= 1.08
> [   40.303072][   T12] usb 1-1: New USB device strings: Mfr=1,
> Product=2, SerialNumber=3
> [   40.305678][   T12] usb 1-1: Product: syz
> [   40.307041][   T12] usb 1-1: Manufacturer: syz
> [   40.308556][   T12] usb 1-1: SerialNumber: syz
> [   40.314825][   T12] usbip-host 1-1: 1-1 is not in match_busid table... skip!
> [   42.500114][   T51] usb 1-1: USB disconnect, device number 2
> 
> It seems that when going through the list of registered IDs the code
> tries to match against USB/IP and succeeds as usbip_match() always
> returns true.
> 
> I'm not sure what's the best fix for this is.

I thought that is what the patch from Bastien was supposed to fix?

If it didn't, we can revert it.

thanks,

greg k-h

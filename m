Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F24E1141DE2
	for <lists+linux-usb@lfdr.de>; Sun, 19 Jan 2020 13:59:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726890AbgASM7K (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 19 Jan 2020 07:59:10 -0500
Received: from mail.kernel.org ([198.145.29.99]:37876 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726843AbgASM7K (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 19 Jan 2020 07:59:10 -0500
Received: from localhost (lns-bzn-36-82-251-23-53.adsl.proxad.net [82.251.23.53])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DD2CD20679;
        Sun, 19 Jan 2020 12:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579438749;
        bh=5BCWujSYAFojo0SHLOKV6toIJsr6DiJIQA5D/eB3URc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=METfzT+mWZZA2lZLzzl1TZHX2Q0wmwfUvAKHahK3tyhdeXsMO7E/nA4XmjZZF2i6u
         kj2ReAdPcVF3ZY2oIVOvlxctDuCDBnXWKQkO7RQyx+/x6kbBzSQrCihD1hT7lMdgp2
         V/TnsGKrl0YiBo3LZzp9YuENvkgR0WL/3N0rhCog=
Date:   Sun, 19 Jan 2020 13:59:06 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Johan Hovold <johan@kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Steve Markgraf <steve@steve-m.de>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Regression in 5.5.0-rc6 for FL2000 USB 3.0 to VGA adapter
Message-ID: <20200119125906.GD149506@kroah.com>
References: <9cadc6b9-16f7-e072-abee-53ac5c143198@steve-m.de>
 <20200119125823.GC149506@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200119125823.GC149506@kroah.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Jan 19, 2020 at 01:58:23PM +0100, Greg KH wrote:
> On Sun, Jan 19, 2020 at 12:52:40AM +0100, Steve Markgraf wrote:
> > Hi list,
> > 
> > Commit 3e4f8e21c4f27bcf30a48486b9dcc269512b79ff "USB: core: fix check
> > for duplicate endpoints" is causing a regression with devices based on
> > the Fresco Logic FL2000 chip, i.e. it is totally unusable.
> > 
> > The issue was first reported on the osmocom-sdr mailing list [1] and I
> > can reproduce it on my machine with 5.5.0-rc6, with rc5 everything is
> > working fine. By reverting the commit mentioned above, it is working as
> > well.
> > 
> > When connecting the device with rc6, I see the following dmesg output:
> > https://steve-m.de/files/fl2000_dmesg.txt
> > 
> > The output of lsusb -v:
> > https://steve-m.de/files/fl2000_lsusb.txt
> > 
> > Output of the Windows tool "USB Device Tree Viewer":
> > https://steve-m.de/files/fl2000_usbtreeview.txt
> > 
> > Output of the USB-IF USB 3.0 Chapter 9 tests with a version from around
> > the time the FL2000 was released to market (passing):
> > https://steve-m.de/files/fl2000_chapter9.html
> > 
> > By looking at the lsusb output, it almost seems like a descriptor
> > parsing issue, that now causes trouble after introducing the duplicate
> > endpoint testing.
> > 
> > Regards,
> > Steve
> > 
> > [1] https://lists.osmocom.org/pipermail/osmocom-sdr/2020-January/002025.html
> 
> Odd, this should have been fixed with commit 3e4f8e21c4f2 ("USB: core:
> fix check for duplicate endpoints") which is in 5.5-rc6.
> 
> Alan and Johan, any ideas?

Ugh, nevermind, I can read this better, it's the fix that is causing
problem, not that the fix should solve the problem...  Time for more
coffee...

greg k-h

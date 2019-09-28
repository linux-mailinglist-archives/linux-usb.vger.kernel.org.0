Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12686C10E9
	for <lists+linux-usb@lfdr.de>; Sat, 28 Sep 2019 14:57:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725932AbfI1M5n (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 28 Sep 2019 08:57:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:48546 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725876AbfI1M5n (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 28 Sep 2019 08:57:43 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D885C20815;
        Sat, 28 Sep 2019 12:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1569675461;
        bh=cpv/Yd4nsoQr4RG5XMgvshPVtBcRxJucBbVVmKCa8b4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aPatCDRwOb03U7ozPse+1wdRcK4WJNtkJ0w3ZPpIP3n/M7JfLVqF38tQv+Ef8xIPW
         NJkzWrTCBgjZeLdZ25PikxLs2U/gwySrJdLNUle5QfCPZ05K8Mx1i7Pdic8Kve7C1o
         rc8gPYts4rqeiTz9gLWvvExPeIz8tFd5gMahdrAM=
Date:   Sat, 28 Sep 2019 14:57:38 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Bastien Nocera <hadess@hadess.net>
Cc:     Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org,
        benjamin.tissoires@redhat.com
Subject: Re: Driver for something that's neither a device nor an interface
 driver?
Message-ID: <20190928125738.GA1848662@kroah.com>
References: <Pine.LNX.4.44L0.1909271351260.4732-100000@iolanthe.rowland.org>
 <7f25b01ceb1a3aa6bd213599474ceffc34a0054b.camel@hadess.net>
 <20190927192554.GB1805907@kroah.com>
 <48bcb34194695566b9c59f6e814706f8d65be962.camel@hadess.net>
 <20190928073935.GB1836895@kroah.com>
 <c47cfdbe937b209eb84af7de3aea7faf3faa5ca8.camel@hadess.net>
 <20190928121809.GB1845030@kroah.com>
 <7d5cea0ea49ef76a248f0c307418698cedf827dc.camel@hadess.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7d5cea0ea49ef76a248f0c307418698cedf827dc.camel@hadess.net>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Sep 28, 2019 at 02:37:21PM +0200, Bastien Nocera wrote:
> On Sat, 2019-09-28 at 14:18 +0200, Greg KH wrote:
> > Again, the power_supply api is for power going the other way in the
> > system.  That's not an "existing clearly defined API in kernel
> > space".
> 
> No it isn't, not since 2011.
> 
> commit 25a0bc2dfc2ea732f40af2dae52426ead66ae76e
> Author: Jeremy Fitzhardinge <jeremy@goop.org>
> Date:   Wed Dec 7 11:24:20 2011 -0800
> 
>     power_supply: add SCOPE attribute to power supplies
>     
>     This adds a "scope" attribute to a power_supply, which indicates how
>     much of the system it powers.  It appears in sysfs as "scope" or in
>     the uevent file as POWER_SUPPLY_SCOPE=.  There are presently three
>     possible values:
>             Unknown - unknown power topology
>             System - the power supply powers the whole system
>             Device - it powers a specific device, or tree of devices
>     
>     A power supply which doesn't have a "scope" attribute should be assumed to
>     have "System" scope.
>     
>     In general, usermode should assume that loss of all System-scoped power
>     supplies will power off the whole system, but any single one is sufficient
>     to power the system.
>     
>     Signed-off-by: Jeremy Fitzhardinge <jeremy@goop.org>
>     Cc: Richard Hughes <richard@hughsie.com>
> 

Ah, ok, my fault, then ok, let's see how your kernel driver ties into
this then.

thanks,

greg k-h

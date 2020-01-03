Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8CFC012F73E
	for <lists+linux-usb@lfdr.de>; Fri,  3 Jan 2020 12:29:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727470AbgACL3q (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Jan 2020 06:29:46 -0500
Received: from mail.kernel.org ([198.145.29.99]:50766 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727453AbgACL3q (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 3 Jan 2020 06:29:46 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5A67E21835;
        Fri,  3 Jan 2020 11:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578050985;
        bh=jGTAZmQH3VcE7Hq/VICBM3pSA54SULev1rW4U5TitnQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HC/X789E/XSEPuv9y/YF+VYdPlWN6QCFjAe6txV9UKAGQGGp2tRjS55Kfak4ozswl
         i/tFshKc4anbvUWJhSpY8JCY00jNieVOp2X5Mt4PBiPt2mcvdvgZFyeBLEhOwRkSF0
         Qk7cfWI30se2+jryRc9mn+vfxRPFnqoDvdFj5ciY=
Date:   Fri, 3 Jan 2020 12:29:43 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Bryan Gillespie <rpgillespie6@gmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Is Duplicate Sequence Number an Issue?
Message-ID: <20200103112943.GA1051129@kroah.com>
References: <CAPVsg6LXr-fsz=FG8BDMqOPd73vcgageTk++Bt+fEP4-6DVT6A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPVsg6LXr-fsz=FG8BDMqOPd73vcgageTk++Bt+fEP4-6DVT6A@mail.gmail.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Dec 17, 2019 at 11:33:55AM -0500, Bryan Gillespie wrote:
> Hello,
> 
> I am trying to debug a USB 3.0 issue under linux 4.4/4.14 where device
> endpoints become unresponsive when sending small packet iperf traffic
> through them. I have a protocol analyzer (Beagle 5000), and I see the
> following at the moment of breakage:

Does 5.4 also show this issue?

> https://i.stack.imgur.com/CrCV7.png
> 
> If I expand the packets, I notice that the last good transaction looks
> like this:
> 
> https://i.stack.imgur.com/sWxne.png
> 
> And the first bad transaction looks like this:
> 
> https://i.stack.imgur.com/l85xJ.png
> 
> This looks like only a partial transaction? The only thing that stuck
> out to me was that the two data transactions have the exact same
> Sequence Number (SeqNum), which seems like it might be out of spec
> with USB 3.0 (I read that you can only have duplicate sequence numbers
> if it is a retransmission, and it looks like it isn't)? Is xhci under
> linux setting these sequence numbers or is that at the hardware level?
> This issue seems to bubble up the linux usb stack as -EPROTO which has
> no information.

The hardware handles the sequence number, so you might want to make sure
you are using up-to-date silicon.

thanks,

greg k-h

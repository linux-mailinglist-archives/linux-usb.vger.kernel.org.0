Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BBDD468ADC
	for <lists+linux-usb@lfdr.de>; Sun,  5 Dec 2021 13:48:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233817AbhLEMwA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 5 Dec 2021 07:52:00 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:44946 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233720AbhLEMv7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 5 Dec 2021 07:51:59 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A3B96B80E3F
        for <linux-usb@vger.kernel.org>; Sun,  5 Dec 2021 12:48:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDC66C341C1;
        Sun,  5 Dec 2021 12:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1638708510;
        bh=/imDibze4+Ir42NwsjTzw/XZJFZq7yjaSO2qKrwHYZk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TY7PiGfHLEfU8tWBTdrnGSzNRcAwOuNPK4YJAx+4HVOwY9eNiqVWR8gj20ka7bK1G
         rUTzcxSxYiFpqacMSatT3xDo///SNBG6fD4zhgobOe9w6Im94MeoQe+O8p26+Slzjm
         AM87YVELEerw62xYqMfsH54EZLf4mi4qsnpqCeoc=
Date:   Sun, 5 Dec 2021 13:48:18 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        Pavankumar Kondeti <pkondeti@codeaurora.org>,
        linux-usb <linux-usb@vger.kernel.org>
Subject: Re: Regression: "xhci: Fix command ring pointer corruption while
 aborting a command" breaks USB on Intel controllers
Message-ID: <Yay1EiY/F7ezPeb6@kroah.com>
References: <0a4d723c-221f-a42a-434c-34283a4cdab7@redhat.com>
 <Yax2MOuKXECUxzbd@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yax2MOuKXECUxzbd@kroah.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Dec 05, 2021 at 09:20:00AM +0100, Greg Kroah-Hartman wrote:
> On Sat, Dec 04, 2021 at 03:15:15PM +0100, Hans de Goede wrote:
> > Hi All,
> > 
> > There are several bug reports (arch and Fedora) about USB problems
> > starting with kernel 5.14.14 (5.14.13 is ok):
> > 
> > https://bugzilla.redhat.com/show_bug.cgi?id=2019788
> > https://bbs.archlinux.org/viewtopic.php?pid=2006862
> > 
> > And 5.16.6, which has the hub address0_mutex fixes does not
> > fix these problems for some users.
> > 
> > Looking at the history between those 2 commit ff0e50d3564f
> > ("xhci: Fix command ring pointer corruption while aborting a command"):
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=ff0e50d3564f
> > 
> > stood out to me as a possible cause of this. So I've build
> > a test 5.15.6 kernel for Fedora users with that commit reverted
> > and 2 users have now reported that this fixes things for them
> > (see https://bugzilla.redhat.com/show_bug.cgi?id=2019788).
> > 
> > The reason why this stood out to me is because doing a 32 bit
> > write over a possibly 64 bit databus to the xHCI controller may
> > result in the hw doing a 64 bit read + modify 32 bit + 64 bit write,
> > so I think that the following is happening after the commit:
> > 
> > sw: read 32 bit
> > hw: read 64 bit, return 32 bit
> > sw: modify it
> > sw: write 32 bit
> > hw: read 64 bit
> > hw: modify 32 bit of 64 bit wor5d
> > hw: write 64 bit
> > 
> > Which actually makes the chances of hitting the problem the commit
> > tries to fix larger on controllers using a 64 bit data bus.
> > 
> > Note this is just a theory, but it seems plausible to me.
> > 
> > All problem reports are people using integrated Intel xHCI controllers
> > which I believe are likely to use a 64 bit data-bus.
> 
> I think this is fixed by 09f736aa9547 ("xhci: Fix commad ring abort,
> write all 64 bits to CRCR register.") in linux-next and I'll be sending
> it to Linus in a few hours.

Pull request is here:
	https://lore.kernel.org/r/Yayq/Xdb/pHSS7/l@kroah.com


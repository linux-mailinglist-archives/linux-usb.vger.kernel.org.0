Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73A01468A10
	for <lists+linux-usb@lfdr.de>; Sun,  5 Dec 2021 09:20:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232255AbhLEIXt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 5 Dec 2021 03:23:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232221AbhLEIXq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 5 Dec 2021 03:23:46 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02AF8C061751
        for <linux-usb@vger.kernel.org>; Sun,  5 Dec 2021 00:20:19 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 9C2E2B80DF3
        for <linux-usb@vger.kernel.org>; Sun,  5 Dec 2021 08:20:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79F10C341C4;
        Sun,  5 Dec 2021 08:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1638692417;
        bh=gpDBuLEBLoqaR2ZbZoYDb4btM9QjBXMg/cagK2sktFU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uQ93preBWkxFn3pjmCGC2jtqN5ANYXAEA1CKgH30MTki6sfAtVZoqPbrPG/R3B1fl
         N4uljU679tL4BfzSya+QMWVUdMRQ6FCiiyOln0vz692Yov3tt1nqbMLrJp1WpTmE7L
         u4cfyGIL7CR7zLKGg6upl/HH9vtHH/1nh5zjMQjc=
Date:   Sun, 5 Dec 2021 09:20:00 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        Pavankumar Kondeti <pkondeti@codeaurora.org>,
        linux-usb <linux-usb@vger.kernel.org>
Subject: Re: Regression: "xhci: Fix command ring pointer corruption while
 aborting a command" breaks USB on Intel controllers
Message-ID: <Yax2MOuKXECUxzbd@kroah.com>
References: <0a4d723c-221f-a42a-434c-34283a4cdab7@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0a4d723c-221f-a42a-434c-34283a4cdab7@redhat.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Dec 04, 2021 at 03:15:15PM +0100, Hans de Goede wrote:
> Hi All,
> 
> There are several bug reports (arch and Fedora) about USB problems
> starting with kernel 5.14.14 (5.14.13 is ok):
> 
> https://bugzilla.redhat.com/show_bug.cgi?id=2019788
> https://bbs.archlinux.org/viewtopic.php?pid=2006862
> 
> And 5.16.6, which has the hub address0_mutex fixes does not
> fix these problems for some users.
> 
> Looking at the history between those 2 commit ff0e50d3564f
> ("xhci: Fix command ring pointer corruption while aborting a command"):
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=ff0e50d3564f
> 
> stood out to me as a possible cause of this. So I've build
> a test 5.15.6 kernel for Fedora users with that commit reverted
> and 2 users have now reported that this fixes things for them
> (see https://bugzilla.redhat.com/show_bug.cgi?id=2019788).
> 
> The reason why this stood out to me is because doing a 32 bit
> write over a possibly 64 bit databus to the xHCI controller may
> result in the hw doing a 64 bit read + modify 32 bit + 64 bit write,
> so I think that the following is happening after the commit:
> 
> sw: read 32 bit
> hw: read 64 bit, return 32 bit
> sw: modify it
> sw: write 32 bit
> hw: read 64 bit
> hw: modify 32 bit of 64 bit wor5d
> hw: write 64 bit
> 
> Which actually makes the chances of hitting the problem the commit
> tries to fix larger on controllers using a 64 bit data bus.
> 
> Note this is just a theory, but it seems plausible to me.
> 
> All problem reports are people using integrated Intel xHCI controllers
> which I believe are likely to use a 64 bit data-bus.

I think this is fixed by 09f736aa9547 ("xhci: Fix commad ring abort,
write all 64 bits to CRCR register.") in linux-next and I'll be sending
it to Linus in a few hours.

thanks,

greg k-h

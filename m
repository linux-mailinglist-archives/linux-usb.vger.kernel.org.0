Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7595E4689BF
	for <lists+linux-usb@lfdr.de>; Sun,  5 Dec 2021 07:46:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231918AbhLEGuM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 5 Dec 2021 01:50:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229700AbhLEGuM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 5 Dec 2021 01:50:12 -0500
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [IPv6:2a01:488:42:1000:50ed:8234::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BBEAC061751
        for <linux-usb@vger.kernel.org>; Sat,  4 Dec 2021 22:46:45 -0800 (PST)
Received: from ip4d173d4a.dynamic.kabel-deutschland.de ([77.23.61.74] helo=[192.168.66.200]); authenticated
        by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        id 1mtlIG-0005ZO-CB; Sun, 05 Dec 2021 07:46:40 +0100
Message-ID: <3a5e7a4d-9986-9862-b601-cd7e8bd06855@leemhuis.info>
Date:   Sun, 5 Dec 2021 07:46:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: Regression: "xhci: Fix command ring pointer corruption while
 aborting a command" breaks USB on Intel controllers
Content-Language: en-BS
To:     Hans de Goede <hdegoede@redhat.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Pavankumar Kondeti <pkondeti@codeaurora.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb <linux-usb@vger.kernel.org>
References: <0a4d723c-221f-a42a-434c-34283a4cdab7@redhat.com>
From:   Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <0a4d723c-221f-a42a-434c-34283a4cdab7@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1638686805;7639619b;
X-HE-SMSGID: 1mtlIG-0005ZO-CB
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi, this is your Linux kernel regression tracker speaking.

On 04.12.21 15:15, Hans de Goede wrote:
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

FWIW, the commit is known to cause problems, one of them is found here:

https://lore.kernel.org/lkml/35f7428b39f996c793f5b4a6a314772681c73d7a.camel@apache.org/

This commit should improve the situation (and afaics hopefully fix all
problems related to it):

https://lore.kernel.org/stable/20211126122340.1193239-2-mathias.nyman@linux.intel.com/

Greg wants to sent it upstream today:

https://lore.kernel.org/lkml/YatGfEzzniH%2FSrn4@kroah.com/

Guess he soon after will backport it to the stable trees as well.

HTH, Ciao, Thorsten

#regzbot ^backmonitor
https://lore.kernel.org/lkml/35f7428b39f996c793f5b4a6a314772681c73d7a.camel@apache.org/

Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 699B8228325
	for <lists+linux-usb@lfdr.de>; Tue, 21 Jul 2020 17:06:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729929AbgGUPG3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 Jul 2020 11:06:29 -0400
Received: from netrider.rowland.org ([192.131.102.5]:36575 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726436AbgGUPG3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 21 Jul 2020 11:06:29 -0400
Received: (qmail 1276524 invoked by uid 1000); 21 Jul 2020 11:06:28 -0400
Date:   Tue, 21 Jul 2020 11:06:28 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     =?iso-8859-1?Q?SZIGETV=C1RI_J=E1nos?= <jszigetvari@gmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: linux usb gadget - mass storage
Message-ID: <20200721150628.GC1272082@rowland.harvard.edu>
References: <CAJK_Yh-KwrrWeGY5s=RKJDhp0gyZBf+LsWCydKSfj0dEAYGHCA@mail.gmail.com>
 <20200720162422.GG1228057@rowland.harvard.edu>
 <CAJK_Yh_ZAvuSBFdUitkPbzp_L69Fuew7cTKbeTH3X8aJdOJeqw@mail.gmail.com>
 <20200720172951.GI1228057@rowland.harvard.edu>
 <CAJK_Yh8rPPMkxXLAyQDN7Ux=_NKcfvHgb1iyt7bZmej0q4P-Qg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJK_Yh8rPPMkxXLAyQDN7Ux=_NKcfvHgb1iyt7bZmej0q4P-Qg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jul 21, 2020 at 02:20:27PM +0200, SZIGETVÁRI János wrote:
> Hi Alan,
> 
> Alan Stern <stern@rowland.harvard.edu> ezt írta (időpont: 2020. júl.
> 20., H, 19:29):
> > 4.19 is a very old kernel.  You'd be a lot better off testing under a
> > recent kernel, like 5.7.  It also would be more convenient to do your
> > development on a regular PC instead of a Raspberry Pi.  You can use
> > dummy-hcd for testing gadget drivers.
> 
> Okay, I put together a Slackware-current based VM to conduct the
> development work on.
> I compiled a patched version of kernel 5.7.9 with all the necessary
> config parameters to have USB gadget support with debugging enabled,
> and also the dummy HCD.
> 
> At first loaded the g_mass_storage module with a smaller ~700 MB iso
> file, and it loaded seemingly fine, and functionality-wise it also
> seemed to work fine, although there were frequent periodical debug
> messages about the gadget returning command-failure status:
> https://gist.github.com/jszigetvari/5bc4cdc8c55588907b71832558cb00a7

There failures are normal.  They arise because the computer sends 
commands that the gadget driver doesn't understand or support, such as 
GET EVENT STATUS NOTIFICATION.

> After that as a test I tried to dd all the data from /dev/sr1 (that's
> the device file the gadget was assigned) to /dev/null.
> The process completed without any user-visible errors, although the
> failure status related messages kept on appearing:
> https://gist.github.com/jszigetvari/ffa19850c94f12510c0b78ed5aaba2e1
> 
> Finally I tried to load the large, 11 GB CentOS iso file as the second
> phase of the test. On the Raspberry Pi (with kernel 4.19) this was
> when the crash happened, however this time it did not.
> Originally Tiziano Bacocco's patch came around to be the time of the
> 3.x kernels. The patch needed minimal adjustments to apply to 4.19 and
> 5.4 and also to 5.7.9 (though there was a one line offset in
> f_mass_storage.c).
> https://gist.github.com/jszigetvari/5a9796c8af8a01c0edba6a8696540029
> 
> Although I have to admit that on the Pi Zero I was using the g_multi
> kernel module, and not g_mass_storage I assumed they share the same
> code base, so they should work the same way.
> On the Pi zero I need the extra serial and Ethernet interface to have
> access to the Pi Zero, as it doesn't have a wireless NIC, and that's
> why I chose g_multi.ko.
> 
> In the end I did a dd with the 11 GB iso, and to my surprise it worked
> well. dd returned without any errors and it did show the true 11 GB
> size when it finished.
> In the kernel logs most log entries were about block reads, but the
> failure status messages were still around. If there was no activity on
> the device, then they accounted for the majority of the logs
> generated:
> https://gist.github.com/jszigetvari/a9225fa3173e6c7b7b50673a494d9c37
> 
> I have to admit, I stand puzzled why it worked on an x86_64-based
> machine and crashed on the Pi Zero.

The crash message on the Pi Zero indicated that there was a problem in 
the host controller driver (dwc2-hsotg), not in the mass-storage driver.

> I guess the next step will be either:
> * to try using g_multi instead of g_mass_storage on the test machine
> * upgrade the Pi Zero to run kernel 5.4.x (AFAIK that's the latest one
> can get from the Raspberry Pi Foundation's git repo), and recompile
> that kernel version with the patch applied. (This will likely take a
> few days.)

Yes, that might indeed help.

Alan Stern

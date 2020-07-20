Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A757226917
	for <lists+linux-usb@lfdr.de>; Mon, 20 Jul 2020 18:24:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387556AbgGTQYZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Jul 2020 12:24:25 -0400
Received: from netrider.rowland.org ([192.131.102.5]:43007 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S2388009AbgGTQYX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 20 Jul 2020 12:24:23 -0400
Received: (qmail 1236813 invoked by uid 1000); 20 Jul 2020 12:24:22 -0400
Date:   Mon, 20 Jul 2020 12:24:22 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     =?iso-8859-1?Q?SZIGETV=C1RI_J=E1nos?= <jszigetvari@gmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: linux usb gadget - mass storage
Message-ID: <20200720162422.GG1228057@rowland.harvard.edu>
References: <CAJK_Yh-KwrrWeGY5s=RKJDhp0gyZBf+LsWCydKSfj0dEAYGHCA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJK_Yh-KwrrWeGY5s=RKJDhp0gyZBf+LsWCydKSfj0dEAYGHCA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jul 20, 2020 at 04:42:26PM +0200, SZIGETVÁRI János wrote:
> Hi,
> 
> I would like to ask a few questions about the Linux USB Gadget
> project, more specifically about the mass storage gadget itself.
> Currently it is possible to emulate a CD reader with an iso image
> file, which works okay, and has been around for some time.
> My use-case would be to use a Raspberry PI Zero, to emulate an optical
> drive through an iso file and boot a desktop machine with it.
> Unfortunately I also noticed that there were attempts a number of
> years ago to contribute support for DVD reader emulation, but
> unfortunately those efforts did not get into the mainline kernel.
> 
> To be more specific I am referring to these:
> http://linuxehacking.ovh/2013/07/12/how-to-emulatore-dvd-rom-hardware-usb/
> https://lkml.org/lkml/2015/3/7/388
> 
> In an effort to explore the possibilities, I took Tiziano Bacocco's
> patch (the first of the two) and ported it (in a trivial way) to the
> current Raspberry PI kernel versions (both 4.19.118 and 5.4.44) and
> compiled the kernel and modules.
> The code compiled cleanly after a few minor changes, but when I tried
> to use it on an 11 GB CentOS iso image, the module crashed.

Where did it crash?

> I would need some help and guidance to resolve any of the possible
> issues, and hopefully to make DVD-ROM emulation finally a thing in the
> mass storage gadget.
> I can add further details later on if there will be anyone interested.

I'm not familiar with the details of DVD-ROM operation.  Implementing 
CDROM emulation involved adding support for several additional commands 
to the driver, and it wouldn't be surprising if DVD-ROM emulation 
requires more.  The patch by Tiziano Bacocco adds support for some 
commands, but even more may be needed.

Anyway, I'll be happy to help if you have specific issues to solve.

Alan Stern

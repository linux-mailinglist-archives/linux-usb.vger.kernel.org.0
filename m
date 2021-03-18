Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDA3C340849
	for <lists+linux-usb@lfdr.de>; Thu, 18 Mar 2021 16:00:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229703AbhCRO7j (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 18 Mar 2021 10:59:39 -0400
Received: from netrider.rowland.org ([192.131.102.5]:35257 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S229634AbhCRO7Q (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 18 Mar 2021 10:59:16 -0400
Received: (qmail 528681 invoked by uid 1000); 18 Mar 2021 10:59:15 -0400
Date:   Thu, 18 Mar 2021 10:59:15 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Ulrich Windl <Ulrich.Windl@rz.uni-regensburg.de>
Cc:     Lennart Poettering <lennart@poettering.net>, zzam@gentoo.org,
        "systemd-devel@lists.freedesktop.org" 
        <systemd-devel@lists.freedesktop.org>,
        usb-storage@lists.one-eyed-alien.net, hirofumi@mail.parknet.co.jp,
        linux-usb@vger.kernel.org
Subject: Re: Antw: [EXT] Re: [systemd-devel] [usb-storage] Re: Amazon Kindle
 disconnect after Synchronize Cache
Message-ID: <20210318145915.GA527768@rowland.harvard.edu>
References: <20210317151746.GB488655@rowland.harvard.edu>
 <YFIyidaZZmDoTevB@gardel-login>
 <F279F9BC020000F5AE14D9EC@gwsmtp.uni-regensburg.de>
 <C63C44570200006665972EEF@gwsmtp.uni-regensburg.de>
 <B960C12A020000A667ECE9F9@gwsmtp.uni-regensburg.de>
 <B72C58530200001565972EEF@gwsmtp.uni-regensburg.de>
 <0F2319EB020000F567ECE9F9@gwsmtp.uni-regensburg.de>
 <DE3F57520200009E65972EEF@gwsmtp.uni-regensburg.de>
 <52CC0074020000A3D68BC3D5@gwsmtp.uni-regensburg.de>
 <6052FB2B020000A10003FE1E@gwsmtp.uni-regensburg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6052FB2B020000A10003FE1E@gwsmtp.uni-regensburg.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Mar 18, 2021 at 08:03:07AM +0100, Ulrich Windl wrote:
> >>> Lennart Poettering <lennart@poettering.net> schrieb am 17.03.2021 um 17:47
> in
> Nachricht <YFIyidaZZmDoTevB@gardel-login>:
> > I'd say quirks that are necessary to avoid data corruption should
> > better be done in the kernel and udev's hwdb stuff is only for stuff
> > that "fills in gaps", i.e. adds additional tweaks that make things
> > prettier, cleaner, nicer, more efficient but not things that make the
> > basic things work, and data integrity sounds pretty basic to me.
> 
> But seeing the list of bad, broken or ill-designed hardware grow year by year,
> I wonder whether we really want all that bloat in the kernel.
> 
> > 
> > Or to give a counter example: the device advertises it can do media
> > change, but actually cannot, right, it's not a floppy drive or cdrom
> > driver after all? maybe hwdb would thus actually be the place for the
> > opposite of the suggested fix: turn off the media change polling to
> > reduce needless wakeups.
> 
> I actually think it would be best if those work-arounds could be loadable as
> module, and the vendors of broken hardware can provide the modules that
> document their broken design as well.

If you can come up with a way to do this (preferably in the form of a 
patch), that would be great.  I can't think of any way to remove this 
information from the kernel.

Alan Stern

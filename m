Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC96B33F61D
	for <lists+linux-usb@lfdr.de>; Wed, 17 Mar 2021 17:56:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232158AbhCQQ4W (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 Mar 2021 12:56:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232476AbhCQQ4S (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 Mar 2021 12:56:18 -0400
X-Greylist: delayed 545 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 17 Mar 2021 09:56:18 PDT
Received: from gardel.0pointer.net (gardel.0pointer.net [IPv6:2a01:238:43ed:c300:10c3:bcf3:3266:da74])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56B71C06174A
        for <linux-usb@vger.kernel.org>; Wed, 17 Mar 2021 09:56:17 -0700 (PDT)
Received: from gardel-login.0pointer.net (gardel-mail [85.214.157.71])
        by gardel.0pointer.net (Postfix) with ESMTP id 5093DE806B8;
        Wed, 17 Mar 2021 17:47:06 +0100 (CET)
Received: by gardel-login.0pointer.net (Postfix, from userid 1000)
        id C4A61160DCA; Wed, 17 Mar 2021 17:47:05 +0100 (CET)
Date:   Wed, 17 Mar 2021 17:47:05 +0100
From:   Lennart Poettering <lennart@poettering.net>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        usb-storage@lists.one-eyed-alien.net,
        Matthias Schwarzott <zzam@gentoo.org>,
        linux-usb@vger.kernel.org, systemd-devel@lists.freedesktop.org,
        hirofumi@mail.parknet.co.jp
Subject: Re: [systemd-devel] [usb-storage] Re: Amazon Kindle disconnect after
 Synchronize Cache
Message-ID: <YFIyidaZZmDoTevB@gardel-login>
References: <dfd2b281-3beb-9869-37b6-8bd48a6cf40f@gentoo.org>
 <20210310214648.GA236329@rowland.harvard.edu>
 <841a9a54-78ee-ffaa-fc3c-12defcf43b36@gentoo.org>
 <20210311143912.GA257360@rowland.harvard.edu>
 <f2acfeef-a81a-d7c0-90a8-b290a18cb742@gentoo.org>
 <20210316162650.GB448722@rowland.harvard.edu>
 <031a20c5-27c3-cc13-6e0b-a308644abce4@redhat.com>
 <20210316170433.GD448722@rowland.harvard.edu>
 <1d9f059e-8b21-0895-9a50-39b6b1a5cc5c@redhat.com>
 <20210317151746.GB488655@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210317151746.GB488655@rowland.harvard.edu>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mi, 17.03.21 11:17, Alan Stern (stern@rowland.harvard.edu) wrote:

> On Wed, Mar 17, 2021 at 01:21:50PM +0100, Hans de Goede wrote:
> > Hi,
> >
> > On 3/16/21 6:04 PM, Alan Stern wrote:
> > > I think it would be mildly better, but not a whole lot.  Since the
> > > Kindle describes itself as having removable media, the kernel normally
> > > probes it periodically to make sure the media remains present.  The
> > > default probing interval is 2 seconds.  Reducing it to 0.9 seconds
> > > doesn't represent an exorbitant additional load IMO -- especially since
> > > Kindles don't tend to spend huge amounts of time connected to computers.
> >
> > Ah, I did not know that the default polling interval was that low(ish),
> > given that the default indeed is already that low, then changing it to
> > 0.8 seconds would not be a big change.  And we probably have a lot of
> > lower hanging fruit for unnecessary wakeups then that.
>
> So we need to make a decision: Should the patch be merged, or should we
> punt the issue to userspace tools?
>
> On the plus side, the patch is rather small and non-invasive (although
> it does allocate the last remaining bit in the 32-bit fflags field).
> There's also the advantage of sending the extra command only when it is
> needed, as opposed to increasing the overall frequency of TUR polling.
>
> Any opinions?

I'd argue that this should be done in the kernel.

IIUC the issue can actually lead to data corruption, no? i.e. some
program writes 25 different files to different places on such an fs,
then calls fsync() on one of them but not the others. Then quite
possibly the fsync() will trigger a device disconnect sooner or later
at which point the one file surely hit the disk, but there's no
guarantee for the other 24, they might remain cached in memory and are
never written out.

I'd say quirks that are necessary to avoid data corruption should
better be done in the kernel and udev's hwdb stuff is only for stuff
that "fills in gaps", i.e. adds additional tweaks that make things
prettier, cleaner, nicer, more efficient but not things that make the
basic things work, and data integrity sounds pretty basic to me.

Or to give a counter example: the device advertises it can do media
change, but actually cannot, right, it's not a floppy drive or cdrom
driver after all? maybe hwdb would thus actually be the place for the
opposite of the suggested fix: turn off the media change polling to
reduce needless wakeups.

I mean, I'd be more open to this if this was a frequent thing and the
database for devices like this was just tooo large for the kernel to
carry, but that's not the case here either: it's two devices afaik,
and such an issue wasn't seen elswhere.

Lennart

--
Lennart Poettering, Berlin
